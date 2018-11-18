<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/8/25
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\RoleModel;
use app\admin\model\MenuModel;

class Role extends Base{

	public function lst(){
		$model = new RoleModel();
		$data = $model->getList();
		if($data){
			return success(200,'获取数据成功',$data);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function add(){
		$role_name = input('post.role_name');
		$model = new RoleModel();
		$where['role_name']  = $role_name;
		$info = $model->getInfo($where);
		if($info){
			return error(400,'角色已存在！');
		}else{
			$data['role_name'] = $role_name;
			$data['create_time'] = time();
			$data['update_time'] = time();
			
			$ret = $model->insertRole($data);
			if($ret){
				return success(201,'添加成功');
			}else{
				return error(400,'添加失败');
			}
		}
	}

	public function info(){
		$where['id'] = input('get.id');
		$model = new RoleModel();
		$info = $model->getInfo($where);
		if($info){
			return success(200,'获取数据成功',$info);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function edit(){
		$where['id'] = input('post.id');
		$data['role_name'] = input('post.role_name');
		$data['update_time'] = time();
		$model = new RoleModel();
		$ret = $model->refreshData($where,$data);
		if($ret){
			success(201,'修改成功');
		}else{
			error(400,'密码修改错误');
		}
	}

	public  function del(){
		$id = input('post.id');
		$where['id'] = $id;
		$model = new RoleModel();
		$ret = $model->deleteRole($where);
		if($ret){
			return success(204,'删除成功');
		}else{
			return error(400,'删除失败');
		}
	}

	public function rbacLst(){
		$id = input('get.id');
		$model = new MenuModel();
		$lst = $model->getList();

		$role = new RoleModel();
		$where['roleid'] = $id;
		$slst = $role->getInfoRole($where);

		$ids = $role->getIds();

		$list = $this->_tree($lst);
		$info_where['id'] = $id;
		$info = $role->getInfo($info_where);

		if($slst){
			$result['ids'] = array_values(array_diff($slst,$ids));
		}else{
			$result['ids'] = array();
		}
		

		$result['name']= $info['role_name'];
		$result['list'] = $list;
		if($list){
			return success(200,'获取成功',$result);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function  rbacEdit(){
		$param = input('post.');
		$where['roleid'] = $param['id'];
		$ids = implode(',',$param['ids']);
		$role = new RoleModel();
		$info = $role->getInfoRole($where);
		$data['update_time'] = time();
		$data['ruleid'] = $ids;
		if(!empty($info)){
			$ret = $role->refreshRoleRule($where,$data);
		}else{
			$data['roleid'] = $param['id'];
			$data['create_time'] = time();
			$ret = $role->insertRoleRule($data);
		}
		if($ret){
			return success(201,'修改成功');
		}else{
			return error(400,'密码修改错误');
		}
	}

	public function _tree($data,$pid=0){
		$tree = array();
		$ikey = 0;
		foreach($data as $pkey=>$pval){
			if($pval['pid']==0){
				$tree[$ikey] = array('id'=>$pval['id'],'label'=>$pval['name']);
				$tree[$ikey]['children'] = $this->_child($data,$pval['id']);
				$ikey +=1;
			}
		}
		return $tree;
	}

	public function _child($data,$id){
		$tree = array();
		$increase = 0;
		foreach($data as $ckey=>$cval){
			if($id==$cval['pid']){
				$tree[$increase] = array('id'=>$cval['id'],'label'=>$cval['name']);
				$child = $this->_child($data,$cval['id']);
				if(count($child)!=0){
					$tree[$increase]['children'] = $child;
				}
				$increase +=1;
			}
		}
		return $tree;
	}
}
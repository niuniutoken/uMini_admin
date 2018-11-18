<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/8/21
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\MenuModel;
use think\Db;

class Menu extends Controller{
	
	public function lst(){
		$model = new MenuModel;
		$lst = $model->getList();
		$list = $this->_tree($lst);
		if($list){
			return success(200,'获取成功',$list);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function _tree($data,$pid=0){
		$tree = array();
		foreach($data as $pkey=>$pval){
			if($pval['pid']==0){
				$tree[$pkey] = array('id'=>$pval['id'],'name'=>$pval['name'],'spread'=>true);
				$tree[$pkey]['children'] = $this->_child($data,$pval['id']);
			}
		}
		return $tree;
	}

	public function _child($data,$id){
		$tree = array();
		$increase = 0;
		foreach($data as $ckey=>$cval){
			
			if($id==$cval['pid']){
				$tree[$increase] = array('id'=>$cval['id'],'name'=>$cval['name']);
				$child = $this->_child($data,$cval['id']);
				if(count($child)!=0){
					$tree[$increase]['children'] = $child;
				}
				$increase +=1;
			}
		}
		return $tree;
	}

	public function add(){
		$param = input('post.');
		if(empty($param['id'])){
			$data['pid'] =  0;
			if(!empty($param['icon'])){
				$data['icon'] = $param['icon'];
			}
		}else{
			$data['pid'] =  $param['id'];
			$data['controller'] = $param['controller'];
			$data['action'] = $param['action'];
		}
		$data['name'] = $param['name'];
		$data['show'] = $param['show'];
		$data['create_time'] = time();
		$data['update_time'] = time();

		$model = new MenuModel;
		$ret = $model->insertData($data);
		if($ret){
			return success(201,'添加成功');
		}else{
			return error(400,'添加失败');
		}
	}

	public function info(){
		$where['id'] = input('get.id');
		$model = new MenuModel;
		$info = $model->infotData($where);
		if($info){
			return success(200,'获取数据成功',$info);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function edit(){
		$data = input('post.');
		$data['update_time'] = time();
		$where['id'] = input('get.id');
		$model = new MenuModel;
		$ret = $model->updateMenu($where,$data);
		if($ret){
			return success(201,'修改成功');
		}else{
			return error(400,'修改失败');
		}
	}

	public function del(){
		$info_where['pid'] = input('post.id');
		$model = new MenuModel;
		$info = $model->infotData($info_where);
		if(!empty($info)){
			return error(404,'存在子节点，请先删除子节点');
		}else{
			$where['id'] = $info_where['pid'];
			$ret = $model->delMenu($where);
			if($ret){
				return success(204,'删除成功');
			}else{
				return error(400,'删除失败');
			}
		}
	}
}


?>
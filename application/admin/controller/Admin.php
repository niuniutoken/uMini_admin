<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/7/5
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\AdminModel;

class Admin extends Base{

	public function lst(){
		$page = input('post.page')?input('post.page'):1;
		$rows = input('post.rows')?input('post.rows'):10;
		$search = input('post.seacchText');
		if(!empty($search)){
			$where['u.username'] = ['like','%'.$search.'%'];
		}else{
			$where = '';
		}
		$model = new AdminModel();    
		$result['info'] = $model->getList($page,$rows,$where);
		$result['count'] = $model->getCountPage($where);
		if($result){
			return success(200,'获取成功',$result);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function add(){
		$param = input('post.');
		$where['username'] = $param['username'];
		$model = new AdminModel();
		$info = $model->getInfo($where);
		if(empty($info)){
			$data['username'] = $param['username'];
			$salt = salt();
			$data['salt'] = $salt;
			$data['password'] = md5(md5($param['password']).$salt);
			$data['avatar'] =  $param['avatar'];
			$data['create_time'] = time();
			$data['update_time'] = time();
			$getId = $model->insertUser($data);
			if($getId){
				$role['userid'] = $getId;
				$role['roleid'] = $param['role_id'];
				$role['create_time'] = time();
				$role['update_time'] = time();
				$ret = $model->insertRoleUser($role);
				if($ret){
					return success(201,'添加成功');
				}else{
					return error(400,'添加失败');
				}               
			}else{
				return error(400,'添加失败');
			}
		}else{
			return error(400,'此用户已存在');
		}
	}

	public function del(){
		$id = input('post.id');
		$where['id'] = $id;
		$model = new AdminModel();
		$ret = $model->deleteUser($where);
		if($ret){
			return success(204,'删除成功');
		}else{
			return error(400,'删除失败');
		}
	}

	public function info(){
		$where['id'] = input('get.id');
		$model = new AdminModel();
		$info = $model->getInfo($where);
		$result['id'] = $info['id'];
		$result['username'] = $info['username'];
		$result['avatar'] = $info['avatar'];
		if($info){
			return success(200,'获取数据成功',$result);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function editpwd(){
		$param = input('post.');
		$where['id'] = $param['id'];
		$salt = salt();
		$data['salt'] = $salt;
		$data['password'] = md5(md5($param['password']).$salt);
		$data['username'] = $param['username'];
		$data['avatar'] = $param['avatar'];

		$model = new AdminModel();
		$ret = $model->refreshData($where,$data);
		if($ret){
			return success(201,'修改成功');
		}else{
			return error(400,'密码修改失败');
		}
	}

	public function editStatus(){
		$param = input('post.');
		$where['id'] = $param['id'];
		$data['status'] = $param['status'];
		$model = new AdminModel();
		$ret = $model->refreshData($where,$data);
		if($ret){
			return success(201,'修改成功');
		}else{
			return error(400,'密码修改失败');
		}
	}
}

?>
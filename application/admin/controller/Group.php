<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/7/5
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\GroupModel;

class Group extends Base{

	public function lst(){
		$model = new GroupModel();    
		$result['info'] = $model->getList();
		if($result){
			$result['count'] = $model->getCountPage();
			return success(200,'获取成功',$result);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function add(){
		$param = input('post.');
		$data['name'] = $param['name'];
		$data['create_time'] = time();
		$data['update_time'] = time();
		$model = new GroupModel();
		$ret = $model->insertUser($data);
		if($ret){
			return success(201,'添加成功');
		}else{
			return error(400,'添加失败');
		}
	}

	public function del(){
		$id = input('post.id');
		$where['id'] = $id;
		$model = new GroupModel();
		$ret = $model->deleteUser($where);
		if($ret){
			return success(204,'删除成功');
		}else{
			return error(400,'删除失败');
		}
	}

	public function info(){
		$where['id'] = input('get.id');
		$model = new GroupModel();
		$info = $model->getInfo($where);
		$result['id'] = $info['id'];
		$result['name'] = $info['name'];
		if($info){
			return success(200,'获取数据成功',$result);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function edit(){
		$param = input('post.');
		$update_data['name'] = $param['name'];
		$update_data['update_time'] = time();
		$where['id'] = $param['id'];
		$model = new GroupModel();
		$ret = $model->refreshData($where,$update_data);
		if($ret){
			return success(201,'修改成功');
		}else{
			return error(400,'修改失败');
		}
	}
}
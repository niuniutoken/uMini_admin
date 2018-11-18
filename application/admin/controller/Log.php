<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/30
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use think\Db;
use app\admin\model\LogModel;

class Log extends Base{

	public function lst(){
		$page = input('post.page')?input('post.page'):1;
		$rows = input('post.rows')?input('post.rows'):10;
		$searchText = input('post.searchText');
		$where = '';
		if(!empty($searchText)){
			$where['admin_name'] = ['like','%'.$searchText.'%'];
		}
	 	$model = new LogModel();
	 	$result['info'] = $model->getList($page,$rows,$where);
	 	if($result){
	 		$result['count'] = $model->getCountPage($where);
	 		return success(200,'获取成功',$result);
	 	}else{
	 		return error(404,'获取数据失败');
	 	}
	}

	public function del(){
		$id = input('post.ids/a');

		if(is_array($id)){
			$where['id'] = implode(',',$id);
		}else{
			$where['id'] = $id;
		}
		$model = new LogModel();
		$ret = $model->deleteLog($where);
		if($ret){
			return success(204,'删除成功');
		}else{
			return error(400,'删除失败');
		}
	}


}
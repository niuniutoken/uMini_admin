<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/17
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\ArticleModel;
use think\Db;

class Article extends Base{

	public function lst(){
		$page = input('post.page')?input('post.page'):1;
		$rows = input('post.rows')?input('post.rows'):10;

		$searchDate = input('post.searchDate/a');
		$searchText = input('post.searchText');

		$where = '';
		if(!empty($searchText)){
			$where['title'] = ['like','%'.$searchText.'%'];
		}

		if(!empty($searchDate[0])){
			$where['create_time'] = [['egt',strtotime($searchDate[0])],['elt',strtotime($searchDate[1])]];
		}
	 	$model = new ArticleModel();
	 	$result['info'] = $model->getList($page,$rows,$where);
	 	if($result){
	 		$result['count'] = $model->getCountPage($where);
	 		return success(200,'获取成功',$result);
	 	}else{
	 		return error(404,'获取数据失败');
	 	}
	}

	public function add(){
		$param = input('post.');
		$data['title'] = $param['title'];
		$data['cover'] = $param['cover'];
		$data['keyword'] = $param['keyword'];
		$data['desc'] = $param['desc'];
		$data['status'] = $param['status'];
		$data['from'] = $param['from'];
		$data['author'] = $param['author'];
		$data['content'] = $param['content'];
		$data['create_time'] = time();
        $data['update_time'] = time();

		$ret = Db::name('article')->insert($data);
		if($ret){
	 		return success(201,'添加成功');
	 	}else{
	 		return error(400,'添加失败');
	 	}
	}

	public function info(){
		$where['id'] = input('get.id');
		$model = new ArticleModel();
		$info = $model->getInfo($where);
		$result['id'] = $info['id'];
		$result['title'] = $info['title'];
		$result['cover'] = $info['cover'];
		$result['desc'] = $info['desc'];
        $result['keyword'] = $info['keyword'];
        $result['content'] = $info['content'];
        $result['status'] = $info['status'];
        $result['from'] = $info['from'];
        $result['author'] = $info['author'];
		if($info){
			return success(200,'获取数据成功',$result);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function edit(){
		$param = input('post.');
		$where['id'] = $param['id'];
		$data['title'] = $param['title'];
		$data['cover'] = $param['cover'];
		$data['keyword'] = $param['keyword'];
		$data['desc'] = $param['desc'];
		$data['status'] = $param['status'];
		$data['from'] = $param['from'];
		$data['author'] = $param['author'];
		$data['content'] = $param['content'];
		$data['update_time'] = time();

		$ret = Db::name('article')->where($where)->update($data);
		if($ret){
	 		return success(201,'修改成功');
	 	}else{
	 		return error(400,'修改失败');
	 	}
	}

	public function del(){
		$id = input('post.ids/a');

		if(is_array($id)){
			$where['id'] = implode(',',$id);
		}else{
			$where['id'] = $id;
		}
		$ret = Db::name('article')->where($where)->delete();
		if($ret){
			return success(204,'删除成功');
		}else{
			return error(400,'删除失败');
		}
	}
}
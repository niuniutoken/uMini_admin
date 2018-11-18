<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/9/16
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\ApiRouteModel;
use app\admin\model\GroupModel;

class ApiRoute extends Base{

	public function lst(){
		$model = new ApiRouteModel();
		$group_id = $model->getRoupList();
		$arr_id =array();
		foreach($group_id as $gkey=>$gval){
			$arr_id[] = $gval['group_id'];
		}
		$ids = implode(',',$arr_id);

		$group = new GroupModel();
		$group_where['id'] = ['in',$ids];
		$group_name = $group->getList($group_where);
		
		$route_name = $model->getList();
		$data = array();
		foreach($group_name as $gkey=>$gval){
			$data[$gkey] = array('id'=>$gval['id'],'group_name'=>$gval['name']);
			foreach($route_name as $rkey=>$rval){
				if($gval['id']==$rval['group_id']){
					$data[$gkey]['group_child'][] = $rval;
				}
			}
		}
		$result['list'] = $data;
		$result['ids'] =$arr_id; 
		if($data){
			return success(200,'获取成功',$result);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function add(){
		$param = input('post.');
		$data['route_name'] = $param['route_name'];
		$data['route_action'] = $param['route_action'];
		$data['group_id'] = $param['group_id'];
		$data['remark'] = $param['remark'];
		$data['return_param'] = $param['return_param'];
		$data['user_id'] = session('uid');
		$data['create_time'] = time();
		$data['update_time'] = time();
		$model = new ApiRouteModel();
		$ret = $model->insertRoute($data);
		if($ret){
			if(!empty($param["param"])){
				$par = array();
				foreach($param['param'] as $pkey=>$pval){
					$par[$pkey]['route_id'] = $ret;
					$par[$pkey]['param_name'] = $pval['name'];
					$par[$pkey]['param_type'] = $pval['type'];
					$par[$pkey]['is_required'] = $pval['require'];
					$par[$pkey]['param_comment'] = $pval['comment'];
					$par[$pkey]['create_time'] = time();
					$par[$pkey]['update_time'] = time();
				}
				$res = $model->insertRouteParam($par);
				if($res){
					return success(201,'添加成功');
				}else{
					return error(400,'添加参数失败');
				}
			}else{
				return success(201,'添加成功');
			}
		}else{
			return error(400,'添加失败');
		}
	}

	public function del(){
		$id = input('post.id');
		$where['id'] = $id;
		$model = new ApiRouteModel();
		$ret = $model->deleteDataInter($where);
		$param_where['route_id'] = $id;
		$model->deleteDataParam($param_where);
		if($ret){
			return success(204,'删除成功');
		}else{
			return error(400,'删除失败');
		}
	}

	public function info(){
		$id = input('get.id');
		$where['r.id'] = $id;
		$model = new ApiRouteModel();
		$info = $model->getInfo($where);
		$param_where['route_id'] = $id;
		$param = $model->getParam($param_where);
		foreach($param as $pkey=>$pval){
			if($pval['is_required']==1){
				$param[$pkey]['is_required'] ='是';
			}else{
				$param[$pkey]['is_required'] ='否';
			}
		}
		$info['params'] = $param;
		if($info){
			return success(200,'获取数据成功',$info);
		}else{
			return error(404,'获取数据失败');
		}
	}

	public function edit(){
		$param = input('post.');
		$data['route_name'] = $param['route_name'];
		$data['route_action'] = $param['route_action'];
		$data['group_id'] = $param['group_id'];
		$data['remark'] = $param['remark'];
		$data['return_param'] = $param['return_param'];
		$data['update_time'] = time();
		$id = $param['id'];
		$where['id'] = $id;
		$model = new ApiRouteModel();
		$model->refreshData($where,$data);
		
		if(!empty($param["param"])){
			$param_where['route_id'] = $id;
			$model->deleteDataParam($param_where);
			$par = array();
			foreach($param['param'] as $pkey=>$pval){
				$par[$pkey]['route_id'] = $id;
				$par[$pkey]['param_name'] = $pval['param_name'];
				$par[$pkey]['param_type'] = $pval['param_type'];
				if($pval['is_required']='是'){
					$par[$pkey]['is_required'] = 1;
				}elseif($pval['is_required']='否'){
					$par[$pkey]['is_required'] = 0;
				}else{
					$par[$pkey]['is_required'] = $pval['is_required'];
				}
				
				$par[$pkey]['param_comment'] = $pval['param_comment'];
				$par[$pkey]['create_time'] = time();
				$par[$pkey]['update_time'] = time();
			}
			$res = $model->insertRouteParam($par);
			if($res){
				return success(201,'修改成功');
			}else{
				return error(400,'修改失败');
			}
		}else{
			return success(201,'修改成功');
		}
	}
}

?>
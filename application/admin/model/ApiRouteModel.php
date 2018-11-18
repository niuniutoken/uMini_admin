<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/9/1
* blog    www.wero6.com
*/
namespace app\admin\model;

use app\admin\model\Base;
use think\Db;

class ApiRouteModel extends Base{
	protected $db = 'api_inter_route';
	protected $param = 'api_inter_param';

	/**
	* 获取接口所有组
	*/
	public function getRoupList(){
		$field = "group_id";
		return $this->getSelectCondition($this->db,$field);
	}
	/**
	* 获取接口
	*/
	public function getList($where=''){
		$field = 'id,group_id,route_name,route_action';
		return $this->getSelectCondition($this->db,$field,$where);
	}

	//获取接口参数
	public function getParam($where){
		$field = "param_name,param_type,is_required,param_comment";
		return $this->getSelectCondition($this->param,$field,$where);
	}

	/**
	* 获取单个用户信息
	* @param $where array 查询条件
	*/
	public function getInfo($where){
		$info = Db::name('api_inter_route')
		        ->alias('r')
		        ->field('r.route_name,r.route_action,r.return_param,r.remark,g.name as group_name,r.group_id,u.username')
		        ->join('t_api_group g','r.group_id=g.id')
		        ->join('t_admin_user u','u.id=r.user_id')
		        ->where($where)
		        ->find();
		return $this->error_reporting($info);
	}

	/**
	* 修改接口路由
	* @param $where array 修改条件
	*/
	public function refreshData($where,$data){
		return $this->updateData($this->db,$where,$data);
	}

	/**
	* 修改接口路由参数
	* @param $where array 修改条件
	*/
	public function refreshDataParam($where,$data){
		return $this->updateData($this->param,$where,$data);
	}

	/**
	*  添加接口
	* @param $data array 添加数据
	*/
	public function insertRoute($data){
		return $this->createData($this->db,$data);
	}

	/**
	*  添加接口参数
	* @param $data array 添加数据
	*/
	public function insertRouteParam($data){
		return $this->createAllData($this->param,$data);
	}

	/**
	* 删除接口路由
	* @param $where array 删除条件
	*/ 
	public function deleteDataInter($where){
		return $this->deleteData($this->db,$where);
	}

	/**
	* 删除接口路由参数
	* @param $where array 删除条件
	*/ 
	public function deleteDataParam($where){
		return $this->deleteData($this->param,$where);
	}

}
?>
<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/8/15
* blog    www.wero6.com
*/
namespace app\admin\model;

use app\admin\model\Base;
use think\Db;

class AdminModel extends Base{
	protected $db = 'admin_user';
	protected $role = 'admin_user_rule';

	/**
	* 获取所有用户信息
	* @param $page int 页码
	* @param $rows int 每页条数
	*  @param $where array   查询的条件
	*/
	public function getList($page,$rows,$where=''){
		$list = Db::name('admin_user')
		        ->alias('u')
		        ->field('u.id,u.username,u.login_number,u.status,u.last_login_ip,u.last_login_time,u.avatar,role.role_name')
		        ->join('admin_user_rule rule','u.id=rule.userid')
		        ->join('admin_role role','rule.roleid=role.id')
		        ->page($page,$rows)
		        ->where($where)
		        ->order('u.create_time asc')
		        ->select();
		return $this->error_reporting($list);
	}

	/**
	* 获取用户总数
	* @param $where array 查询条件
	*/
	public function getCountPage($where=''){
		$count = Db::name('admin_user')
		        ->alias('u')
		        ->field('u.id,u.username,u.create_time,u.avatar,role.role_name')
		        ->join('admin_user_rule rule','u.id=rule.userid')
		        ->join('admin_role role','rule.roleid=role.id')
		        ->where($where)
		        ->count();
		return $this->error_reporting($count);
	}

	/**
	* 获取单个用户信息
	* @param $where array 查询条件
	*/
	public function getInfo($where){
		$field = 'id,username,password,avatar,salt,status,login_number';
		return $this->getRowCondition($this->db,$field,$where);
	}

	/**
	* 修改用户信息
	* @param $where array 修改条件
	*/
	public function refreshData($where,$data){
		return $this->updateData($this->db,$where,$data);
	}

	/**
	*  添加用户
	* @param $data array 添加数据
	*/
	public function insertUser($data){
		return $this->createData($this->db,$data);
	}

	/**
	*  添加用户角色
	* @param $data array 添加数据
	*/
	public function insertRoleUser($data){
		return $this->createData($this->role,$data);
	}


	/**
	* 删除用户
	* @param $where array 删除条件
	*/ 
	public function deleteUser($where){
		return $this->deleteData($this->db,$where);
	}

}
?>
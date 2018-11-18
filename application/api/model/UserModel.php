<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/22
* blog    www.wero6.com
*/
namespace app\api\model;
use think\Model;
use think\Db;


class UserModel extends Base{

	public $db = 'user';

	/**
	*  获取用户信息
	*  @param $where array 查询条件
	*/
	public function getUserInfo($where){
		$field = 'username,password,salt,avatar';
		return $this->getRowCondition($this->db,$field,$where);
	}

	/**
	* 修改用户信息
	* @param $where array 修改条件
	*/
	public function refreshData($where,$data){
		return $this->updateData($this->db,$where,$data);
	}
}
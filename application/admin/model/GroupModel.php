<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/9/14
* blog    www.wero6.com
*/
namespace app\admin\model;
use think\Model;
use think\Db;
use app\admin\model\Base;

class GroupModel extends Base{
	protected $db = 'api_group';

	/**
	* 获取接口分组列表
	* @param $page int 页码
	* @param $rows int 每页条数
	*/
	public function getList($where=''){
		$field = 'id,name,create_time';
		return $this->getSelectCondition($this->db,$field,$where);
	}

	/**
	* 获取分组总数
	* @param $where array 查询条件
	*/
	public function getCountPage($where=''){
		return $this->getCountCondition($this->db,$where);
	}

	/**
	* 获取单个分组
	* @param $where array 查询条件
	*/
	public function getInfo($where){
		$field = 'id,name';
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
	* 删除用户
	* @param $where array 删除条件
	*/ 
	public function deleteUser($where){
		return $this->deleteData($this->db,$where);
	}

}
?>
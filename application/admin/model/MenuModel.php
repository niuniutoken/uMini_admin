<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/8/15
* blog    www.wero6.com
*/
namespace app\admin\Model;

use app\admin\model\Base;

class MenuModel extends Base{
	protected $db = 'admin_menu';

	/**
	*获取数据集
	*/
	public function getList($where=''){
		$field = 'id,pid,name,controller,action,icon';
		return $this->getSelectCondition($this->db,$field,$where);
	}

	/**
	* 添加数据
	* @param  $data array 要添加的数据
	*/
	public function insertData($data){
		return $this->createData($this->db,$data);
	}

	/**
	* 获取单条数据
	* @param  $where array 查询的条件
	*/
	public function infotData($where){
		$field = 'id,pid,name,controller,action,show,icon';
		return $this->getRowCondition($this->db,$field,$where);
	}


	/**
	* 更新单条数据
	* @param  $where array 查询的条件
	* @param  $data array 要添加的数据
	*/
	public function updateMenu($where,$data){
		return $this->updateData($this->db,$where,$data);
	}

	/**
	* 获取单条数据
	* @param  $where array 查询的条件
	* @param  $data array 要添加的数据
	*/
	public function delMenu($where){
		return $this->deleteData($this->db,$where);
	}



}
?>
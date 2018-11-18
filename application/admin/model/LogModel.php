<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/17
* blog    www.wero6.com
*/
namespace app\admin\model;
use think\Model;
use think\Db;
use app\admin\model\Base;

class LogModel extends Base{
	protected $db = 'log';

	/**
	* 获取所有管理员日志信息
	* @param $page int 页码
	* @param $rows int 每页条数
	*/
	public function getList($page,$rows,$where=''){
		$field = 'id,admin_name,description,ip,status,create_time';
		$order = 'create_time desc';
		return $this->getPageSelectCondition($this->db,$field,$page,$rows,$order,$where);
	}

	/**
	* 获取日志总数
	* @param $where array 查询条件
	*/
	public function getCountPage($where=''){
		return $this->getCountCondition($this->db,$where);
	}

	/**
	* 删除日志消息记录
	* @param $where array 删除条件
	*/ 
	public function deleteLog($where){
		return $this->deleteData($this->db,$where);
	}

}
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

class ArticleModel extends Base{
	protected $db = 'article';

	/**
	* 获取所有文章信息
	* @param $page int 页码
	* @param $rows int 每页条数
	*/
	public function getList($page,$rows,$where=''){
		$field = 'id,title,cover,views,status,from,author,create_time';
		$order = 'create_time desc';
		return $this->getPageSelectCondition($this->db,$field,$page,$rows,$order,$where);
	}

	/**
	* 获取文章总数
	* @param $where array 查询条件
	*/
	public function getCountPage($where=''){
		return $this->getCountCondition($this->db,$where);
	}

	/**
	* 获取单个分组信息
	* @param $where array 查询条件
	*/
	public function getInfo($where){
		$field = 'id,title,cover,desc,keyword,content,status,from,author';
		return $this->getRowCondition($this->db,$field,$where);
	}
}
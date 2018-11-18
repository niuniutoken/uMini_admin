<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/8/21
* blog    www.wero6.com
*/
namespace app\api\model;
use think\Model;
use think\Db;

class Base extends Model{

  /**
   * 获取分页数据集
   * @param $db    string  数据库名
   * @param $field string  要获取的字段名
   * @param $page  int     页码
   * @param $rows  int     显示的条数
   * @param $order string  排序
   * @param $where array   查询的条件   
   */
    public function getPageSelectCondition($db,$field,$page,$rows,$order,$where=''){
	   	$ret = Db::name($db)
	   	       ->field($field)
	   	       ->where($where)
	   	       ->page($page,$rows)
	   	       ->order($order)
	   	       ->select();
	   	return $this->error_reporting($ret);
    }

  /**
   * 获取数据集
   * @param $db    string  数据库名
   * @param $field string  要获取的字段名
   * @param $where array   查询的条件   
   */
    public function getSelectCondition($db,$field,$where=''){
	   	$ret = Db::name($db)
	   	       ->field($field)
	   	       ->where($where)
	   	       ->select();
	   	return $this->error_reporting($ret);
    }

  /**
   * 获取数据总数
   * @param $db    string  数据库名
   * @param $where array   查询的条件   
   */
    public function getCountCondition($db,$where=''){
      $ret = Db::name($db)
             ->where($where)
             ->count();
      return $this->error_reporting($ret);
    }

  /**
   * 获取行数据
   * @param $db    string  数据库名
   * @param $field string  要获取的字段名
   * @param $where array   查询的条件   
   */
    public function getRowCondition($db,$field,$where=''){
      $ret = Db::name($db)
             ->field($field)
             ->where($where)
             ->find();
      return $this->error_reporting($ret);
    }

  /**
   * 插入数据
   * @param $db    string  数据库名
   * @param $data  array   要插入的数据
   */
    public function createData($db,$data){
      $ret = Db::name($db)->insertGetId($data);
      return $this->error_reporting($ret);
    }

   /**
   * 更新数据
   * @param $db    string  数据库名
   * @param $where array   更新的条件   
   * @param $data  array   要插入的数据
   */
    public function updateData($db,$where,$data){
      $ret = Db::name($db)->where($where)->update($data);
      return $this->error_reporting($ret);
    }

    /**
     * 删除数据
     * @param $db    string  数据库名
     * @param $where array   更新的条件   
     * @param $data  array   要插入的数据
     */
    public function deleteData($db,$where){
      $ret = Db::name($db)->where($where)->delete();
      return $this->error_reporting($ret);
    }

     //报错机制
    public function error_reporting($sql){
        if($sql===false){
            $e = new \think\Exception();
            Sqlog::sqlLog($e);
            return false;
        }else{
            return $sql;
        }
    }

}
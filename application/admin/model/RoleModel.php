<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/8/28
* blog    www.wero6.com
*/
namespace app\admin\model;

use think\Db;
use app\admin\model\Base;

class RoleModel extends Base{
	protected $db = 'admin_role';
	protected $role = 'admin_role_rule';
	protected $userRule = 'admin_user_rule';

	/**
	*  获取角色管理数据
	*  @param $where array   查询的条件
	*/
	public function getList($where=''){
		$field = 'id,role_name';
		return $this->getSelectCondition($this->db,$field,$where);
	}

	/**
	* 获取角色总数
	* @param $where array 查询条件
	*/
	public function getCountPage($where=''){
		return $this->getCountCondition($this->db,$where);
	}

	/**
	* 获取单个角色信息
	* @param $where array 查询条件
	*/
	public function getInfo($where){
		$field = 'id,role_name';
		return $this->getRowCondition($this->db,$field,$where);
	}

	/**
	* 修改角色信息
	* @param $where array 修改条件
	*/
	public function refreshData($where,$data){
		return $this->updateData($this->db,$where,$data);
	}

	/**
	*  添加角色
	* @param $data array 添加数据
	*/
	public function insertRole($data){
		return $this->createData($this->db,$data);
	}

	/**
	* 删除角色
	* @param $where array 删除条件
	*/ 
	public function deleteRole($where){
		return $this->deleteData($this->db,$where);
	}

    /**
    *  获取角色权限关系
    *  $param $where array 查询条件
    */
    public function getInfoRole($where){
    	$field = 'ruleid';
    	$info = $this->getRowCondition($this->role,$field,$where);
    	if($info){
    		return explode(',',$info['ruleid']);
    	}else{
    		return false;
    	}
    }

    /**
	* 修改角色权限关系表
	* @param $where array 修改条件
	*/
	public function refreshRoleRule($where,$data){
		return $this->updateData($this->role,$where,$data);
	}

	/**
	*  添加角色权限关系表
	* @param $data array 添加数据
	*/
	public function insertRoleRule($data){
		return $this->createData($this->role,$data);
	}

	/**
	* 获取角色id
	* @param $where array 查询条件
	*/
	public function getUserRule($where){
		$field = 'roleid';
		return $this->getRowCondition($this->userRule,$field,$where);
	}

	public function getRuleId($userid){
		$where['u.userid'] = $userid;
		$list = Db::name('admin_user_rule')
		        ->alias('u')
		        ->field('r.ruleid')
		        ->join('admin_role_rule r','u.roleid=r.roleid')
		        ->where($where)
		        ->find();
		$menu_where['id'] = ['in',$list['ruleid']];
		$pids = Db::name('admin_menu')
		        ->field('pid')
		        ->where($menu_where)
		        ->group('pid')
		        ->select();
		$ids = array();
		foreach($pids as $key =>$val){
			// $ids[]= $this->getPid($val['pid']);
			$ids[] = $val['pid'];
		}
		$menu = $this->getPid($ids);
		$menu_id = implode(',',array_unique(explode(',',$menu))).','.$list['ruleid'];
		return $menu_id;
		
	}

	public function getPid($pid,$ids=''){
		$where['id'] = ['in',$pid];
		$list = Db::name('admin_menu')
		        ->field('id,pid')
		        ->where($where)
		        ->select();
		if(!empty($list)){
			$child_id = array();
			$child_pid = array();
			foreach($list as $lkey=>$lval){
				$child_id[] = $lval['id'];
			    $child_pid[] = $lval['pid'];
		    }
		    $child_ids = implode(',',$child_id);
		    if(!empty($ids)){
				$child_ids .= ','.$ids;
		    }else{
		    	$child_ids .= $ids;
		    }
		    $child_pids = implode(',',$child_pid);
		    return $this->getPid($child_pids,$child_ids);
		}
		return $ids;
	}

	public function getIds(){
		$list = Db::name('admin_menu')->group('pid')->column('pid');
		return $this->error_reporting($list);
	}
}



?>
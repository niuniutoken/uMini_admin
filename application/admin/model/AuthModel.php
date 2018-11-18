<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/9/3
* blog    www.wero6.com
*/
namespace app\admin\Model;
use app\admin\model\Base;
use think\Db;

class AuthModel extends Base{

	public function check($controller,$action,$uid){
		$where['userid'] = $uid;
		$rule_id = Db::name('admin_user_rule')
		       ->alias('u')
		       ->field('ruleid')
		       ->where($where)
		       ->join('admin_role_rule r','u.roleid=r.roleid')
		       ->find();
		$menu_where['id'] =['in',$rule_id['ruleid']];
		$menu_where['controller'] = $controller;
		$menu_where['action'] = $action;
		$menu = Db::name('admin_menu')
			   ->field('id')
		       ->where($menu_where)
		       ->find();
		if($menu){ 
			return true;
		}else{
			return false;
		}

	}
}

?>
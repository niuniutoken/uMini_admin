<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/8/10
* blog   www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use think\Db;
use app\admin\model\MenuModel;
use app\admin\model\RoleModel;

class Index extends Base{
	
    public function index(){
        return $this->fetch();
    }

    public function view(){
    	$controller = input('get.c');
    	$action = input('get.a');
    	if(empty($controller)){
    		return false;
    	}
    	if(!empty($action)){
    		$action =strtolower(preg_replace('/((?<=[a-z])(?=[A-Z]))/', '_',$action));
	    	$view = $controller.'/'.$action;
	        return $this->fetch($view);
    	}else{
    		return false;
    	}
    }

    public function config(){
    	$version = Db::query('SELECT VERSION() AS ver');
        $result = [
            'url'             => $_SERVER['HTTP_HOST'],
            'document_root'   => $_SERVER['DOCUMENT_ROOT'],
            'server_os'       => PHP_OS,
            'server_port'     => $_SERVER['SERVER_PORT'],
            'server_ip'       => $_SERVER['SERVER_ADDR'],
            'server_soft'     => $_SERVER['SERVER_SOFTWARE'],
            'php_version'     => PHP_VERSION,
            'mysql_version'   => $version[0]['ver'],
            'max_upload_size' => ini_get('upload_max_filesize'),
            'think_version'   => 'ThinkPHP'.THINK_VERSION,
        ];
        return success(200,'获取成功',$result);
    }

    public function nickname(){
    	$result['id'] = session('uid');
        $result['username'] = session('username');
        $result['avatar'] = session('avatar');
    	
    	return success(200,'获取成功',$result);
    }

    public function showmenu(){
    	$role = new RoleModel;
    	$uid = session('uid');
    	if($uid!=1){
    		$role_id = $role->getRuleId($uid);
    		$where['id'] = ['in',$role_id];
    	}
    	
    	$model = new MenuModel;
    	$where['show'] = 1;
    	$lst = $model->getList($where);
    	if($lst){
    		$list = $this->_tree($lst);
    		if($list){
	    		return success(200,'获取成功',$list);
	    	}else{
	    		return error(404,'获取数据失败');
	    	}
    	}else{
	    		return error(404,'获取数据失败');
	    }
    }

    public function _tree($data,$pid=0){
		$tree = array();
		foreach($data as $pkey=>$pval){
			if($pval['pid']==0){
				$tree[$pkey] = array('id'=>$pval['id'],'name'=>$pval['name'],'icon'=>$pval['icon']);
				$tree[$pkey]['children'] = $this->_child($data,$pval['id']);
			}
		}
		return $tree;
	}

	public function _child($data,$id){
		$tree = array();
		$increase = 0;
		foreach($data as $ckey=>$cval){
			
			if($id==$cval['pid']){
				$tree[$increase] = array('id'=>$cval['id'],'name'=>$cval['name'],'controller'=>$cval['controller'],'action'=>$cval['action']);
				$child = $this->_child($data,$cval['id']);
				if(count($child)!=0){
					$tree[$increase]['children'] = $child;
				}
				$increase +=1;
			}
		}
		return $tree;
	}

}

<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/9/3
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\AuthModel;

class Base extends Controller{

	public function __construct(){
                
        parent::__construct();
        $this->power();
	}


    protected function power(){
        if(empty(session('uid'))){
             $this->redirect('login/index');
        }

        $config = cache('db_config_data');
        if(!$config){
            $config = load_config();
            cache('db_config_data',$config);
        }
        if($config['website_status'] == 0 && session('uid') !=1 ){
            $this->error('站点已经关闭，请稍后访问~','login/index');
        }

        if($config['website_limit_ip'] && session('uid') !=1 ){
            if(in_array(request()->ip(),explode('#',$config['website_limit_ip']))){
                $this->error('403:禁止访问','login/index');
            }
        }
        $module     = strtolower(request()->module());
        $controller = strtolower(request()->controller());
        $action = strtolower(request()->action());
        $url = $module."/".$controller.'/'.$action;
        $auth = new AuthModel();
        if(session('uid')!=1){ 
            if(!in_array($url,['admin/upload/upload','admin/index/index','admin/index/view','admin/index/showmenu','admin/index/nickname','admin/index/config'])){
                if(!$auth->check($controller,$action,session('uid'))){
                  error(404,'您没有操作权限');
                }
            }
        }
    }
}

?>
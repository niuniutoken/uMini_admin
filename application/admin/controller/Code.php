<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/8
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use think\Config;

class Code extends Controller{

	public function lst(){
		Config::load(CONF_PATH.'/api/extra/error.php','error');
		$error = Config::get('error');
		$result = array();
		if(!empty($error)){
			foreach($error as $key=>$val){
			    $result[] = array('error_code'=>$val[1],'desc'=>$val[0],'name'=>$key);
			}
		}
		return success(200,'获取成功',$result);
	}
}
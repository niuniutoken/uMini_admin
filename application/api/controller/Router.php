<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/7/5
* blog    www.wero6.com
*/
namespace app\api\controller;
use think\Controller;
use think\Db;
use think\Config;
use think\File;
use think\Request;
class Router extends Controller{


    //user_token判断 
    public function index(){
        $is_limit = 1; //1为限制，2为不限制

        if($is_limit==1){
            Config::load(CONF_PATH.'iplimit.php','iplimit');
            $ip = Config::get('iplimit');
            $clientIp = $this->request->ip();

            if(!in_array($clientIp,$ip)){
                return msg('ip_limit');
            }
        }
    
        // $param = array(               
        //     'router'=>'user.test',
        //     'param'=>array('name'=>'useradmin','password'=>'123456'),
        //     'file'=>'@/home/vagrant/test.png'
        // );

        $param = input('post.');
        if(!empty($param['user_token'])){
            $user_token = $param['param']['user_token'];

            $uid = Db::name('user')->field('id')->where('user_token',$user_token)->find();
            if(!empty($uid)){
                session('uid',$uid['id']);
                $check = $this->request($param);
                if($check){
                    $domain = $_SERVER['HTTP_HOST'];
                    $url_arr = explode('.',$param['router']);
                    
                    $url = $domain.'/'.$url_arr[0].'/'.$url_arr[1];
                    return http_curl($url,$param['param']);
                }
            }else{
                return msg('token_error');
            }
        }else{
            if(!empty($param)){
                $check = $this->request($param);
                if($check){
                    $domain = $_SERVER['HTTP_HOST'];
                    $url_arr = explode('.',$param['router']);
                    $url = $domain.'/api/'.$url_arr[0].'/'.$url_arr[1];
                    return http_curl($url,$param['param']);
                }else{
                    return msg('miss_param');
                }
            }else{
                return msg('miss_param');
            }
            
        }
    }

    //统一入口
    public function request($param){
        Config::load(CONF_PATH.'protocol.php','protocol');
        $apicheck = Config::get('protocol');

        if(!empty($apicheck[$param['router']])){
            $check_param = $apicheck[$param['router']];

            foreach($check_param as $pkey=>$pval){
                if($pval['require']==1){
                    $result = array_key_exists($pkey,$param['param']);
                    if($result){
                    // if(array_key_exists('username',$param['param'])){
                        if($pval['check']==1){
                            $mate = $apicheck['regular'][$pval['check_name']];
                            if(!preg_match($mate,$par[$pkey])){
                                return false;
                            }
                        }
                    }else{
                        return false;
                    }
                }
            } 
        }
        return true;
    }

    //上传图片
    public function fileupload(){
        $file = request()->file('media');
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if($info){
                $file = $info->getSaveName();
                $filename = '/public/upload/'.str_replace("\\","/",$file);
                return JsonReturn('图片上传成功',['filename'=>$filename ]);
            }else{
               return msg('error_file');
            }
        }
    }

    //获取错误格式
    public function respond(){
    	if(empty($this->returnData)){
    		$errorMsg = $this->request->param();
    		if(!empty($errorMsg['errcode'])){
    			$errcode = $errorMsg['errcode'];
    			Config::load(CONF_PATH.'error.php','error');
    			$error = Config::get('error');
    			if(!empty($error[$errcode])){
    				$errmsg = $error[$errcode];
                    $errs['status'] = false;
                    $errs['error_code'] = $errmsg[1];
                    $errs['msg'] = $errmsg[0];
    				$err_msg = json_encode($errs);
    		        return $err_msg;
    			}
    		}
    	}else{
    		return $this->returnData;
    	}
    }

}

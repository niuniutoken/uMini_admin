<?php
/**
* author meizi <1328043241@qq.com>
* time 2018/7/20
* blog www.wero6.com
*/
namespace app\api\Controller;
use think\Controller;
use think\Db;
use app\api\model\UserModel;

class Login extends Controller{

	public function login(){
		$param = input('post.');
		$username = $param['username'];
		$model = new UserModel();
		$where['username'] = $username;
		$info = $model->getUserInfo($where);
		if(!empty($info)){
			$password = md5(md5($param['password']).$info['salt']);
			if($password== $info['password']){
				$user_token = Login::setToken();
				$data['user_token'] = $user_token;
				$data['salt'] = salt();
				$data['password'] = md5(md5($param['password']).$data['salt']);
				$ret = $model->refreshData($where,$data);
				if($ret){
					return JsonReturn('登录成功',['user_token'=>$user_token]);
				}else{
					return msg('user_non-exist');
				}
			}else{
				return msg('error_password');
			}
		}else{
			return msg('error_login');
		}
	}

	private static function setToken()
    {
        $str = md5(uniqid(md5(microtime(true)), true)); //生成一个不会重复的字符串
        $str = sha1($str);  //加密
        return $str;
    }


}
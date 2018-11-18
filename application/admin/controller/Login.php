<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/1
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use think\Db;
use think\Request;
use jiyan\GeetestLib;
use app\admin\model\AdminModel;

class Login extends Controller{

	public function index(){
		return $this->fetch('login');
	}

	public function login(){
		$param = input('post.');
		import('jiyan.lib.geetestlib', EXTEND_PATH,'.class.php');

		$GtSdk = new \jiyan\GeetestLib\GeetestLib(config('xcx.JIYANID'), config('xcx.JIYANKEY'));

		$data[] = session('user_id'); # 网站用户id
		if (session('gtserver') == 1) {   //服务器正常
		    $result = $GtSdk->success_validate($param['geetest_challenge'], $param['geetest_validate'], $param['geetest_seccode'], $data);
		    if ($result) {
		        $code_flag = true;
		    } else {
		        $code_flag = false;
		    }
		} else {  //服务器宕机,走failback模式
		    if ($GtSdk->fail_validate($param['geetest_challenge'],$param['geetest_validate'],$param['geetest_seccode'])) {
		        $code_flag = true;
		    } else {
		        $code_flag = false;
		    }
		}

		if($code_flag){
			$username = $param['username'];
			$password = $param['password'];

			if(empty($username)){
				return error(404,'账号不能为空');
			}

			if(empty($password)){
				return error(404,'请输入密码');
			}

			$where['username'] = $username;
			$model = new AdminModel();
			$info = $model->getInfo($where);
			if(!empty($info)){
				$check_pwd = md5(md5($password).$info['salt']);
				// if(true){
				if($check_pwd==$info['password']){
					if($info['status']!=1){
						writelog($info['id'],$username,'用户【'.$username.'】登录失败：该账号被禁用',2);
						return error('404','该账号被禁用');
					}
					session('uid',$info['id']);
					session('username',$info['username']);
					session('avatar',$info['avatar']);

					//更新管理员状态
					$salt = salt();
			        $param = [
			            'login_number' => $info['login_number'] + 1,
			            'last_login_ip' => request()->ip(),
			            'last_login_time' => time(),
			            'update_time' => time(),
			            'salt' => $salt,
			            'password'=>md5(md5($password).$salt)
			        ];
			        $model->refreshData(['id'=>$info['id']],$param);
					writelog($info['id'],session('username'),'用户【'.session('username').'】登录成功',1);
					return success(200,'登录成功');
				}else{
					writelog($info['id'],$username,'用户【'.$username.'】登录失败：密码错误',2);
					return error(404,'密码不正确');
				}
			}else{
				return error(404,'用户不存在');
			}
		}else{
			return error(404,'验证码验证失败');
		}
		
	}

	public function getData(){
		$request = Request::instance();
		$ip = $request->ip();
		$ret = import('jiyan.lib.geetestlib', EXTEND_PATH,'.class.php');

		$GtSdk = new \jiyan\GeetestLib\GeetestLib(config('xcx.JIYANID'), config('xcx.JIYANKEY'));
		if(!empty(session('user_id'))){
		    session('user_id',uniqid());// 生成一个唯一ID
		}
		$user_id = session('user_id');
		$data = array(
				"user_id" => $user_id, # 网站用户id
				"client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
				"ip_address" => $ip # 请在此处传输用户请求验证时所携带的IP
			);
		$status = $GtSdk->pre_process($data, 1);
		// $_SESSION['gtserver'] = $status;
		// $_SESSION['user_id'] = $data['user_id'];

		session('gtserver',$status);
		session('user_id',$data['user_id']);
		return $GtSdk->get_response_str();
    }

    //退出登录
    public function login_out(){
    	 session(null);
    	 return success(200,'退出登录');
    }

}
?>
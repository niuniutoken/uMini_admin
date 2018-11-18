<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/7/5
* blog    www.wero6.com
*/
return [
	//正则校验
	'regular'=>[
		//手机
		'mobile'=>'/^1[3-8]{1}[0-9]{9}$/',
		//电话
		'phone'=>'/^([0-9]{3,4}-)?[0-9]{7,8}$/',
		//邮箱
		'email'=>"/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/",
		//手机和邮箱
		'string_sign'=>'/^[A-Za-z0-9]+$/',
	],

	/**
	*  接口
	*  'router.test'=>[
*	  	    'name'=>['required'=>1,'check'=>1,'check_name'=>'string_sign'],
*	  	    'password'=>['required'=>1,'check'=>0,'check_name'=>''],
	*	],
	*  router.test    接口路由
	*  request       请求方法
	*  required      是否必须（1为必须，0为不必须）
	*  method        方法(post、get)
	*  param         参数
	*  name          参数字段
	*  required      是否必须(1为必须,0为不必须)
	*  check         是否校验(1为必须，2为不必须)
	*  check_name    校验方法
	*  
	*/

	//api接口测试
	'test.index'=>[
		'param'=>''
	],

	//测试
	'router.test'=>[
    	'user_token'=>['required'=>1,'check'=>1,'check_name'=>''],
  	    'name'=>['required'=>1,'check'=>1,'check_name'=>'string_sign'],
  	    'password'=>['required'=>1,'check'=>0,'check_name'=>''],
	],

	//用户登录
	'login.login'=>[
		'username'=>['require'=>1,'check'=>0],
		'password'=>['require'=>1,'check'=>0],
	],
	


 ];
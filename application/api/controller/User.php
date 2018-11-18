<?php
/**
* author meizi <1328043241@qq.com>
* time 2018/7/20
* blog www.wero6.com
*/
namespace app\api\Controller;
use think\Controller;
use think\Db;

class User extends Controller{

	public function test(){
		// dump($_FILE['file']);
		dump(input('post.'));
	}
}

?>
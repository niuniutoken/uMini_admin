<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/29
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use app\admin\model\ArticleModel;
use think\Db;

class Config extends Base{
	public function lst(){
	 	$list = Db::name('config')->field('key,value')->select();
	 	$result = array();
	 	foreach($list as $lkey=>$lval){
	 		$result[trim($lval['key'])] = $lval['value'];
	 	}
	 	return success(200,'获取成功',$result);
	}

	public function edit(){
		$param = input('post.');
		$where = array();
		$data = array();
		$result = '0';
		foreach($param as $pkey=>$pval){
			$where['key'] = $pkey;
			$data['value'] = $pval;
			$ret = Db::name('config')->where($where)->update($data);
			if($ret == 1){
                $result = 1;
            }
		}
		if($result==1){
			cache('db_config_data',null);
			return success(201,'修改成功');
		}else{
			return error(400,'无修改');
		}

	}
}
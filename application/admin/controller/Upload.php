<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/10/17
* blog    www.wero6.com
*/
namespace app\admin\controller;
use think\Controller;
use think\File;

class Upload extends Controller{

	 //图片上传
    public function upload(){
        $file = request()->file('file');
        if($file){
           $root = $_SERVER['DOCUMENT_ROOT'];
           $info = $file->move($root . '/public' . DS . 'uploads/');
            if($info){
            	$file = str_replace("\\","/",'/public/uploads/'.$info->getSaveName());
            	$result['errno'] = 0;
            	$result['data'] = [$file];
            	return json_encode($result);
            }else{
                return false;
            }
        }
    }
}
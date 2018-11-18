<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
*  字节单位转换
*  @param $size     int  内存大小
*  @param $digits   int  保留小数点
*/
function calc($size,$digits=2){ 
  $unit= array('','K','M','G','T','P');
  $base= 1024;
  $i = floor(log($size,$base));
  $n = count($unit);
  if($i >= $n){
    $i=$n-1;
  }
  return round($size/pow($base,$i),$digits).' '.$unit[$i] . 'B';
}
	
	//生成随机字符串
    function salt($length=6){
		$str="QWERTYUIOPASDFGHJKLZXCVBNM1234567890qwertyuiopasdfghjklzxcvbnm";
		str_shuffle($str);
		$name=substr(str_shuffle($str),26,$length);
		return $name;
	}

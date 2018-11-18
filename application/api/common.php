<?php
/**
* author meizi <1328043241@qq.com>
* time   2018/7/5
* blog    www.wero6.com
*/

//错误返回码
function msg($errcode){  //定义错误信息
    $url = $_SERVER['SERVER_NAME'].url('Router/respond',array('errcode'=>$errcode));
    $data = http_curl($url);
    return $data;
}

//正确返回格式
function JsonReturn($msg,$data=''){
    $result['code'] = 10000;
    $result['msg'] = $msg;
    $result['data'] = $data;
    return json_encode($result);
}


/**
 * GET 请求
 * @param string $url  请求地址
 * @param array $data 参数数据 array('name'=>'value')
 * @param string $data 是否有文件上传
 */
function http_curl($url,$data='',$post_file=false){
    $oCurl = curl_init();
    if(stripos($url,"https://")!==FALSE){
        curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
    }
    if(!empty($data)){
    	 if (is_string($data) || $post_file) {
	        $strPOST = $data;
	    } else {
	        $aPOST = array();
	        foreach($data as $key=>$val){
	            $aPOST[] = $key."=".urlencode($val);
	        }
	        $strPOST =  join("&", $aPOST);
	    }
    	curl_setopt($oCurl, CURLOPT_POST, true);
        curl_setopt($oCurl, CURLOPT_POSTFIELDS,$strPOST);
    }
    curl_setopt($oCurl, CURLOPT_URL, $url);
    curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
    $sContent = curl_exec($oCurl);
    $aStatus = curl_getinfo($oCurl);

    curl_close($oCurl);
    if(intval($aStatus["http_code"])==200){
        return $sContent;
    }else{
        return false;
    }

}

?>
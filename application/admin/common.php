<?php
use think\Db;

//正确返回格式
function success($code,$msg,$data=''){
    $result['code'] = $code;
    $result['msg'] = $msg;
    $result['data'] = $data;
     exit(json_encode($result));
}

function error($code,$msg){
    $result['code'] = $code;
    $result['msg'] = $msg;
    exit(json_encode($result));
}

/**
 * 读取配置
 * @return array 
 */
function load_config(){
    $list = Db::name('config')->select();
    $config = [];
    foreach ($list as $k => $v) {
        $config[trim($v['key'])]=$v['value'];
    }

    return $config;
}

/**
 * 记录日志
 * @param  [type] $uid         [用户id]
 * @param  [type] $username    [用户名]
 * @param  [type] $description [描述]
 * @param  [type] $status      [状态]
 * @return [type]              [description]
 */
function writelog($uid,$username,$description,$status){
    $data['admin_id'] = $uid;
    $data['admin_name'] = $username;
    $data['description'] = $description;
    $data['status'] = $status;
    $data['ip'] = request()->ip();
    $data['create_time'] = time();
    $log = Db::name('log')->insert($data);
}




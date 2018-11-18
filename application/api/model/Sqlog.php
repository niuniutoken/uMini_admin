<?php
namespace app\api\model;
use think\Model;


class Sqlog extends Model{

	/**
	 * [sqlLog 数据库操作日志log]
	 * @param  [type] $log_content [内容]
	 * @return [type]              [description]
	 */
	 public static function sqlLog($log_content,$keyp='') {
	    $max_size = 30000000;
	    $filepath=$_SERVER['DOCUMENT_ROOT'].'/runtime/sql_log';
	    if(!is_dir($filepath)){
	    	mkdir($filepath,0777);
	    }
	    $mk = $filepath.'/'.date('Ym');
	    if(!is_dir($mk)){
	        mkdir($mk,0777);
	    }
	    $log_filename =$mk.'/'.date('Y-m-d').'.txt';

	    if (file_exists($log_filename) && (abs(filesize($log_filename)) > $max_size)) {
	        rename($log_filename, dirname($log_filename) . DS . date('Ym-d-His') . $keyp . ".log");
	    }

	    $t = microtime(true);
	    $micro = sprintf("%06d", ($t - floor($t)) * 1000000);
	    $d = new \DateTime (date('Y-m-d H:i:s.' . $micro, $t));
	    if(is_array($log_content)){
	        $log_content = JSONReturn($log_content);
	    }

	    file_put_contents($log_filename, '   ' . $d->format('Y-m-d H:i:s u') ."\r\n" . $log_content . "\r\n------------------------ --------------------------\r\n", FILE_APPEND);
	}
}

?>
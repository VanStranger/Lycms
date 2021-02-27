<?php
namespace application\install\controller;
use \application\admin\model as Model;
use ly\lib\Controller;
use \ly\lib\DB as DB;
class Index extends Controller{
    public function __construct(){
        // echo "construct";
    }
    public $hook=[
        "pre"
    ];
    public function pre(){
        
    }
    public function index(){
        if(file_exists("./static/install/install_lock.txt")){
            return "系统已安装，如需重新安装，请删除安装锁文件。";
        }
        $step=input("step");
        $tempname="step-1";
        switch ($step) {
            case '2':
                // $phpv = phpversion();
                $sp_os = PHP_OS;
                // $sp_gd = gdversion();
                $sp_server = $_SERVER['SERVER_SOFTWARE'];
                $sp_host = (empty($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_HOST'] : $_SERVER['REMOTE_ADDR']);
                $sp_name = $_SERVER['SERVER_NAME'];
                $sp_max_execution_time = ini_get('max_execution_time');
                $sp_allow_reference = (ini_get('allow_call_time_pass_reference') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');
                $sp_allow_url_fopen = (ini_get('allow_url_fopen') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');
                $sp_safe_mode = (ini_get('safe_mode') ? '<font color=red>[×]On</font>' : '<font color=green>[√]Off</font>');
                $sp_gd = (extension_loaded('gd') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');
                $sp_mysql = (function_exists('mysqli_connect') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');
                $sp_pdo = (defined('PDO::ATTR_DRIVER_NAME') ? '<font color=green>[√]On</font>' : '<font color=red>[×]Off</font>');

                $this->assign("sp_os",$sp_os);
                $this->assign("sp_server",$sp_server);
                $this->assign("sp_host",$sp_host);
                $this->assign("sp_name",$sp_name);
                $this->assign("sp_max_execution_time",$sp_max_execution_time);
                $this->assign("sp_allow_reference",$sp_allow_reference);
                $this->assign("sp_allow_url_fopen",$sp_allow_url_fopen);
                $this->assign("sp_safe_mode",$sp_safe_mode);
                $this->assign("sp_gd",$sp_gd);
                $this->assign("sp_pdo",$sp_pdo);
                $tempname="step-2";
                break;
            case '3':
                $tempname="step-3";
                break;
            case '4':
                
                // $file=fopen("./static/install/install_lock.txt","a+");
                // fwrite($file,"安装锁，重新安装时删除此文件。");
                // fclose($file);
                $json=[
                    "type"=>"mysql",
                    "host"=>input("dbhost","127.0.0.1"),
                    "username"=>input("dbuser","root"),
                    "password"=>input("dbpwd","root"),
                    "database"=>input("dbname","test"),
                    "hostport"=>3306,
                    "charset"=>input("dblang","utf8"),
                    "prefix"=>input("prefix",""),
                ];
                $file=fopen("../config/database.php","w+");
                fwrite($file,"<?php\r\n");
                fwrite($file,"  return [\r\n");
                fwrite($file,"    \"db\"=>[\r\n");
                foreach ($json as $key => $value) {
                    fwrite($file,"      \"".$key."\"=>\"".$value."\",\r\n");
                }
                fwrite($file,"    ]\r\n");
                fwrite($file,"  ];\r\n");
                fwrite($file,"?>\r\n");
                fclose($file);

                $tempname="step-4";
                break;
            
            
            default:
                # code...
                break;
        }
        $this->displayHtml($tempname);
    }
    public function testpassword(){
        var_dump($_SERVER);
    }
}
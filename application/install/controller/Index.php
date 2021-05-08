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
                
                $tempname="step-4";
                break;
            
            
            default:
                # code...
                break;
        }
        $this->displayHtml($tempname);
    }
    public function testPassword($dbhost="localhost",$dbport=3306,$dblang="utf8",$dbuser,$dbpwd){
        try {
            $pdo = new \PDO(
                'mysql:host=' . $dbhost . ';port=' . $dbport . ';charset=' . $dblang.';',
                $dbuser,
                $dbpwd,
                array(
                    //For PHP 5.3.6 or lower
                    \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES ".$dblang,
                    \PDO::ATTR_EMULATE_PREPARES => false,
    
                    //长连接
                    //\PDO::ATTR_PERSISTENT => true,
    
                    \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                    \PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true
                )
            );
            return ['code'=>1];            
        } catch (\Throwable $th) {
            return ['code'=>0];            
        }
        
    }
    public function testDBname($dbname,$dbhost="127.0.0.1",$dbport=3306,$dblang="utf8",$dbuser,$dbpwd){
        try {
            $pdo = new \PDO(
                'mysql:dbname=' . $dbname . ';host=' . $dbhost . ';port=' . $dbport . ';charset=' . $dblang.';',
                $dbuser,
                $dbpwd,
                array(
                    //For PHP 5.3.6 or lower
                    \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES ".$dblang,
                    \PDO::ATTR_EMULATE_PREPARES => false,
    
                    //长连接
                    //\PDO::ATTR_PERSISTENT => true,
    
                    \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                    \PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true
                )
            );
            return ['code'=>1];
        } catch (\Throwable $th) {
            return ['code'=>0,"msg"=>$th->getMessage()] ;
        }
    }
    public function createDatabase($dbname,$dbhost="127.0.0.1",$dbport=3306,$dblang="utf8",$dbuser,$dbpwd,$prefix){
        try {
            $pdo = new \PDO(
                'mysql:host=' . $dbhost . ';port=' . $dbport . ';charset=' . $dblang.';',
                $dbuser,
                $dbpwd,
                array(
                    //For PHP 5.3.6 or lower
                    \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES ".$dblang,
                    \PDO::ATTR_EMULATE_PREPARES => false,
    
                    //长连接
                    //\PDO::ATTR_PERSISTENT => true,
    
                    \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                    \PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true
                )
            );
            try {
                $pdo = new \PDO(
                    'mysql:dbname=' . $dbname . ';host=' . $dbhost . ';port=' . $dbport . ';charset=' . $dblang.';',
                    $dbuser,
                    $dbpwd,
                    array(
                        //For PHP 5.3.6 or lower
                        \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES ".$dblang,
                        \PDO::ATTR_EMULATE_PREPARES => false,
        
                        //长连接
                        //\PDO::ATTR_PERSISTENT => true,
        
                        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                        \PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true
                    )
                );
            } catch (\Throwable $conn_db) {
                try {
                    $pdo->exec("CREATE DATABASE ".$dbname);
                } catch (\Throwable $create_DB) {
                    return ['code'=>0,"msg"=>"创建数据库失败"];
                }
            } 

            //写入数据库文件
            try {
                $json=[
                    "type"=>"mysql",
                    "host"=>input("dbhost","127.0.0.1"),
                    "username"=>input("dbuser","root"),
                    "password"=>input("dbpwd","root"),
                    "database"=>input("dbname","test"),
                    "hostport"=>input("dbport",3306),
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
                $sqls=file_get_contents("./static/install/sql.sql");
                if(input("prefix","")){
                    $sqls=str_replace("if exists `","if exists `".input("prefix",""),$sqls);
                    $sqls=str_replace("CREATE TABLE `","CREATE TABLE `".input("prefix",""),$sqls);
                }
                if(count($sqls)){
                    $sqlsarr=explode(";",$sqls);
                    try {
                        foreach ($sqlsarr as $key => $sql) {
                            $sql=preg_replace("/\r\n|\t|\s{2,}/","",$sql);
                            if($sql){
                                DB::query($sql);
                            }
                        }
                    } catch (\Throwable $create_tables) {
                        return ['code'=>0,"msg"=>"创建数据表失败","info"=>$create_tables->getMessage()];
                    }
                }
            } catch (\Throwable $create_file) {
                return ['code'=>0,"msg"=>"写入数据库配置文件失败"];
            }           
        } catch (\Throwable $conn) {
            return ['code'=>0,"msg"=>"数据库连接失败"];            
        }
        
    }
}
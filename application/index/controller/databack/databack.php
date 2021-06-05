<?php
namespace application\index\controller\databack;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait databack
{
    public function databack($path)
    {

    }
    public function beifen()
    {
        set_time_limit(0);
        $db = include LY_BASEPATH . "/config/database.php";
        $path = LY_BASEPATH . "databack" . DIRECTORY_SEPARATOR . date("Y_m_d_H_i_s");
        $contpath = $path . DIRECTORY_SEPARATOR . "tables";
        if (!is_dir($path)) {
            mkdir($path, 0755,true);
        }
        if (!is_dir($contpath)) {
            mkdir($contpath, 0755,true);
        }
        $file = fopen($path . DIRECTORY_SEPARATOR . "widthoutdata.sql", "w+");
        $cont = "";
        $tables = DB::query("show tables");
        $cont .= "CREATE DATABASE IF NOT EXISTS `" . $db['db']['database'] . "` DEFAULT CHARSET " . $db['db']['charset'] . " COLLATE " . ($db['db']['charset'] === "utf8" ? "utf8_general_mysql500_ci" : "gbk_chinese_ci") . ";\r\nUSE `" . $db['db']['database'] . "`;\r\n";
        foreach ($tables as $key => $value) {
            $table = $value['Tables_in_dx'];
            $cont .= "DROP TABLE IF EXISTS `$table`;\r\n";
            $createTable = DB::query("show create table $table");
            $cont .= $createTable[0]['Create Table'] . ";\r\n";
            $data = DB::table($table)->select();
        }
        fwrite($file, $cont);
        fclose($file);
        $tablescont = "";
        foreach ($tables as $key => $value) {
            $table = $value['Tables_in_dx'];
            $data = DB::table($table)->select();
            if ($data) {
                $tablefile = fopen($contpath . DIRECTORY_SEPARATOR . $table . '.sql', 'w+');
                $tablecont = "INSERT INTO `" . $table . "` VALUES \r\n";
                foreach ($data as $key => $value) {
                    $tablecont .= "(";
                    foreach ($value as $k => $v) {
                        if (is_numeric($v)) {
                            $tablecont .= $v . ",";
                        } else {
                            $str = addslashes($str);
                            $tablecont .= '\'' . $v . '\'' . ",";
                        }
                    }
                    $tablecont = substr($tablecont, 0, -1) . "),\r\n";
                }
                $tablecont = substr($tablecont, 0, -3) . ";\r\n";
                $tablescont .= $tablecont;
                fwrite($tablefile, $tablecont);
                fclose($tablefile);
            }
        }
        $datafile = fopen($path . DIRECTORY_SEPARATOR . "widthdata.sql", "w+");
        fwrite($datafile, $cont);
        fwrite($datafile, $tablescont);
        fclose($datafile);
        return ['code' => 0];
    }
    public function getBeifens()
    {
        $path = LY_BASEPATH . "databack";
        $data=[];
        $temp = scandir($path);
        //遍历文件夹
        foreach ($temp as $v) {
            $a = $path . DIRECTORY_SEPARATOR . $v;
            if (is_dir($a)) { //如果是文件夹则执行

                if ($v == '.' || $v == '..') { //判断是否为系统隐藏的文件.和..  如果是则跳过否则就继续往下走，防止无限循环再这里。
                    continue;
                }
                $data[]=["path"=>$a,"name"=>$v];
            } else {
              continue;
            }

        }
        return Result::success($data);
    }
    public function huanyuan($path)
    {
      $db = include LY_BASEPATH . "/config/database.php";
      $dbname=$db['db']['database'];
        $dbhost=$db['db']['host'];
        $dbport=$db['db']['hostport'];
        $dblang=$db['db']['charset'];
        $dbuser=$db['db']['username'];
        $dbpwd=$db['db']['password'];
        $dbprefix=$db['db']['prefix'];
        $pdo = new \PDO(
            'mysql:host=' . $dbhost . ';port=' . $dbport . ';charset=' . $dblang . ';',
            $dbuser,
            $dbpwd,
            array(
                //For PHP 5.3.6 or lower
                \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES " . $dblang,
                \PDO::ATTR_EMULATE_PREPARES => false,

                //长连接
                //\PDO::ATTR_PERSISTENT => true,

                \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
                \PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true,
            )
        );
        $withoutdata=file_get_contents($path.DIRECTORY_SEPARATOR."widthoutdata.sql");
        $sqlsarr=explode(";\r\n",$withoutdata);
        try {
            foreach ($sqlsarr as $key => $sql) {
                $sql=preg_replace("/\r\n|\t|\s{2,}/","",$sql);
                if(trim($sql)){
                  $pdo->exec($sql);
                }
            }
        } catch (\Throwable $create_tables) {
            return ['code'=>1,"msg"=>"创建数据表失败","info"=>$create_tables->getMessage(),"sql"=>$sql];
        }
        $tables=[];
        $temp = scandir($path.DIRECTORY_SEPARATOR."tables");
        //遍历文件夹
        foreach ($temp as $v) {
            $a = $path .DIRECTORY_SEPARATOR."tables". DIRECTORY_SEPARATOR . $v;
            if (is_dir($a)) { //如果是文件夹则执行

                if ($v == '.' || $v == '..') { //判断是否为系统隐藏的文件.和..  如果是则跳过否则就继续往下走，防止无限循环再这里。
                    continue;
                }
                continue;
              } else {
                $table=file_get_contents($a);
                $sqlsarr=explode(";\r\n",$table);
                try {
                    foreach ($sqlsarr as $key => $sql) {
                        $sql=preg_replace("/\r\n|\t|\s{2,}/","",$sql);
                        if($sql){
                          $pdo->exec($sql);
                        }
                    }
                } catch (\Throwable $create_tables) {
                    return ['code'=>1,"msg"=>"添加数据表数据失败","info"=>$create_tables->getMessage(),"sql"=>$sql];
                }
            }
            
        }
        return Result::success();
    }
    protected function deldir($path){
        $path=rtrim($path,"/");
      //如果是目录则继续
      if(is_dir($path)){
          //扫描一个文件夹内的所有文件夹和文件并返回数组
          $p = scandir($path);
          //如果 $p 中有两个以上的元素则说明当前 $path 不为空
          if(count($p)>2){
              foreach($p as $val){
                  //排除目录中的.和..
                  if($val !="." && $val !=".."){
                      //如果是目录则递归子目录，继续操作
                      if(is_dir($path.DIRECTORY_SEPARATOR.$val)){
                          //子目录中操作删除文件夹和文件
                          $this->deldir($path.DIRECTORY_SEPARATOR.$val);
                      }else{
                          //如果是文件直接删除
                          unlink($path.DIRECTORY_SEPARATOR.$val);
                      }
                  }
              }
          }
      }
      //删除目录
      return rmdir($path);
    }
    public function removeBeifens($ids=[]){
      if($ids){
        foreach ($ids as $key => $value) {
            if($value){
                $path = LY_BASEPATH . "databack".DIRECTORY_SEPARATOR.$value;
                $del=$this->deldir($path);
                if(!$del){
                  return Result::fail("删除失败",2,$path);
                }
            }
        }
        
          return Result::success();
        
        
    }else{
        return Result::fail("待删除项目为空");
    }
    }
    // public function beifen(){
    //   $db=include LY_BASEPATH . "/config/database.php";
    //   $path=LY_BASEPATH . "databack";
    //   if(!is_dir($path)){
    //     mkdir($path,0777);
    //   }
    //   $filename=date("Y_m_d_H_i_s").".sql";
    //   $cmd=""."mysqldump -h ".$db['db']['host']." -u".$db['db']['username']." -p".$db['db']['password']." ".$db['db']['database']."  > $path/$filename";
    //   if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
    //     $cmd="cmd \c "."c:\windows\mysqldump --add-drop-database -h ".$db['db']['host']." -u".$db['db']['username']." -p".$db['db']['password']." -B ".$db['db']['database']." > $path".DIRECTORY_SEPARATOR."$filename 2>&1";
    //   }
    //   echo $cmd;
    //   exec($cmd,$res,$code);
    //   var_dump($code);
    //   var_dump($res);
    // }
    // public function huanyuan($file){
    //   $db=include LY_BASEPATH . "/config/database.php";
    //   $path=LY_BASEPATH . "databack";
    //   $file=$path."/".$file;
    //   if(!is_file($file)){
    //     return Result::fail("文件不存在");
    //   }
    //   $cmd="mysql -h ".$db['db']['host']." -u ".$db['db']['username']." -p".$db['db']['password']." < ".$file;
    //   if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
    //     $cmd="cmd \c ".$cmd;
    //   }
    //   $out=exec($cmd,$res,$code);
    //   if($code===0){
    //     return Result::success();
    //   }else{
    //     return Result::fail();
    //   }
    // }

}

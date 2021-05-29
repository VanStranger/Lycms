<?php
namespace application\index\controller\databack;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait databack
{
  public function databack($path){

  }
  public function beifen(){
    $db=include LY_BASEPATH . "/config/database.php";
    $path=LY_BASEPATH . "databack";
    if(!is_dir($path)){
      mkdir($path,0777);
    }
    $filename=date("Y_m_d_H_i_s").".sql";
    $cmd=""."mysqldump -h ".$db['db']['host']." -u".$db['db']['username']." -p".$db['db']['password']." ".$db['db']['database']."  > $path/$filename";
    if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
      $cmd="cmd \c "."c:\windows\mysqldump --add-drop-database -h ".$db['db']['host']." -u".$db['db']['username']." -p".$db['db']['password']." -B ".$db['db']['database']." > $path".DIRECTORY_SEPARATOR."$filename 2>&1";
    }
    echo $cmd;
    exec($cmd,$res,$code);
    var_dump($code);
    var_dump($res);
  }
  public function huanyuan($file){
    $db=include LY_BASEPATH . "/config/database.php";
    $path=LY_BASEPATH . "databack";
    $file=$path."/".$file;
    if(!is_file($file)){
      return Result::fail("文件不存在");
    }
    $cmd="mysql -h ".$db['db']['host']." -u ".$db['db']['username']." -p".$db['db']['password']." < ".$file;
    if(strtoupper(substr(PHP_OS,0,3))==='WIN'){
      $cmd="cmd \c ".$cmd;
    }
    $out=exec($cmd,$res,$code);
    if($code===0){
      return Result::success();
    }else{
      return Result::fail();
    }
  }
    
}
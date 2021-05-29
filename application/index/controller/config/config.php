<?php
namespace application\index\controller\config;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait config
{

    public function getConfigs()
    {
        $configs = DB::table("config")->select();
        return Result::success($configs);

    }
    public function updateConfig($config)
    {
        if($config['id']){
            $edit=DB::table("config")
            ->where("id",$config['id'])
            ->updateEntity($config);
        }else{
            $edit=DB::table("config")
            ->insertEntity($config);
        }
        return Result::code($edit?0:1);
    }
    public function removeConfigs($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("config")->where("id in ".$idstr)->delete();
            if($edit>0){
              return Result::success();
            }else{
              return Result::fail("删除的数量为0");
            }
        }else{
            return Result::fail("待删除项目为空");
        }
    }
}
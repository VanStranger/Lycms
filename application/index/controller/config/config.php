<?php
namespace application\index\controller\config;

use \ly\lib\DB as DB;
trait config
{

    public function getConfigs()
    {
        $configs = DB::table("config")->select();
        return ['state' => 1, "data" => $configs, 'msg' => ''];

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
        return ['state'=>$edit];
    }
    public function removeConfigs($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("config")->where("id in ".$idstr)->delete();
            if($edit>0){
              return ['state'=>1];
            }else{
              return ['state'=>0,"msg"=>"删除的数量为0"];
            }
        }else{
            return ['state'=>0,"msg"=>"待删除项目为空"];
        }
    }
}
<?php
namespace application\index\controller\art;

use \ly\lib\DB as DB;
trait art
{

    public function getArts()
    {
        $navs = DB::table("article")->select();
        return ['state' => 1, "data" => $navs, 'msg' => ''];

    }
    public function updateArt($article)
    {
        if($article['id']){
            $edit=DB::table("article")
            ->where("id",$article['id'])
            ->updateEntity($article);
        }else{
            $edit=DB::table("article")
            ->insertEntity($article);
        }
        return ['state'=>$edit];
    }
    public function removeArts($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("article")->where("id in ".$idstr)->delete();
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
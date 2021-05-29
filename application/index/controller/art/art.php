<?php
namespace application\index\controller\art;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait art
{

    public function getArts()
    {
        $navs = DB::table("article")->select();
        return Result::success($navs);

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
        return Result::code($edit?0:1);
    }
    public function removeArts($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("article")->where("id in ".$idstr)->delete();
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
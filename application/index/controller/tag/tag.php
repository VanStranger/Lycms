<?php
namespace application\index\controller\tag;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait tag
{

    public function getTags()
    {
        $tags = DB::table("tag")->select();
        return Result::success($tags);

    }
    public function updateTag($tag)
    {
        if($tag['id']){
            $edit=DB::table("tag")
            ->where("id",$tag['id'])
            ->updateEntity($tag);
        }else{
            $edit=DB::table("tag")
            ->insertEntity($tag);
        }
        return Result::code($edit?0:1);
    }
    public function removeTags($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("tag")->where("id in ".$idstr)->delete();
            if($edit>0){
              return Result::success();
            }else{
              return Result::fail("删除的数量为0");
            }
        }else{
            return Result::success("待删除项目为空");
        }
    }
}
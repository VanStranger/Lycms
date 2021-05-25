<?php
namespace application\index\controller\tag;

use \ly\lib\DB as DB;
trait tag
{

    public function getTags()
    {
        $tags = DB::table("tag")->select();
        return ['state' => 1, "data" => $tags, 'msg' => ''];

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
        return ['state'=>$edit];
    }
    public function removeTags($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("tag")->where("id in ".$idstr)->delete();
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
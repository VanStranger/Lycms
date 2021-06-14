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
    function getArtTags($aid){
        $tags=DB::table("art_tag")
        ->join("tag","art_tag.tagid=tag.id","left")
        ->field("tag.*")
        ->where("art_tag.artid",$aid)
        ->select();
        // echo DB::getSql();
        // var_dump(DB::getParams());
        return Result::success($tags,$aid);
    }
    public function updateArtTags($artid,$tags=[])
    {
        if($artid){
            $edit=DB::table("art_tag")
            ->where("artid",$artid)
            ->delete();
            foreach ($tags as $key => $value) {
                $edit=DB::table("art_tag")
                ->insert([
                    "artid"=>$artid,
                    "tagid"=>$value,
                ]);
            }
            return Result::success();
        }else{
            return Result::fail("文章id不能为空");
        }
    }
    public function updateArt($article)
    {
        $tags=$article['tags'];
        DB::beginTrans();
        try {
            //code...
            if($article['id']){
                $article['update_time']=time();
                $edit=DB::table("article")
                ->where("id",$article['id'])
                ->updateEntity($article);
                $artid=$article['id'];
            }else{
                $article['create_time']=time();
                $article['update_time']=time();
                $edit=DB::table("article")
                ->insertEntity($article);
                $artid=DB::lastInsertId();
            }
            if(is_array($tags) && count($tags)){
                $this->updateArtTags($artid,$tags);
            }
            DB::commit();
        } catch (\Throwable $th) {
            //throw $th;
            DB::rollback();
            return Result::fail($th->getMessage(),1);
        }
        return Result::code(0);
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
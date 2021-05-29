<?php
namespace application\index\controller\nav;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait nav
{

    public function getNavs()
    {
        $navs = DB::table("nav")->order("weight desc")->select();
        return Result::success($navs);

    }
    public function updateNav($nav)
    {
        if($nav['id']){
            $edit=DB::table("nav")
            ->where("id",$nav['id'])
            ->updateEntity($nav);
        }else{
            $edit=DB::table("nav")
            ->insertEntity($nav);
        }
        return Result::code($edit?0:1);
    }
    public function removeNavs($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("nav")->where("id in ".$idstr)->delete();
            if($edit>0){
              return Result::success();
            }else{
              return Result::fail("删除的数量为0");
            }
        }else{
            return Result::fail("待删除项目为空");
        }
    }
    public function getNavCont($navid)
    {
        $navs = DB::table("nav_art")->where("navid",$navid)->find();
        if($navs){
            $navs['content']=htmlspecialchars_decode($navs['content']);
        }
        return Result::success($navs);

    }
    public function editNavCont($navid,$content=""){
        if($navid){
            $nav=DB::table("nav_art")->where("navid",$navid)->find();
            if($nav){
                $edit=DB::table("nav_art")->where("navid",$navid)
                ->update(['content'=>$content]);
            }else{
                $edit=DB::table("nav_art")
                ->insert([
                    'navid'=>$navid,
                    'content'=>$content
                    ]);

            }
            if($edit===1){
                return Result::success();
            }else{
                return Result::fail("系统错误，请稍后再试");
            }
        }else{
            return Result::fail("参数缺失");
        }
    }
}
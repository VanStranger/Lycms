<?php
namespace application\index\controller\banner;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait banner
{

    public function getBannerTypes()
    {
        $navs = DB::table("banner_type")->select();
        return Result::success($navs);

    }
    public function updateBannerType($bannerType)
    {
        if($bannerType['id']){
            $edit=DB::table("banner_type")
            ->where("id",$bannerType['id'])
            ->updateEntity($bannerType);
        }else{
            $edit=DB::table("banner_type")
            ->insert(["title"=>$bannerType['title']]);
        }
        return Result::code($edit?0:1);
    }
    public function removeBannerTypes($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("banner_type")->where("id in ".$idstr)->delete();
            if($edit>0){
              return Result::success();
            }else{
              return Result::fail("删除的数量为0");
            }
        }else{
            return Result::fail("待删除项目为空");
        }
    }
    public function getBanners($tid=0)
    {
        $navs = DB::table("banner")->where(function($q)use($tid){
            if($tid){
                $q->where("tid",$tid);
            }
        })->select();
        return Result::success($navs);

    }
    public function updateBanner($banner)
    {
        if($banner['id']){
            $edit=DB::table("banner")
            ->where("id",$banner['id'])
            ->updateEntity($banner);
        }else{
            $edit=DB::table("banner")
            ->insertEntity($banner);
        }
        return Result::code($edit?0:1);
    }
    public function removeBanners($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("banner")->where("id in ".$idstr)->delete();
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
<?php
namespace application\index\controller\role;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait role
{

    public function getCurrentRole()
    {
      if($this->userid){
        $role = DB::table("user")
        ->join("role","user.rid=role.id","left")
        ->field("role.*")
        ->where("user.id",$this->userid)
        ->find();
        return Result::success($role);
      }else{
        return Result::fail();
      }

    }
    public function getRoles()
    {
        $roles = DB::table("role")->select();
        return Result::success($roles);

    }
    public function updateRole($role)
    {
        if($role['id']){
            $edit=DB::table("role")
            ->where("id",$role['id'])
            ->updateEntity($role);
        }else{
            $edit=DB::table("role")
            ->insertEntity($role);
        }
        return Result::code($edit?0:1);
    }
    public function removeRoles($ids=[]){
        if($ids){
            $idstr="(".implode(",",$ids).")";
            $edit=DB::table("role")->where("id in ".$idstr)->delete();
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
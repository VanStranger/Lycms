<?php
namespace application\index\controller\user;

use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
trait user
{
    public function currentUser(){
        return Result::success($this->user);
    }
    public function login($loginname="", $password="")
    {
        $user = DB::table("user")
            ->join("role", "user.rid=role.id", "left")
            ->field("user.id,username,loginname,token,role.title as role,role.permit")
            ->where(['loginname' => $loginname, "password" => md5($password)])->find();
        if (!$user) {
            return Result::fail("用户名或密码不正确");
        } else {
            $user = array_change_key_case($user, CASE_LOWER);
            $userid = $user['id'];
            $token = md5(time() . "sth");
            $edit = DB::table("user")->where("id", $userid)->update([
                'token' => $token,
                'lastlogin' => time(),
            ]);
            if ($edit == 1) {
                $user['token'] = $token;
                setcookie("UserID", $userid, time() + 3600 * 24, "/");
                setcookie("Token", $token, time() + 3600 * 24, "/");
                setcookie("Username", $username, time() + 3600 * 24, "/");
                setcookie("Loginname", $loginname, time() + 3600 * 24, "/");
                setcookie("role", $user['rid'], time() + 3600 * 24, "/");
                return Result::success($user);
            } else {
                return Result::fail("操作失败");
            }
        }
    }
    public function loginout()
    {
        setcookie("UserID", "", time() - 1, "/");
        setcookie("Token", "", time() - 1, "/");
        $this->redirect("/login.html");
    }
    public function getUsers()
    {
        $navs = DB::table("user")->select();
        return Result::success($navs);
    }
    public function updateUser($user)
    {
        if ($user['id']) {
            $edit = DB::table("user")
                ->where("id", $user['id'])
                ->updateEntity($user);
        } else {
            $edit = DB::table("user")
                ->insertEntity($user);
        }
        if($edit){
            return Result::success();
        }else{
            return Result::fail();
        }
    }
    public function removeUser($ids = [])
    {
        if ($ids) {
            $idstr = "(" . implode(",", $ids) . ")";
            $edit = DB::table("user")->where("id in " . $idstr)->delete();
            if ($edit > 0) {
                return Result::success();
            } else {
                return Result::fail("删除的数量为0");
            }
        } else {
            return Result::fail("待删除项目为空");
        }
    }
}

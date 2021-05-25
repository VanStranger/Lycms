<?php
namespace application\index\controller;
use ly\lib\Controller;
use \application\index\model as Model;
use \ly\lib\DB as DB;
use \ly\lib\Result as Result;
include_once __DIR__."/nav/nav.php";
include_once __DIR__."/art/art.php";
include_once __DIR__."/user/user.php";
include_once __DIR__."/tag/tag.php";
include_once __DIR__."/config/config.php";
include_once __DIR__."/databack/databack.php";
class Ajax extends Controller{
    use nav\nav,art\art,user\user,tag\tag,config\config,databack\databack;
    public function __construct(){
        // echo "construct";
    }
    public $hook=[
      "pre",
      "checkUser"=>[
        "except"=>[
          "login",
          "reg",
          "ceshi"
        ]
      ]
    ];
    public function pre(){

    }
    public function checkUser(){
        $this->userid=input("userid")?:$_COOKIE['UserID'];
        $token=input("token")?:$_COOKIE['Token'];
        if($this->userid && $token){
          $this->user=DB::table("user")->where(['id'=>$this->userid,"token"=>$token])->find();
        }
        if(!$this->user){
            // return ['state'=>0,"msg"=>"请先登录。","input"=>input()];
            return Result::fail("请先登录",1,input());
        }
    }
    private function getNavsByid($id){
        static $ids="";
        $navs=DB::table("nav")->where("pid",$id)->select();
        foreach ($navs as $key => $value) {
            $ids.=$value['id'].",";
            $this->getNavs($value['id']);
        }
        return $ids;
    }
    public function uploadFiles($file="file"){
      return uploadFiles("file");
    }

    public function ceshi(){
      return Result::success();
    }
    
}
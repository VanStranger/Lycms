<?php
namespace application\index\controller;
use ly\lib\Controller;
use \application\index\model as Model;
use \ly\lib\DB as DB;
class Demo extends Controller{
    public function __construct(){
        // echo "construct";
    }
    public $hook=[
        "pre"
    ];
    public function pre(){
        
    }
    public function ceshi(){
      $arts_img_nav=DB::table("article")
                ->where("nid",1)
                ->where("preimg <> ?",["[]"])
                ->limit(2)
                ->select();
                return $arts_img_nav;
    }
    public function index(){
      //where用法
      //一个字符串参数，等效 ... where $p1;
      $data=DB::table("article")->where("type=1")->select();
      //两个参数，逗号分割,等效 ... where $p1 = ? ,[$p2]
      $data=DB::table("article")->where("type",1)->select();
      //一个数组参数，value为基本类型,等效 ... where $key = ?,[$value] 
      $data=DB::table("article")->where(["type"=>1])->select();
      //一个数据参数，value为key为数字的数据，等效  ...where $key $value
      $data=DB::table("article")->where(["type"=>["=1"]])->select();
      $data=DB::table("article")->where("type=?",[1])->select();
      $a=1;
      $data=DB::table("article")->where(function($q)use($a){
        $q->where("type",$a);
        $q->whereOr("type",3);
      })->whereOr(function($q)use($a){
        $q->whereOr("type",2);
      })
      ->select();
      echo DB::getSql();
    }
    
}
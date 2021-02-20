<?php
namespace application\index\controller;
use ly\lib\Controller;
use \application\index\model as Model;
use \ly\lib\DB as DB;
class Index extends Controller{
    public function __construct(){
        // echo "construct";
    }
    public $hook=[
        "pre"
    ];
    public function pre(){
        // return "pre";
        var_dump([]);
        var_dump(config("path_type"));
    }
    public function index(){
        // $user=DB::table("user")->insertEntity(input(),false);
        $update=DB::table("user")->where("id",1)->updateEntity([
            "username"=>"dsdsf",
            "dsfds"=>"sdfds"
        ]);
        var_dump(DB::table("user")->where("id",1)->find());
        $Love=new Model\Love();
        $hername=$Love->gethername();
        $data=DB::table("user")->select();
        $this->assign("hername",$hername);
        $this->assign("showhtml",'代码是:<p>Hello，{{ $hername}}。</p>');
        $this->displayHtml();
    }
    public function jsonapi(){
        $a=1;
        $data=DB::table("users1")->where("id",10000)->buildSql();
        // var_dump($data);
        $d=DB::table(["answer"=>"a"])->join([$data,"m"],"a.authorid=m.id")->field("m.id,username,title")->select();
        var_dump($d);
    }
}
<?php
namespace application\index\controller;
use \application\index\model as Model;
use ly\lib\Controller;
use ly\lib\DB as DB;
use ly\lib\PDO as PDO;
class index extends Controller{
    public function index(){
        $this->assign("IWantToSay","我好想你。");
        $News=new Model\news();
        echo $News->addarts("li","df");
        $this->display();
    }
    public function insert(){
        $insert=DB::table("article")->insert(['title'=>"刘亦菲","content"=>"小龙女王语嫣"]);
        var_dump($insert);
    }
    public function delete(){
        $del=DB::table("article")->delete();
        var_dump($del);
    }
    public function liu(){
        $db=DB::table("article")->where("id",1)->update(['title'=>"liu"]);
        var_dump($db);
    }
    public function pd(){
        $pdo=PDO::getInstance(["database"=>"laravel"]);
        $up=$pdo->query("UPDATE users set ?=? where id =?",["pass",md5("liyang"),1]);
        var_dump($up);
    }
    public function ceshi(){
        $this->assign("liu","liyang");
        $this->display();
    }
}
<?php
namespace application\index\controller;
use \application\index\model as Model;
use ly\lib\Controller;
use ly\lib\DB as DB;
use ly\lib\PDO as PDO;
class index extends Controller{
    public function index(){
        $this->assign("IWantToSay","，我好想你。");
        $Love=new Model\Love();
        echo $Love->hardtosay();
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
    public function mysqli(){
        $conn=mysqli_connect("127.0.0.1","root","root","laravel");
        $res=mysqli_query($conn,"select * from article left join users on users.id=article.authorid");
        $arr=mysqli_fetch_all($res,MYSQLI_ASSOC);
        return $arr;
    }
    public function pd(){
        $pdo=PDO::getInstance(["database"=>"laravel"]);
        $up=$pdo->query("UPDATE users set pass=? where id =?",[md5("liyang"),1]);
        var_dump($up);
    }
    public function ceshi(){
        $article=DB::table(["users"=>"u"])
        ->field(["u.id","a.title","ifnull(authorid,0)"=>"author"])
        ->join(["article"=>"a"],"a.authorid=u.id")
        ->where(function($query){
            $query->where("u.id",1);
        })
        ->select();
        return json_encode($article);
    }
    public function viewceshi(){
        $this->assign("navigation",[["href"=>"sdf","caption"=>"sdf"]]);
        $this->assign("a_variable","sdfsd");
        return $this->view();
    }
}
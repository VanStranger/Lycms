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
        $configs=DB::table("config")->select();
        $config=[];
        foreach ($configs as $key => $value) {
            $config[$value['key']]=$value['val'];
        }
        $config['img0']="";
        $this->navs=DB::table("nav")->select();
        $links=DB::table("links")->select();
        $tags=DB::table("tag")->select();
        $art_count=DB::table("article")->count();
        $this->data=['state'=>1,"global"=>$config,"navs"=>$this->navs,"links"=>$links,"tags"=>$tags,"art_count"=>$art_count,"input"=>input()];
    }
    private function getNavs($id){
        static $ids="";
        $navs=DB::table("nav")->where("pid",$id)->select();
        foreach ($navs as $key => $value) {
            $ids.=$value['id'].",";
            $this->getNavs($value['id']);
        }
        return $ids;
    }
    public function index(){
        $tarts=DB::table("article")->where("type",1)->limit(2)->select();
        $this->data['tarts']=$tarts;
        $nav_arts=[];
        foreach ($this->navs as $key => $value) {
            if($value['type']===0 && $value['pid']===0){
                $arts_img_nav=DB::table("article")
                ->where("nid",$value['id'])
                ->where("preimg <> '[]'")
                ->limit(2)
                ->select();
                $arts_img_nav_idstr="";
                foreach ($arts_img_nav as $key => $value) {
                    $arts_img_nav_idstr.=$value['id'].",";
                }
                if($arts_img_nav_idstr){
                    $arts_img_nav_idstr="(".substr($arts_img_nav_idstr,0,-1).")";
                }
                $arts_nav=DB::table("article")
                ->where("nid",$value['id'])
                ->where(function($q)use($arts_img_nav_idstr){
                    // if($arts_img_nav_idstr){
                    //     $q->where("id not in ".$arts_img_nav_idstr);
                    // }
                })
                ->limit(3)
                ->select();
                $nav_arts[]=["id"=>$value['id'],"arts_withimg"=>$arts_img_nav,"arts"=>$arts_nav];   
            }
        }
        $this->data['nav_arts']=$nav_arts;
        $arts=DB::table("article")
        ->join("nav","article.nid=nav.id","left")
        ->field("article.*,nav.title as nav")
        ->order("update_time desc")
        ->limit(20)
        ->select();
        $this->data['arts']=$arts;
        $arts_view=DB::table("article")
        ->join("nav","article.nid=nav.id","left")
        ->field("article.*,nav.title as nav")
        ->order("view desc")
        ->limit(20)
        ->select();
        $this->data['arts_view']=$arts_view;
        
        return $this->data;
    }
    public function nav(){
        $id=input("id");
        $page=input("page",1);
        $size=input("size",20);
        $nav=DB::table("nav")->where("id",$id)->find();
        if($nav && $nav['type']===1){
            $content=DB::table("nav_art")->where("navid",$id)->find();
            $nav['content']=$content['content'];
        }else{
            $ids=$this->getNavs($id).$id;
            $newarts=DB::table("article")
            ->join("nav","article.nid=nav.id","left")
            ->field("article.*,nav.title as nav")
            ->where("nid in (".$ids.")")
            ->limit(($page-1)*$size,$size)
            ->order("article.update_time desc")
            ->select();
            $this->data['newarts']=$newarts;
            $artsnum=DB::table("article")
            ->where("nid in (".$ids.")")
            ->order("update_time desc")
            ->count();
            $this->data['artsnum']=$artsnum;
            $viewarts=DB::table("article")
            ->where("nid in (".$ids.")")
            ->limit(9)
            ->order("view desc")
            ->select();
            $this->data['viewarts']=$viewarts;
        }
        $this->data['nav']=$nav;
        return $this->data;
    }
    public function art(){
        $id=intval(input("id")) || 0;
        $nid=input("nid");
        $nav=DB::table("nav")->where("id",$id)->find();
        $this->data['nav']=$nav;
        $art=DB::table("article")
        ->where("id",$id)
        ->find();
        $update=DB::table("article")->where("id",$id)->update([
            "view"=>['view+1']
        ]);
        $tags=DB::table("art_tag")
        ->join("tag","tag.id=art_tag.tagid","left")
        ->where("art_tag.artid",$id)
        ->field("tag.*")
        ->select();
        $art['tags']=$tags;
        $this->data['art']=$art;
        $prev=DB::table("article")->where("nid",$nid)->where("id < ".$id)->find();
        $next=DB::table("article")->where("nid",$nid)->where("id > ".$id)->find();
        $this->data['prev']=$prev;
        $this->data['next']=$next;

        $arts_nav=DB::table("article")
        ->where("nid",$nid)
        ->order("create_time desc")
        ->limit(9)
        ->select();
        $arts_view=DB::table("article")
        ->where("nid",$nid)
        ->order("update_time desc")
        ->limit(9)
        ->select();
        $this->data['arts_nav']=$arts_nav;
        $this->data['arts_view']=$arts_view;
        return $this->data;
    }
    public function tags(){
        return $this->data;
    }
    public function tag(){
        $id=input("id",0);
        $page=input("page",1);
        $size=input("size",20);
        $tag=DB::table("tag")->where("id",$id)->find();
        $this->data['tag']=$tag;
        $arts=DB::table("article")
        ->where("nid",$id)
        ->limit(($page-1)*$size,$size)
        ->select();
        $this->data['arts']=$arts;
        $arts_nav=DB::table("article")
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->field("article.*")
        ->where("art_tag.tagid",$id)
        ->order("create_time desc")
        ->limit(9)
        ->select();
        $arts_view=DB::table("article")
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->field("article.*")
        ->where("art_tag.tagid",$id)
        ->order("update_time desc")
        ->limit(9)
        ->select();
        $this->data['arts_nav']=$arts_nav;
        $this->data['arts_view']=$arts_view;
        return $this->data;
    }
    public function search(){
        $q=input("q","");
        $page=input("page",1);
        $size=input("size",20);
        if($q){
            $arts=DB::table("article")
            ->join("art_tag","article.id=art_tag.artid","left")
            ->join("tag","tag.id=art_tag.tagid","left")
            ->join("nav","nav.id=article.nid","left")
            ->field("article.*,tag.title as tag,nav.title as nav")
            ->where("article.title like ? or article.content like ? or tag.title like ? or nav.title like ?",['%'.$q."%",'%'.$q."%",'%'.$q."%",'%'.$q."%"])
            ->limit(($page-1)*$size,$size)
            ->select();
        }else{
            $arts=[];
        }
        $this->data['arts']=$arts;
        
        $arts_view=DB::table("article")
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->field("article.*")
        ->order("update_time desc")
        ->limit(9)
        ->select();
        $this->data['arts_view']=$arts_view;
        return $this->data;
    }
    public function ceshi(){
        $a=DB::table("nav")
        ->where("id in (?)",['1,2,3'])
        ->select();
        return $a;
    }
}
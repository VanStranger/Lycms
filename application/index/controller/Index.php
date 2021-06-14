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
        $this->navs=DB::table("nav")->order("weight desc,id asc")->select();
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
        $banners=DB::table("banner")->select();
        $this->data['banners']=$banners;
        $tarts=DB::table("article")->where("type",1)->limit(2)->select();
        $this->data['tarts']=$tarts;
        $nav_arts=[];
        foreach ($this->navs as $key => $value) {
            if($value['type']===0 && $value['pid']===0){
                $arts_img_nav=DB::table("article")
                ->where("nid",$value['id'])
                ->where("preimg <> ''")
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
        ->limit(10)
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
            $nav['content']=htmlspecialchars_decode($content['content']);
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
            $artsnum=DB::table("article")->where("nid in (".$ids.")")->count();
            $maxpage=ceil($artsnum/$size)?:1;
            $this->data['maxpage']=$maxpage;
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
        $id=intval(input("id")) ?: 0;
        $nid=input("nid");
        $nav=DB::table("nav")->where("id",$nid)->find();
        $this->data['nav']=$nav;
        $art=DB::table("article")
        ->where("id",$id)
        ->find();
        if($art){
            $art['content']=htmlspecialchars_decode($art['content']);
        }
        $update=DB::table("article")->where("id",$id)->update([
            "view"=>['view+1']
            ]);
        $tags=DB::table("art_tag")
        ->join("tag","tag.id=art_tag.tagid","inner")
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
        ->order("view desc")
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
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->join("nav","article.nid=nav.id","left")
        ->field("article.*,nav.title as nav")
        ->where("art_tag.tagid",$id)
        ->limit(($page-1)*$size,$size)
        ->select();
        $this->data['arts']=$arts;
        $artsnum=DB::table("article")
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->field("article.*")->where("art_tag.tagid",$id)->count();
        $maxpage=ceil($artsnum/$size)?:1;
        $this->data['maxpage']=$maxpage;
        $arts_nav=DB::table("article")
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->join("nav","article.nid=nav.id","left")
        ->field("article.*,nav.title as nav")
        ->where("art_tag.tagid",$id)
        ->order("create_time desc")
        ->limit(9)
        ->select();
        $arts_view=DB::table("article")
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->join("nav","article.nid=nav.id","left")
        ->field("article.*,nav.title as nav")
        ->where("art_tag.tagid",$id)
        ->order("view desc")
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
            $this->data['newarts']=$newarts;
            $artsnum=DB::table("article")->join("art_tag","article.id=art_tag.artid","left")
            ->join("tag","tag.id=art_tag.tagid","left")
            ->join("nav","nav.id=article.nid","left")
            ->field("article.*,tag.title as tag,nav.title as nav")
            ->where("article.title like ? or article.content like ? or tag.title like ? or nav.title like ?",['%'.$q."%",'%'.$q."%",'%'.$q."%",'%'.$q."%"])->count();
            $maxpage=ceil($artsnum/$size)?:1;
        }else{
            $arts=[];
            $maxpage=1;
        }
        $this->data['arts']=$arts;
        $this->data['maxpage']=$maxpage;
        
        $arts_view=DB::table("article")
        ->join("art_tag","article.id=art_tag.artid","inner")
        ->field("article.*")
        ->order("article.view desc")
        ->limit(9)
        ->select();
        $this->data['arts_view']=$arts_view;
        return $this->data;
    }
    public function ceshi(){
        // $a=DB::table(["nav"=>"n"])
        // ->where("nav.id in (?)",['1,2,3'])
        // ->select();
        // $a=DB::table(["nav"=>"n"])
        // ->where("n.id",3)
        // ->select();
        // echo DB::getSql();
        // return $a;
        set_time_limit(0);
        $db=include LY_BASEPATH . "/config/database.php";
        $path=LY_BASEPATH . "databack".DIRECTORY_SEPARATOR.date("Y_m_d_H_i_s");
        $contpath=$path.DIRECTORY_SEPARATOR."tables";
        if(!is_dir($path)){
            mkdir($path,0755);
        }
        if(!is_dir($contpath)){
            mkdir($contpath,0755);
        }
        $file=fopen($path.DIRECTORY_SEPARATOR."widthoutdata.sql","w+");
        $cont="";
        $tables=DB::query("show tables");
        $cont.="CREATE DATABASE IF NOT EXISTS `".$db['db']['database']."`DEFAULT CHARSET ".$db['db']['charset']." COLLATE ".($db['db']['charset']==="utf8"?"utf8_general_mysql500_ci":"gbk_chinese_ci").";\r\nUSE `".$db['db']['database']."`;\r\n";
        foreach ($tables as $key => $value) {
            $table=$value['Tables_in_dx'];
            $cont.="DROP TABLE IF EXISTS `$table`;\r\n";
            $createTable=DB::query("show create table $table");
            $cont.=$createTable[0]['Create Table'].";\r\n";
            $data=DB::table($table)->select();
        }
        fwrite($file,$cont);
        fclose($file);
        $tablescont="";
        foreach ($tables as $key => $value) {
            $table=$value['Tables_in_dx'];
            $data=DB::table($table)->select();
            if($data){
                $tablefile=fopen($contpath.DIRECTORY_SEPARATOR.$table.'.sql','w+');
                $tablecont="INSERT INTO `".$table."` VALUES \r\n";
                foreach ($data as $key => $value) {
                    $tablecont.="(";
                    foreach ($value as $k => $v) {
                        if(is_numeric($v)){
                            $tablecont.=$v.",";
                        }else{
                            $str=str_replace("'", "\'", $str);
                            $tablecont.='\''.$v.'\'' .",";
                        }
                    }
                    $tablecont=substr($tablecont,0,-1)."),\r\n";
                }
                $tablecont=substr($tablecont,0,-3).";\r\n";
                $tablescont.=$tablecont;
                fwrite($tablefile,$tablecont);
                fclose($tablefile);
            }
        }
        $datafile=fopen($path.DIRECTORY_SEPARATOR."widthdata.sql","w+");
        fwrite($datafile,$cont);
        fwrite($datafile,$tablescont);
        fclose($datafile);
        return ['code'=>0];

    }
}
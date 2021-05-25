<?php
  include "../ly/start.php";
  $data=$ly->execute("/index/index/index");
?>
<!doctype html >
<html lang="zh">
<head>
<meta charset="utf-8">
<title><?php echo $data['global']['webname'];?></title>
<meta name="description" content="<?php echo $data['global']['cfg_description'];?>" />
<meta name="keywords" content="<?php echo $data['global']['cfg_keywords'];?>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/skin/css/base.css" rel="stylesheet">
<link href="/skin/css/m.css" rel="stylesheet">
<script src="/skin/js/jquery-1.8.3.min.js" ></script>
<script src="/skin/js/comm.js"></script>
<!--[if lt IE 9]>
<script src="<?php echo $data['global']['cmspath'];?>skin/js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<!--top begin--> 
<?php include "./head.php";?>
<!--top end-->
<article> 
  <!--lbox begin-->
  <div class="lbox"> 
    <!--banbox begin-->
    <div class="banbox">
      <div class="banner">
        <div id="banner" class="fader"> 
          <?php
          foreach ($data['banners'] as $key => $value) {
            ?>
          <li class="slide" ><a href="<?php echo $value['href'];?>"><img src="<?php echo $value['img'];?>"></a></li>
            <?php
          }
          ?>
          
          <div class="fader_controls">
            <div class="page prev" data-target="prev"></div>
            <div class="page next" data-target="next"></div>
            <ul class="pager_list">
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--banbox end--> 
    <!--headline begin-->
    <div class="headline">
      <ul>
        <?php 
        foreach ($data['tarts'] as $key => $value) {
          $preimgs=json_decode($value['preimgs'],true);
          ?>
        <li>
          <a href="./art.php?id=<?php echo $value['id'];?>&nid=<?php echo $value['nid'];?>">
            <img src="<?php echo count($preimgs)?$preimgs[0]:$data['global']['img0'];?>" alt="<?php echo $value['title'];?>">
            <span><?php echo $value['title'];?></span>
          </a>
        </li>
          <?php
        }
        ?>
      </ul>
    </div>
    <!--headline end-->
    <div class="clearblank"></div>
    <div class="tab_box whitebg">
      <div class="tab_buttons">
        <ul>
          <?php 
          foreach ($data['navs'] as $key => $value) {
            if($value['pid']===0 && $value['type']===0){
              ?>
              <li <?php echo $key===0?"class='newscurrent'":"";?>><?php echo $value['title'];?></li>
              <?php
            }
          }
          ?>
          
        </ul>
      </div>
      <div class="newstab"> 
      <?php 
        foreach ($data['navs'] as $key => $value) {
          if($value['pid']===0 && $value['type']===0){
            foreach ($data['navs_arts'] as $k => $v) {
              if($v['id']===$value['id']){
            ?>
           <div class="newsitem">
             <div class="newspic">
               <ul>
                 <?php
                 foreach ($v['arts_withimg'] as $k => $v) {
                   $preimgs=json_decode($value['preimgs'],true);
                    ?>
                    <li><a href="./art.php?id=<?php echo $v['id'];?>"><img src="<?php echo count($preimgs)?$preimgs[0]:$data['global']['img0'];?>"><span><?php echo $v['title'];?></span></a></li>
                    <?php
                 }
                 ?>
                 
               </ul>
             </div>
             <ul class="newslist">
             <?php
                 foreach ($v['arts'] as $k => $v) {
                   
                    ?>
               <li><i></i><a href="./art.php?id=<?php echo $v['id'];?>" title="<?php echo $v['title'];?>"><?php echo $v['title'];?></a>
                 <p><?php echo $v['pre'];?>...</p>
               </li>
               <?php
                 }
                 ?>
             </ul>
           </div>
            <?php
                   }
                  }
          }
        }
        ?>
      </div>
    </div>
    
    <!--tab_box end-->
    <!-- <div class="zhuanti whitebg">
      <h2 class="htitle"><span class="hnav"> {dede:channel type='son' typeid='1'} <a href='[field:typeurl/]'>[field:typename/]</a>&nbsp;{/dede:channel} </span>特别推荐</h2>
      <ul>
        {dede:arclist row='6' titlelen='50' flag='c'}
        <li> <i class="ztpic"><a href="[field:arcurl/]"><img src="[field:picname/]"></a></i> <b>[field:title/]</b><span>[field:description function="cn_substr(@me,120)"/]...</span><a href="[field:arcurl/]" class="readmore">文章阅读</a> </li>
        {/dede:arclist}
      </ul>
    </div> -->
    <div class="ad whitebg">
      
    </div>
    <div class="whitebg bloglist">
      <h2 class="htitle">最新博文</h2>
      <ul>
        <?php
        foreach ($data['arts'] as $key => $value) {
          $preimgs=json_decode($value['preimgs'],true);
          ?>
          <li>
            <h3 class="blogtitle"><a href="./art.php?id=<?php echo $value['id'];?>&nid=<?php echo $value['nid'];?>"><?php echo $value['title'];?></a></h3>
            <span class="blogpic imgscale"><i><a href="./list.php?id=<?php echo $value['nid'];?>"><?php echo $value['nav'];?></a></i><a href="./art.php?id=<?php echo $value['id'];?>&nid=<?php echo $value['nid'];?>" title="<?php echo $value['title'];?>"><img src="<?php echo count($preimgs)?$preimgs[0]:$data['global']['img0'];?>" alt="<?php echo $value['title'];?>"></a></span>
            <p class="blogtext"><?php echo $value['pre'];?>... </p>
            <p class="bloginfo"><span></span><span><?php echo date("Y-m-d",$value['update_time']);?></span><span>【<a href="./list.php?id=<?php echo $value['nid'];?>"><?php echo $value['nav'];?></a>】</span></p>
            <a href="./art.php?id=<?php echo $value['id'];?>&nid=<?php echo $value['nid'];?>" class="viewmore">阅读更多</a> </li>
          <?php
        }
        ?>
      </ul>
    </div>
    <!--bloglist end--> 
  </div>
  <div class="rbox">
    <div class="card">
      <h2>如果有关部门认为此网站需要关闭，可通过以下任意方式告知。</h2>
      <p>邮箱：<?php echo $data['global']['email'];?></p>
      <p>QQ：<?php echo $data['global']['qq'];?></p>
      <p>微信：<?php echo $data['global']['wechat'];?></p>
      <p>微信公众号：<?php echo $data['global']['wepub'];?></p>
      <!-- <p>现居：<?php echo $data['global']['cfg_xj'];?></p>
      <p>Email：<?php echo $data['global']['cfg_email'];?></p> -->
      <!-- <ul class="linkmore">
        <li><a href="<?php echo $data['global']['cmspath'];?>" class="iconfont icon-zhuye"></a></li>
        <li><a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=<?php echo $data['global']['cfg_email'];?>" target="_blank" class="iconfont icon-youxiang"></a></li>
        <li><a href="http://wpa.qq.com/msgrd?v=3&uin=<?php echo $data['global']['cfg_qq'];?>&site=qq&menu=yes" target="_blank" class="iconfont icon---"></a></li>
        <li id="weixin"><a href="#" class="iconfont icon-weixin"></a><i><img src="<?php echo $data['global']['cmspath'];?>skin/images/weixin.png"></i></li>
      </ul> -->
    </div>
    <div class="whitebg paihang">
      <h2 class="htitle">点击排行</h2>
      <?php
      $preimgs_now=json_decode($data['arts_view'][0]['preimg'],true);
      ?>
      <section class="topnews imgscale"><a href="./art.php?id=<?php echo $data['arts_view'][0]['id'];?>"><img src="<?php echo $preimgs_now[0];?>"><span><?php echo $data['arts_view'][0]['title'];?></span></a></section>
      <ul>
        <?php 
        foreach ($data['arts_view'] as $key => $value) {
          if($key>0){
          ?>
          <li><i></i><a href="./art.php?id=<?php echo $value['id'];?>&nid=<?php echo $value['nid'];?>" title="<?php echo $value['title'];?>"><?php echo $value['title'];?></a></li>
          <?php
          }
        }
        ?>
        
        
      </ul>
    </div>
    <div class="whitebg cloud">
      <h2 class="htitle">标签云</h2>
      <ul>
        <?php 
        foreach ($data['tags'] as $key => $value) {
          ?>
          <a href='./tag.php?id=<?php echo $value['id'];?>'><?php echo $value['title'];?></a>
          <?php
        }
        ?>
      </ul>
    </div>
    
    
    <div class="whitebg tongji">
      <h2 class="htitle">站点信息</h2>
      <ul>
        <li><b>文章统计</b>：<a><?php echo $data['art_count'];?></a>篇文章</li>
        <li><b>标签管理</b>：<a href="<?php echo $data['global']['cmspath'];?>tags.php">标签云</a></li>
        <!-- <li><b>微信公众号</b>：扫描二维码，关注我们</li>
        <li class="tongji_gzh"><img src='<?php echo $data['global']['cmspath'];?>skin/images/weixin.png'></li> -->
      </ul>
    </div>
    <div class="links whitebg">
      <h2 class="htitle">友情链接</h2>
      <ul>
        <?php
        foreach ($data['links'] as $key => $value) {
          ?>
          <li><a target="_blank" href="<?php echo $value['href'];?>"><?php echo $value['title'];?></a></li>
          <?php
        }
        ?>
      </ul>
    </div>
  </div>
</article>
<?php include "./footer.php";?>
</body>
</html>
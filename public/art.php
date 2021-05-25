<?php
  include "../ly/start.php";
  $data=$ly->execute("/index/index/art");
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $data['art']['title'];?>_<?php echo $data['global']['webname'];?></title>
<meta name="keywords" content="{dede:field.keywords/}" />
<meta name="description" content="{dede:field.description function='html2text(@me)'/}" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<?php echo $data['global']['cmspath'];?>skin/css/base.css" rel="stylesheet">
<link href="<?php echo $data['global']['cmspath'];?>skin/css/m.css" rel="stylesheet">
<script src="<?php echo $data['global']['cmspath'];?>skin/js/jquery-1.8.3.min.js" ></script>
<script src="<?php echo $data['global']['cmspath'];?>skin/js/comm.js"></script>
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
    <div class="ad whitebg">
      <div class="pcd_ad">
        {dede:myad name='1'/}
      </div>
    </div>
    <div class="content_box whitebg">
      <h2 class="htitle"><span class="con_nav">您现在的位置是：<a href="/">首页</a>><a href="./list.php?id=<?php echo $data['nav']['id'];?>"><?php echo $data['nav']['title'];?></a></h2>
      <h1 class="con_tilte"><?php echo $data['art']['title'];?></h1>
      <p class="bloginfo"><span>{<?php echo date("Y-m-d",$data['art']['create_time']);?></span><span> <a href="./list.php?id=<?php echo $data['nav']['id'];?>"><?php echo $data['nav']['title'];?></a> </span><span><?php echo $data['art']['view'];?>次浏览</span></p>
      <p class="con_info"><b>简介</b><?php echo $data['art']['pre'];?>...</p>
      <div class="con_text"> <?php echo $data['art']['content'];?>
        <div class="pagelist"></div>
        <p>Tags：
          <?php 
          foreach ($data['art']['tags'] as $key => $value) {
            ?>
          <a href='./tag.php?id=<?php echo $value['id'];?>'><?php echo $value['title'];?></a>&nbsp;
            <?php
          }  
          ?>
        </p>
        <p class="share"><b>转载：</b>感谢您对网站平台的认可，以及对我们原创作品以及文章的青睐，非常欢迎各位朋友分享到个人站长或者朋友圈，但转载请说明文章出处“来源演示站”。</p>
        <div class="nextinfo">
          <?php
          if($data['prev']){
            ?>
          <p>上一篇：<a href="./art.php?id=<?php echo $data['prev']['id'];?>&nid=<?php echo $data['prev']['nid'];?>"></a></p>
            <?php
          }else{
            ?>
            <p>上一篇：没有上一篇了</p>
            <?php
          }
          ?>
          <?php
          if($data['next']){
            ?>
          <p>下一篇：<a href="./art.php?id=<?php echo $data['next']['id'];?>&nid=<?php echo $data['next']['nid'];?>"></a></p>
            <?php
          }else{
            ?>
            <p>下一篇：没有下一篇了</p>
            <?php
          }
          ?>
          
        </div>
      </div>
    </div>
    <div class="ad whitebg">
      <div class="pcd_ad">
        {dede:myad name='1'/}
      </div>
    </div>
    <div class="whitebg">
      <h2 class="htitle">相关文章</h2>
      <ul class="otherlink">
        <?php 
        foreach ($data['arts_nav'] as $key => $value) {
          ?>
        <li><a href="./art.php?id=<?php echo $value['id'];?>&nid=<?php echo $value['nid'];?>" title="<?php echo $value['title'];?>"><?php echo $value['title'];?></a></li>
          <?php
        }
        ?>
      </ul>
    </div>
    <!-- <div class="whitebg">
      <h2 class="htitle">随机图文</h2>
      <ul class="xiangsi">
        {dede:arclist row='4' titlelen='50' orderby='click'}
        <li><a href="[field:arcurl/]"><i><img src="[field:picname/]"></i>
          <p>[field:title/]</p>
          <span>[field:description function="cn_substr(@me,100)"/]...</span></a></li>
        {/dede:arclist}
      </ul>
    </div> -->
  </div>
  <!--lbox end-->
  <div class="rbox">
    <div class="whitebg paihang">
      <h2 class="htitle">本栏文章</h2>
      <?php
      $preimgs_now=json_decode($data['arts_nav'][0]['preimg'],true);
      ?>
      <section class="topnews imgscale"><a href="./art.php?id=<?php echo $data['arts_nav'][0]['id'];?>"><img src="<?php echo $preimgs_now[0];?>"><span><?php echo $data['arts_nav'][0]['title'];?></span></a></section>
      <ul>
        <?php 
        foreach ($data['arts_nav'] as $key => $value) {
          if($key>0){
          ?>
          <li><i></i><a href="./art.php?id=<?php echo $value['id'];?>&nid=<?php echo $value['nid'];?>" title="<?php echo $value['title'];?>"><?php echo $value['title'];?></a></li>
          <?php
          }
        }
        ?>
        
        
      </ul>
    </div>
    <div class="ad whitebg imgscale">
      {dede:myad name='1'/}
    </div>
    <div class="whitebg tuijian">
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
    <div class="ad whitebg imgscale">
      {dede:myad name='1'/}
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
  </div>
</article>
<?php include "./footer.php";?>
</body>
</html>

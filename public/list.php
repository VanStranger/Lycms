<?php
  include "../ly/start.php";
  $data=$ly->execute("/index/index/nav");
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>{dede:field.title/}_<?php echo $data['global']['webname'];?></title>
<meta name="keywords" content="{dede:field name='keywords'/}" />
<meta name="description" content="{dede:field name='description' function='html2text(@me)'/}" />
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
<!--top begin--> 
<?php include "./head.php";?>
<!--top end-->
<article> 
  <!--lbox begin-->
  <div class="lbox">
    <div class="whitebg lanmu"> <img src="<?php echo $data['global']['cmspath'];?>skin/images/lm.jpg">
      <h1><?php echo $data['nav']['title'];?></h1>
      <p><?php echo $data['nav']['subtitle']?:"暂无简介";?></p>
    </div>
    <div class="whitebg bloglist">
      <h2 class="htitle">最近更新</h2>
      <ul>
        <?php
        foreach ($data['newarts'] as $key => $value) {
          $preimgs=json_decode($value['preimg'],true);
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
      <!--pagelist-->
      <div class="pagelist">{dede:pagelist listitem="index,end,pre,next,pageno" listsize="1"/}</div>
      <!--pagelist end--> 
    </div>
    <!--bloglist end--> 
  </div>
  <div class="rbox">
    <div class="whitebg paihang">
      <h2 class="htitle">点击排行</h2>
      
      <?php
      $preimgs_now=json_decode($data['viewarts'][0]['preimg'],true);
      ?>
      <section class="topnews imgscale"><a href="./art.php?id=<?php echo $data['viewarts'][0]['id'];?>"><img src="<?php echo $preimgs_now[0];?>"><span><?php echo $data['viewarts'][0]['title'];?></span></a></section>
      <ul>
        <?php 
        foreach ($data['viewarts'] as $key => $value) {
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
        <li><b>微信公众号</b>：扫描二维码，关注我们</li>
        <li class="tongji_gzh"><img src='<?php echo $data['global']['cmspath'];?>skin/images/weixin.png'></li>
      </ul>
    </div>
  </div>
</article>
<?php include "./footer.php";?>
</body>
</html>

<?php
  include "../ly/start.php";
  $data=$ly->execute("/index/index/nav");
?>
<!doctype html>
<html lang="zh">
<?php include "./tongji.php";?>
<head>
<meta charset="utf-8">
<title>{dede:field.title/}_<?php echo $data['global']['webname'];?></title>
<meta name="keywords" content="<?php echo $data['global']['keywords'];?>" />
<meta name="description" content="<?php echo $data['global']['description'];?>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<?php echo $data['global']['cmspath'];?>skin/css/base.css" rel="stylesheet">
<link href="<?php echo $data['global']['cmspath'];?>skin/css/m.css" rel="stylesheet">
<script src="<?php echo $data['global']['cmspath'];?>skin/js/jquery-1.8.3.min.js" ></script>
<script src="<?php echo $data['global']['cmspath'];?>skin/js/comm.js"></script>
<link rel="icon" href="favicon.png"  type="image/x-icon">
<!--[if lt IE 9]>
<script src="<?php echo $data['global']['cmspath'];?>skin/js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<!--top begin--> 
<?php include "./head.php";?>
<!--top end-->
<article>
  <div class="whitebg about">
  <div class="ab_box">
    <h3><?php echo $data['nav']['title'];?></h3>
  </div>
  <?php echo $data['nav']['content'];?>
</article>
<?php include "./footer.php";?>
</body>
</html>
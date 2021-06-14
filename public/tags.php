<?php
  include "../ly/start.php";
  $data=$ly->execute("/index/index/tags");
?>
<!doctype html>
<html lang="zh">
<?php include "./tongji.php";?>
<head>
<meta charset="utf-8">
<title>标签列表_<?php echo $data['global']['webname'];?></title>
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
<style>
.taglist a {
	display: inline-block;
	overflow: hidden;
	width: 71px;
	height: 30px;
	line-height: 30px;
	font-size: 12px;
	text-align: center;
	color: #555;
	font-family: "microsoft yahei";
	font-weight: 100;
	word-wrap: break-word;
	white-space: nowrap;
	float: left;
	margin: 9px 0 0 9px;
	border-radius: 2px;
	background: #FFF;
	border: 1px solid #D8D8D8;
	-webkit-box-shadow: 0px 1px 1px rgba(50, 50, 50, 0.1);
	-moz-transition: .2s ease-in-out;
	-webkit-transition: .2s ease-in-out;
	transition: .2s ease-in-out;
}
.taglist a:hover {
	text-decoration: none;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.22);
	background-color: #ff4800;
	border-color: #ff4800;
	color: #fff;
}
</style>
</head>
<body>
<!--top begin--> 
<?php include "./head.php";?>
<!--top end-->
<article>
  <div class="whitebg taglist">
    <h2 class="htitle">标签云</h2>
    <?php
		foreach ($data['tags'] as $key => $value) {
			?>
		<a href='./tag.php?id=<?php echo $value['id'];?>' style="font-size: 14px"><?php echo $value['title'];?></a>
			<?php
		}
		?>
	</div>
</article>
<?php include "./footer.php";?>
</body>
</html>
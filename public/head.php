<header id="header">
  <div class="navbox">
    <h2 id="mnavh"><span class="navicon"></span></h2>
    <div class="logo"><a href="<?php echo $data['global']['cmspath'];?>"><?php echo $data['global']['webname'];?></a></div>
    <nav>
      <ul id="starlist">
        <li><a href="<?php echo $data['global']['cmspath'];?>" <?php echo $_SERVER['SCRIPT_NAME']==="/index.php"?'id="selected"':"";?>>首页</a></li>
        <?php
        foreach ($data['navs'] as $key => $value) {
          if($value['pid']===0){
            ?>
        <li><a href="/<?php echo $value['type']===0?'list.php':'navart.php';?>?id=<?php echo $value['id'];?>" <?php echo ($_SERVER['SCRIPT_NAME']==="/list.php" && (intval($data['input']['id'])===$value['id'] || intval($data['input']['pid'])===$value['id']))?'id="selected"':"";?>><?php echo $value['title'];?></a>
        <ul class="sub">
        <?php
          foreach ($data['navs'] as $k => $v) {
            if($v['pid']===$value['id']){
              ?>
          <li><a href="/list.php?id=<?php echo $v['id'];?>&pid=<?php echo $value['id'];?>"><?php echo $v['title'];?></a></li>
        <?php
            } 
          }
        ?>
        </ul>
        <span></span></li>
        <?php
          } 
        }
        ?>
        
      </ul>
    </nav>
    <div class="searchico"></div>
  </div>
</header>
<div class="searchbox">
  <div class="search">
    <form  name="formsearch" action="<?php echo $data['global']['cmspath'];?>search.php">
      <input type="hidden" name="kwtype" value="0" />
      <input name="q" class="input_text" value="请输入关键字词" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}" type="text">
      <input name="submit" class="input_submit" value="搜索" type="submit">
    </form>
  </div>
  <div class="searchclose"></div>
</div>

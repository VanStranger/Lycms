<?php
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>{dede:global.cfg_webname/}</title>
<meta name="description" content="{dede:global.cfg_description/}" />
<meta name="keywords" content="{dede:global.cfg_keywords/}" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/skin/css/base.css" rel="stylesheet">
<link href="/skin/css/m.css" rel="stylesheet">
<script src="/skin/js/jquery-1.8.3.min.js" ></script>
<script src="/skin/js/comm.js"></script>
<!--[if lt IE 9]>
<script src="{dede:global.cfg_cmspath/}/skin/js/modernizr.js"></script>
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
        <div id="banner" class="fader"> {dede:arclist row='5' titlelen='50' flag='f'}
          <li class="slide" ><a href="[field:arcurl/]"><img src="[field:picname/]"></a></li>
          {/dede:arclist}
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
        {dede:arclist row='2' titlelen='50' flag='c'}
        <li><a href="[field:arcurl/]"><img src="[field:picname/]" alt="[field:title/]"><span>[field:title/]</span></a></li>
        {/dede:arclist}
      </ul>
    </div>
    <!--headline end-->
    <div class="clearblank"></div>
    <div class="tab_box whitebg">
      <div class="tab_buttons">
        <ul>
          {dede:channel type='top' row='8'}
          <li [field:global name=autoindex runphp="yes"](@me==0)? @me="class='newscurrent'":@me="";[/field:global]>[field:typename/]</li>
          {/dede:channel}
        </ul>
      </div>
      <div class="newstab"> {dede:channelartlist typeid='top' row='8'}
        <div class="newsitem">
          <div class="newspic">
            <ul>
              {dede:arclist limit='0,2' titlelen='50' orderby='pubdate'}
              <li><a href="[field:arcurl/]"><img src="[field:picname/]"><span>[field:title/]</span></a></li>
              {/dede:arclist}
            </ul>
          </div>
          <ul class="newslist">
            {dede:arclist limit='2,5' titlelen='50' orderby='pubdate'}
            <li><i></i><a href="[field:arcurl/]" title="[field:title/]">[field:title/]</a>
              <p>[field:description function="cn_substr(@me,300)"/]...</p>
            </li>
            {/dede:arclist}
          </ul>
        </div>
        {/dede:channelartlist} </div>
    </div>
    
    <!--tab_box end-->
    <div class="zhuanti whitebg">
      <h2 class="htitle"><span class="hnav"> {dede:channel type='son' typeid='1'} <a href='[field:typeurl/]'>[field:typename/]</a>&nbsp;{/dede:channel} </span>特别推荐</h2>
      <ul>
        {dede:arclist row='6' titlelen='50' flag='c'}
        <li> <i class="ztpic"><a href="[field:arcurl/]"><img src="[field:picname/]"></a></i> <b>[field:title/]</b><span>[field:description function="cn_substr(@me,120)"/]...</span><a href="[field:arcurl/]" class="readmore">文章阅读</a> </li>
        {/dede:arclist}
      </ul>
    </div>
    <div class="ad whitebg">
      {dede:myad name='0'/}
    </div>
    <div class="whitebg bloglist">
      <h2 class="htitle">最新博文</h2>
      <ul>
        {dede:arclist row='20' titlelen='50' orderby='pubdate'}
        <li>
          <h3 class="blogtitle"> [field:global runphp='yes' name=autoindex] 
            $a="<b>【顶】</b>"; 
            if(@me>3)@me=$b; 
            else@me=$a; 
            [/field:global] <a href="[field:arcurl/]">[field:title/]</a></h3>
          <span class="blogpic imgscale"><i><a href="[field:typeurl/]">[field:typename/]</a></i><a href="[field:arcurl/]" title="[field:title/]"><img src="[field:picname/]" alt="[field:title/]"></a></span>
          <p class="blogtext">[field:description function="cn_substr(@me,200)"/]... </p>
          <p class="bloginfo"><span></span><span>[field:pubdate function="MyDate('Y-m-d',@me)"/]</span><span>【<a href="[field:typeurl/]">[field:typename/]</a>】</span></p>
          <a href="[field:arcurl/]" class="viewmore">阅读更多</a> </li>
        {/dede:arclist}
      </ul>
    </div>
    <!--bloglist end--> 
  </div>
  <div class="rbox">
    <div class="card">
      <h2>我的名片</h2>
      <p>网名：{dede:global.cfg_wm/}</p>
      <p>职业：{dede:global.cfg_zy/}</p>
      <p>现居：{dede:global.cfg_xj/}</p>
      <p>Email：{dede:global.cfg_email/}</p>
      <ul class="linkmore">
        <li><a href="{dede:global.cfg_cmspath/}/" class="iconfont icon-zhuye"></a></li>
        <li><a href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email={dede:global.cfg_email/}" target="_blank" class="iconfont icon-youxiang"></a></li>
        <li><a href="http://wpa.qq.com/msgrd?v=3&uin={dede:global.cfg_qq/}&site=qq&menu=yes" target="_blank" class="iconfont icon---"></a></li>
        <li id="weixin"><a href="#" class="iconfont icon-weixin"></a><i><img src="{dede:global.cfg_cmspath/}/skin/images/weixin.png"></i></li>
      </ul>
    </div>
    <div class="whitebg notice">
      <h2 class="htitle">最近更新</h2>
      <ul>
        {dede:arclist row='3' titlelen='50' orderby='pubdate'}
        <li><a href="[field:arcurl/]" title="[field:title/]">[field:title/]</a></li>
        {/dede:arclist}
      </ul>
    </div>
    <div class="whitebg paihang">
      <h2 class="htitle">点击排行</h2>
      {dede:arclist limit='0,1' titlelen='50' orderby='click'}
      <section class="topnews imgscale"><a href="[field:arcurl/]"><img src="[field:picname/]"><span>[field:title/]</span></a></section>
      {/dede:arclist}
      <ul>
        {dede:arclist limit='1,8' titlelen='50' orderby='click'}
        <li><i></i><a href="[field:arcurl/]" title="[field:title/]">[field:title/]</a></li>
        {/dede:arclist}
      </ul>
    </div>
    <div class="ad whitebg imgscale">
      {dede:myad name='0'/}
    </div>
    <div class="whitebg tuijian">
      <h2 class="htitle">站长推荐</h2>
      {dede:arclist limit='0,1' titlelen='50' flag='c'}
      <section class="topnews imgscale"><a href="[field:arcurl/]"><img src="[field:picname/]"><span>[field:title/]</span></a></section>
      {/dede:arclist}
      <ul>
        {dede:arclist limit='1,8' titlelen='50' flag='c'}
        <li><a href="[field:arcurl/]" title="[field:title/]"><i><img src="[field:picname/]"></i>
          <p>[field:title/]</p>
          </a></li>
        {/dede:arclist}
      </ul>
    </div>
    <div class="ad whitebg imgscale">
      {dede:myad name='0'/}
    </div>
    <div class="whitebg wenzi">
      <h2 class="htitle">猜你喜欢</h2>
      <ul>
        {dede:arclist row='10' titlelen='50' orderby='pubdate'}
        <li><a href="[field:arcurl/]">[field:title/]</a></li>
        {/dede:arclist}
      </ul>
    </div>
    <div class="ad whitebg imgscale">
      {dede:myad name='0'/}
    </div>
    <div class="whitebg tongji">
      <h2 class="htitle">站点信息</h2>
      <ul>
        <li><b>文章统计</b>：<a>{dede:sql sql="select count(*) as c from dede_archives where channel=1"}[field:c /]{/dede:sql}</a>篇文章</li>
        <li><b>标签管理</b>：<a href="{dede:global.cfg_cmspath/}/tags.php">标签云</a></li>
        <li><b>微信公众号</b>：扫描二维码，关注我们</li>
        <li class="tongji_gzh"><img src='{dede:global.cfg_cmspath/}/skin/images/weixin.png'></li>
      </ul>
    </div>
    <div class="links whitebg">
      <h2 class="htitle">友情链接</h2>
      <ul>
        {dede:flink titlelen='10' row='10' type='text'}
        <li>[field:link /]</li>
        {/dede:flink}
      </ul>
    </div>
  </div>
</article>
<?php include "./footer.php";?>
</body>
</html>
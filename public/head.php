<header id="header">
  <div class="navbox">
    <h2 id="mnavh"><span class="navicon"></span></h2>
    <div class="logo"><a href="{dede:global.cfg_cmspath/}/">{dede:global.cfg_webname/}</a></div>
    <nav>
      <ul id="starlist">
        <li><a href="{dede:global.cfg_cmspath/}/" {dede:field name=typeid runphp="yes"}(@me=="")? @me="id='selected'":@me="";{/dede:field}>首页</a></li>
        {dede:channelartlist typeid='top'  row='10' currentstyle='selected'}
        <li {dede:field name=typeid runphp="yes"}
global $dsql;
$sql = "SELECT id From `dede_arctype` WHERE reid='@me' And ishidden<>1 order by sortrank asc limit 0, 100 ";   
$row = $dsql->GetOne($sql);      
          @me=is_array($row)?'class="menu"':'';
          {/dede:field}><a href="{dede:field name='typeurl'/}" id='{dede:field.currentstyle/}'>{dede:field name='typename'/}</a>
          <ul class="sub">
            {dede:channel type='son' noself='yes'}
            <li><a href="[field:typeurl/]">[field:typename/]</a></li>
            {/dede:channel}
          </ul>
          <span></span></li>
        {/dede:channelartlist}
      </ul>
    </nav>
    <div class="searchico"></div>
  </div>
</header>
<div class="searchbox">
  <div class="search">
    <form  name="formsearch" action="{dede:global.cfg_cmsurl/}/plus/search.php">
      <input type="hidden" name="kwtype" value="0" />
      <input name="q" class="input_text" value="请输入关键字词" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}" type="text">
      <input name="submit" class="input_submit" value="搜索" type="submit">
    </form>
  </div>
  <div class="searchclose"></div>
</div>

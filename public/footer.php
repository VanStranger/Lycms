<footer>
  <div class="box">
    <div class="wxbox">
      <ul>
        <li><img src="<?php echo $data['global']['cmspath'];?>skin/images/weixin.jpg"><span>微信公众号</span></li>
      </ul>
    </div>
    <div class="endnav">
      <p><b>站点声明：</b></p>
      <p>1、本站内容均搬运自网络，安全起见个人不予评鉴，也不开评论。</p>
      <p>2、本站接受投稿，投稿邮箱：godlikeshows@126.com</p>
      <p><?php echo $data['global']['cfg_powerby'];?> 备案号：<a href="https://beian.miit.gov.cn/" target="_blank"><?php echo $data['global']['beian'];?></a></p>
    </div>
  </div>
  <a href="#">
  <div class="top"></div>
  </a> </footer>
<script type="text/javascript" src="<?php echo $data['global']['cmspath'];?>skin/js/theia-sticky-sidebar.min.js"></script> 
<script type="text/javascript">
  jQuery(document).ready(function() {
    jQuery('.rbox').theiaStickySidebar({
      // Settings
      additionalMarginTop: 30
    });
  });
</script> 

CREATE DATABASE IF NOT EXISTS `dx` DEFAULT CHARSET utf8 COLLATE utf8_general_mysql500_ci;
USE `dx`;
DROP TABLE IF EXISTS `art_tag`;
CREATE TABLE `art_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '作者',
  `tagid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'navid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authorid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '作者',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0普通1推荐',
  `status` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0未审核，1通过，2驳回',
  `nid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'navid',
  `title` varchar(50) NOT NULL DEFAULT '',
  `preimg` varchar(50) NOT NULL DEFAULT '',
  `preimgs` varchar(200) NOT NULL DEFAULT '[]' COMMENT '缩略图',
  `pre` char(200) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '内容',
  `jubao` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '举报',
  `view` int(10) unsigned NOT NULL DEFAULT 0,
  `comments` int(10) unsigned NOT NULL DEFAULT 0,
  `create_time` int(11) unsigned NOT NULL DEFAULT 0,
  `update_time` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT 0,
  `img` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `href` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `pre` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `weight` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
DROP TABLE IF EXISTS `banner_type`;
CREATE TABLE `banner_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `key` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `href` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `img` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
DROP TABLE IF EXISTS `nav`;
CREATE TABLE `nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级nav的id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0:列表，1：封面',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subtitle` varchar(50) NOT NULL DEFAULT '',
  `weight` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `nav_art`;
CREATE TABLE `nav_art` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navid` int(10) unsigned NOT NULL DEFAULT 0,
  `content` mediumtext COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `des` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `permit` text COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级tag的id',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subtitle` varchar(50) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` tinyint(4) NOT NULL DEFAULT 0,
  `password` char(32) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `loginname` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0:男，1：女',
  `photo` char(100) DEFAULT './img/photos/0.png' COMMENT '图片地址',
  `email` char(50) NOT NULL DEFAULT '',
  `userinfo` char(50) NOT NULL DEFAULT '',
  `token` char(32) NOT NULL DEFAULT '',
  `view` int(10) unsigned NOT NULL DEFAULT 0,
  `guanzhu` int(10) unsigned NOT NULL DEFAULT 0,
  `lastlogin` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
INSERT INTO `art_tag` VALUES 
(2,2,2),
(3,2,5),
(6,5,1),
(7,5,5),
(13,6,2),
(19,7,3),
(20,7,6),
(21,8,7),
(22,8,6),
(23,4,4),
(24,4,5);
INSERT INTO `article` VALUES 
(2,0,1,0,5,'天津大学，2021年，男留学生进女更衣室事件','/uploads/60b6d43a26ae3.jpg','["/uploads/60b6d43a26ae3.jpg","/uploads/60b6d4eda555e.jpg"]','','<p></p><p>2021年，天津大学，3个男留学生进入女更衣室，校方调查称“系误入”。</p><p>梗概：</p><p></p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d43a26ae3.jpg"/></div><p></p><p>校方回应截图：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d47295d50.jpeg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d47747e8e.png"/></div><p>过程：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d49d99f47.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d4eda555e.jpg"/></div><p></p>',0,16,0,1493261845,1493261845),
(4,0,0,0,5,'暨南大学，2020年，快递禁入事件','/uploads/60b6d1c1e5e3a.jpg','["/uploads/60b6d17d017d6.jpg"]','','<p>时间是2020年</p><p>概述：</p><p></p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d1667fe8b.jpg"/></div><p>精选回复：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d17c849f6.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d17ce74ba.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d17d017d6.jpg"/></div><p></p>',0,6,0,1622619100,1622944200),
(5,0,1,0,5,'山东大学，学伴事件','/uploads/60b6d43a26ae3.jpg','["/uploads/60b6d5a35d37a.jpg"]','','<p>学伴项目：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d57969e4f.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d57c1cd07.jpg"/></div><p>校方后续回应：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d5a35d37a.jpg"/></div><p></p>',0,1,0,1622619100,1622619100),
(7,0,0,0,8,'央视公众号，2021/03/17，发布爹味文章','/uploads/60bc1bcd40f64.jpg','["/uploads/60bc1bb87578f.jpg"]','','<p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60bc1bb87578f.jpg"/></div><p></p>',0,5,0,1622940622,1622940745),
(8,0,0,0,2,'杨笠，2020年，男人普通却自信没有底线事件','/uploads/60bc28ef5de80.jpg','["/uploads/60bc28d6d0acc.jpg"]','','<p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bc283d3271f.jpg"/></div><p></p><p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bc28d6d0acc.jpg"/></div><p></p>',0,5,0,1622943985,1622943985);
INSERT INTO `banner` VALUES 
(1,1,'/imgs/2.jpg','央视公众号','/art.php?id=7&nid=8','',0),
(2,1,'/uploads/60bc2a4dac64d.jpg','dsf','/art.php?id=8&nid=2','sdf',0);
INSERT INTO `banner_type` VALUES 
(1,'首页轮播');
INSERT INTO `config` VALUES 
(1,'网站名','webname','wantGreatAgain'),
(2,'安装路径','cmspath','/'),
(3,'df','email','fanjunjiei@126.com'),
(4,'','qq',1301637928),
(5,'','wechat','yor365'),
(6,'','wepub','成功那么难吗'),
(9,'备案号','beian','冀ICP备20003740号');
INSERT INTO `links` VALUES 
(1,0,'https://zhihu.com','知乎','');
INSERT INTO `nav` VALUES 
(1,0,0,'大学','青年最富有朝气、最富有梦想，青年兴则国家兴，青年强则国家强。
而青年大多是大学培养出来的。',2),
(2,0,0,'两性','挑动性别对立，就可引流，就能得到死忠粉，就能赚钱。
这些人，才是国家的寄生虫。',0),
(3,0,1,'关于','简介',0),
(4,1,0,'赏善令','',0),
(5,1,0,'罚恶令','',0),
(8,0,0,'曾仰望的','我曾凝望，曾是航向的日出',2);
INSERT INTO `nav_art` VALUES 
(1,3,'&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 关于我为什么要做这个网站。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 如果要对我做一个分类，我想我一定是属于改良派。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 大学毕业的时候，我提出过一个假想：社会进步的速度会越慢，直至完全停止甚至开始倒退。当时的我认为，牺牲是社会进步的必要条件，而随着物质条件的逐渐提高，即使有较大的阶级差距大概率不会导致低阶层人员物质方面无法生存。过去的暴力推翻方式近乎不可能，社会进步的速度也将逐渐停滞。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 今后的社会进步方式，唯有改良。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 高考之前读过太多的日本夏令营、德国油纸包、美国小学生，也曾认为外国的月亮更圆过。后来经过彭宇案、北电侯亮平事件、红黄蓝事件、甘肃老师怀疑学生偷口红事件、李心草事件……之后，感觉媒体不过是资本的戏子。对资本不利的热搜总是会很快的消失。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 这让我非常的困惑，这些消失的热搜究竟是因为为了面子光的肉食者要求删除，还是因为资本的铜臭的利诱而由平台删除。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 于是想到如果有这样一个平台，这个社会会更好一点。它直接对最高层比如主席或者国务院负责。各级政府需要在上面将需要下级政府人员和下下级政府人员知道的信息向其公布。那么村民能够了解到乡对村的政策等就能对村委形成监督，村对乡形成监督，依次向上，就成促进政府的廉政。公民遇到不公之事，直接@相应机关，其上级机关也会收到并促督其解决。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 当时有了这个想法后，我很想让大家知道我这个想法。恰逢老板欠我几个月工资不肯给，那个老板又曾有暴力行为。于是决定在美拍上录制视频说明这个想法和可能会被打甚至丧命后，到当地法院起诉，如果老板能给我工资固然不错。如果老板打我一顿甚至打死我，那么我这个视频就会火，大家就会知道我的这个想法，可能会能为社会做一点微小的贡献，那也算不枉此生。后来老板给了我钱，并跟我说：“是啊，当时可以先找几个人打你一顿的。”，我跟他说，“是啊，其实现在也还可以的。”他笑了笑，我也笑了笑。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 现在想来，我得感谢他没有打我，尤其是现在柳州钢琴女教师讨薪被打至今无后续的今天，我深深的相信，我这条命，不值那么多的关注。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 我也曾经心中有光，并为此不惜此身。但今年（2021），它熄灭过一段时间。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 从《青年报》的《做题家”们的怨气，为何要往丁真身上撒？》，到《人民日报》的《垃圾男人分类图鉴》，到《央视新闻》微博的“货拉拉司机应该制止并紧急刹车，司机未采取任何避免措施”，到《央视网公众号》的《对不起，你“爹味”超标了》，再到CCTV13报道的“脱口秀演员杨笠因为其言论“男人普通却自信”被举报，生活过得不好””。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 起初那些媒体我会认为是我们的媒体被地方势力渗透了，直到最后一个，电视台，央视！那一刻我感觉这个世界一下子变成了灰色，我的一切行为都失去了意义。我将来的努力也不会有任何意义。像躯壳失去了灵魂。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 时间会让麻木变淡，几分钟后，我就想那我也去一心搞钱吧。幸运的是，几天后我被一篇知乎回答拯救了。他说微博为了利益连共青团都封。可见，天并不是黑的，黑的不过是乌云而已。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 过了几天，天津大学留学生事件出来，我想起我曾想要把个学校的新闻搬运在一起的计划。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 所谓山顶遥远，路在脚下。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');
INSERT INTO `role` VALUES 
(1,'管理员','电饭锅','["/cont","/cont/navs","/cont/arts","/cont/tags","/cont/banners","/sys","/sys/setting","/sys/role","/sys/user","/sys/databack"]'),
(2,'用户','发过火 ','["/tasks/lists","/liucheng/myCreated"]');
INSERT INTO `tag` VALUES 
(1,0,'山东大学','',0),
(2,0,'天津大学','',0),
(3,0,'央视','',0),
(4,0,'暨南大学','',0),
(5,0,'留学生','',0),
(6,0,'两性','挑动性别对立的人，才是国家的蛀虫。',0),
(7,0,'杨笠','',0);
INSERT INTO `user` VALUES 
(1,1,'21232f297a57a5a743894a0e4a801fc3','管理员','admin',0,'/uploads/photos/0.jpg','f@126.com','','8e5c3200e1fbaf8e019c3d6c8f268ade',0,0,1623117643);

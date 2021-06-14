-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.3.12-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 导出  表 dx.article 结构
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  dx.article 的数据：~16 rows (大约)
DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`id`, `authorid`, `type`, `status`, `nid`, `title`, `preimg`, `preimgs`, `pre`, `content`, `jubao`, `view`, `comments`, `create_time`, `update_time`) VALUES
  (2, 0, 1, 0, 5, '天津大学，2021年，男留学生进女更衣室事件', '/uploads/60b6d43a26ae3.jpg', '["/uploads/60b6d43a26ae3.jpg","/uploads/60b6d4eda555e.jpg"]', '', '<p></p><p>2021年，天津大学，3个男留学生进入女更衣室，校方调查称“系误入”。</p><p>梗概：</p><p></p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d43a26ae3.jpg"/></div><p></p><p>校方回应截图：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d47295d50.jpeg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d47747e8e.png"/></div><p>过程：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d49d99f47.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d4eda555e.jpg"/></div><p></p>', 0, 19, 0, 1493261845, 1493261845),
  (4, 0, 0, 0, 5, '暨南大学，2020年，快递禁入事件', '/uploads/60b6d1c1e5e3a.jpg', '["/uploads/60b6d17d017d6.jpg"]', '', '<p>时间是2020年</p><p>概述：</p><p></p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d1667fe8b.jpg"/></div><p>精选回复：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d17c849f6.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d17ce74ba.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d17d017d6.jpg"/></div><p></p>', 0, 6, 0, 1622619100, 1623134181),
  (5, 0, 1, 0, 5, '山东大学，学伴事件', '/uploads/60b6d43a26ae3.jpg', '["/uploads/60b6d5a35d37a.jpg"]', '', '<p>学伴项目：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d57969e4f.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d57c1cd07.jpg"/></div><p>校方后续回应：</p><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="http://lycms.com/uploads/60b6d5a35d37a.jpg"/></div><p></p>', 0, 3, 0, 1622619100, 1622619100),
  (7, 0, 0, 0, 8, '央视公众号，2021/03/17，发布爹味文章', '/uploads/60bc1bcd40f64.jpg', '["/uploads/60bc1bb87578f.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60bc1bb87578f.jpg"/></div><p></p>', 0, 6, 0, 1622940622, 1622940745),
  (8, 0, 0, 0, 2, '杨笠，2020年，男人普通却自信没有底线事件', '/uploads/60bc28ef5de80.jpg', '["/uploads/60bc28d6d0acc.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bc283d3271f.jpg"/></div><p></p><p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bc28d6d0acc.jpg"/></div><p></p>', 0, 6, 0, 1622943985, 1622943985),
  (9, 0, 0, 0, 4, '河北工程大学，2019年，驱逐猥亵女同学的巴基斯坦留学生', '/uploads/60bf0331b80ce.jpg', '["/uploads/60bf0320d7de6.jpg"]', '', '<p>概述：</p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bf031233589.jpg"/></div><p>详情：</p><p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bf0320d7de6.jpg"/></div><p></p>', 0, 1, 0, 1623130931, 1623130931),
  (10, 0, 0, 0, 1, '河北师范大学，2021/06/07，辟谣陪读留学生谣言', '/uploads/60bf0c807cb38.jpg', '["/uploads/60bf0c5ee06ae.jpg","/uploads/60bf684a133b6.jpg"]', '', '<p>相关报道：</p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60bf0c5b5fe43.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60bf0c5ee06ae.jpg"/></div><p>知乎评论：</p><p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bf6839d9787.jpg"/></div><p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60bf684a133b6.jpg"/></div><p></p>', 0, 3, 0, 1623133314, 1623156817),
  (11, 0, 0, 0, 5, '济南大学，要求与留学生交流事件和优先留学生的空调事件', '/uploads/60c1e2650a1b7.jpg', '["/uploads/60c1e22f70664.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60c1e22f70664.jpg"/></div><p></p>', 0, 0, 0, 1623319142, 1623319159),
  (12, 0, 0, 0, 8, '教育部刘京辉：来华留学生仍要注重数量，只谈质量属头脑发热', '/uploads/60c1e4a9a82ba.jpg', '["/uploads/60c1e492d5b0a.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60c1e492d5b0a.jpg"/></div><p></p>', 0, 1, 0, 1623319723, 1623319723),
  (13, 0, 0, 0, 5, '首都师范大学，2019年，留学生泳池事件，中国学生与狗不准入内', '/uploads/60c1e55417e40.jpg', '["/uploads/60c1e53b72442.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60c1e53b72442.jpg"/></div><p></p>', 0, 0, 0, 1623319893, 1623319893),
  (14, 0, 0, 0, 5, '无锡职业技术学院，2018年，把好宿舍腾给留学生事件', '/uploads/60c1e639daba3.jpg', '["/uploads/60c1e620cf5c8.jpg","/uploads/60c1e7e458649.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60c1e7e458649.jpg"/></div><p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60c1e620cf5c8.jpg"/></div><p></p>', 0, 2, 0, 1623320123, 1623320808),
  (15, 0, 0, 0, 5, '沈阳城市学院，2018年，本科生给留学生打扫卫生事件', '/uploads/60c1e6c5203a5.jpg', '["/uploads/60c1e6bbec8c0.jpg","/uploads/60c1ee6c654e9.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60c1e6bbec8c0.jpg"/></div><p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60c1ee6c654e9.jpg"/></div><p></p>', 0, 1, 0, 1623320261, 1623322224),
  (16, 0, 0, 0, 5, '上海政法学院，2017年，给留学生腾宿舍事件', '/uploads/60c1e94f0991a.jpg', '["/uploads/60c1e93c95113.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60c1e93c95113.jpg"/></div><p></p>', 0, 2, 0, 1623320912, 1623320912),
  (17, 0, 0, 0, 5, '山东财经大学，2019年，为留学生腾宿舍', '/uploads/60c1eb6c1bb26.jpg', '["/uploads/60c1eb590faf8.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60c1eb590faf8.jpg"/></div><p></p>', 0, 7, 0, 1623321453, 1623321453),
  (18, 0, 0, 0, 5, '武汉大学，2018年，留学生充电桩事件', '/uploads/60c1ed60f1f56.jpg', '["/uploads/60c1ed520575b.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60c1ed520575b.jpg"/></div><p></p>', 0, 1, 0, 1623321954, 1623321954),
  (19, 0, 0, 0, 10, '2021年6月9日，四川广元，勒索致14岁男孩跳江身亡的嫌疑人嚣张的表示：报警好了，我未成年 ', '/uploads/60c5f352e4cac.jpg', '["/uploads/60c5f336666e5.jpg","/uploads/60c5f89dabdbe.jpg"]', '', '<p></p><div class="media-wrap image-wrap"><img class="media-wrap image-wrap" id="xxx" alt="xxx" title="xxx" src="/uploads/60c5f336666e5.jpg"/></div><p></p><div class="media-wrap image-wrap"><img id="xxx" title="xxx" alt="xxx" loop="" autoplay="" controls="" src="/uploads/60c5f89dabdbe.jpg"/></div><p></p>', 0, 8, 0, 1623585620, 1623586978);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- 导出  表 dx.art_tag 结构
DROP TABLE IF EXISTS `art_tag`;
CREATE TABLE IF NOT EXISTS `art_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '作者',
  `tagid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'navid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 正在导出表  dx.art_tag 的数据：~34 rows (大约)
DELETE FROM `art_tag`;
/*!40000 ALTER TABLE `art_tag` DISABLE KEYS */;
INSERT INTO `art_tag` (`id`, `artid`, `tagid`) VALUES
  (2, 2, 2),
  (3, 2, 5),
  (6, 5, 1),
  (7, 5, 5),
  (13, 6, 2),
  (19, 7, 3),
  (20, 7, 6),
  (21, 8, 7),
  (22, 8, 6),
  (25, 9, 8),
  (26, 9, 5),
  (29, 4, 4),
  (30, 4, 5),
  (31, 10, 9),
  (32, 10, 5),
  (35, 11, 10),
  (36, 11, 5),
  (37, 12, 5),
  (38, 13, 11),
  (39, 13, 5),
  (46, 14, 12),
  (47, 14, 5),
  (48, 14, 14),
  (49, 16, 15),
  (50, 16, 14),
  (51, 16, 5),
  (52, 17, 16),
  (53, 17, 14),
  (54, 17, 5),
  (55, 18, 17),
  (56, 18, 5),
  (57, 15, 13),
  (58, 15, 5),
  (60, 19, 18);
/*!40000 ALTER TABLE `art_tag` ENABLE KEYS */;

-- 导出  表 dx.banner 结构
DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` int(10) unsigned NOT NULL DEFAULT 0,
  `img` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `href` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `pre` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `weight` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- 正在导出表  dx.banner 的数据：~1 rows (大约)
DELETE FROM `banner`;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` (`id`, `tid`, `img`, `title`, `href`, `pre`, `weight`) VALUES
  (1, 1, '/imgs/2.jpg', '央视公众号', '/art.php?id=7&nid=8', '', 0),
  (2, 1, '/uploads/60bc2a4dac64d.jpg', 'dsf', '/art.php?id=8&nid=2', 'sdf', 0);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;

-- 导出  表 dx.banner_type 结构
DROP TABLE IF EXISTS `banner_type`;
CREATE TABLE IF NOT EXISTS `banner_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- 正在导出表  dx.banner_type 的数据：~2 rows (大约)
DELETE FROM `banner_type`;
/*!40000 ALTER TABLE `banner_type` DISABLE KEYS */;
INSERT INTO `banner_type` (`id`, `title`) VALUES
  (1, '首页轮播');
/*!40000 ALTER TABLE `banner_type` ENABLE KEYS */;

-- 导出  表 dx.config 结构
DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `key` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 正在导出表  dx.config 的数据：~9 rows (大约)
DELETE FROM `config`;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `title`, `key`, `val`) VALUES
  (1, '网站名', 'webname', 'wantGreatAgain'),
  (2, '安装路径', 'cmspath', '/'),
  (3, 'df', 'email', 'fanjunjiei@126.com'),
  (4, '', 'qq', '1301637928'),
  (5, '', 'wechat', 'yor365'),
  (6, '', 'wepub', '成功那么难吗'),
  (9, '备案号', 'beian', '冀ICP备20003740号'),
  (10, '关键词', 'keywords', '希望 想要 实现 中国 中华 再次 伟大 复兴'),
  (11, '描述', 'description', '因为想要实现中华的再次伟大复兴，搬运一些我认为属于疾在腠理的新闻，希望会有人能看见。');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;

-- 导出  表 dx.links 结构
DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `href` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `img` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- 正在导出表  dx.links 的数据：~0 rows (大约)
DELETE FROM `links`;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` (`id`, `type`, `href`, `title`, `img`) VALUES
  (1, 0, 'https://zhihu.com', '知乎', '');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;

-- 导出  表 dx.nav 结构
DROP TABLE IF EXISTS `nav`;
CREATE TABLE IF NOT EXISTS `nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级nav的id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0:列表，1：封面',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subtitle` text NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 正在导出表  dx.nav 的数据：~7 rows (大约)
DELETE FROM `nav`;
/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` (`id`, `pid`, `type`, `title`, `subtitle`, `weight`) VALUES
  (1, 0, 0, '大学', '青年最富有朝气、最富有梦想，青年兴则国家兴，青年强则国家强。\n而青年大多是大学培养出来的。', 2),
  (2, 0, 0, '两性', '挑动性别对立，就可引流，就能得到死忠粉，就能赚钱。\n这些人，才是国家的寄生虫。', 1),
  (3, 0, 1, '关于', '简介', 0),
  (4, 1, 0, '赏善令', '', 0),
  (5, 1, 0, '罚恶令', '', 0),
  (8, 0, 0, '曾仰望的', '我曾凝望，曾是航向的日出', 2),
  (10, 0, 0, '未成年保护', '未成年犯罪，受害者往往也是未成年人。\n如果因为是未成年，犯罪就能轻罚或者不罚，未成年罪犯就会更加猖狂。大众未成年人就更容易受到伤害。\n那么，如果有法规保护未成年罪犯，我认为它起到的作用不是保护未成年人，而是伤害未成年人。', 1);
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;

-- 导出  表 dx.nav_art 结构
DROP TABLE IF EXISTS `nav_art`;
CREATE TABLE IF NOT EXISTS `nav_art` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navid` int(10) unsigned NOT NULL DEFAULT 0,
  `content` mediumtext COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- 正在导出表  dx.nav_art 的数据：~0 rows (大约)
DELETE FROM `nav_art`;
/*!40000 ALTER TABLE `nav_art` DISABLE KEYS */;
INSERT INTO `nav_art` (`id`, `navid`, `content`) VALUES
  (1, 3, '&lt;p&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 关于我为什么要做这个网站。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 如果要对我做一个分类，我想我一定是属于改良派。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 大学毕业的时候，我提出过一个假想：社会进步的速度会越慢，直至完全停止甚至开始倒退。当时的我认为，牺牲是社会进步的必要条件，而随着物质条件的逐渐提高，即使有较大的阶级差距大概率不会导致低阶层人员物质方面无法生存。过去的暴力推翻方式近乎不可能，社会进步的速度也将逐渐停滞。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 今后的社会进步方式，唯有改良。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 高考之前读过太多的日本夏令营、德国油纸包、美国小学生，也曾认为外国的月亮更圆过。后来经过彭宇案、北电侯亮平事件、红黄蓝事件、甘肃老师怀疑学生偷口红事件、李心草事件……之后，感觉媒体不过是资本的戏子。对资本不利的热搜总是会很快的消失。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 这让我非常的困惑，这些消失的热搜究竟是因为为了面子光的肉食者要求删除，还是因为资本的铜臭的利诱而由平台删除。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 于是想到如果有这样一个平台，这个社会会更好一点。它直接对最高层比如主席或者国务院负责。各级政府需要在上面将需要下级政府人员和下下级政府人员知道的信息向其公布。那么村民能够了解到乡对村的政策等就能对村委形成监督，村对乡形成监督，依次向上，就成促进政府的廉政。公民遇到不公之事，直接@相应机关，其上级机关也会收到并促督其解决。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 当时有了这个想法后，我很想让大家知道我这个想法。恰逢老板欠我几个月工资不肯给，那个老板又曾有暴力行为。于是决定在美拍上录制视频说明这个想法和可能会被打甚至丧命后，到当地法院起诉，如果老板能给我工资固然不错。如果老板打我一顿甚至打死我，那么我这个视频就会火，大家就会知道我的这个想法，可能会能为社会做一点微小的贡献，那也算不枉此生。后来老板给了我钱，并跟我说：“是啊，当时可以先找几个人打你一顿的。”，我跟他说，“是啊，其实现在也还可以的。”他笑了笑，我也笑了笑。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 现在想来，我得感谢他没有打我，尤其是现在柳州钢琴女教师讨薪被打至今无后续的今天，我深深的相信，我这条命，不值那么多的关注。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 我也曾经心中有光，并为此不惜此身。但今年（2021），它熄灭过一段时间。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 从《青年报》的《做题家”们的怨气，为何要往丁真身上撒？》，到《人民日报》的《垃圾男人分类图鉴》，到《央视新闻》微博的“货拉拉司机应该制止并紧急刹车，司机未采取任何避免措施”，到《央视网公众号》的《对不起，你“爹味”超标了》，再到CCTV13报道的“脱口秀演员杨笠因为其言论“男人普通却自信”被举报，生活过得不好””。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 起初那些媒体我会认为是我们的媒体被地方势力渗透了，直到最后一个，电视台，央视！那一刻我感觉这个世界一下子变成了灰色，我的一切行为都失去了意义。我将来的努力也不会有任何意义。像躯壳失去了灵魂。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 时间会让麻木变淡，几分钟后，我就想那我也去一心搞钱吧。幸运的是，几天后我被一篇知乎回答拯救了。他说微博为了利益连共青团都封。可见，天并不是黑的，黑的不过是乌云而已。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 过了几天，天津大学留学生事件出来，我想起我曾想要把个学校的新闻搬运在一起的计划。&lt;/span&gt;&lt;/span&gt;&lt;br/&gt;&lt;span style=&quot;font-size:16px&quot;&gt;&lt;span style=&quot;line-height:2&quot;&gt; 所谓山顶遥远，路在脚下。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');
/*!40000 ALTER TABLE `nav_art` ENABLE KEYS */;

-- 导出  表 dx.role 结构
DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `des` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `permit` text COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- 正在导出表  dx.role 的数据：~2 rows (大约)
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `title`, `des`, `permit`) VALUES
  (1, '管理员', '电饭锅', '["/cont","/cont/navs","/cont/arts","/cont/tags","/cont/banners","/sys","/sys/setting","/sys/role","/sys/user","/sys/databack"]'),
  (2, '用户', '发过火 ', '["/tasks/lists","/liucheng/myCreated"]');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 导出  表 dx.tag 结构
DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级tag的id',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subtitle` varchar(50) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- 正在导出表  dx.tag 的数据：~18 rows (大约)
DELETE FROM `tag`;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id`, `pid`, `title`, `subtitle`, `create_time`) VALUES
  (1, 0, '山东大学', '', 0),
  (2, 0, '天津大学', '', 0),
  (3, 0, '央视', '', 0),
  (4, 0, '暨南大学', '', 0),
  (5, 0, '留学生', '', 0),
  (6, 0, '两性', '挑动性别对立的人，才是国家的蛀虫。', 0),
  (7, 0, '杨笠', '', 0),
  (8, 0, '河北工程大学', '', 0),
  (9, 0, '河北师范大学', '', 0),
  (10, 0, '济南大学', '', 0),
  (11, 0, '首都师范大学', '', 0),
  (12, 0, '无锡职业技术学院', '', 0),
  (13, 0, '沈阳城市学院', '', 0),
  (14, 5, '给留学生腾宿舍', '', 0),
  (15, 0, '上海政法学院', '', 0),
  (16, 0, '山东财经大学', '', 0),
  (17, 0, '武汉大学', '', 0),
  (18, 0, '未成年保护', '', 0);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- 导出  表 dx.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
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

-- 正在导出表  dx.user 的数据：~0 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `rid`, `password`, `username`, `loginname`, `sex`, `photo`, `email`, `userinfo`, `token`, `view`, `guanzhu`, `lastlogin`) VALUES
  (1, 1, 'bf1ea62e0381a59b80ff5026467689a7', '管理员', 'admin', 0, '/uploads/photos/0.jpg', 'f@126.com', '', 'e96608c504659eff2623e6a4d2f5ba5d', 0, 0, 1623331488);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

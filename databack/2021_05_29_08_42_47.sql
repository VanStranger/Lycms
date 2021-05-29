-- MySQL dump 10.17  Distrib 10.3.12-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dx
-- ------------------------------------------------------
-- Server version	10.3.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dx`
--

/*!40000 DROP DATABASE IF EXISTS `dx`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dx` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci */;

USE `dx`;

--
-- Table structure for table `art_tag`
--

DROP TABLE IF EXISTS `art_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `art_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '作者',
  `tagid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'navid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_tag`
--

LOCK TABLES `art_tag` WRITE;
/*!40000 ALTER TABLE `art_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,1,0,1,'屈原的《天问》的问题中有哪些已经有了答案？','/imgs/1.jpg','[\"/imgs/1.jpg\"]','《天问》白话译文请问：远古开始时，谁将此态流传导引给后代？天地尚未成形前，又从哪里得以产生？明暗不分混沌一片，谁能够探究其中原因？大气一团迷蒙无物，凭什么将它识别认清？白天光明夜日屯黑暗，究竞它是如何安排？阴阳参合而生万物，何为本源何为演变？传说青天浩渺共有九重，是谁曾去环绕量度？如此规模巨大的工程，是谁开始把它建造？斗柄的轴绳系在何处？天极遥远延伸到何方？八个擎天之柱撑在哪里？大地为何低陷东南？','<p>《天问》白话译文</p><p>请问：远古开始时，谁将此态流传导引给后代？</p><p>天地尚未成形前，又从哪里得以产生？</p><p>明暗不分混沌一片，谁能够探究其中原因？</p><p>大气一团迷蒙无物，凭什么将它识别认清？</p><p>白天光明夜日屯黑暗，究竞它是如何安排？</p><p>阴阳参合而生万物，何为本源何为演变？</p><p>传说青天浩渺共有九重，是谁曾去环绕量度？</p><p>如此规模巨大的工程，是谁开始把它建造？</p><p>斗柄的轴绳系在何处？天极遥远延伸到何方？</p><p>八个擎天之柱撑在哪里？大地为何低陷东南？</p><p>天的中央与八方四面，究竟在哪里依傍相连？</p><p>边边相交隅角众多，有谁能统计周全？</p><p>天在哪里与地交会？十二区域怎样划分？</p><p>日月天体如何连属？众星列陈究竟何如？</p><p>太阳早上从汤谷出来，夜晚在蒙汜栖息。</p><p>从天亮直到天黑，所走之路究竟几里？</p><p>月亮有着什么德行，竟然能够死而再重生？</p><p>对月亮有什么好处，而有玉兔在其腹中？</p><p>神女女岐并没有丈夫，为何会有九个儿子？</p><p>伯强之神居于何处？天地和气又在哪里？</p><p>关闭什么门使得天黑？开启什么门使得天亮？</p><p>东方角宿还没放光，太阳又在哪里匿藏？</p><p>如果鲧不能胜任治水，众人为何仍将他推举？</p><p>既然都说没有可担忧，为何不让他尝试？</p><p>太阳的运行靠鸱龟或曳或衔，鲧有什么神圣德行？</p><p>治理川谷马上大功告成，尧帝为何对他施刑？</p><p>长久将鲧禁闭羽山，为何三年还不放他？</p><p>大禹从鲧腹中生出，治水方法怎样变化？</p><p>继承前人未竟事业，终于完成先父遗志。</p><p>为何继承前任遗绪，所用谋略却不相同？</p><p>洪水如渊深不见底，怎样才能将它填平？</p><p>土地肥瘠可分九等，怎样才能划分明白？</p><p>应龙如何以尾画地？河海如何顺利流通？</p><p>鲧经营了哪些事业？禹是什么使他事成？</p><p>共工勃然大怒，东南大地为何侧倾？</p><p>九州大地如何安置？河流山谷怎样疏浚？</p><p>水流东海总不满溢，谁又知这是什么原因？</p><p>东西南北四方土地，哪边更长哪边更多？</p><p>南北形成狭长地势，长出地方有几何？</p><p>昆仑山上玄圃仙境，它的居住在哪里？</p><p>山中还有增城九重，它的高度有几里？</p><p>昆仑山的四面门户，什么人物由此出入？</p><p>西北两面大门敞开，什么气息通过此处？</p><p>太阳光辉怎会有哪里照不到，何需烛龙用其神光照耀？</p><p>羲和的神车尚未出行，若木之花为何便大放光芒？</p><p>什么地方冬日常暖？什么地方夏日寒凉？</p><p>什么地方有岩石成林？什么野兽能把话讲？</p><p>哪有着无角虬龙，背着熊罴游乐从容？</p><p>雄的虺蛇九个头颅，来去迅捷生在何处？</p><p>不死之国哪里可找？长寿之人持何神术？</p><p>萍草蔓延叶分九叉，枲麻长在哪儿开花？</p><p>一条长蛇吞下大象，它的身子又有多大？</p><p>黑水之地玄趾之民，还有三危都在哪里？</p><p>延年益寿得以不死，生命久长几时终止？</p><p>奇形鲮鱼生于何方？怪鸟鬿堆长在哪里？</p><p>后羿怎样射下九日？日中之乌如何解体？</p><p>大禹尽力成其圣功，降临省视天下四方。</p><p>哪儿得来涂山之女，与她结合就在台桑？</p><p>怜爱涂山女与之匹配，儿子诞生得到继嗣。</p><p>为何嗜欲与人相同，求欢饱享一朝之情？</p><p>启代伯益作了国君，终究还是遇上灾祸。</p><p>为何启会遭此忧患，身受拘囚又能逃脱？</p><p>都是勤谨鞠躬尽瘁，没有损害他们自身。</p><p>为何伯益福祚终结，禹的后嗣繁荣昌盛？</p><p>夏启急于朝见天帝，得到《九辩》《九歌》乐曲。</p><p>为何贤子竟伤母命，使她肢解满地尸骨？</p><p>帝尧派遣夷羿降临，变革夏政祸害夏民。</p><p>为何箭射那个河伯，夺取他的妻子洛嫔？</p><p>持有宝弓珧弧套着上好的扳指，前去把那巨大的野猪射猎追赶。</p><p>为何羿将肥肉献上蒸祭，天帝心中却并不以为善？</p><p>寒浞娶了羿妃纯狐氏女，又迷惑她合伙把羿谋杀。</p><p>为何羿能射穿七层皮革，却被其妻与浞合力杀戮？</p><p>道路险阻，向西而行，山岩重重，如何穿越？</p><p>鲧将身躯化为黄熊，巫师如何使他复活？</p><p>地上都已播种黑泰，芦苇水滩也已开垦经营。</p><p>为何鲧遭驱逐如同四凶，难道他真的恶贯满盈？</p><p>嫦娥白虹披身作为衣饰，为何打扮得如此堂皇？</p><p>从何处得到不死之药，却又不能长久保藏？</p><p>天的法式有纵有横，阳气离散就会死亡。</p><p>大鸟金乌多么肥壮，为何竟会体解命丧？</p><p>雨师蓱翳号呼下雨，他是怎样使雨势兴盛？</p><p>有着驯良柔顺体质，鹿身风神如何响应？</p><p>巨鳌背负神山舞动四肢，神山怎样才能安然不动？</p><p>龙伯巨人舍弃舟船行走陆地，又是怎样将灵龟钓离大海？</p><p>浇来到嫂子门口，他对嫂子有何要求？</p><p>为何少康驱赶猎犬，趁机就能将他斩首？</p><p>女歧借着缝补衣服，而且与浇同宿一房。</p><p>为何错砍女歧首级，使她亲身遭遇祸殃？</p><p>浇策划整顿军旅，如何制造甲胄使其坚固？</p><p>讨伐斟寻倾覆其船，他用何种方法取胜？</p><p>夏桀出兵讨伐蒙山，所得的好处又是什么？</p><p>妺嬉为何如此恣肆淫虐？商汤怎能将其无情放逐？</p><p>舜对成家十分忧愁，父亲为何让他独身？</p><p>帝尧不告诉舜父，二妃如何与舜成亲？</p><p>从其最初的发展，谁能预料到后来？</p><p>玉台十层奢侈至极，当初有谁将其看透？</p><p>舜帝友爱依从他的弟弟，弟弟还是对他加害。</p><p>为何身上涂满狗粪，就能避免危险状况？</p><p>古公亶父之时，吴伯是为让避王季，因而在霍山之下停留。</p><p>谁能想到此中缘故，全因这两个哥哥让贤于弟弟？</p><p>以鹄羹玉鼎进献美馔，商汤君王欣然受用。</p><p>为何接收伊尹之计图谋伐桀，便能使桀终于走向灭亡？</p><p>商汤降临俯察四方，巧遇赏识贤臣伊尹。</p><p>为何桀在呜条受罚，黎民百姓欢欣异常？</p><p>简狄深居九层瑶台之上，帝喾怎能对她中意欣赏？</p><p>玄乌高飞送来其卵，简狄如何便有身孕？</p><p>王亥秉承王季美德，以其父亲为善德榜样。</p><p>为何终遭有易之难，落得只能放牧牛羊？</p><p>王亥在有易持盾跳舞，如何能把女子吸引？</p><p>有易女子丰腴细润，如何保养如此体态？</p><p>这有易国的放牧者，又在哪里遇到女子？</p><p>凶器袭来王亥被杀，女子究竟如何得以保存性命？</p><p>王恒秉承王季美德，哪里得到其兄的牛羊？</p><p>却又为何远至班禄，不到清晨便及时回返？</p><p>黄昏时分追寻细微痕迹，有易国仍然不得安宁。</p><p>为何众鸟集于树丛，女子仍与王恒幽会淫乱？</p><p>王亥昏乱与弟共为淫虐，王亥被杀也正因如此。</p><p>为何与善变的有易女子淫乱，他的后代却反而盛昌不绝？</p><p>成汤出巡东方之地，一直到达有莘氏之地。</p><p>本想求得奴隶伊尹，如何却又能得贤淑美妻？</p><p>莘国女采桑伊水边，空桑树中拾到小儿伊尹。</p><p>有莘国君为何又心起厌恶，把他作为陪嫁礼品？</p><p>汤从囚地重泉出来，究竟他有什么大罪？</p><p>难忍耻辱起而伐桀，是谁挑起这场是非？</p><p>诸侯请盟约定甲子日清晨，为何都能守约如期？</p><p>王师如苍鹰威武成群高飞，谁使他们同心会集？</p><p>武王将纣王裂体斩首，周公姬旦却并不赞许。</p><p>为何亲自为武王谋，奠定周朝后又发叹息？</p><p>上天将天下授予殷商，纣的王位是如何施与？</p><p>等到殷朝兴起又使他灭亡，他的罪过又是什么？</p><p>诸侯踊跃兴起军队，武王如何动员他们？</p><p>军队并进击敌两翼，他又如何指挥大兵？</p><p>昭王盛治兵车出游，到达南方楚地才止。</p><p>最后得到什么好处，难道只是迎来白雉？</p><p>穆王御马巧施鞭策，为何他要周游四方？</p><p>他的足迹环绕天下，有些什么要求愿望？</p><p>妖人夫妇牵挽炫耀，为何他们呼号街市？</p><p>幽王究竟杀的是谁？哪里得来这个褒姒？</p><p>天命从来反复无常，何者受惩何者得佑？</p><p>齐国桓公九合诸侯，最终受困身死尸朽。</p><p>那个殷商纣王自身，是谁使他狂暴昏乱？</p><p>为何厌恶辅佐的忠良，而听任小人谗谄？</p><p>比干有何悖逆之处，为何遭受压制打击？</p><p>雷开惯于阿谀奉承，为何给他赏赐封爵？</p><p>为何贤臣品德虽同，却遭受不同结局？</p><p>梅伯受刑剁成肉酱，箕子装疯消极避世。</p><p>后稷原是嫡生长子，帝喾为何将他憎恨？</p><p>将他扔在寒冰之上，鸟儿为何覆翼送暖？</p><p>为何长大仗弓持箭，善治农业怀有奇能？</p><p>出生既已惊动上天，为何后嗣繁荣昌盛？</p><p>西伯姬昌八九十岁，仍然执鞭受命作牧。</p><p>是怎样撤除岐地社庙，承受天命享有殷国？</p><p>祖先携宝迁居岐山，如何能使百姓前来依傍？</p><p>殷纣已受妲己迷惑，劝谏之言又有何用？</p><p>纣王赐他亲子肉酱，西伯心痛告祭于天。</p><p>为何纣王亲受天罚，殷商命运仍难挽救？</p><p>太公吕望在店中卖肉，姬昌为何能辨贤能？</p><p>听到挥刀振动发声，文王为何大为欢喜？</p><p>武王姬发诛纣灭商，为何抑郁不能久忍？</p><p>抬着文王灵牌发动战役，为何充满焦急之情？</p><p>太子申生自缢而死，究竞为了什么缘故？</p><p>既然已经惊天动地，又有谁能心怀畏惧？</p><p>上帝既降下天命，为何王者却不谨慎修德？</p><p>既然已经统治天下，为何又被他人取代？</p><p>初把伊尹视作小臣，后来用作辅政宰相。</p><p>身为商汤辅佐大臣，为何死后荣获宗庙配享？</p><p>阖庐有功寿梦之孙，少年遭受离散之苦。</p><p>为何壮年奋厉勇武，能使他的威名远布？</p><p>彭祖烹调雉鸡之羹，为何帝尧喜欢品尝？</p><p>得享高寿年岁太多，为何竞有那么久长？</p><p>周代王朝共公治民，厉王君主为何发怒？</p><p>国人生命原本微贱，自卫力量为何牢固？</p><p>惊于妇言不再采薇，白鹿为何将其庇佑？</p><p>北行来到回水之地，一起饿死何乐可为？</p><p>哥哥拥有善咬猛犬，弟弟又打什么主意？</p><p>一百辆车换一条狗，交易不成反失禄米。</p><p>傍晚时分雷鸣电闪，想要归去有何忧愁？</p><p>国家庄严不复存在，对着上帝有何祈求？</p><p>伏身藏匿洞穴之中，还有什么事情要讲？</p><p>楚求功勋兴兵作战，国势如何能够久长？</p><p>悔悟过失改正错误，我又有何言词可陈？</p><p>吴王阖庐与楚争国，我们久已被他战胜！</p><p>环绕穿越里社丘陵，为何私通之人却生出令尹子文？</p><p>我曾告诉贤者堵敖，楚国将衰不能久长。</p><p>为何他能杀君自立，忠名更加显著光大？</p>',0,57,0,1493261845,1493261845),(2,0,1,0,1,'天津大学留学生','/uploads/60a7ae223484a.png','[\"/uploads/60a7ae92a5486.jpg\"]','','<p></p><div class=\"media-wrap image-wrap\"><img id=\"xxx\" title=\"xxx\" alt=\"xxx\" loop=\"\" autoplay=\"\" controls=\"\" src=\"http://lycms.com/uploads/60a7ae92a5486.jpg\"/></div><p></p>',0,11,0,1493261845,1493261845);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `href` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `pre` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'/imgs/2.jpg','央视公众号','','');
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `key` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'网站名','webname','wantGreatAgain'),(2,'安装路径','cmspath','/'),(3,'df','email','fanjunjiei@126.com'),(4,'','qq','1301637928'),(5,'','wechat','yor365'),(6,'','wepub','成功那么难吗');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `href` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `img` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,0,'https://zhihu.com','知乎','');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nav`
--

DROP TABLE IF EXISTS `nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级nav的id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0:列表，1：封面',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subtitle` varchar(50) NOT NULL DEFAULT '',
  `weight` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nav`
--

LOCK TABLES `nav` WRITE;
/*!40000 ALTER TABLE `nav` DISABLE KEYS */;
INSERT INTO `nav` VALUES (1,0,0,'大学','大学新闻的搬运工',2),(2,0,0,'两性','',0),(3,0,1,'关于','关于网站',0),(4,1,0,'赏善令','',0),(5,1,0,'罚恶令','',0),(8,0,0,'曾仰望的','官媒的搬运',2);
/*!40000 ALTER TABLE `nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nav_art`
--

DROP TABLE IF EXISTS `nav_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav_art` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `navid` int(10) unsigned NOT NULL DEFAULT 0,
  `content` mediumtext COLLATE utf8_general_mysql500_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nav_art`
--

LOCK TABLES `nav_art` WRITE;
/*!40000 ALTER TABLE `nav_art` DISABLE KEYS */;
INSERT INTO `nav_art` VALUES (1,3,'&lt;p&gt; &lt;span style=&quot;font-size:22px&quot;&gt;关于我为什么要做这个网站。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;如果要对我做一个分类，我想我一定是属于改良派。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;大学毕业的时候，我提出过一个假想：社会进步的速度会越慢，直至完全停止甚至开始倒退。当时的我认为，牺牲是社会进步的必要条件，而随着物质条件的逐渐提高，即使有较大的阶级差距大概率不会导致低阶层人员物质方面无法生存。过去的暴力推翻方式近乎不可能，社会进步的速度也将逐渐停滞。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;今后的社会进步方式，唯有改良。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;高考之前读过太多的日本夏令营、德国油纸包、美国小学生，也曾认为外国的月亮更圆过。后来经过彭宇案、北电侯亮平事件、红黄蓝事件、甘肃老师怀疑学生偷口红事件、李心草事件……之后，感觉媒体不过是资本的戏子。对资本不利的热搜总是会很快的消失。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;这让我非常的困惑，这些消失的热搜究竟是因为为了面子光的肉食者要求删除，还是因为资本的铜臭的利诱而由平台删除。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;于是想到如果有这样一个平台，这个社会会更好一点。它直接对最高层比如主席或者国务院负责。各级政府需要在上面将需要下级政府人员和下下级政府人员知道的信息向其公布。那么村民能够了解到乡对村的政策等就能对村委形成监督，村对乡形成监督，依次向上，就成促进政府的廉政。公民遇到不公之事，直接@相应机关，其上级机关也会收到并促督其解决。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;当时有了这个想法后，我很想让大家知道我这个想法。恰逢老板欠我几个月工资不肯给，那个老板又曾有暴力行为。于是决定在美拍上录制视频说明这个想法和可能会被打甚至丧命后，到当地法院起诉，如果老板能给我工资固然不错。如果老板打我一顿甚至打死我，那么我这个视频就会火，大家就会知道我的这个想法，可能会能为社会做一点微小的贡献，那也算不枉此生。后来老板给了我钱，并跟我说：“是啊，当时可以先找几个人打你一顿的。”，我跟他说，“是啊，其实现在也还可以的。”他笑了笑，我也笑了笑。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;现在想来，我得感谢他没有打我，尤其是现在柳州钢琴女教师讨薪被打至今无后续的今天，我深深的相信，我这条命，不值那么多的关注。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;我也曾经心中有光，并为此不惜此身。但今年（2021），它熄灭过一段时间。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;从《青年报》的《做题家”们的怨气，为何要往丁真身上撒？》，到《人民日报》的《垃圾男人分类图鉴》，到《央视新闻》微博的“货拉拉司机应该制止并紧急刹车，司机未采取任何避免措施”，到《央视网公众号》的《对不起，你“爹味”超标了》，再到CCTV13报道的“脱口秀演员杨笠因为其言论“男人普通却自信”被举报，生活过得不好””。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;起初那些媒体我会认为是我们的媒体被地方势力渗透了，直到最后一个，电视台，央视！那一刻我感觉这个世界一下子变成了灰色，我的一切行为都失去了意义。我将来的努力也不会有任何意义。像躯壳失去了灵魂。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;时间会让麻木变淡，几分钟后，我就想那我也去一心搞钱吧。幸运的是，几天后我被一篇知乎回答拯救了。他说微博为了利益连共青团都封。可见，天并不是黑的，黑的不过是乌云而已。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;过了几天，天津大学留学生事件出来，我想起我曾想要把个学校的新闻搬运在一起的计划。&lt;/span&gt;&lt;br/&gt; &lt;span style=&quot;font-size:22px&quot;&gt;所谓山顶遥远，路在脚下。&lt;/span&gt;&lt;br/&gt;&lt;/p&gt;');
/*!40000 ALTER TABLE `nav_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `des` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'管理员',''),(2,'用户','');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级tag的id',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subtitle` varchar(50) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,0,'山东大学','第三方',0),(2,0,'天津大学','',0),(3,0,'央视','',0);
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'21232f297a57a5a743894a0e4a801fc3','管理员','admin',0,'/uploads/photos/0.jpg','f@126.com','','9c1c667a19e3cac8a9bd581ed40e3c43',0,0,1622244342);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-29 16:43:04

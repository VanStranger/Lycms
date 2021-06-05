CREATE DATABASE IF NOT EXISTS `dx` DEFAULT CHARSET utf8 COLLATE utf8_general_mysql500_ci;
USE `dx`;
DROP TABLE IF EXISTS `art_tag`;
CREATE TABLE `art_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `artid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '作者',
  `tagid` int(11) unsigned NOT NULL DEFAULT 0 COMMENT 'navid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `title` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `href` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  `pre` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `key` varchar(50) NOT NULL DEFAULT '',
  `val` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '父级tag的id',
  `title` varchar(50) NOT NULL DEFAULT '',
  `subtitle` varchar(50) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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

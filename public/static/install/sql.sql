Drop table if exists `config`;
CREATE TABLE `config` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`key` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`val` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

Drop table if exists `user`;
CREATE TABLE `user` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`uid` CHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`password` CHAR(32) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`username` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`loginname` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`sex` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0:男，1：女',
	`photo` CHAR(100) NULL DEFAULT './img/photos/0.png' COMMENT '图片地址' COLLATE 'utf8_general_ci',
	`email` CHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`emailactive` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
	`userinfo` CHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`token` CHAR(32) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`view` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`guanzhu` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

Drop table if exists `nav`;
CREATE TABLE `nav` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`pid` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级nav的id',
	`type` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0:列表，1：封面',
	`title` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`subtitle` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

Drop table if exists `tag`;
CREATE TABLE `tag` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`pid` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级tag的id',
	`title` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`create_time` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

Drop table if exists `article`;
CREATE TABLE `article` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`authorid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '作者',
	`nid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'navid',
	`zid` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '章节id',
	`title` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`preimg` CHAR(50) NOT NULL DEFAULT '[]' COMMENT '缩略图' COLLATE 'utf8_general_ci',
	`pre` CHAR(200) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`content` TEXT NOT NULL COMMENT '内容' COLLATE 'utf8_general_ci',
	`jubao` SMALLINT(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '举报',
	`comments` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`create_time` INT(11) UNSIGNED NOT NULL DEFAULT '0',
	`update_time` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC;

Drop table if exists `art_tag`;
CREATE TABLE `art_tag` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`artid` INT(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '作者',
	`tagid` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'navid',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC;

/*
MySQL Data Transfer
Source Host: localhost
Source Database: yiitestdb
Target Host: localhost
Target Database: yiitestdb
Date: 1/28/2014 9:43:53 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for authassignment
-- ----------------------------
DROP TABLE IF EXISTS `authassignment`;
CREATE TABLE `authassignment` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for authitem
-- ----------------------------
DROP TABLE IF EXISTS `authitem`;
CREATE TABLE `authitem` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for authitemchild
-- ----------------------------
DROP TABLE IF EXISTS `authitemchild`;
CREATE TABLE `authitemchild` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for rights
-- ----------------------------
DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tbl_book
-- ----------------------------
DROP TABLE IF EXISTS `tbl_book`;
CREATE TABLE `tbl_book` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nview` int(6) DEFAULT '0',
  `upload_uid` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tbl_comment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tbl_lookup
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lookup`;
CREATE TABLE `tbl_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tbl_post
-- ----------------------------
DROP TABLE IF EXISTS `tbl_post`;
CREATE TABLE `tbl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tbl_profiles
-- ----------------------------
DROP TABLE IF EXISTS `tbl_profiles`;
CREATE TABLE `tbl_profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_profiles_fields
-- ----------------------------
DROP TABLE IF EXISTS `tbl_profiles_fields`;
CREATE TABLE `tbl_profiles_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` varchar(15) NOT NULL DEFAULT '0',
  `field_size_min` varchar(15) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(5000) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`widget`,`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_tag
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tag`;
CREATE TABLE `tbl_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `authassignment` VALUES ('Admin', '1', null, 'N;');
INSERT INTO `authassignment` VALUES ('Manager', '1', null, 'N;');
INSERT INTO `authassignment` VALUES ('Manager', '3', null, 'N;');
INSERT INTO `authassignment` VALUES ('Post_P', '1', null, 'N;');
INSERT INTO `authassignment` VALUES ('Poster', '1', null, 'N;');
INSERT INTO `authitem` VALUES ('Admin', '2', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Authenticated', '2', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Comment.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Comment.Approve', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Comment.Delete', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Comment.Index', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Comment.Update', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Guest', '2', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Kế Toán', '1', 'Kế Toán', 'KETOAN', 'N;');
INSERT INTO `authitem` VALUES ('Kho Hàng', '1', 'QL Kho', 'QLKHO', 'N;');
INSERT INTO `authitem` VALUES ('Manager', '2', 'Manager', null, 'N;');
INSERT INTO `authitem` VALUES ('Post_P', '0', 'Post_PD', 'Post_PB', 'N;');
INSERT INTO `authitem` VALUES ('Post.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.Admin', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.Create', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.Delete', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.Index', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.Rate', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.SuggestTags', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.Update', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Post.View', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Poster', '1', 'Only post', 'BPOST', 'N;');
INSERT INTO `authitem` VALUES ('Site.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Site.Contact', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Site.Error', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Site.Login', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('Site.Logout', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Activation.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Activation.Activation', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Admin.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Admin.Admin', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Admin.Create', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Admin.Delete', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Admin.Update', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Admin.View', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Default.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Default.Index', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Login.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Login.Login', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Logout.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Logout.Logout', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Profile.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Profile.Changepassword', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Profile.Edit', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Profile.Profile', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.ProfileField.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.ProfileField.Admin', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.ProfileField.Create', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.ProfileField.Delete', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.ProfileField.Update', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.ProfileField.View', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Recovery.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Recovery.Recovery', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Registration.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.Registration.Registration', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.User.*', '1', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.User.Index', '0', null, null, 'N;');
INSERT INTO `authitem` VALUES ('User.User.View', '0', null, null, 'N;');
INSERT INTO `authitemchild` VALUES ('Manager', 'Post.Update');
INSERT INTO `authitemchild` VALUES ('Authenticated', 'Poster');
INSERT INTO `tbl_book` VALUES ('1', 'Kim Bình Mai', 'Đoàn Ca Ca', '23', '0');
INSERT INTO `tbl_book` VALUES ('2', 'Yii Toturials', 'Đoàn Thiếu Gia', '233', '0');
INSERT INTO `tbl_book` VALUES ('3', 'Dạy Nấu Ăn', 'Sir Đoàn', '2342', '0');
INSERT INTO `tbl_book` VALUES ('4', 'FaceBook Marketing', 'Mai Xuân Đạt', '676', '0');
INSERT INTO `tbl_comment` VALUES ('1', 'This is a test comment.', '2', '1230952187', 'Tester', 'tester@example.com', null, '2');
INSERT INTO `tbl_comment` VALUES ('2', 'Fuck tesst', '2', '1390809226', 'Doan', 'doan@cohet.vn', '', '2');
INSERT INTO `tbl_lookup` VALUES ('1', 'Draft', '1', 'PostStatus', '1');
INSERT INTO `tbl_lookup` VALUES ('2', 'Published', '2', 'PostStatus', '2');
INSERT INTO `tbl_lookup` VALUES ('3', 'Archived', '3', 'PostStatus', '3');
INSERT INTO `tbl_lookup` VALUES ('4', 'Pending Approval', '1', 'CommentStatus', '1');
INSERT INTO `tbl_lookup` VALUES ('5', 'Approved', '2', 'CommentStatus', '2');
INSERT INTO `tbl_post` VALUES ('1', 'Welcome!', 'This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.\n\nFeel free to try this system by writing new posts and posting comments.', 'yii, blog', '2', '1230952187', '1230952187', '1');
INSERT INTO `tbl_post` VALUES ('2', 'A Test Post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'test', '2', '1230952187', '1230952187', '1');
INSERT INTO `tbl_profiles` VALUES ('1', 'Admin', 'Administrator');
INSERT INTO `tbl_profiles` VALUES ('2', 'Demo', 'Demo');
INSERT INTO `tbl_profiles` VALUES ('3', 'Doan', 'Sir');
INSERT INTO `tbl_profiles_fields` VALUES ('1', 'lastname', 'Last Name', 'VARCHAR', '50', '3', '1', '', '', 'Incorrect Last Name (length between 3 and 50 characters).', '', '', '', '', '1', '3');
INSERT INTO `tbl_profiles_fields` VALUES ('2', 'firstname', 'First Name', 'VARCHAR', '50', '3', '1', '', '', 'Incorrect First Name (length between 3 and 50 characters).', '', '', '', '', '0', '3');
INSERT INTO `tbl_tag` VALUES ('1', 'yii', '1');
INSERT INTO `tbl_tag` VALUES ('2', 'blog', '1');
INSERT INTO `tbl_tag` VALUES ('3', 'test', '1');
INSERT INTO `tbl_user` VALUES ('1', 'demo', '$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC', 'webmaster@example.com', null);
INSERT INTO `tbl_users` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'webmaster@example.com', '9a24eff8c15a6a141ece27eb6947da0f', '2014-01-21 17:30:17', '2014-01-28 01:05:26', '1', '1');
INSERT INTO `tbl_users` VALUES ('2', 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', 'demo@example.com', '099f825543f7850cc038b90aaff39fac', '2014-01-21 17:30:17', '0000-00-00 00:00:00', '0', '1');
INSERT INTO `tbl_users` VALUES ('3', 'lupanh87', 'e6a4370aca6970175dee8c72cc7e08dc', 'lupanh@cohet.vn', 'f019f4166ad7989a2b834f026539937b', '2014-01-27 07:51:46', '2014-01-28 08:18:21', '0', '1');

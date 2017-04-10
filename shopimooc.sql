/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : shopimooc

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-04-10 16:52:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `imooc_admin`
-- ----------------------------
DROP TABLE IF EXISTS `imooc_admin`;
CREATE TABLE `imooc_admin` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imooc_admin
-- ----------------------------
INSERT INTO `imooc_admin` VALUES ('1', 'king', 'b2086154f101464aab3328ba7e060deb', '877040117@qq.com');

-- ----------------------------
-- Table structure for `imooc_album`
-- ----------------------------
DROP TABLE IF EXISTS `imooc_album`;
CREATE TABLE `imooc_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `albumPath` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imooc_album
-- ----------------------------

-- ----------------------------
-- Table structure for `imooc_cate`
-- ----------------------------
DROP TABLE IF EXISTS `imooc_cate`;
CREATE TABLE `imooc_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cName` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imooc_cate
-- ----------------------------

-- ----------------------------
-- Table structure for `imooc_pro`
-- ----------------------------
DROP TABLE IF EXISTS `imooc_pro`;
CREATE TABLE `imooc_pro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pName` varchar(50) NOT NULL,
  `pSn` varchar(50) NOT NULL,
  `pNum` smallint(6) NOT NULL DEFAULT '0',
  `mPrice` decimal(10,2) NOT NULL,
  `iPrice` decimal(10,2) NOT NULL,
  `pDesc` text,
  `pImg` varchar(255) NOT NULL,
  `pubTime` int(10) unsigned NOT NULL,
  `isShow` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `isHot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imooc_pro
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_user`
-- ----------------------------
DROP TABLE IF EXISTS `shop_user`;
CREATE TABLE `shop_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `sex` enum('男','女','保密') NOT NULL DEFAULT '保密',
  `email` varchar(50) NOT NULL,
  `face` varchar(255) NOT NULL,
  `regTime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_user
-- ----------------------------

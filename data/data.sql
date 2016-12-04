
DROP DATABASE IF EXISTS `shopImooc`;
CREATE DATABASE IF NOT EXISTS `shopImooc` DEFAULT CHARSET=utf8;

USE `shopImooc`;

# 后台管理员表
CREATE TABLE IF NOT EXISTS `imooc_admin`(
    `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` varchar(20) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `Email` VARCHAR(50) NOT NULL
);

# 分类表
CREATE TABLE IF NOT EXISTS `imooc_cate`(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cName` VARCHAR(30) NOT NULL
);

# 商品表
CREATE TABLE IF NOT EXISTS `imooc_pro`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pName` VARCHAR(50) NOT NULL,
    `pSn` VARCHAR(50) NOT NULL,
    `pNum` SMALLINT NOT NULL DEFAULT 0,
    `mPrice` DECIMAL(10,2) NOT NULL,
    `iPrice` DECIMAL(10,2) NOT NULL,
    `pDesc` TEXT,
    `pImg` VARCHAR(255) NOT NULL,
    `pubTime` INT UNSIGNED NOT NULL,
    `isShow` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
    `isHot`  TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    `cId` INT NOT NULL   # 商品分类
);

# 用户表
CREATE TABLE IF NOT EXISTS `shop_user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(20) UNIQUE NOT NULL,
    `password` CHAR(32) NOT NULL,
    `sex` ENUM('男','女','保密') NOT NULL DEFAULT '保密',
    `email` VARCHAR(50) NOT NULL,
    `face` VARCHAR(255) NOT NULL,   # 头像
    `regTime` INT UNSIGNED NOT NULL
);

# 相册表，一个商品对应多张图片，商品ID和商品图片路径
CREATE TABLE IF NOT EXISTS `imooc_album`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pid` INT NOT NULL,
    `albumPath` VARCHAR(50) NOT NULL
);
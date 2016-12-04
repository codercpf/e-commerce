
DROP DATABASE IF EXISTS `shopImooc`;
CREATE DATABASE IF NOT EXISTS `shopImooc` DEFAULT CHARSET=utf8;

USE `shopImooc`;

# ��̨����Ա��
CREATE TABLE IF NOT EXISTS `imooc_admin`(
    `id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` varchar(20) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `Email` VARCHAR(50) NOT NULL
);

# �����
CREATE TABLE IF NOT EXISTS `imooc_cate`(
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cName` VARCHAR(30) NOT NULL
);

# ��Ʒ��
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
    `cId` INT NOT NULL   # ��Ʒ����
);

# �û���
CREATE TABLE IF NOT EXISTS `shop_user`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(20) UNIQUE NOT NULL,
    `password` CHAR(32) NOT NULL,
    `sex` ENUM('��','Ů','����') NOT NULL DEFAULT '����',
    `email` VARCHAR(50) NOT NULL,
    `face` VARCHAR(255) NOT NULL,   # ͷ��
    `regTime` INT UNSIGNED NOT NULL
);

# ����һ����Ʒ��Ӧ����ͼƬ����ƷID����ƷͼƬ·��
CREATE TABLE IF NOT EXISTS `imooc_album`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pid` INT NOT NULL,
    `albumPath` VARCHAR(50) NOT NULL
);
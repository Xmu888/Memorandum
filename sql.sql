/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - demotext
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demotext` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demotext`;

/*Table structure for table `inseruser` */

DROP TABLE IF EXISTS `inseruser`;

CREATE TABLE `inseruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usernum` varchar(50) NOT NULL,
  `passnum` varchar(50) NOT NULL,
  `userPhone` varchar(20) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `insertTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usernum` (`usernum`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `inseruser` */

insert  into `inseruser`(`id`,`usernum`,`passnum`,`userPhone`,`userEmail`,`insertTime`) values (1,'wuhao','wuhao888','15652330299','1650669910@qq.com','2019-04-29 21:55:39'),(2,'123456','123456789','15652330299','1650669910@qq.com','2019-04-29 22:28:34'),(3,'zhangsan','zhangsan','15652330299','1654646@qq.com','2019-04-30 14:56:38'),(4,'wangwu','wangwu','15652330299','54668@qq.com','2019-04-30 15:00:09'),(6,'wuhaoaaa','wuhaoaaa','15652330299','1650669910@qq.com','2019-04-30 15:07:48'),(7,'aaaaa','aaaaaaa','15652330299','15646489@qq.com','2019-05-05 16:04:35');

/*Table structure for table `usertextarea` */

DROP TABLE IF EXISTS `usertextarea`;

CREATE TABLE `usertextarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `text_name` varchar(100) NOT NULL,
  `text_cont` varchar(8000) DEFAULT NULL,
  `text_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `usertextarea_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `inseruser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

/*Data for the table `usertextarea` */

insert  into `usertextarea`(`id`,`u_id`,`text_name`,`text_cont`,`text_time`) values (31,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 18:25:38'),(36,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:56'),(37,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:56'),(38,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:56'),(39,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:57'),(40,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:57'),(41,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:57'),(42,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:57'),(43,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:57'),(44,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:57'),(45,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:58'),(46,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:58'),(47,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:58'),(48,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:58'),(49,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:58'),(50,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:58'),(51,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:59'),(52,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:59'),(53,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:59'),(54,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:59'),(55,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:04:59'),(56,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:00'),(57,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:00'),(58,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:00'),(59,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:00'),(60,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:00'),(61,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:01'),(62,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:01'),(63,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:01'),(64,1,'以此纪念第一个小Demo的生产','愿打开新的大门','2019-05-03 20:05:01'),(65,1,'1','1','2019-05-05 16:05:16'),(66,1,'22','22','2019-05-05 16:06:27'),(67,1,'11','11','2019-05-05 16:06:35'),(68,1,'1231','3213','2019-05-05 16:06:55');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

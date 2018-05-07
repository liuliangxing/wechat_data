-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: jbt_shopping_mall
-- ------------------------------------------------------
-- Server version	5.7.18-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Advertising_position`
--

DROP TABLE IF EXISTS `Advertising_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Advertising_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL COMMENT '广告位名称',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '广告位类型: 1: 商品 2: 类目 3: 活动',
  `value` int(11) NOT NULL COMMENT '跳转值, 当type 为1那就是商品ID, 为2那就是类目ID,为3那就是活动的ID',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `img` varchar(64) NOT NULL COMMENT '广告位图片',
  `position` tinyint(2) NOT NULL DEFAULT '1' COMMENT '广告位 位置(1: 首页 其他待定)',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用 1:启用 2: 禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Advertising_position_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广告位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Advertising_position`
--

LOCK TABLES `Advertising_position` WRITE;
/*!40000 ALTER TABLE `Advertising_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `Advertising_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(32) NOT NULL COMMENT '活动名称',
  `seq` int(11) NOT NULL DEFAULT '0' COMMENT '序号',
  `activity_label` varchar(64) DEFAULT NULL COMMENT '活动标签',
  `activity_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '活动状态: 1.未开始 2.进行中 3.已结束',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_goods`
--

DROP TABLE IF EXISTS `activity_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  `type` tinyint(2) NOT NULL COMMENT '活动类型: 1. 折扣 2.降价 3.无优惠',
  `discount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '活动值: type为1时 折扣值 type为2时降价值 type 为3时 0.00',
  `giftable` tinyint(2) NOT NULL DEFAULT '2' COMMENT '是否有赠品: 1.有 2. 无',
  `gift_value` varchar(64) DEFAULT NULL COMMENT '赠品内容',
  `seq` int(11) NOT NULL COMMENT '序号: 1为首推图片',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用: 1.启用 2.禁用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_goods_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_goods`
--

LOCK TABLES `activity_goods` WRITE;
/*!40000 ALTER TABLE `activity_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_vip`
--

DROP TABLE IF EXISTS `activity_vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vip_id` int(11) NOT NULL COMMENT '活动VIP',
  `activity_id` int(11) NOT NULL COMMENT '活动ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `activity_vip_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动VIP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_vip`
--

LOCK TABLES `activity_vip` WRITE;
/*!40000 ALTER TABLE `activity_vip` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_vip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorities_name` varchar(32) NOT NULL COMMENT '权限名称',
  `menu_notes` varchar(32) NOT NULL COMMENT '菜单文本',
  `parent_id` int(11) NOT NULL DEFAULT '-1' COMMENT '父级菜单ID，顶级 为 -1',
  `menu_path` varchar(64) DEFAULT NULL COMMENT '菜单路径',
  `menu_level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '菜单级别',
  `menu_sort` int(11) NOT NULL DEFAULT '0' COMMENT '菜单层级',
  `icon_name` varchar(32) DEFAULT NULL COMMENT '图片路径',
  `type` tinyint(2) NOT NULL COMMENT '权限类型： 1:菜单权限 2:页面权限 3: 操作权限',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用：1启用 2禁用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'SYSTEM_MANAGE','系统管理',-1,'systemManager',1,1,'icon-navicon-xtgl',1,1,'2018-04-27 06:41:14','2018-03-22 04:03:47'),(2,'AUTHORITIES_MANAGER','权限管理',1,'authoritiesManager',2,1,'icon-shenqingquanxian',2,1,'2018-04-27 07:10:23','2018-03-22 06:12:33'),(3,'ADD_AUTHORITIES','添加权限',2,NULL,0,0,NULL,3,1,'2018-03-28 02:53:56','2018-03-28 02:53:56'),(4,'EDIT_AUTHORITIES','修改权限',2,NULL,0,0,NULL,3,1,'2018-03-29 01:19:26','2018-03-28 02:56:58'),(6,'ROLE_MANAGER','角色管理',1,'roleManager',0,0,'icon-navicon-jsgl',2,1,'2018-04-27 07:07:02','2018-03-29 06:00:38'),(7,'DEL_AUTHORITES','删除权限',2,NULL,0,0,NULL,3,1,'2018-03-29 06:18:49','2018-03-29 06:18:49'),(9,'USER_MANAGER','用户管理',1,'userManager',0,0,'icon-navicon-yhgl',2,1,'2018-04-27 07:09:14','2018-03-29 06:37:36'),(10,'ADD_ROLE','添加角色',6,NULL,0,0,NULL,3,1,'2018-04-26 08:43:17','2018-04-26 08:43:17'),(11,'EDIT_ROLE','修改角色',6,NULL,0,0,NULL,3,1,'2018-04-26 08:43:40','2018-04-26 08:43:40'),(12,'DEL_ROLE','删除角色',6,NULL,0,0,NULL,3,1,'2018-04-26 08:44:08','2018-04-26 08:44:08'),(13,'SELECT_AUTHORITIES','查询权限',2,NULL,0,0,NULL,3,1,'2018-04-26 08:44:59','2018-04-26 08:44:59'),(14,'SELECT_USER','查询用户',9,NULL,0,0,NULL,3,1,'2018-04-26 08:46:10','2018-04-26 08:46:10'),(15,'SELECT_ROLE','查询角色',6,NULL,0,0,NULL,3,1,'2018-04-26 09:10:00','2018-04-26 09:10:00'),(16,'EDIT_USER','修改用户',9,NULL,0,0,NULL,3,1,'2018-04-26 09:10:24','2018-04-26 09:10:24'),(17,'DEL_USER','删除角色',9,NULL,0,0,NULL,3,1,'2018-04-26 09:10:52','2018-04-26 09:10:52'),(18,'ADD_USER','添加用户',9,NULL,0,0,NULL,3,1,'2018-04-27 02:56:56','2018-04-27 02:56:56'),(19,'SET_USER_ROLE','设置用户角色',9,NULL,0,0,NULL,3,1,'2018-04-27 03:23:53','2018-04-27 03:23:11'),(20,'SET_USER_AUTHORITIES','授权',9,NULL,0,0,NULL,3,1,'2018-04-27 03:23:43','2018-04-27 03:23:43');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_style` int(11) NOT NULL COMMENT '商品款式ID',
  `goods_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `activity_id` int(11) DEFAULT NULL COMMENT '活动ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classify_details`
--

DROP TABLE IF EXISTS `classify_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classify_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classify_id` int(11) NOT NULL COMMENT '分类ID',
  `details_name` varchar(64) NOT NULL COMMENT '描述名称',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用: 1启用 2: 禁用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classify_details_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='类别详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classify_details`
--

LOCK TABLES `classify_details` WRITE;
/*!40000 ALTER TABLE `classify_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `classify_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consume_log`
--

DROP TABLE IF EXISTS `consume_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consume_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `amount` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '金额数量',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型: 1: 下单 其他待定',
  `record` varchar(64) NOT NULL COMMENT '消费记录',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `consume_log_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消费日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consume_log`
--

LOCK TABLES `consume_log` WRITE;
/*!40000 ALTER TABLE `consume_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `consume_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_num` varchar(30) NOT NULL COMMENT '商品编号',
  `max_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最大价格',
  `min_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最小价格',
  `goods_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `grounding` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否上架: 1: 上架 2: 下架',
  `free_postage` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '满多少免邮',
  `postage` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `supplier_id` int(11) NOT NULL COMMENT '供货商ID',
  `thumbnail_picture` json DEFAULT NULL COMMENT '缩略图',
  `master_map` json DEFAULT NULL COMMENT '主图',
  `classify_id` int(11) NOT NULL COMMENT '分类ID',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_classify`
--

DROP TABLE IF EXISTS `goods_classify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_classify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classify_name` varchar(32) NOT NULL COMMENT '分类名称',
  `seq` int(11) NOT NULL COMMENT '序号',
  `pid` int(11) NOT NULL COMMENT '父ID: 0 为顶级',
  `classify_png` varchar(128) NOT NULL COMMENT '类别图标',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用： 1、启用 2、禁用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_classify_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_classify`
--

LOCK TABLES `goods_classify` WRITE;
/*!40000 ALTER TABLE `goods_classify` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_classify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_param`
--

DROP TABLE IF EXISTS `goods_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `details_id` int(11) DEFAULT NULL,
  `details_value` varchar(64) DEFAULT NULL COMMENT '详情值',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_param_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_param`
--

LOCK TABLES `goods_param` WRITE;
/*!40000 ALTER TABLE `goods_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_style`
--

DROP TABLE IF EXISTS `goods_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_style` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style` varchar(32) NOT NULL COMMENT '商品分类名',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品分类价格',
  `supplier_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '供货商价格',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `thumbnail_picture` varchar(200) NOT NULL COMMENT '缩略图',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用: 1启用 2: 禁用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_classify_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_style`
--

LOCK TABLES `goods_style` WRITE;
/*!40000 ALTER TABLE `goods_style` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_collection`
--

DROP TABLE IF EXISTS `my_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用： 1.启用 2.禁用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collection_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_collection`
--

LOCK TABLES `my_collection` WRITE;
/*!40000 ALTER TABLE `my_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '订单状态：1:待支付 2:待发货 3:待收货 4:已完成 5:已取消',
  `order_no` varchar(32) NOT NULL COMMENT '订单号',
  `express_no` varchar(64) DEFAULT NULL COMMENT '快递号',
  `express_company` int(11) DEFAULT NULL COMMENT '快递公司',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `delivery_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发货时间',
  `freight` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `supplier` int(11) NOT NULL COMMENT '供货商',
  `order_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `address` varchar(128) NOT NULL COMMENT '收货地址',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_info`
--

DROP TABLE IF EXISTS `orders_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_name` varchar(64) NOT NULL COMMENT '商品名称',
  `goods_style` varchar(64) NOT NULL COMMENT '商品款式名称',
  `goods_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_count` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_style_thumbnail_picture` varchar(128) NOT NULL COMMENT '商品款式缩略图',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_style_id` int(11) NOT NULL COMMENT '商品款式ID',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_info_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_info`
--

LOCK TABLES `orders_info` WRITE;
/*!40000 ALTER TABLE `orders_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_user`
--

DROP TABLE IF EXISTS `platform_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `admin` tinyint(2) NOT NULL DEFAULT '2' COMMENT '是否管理员：1管理员，2.普通用户',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用 1: 启用 2: 禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform_user_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='运营人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_user`
--

LOCK TABLES `platform_user` WRITE;
/*!40000 ALTER TABLE `platform_user` DISABLE KEYS */;
INSERT INTO `platform_user` VALUES (1,'13718147368','刘良星','e10adc3949ba59abbe56e057f20f883e',1,1),(2,'123456','123456','e10adc3949ba59abbe56e057f20f883e',2,1),(3,'123','456','202cb962ac59075b964b07152d234b70',2,1);
/*!40000 ALTER TABLE `platform_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_desc` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用： 1、启用 2、禁用',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'超级管理员','管理所有人',1,'2018-04-26 02:12:12','2018-04-23 03:15:45'),(2,'代理商','给代理商们用的权限',1,'2018-04-26 06:32:47','2018-04-25 08:58:38'),(3,'测试','给测试人员用的',1,'2018-04-26 05:47:06','2018-04-26 05:47:06');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_authorities`
--

DROP TABLE IF EXISTS `role_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `authorities_id` int(11) NOT NULL COMMENT '权限Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_authorities_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_authorities`
--

LOCK TABLES `role_authorities` WRITE;
/*!40000 ALTER TABLE `role_authorities` DISABLE KEYS */;
INSERT INTO `role_authorities` VALUES (94,1,1),(95,1,2),(96,1,3),(97,1,4),(98,1,7),(99,1,13),(100,1,6),(101,1,10),(102,1,11),(103,1,12),(104,1,15),(105,1,9),(106,1,14),(107,1,16),(108,1,17),(109,1,19),(110,1,20),(111,1,18),(116,2,1),(117,3,1),(118,3,2),(119,3,6),(120,3,9);
/*!40000 ALTER TABLE `role_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(32) NOT NULL COMMENT '供货商名称',
  `supplier_contacts` varchar(11) DEFAULT NULL COMMENT '供货商联系人',
  `supplier_spare` varchar(11) DEFAULT NULL COMMENT '供货商备用联系人',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `profit_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '盈利金额',
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用: 1:启用 2: 禁用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Supplier_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='供货商';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authorities`
--

DROP TABLE IF EXISTS `user_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '运营用户ID',
  `authorities_id` int(11) NOT NULL COMMENT '权限Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_authorities_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='用户权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authorities`
--

LOCK TABLES `user_authorities` WRITE;
/*!40000 ALTER TABLE `user_authorities` DISABLE KEYS */;
INSERT INTO `user_authorities` VALUES (17,1,1),(18,1,2),(19,1,3),(20,1,6),(21,1,9),(35,2,1),(36,2,2),(37,2,6),(38,2,9);
/*!40000 ALTER TABLE `user_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '运营用户Id',
  `role_id` int(11) NOT NULL COMMENT '角色Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_role_id_uindex` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (5,1,1),(8,3,3),(10,2,3);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vip`
--

DROP TABLE IF EXISTS `vip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_count` int(11) NOT NULL DEFAULT '0' COMMENT '开始数量',
  `end_count` int(11) NOT NULL DEFAULT '0' COMMENT '结束数量',
  `vip_name` int(11) NOT NULL COMMENT '会员名称',
  `vip_grade` int(11) NOT NULL DEFAULT '1' COMMENT 'vip 等级',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用: 1:启用 2: 禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vip_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='会员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vip`
--

LOCK TABLES `vip` WRITE;
/*!40000 ALTER TABLE `vip` DISABLE KEYS */;
/*!40000 ALTER TABLE `vip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_user`
--

DROP TABLE IF EXISTS `wechat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wechat_user_id_uindex` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_user`
--

LOCK TABLES `wechat_user` WRITE;
/*!40000 ALTER TABLE `wechat_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-07 11:25:11

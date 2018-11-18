-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: 101.200.125.126    Database: kucun
-- ------------------------------------------------------
-- Server version	5.5.49

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
-- Table structure for table `lh_act_log`
--

DROP TABLE IF EXISTS `lh_act_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_act_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `admin_name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `add_time` int(11) DEFAULT NULL COMMENT '操作日志',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_act_log`
--

LOCK TABLES `lh_act_log` WRITE;
/*!40000 ALTER TABLE `lh_act_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_act_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_admin`
--

DROP TABLE IF EXISTS `lh_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_admin` (
  `admin_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_username` varchar(20) NOT NULL COMMENT '管理员用户名',
  `admin_pwd` varchar(70) NOT NULL COMMENT '管理员密码',
  `admin_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `admin_email` varchar(30) NOT NULL COMMENT '邮箱',
  `admin_realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `admin_tel` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `admin_hits` int(8) NOT NULL DEFAULT '1' COMMENT '登陆次数',
  `admin_ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `admin_addtime` int(11) NOT NULL COMMENT '添加时间',
  `admin_mdemail` varchar(50) NOT NULL DEFAULT '0' COMMENT '传递修改密码参数加密',
  `admin_open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审核状态',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_admin`
--

LOCK TABLES `lh_admin` WRITE;
/*!40000 ALTER TABLE `lh_admin` DISABLE KEYS */;
INSERT INTO `lh_admin` VALUES (1,'admin','e10adc3949ba59abbe56e057f20f883e','Public/uploads/5acc76a40e204b56c1.jpg','864491238@qq.com','郭乐彬','18893713766',443,'127.0.0.1',112222233,'1a0cbaee0f6041af3922a0f4dac1a547',1),(12,'user','e10adc3949ba59abbe56e057f20f883e','','112','laijunqian','21212313212',3,'183.25.125.92',1530585136,'0',1);
/*!40000 ALTER TABLE `lh_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_auth_group`
--

DROP TABLE IF EXISTS `lh_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_auth_group`
--

LOCK TABLES `lh_auth_group` WRITE;
/*!40000 ALTER TABLE `lh_auth_group` DISABLE KEYS */;
INSERT INTO `lh_auth_group` VALUES (1,'超级管理员',1,'1,2,6,19,110,3,4,5,15,16,90,91,92,93,17,94,95,96,97,98,18,99,100,101,102,103,83,104,107,108,109,126,127,128,129,130,132,133,134,22,23,24,55,56,143,144,145,146,58,139,140,141,142,59,138,135,136,137,60,61,147,148,149,150,62,151,152,153,154,63,64,65,66,157,1',1212451252),(5,'办公室',1,'1,2,6,',1459056252),(6,'工程部',1,'',1459056396),(7,'财务部',1,',',1459056409);
/*!40000 ALTER TABLE `lh_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_auth_group_access`
--

DROP TABLE IF EXISTS `lh_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_auth_group_access`
--

LOCK TABLES `lh_auth_group_access` WRITE;
/*!40000 ALTER TABLE `lh_auth_group_access` DISABLE KEYS */;
INSERT INTO `lh_auth_group_access` VALUES (1,1),(7,5),(9,7),(11,1),(12,5);
/*!40000 ALTER TABLE `lh_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_auth_rule`
--

DROP TABLE IF EXISTS `lh_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` varchar(20) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_auth_rule`
--

LOCK TABLES `lh_auth_rule` WRITE;
/*!40000 ALTER TABLE `lh_auth_rule` DISABLE KEYS */;
INSERT INTO `lh_auth_rule` VALUES (1,'Sys','系统管理',1,1,'fa-gear','',0,0,1446535750),(2,'Sys/sys','系统参数设置',1,1,'','',1,0,1446535789),(3,'Database','数据库管理',1,0,'fa-database','',0,0,1446535805),(4,'Database/database','数据库备份',1,0,'','',3,50,1446535750),(5,'Database/import','数据库下载',1,0,'','',3,50,1446535834),(6,'Sys/sys','站点设置',1,1,'','',2,0,1446535843),(8,'Sys/admin_list','用户管理',1,1,'','',1,0,1446535750),(9,'Sys/admin_group','角色管理',1,1,'','',1,0,1446535750),(10,'Sys/admin_rule','菜单管理',1,1,'','',1,1,1446535750),(11,'Sys/emailsys','邮件设置',1,0,'','',1,0,1446535750),(12,'Sys/admin_group_access','权限设置',1,1,'','',9,50,1456989549),(13,'Sys/pwd','修改密码',1,1,'','',2,50,1457018382),(207,'Logs','日志管理',1,1,'fa-file-text-o','',0,1,1459140389),(208,'Logs/logs_list','登陆日志',1,1,'','',207,50,1459140402),(209,'Member','会员管理',1,0,'fa-users','',0,50,1459151001),(210,'Member/index','会员列表',1,0,'','',209,50,1459151063),(211,'Logs/visitor_list','访客日志',1,0,'','',207,50,1459177577),(212,'Sys/admin_list_add','添加用户',1,1,'','',8,50,1459944362),(213,'Sys/admin_list_edit','编辑用户',1,1,'','',8,50,1459944382),(214,'Sys/admin_list_del','删除用户',1,1,'','',8,50,1459944403),(215,'Sys/admin_group','添加角色',1,1,'','',9,50,1459944558),(216,'Sys/admin_group_edit','编辑角色',1,1,'','',9,50,1459944593),(217,'Sys/admin_group_del','删除角色',1,1,'','',9,50,1459944616),(218,'Sys/admin_rule_add','添加菜单',1,1,'','',10,50,1459944692),(219,'Sys/admin_rule_edit','编辑菜单',1,1,'','',10,50,1459944710),(220,'Sys/admin_rule_del','删除菜单',1,1,'','',10,50,1459944732),(221,'Sys/ruleorder','菜单排序',1,1,'','',10,50,1459944801),(222,'Sys/emailsys','保存邮件设置',1,0,'','',11,50,1459944841),(223,'Logs/action_list','操作日志',1,1,'','',207,50,1512541520),(224,'Messageset','公司信息',1,1,'fa-book','',0,2,1522290447),(225,'Messageset/msgset','公司信息设置',1,1,'','',224,50,1522290700),(226,'Customer','客户管理',1,1,'fa-user','',0,3,1522302718),(227,'Customer/index','客户',1,1,'','',226,50,1522302831),(228,'Receipt','客户收款管理',1,1,'fa-eur','',0,5,1522310540),(229,'Receipt/index','客户收款',1,1,'','',228,50,1522310601),(230,'Commodity','商品管理',1,1,'fa-cubes','',0,4,1522315790),(235,'Statistic/index','数据导出',1,1,'','',234,50,1522649180),(231,'Commodity/index','商品',1,1,'','',230,50,1522316170),(232,'Invoice','货单管理',1,1,'fa-calculator','',0,6,1522372239),(233,'Invoice/index','货单录入',1,1,'','',232,50,1522372270),(234,'Statistic','数据统计',1,1,'fa-bar-chart','',0,7,1522648926),(236,'Statistic/commodity','商品销售统计',1,1,'','',234,50,1523701034);
/*!40000 ALTER TABLE `lh_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_keyword`
--

DROP TABLE IF EXISTS `lh_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`keyword_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_keyword`
--

LOCK TABLES `lh_keyword` WRITE;
/*!40000 ALTER TABLE `lh_keyword` DISABLE KEYS */;
INSERT INTO `lh_keyword` VALUES (1,'销售渠道',0),(2,'网上',1),(3,'外呼',1),(4,'朋友介绍',1),(5,'老客户介绍',1),(6,'线下跑单',1),(7,'做活动',1),(8,'小区割接',1);
/*!40000 ALTER TABLE `lh_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_log`
--

DROP TABLE IF EXISTS `lh_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=711 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_log`
--

LOCK TABLES `lh_log` WRITE;
/*!40000 ALTER TABLE `lh_log` DISABLE KEYS */;
INSERT INTO `lh_log` VALUES (634,1,'admin','用户登录',NULL,1,1522287790),(635,1,'admin','用户登录',NULL,1,1522308327),(636,1,'admin','用户登录',NULL,1,1522369935),(637,1,'admin','用户登录',NULL,1,1522370132),(638,1,'admin','用户登录',NULL,1,1522628861),(639,1,'admin','用户登录',NULL,1,1522715196),(640,1,'admin','用户登录',NULL,1,1522743841),(641,1,'admin','用户登录',NULL,1,1522802095),(642,1,'admin','用户登录',NULL,1,1522806730),(643,1,'admin','用户登录',NULL,1,1522807936),(644,1,'admin','用户登录',NULL,1,1523147284),(645,1,'admin','用户登录',NULL,1,1523156741),(646,1,'admin','用户登录',NULL,1,1523158922),(647,1,'admin','用户登录',NULL,1,1523171628),(648,1,'admin','用户登录',NULL,1,1523174557),(649,1,'admin','用户登录',NULL,1,1523176741),(650,1,'admin','用户登录',NULL,1,1523181171),(651,1,'admin','用户登录',NULL,1,1523233983),(652,1,'admin','用户登录',NULL,1,1523243046),(653,1,'admin','用户登录',NULL,1,1523270423),(654,1,'admin','用户登录',NULL,1,1523273168),(655,1,'admin','用户登录',NULL,1,1523275669),(656,1,'admin','用户登录',NULL,1,1523320775),(657,1,'admin','用户登录',NULL,1,1523325083),(658,1,'admin','用户登录',NULL,1,1523346016),(659,1,'admin','用户登录',NULL,1,1523408981),(660,1,'admin','用户登录',NULL,1,1523415681),(661,1,'admin','用户登录',NULL,1,1523433423),(662,1,'admin','用户登录',NULL,1,1523433580),(663,1,'admin','用户登录',NULL,1,1523436985),(664,1,'admin','用户登录',NULL,1,1523437031),(665,1,'admin','用户登录',NULL,1,1523583178),(666,1,'admin','用户登录',NULL,1,1523671988),(667,1,'admin','用户登录',NULL,1,1523672100),(668,1,'admin','用户登录',NULL,1,1523672336),(669,1,'admin','用户登录',NULL,1,1523672777),(670,1,'admin','用户登录',NULL,1,1523675424),(671,1,'admin','用户登录',NULL,1,1523700849),(672,1,'admin','用户登录',NULL,1,1523806857),(673,1,'admin','用户登录',NULL,1,1523844763),(674,1,'admin','用户登录',NULL,1,1523936070),(675,1,'admin','用户登录',NULL,1,1524041613),(676,1,'admin','用户登录',NULL,1,1524229546),(677,1,'admin','用户登录',NULL,1,1524229698),(678,1,'admin','用户登录',NULL,1,1524229877),(679,1,'admin','用户登录',NULL,1,1524229994),(680,1,'admin','用户登录',NULL,1,1524230083),(681,1,'admin','用户登录',NULL,1,1524233283),(682,1,'admin','用户登录',NULL,1,1524902734),(683,1,'admin','用户登录',NULL,1,1530580867),(684,1,'admin','用户登录',NULL,1,1530584402),(685,1,'admin','用户登录',NULL,1,1530584556),(686,1,'admin','用户登录',NULL,1,1530584659),(687,12,'user','用户登录',NULL,1,1530585237),(688,1,'admin','用户登录',NULL,1,1530585284),(689,12,'user','用户登录',NULL,1,1530585319),(690,1,'admin','用户登录',NULL,1,1530585356),(691,1,'admin','用户登录',NULL,1,1530586535),(692,1,'admin','用户登录',NULL,1,1530587147),(693,1,'admin','用户登录',NULL,1,1530587812),(694,1,'admin','用户登录',NULL,1,1530587893),(695,1,'admin','用户登录',NULL,1,1530588304),(696,1,'admin','用户登录',NULL,1,1530588835),(697,1,'admin','用户登录',NULL,1,1530588860),(698,1,'admin','用户登录',NULL,1,1530589690),(699,1,'admin','用户登录',NULL,1,1530590540),(700,1,'admin','用户登录',NULL,1,1530597959),(701,1,'admin','用户登录',NULL,1,1530598071),(702,1,'admin','用户登录',NULL,1,1530598362),(703,1,'admin','用户登录',NULL,1,1530605990),(704,1,'admin','用户登录',NULL,1,1530665158),(705,1,'admin','用户登录',NULL,1,1530709783),(706,1,'admin','用户登录',NULL,1,1530751511),(707,1,'admin','用户登录',NULL,1,1530800626),(708,1,'admin','用户登录',NULL,1,1530805837),(709,1,'admin','用户登录',NULL,1,1530806634),(710,1,'admin','用户登录',NULL,1,1530838301);
/*!40000 ALTER TABLE `lh_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_member_group`
--

DROP TABLE IF EXISTS `lh_member_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_member_group` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `groupname` varchar(30) NOT NULL COMMENT '部门名称',
  `open` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `order` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_member_group`
--

LOCK TABLES `lh_member_group` WRITE;
/*!40000 ALTER TABLE `lh_member_group` DISABLE KEYS */;
INSERT INTO `lh_member_group` VALUES (7,'办公室',1,'',50),(8,'营销部',1,'',50),(9,'工程部',1,'',50),(10,'财务部',1,'',50),(11,'人事部',1,'',50),(12,'技术部',1,'',50);
/*!40000 ALTER TABLE `lh_member_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_member_list`
--

DROP TABLE IF EXISTS `lh_member_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_member_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `province` int(6) NOT NULL COMMENT '城市',
  `city` int(6) NOT NULL COMMENT '市县',
  `town` int(6) NOT NULL COMMENT '乡镇',
  `sex` tinyint(2) NOT NULL DEFAULT '3' COMMENT '1=男  2=女  3=保密',
  `headpic` varchar(100) NOT NULL DEFAULT '' COMMENT '会员头像路径',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态  0关闭  1开启',
  `birthdate` int(11) NOT NULL COMMENT '出生日期',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `address` varchar(255) DEFAULT NULL COMMENT '会员地址',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `index_member_list_id` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_member_list`
--

LOCK TABLES `lh_member_list` WRITE;
/*!40000 ALTER TABLE `lh_member_list` DISABLE KEYS */;
INSERT INTO `lh_member_list` VALUES (12,'1',0,0,0,1,'','1','1',1,0,1522289796,'1','1');
/*!40000 ALTER TABLE `lh_member_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_member_lvl`
--

DROP TABLE IF EXISTS `lh_member_lvl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_member_lvl` (
  `lvl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `lvl_name` varchar(20) NOT NULL COMMENT '等级名称',
  `lvl_note` varchar(255) DEFAULT NULL,
  `lvl_open` varchar(255) DEFAULT NULL,
  `lvl_order` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lvl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_member_lvl`
--

LOCK TABLES `lh_member_lvl` WRITE;
/*!40000 ALTER TABLE `lh_member_lvl` DISABLE KEYS */;
INSERT INTO `lh_member_lvl` VALUES (8,'总经理','','1','50'),(9,'技术经理','','1','50'),(10,'项目经理','','1','50'),(11,'销售员','','1','50'),(12,'录单员','','1','50'),(13,'工程人员','','1','50'),(14,'人事经理','','1','50'),(15,'财务经理','','1','50'),(16,'销售部经理','','1','50'),(17,'后台支撑','','1','50');
/*!40000 ALTER TABLE `lh_member_lvl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_sys`
--

DROP TABLE IF EXISTS `lh_sys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_sys` (
  `sys_id` int(36) unsigned NOT NULL,
  `sys_name` char(36) NOT NULL DEFAULT '',
  `sys_url` varchar(36) NOT NULL DEFAULT '',
  `sys_title` varchar(200) NOT NULL,
  `sys_key` varchar(200) NOT NULL,
  `sys_des` varchar(200) NOT NULL,
  `email_open` tinyint(2) NOT NULL COMMENT '邮箱发送是否开启',
  `email_name` varchar(50) NOT NULL COMMENT '发送邮箱账号',
  `email_pwd` varchar(50) NOT NULL COMMENT '发送邮箱密码',
  `email_smtpname` varchar(50) NOT NULL COMMENT 'smtp服务器账号',
  `email_emname` varchar(30) NOT NULL COMMENT '邮件名',
  `email_rename` varchar(30) NOT NULL COMMENT '发件人姓名',
  PRIMARY KEY (`sys_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_sys`
--

LOCK TABLES `lh_sys` WRITE;
/*!40000 ALTER TABLE `lh_sys` DISABLE KEYS */;
INSERT INTO `lh_sys` VALUES (1,'一匠科技后台管理系统','http://ilunhui.cn','一匠科技后台管理系统','一匠科技后台管理系统，thinkphp,H+','一匠科技后台管理系统',1,'864491238@qq.com','','smtp.qq.com','864491238','田建龙');
/*!40000 ALTER TABLE `lh_sys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_commodity`
--

DROP TABLE IF EXISTS `t_commodity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_commodity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `productid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '商品编号',
  `productname` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '商品规格',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `number` int(11) DEFAULT NULL COMMENT '商品箱数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_commodity`
--

LOCK TABLES `t_commodity` WRITE;
/*!40000 ALTER TABLE `t_commodity` DISABLE KEYS */;
INSERT INTO `t_commodity` VALUES (5,'H329191633297609','蜡烛','高档',10.00,10,'2018-03-29 18:26:03','2018-07-04 01:10:16'),(10,'H703067241340666','纸巾','低档',30.00,20,'2018-07-03 16:32:04','2018-07-03 09:08:33'),(7,'H330703905750292','铁锤','低档',120.00,20,'2018-03-30 08:39:50','2018-07-03 09:08:34'),(8,'H330704139969197','棒子','低档',152.00,20,'2018-03-30 08:40:13','2018-07-03 09:08:35'),(11,'H703107900316271','衬衫','高档',199.00,20,'2018-07-03 17:39:50',NULL);
/*!40000 ALTER TABLE `t_commodity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_customer`
--

DROP TABLE IF EXISTS `t_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '公司名称',
  `leader` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '座机号码',
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `create_time` int(11) DEFAULT NULL COMMENT '出账时间（创建时间）',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `detailed` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '账户明细',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='客户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_customer`
--

LOCK TABLES `t_customer` WRITE;
/*!40000 ALTER TABLE `t_customer` DISABLE KEYS */;
INSERT INTO `t_customer` VALUES (6,'惠州科技有限公司','吴靓','12345678910','123546878','惠州市',1522771200,'2018-04-04 01:33:39',''),(9,'惠州学院','张飞','13669586274','2625185','惠州市惠州学院',1530585743,'2018-07-04 01:07:55',NULL),(7,'惠州无敌科技有限公司','张三','12345678910','12345678','惠州市',1522656892,NULL,NULL),(8,'众匠科技','郭乐彬','13824289487','2500150','揭阳市棉湖镇',1523276451,NULL,NULL);
/*!40000 ALTER TABLE `t_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_invoice`
--

DROP TABLE IF EXISTS `t_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_invoice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `orderid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订单编号',
  `shipment_time` int(10) DEFAULT NULL COMMENT '发货日期',
  `customer_id` int(10) DEFAULT NULL COMMENT '客户名称',
  `operator` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作员',
  `total` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `remark` text COLLATE utf8_bin COMMENT '备注',
  `credits_price` decimal(10,2) DEFAULT NULL COMMENT '减免金额',
  `amount_payable` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `total` (`total`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_invoice`
--

LOCK TABLES `t_invoice` WRITE;
/*!40000 ALTER TABLE `t_invoice` DISABLE KEYS */;
INSERT INTO `t_invoice` VALUES (80,'20180704173037859809',1530696637,6,'郭乐彬',100.00,'2018-07-04 17:30:37',NULL,'',0.00,100.00),(81,'20180704173223494459',1530696743,6,'郭乐彬',3040.00,'2018-07-04 17:32:23',NULL,'',0.00,3040.00),(84,'20180705100301352158',1530756181,6,'郭乐彬',6000.00,'2018-07-05 10:03:01',NULL,'',0.00,6000.00),(85,'20180705113620830905',1530761780,8,'郭乐彬',300.00,'2018-07-05 11:36:20',NULL,'',0.00,300.00);
/*!40000 ALTER TABLE `t_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_msgset`
--

DROP TABLE IF EXISTS `t_msgset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_msgset` (
  `id` int(11) unsigned NOT NULL COMMENT 'id',
  `company_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `company_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '公司地址',
  `company_phone` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '公司电话',
  `company_fax` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公司传真',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公司信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_msgset`
--

LOCK TABLES `t_msgset` WRITE;
/*!40000 ALTER TABLE `t_msgset` DISABLE KEYS */;
INSERT INTO `t_msgset` VALUES (1,'一匠科技有限科技公司','惠州市惠城区紫金商会一楼','13824289487','2500150',NULL,'2018-04-09 12:09:04');
/*!40000 ALTER TABLE `t_msgset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `commodity_id` int(11) NOT NULL COMMENT '商品id',
  `invoice_id` int(11) unsigned DEFAULT NULL,
  `piece` int(10) DEFAULT NULL COMMENT '件数',
  `packnum` int(10) DEFAULT NULL COMMENT '包装量',
  `num` int(10) DEFAULT NULL COMMENT '数量',
  `box` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '单位',
  `create_time` int(10) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invoiceid` (`invoice_id`),
  CONSTRAINT `invoiceid` FOREIGN KEY (`invoice_id`) REFERENCES `t_invoice` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
INSERT INTO `t_order` VALUES (124,5,80,1,10,10,'箱',1530696637,NULL),(125,8,81,1,20,20,'箱',1530696743,NULL),(128,10,84,10,20,200,'',1530756181,NULL),(129,5,85,1,10,10,'',1530761781,NULL),(130,5,85,2,10,20,'',1530761781,NULL);
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_receipt`
--

DROP TABLE IF EXISTS `t_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_receipt` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customername` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '客户名称',
  `operator` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作员',
  `receipt_time` int(10) DEFAULT NULL COMMENT '收款时间',
  `receipt_price` decimal(10,2) DEFAULT NULL COMMENT '收款金额',
  `credits_price` decimal(10,2) DEFAULT NULL COMMENT '减免金额',
  `refund` int(10) DEFAULT NULL COMMENT '0：现金 1：私人账户 2：对公账户 //还款方式',
  `personname` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '//经手人姓名',
  `cardnum` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '私人银行卡账号',
  `account` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '对公账号',
  `remark` text COLLATE utf8_bin COMMENT '备注',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `customer_id` int(11) DEFAULT NULL COMMENT '客户id',
  `invoice_id` int(11) DEFAULT NULL COMMENT '销售单id',
  `pay_state` int(10) DEFAULT '0' COMMENT '0：还款  1：欠款  //款项状态',
  `debt` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_receipt`
--

LOCK TABLES `t_receipt` WRITE;
/*!40000 ALTER TABLE `t_receipt` DISABLE KEYS */;
INSERT INTO `t_receipt` VALUES (62,'吴靓','郭乐彬',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1530696637,NULL,6,80,1,100.00),(63,'吴靓','郭乐彬',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1530696743,NULL,6,81,1,3040.00),(65,'吴靓','郭乐彬',1530633600,140.00,0.00,0,'','',NULL,'',1530698049,NULL,6,NULL,0,140.00),(67,'吴靓','郭乐彬',1530720000,2000.00,0.00,0,'','',NULL,'',1530756143,NULL,6,NULL,0,2000.00),(68,'吴靓','郭乐彬',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1530756181,NULL,6,84,1,6000.00),(69,'郭乐彬','郭乐彬',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1530761780,NULL,8,85,1,300.00),(70,'吴靓','郭乐彬',1530720000,8000.00,0.00,0,'','',NULL,'',1530776986,NULL,6,NULL,0,8000.00);
/*!40000 ALTER TABLE `t_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `t_receipt_order_commodity`
--

DROP TABLE IF EXISTS `t_receipt_order_commodity`;
/*!50001 DROP VIEW IF EXISTS `t_receipt_order_commodity`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `t_receipt_order_commodity` (
  `id` tinyint NOT NULL,
  `customer_id` tinyint NOT NULL,
  `customername` tinyint NOT NULL,
  `operator` tinyint NOT NULL,
  `productname` tinyint NOT NULL,
  `piece` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `number` tinyint NOT NULL,
  `total` tinyint NOT NULL,
  `receipt_time` tinyint NOT NULL,
  `receipt_price` tinyint NOT NULL,
  `credits_price` tinyint NOT NULL,
  `create_time` tinyint NOT NULL,
  `pay_state` tinyint NOT NULL,
  `debt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `t_receipt_order_commodity`
--

/*!50001 DROP TABLE IF EXISTS `t_receipt_order_commodity`*/;
/*!50001 DROP VIEW IF EXISTS `t_receipt_order_commodity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kucun`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `t_receipt_order_commodity` AS select `t_receipt`.`id` AS `id`,`t_receipt`.`customer_id` AS `customer_id`,`t_receipt`.`customername` AS `customername`,`t_receipt`.`operator` AS `operator`,`t_commodity`.`productname` AS `productname`,`t_order`.`piece` AS `piece`,`t_commodity`.`price` AS `price`,`t_commodity`.`number` AS `number`,((`t_order`.`piece` * `t_commodity`.`price`) * `t_commodity`.`number`) AS `total`,`t_receipt`.`receipt_time` AS `receipt_time`,`t_receipt`.`receipt_price` AS `receipt_price`,`t_receipt`.`credits_price` AS `credits_price`,`t_receipt`.`create_time` AS `create_time`,`t_receipt`.`pay_state` AS `pay_state`,`t_receipt`.`debt` AS `debt` from (((`t_receipt` left join `t_invoice` on((`t_receipt`.`invoice_id` = `t_invoice`.`id`))) left join `t_order` on((`t_receipt`.`invoice_id` = `t_order`.`invoice_id`))) left join `t_commodity` on((`t_order`.`commodity_id` = `t_commodity`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-06 13:52:25

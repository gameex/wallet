-- MySQL dump 10.13  Distrib 5.6.45, for Linux (x86_64)
--
-- Host: localhost    Database: walletapi
-- ------------------------------------------------------
-- Server version	5.6.45-log

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
-- Table structure for table `jl_admin_menu`
--

DROP TABLE IF EXISTS `jl_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_admin_menu`
--

LOCK TABLES `jl_admin_menu` WRITE;
/*!40000 ALTER TABLE `jl_admin_menu` DISABLE KEYS */;
INSERT INTO `jl_admin_menu` VALUES (1,0,0,0,20,'admin','Plugin','default','','插件中心','cloud',''),(2,1,1,1,10000,'admin','Hook','index','','钩子管理','','钩子管理'),(3,2,1,0,10000,'admin','Hook','plugins','','钩子插件管理','','钩子插件管理'),(4,2,2,0,10000,'admin','Hook','pluginListOrder','','钩子插件排序','','钩子插件排序'),(5,2,1,0,10000,'admin','Hook','sync','','同步钩子','','同步钩子'),(6,0,0,1,0,'admin','Setting','default','','设置','cogs','系统设置入口'),(7,6,1,0,50,'admin','Link','index','','友情链接','','友情链接管理'),(8,7,1,0,10000,'admin','Link','add','','添加友情链接','','添加友情链接'),(9,7,2,0,10000,'admin','Link','addPost','','添加友情链接提交保存','','添加友情链接提交保存'),(10,7,1,0,10000,'admin','Link','edit','','编辑友情链接','','编辑友情链接'),(11,7,2,0,10000,'admin','Link','editPost','','编辑友情链接提交保存','','编辑友情链接提交保存'),(12,7,2,0,10000,'admin','Link','delete','','删除友情链接','','删除友情链接'),(13,7,2,0,10000,'admin','Link','listOrder','','友情链接排序','','友情链接排序'),(14,7,2,0,10000,'admin','Link','toggle','','友情链接显示隐藏','','友情链接显示隐藏'),(15,6,1,0,10,'admin','Mailer','index','','邮箱配置','','邮箱配置'),(16,15,2,0,10000,'admin','Mailer','indexPost','','邮箱配置提交保存','','邮箱配置提交保存'),(17,15,1,0,10000,'admin','Mailer','template','','邮件模板','','邮件模板'),(18,15,2,0,10000,'admin','Mailer','templatePost','','邮件模板提交','','邮件模板提交'),(19,15,1,0,10000,'admin','Mailer','test','','邮件发送测试','','邮件发送测试'),(20,6,1,0,10000,'admin','Menu','index','','后台菜单','','后台菜单管理'),(21,20,1,0,10000,'admin','Menu','lists','','所有菜单','','后台所有菜单列表'),(22,20,1,0,10000,'admin','Menu','add','','后台菜单添加','','后台菜单添加'),(23,20,2,0,10000,'admin','Menu','addPost','','后台菜单添加提交保存','','后台菜单添加提交保存'),(24,20,1,0,10000,'admin','Menu','edit','','后台菜单编辑','','后台菜单编辑'),(25,20,2,0,10000,'admin','Menu','editPost','','后台菜单编辑提交保存','','后台菜单编辑提交保存'),(26,20,2,0,10000,'admin','Menu','delete','','后台菜单删除','','后台菜单删除'),(27,20,2,0,10000,'admin','Menu','listOrder','','后台菜单排序','','后台菜单排序'),(28,20,1,0,10000,'admin','Menu','getActions','','导入新后台菜单','','导入新后台菜单'),(29,6,1,0,30,'admin','Nav','index','','导航管理','','导航管理'),(30,29,1,0,10000,'admin','Nav','add','','添加导航','','添加导航'),(31,29,2,0,10000,'admin','Nav','addPost','','添加导航提交保存','','添加导航提交保存'),(32,29,1,0,10000,'admin','Nav','edit','','编辑导航','','编辑导航'),(33,29,2,0,10000,'admin','Nav','editPost','','编辑导航提交保存','','编辑导航提交保存'),(34,29,2,0,10000,'admin','Nav','delete','','删除导航','','删除导航'),(35,29,1,0,10000,'admin','NavMenu','index','','导航菜单','','导航菜单'),(36,35,1,0,10000,'admin','NavMenu','add','','添加导航菜单','','添加导航菜单'),(37,35,2,0,10000,'admin','NavMenu','addPost','','添加导航菜单提交保存','','添加导航菜单提交保存'),(38,35,1,0,10000,'admin','NavMenu','edit','','编辑导航菜单','','编辑导航菜单'),(39,35,2,0,10000,'admin','NavMenu','editPost','','编辑导航菜单提交保存','','编辑导航菜单提交保存'),(40,35,2,0,10000,'admin','NavMenu','delete','','删除导航菜单','','删除导航菜单'),(41,35,2,0,10000,'admin','NavMenu','listOrder','','导航菜单排序','','导航菜单排序'),(42,6,1,0,10000,'admin','Plugin','index','','短信其它','',''),(43,42,2,0,10000,'admin','Plugin','toggle','','插件启用禁用','','插件启用禁用'),(44,42,1,0,10000,'admin','Plugin','setting','','插件设置','','插件设置'),(45,42,2,0,10000,'admin','Plugin','settingPost','','插件设置提交','','插件设置提交'),(46,42,2,0,10000,'admin','Plugin','install','','插件安装','','插件安装'),(47,42,2,0,10000,'admin','Plugin','update','','插件更新','','插件更新'),(48,42,2,0,10000,'admin','Plugin','uninstall','','卸载插件','','卸载插件'),(49,110,0,1,10000,'admin','User','default','','管理组','','管理组'),(50,49,1,1,10000,'admin','Rbac','index','','角色管理','','角色管理'),(51,50,1,0,10000,'admin','Rbac','roleAdd','','添加角色','','添加角色'),(52,50,2,0,10000,'admin','Rbac','roleAddPost','','添加角色提交','','添加角色提交'),(53,50,1,0,10000,'admin','Rbac','roleEdit','','编辑角色','','编辑角色'),(54,50,2,0,10000,'admin','Rbac','roleEditPost','','编辑角色提交','','编辑角色提交'),(55,50,2,0,10000,'admin','Rbac','roleDelete','','删除角色','','删除角色'),(56,50,1,0,10000,'admin','Rbac','authorize','','设置角色权限','','设置角色权限'),(57,50,2,0,10000,'admin','Rbac','authorizePost','','角色授权提交','','角色授权提交'),(58,0,1,0,10000,'admin','RecycleBin','index','','回收站','','回收站'),(59,58,2,0,10000,'admin','RecycleBin','restore','','回收站还原','','回收站还原'),(60,58,2,0,10000,'admin','RecycleBin','delete','','回收站彻底删除','','回收站彻底删除'),(61,6,1,0,10000,'admin','Route','index','','URL美化','','URL规则管理'),(62,61,1,0,10000,'admin','Route','add','','添加路由规则','','添加路由规则'),(63,61,2,0,10000,'admin','Route','addPost','','添加路由规则提交','','添加路由规则提交'),(64,61,1,0,10000,'admin','Route','edit','','路由规则编辑','','路由规则编辑'),(65,61,2,0,10000,'admin','Route','editPost','','路由规则编辑提交','','路由规则编辑提交'),(66,61,2,0,10000,'admin','Route','delete','','路由规则删除','','路由规则删除'),(67,61,2,0,10000,'admin','Route','ban','','路由规则禁用','','路由规则禁用'),(68,61,2,0,10000,'admin','Route','open','','路由规则启用','','路由规则启用'),(69,61,2,0,10000,'admin','Route','listOrder','','路由规则排序','','路由规则排序'),(70,61,1,0,10000,'admin','Route','select','','选择URL','','选择URL'),(71,6,1,0,0,'admin','Setting','site','','网站信息','','网站信息'),(72,71,2,0,10000,'admin','Setting','sitePost','','网站信息设置提交','','网站信息设置提交'),(73,6,1,0,10000,'admin','Setting','password','','密码修改','','密码修改'),(74,73,2,0,10000,'admin','Setting','passwordPost','','密码修改提交','','密码修改提交'),(75,6,1,0,10000,'admin','Setting','upload','','上传设置','','上传设置'),(76,75,2,0,10000,'admin','Setting','uploadPost','','上传设置提交','','上传设置提交'),(77,6,1,0,10000,'admin','Setting','clearCache','','清除缓存','','清除缓存'),(78,6,1,0,40,'admin','Slide','index','','幻灯片管理','','幻灯片管理'),(79,78,1,0,10000,'admin','Slide','add','','添加幻灯片','','添加幻灯片'),(80,78,2,0,10000,'admin','Slide','addPost','','添加幻灯片提交','','添加幻灯片提交'),(81,78,1,0,10000,'admin','Slide','edit','','编辑幻灯片','','编辑幻灯片'),(82,78,2,0,10000,'admin','Slide','editPost','','编辑幻灯片提交','','编辑幻灯片提交'),(83,78,2,0,10000,'admin','Slide','delete','','删除幻灯片','','删除幻灯片'),(84,78,1,0,10000,'admin','SlideItem','index','','幻灯片页面列表','','幻灯片页面列表'),(85,84,1,0,10000,'admin','SlideItem','add','','幻灯片页面添加','','幻灯片页面添加'),(86,84,2,0,10000,'admin','SlideItem','addPost','','幻灯片页面添加提交','','幻灯片页面添加提交'),(87,84,1,0,10000,'admin','SlideItem','edit','','幻灯片页面编辑','','幻灯片页面编辑'),(88,84,2,0,10000,'admin','SlideItem','editPost','','幻灯片页面编辑提交','','幻灯片页面编辑提交'),(89,84,2,0,10000,'admin','SlideItem','delete','','幻灯片页面删除','','幻灯片页面删除'),(90,84,2,0,10000,'admin','SlideItem','ban','','幻灯片页面隐藏','','幻灯片页面隐藏'),(91,84,2,0,10000,'admin','SlideItem','cancelBan','','幻灯片页面显示','','幻灯片页面显示'),(92,84,2,0,10000,'admin','SlideItem','listOrder','','幻灯片页面排序','','幻灯片页面排序'),(93,6,1,0,10000,'admin','Storage','index','','文件存储','','文件存储'),(94,93,2,0,10000,'admin','Storage','settingPost','','文件存储设置提交','','文件存储设置提交'),(95,6,1,0,20,'admin','Theme','index','','模板管理','','模板管理'),(96,95,1,0,10000,'admin','Theme','install','','安装模板','','安装模板'),(97,95,2,0,10000,'admin','Theme','uninstall','','卸载模板','','卸载模板'),(98,95,2,0,10000,'admin','Theme','installTheme','','模板安装','','模板安装'),(99,95,2,0,10000,'admin','Theme','update','','模板更新','','模板更新'),(100,95,2,0,10000,'admin','Theme','active','','启用模板','','启用模板'),(101,95,1,0,10000,'admin','Theme','files','','模板文件列表','','启用模板'),(102,95,1,0,10000,'admin','Theme','fileSetting','','模板文件设置','','模板文件设置'),(103,95,1,0,10000,'admin','Theme','fileArrayData','','模板文件数组数据列表','','模板文件数组数据列表'),(104,95,2,0,10000,'admin','Theme','fileArrayDataEdit','','模板文件数组数据添加编辑','','模板文件数组数据添加编辑'),(105,95,2,0,10000,'admin','Theme','fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存','','模板文件数组数据添加编辑提交保存'),(106,95,2,0,10000,'admin','Theme','fileArrayDataDelete','','模板文件数组数据删除','','模板文件数组数据删除'),(107,95,2,0,10000,'admin','Theme','settingPost','','模板文件编辑提交保存','','模板文件编辑提交保存'),(108,95,1,0,10000,'admin','Theme','dataSource','','模板文件设置数据源','','模板文件设置数据源'),(109,95,1,0,10000,'admin','Theme','design','','模板设计','','模板设计'),(110,0,0,0,10,'user','AdminIndex','default','','用户管理','user',''),(111,49,1,1,10000,'admin','User','index','','管理员','','管理员管理'),(112,111,1,0,10000,'admin','User','add','','管理员添加','','管理员添加'),(113,111,2,0,10000,'admin','User','addPost','','管理员添加提交','','管理员添加提交'),(114,111,1,0,10000,'admin','User','edit','','管理员编辑','','管理员编辑'),(115,111,2,0,10000,'admin','User','editPost','','管理员编辑提交','','管理员编辑提交'),(116,111,1,0,10000,'admin','User','userInfo','','个人信息','','管理员个人信息修改'),(117,111,2,0,10000,'admin','User','userInfoPost','','管理员个人信息修改提交','','管理员个人信息修改提交'),(118,111,2,0,10000,'admin','User','delete','','管理员删除','','管理员删除'),(119,111,2,0,10000,'admin','User','ban','','停用管理员','','停用管理员'),(120,111,2,0,10000,'admin','User','cancelBan','','启用管理员','','启用管理员'),(121,0,0,0,30,'portal','AdminIndex','default','','文章资讯','pencil-square-o',''),(122,121,1,0,10000,'portal','AdminArticle','index','','文章管理','','文章列表'),(123,122,1,0,10000,'portal','AdminArticle','add','','添加文章','','添加文章'),(124,122,2,0,10000,'portal','AdminArticle','addPost','','添加文章提交','','添加文章提交'),(125,122,1,0,10000,'portal','AdminArticle','edit','','编辑文章','','编辑文章'),(126,122,2,0,10000,'portal','AdminArticle','editPost','','编辑文章提交','','编辑文章提交'),(127,122,2,0,10000,'portal','AdminArticle','delete','','文章删除','','文章删除'),(128,122,2,0,10000,'portal','AdminArticle','publish','','文章发布','','文章发布'),(129,122,2,0,10000,'portal','AdminArticle','top','','文章置顶','','文章置顶'),(130,122,2,0,10000,'portal','AdminArticle','recommend','','文章推荐','','文章推荐'),(131,122,2,0,10000,'portal','AdminArticle','listOrder','','文章排序','','文章排序'),(132,121,1,0,10000,'portal','AdminCategory','index','','分类管理','','文章分类列表'),(133,132,1,0,10000,'portal','AdminCategory','add','','添加文章分类','','添加文章分类'),(134,132,2,0,10000,'portal','AdminCategory','addPost','','添加文章分类提交','','添加文章分类提交'),(135,132,1,0,10000,'portal','AdminCategory','edit','','编辑文章分类','','编辑文章分类'),(136,132,2,0,10000,'portal','AdminCategory','editPost','','编辑文章分类提交','','编辑文章分类提交'),(137,132,1,0,10000,'portal','AdminCategory','select','','文章分类选择对话框','','文章分类选择对话框'),(138,132,2,0,10000,'portal','AdminCategory','listOrder','','文章分类排序','','文章分类排序'),(139,132,2,0,10000,'portal','AdminCategory','delete','','删除文章分类','','删除文章分类'),(140,121,1,0,10000,'portal','AdminPage','index','','页面管理','','页面管理'),(141,140,1,0,10000,'portal','AdminPage','add','','添加页面','','添加页面'),(142,140,2,0,10000,'portal','AdminPage','addPost','','添加页面提交','','添加页面提交'),(143,140,1,0,10000,'portal','AdminPage','edit','','编辑页面','','编辑页面'),(144,140,2,0,10000,'portal','AdminPage','editPost','','编辑页面提交','','编辑页面提交'),(145,140,2,0,10000,'portal','AdminPage','delete','','删除页面','','删除页面'),(146,121,1,0,10000,'portal','AdminTag','index','','文章标签','','文章标签'),(147,146,1,0,10000,'portal','AdminTag','add','','添加文章标签','','添加文章标签'),(148,146,2,0,10000,'portal','AdminTag','addPost','','添加文章标签提交','','添加文章标签提交'),(149,146,2,0,10000,'portal','AdminTag','upStatus','','更新标签状态','','更新标签状态'),(150,146,2,0,10000,'portal','AdminTag','delete','','删除文章标签','','删除文章标签'),(151,0,1,0,10000,'user','AdminAsset','index','','资源管理','file','资源管理列表'),(152,151,2,0,10000,'user','AdminAsset','delete','','删除文件','','删除文件'),(153,110,0,1,10000,'user','AdminIndex','default1','','用户组','','用户组'),(154,153,1,1,10000,'user','AdminIndex','index','','本站用户','','本站用户'),(155,154,2,1,10000,'user','AdminIndex','ban','','本站用户拉黑','',''),(156,154,2,0,10000,'user','AdminIndex','cancelBan','','本站用户启用','','本站用户启用'),(157,153,1,0,10000,'user','AdminOauth','index','','第三方用户','','第三方用户'),(158,157,2,0,10000,'user','AdminOauth','delete','','删除第三方用户绑定','','删除第三方用户绑定'),(159,6,1,0,10000,'user','AdminUserAction','index','','用户操作管理','','用户操作管理'),(160,159,1,0,10000,'user','AdminUserAction','edit','','编辑用户操作','','编辑用户操作'),(161,159,2,0,10000,'user','AdminUserAction','editPost','','编辑用户操作提交','','编辑用户操作提交'),(162,159,1,0,10000,'user','AdminUserAction','sync','','同步用户操作','','同步用户操作'),(164,6,1,1,10000,'admin','Appconfig','index','','系统配置','',''),(165,164,2,0,10000,'admin','Appconfig','indexPost','','提交','',''),(170,0,1,1,10000,'admin','coin','index','','钱包管理','btc',''),(171,170,1,1,10002,'admin','Wallet','usdt','','USDT钱包','',''),(183,185,1,1,10000,'admin','Cron','balance','','余额更新日志','',''),(185,0,1,1,10002,'admin','rizhi','index','','系统日志','',''),(186,170,1,1,10001,'admin','Wallet','eth','','ETH钱包','',''),(189,185,0,0,10000,'admin','UserBalancelog','index','','用户余额变更日志','',''),(190,185,0,0,10000,'admin','ActionLog','index','','访问记录表','',''),(192,170,1,1,10000,'admin','Wallet','btc','','BTC钱包','',''),(193,185,1,1,10001,'admin','Cron','notify','','回调通知日志','',''),(194,0,1,1,10001,'admin','TransferLog','index','','账户交易','list',''),(195,194,1,1,10000,'admin','TransferLog','payment','','充值记录','',''),(196,194,1,1,10001,'admin','TransferLog','turnout_in','','内部转出','',''),(197,194,1,1,10002,'admin','TransferLog','turnout_out','','外部转出','',''),(198,194,1,1,10003,'admin','TransferLog','huizong','','系统汇总','',''),(199,6,1,1,10000,'admin','Coins','index','','币种设置','',''),(200,185,1,1,10001,'admin','Cron','collect','','自动汇总日志','',''),(201,194,1,1,10005,'admin','ChainLog','index','','链上转出','',''),(202,170,1,1,10005,'admin','Wallet','token','','ETH Token钱包','',''),(203,194,1,1,10004,'admin','TransferLog','fee','','汇总手续费','','');
/*!40000 ALTER TABLE `jl_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_asset`
--

DROP TABLE IF EXISTS `jl_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_asset`
--

LOCK TABLES `jl_asset` WRITE;
/*!40000 ALTER TABLE `jl_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_auth_access`
--

DROP TABLE IF EXISTS `jl_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_auth_access`
--

LOCK TABLES `jl_auth_access` WRITE;
/*!40000 ALTER TABLE `jl_auth_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_auth_grade`
--

DROP TABLE IF EXISTS `jl_auth_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_auth_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) DEFAULT NULL COMMENT '认证等级',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `content` varchar(255) DEFAULT NULL COMMENT '描述',
  `status` int(2) DEFAULT NULL COMMENT '状态(1:正常，0：弃用)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='认证等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_auth_grade`
--

LOCK TABLES `jl_auth_grade` WRITE;
/*!40000 ALTER TABLE `jl_auth_grade` DISABLE KEYS */;
INSERT INTO `jl_auth_grade` VALUES (1,1,'安全等级1','24小时发币限额: 0 BTC。<br>24小时闪兑限额: 0 BTC。',1),(2,2,'安全等级2','24小时发币限额: 10 BTC。<br>24小时闪兑限额: 0 BTC。<br>需要完成:设置支付密码。',1),(3,3,'安全等级3','24小时发币限额: 50 BTC。<br>24小时闪兑限额: 5 BTC。<br>需要完成: 安全等级2认证，并且提供政府颁发的带照片的有效证件。\r\n',1),(4,4,'安全等级4','24小时发币限额: 200 BTC。<br>24小时闪兑限额: 10 BTC。<br>需要完成: 需要完成: KYC 等级3认证和视频认证。',1),(5,5,'安全等级5','24小时发币限额: 500 BTC。<br>24小时闪兑限额: 50 BTC。<br>需要完成: KYC等级4认证，并且联系客户支持，我们会评估您的需求为您提升所需额度。',1);
/*!40000 ALTER TABLE `jl_auth_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_auth_rule`
--

DROP TABLE IF EXISTS `jl_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_auth_rule`
--

LOCK TABLES `jl_auth_rule` WRITE;
/*!40000 ALTER TABLE `jl_auth_rule` DISABLE KEYS */;
INSERT INTO `jl_auth_rule` VALUES (1,1,'admin','admin_url','admin/Hook/index','','钩子管理',''),(2,1,'admin','admin_url','admin/Hook/plugins','','钩子插件管理',''),(3,1,'admin','admin_url','admin/Hook/pluginListOrder','','钩子插件排序',''),(4,1,'admin','admin_url','admin/Hook/sync','','同步钩子',''),(5,1,'admin','admin_url','admin/Link/index','','友情链接',''),(6,1,'admin','admin_url','admin/Link/add','','添加友情链接',''),(7,1,'admin','admin_url','admin/Link/addPost','','添加友情链接提交保存',''),(8,1,'admin','admin_url','admin/Link/edit','','编辑友情链接',''),(9,1,'admin','admin_url','admin/Link/editPost','','编辑友情链接提交保存',''),(10,1,'admin','admin_url','admin/Link/delete','','删除友情链接',''),(11,1,'admin','admin_url','admin/Link/listOrder','','友情链接排序',''),(12,1,'admin','admin_url','admin/Link/toggle','','友情链接显示隐藏',''),(13,1,'admin','admin_url','admin/Mailer/index','','邮箱配置',''),(14,1,'admin','admin_url','admin/Mailer/indexPost','','邮箱配置提交保存',''),(15,1,'admin','admin_url','admin/Mailer/template','','邮件模板',''),(16,1,'admin','admin_url','admin/Mailer/templatePost','','邮件模板提交',''),(17,1,'admin','admin_url','admin/Mailer/test','','邮件发送测试',''),(18,1,'admin','admin_url','admin/Menu/index','','后台菜单',''),(19,1,'admin','admin_url','admin/Menu/lists','','所有菜单',''),(20,1,'admin','admin_url','admin/Menu/add','','后台菜单添加',''),(21,1,'admin','admin_url','admin/Menu/addPost','','后台菜单添加提交保存',''),(22,1,'admin','admin_url','admin/Menu/edit','','后台菜单编辑',''),(23,1,'admin','admin_url','admin/Menu/editPost','','后台菜单编辑提交保存',''),(24,1,'admin','admin_url','admin/Menu/delete','','后台菜单删除',''),(25,1,'admin','admin_url','admin/Menu/listOrder','','后台菜单排序',''),(26,1,'admin','admin_url','admin/Menu/getActions','','导入新后台菜单',''),(27,1,'admin','admin_url','admin/Nav/index','','导航管理',''),(28,1,'admin','admin_url','admin/Nav/add','','添加导航',''),(29,1,'admin','admin_url','admin/Nav/addPost','','添加导航提交保存',''),(30,1,'admin','admin_url','admin/Nav/edit','','编辑导航',''),(31,1,'admin','admin_url','admin/Nav/editPost','','编辑导航提交保存',''),(32,1,'admin','admin_url','admin/Nav/delete','','删除导航',''),(33,1,'admin','admin_url','admin/NavMenu/index','','导航菜单',''),(34,1,'admin','admin_url','admin/NavMenu/add','','添加导航菜单',''),(35,1,'admin','admin_url','admin/NavMenu/addPost','','添加导航菜单提交保存',''),(36,1,'admin','admin_url','admin/NavMenu/edit','','编辑导航菜单',''),(37,1,'admin','admin_url','admin/NavMenu/editPost','','编辑导航菜单提交保存',''),(38,1,'admin','admin_url','admin/NavMenu/delete','','删除导航菜单',''),(39,1,'admin','admin_url','admin/NavMenu/listOrder','','导航菜单排序',''),(40,1,'admin','admin_url','admin/Plugin/default','','插件中心',''),(41,1,'admin','admin_url','admin/Plugin/index','','短信其它',''),(42,1,'admin','admin_url','admin/Plugin/toggle','','插件启用禁用',''),(43,1,'admin','admin_url','admin/Plugin/setting','','插件设置',''),(44,1,'admin','admin_url','admin/Plugin/settingPost','','插件设置提交',''),(45,1,'admin','admin_url','admin/Plugin/install','','插件安装',''),(46,1,'admin','admin_url','admin/Plugin/update','','插件更新',''),(47,1,'admin','admin_url','admin/Plugin/uninstall','','卸载插件',''),(48,1,'admin','admin_url','admin/Rbac/index','','角色管理',''),(49,1,'admin','admin_url','admin/Rbac/roleAdd','','添加角色',''),(50,1,'admin','admin_url','admin/Rbac/roleAddPost','','添加角色提交',''),(51,1,'admin','admin_url','admin/Rbac/roleEdit','','编辑角色',''),(52,1,'admin','admin_url','admin/Rbac/roleEditPost','','编辑角色提交',''),(53,1,'admin','admin_url','admin/Rbac/roleDelete','','删除角色',''),(54,1,'admin','admin_url','admin/Rbac/authorize','','设置角色权限',''),(55,1,'admin','admin_url','admin/Rbac/authorizePost','','角色授权提交',''),(56,1,'admin','admin_url','admin/RecycleBin/index','','回收站',''),(57,1,'admin','admin_url','admin/RecycleBin/restore','','回收站还原',''),(58,1,'admin','admin_url','admin/RecycleBin/delete','','回收站彻底删除',''),(59,1,'admin','admin_url','admin/Route/index','','URL美化',''),(60,1,'admin','admin_url','admin/Route/add','','添加路由规则',''),(61,1,'admin','admin_url','admin/Route/addPost','','添加路由规则提交',''),(62,1,'admin','admin_url','admin/Route/edit','','路由规则编辑',''),(63,1,'admin','admin_url','admin/Route/editPost','','路由规则编辑提交',''),(64,1,'admin','admin_url','admin/Route/delete','','路由规则删除',''),(65,1,'admin','admin_url','admin/Route/ban','','路由规则禁用',''),(66,1,'admin','admin_url','admin/Route/open','','路由规则启用',''),(67,1,'admin','admin_url','admin/Route/listOrder','','路由规则排序',''),(68,1,'admin','admin_url','admin/Route/select','','选择URL',''),(69,1,'admin','admin_url','admin/Setting/default','','设置',''),(70,1,'admin','admin_url','admin/Setting/site','','网站信息',''),(71,1,'admin','admin_url','admin/Setting/sitePost','','网站信息设置提交',''),(72,1,'admin','admin_url','admin/Setting/password','','密码修改',''),(73,1,'admin','admin_url','admin/Setting/passwordPost','','密码修改提交',''),(74,1,'admin','admin_url','admin/Setting/upload','','上传设置',''),(75,1,'admin','admin_url','admin/Setting/uploadPost','','上传设置提交',''),(76,1,'admin','admin_url','admin/Setting/clearCache','','清除缓存',''),(77,1,'admin','admin_url','admin/Slide/index','','幻灯片管理',''),(78,1,'admin','admin_url','admin/Slide/add','','添加幻灯片',''),(79,1,'admin','admin_url','admin/Slide/addPost','','添加幻灯片提交',''),(80,1,'admin','admin_url','admin/Slide/edit','','编辑幻灯片',''),(81,1,'admin','admin_url','admin/Slide/editPost','','编辑幻灯片提交',''),(82,1,'admin','admin_url','admin/Slide/delete','','删除幻灯片',''),(83,1,'admin','admin_url','admin/SlideItem/index','','幻灯片页面列表',''),(84,1,'admin','admin_url','admin/SlideItem/add','','幻灯片页面添加',''),(85,1,'admin','admin_url','admin/SlideItem/addPost','','幻灯片页面添加提交',''),(86,1,'admin','admin_url','admin/SlideItem/edit','','幻灯片页面编辑',''),(87,1,'admin','admin_url','admin/SlideItem/editPost','','幻灯片页面编辑提交',''),(88,1,'admin','admin_url','admin/SlideItem/delete','','幻灯片页面删除',''),(89,1,'admin','admin_url','admin/SlideItem/ban','','幻灯片页面隐藏',''),(90,1,'admin','admin_url','admin/SlideItem/cancelBan','','幻灯片页面显示',''),(91,1,'admin','admin_url','admin/SlideItem/listOrder','','幻灯片页面排序',''),(92,1,'admin','admin_url','admin/Storage/index','','文件存储',''),(93,1,'admin','admin_url','admin/Storage/settingPost','','文件存储设置提交',''),(94,1,'admin','admin_url','admin/Theme/index','','模板管理',''),(95,1,'admin','admin_url','admin/Theme/install','','安装模板',''),(96,1,'admin','admin_url','admin/Theme/uninstall','','卸载模板',''),(97,1,'admin','admin_url','admin/Theme/installTheme','','模板安装',''),(98,1,'admin','admin_url','admin/Theme/update','','模板更新',''),(99,1,'admin','admin_url','admin/Theme/active','','启用模板',''),(100,1,'admin','admin_url','admin/Theme/files','','模板文件列表',''),(101,1,'admin','admin_url','admin/Theme/fileSetting','','模板文件设置',''),(102,1,'admin','admin_url','admin/Theme/fileArrayData','','模板文件数组数据列表',''),(103,1,'admin','admin_url','admin/Theme/fileArrayDataEdit','','模板文件数组数据添加编辑',''),(104,1,'admin','admin_url','admin/Theme/fileArrayDataEditPost','','模板文件数组数据添加编辑提交保存',''),(105,1,'admin','admin_url','admin/Theme/fileArrayDataDelete','','模板文件数组数据删除',''),(106,1,'admin','admin_url','admin/Theme/settingPost','','模板文件编辑提交保存',''),(107,1,'admin','admin_url','admin/Theme/dataSource','','模板文件设置数据源',''),(108,1,'admin','admin_url','admin/Theme/design','','模板设计',''),(109,1,'admin','admin_url','admin/User/default','','管理组',''),(110,1,'admin','admin_url','admin/User/index','','管理员',''),(111,1,'admin','admin_url','admin/User/add','','管理员添加',''),(112,1,'admin','admin_url','admin/User/addPost','','管理员添加提交',''),(113,1,'admin','admin_url','admin/User/edit','','管理员编辑',''),(114,1,'admin','admin_url','admin/User/editPost','','管理员编辑提交',''),(115,1,'admin','admin_url','admin/User/userInfo','','个人信息',''),(116,1,'admin','admin_url','admin/User/userInfoPost','','管理员个人信息修改提交',''),(117,1,'admin','admin_url','admin/User/delete','','管理员删除',''),(118,1,'admin','admin_url','admin/User/ban','','停用管理员',''),(119,1,'admin','admin_url','admin/User/cancelBan','','启用管理员',''),(120,1,'portal','admin_url','portal/AdminArticle/index','','文章管理',''),(121,1,'portal','admin_url','portal/AdminArticle/add','','添加文章',''),(122,1,'portal','admin_url','portal/AdminArticle/addPost','','添加文章提交',''),(123,1,'portal','admin_url','portal/AdminArticle/edit','','编辑文章',''),(124,1,'portal','admin_url','portal/AdminArticle/editPost','','编辑文章提交',''),(125,1,'portal','admin_url','portal/AdminArticle/delete','','文章删除',''),(126,1,'portal','admin_url','portal/AdminArticle/publish','','文章发布',''),(127,1,'portal','admin_url','portal/AdminArticle/top','','文章置顶',''),(128,1,'portal','admin_url','portal/AdminArticle/recommend','','文章推荐',''),(129,1,'portal','admin_url','portal/AdminArticle/listOrder','','文章排序',''),(130,1,'portal','admin_url','portal/AdminCategory/index','','分类管理',''),(131,1,'portal','admin_url','portal/AdminCategory/add','','添加文章分类',''),(132,1,'portal','admin_url','portal/AdminCategory/addPost','','添加文章分类提交',''),(133,1,'portal','admin_url','portal/AdminCategory/edit','','编辑文章分类',''),(134,1,'portal','admin_url','portal/AdminCategory/editPost','','编辑文章分类提交',''),(135,1,'portal','admin_url','portal/AdminCategory/select','','文章分类选择对话框',''),(136,1,'portal','admin_url','portal/AdminCategory/listOrder','','文章分类排序',''),(137,1,'portal','admin_url','portal/AdminCategory/delete','','删除文章分类',''),(138,1,'portal','admin_url','portal/AdminIndex/default','','文章资讯',''),(139,1,'portal','admin_url','portal/AdminPage/index','','页面管理',''),(140,1,'portal','admin_url','portal/AdminPage/add','','添加页面',''),(141,1,'portal','admin_url','portal/AdminPage/addPost','','添加页面提交',''),(142,1,'portal','admin_url','portal/AdminPage/edit','','编辑页面',''),(143,1,'portal','admin_url','portal/AdminPage/editPost','','编辑页面提交',''),(144,1,'portal','admin_url','portal/AdminPage/delete','','删除页面',''),(145,1,'portal','admin_url','portal/AdminTag/index','','文章标签',''),(146,1,'portal','admin_url','portal/AdminTag/add','','添加文章标签',''),(147,1,'portal','admin_url','portal/AdminTag/addPost','','添加文章标签提交',''),(148,1,'portal','admin_url','portal/AdminTag/upStatus','','更新标签状态',''),(149,1,'portal','admin_url','portal/AdminTag/delete','','删除文章标签',''),(150,1,'user','admin_url','user/AdminAsset/index','','资源管理',''),(151,1,'user','admin_url','user/AdminAsset/delete','','删除文件',''),(152,1,'user','admin_url','user/AdminIndex/default','','用户管理',''),(153,1,'user','admin_url','user/AdminIndex/default1','','用户组',''),(154,1,'user','admin_url','user/AdminIndex/index','','本站用户',''),(155,1,'user','admin_url','user/AdminIndex/ban','','本站用户拉黑',''),(156,1,'user','admin_url','user/AdminIndex/cancelBan','','本站用户启用',''),(157,1,'user','admin_url','user/AdminOauth/index','','第三方用户',''),(158,1,'user','admin_url','user/AdminOauth/delete','','删除第三方用户绑定',''),(159,1,'user','admin_url','user/AdminUserAction/index','','用户操作管理',''),(160,1,'user','admin_url','user/AdminUserAction/edit','','编辑用户操作',''),(161,1,'user','admin_url','user/AdminUserAction/editPost','','编辑用户操作提交',''),(162,1,'user','admin_url','user/AdminUserAction/sync','','同步用户操作',''),(163,1,'Admin','admin_url','Admin/user_test/index','','用户测试11',''),(164,1,'admin','admin_url','admin/Appconfig/index','','运营配置',''),(165,1,'admin','admin_url','admin/Appconfig/indexPost','','提交',''),(166,1,'Admin','admin_url','Admin/index/index','','发现管理',''),(167,1,'Admin','admin_url','Admin/Discovery/index','','发现列表',''),(168,1,'Admin','admin_url','Admin/DiscoveryCategory/index','','发现分类列表',''),(169,1,'user','admin_url','user/User_auth/index','','实名认证审核',''),(170,1,'admin','admin_url','admin/Coin/index','','钱包管理',''),(171,1,'admin','admin_url','admin/Coins/index','','币种管理',''),(172,1,'admin','admin_url','admin/operation/default','','运营管理',''),(173,1,'admin','admin_url','admin/push/index','','系统推送',''),(174,1,'admin','admin_url','admin/wealth/default','','财富管理',''),(175,1,'admin','admin_url','admin/wealth/index','','理财套餐',''),(176,1,'admin','admin_url','admin/Exchange/index','','闪兑管理',''),(177,1,'admin','admin_url','admin/indexredenv/index','','红包管理',''),(178,1,'admin','admin_url','admin/RedNickname/index','','随机姓名管理',''),(179,1,'admin','admin_url','admin/RedWish/index','','随机祝福语管理',''),(180,1,'admin','admin_url','admin/redenv/index','','红包列表',''),(181,1,'admin','admin_url','admin/Ticker/index','','行情市场',''),(182,1,'admin','admin_url','admin/AuthVideoLog/index','','视频认证日志',''),(183,1,'admin','admin_url','admin/Cron/index','','任务日志',''),(184,1,'admin','admin_url','admin/ExchangeLog/index','','闪兑记录',''),(185,1,'admin','admin_url','admin/rizhi/index','','系统日志',''),(186,1,'admin','admin_url','admin/TransferLog/index','','转账记录',''),(187,1,'admin','admin_url','admin/WeallthLog/index','','理财变更记录',''),(188,1,'admin','admin_url','admin/UserSeoreLog/index','','用户积分奖励',''),(189,1,'admin','admin_url','admin/UserBalancelog/index','','用户余额变更日志',''),(190,1,'admin','admin_url','admin/ActionLog/index','','访问记录表',''),(191,1,'admin','admin_url','admin/WealthOrder/index','','理财订单',''),(192,1,'admin','admin_url','admin/Wallet/index','','钱包管理',''),(193,1,'admin','admin_url','admin/Rate/index','','汇率管理','');
/*!40000 ALTER TABLE `jl_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_chain_log`
--

DROP TABLE IF EXISTS `jl_chain_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_chain_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tx_id` varchar(255) NOT NULL COMMENT '链上交易ID',
  `coin_symbol` varchar(255) NOT NULL COMMENT '币种信息',
  `from_address` varchar(255) NOT NULL DEFAULT '' COMMENT '发起地址',
  `to_address` varchar(255) NOT NULL DEFAULT '' COMMENT '接受地址',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '交易数量',
  `fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '手续费',
  `block_hash` varchar(255) NOT NULL DEFAULT '' COMMENT '区块hash',
  `log_time` int(10) NOT NULL COMMENT '时间',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '交易状态',
  PRIMARY KEY (`id`),
  KEY `tx_id` (`tx_id`),
  KEY `coin_symbol` (`coin_symbol`),
  KEY `from_address` (`from_address`),
  KEY `block_hash` (`block_hash`),
  KEY `log_time` (`log_time`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_chain_log`
--

LOCK TABLES `jl_chain_log` WRITE;
/*!40000 ALTER TABLE `jl_chain_log` DISABLE KEYS */;
INSERT INTO `jl_chain_log` VALUES (4,'e598f5f3ffb57fadfc2db01cbfa60d05fb4f42d6d708e323d1cbb7cd8a498330','USDT','1B3dA8c4sncvQ8kqXmtWstJaRnTgsb5xB4','3D6n5iixF6jL9YpuyWZWSPnXz24Hxsu3fY','',4.000000000000000000,0.000000000000000000,'00000000000000000017655af200d12f4c8d2655805af4e45815b9ed35cd06fe',1548320553,1),(5,'0xde48ab5a19fb50ef1a1a1fb6b1c4a517ed1db71bc7ab1fd5579b0b569a37ecdb','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0xa4e86cfdc75aeffae9844e0f3f73dd9449453484','',0.001000000000000000,0.000000000000000000,'0x371fbdf79271f19d3ce86e8f8a65afbc7526438bdbf7aac005bc84cfdde865aa',1548331913,1),(6,'0xe0790c3dde0d6cb404114a7d0c85fa21f8b5d6baad20273bb647243bb30bfb01','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0xcc9af552be4a1a9b5bca2a575a0796daccc1e115','',0.021000000000000000,0.000000000000000000,'0xdfaa65b61c205e9a3f61abfed8f88a154f541e9cffbf8e390d04897a64103004',1548408238,1),(7,'0xccb71b89b4ae3daced692a478c3e2a43308e6244cd2b1ecb86168e67c4aef199','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0xcc9af552be4a1a9b5bca2a575a0796daccc1e115','',0.022000000000000000,0.000000000000000000,'0x5dc351b4372a5ab2d0ae74d44257f570f23a0aa8c71eaee776ae4dbf26a17a08',1548470552,1),(8,'0x6414785ec9be10251d756b6f95cb3021586eedba674113200bd35dde9b29025f','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0x2ec83b306546283de26941bda902450d8a60d1a5','',0.004980970000000000,0.000000000000000000,'0x7aa793e0325e5d8f796ae0625bf16673551ed972df5b944889e8a1271f4b9cfc',1550547466,1),(9,'0xd619fda180cf2fe278b33b1d25f901f33cd1b5e5e5dd81d720fc668bbf1d6791','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0x2ec83b306546283de26941bda902450d8a60d1a5','',0.000395000000000000,0.000000000000000000,'0xb2e157338be729abf4a44fea6b09c5741a381f76b4dc606277ddeb290dbfdf0b',1550550181,1),(10,'0x10991e91b1b9e749bcf86850fa07d38d363fff88d929d78d852502e2ed780ec1','ETH','0xa82b5b85d2fc0980d05b1a917d67953b89e344ca','0x2ec83b306546283de26941bda902450d8a60d1a5','',0.049700000000000000,0.000000000000000000,'0x2365f033c7d9dcd209315cd3e1e7df5a92dfaaefafc0d2574e0874bd737b5cdb',1550557859,1),(11,'a8ac8bb6955ffb04c1c6b5348b5819a64046290bff432ace89e1815d16081904','USDT','1NZBPytWPHxzk1s9VrQwHEwUt1CLoPTzjM','1B3dA8c4sncvQ8kqXmtWstJaRnTgsb5xB4','',10.129000000000000000,0.000000000000000000,'0000000000000000000532b7125c174e027467ea5c26ff2b6bbce3535ce50cb1',1550650571,1),(12,'0x0f5676b212667610890b7aeb2909a8fe8a112fb418cd8afb9cad1009df30b167','ETH','0x2ec83b306546283de26941bda902450d8a60d1a5','0x325bba006ff604df0cb038c1a16f84a6463123a0','',0.000300000000000000,0.000000000000000000,'0xb610f255e25635f231b5230eb71371bf0af113684665b31ecb5bdc6d33b32788',1550826159,1),(13,'0xb3568c32edb1ae9995507345a681ef9bb27c776438c02f8641b76eed42cf35e4','ETH','0x2ec83b306546283de26941bda902450d8a60d1a5','0x325bba006ff604df0cb038c1a16f84a6463123a0','',0.001000000000000000,0.000000000000000000,'0x00182b313fbc0f4746479aae4600d6a19d5356fe413b2ab5e7e58d0216e69373',1550911404,1),(14,'0x358e7214f6d75ec50a49c06855cde0f13d0b134201b27765b8673178be7a0d83','COT','0x325bba006ff604df0cb038c1a16f84a6463123a0','0x500c2e0fe6166e282fdfd9bf5f46f0c7e73d3428','',3900.000000000000000000,0.000000000000000000,'0x3bbfbba41ca550c7c276eeb045a8d39bff528be100b686ad728327b6e34fa8bb',1550921841,1),(15,'0x14a2ccc09fe6903f5b02c46ccadbad96f991644778f55a60fe579fd59cab4f04','ETH','0x2ec83b306546283de26941bda902450d8a60d1a5','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','',0.052887970000000000,0.000000000000000000,'0x6d644c0d759f65c2d6017e185c6e7315e0559a7e61df8c9eb6685e8f4465c084',1551067840,1),(16,'0x71372c005ef472081d6ee5e9027b5a87899ae32d89c95906924a558afb1c092d','COT','0x325bba006ff604df0cb038c1a16f84a6463123a0','0x500c2e0fe6166e282fdfd9bf5f46f0c7e73d3428','',2000.000000000000000000,0.000828000000000000,'0xa429265b7df8befa6dee9bda52f8617de35bce7d2ee0a931d7db3a5865214e03',1551070040,1),(17,'08eee5f654c37b749c77e1ce33cbb6b618cee14a2bc9a5ac68c1d91141554a2f','USDT','1B3dA8c4sncvQ8kqXmtWstJaRnTgsb5xB4','1KNwTWFEDwNWo4KAyKoqVCfzZ6y6KByRHp','',31.017000000000000000,0.000252490000000000,'0000000000000000001e83e3c29ebb1ab23414fdbdbbb3f2f3f1af86d46b849a',1551072537,1),(18,'0x91d852b4e9845f5b2aae3a2199d6a145dc99d67696bf113f084c4c5d7a29f07e','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0x500c2e0fe6166e282fdfd9bf5f46f0c7e73d3428','',0.000300000000000000,0.000294000000000000,'0x8f82aca9a0862cc337fc4992983b61fc43d9432e4cfb89ec87aab637ce365d41',1551072641,1),(19,'0x2bdf3f94f415fb0a0ba65424cf3908e334fff958adb296b1cdd0176cea48a6ac','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0x500c2e0fe6166e282fdfd9bf5f46f0c7e73d3428','',0.000100000000000000,0.000294000000000000,'0x553644fe2173419f95fbb8843781ee38fdaf4841f2c5ce223371b0b294d45169',1551081049,1),(20,'0x9ea489db9a48b7172021aa503ff406c9ca8202e6bdee7f49e343537bb3f84099','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0x2ec83b306546283de26941bda902450d8a60d1a5','',0.051605970000000000,0.000294000000000000,'0xb1a09772d73b8f90a957b7a6c324923bb5bab0d7d186417f602aad2b3ec8a8c2',1551089822,1),(21,'0x755791624546a675edde36eef369a1e8ea8448863a2571202aad2739a65e1b50','COT','0x500c2e0fe6166e282fdfd9bf5f46f0c7e73d3428','0x325bba006ff604df0cb038c1a16f84a6463123a0','',6000.000000000000000000,0.000312000000000000,'0xa21b6f64ab7d400edbc89fae55f67145a793d25a4a3632fc2327096a651373f2',1551091564,1),(22,'0x8131ad8bcb14fe59844e22442448da18a75b77373c3145eb75b3dd4a36eb0545','ETH','0x2ec83b306546283de26941bda902450d8a60d1a5','0xc5831138e5e8bc7dc3518676d7c6c8f9764c9ab7','',0.000400000000000000,0.000294000000000000,'0x32c789189393d617869e634a61646a6b994b74a0177d5ace56fe874b162b8981',1551092707,1),(23,'0xfd66388ef804fc56f7d94cd8bf2afd018214edfa92ba678e0fe414519c16de65','ETH','0x2ec83b306546283de26941bda902450d8a60d1a5','0xc5831138e5e8bc7dc3518676d7c6c8f9764c9ab7','',0.000100000000000000,0.000294000000000000,'0xca65c59748c8c8c6809fb491c7c72f1bae37bb025228495cb76fbd9e14e3e68d',1551093240,1),(24,'b5ff89fc3ac7973bf56d5bb10de6bf67f21a8d049e25e3ab9ab1366acac54f52','USDT','1KNwTWFEDwNWo4KAyKoqVCfzZ6y6KByRHp','1B3dA8c4sncvQ8kqXmtWstJaRnTgsb5xB4','',31.017000000000000000,0.000160660000000000,'0000000000000000000c41faf3ff32ff9558dc395f91a487ca0e53eac754543a',1551093803,1),(25,'0xf1952a9b3061dadd889f900700d8fe725c0ea0ab3379b560e0f3fe4843507529','COT','0xc5831138e5e8bc7dc3518676d7c6c8f9764c9ab7','0x500c2e0fe6166e282fdfd9bf5f46f0c7e73d3428','',2000.000000000000000000,0.000468000000000000,'0x8a78f1347bb65018b52d0b47ce1afc736509801cf6efb87b7dc010cc3e0c30a8',1551099581,1),(26,'0x7ea6a24fdcb3b95b32c5742ef0da53ef53bd23764193adfa90c3c75072f527f7','COT','0x325bba006ff604df0cb038c1a16f84a6463123a0','0x500c2e0fe6166e282fdfd9bf5f46f0c7e73d3428','',6000.000000000000000000,0.000468000000000000,'0xcc378658da320531c4752dca5959b1d5d556849c7f80455aa373f8a662050e86',1551099591,1),(27,'0xad938f43ed5a8e5d8c323335a2e4139d13eefac8b3c934afa1c7ea6f50230ddf','ETH','0x2ec83b306546283de26941bda902450d8a60d1a5','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','',0.050223970000000000,0.000294000000000000,'0xfc2100b37bb8f41f5c45bfce6aab54af2c978bd6082d94086b8c8b51522a4dd9',1551153971,1),(28,'234fd09fb626b21f2fa1c32d1deebebe3131f2615ab69f849f8a5807650bd047','USDT','1B3dA8c4sncvQ8kqXmtWstJaRnTgsb5xB4','15Vns1SKGeCpaQYzn6PsRY9tBZQxNhUA7u','',31.017000000000000000,0.000159850000000000,'000000000000000000099c8c74aeae7aee9d5728886cad4d69c7bd786ad071e7',1551155705,1),(29,'0x036165024acfb636567917188d98927944a6aa0b7dc0941ffb7c8a662c755932','ETH','0x68b2e16d34fe7b273b63ac95c376e615629fc54b','0xcc9af552be4a1a9b5bca2a575a0796daccc1e115','',0.049900000000000000,0.000294000000000000,'0xefda8a2a992448284475fbf74352c67826a7b3a007d6b4e47aacc716131eb336',1551156096,1);
/*!40000 ALTER TABLE `jl_chain_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_coin`
--

DROP TABLE IF EXISTS `jl_coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_coin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coin_name` varchar(255) NOT NULL COMMENT '币种名称',
  `coin_symbol` varchar(255) NOT NULL COMMENT '币种符号',
  `coin_type` varchar(255) NOT NULL DEFAULT 'coin' COMMENT 'coin/token',
  `parent_coin` varchar(255) NOT NULL DEFAULT '' COMMENT '代币父币种',
  `contract` varchar(255) NOT NULL DEFAULT '' COMMENT '合约地址',
  `decimals` int(10) NOT NULL DEFAULT '1' COMMENT '小数位数',
  `rpc_ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'Rpc 服务器IP',
  `rpc_port` varchar(255) NOT NULL DEFAULT '' COMMENT 'rpc端口',
  `rpc_user` varchar(255) NOT NULL DEFAULT '' COMMENT 'Rpc 用户名',
  `rpc_pass` varchar(255) NOT NULL DEFAULT '' COMMENT 'Rpc 密码',
  `rpc_last_pos` varchar(255) NOT NULL DEFAULT '' COMMENT 'RPC上一次请求位置',
  `min_fee` float(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '最小手续费',
  `max_fee` float(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '最大手续费',
  `collect_min` float(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '最小归集金额',
  `collect_max` float(9,8) NOT NULL DEFAULT '0.00000000' COMMENT '最大归集金额',
  `collect_status` int(11) NOT NULL DEFAULT '0' COMMENT '自动归集开关',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `coin_symbol` (`coin_symbol`(191)),
  KEY `coin_type` (`coin_type`(191)),
  KEY `parent_coin` (`parent_coin`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_coin`
--

LOCK TABLES `jl_coin` WRITE;
/*!40000 ALTER TABLE `jl_coin` DISABLE KEYS */;
INSERT INTO `jl_coin` VALUES (1,'比特币/Bitcoin','BTC','coin','','',1,'10.40.96.5','10073','jikejike','jikejike','0000000000000000000acfc81956cec652e3d5f6037efd2862c6856fd2fb8868',0.00030000,0.00009000,0.00200000,10.00000000,0),(2,'以太坊/Ethereum','ETH','coin','','',18,'139.180.129.100','10072','','','7273983',0.00030000,0.00009000,0.00100000,10.00000000,0),(3,'泰达币/Tether','USDT','coin','','',1,'10.40.96.6','10071','jikejike','jikejike','564685',0.00030000,0.00009000,0.00100000,10.00000000,0);
/*!40000 ALTER TABLE `jl_coin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_cron`
--

DROP TABLE IF EXISTS `jl_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'generate_user_walljl_address',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '执行参数',
  `wallet_id` int(11) NOT NULL DEFAULT '0' COMMENT '钱包ID',
  `result` varchar(255) NOT NULL DEFAULT '' COMMENT '执行结果',
  `schedule_time` int(11) NOT NULL DEFAULT '0' COMMENT '计划开启时间',
  `fail_times` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败次数',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0 未处理 1处理成功  -1 处理失败',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `schedule_time` (`schedule_time`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_cron`
--

LOCK TABLES `jl_cron` WRITE;
/*!40000 ALTER TABLE `jl_cron` DISABLE KEYS */;
INSERT INTO `jl_cron` VALUES (1,'update_wallet_balance','{\"wallet_id\":\"461\"}',461,'\\btcrpc get_Balance error:Connection timed out after 5001 milliseconds',1572665512,4,-1),(2,'update_wallet_balance','{\"wallet_id\":\"467\"}',467,'\\btcrpc get_Balance error:Connection timed out after 5001 milliseconds',1572668737,4,-1),(3,'update_wallet_balance','{\"wallet_id\":\"459\"}',459,'\\ethrpc get_Balance error:',1572668857,4,-1),(4,'update_wallet_balance','{\"wallet_id\":\"459\"}',459,'\\ethrpc get_Balance error:',1572708909,4,-1),(5,'update_wallet_balance','{\"wallet_id\":\"459\"}',459,'',0,0,0);
/*!40000 ALTER TABLE `jl_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_hook`
--

DROP TABLE IF EXISTS `jl_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_hook`
--

LOCK TABLES `jl_hook` WRITE;
/*!40000 ALTER TABLE `jl_hook` DISABLE KEYS */;
INSERT INTO `jl_hook` VALUES (1,1,0,'应用初始化','app_init','cmf','应用初始化'),(2,1,0,'应用开始','app_begin','cmf','应用开始'),(3,1,0,'模块初始化','module_init','cmf','模块初始化'),(4,1,0,'控制器开始','action_begin','cmf','控制器开始'),(5,1,0,'视图输出过滤','view_filter','cmf','视图输出过滤'),(6,1,0,'应用结束','app_end','cmf','应用结束'),(7,1,0,'日志write方法','log_write','cmf','日志write方法'),(8,1,0,'输出结束','response_end','cmf','输出结束'),(9,1,0,'后台控制器初始化','admin_init','cmf','后台控制器初始化'),(10,1,0,'前台控制器初始化','home_init','cmf','前台控制器初始化'),(11,1,1,'发送手机验证码','send_mobile_verification_code','cmf','发送手机验证码'),(12,3,0,'模板 body标签开始','body_start','','模板 body标签开始'),(13,3,0,'模板 head标签结束前','before_head_end','','模板 head标签结束前'),(14,3,0,'模板底部开始','footer_start','','模板底部开始'),(15,3,0,'模板底部开始之前','before_footer','','模板底部开始之前'),(16,3,0,'模板底部结束之前','before_footer_end','','模板底部结束之前'),(17,3,0,'模板 body 标签结束之前','before_body_end','','模板 body 标签结束之前'),(18,3,0,'模板左边栏开始','left_sidebar_start','','模板左边栏开始'),(19,3,0,'模板左边栏结束之前','before_left_sidebar_end','','模板左边栏结束之前'),(20,3,0,'模板右边栏开始','right_sidebar_start','','模板右边栏开始'),(21,3,0,'模板右边栏结束之前','before_right_sidebar_end','','模板右边栏结束之前'),(22,3,1,'评论区','comment','','评论区'),(23,3,1,'留言区','guestbook','','留言区'),(24,2,0,'后台首页仪表盘','admin_dashboard','admin','后台首页仪表盘'),(25,4,0,'后台模板 head标签结束前','admin_before_head_end','','后台模板 head标签结束前'),(26,4,0,'后台模板 body 标签结束之前','admin_before_body_end','','后台模板 body 标签结束之前'),(27,2,0,'后台登录页面','admin_login','admin','后台登录页面'),(28,1,1,'前台模板切换','switch_theme','cmf','前台模板切换'),(29,3,0,'主要内容之后','after_content','','主要内容之后'),(30,2,0,'文章显示之前','portal_before_assign_article','portal','文章显示之前'),(31,2,0,'后台文章保存之后','portal_admin_after_save_article','portal','后台文章保存之后'),(32,2,1,'获取上传界面','fetch_upload_view','user','获取上传界面'),(33,3,0,'主要内容之前','before_content','cmf','主要内容之前'),(34,1,0,'日志写入完成','log_write_done','cmf','日志写入完成'),(35,1,1,'后台模板切换','switch_admin_theme','cmf','后台模板切换'),(36,1,1,'验证码图片','captcha_image','cmf','验证码图片'),(37,2,1,'后台模板设计界面','admin_theme_design_view','admin','后台模板设计界面'),(38,2,1,'后台设置网站信息界面','admin_setting_site_view','admin','后台设置网站信息界面'),(39,2,1,'后台清除缓存界面','admin_setting_clear_cache_view','admin','后台清除缓存界面'),(40,2,1,'后台导航管理界面','admin_nav_index_view','admin','后台导航管理界面'),(41,2,1,'后台友情链接管理界面','admin_link_index_view','admin','后台友情链接管理界面'),(42,2,1,'后台幻灯片管理界面','admin_slide_index_view','admin','后台幻灯片管理界面'),(43,2,1,'后台管理员列表界面','admin_user_index_view','admin','后台管理员列表界面'),(44,2,1,'后台角色管理界面','admin_rbac_index_view','admin','后台角色管理界面'),(45,2,1,'门户后台文章管理列表界面','portal_admin_article_index_view','portal','门户后台文章管理列表界面'),(46,2,1,'门户后台文章分类管理列表界面','portal_admin_category_index_view','portal','门户后台文章分类管理列表界面'),(47,2,1,'门户后台页面管理列表界面','portal_admin_page_index_view','portal','门户后台页面管理列表界面'),(48,2,1,'门户后台文章标签管理列表界面','portal_admin_tag_index_view','portal','门户后台文章标签管理列表界面'),(49,2,1,'用户管理本站用户列表界面','user_admin_index_view','user','用户管理本站用户列表界面'),(50,2,1,'资源管理列表界面','user_admin_assjl_index_view','user','资源管理列表界面'),(51,2,1,'用户管理第三方用户列表界面','user_admin_oauth_index_view','user','用户管理第三方用户列表界面'),(52,2,1,'后台首页界面','admin_index_index_view','admin','后台首页界面'),(53,2,1,'后台回收站界面','admin_recycle_bin_index_view','admin','后台回收站界面'),(54,2,1,'后台菜单管理界面','admin_menu_index_view','admin','后台菜单管理界面'),(55,2,1,'后台自定义登录是否开启钩子','admin_custom_login_open','admin','后台自定义登录是否开启钩子'),(56,4,0,'门户后台文章添加编辑界面右侧栏','portal_admin_article_edit_view_right_sidebar','portal','门户后台文章添加编辑界面右侧栏'),(57,4,0,'门户后台文章添加编辑界面主要内容','portal_admin_article_edit_view_main','portal','门户后台文章添加编辑界面主要内容'),(58,2,1,'门户后台文章添加界面','portal_admin_article_add_view','portal','门户后台文章添加界面'),(59,2,1,'门户后台文章编辑界面','portal_admin_article_edit_view','portal','门户后台文章编辑界面'),(60,2,1,'门户后台文章分类添加界面','portal_admin_category_add_view','portal','门户后台文章分类添加界面'),(61,2,1,'门户后台文章分类编辑界面','portal_admin_category_edit_view','portal','门户后台文章分类编辑界面'),(62,2,1,'门户后台页面添加界面','portal_admin_page_add_view','portal','门户后台页面添加界面'),(63,2,1,'门户后台页面编辑界面','portal_admin_page_edit_view','portal','门户后台页面编辑界面'),(64,2,1,'后台幻灯片页面列表界面','admin_slide_item_index_view','admin','后台幻灯片页面列表界面'),(65,2,1,'后台幻灯片页面添加界面','admin_slide_item_add_view','admin','后台幻灯片页面添加界面'),(66,2,1,'后台幻灯片页面编辑界面','admin_slide_item_edit_view','admin','后台幻灯片页面编辑界面'),(67,2,1,'后台管理员添加界面','admin_user_add_view','admin','后台管理员添加界面'),(68,2,1,'后台管理员编辑界面','admin_user_edit_view','admin','后台管理员编辑界面'),(69,2,1,'后台角色添加界面','admin_rbac_role_add_view','admin','后台角色添加界面'),(70,2,1,'后台角色编辑界面','admin_rbac_role_edit_view','admin','后台角色编辑界面'),(71,2,1,'后台角色授权界面','admin_rbac_authorize_view','admin','后台角色授权界面'),(72,1,1,'生成钱包','generate_wallet','cmf','生成钱包'),(73,1,1,'生成行情','generate_ticker','cmf','生成行情'),(74,1,1,'新用户注册','after_register','cmf','新用户注册');
/*!40000 ALTER TABLE `jl_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_hook_plugin`
--

DROP TABLE IF EXISTS `jl_hook_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_hook_plugin`
--

LOCK TABLES `jl_hook_plugin` WRITE;
/*!40000 ALTER TABLE `jl_hook_plugin` DISABLE KEYS */;
INSERT INTO `jl_hook_plugin` VALUES (3,10000,1,'send_mobile_verification_code','JuheMobileCode'),(4,10000,1,'send_mobile_verification_code','MobileCodeDemo'),(7,10000,1,'generate_wallet','Wallet'),(8,10000,1,'generate_ticker','Wallet'),(9,10000,1,'after_register','NewUser');
/*!40000 ALTER TABLE `jl_hook_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_option`
--

DROP TABLE IF EXISTS `jl_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_option`
--

LOCK TABLES `jl_option` WRITE;
/*!40000 ALTER TABLE `jl_option` DISABLE KEYS */;
INSERT INTO `jl_option` VALUES (1,1,'site_info','{\"site_name\":\"Wallet API\",\"site_seo_title\":\"Wallet API\",\"site_seo_keywords\":\"Wallet API\",\"site_seo_description\":\"Wallet API\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\"}'),(2,1,'storage','{\"storages\":[]}'),(3,1,'smtp_setting','{\"from_name\":\"\",\"from\":\"\",\"host\":\"\",\"smtp_secure\":\"\",\"port\":\"\",\"username\":\"\",\"password\":\"\"}'),(4,1,'email_template_verification_code','{\"subject\":\"\\u9a8c\\u8bc1\\u7801\",\"template\":\"&lt;p&gt;\\u60a8\\u7684\\u9a8c\\u8bc1\\u7801\\u4e3a{$code}&lt;\\/p&gt;\"}'),(10,1,'cmf_settings','{\"open_registration\":\"0\",\"banned_usernames\":\"\"}'),(11,1,'cdn_settings','{\"cdn_static_root\":\"\"}'),(12,1,'admin_settings','{\"admin_password\":\"\"}'),(13,1,'sys_config','{\"turnout_audit1\":\"1\",\"turnout_audit2\":\"0\",\"notify_url\":\"http:\\/\\/testnew.juyika.com\\/api\\/notify\\/notify\",\"huizong_auto\":\"1\",\"huizong_interval\":\"3600\",\"huizong_min\":\"0.001\",\"huizong_max\":\"1\",\"md5_key\":\"123456\"}');
/*!40000 ALTER TABLE `jl_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_plugin`
--

DROP TABLE IF EXISTS `jl_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_plugin`
--

LOCK TABLES `jl_plugin` WRITE;
/*!40000 ALTER TABLE `jl_plugin` DISABLE KEYS */;
INSERT INTO `jl_plugin` VALUES (3,1,0,1,0,'JuheMobileCode','聚合手机验证码','','','Kinlink','','1.0','聚合手机验证码插件','{\"app_key\":\"8478fd7711a2fa4979e16413f663dd81\",\"template_id\":\"28551\",\"expire_minute\":\"30\"}'),(4,1,0,1,0,'MobileCodeDemo','手机验证码演示插件','','','ThinkCMF','','1.0','手机验证码演示插件','{\"account_sid\":\"\",\"auth_token\":\"\",\"app_id\":\"\",\"template_id\":\"\",\"expire_minute\":\"30\"}'),(8,1,0,1,0,'Wallet','钱包生成插件','','','Kinlink','','1.0','钱包生成插件','{\"default_coins\":\"BTC,ETH,USDT,EOS,XRP,LTC,ETC\",\"default_tickers\":\"1,2,3,4,5,6\"}'),(9,1,0,1,0,'NewUser','新用户注册后事件插件','','','Kinlink','','1.0','新用户注册后事件插件','[]');
/*!40000 ALTER TABLE `jl_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_recycle_bin`
--

DROP TABLE IF EXISTS `jl_recycle_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_recycle_bin`
--

LOCK TABLES `jl_recycle_bin` WRITE;
/*!40000 ALTER TABLE `jl_recycle_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_recycle_bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_role`
--

DROP TABLE IF EXISTS `jl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_role`
--

LOCK TABLES `jl_role` WRITE;
/*!40000 ALTER TABLE `jl_role` DISABLE KEYS */;
INSERT INTO `jl_role` VALUES (1,0,1,1329633709,1329633709,0,'超级管理员','拥有网站最高管理员权限！'),(2,0,1,1329633709,1329633709,0,'普通管理员','权限由最高管理员分配！');
/*!40000 ALTER TABLE `jl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_role_user`
--

DROP TABLE IF EXISTS `jl_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_role_user`
--

LOCK TABLES `jl_role_user` WRITE;
/*!40000 ALTER TABLE `jl_role_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_route`
--

DROP TABLE IF EXISTS `jl_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_route`
--

LOCK TABLES `jl_route` WRITE;
/*!40000 ALTER TABLE `jl_route` DISABLE KEYS */;
INSERT INTO `jl_route` VALUES (1,5000,1,2,'portal/List/index?id=4','资讯'),(2,4999,1,2,'portal/Article/index?cid=4','资讯/:id');
/*!40000 ALTER TABLE `jl_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_theme`
--

DROP TABLE IF EXISTS `jl_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_theme`
--

LOCK TABLES `jl_theme` WRITE;
/*!40000 ALTER TABLE `jl_theme` DISABLE KEYS */;
INSERT INTO `jl_theme` VALUES (1,0,0,0,0,'simpleboot3','simpleboot3','1.0.2','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF模板','ThinkCMF默认模板');
/*!40000 ALTER TABLE `jl_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_theme_file`
--

DROP TABLE IF EXISTS `jl_theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_theme_file`
--

LOCK TABLES `jl_theme_file` WRITE;
/*!40000 ALTER TABLE `jl_theme_file` DISABLE KEYS */;
INSERT INTO `jl_theme_file` VALUES (7,1,0,'simpleboot3','模板全局配置','public/Config','public/config','模板全局配置文件','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}',NULL),(8,1,1,'simpleboot3','导航条','public/Nav','public/nav','导航条模板文件','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"TK\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}',NULL);
/*!40000 ALTER TABLE `jl_theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_transfer_log`
--

DROP TABLE IF EXISTS `jl_transfer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_transfer_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_no` varchar(255) NOT NULL DEFAULT '' COMMENT '自有业务系统流水号',
  `wallet_id` int(11) NOT NULL COMMENT '钱包名称',
  `to_wallet_id` int(11) NOT NULL DEFAULT '0' COMMENT '内部互转 对方钱包ID',
  `type` int(11) NOT NULL COMMENT '1.外部转出 2.内部之间转出 3 转入  4汇总  5手续费转账',
  `coin_symbol` varchar(255) NOT NULL COMMENT '币种名称',
  `from_address` varchar(255) NOT NULL DEFAULT '' COMMENT '转账地址',
  `to_address` varchar(255) NOT NULL DEFAULT '' COMMENT '转账地址',
  `amount` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转账数量',
  `amount_before` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转账前余额',
  `amount_after` decimal(30,18) DEFAULT '0.000000000000000000' COMMENT '转账后余额',
  `fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '转账手续费',
  `log_time` int(11) NOT NULL DEFAULT '0' COMMENT '转账时间',
  `tx_id` varchar(255) NOT NULL DEFAULT '' COMMENT '链上交易ID',
  `blockhash` varchar(255) NOT NULL DEFAULT '' COMMENT '区块hash',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `transfer_status` int(2) NOT NULL DEFAULT '0' COMMENT '-1 失败 0等待处理 2转账中 1 转账成功',
  `notify_status` int(2) NOT NULL DEFAULT '0' COMMENT '回调通知状态',
  `audit_status` int(2) NOT NULL DEFAULT '0' COMMENT '0 未审批  1已经审批',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `coin_symbol` (`coin_symbol`(191)),
  KEY `transfer_status` (`transfer_status`),
  KEY `log_time` (`log_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_transfer_log`
--

LOCK TABLES `jl_transfer_log` WRITE;
/*!40000 ALTER TABLE `jl_transfer_log` DISABLE KEYS */;
INSERT INTO `jl_transfer_log` VALUES (1,'191',459,0,1,'ETH','0xd002905acc61880656c55ff913cd9fc64b6067fc','0x8127B0FD38043168CE2802F087AcdB172e620518',-100.000000000000000000,0.000000000000000000,0.000000000000000000,0.000000000000000000,1572665790,'','','wallet balance insufficient',0,0,1),(2,'192',459,0,1,'ETH','0xd002905acc61880656c55ff913cd9fc64b6067fc','0x8127B0FD38043168CE2802F087AcdB172e620518',-100.000000000000000000,0.000000000000000000,0.000000000000000000,0.000000000000000000,1572665801,'','','wallet balance insufficient',0,0,1),(3,'193',459,0,1,'ETH','0xd002905acc61880656c55ff913cd9fc64b6067fc','0x8127B0FD38043168CE2802F087AcdB172e620518',-100.000000000000000000,0.000000000000000000,0.000000000000000000,0.000000000000000000,1572667012,'','','wallet balance insufficient',0,0,1),(4,'194',459,0,1,'ETH','0xd002905acc61880656c55ff913cd9fc64b6067fc','0x8127B0FD38043168CE2802F087AcdB172e620518',-100.000000000000000000,0.000000000000000000,0.000000000000000000,0.000000000000000000,1572745258,'','','',0,0,1);
/*!40000 ALTER TABLE `jl_transfer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_user`
--

DROP TABLE IF EXISTS `jl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=8000037 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_user`
--

LOCK TABLES `jl_user` WRITE;
/*!40000 ALTER TABLE `jl_user` DISABLE KEYS */;
INSERT INTO `jl_user` VALUES (1,1,0,0,1572837126,0,0,0.00,1544752977,1,'admin','###b7cf51bc425e920b26aaa203cb91a2c3','admin','test@qq.com','','','','223.152.103.242','','13153985783',NULL),(8000036,2,0,0,1546242249,0,0,0.00,1546241933,1,'','###b7cf51bc425e920b26aaa203cb91a2c3','','','','','','','','13812341234',NULL);
/*!40000 ALTER TABLE `jl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_user_action`
--

DROP TABLE IF EXISTS `jl_user_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_user_action`
--

LOCK TABLES `jl_user_action` WRITE;
/*!40000 ALTER TABLE `jl_user_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_user_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_user_action_log`
--

DROP TABLE IF EXISTS `jl_user_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_user_action_log`
--

LOCK TABLES `jl_user_action_log` WRITE;
/*!40000 ALTER TABLE `jl_user_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_user_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_user_favorite`
--

DROP TABLE IF EXISTS `jl_user_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，JSON格式',
  `description` text COMMENT '收藏内容的描述',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_user_favorite`
--

LOCK TABLES `jl_user_favorite` WRITE;
/*!40000 ALTER TABLE `jl_user_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_user_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_user_like`
--

DROP TABLE IF EXISTS `jl_user_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_user_like` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '内容原来的主键id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '内容以前所在表,不带前缀',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容的原文地址，不带域名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '内容的标题',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` text COMMENT '内容的描述',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_user_like`
--

LOCK TABLES `jl_user_like` WRITE;
/*!40000 ALTER TABLE `jl_user_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_user_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_user_login_attempt`
--

DROP TABLE IF EXISTS `jl_user_login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_user_login_attempt`
--

LOCK TABLES `jl_user_login_attempt` WRITE;
/*!40000 ALTER TABLE `jl_user_login_attempt` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_user_login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_user_token`
--

DROP TABLE IF EXISTS `jl_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_user_token`
--

LOCK TABLES `jl_user_token` WRITE;
/*!40000 ALTER TABLE `jl_user_token` DISABLE KEYS */;
INSERT INTO `jl_user_token` VALUES (26,1,1588082285,1572530285,'75e33a188c7a1e9a1b0a5b466a5239f87e78e0468f603a40cb53d4019f55b360','web'),(27,8000036,1561794249,1546242249,'5f6089c6ebc290d0b00ef5a503f994bb5f6089c6ebc290d0b00ef5a503f994bb','api');
/*!40000 ALTER TABLE `jl_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_verification_code`
--

DROP TABLE IF EXISTS `jl_verification_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_verification_code`
--

LOCK TABLES `jl_verification_code` WRITE;
/*!40000 ALTER TABLE `jl_verification_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `jl_verification_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jl_wallet`
--

DROP TABLE IF EXISTS `jl_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jl_wallet` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL DEFAULT '' COMMENT '自有系统用户ID',
  `coin_symbol` varchar(255) NOT NULL COMMENT '币种符号',
  `chain_balance` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '链上正式余额',
  `chain_balance_fee` decimal(30,18) NOT NULL DEFAULT '0.000000000000000000' COMMENT '手续费余额（代币专用）',
  `address` varchar(255) NOT NULL COMMENT '币种地址',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT 'memo信息',
  `seed` varchar(255) NOT NULL DEFAULT '' COMMENT '钱包种子等信息',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后添加时间',
  `turnout_status` int(11) NOT NULL DEFAULT '1' COMMENT '转出状态',
  `depot_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否为汇总钱包',
  `fee_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否为手续费钱包（代币专用）',
  `pay_status` int(11) NOT NULL DEFAULT '0' COMMENT '是否为出款账户',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '钱包状态',
  PRIMARY KEY (`id`),
  KEY `coin_symbol` (`coin_symbol`(191)),
  KEY `status` (`status`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jl_wallet`
--

LOCK TABLES `jl_wallet` WRITE;
/*!40000 ALTER TABLE `jl_wallet` DISABLE KEYS */;
INSERT INTO `jl_wallet` VALUES (459,'1000764','ETH',0.000000000000000000,0.000000000000000000,'0xd002905acc61880656c55ff913cd9fc64b6067fc','','7fe1f8abaad094e0b5cb1b01d712f708',1572536752,1,0,0,0,1),(460,'1000666','ETH',0.000000000000000000,0.000000000000000000,'0x408402b2823b2739db4c4b84e6433f20bebac06d','','98b297950041a42470269d56260243a1',1572536771,1,0,0,0,1),(461,'1000666','BTC',0.000000000000000000,0.000000000000000000,'35MAqbogRMTikFkg7CiMMEWs8yYvDaVrQ3','','',1572536776,1,0,0,0,1),(462,'1000666','USDT',0.000000000000000000,0.000000000000000000,'1KVJn6Qy1cqt5Zk5QpeRfEM2yXuRjWJ4zS','','',1572536779,1,0,0,0,1),(463,'1000764','BTC',0.000000000000000000,0.000000000000000000,'36nfoEG9QZ34ygzDxuw1gYRhdBfMSwx19M','','',1572655597,1,0,0,0,1),(464,'1000764','USDT',0.000000000000000000,0.000000000000000000,'1E6NWfDFTknB7Ux3k88zFivppjziXsVDdX','','',1572655600,1,0,0,0,1),(465,'1000765','ETH',0.000000000000000000,0.000000000000000000,'0x0ee568e5f8f040e3f6a4cd337f45f39ccdcd9d8e','','68ce199ec2c5517597ce0a4d89620f55',1572655978,1,0,0,0,1),(466,'1000765','BTC',0.000000000000000000,0.000000000000000000,'3D1gH7c3hMLQ1ErT6Eo6Wo41qPu3c3SFZe','','',1572656125,1,0,0,0,1),(467,'1000757','BTC',0.000000000000000000,0.000000000000000000,'3Fp9MdQGVYNG2nMnHtsq4rWDNXA1u2U28A','','',1572656950,1,0,0,0,1),(468,'1000766','ETH',0.000000000000000000,0.000000000000000000,'','','',1572667638,1,0,0,0,0),(469,'1000766','BTC',0.000000000000000000,0.000000000000000000,'','','',1572667666,1,0,0,0,0),(470,'1000766','USDT',0.000000000000000000,0.000000000000000000,'','','',1572709513,1,0,0,0,0),(471,'1000765','USDT',0.000000000000000000,0.000000000000000000,'','','',1572709577,1,0,0,0,0),(472,'1000762','ETH',0.000000000000000000,0.000000000000000000,'','','',1572709592,1,0,0,0,0),(473,'1000762','BTC',0.000000000000000000,0.000000000000000000,'','','',1572709602,1,0,0,0,0);
/*!40000 ALTER TABLE `jl_wallet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-05  8:58:36

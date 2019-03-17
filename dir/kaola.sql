-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: kaola
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `KaoLa_cart`
--

DROP TABLE IF EXISTS `KaoLa_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KaoLa_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isselect` tinyint(1) NOT NULL,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `KaoLa_cart_goods_id_8587c0e2_fk_KaoLa_goods_id` (`goods_id`),
  KEY `KaoLa_cart_user_id_63dadaa1_fk_KaoLa_user_id` (`user_id`),
  CONSTRAINT `KaoLa_cart_goods_id_8587c0e2_fk_KaoLa_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `KaoLa_goods` (`id`),
  CONSTRAINT `KaoLa_cart_user_id_63dadaa1_fk_KaoLa_user_id` FOREIGN KEY (`user_id`) REFERENCES `KaoLa_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KaoLa_cart`
--

LOCK TABLES `KaoLa_cart` WRITE;
/*!40000 ALTER TABLE `KaoLa_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `KaoLa_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KaoLa_goods`
--

DROP TABLE IF EXISTS `KaoLa_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KaoLa_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `small_src` varchar(100) NOT NULL,
  `middle_src` varchar(100) NOT NULL,
  `big_src` varchar(100) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `des` varchar(200) NOT NULL,
  `discount_price` varchar(40) NOT NULL,
  `orig_price` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KaoLa_goods`
--

LOCK TABLES `KaoLa_goods` WRITE;
/*!40000 ALTER TABLE `KaoLa_goods` DISABLE KEYS */;
INSERT INTO `KaoLa_goods` VALUES (30,'img/forshow/id1/imq4k7dr86_800_800(3).jpg','img/forshow/id1/imq4k7dr86_800_800(1).jpg','img/forshow/id1/imq4k7dr86_800_800.jpg','BIO ISLAND 佰澳朗德','BIO ISLAND 佰澳朗德 孕妇可用婴幼儿DHA海藻油 60粒/瓶 2瓶','每个孕妈在怀孕期间都会流失大量的DHA，比如视力明显减退，记忆力降低等等。但是盲目补充DHA会造成孩子性早熟。bioIsland 海藻油提取DHA是绝对可以放心。听说用了它的妈妈，孩子眼珠亮，有神！','￥208.00','￥435'),(31,'img/forshow/id2/it2nijp097_800_800.jpg','img/forshow/id2/it2nil4k46_800_800(1).jpg','img/forshow/id/img/forshow/id2/it2nil4k46_800_800(2).jpg','贝拉米','贝拉米 有机奶粉1段 900克/罐 3罐装','全球知名有机奶粉之一，“世界尽头”南澳岛屿有机牧场奶源，由澳洲有机认证机构监控，天然安全。网易考拉远赴澳洲采购，只为给宝宝带来新鲜高品质的好奶粉。','￥447.00','￥447'),(32,'img/forshow/id3/onlinei2wnr43h10006.jpg','img/forshow/id3/onlineic46traw10011(1).jpg','img/forshow/id3/onlineic46traw10011(2).jpg','Merries 花王妙而舒','Merries 花王妙而舒 NB 90片/包 4包装 纸尿裤/尿不湿 ','来自日本的纸尿裤，是受日本国人欢迎的纸尿裤品牌之一，花王纸尿裤注重通气性和柔软性，使用极细纤维柔软内衬棉，尿显精确，防漏护围设计，确保不含甲醛、不用燃料，控制PH值。','￥316.00','￥596'),(33,'img/forshow/id4/9a57da45-b6f8-4cc9-b371-86b0b8f49d5c.jpg','img/forshow/id4/533e6e4c-b5fa-4bef-b0a1-a3c835a18089(1).jpg','img/forshow/id4/533e6e4c-b5fa-4bef-b0a1-a3c835a18089(2).jpg','ledibaby 乐蒂宝贝','ledibaby 乐蒂宝贝 提篮式安全座椅婴 儿提篮摇篮睡篮 美国队长 3C','升级安全座椅减200元,头枕全新升级,布料细腻柔软透气适合新生宝宝娇嫩的肌肤，遮阳蓬设计防晒防紫外线，通过ECE和3C认证，根据宝宝人体工学给宝宝最舒适的姿势；多种功能：可当做婴儿提篮、汽车安全座椅、摇篮使用。','￥388.00','￥998'),(34,'img/forshow/id5/ipic1de757_800_800.jpg','img/forshow/id5/ipic1de757_800_800(1).jpg','img/forshow/id5/ipic1de757_800_800(2).jpg','akasugu 新生','akasugu 新生 POSTAR 儿童星星立体徽章雨鞋 雨季必备 黄色','None','￥165.00','￥225');
/*!40000 ALTER TABLE `KaoLa_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KaoLa_order`
--

DROP TABLE IF EXISTS `KaoLa_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KaoLa_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `updatetime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `KaoLa_order_user_id_8ebe9a4e_fk_KaoLa_user_id` (`user_id`),
  CONSTRAINT `KaoLa_order_user_id_8ebe9a4e_fk_KaoLa_user_id` FOREIGN KEY (`user_id`) REFERENCES `KaoLa_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KaoLa_order`
--

LOCK TABLES `KaoLa_order` WRITE;
/*!40000 ALTER TABLE `KaoLa_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `KaoLa_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KaoLa_ordergoods`
--

DROP TABLE IF EXISTS `KaoLa_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KaoLa_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `KaoLa_ordergoods_goods_id_23bf4a5a_fk_KaoLa_goods_id` (`goods_id`),
  KEY `KaoLa_ordergoods_order_id_ac73e411_fk_KaoLa_order_id` (`order_id`),
  CONSTRAINT `KaoLa_ordergoods_goods_id_23bf4a5a_fk_KaoLa_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `KaoLa_goods` (`id`),
  CONSTRAINT `KaoLa_ordergoods_order_id_ac73e411_fk_KaoLa_order_id` FOREIGN KEY (`order_id`) REFERENCES `KaoLa_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KaoLa_ordergoods`
--

LOCK TABLES `KaoLa_ordergoods` WRITE;
/*!40000 ALTER TABLE `KaoLa_ordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `KaoLa_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KaoLa_user`
--

DROP TABLE IF EXISTS `KaoLa_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KaoLa_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `passwrod` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KaoLa_user`
--

LOCK TABLES `KaoLa_user` WRITE;
/*!40000 ALTER TABLE `KaoLa_user` DISABLE KEYS */;
INSERT INTO `KaoLa_user` VALUES (4,'1234@qq.com','e10adc3949ba59abbe56e057f20f883e','kaola.png','13798888888','kaola');
/*!40000 ALTER TABLE `KaoLa_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KaoLa_wheel`
--

DROP TABLE IF EXISTS `KaoLa_wheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KaoLa_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KaoLa_wheel`
--

LOCK TABLES `KaoLa_wheel` WRITE;
/*!40000 ALTER TABLE `KaoLa_wheel` DISABLE KEYS */;
INSERT INTO `KaoLa_wheel` VALUES (1,'img/slide1_1920_400.jpg'),(2,'img/slide2_1920_400.jpg'),(3,'img/slide3_1920_400.jpg'),(4,'img/slide4_1920_400.jpg'),(5,'img/slide5_1920_400.jpg'),(6,'img/slide6_1920_400.jpg'),(7,'img/slide7_1920_400.jpg');
/*!40000 ALTER TABLE `KaoLa_wheel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add wheel',7,'add_wheel'),(20,'Can change wheel',7,'change_wheel'),(21,'Can delete wheel',7,'delete_wheel'),(22,'Can add goods',8,'add_goods'),(23,'Can change goods',8,'change_goods'),(24,'Can delete goods',8,'delete_goods'),(25,'Can add user',9,'add_user'),(26,'Can change user',9,'change_user'),(27,'Can delete user',9,'delete_user'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add order goods',11,'add_ordergoods'),(32,'Can change order goods',11,'change_ordergoods'),(33,'Can delete order goods',11,'delete_ordergoods'),(34,'Can add order',12,'add_order'),(35,'Can change order',12,'change_order'),(36,'Can delete order',12,'delete_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(10,'KaoLa','cart'),(8,'KaoLa','goods'),(12,'KaoLa','order'),(11,'KaoLa','ordergoods'),(9,'KaoLa','user'),(7,'KaoLa','wheel'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'KaoLa','0001_initial','2019-03-14 09:53:46.912257'),(2,'contenttypes','0001_initial','2019-03-14 09:53:47.179645'),(3,'auth','0001_initial','2019-03-14 09:53:49.603552'),(4,'admin','0001_initial','2019-03-14 09:53:50.097490'),(5,'admin','0002_logentry_remove_auto_add','2019-03-14 09:53:50.153525'),(6,'contenttypes','0002_remove_content_type_name','2019-03-14 09:53:50.457670'),(7,'auth','0002_alter_permission_name_max_length','2019-03-14 09:53:50.665260'),(8,'auth','0003_alter_user_email_max_length','2019-03-14 09:53:50.910813'),(9,'auth','0004_alter_user_username_opts','2019-03-14 09:53:50.935528'),(10,'auth','0005_alter_user_last_login_null','2019-03-14 09:53:51.082197'),(11,'auth','0006_require_contenttypes_0002','2019-03-14 09:53:51.093437'),(12,'auth','0007_alter_validators_add_error_messages','2019-03-14 09:53:51.125543'),(13,'auth','0008_alter_user_username_max_length','2019-03-14 09:53:51.316827'),(14,'sessions','0001_initial','2019-03-14 09:53:51.536471'),(15,'KaoLa','0002_goods','2019-03-14 12:51:02.689604'),(16,'KaoLa','0003_auto_20190314_1327','2019-03-14 13:27:35.518227'),(17,'KaoLa','0004_user','2019-03-15 02:23:18.287916'),(18,'KaoLa','0005_cart','2019-03-15 06:40:07.249724'),(19,'KaoLa','0006_order_ordergoods','2019-03-16 01:57:11.252746');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('vwv36kblvtyeffk3jaxoycsgrj44uqkq','YTU2ZTQ0ZTQ4MDNjMDZlMjYzN2UzZWYxOTlmNDhkMmVjN2NkMTMyNTp7InRva2VuIjoiNzJjN2I1M2E2YmI5MWVhM2NhNjE5NTkyYjU0ZWQ3MTAifQ==','2019-03-30 06:04:57.100894');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-16 14:11:48

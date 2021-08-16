-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: crm
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.1

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
-- Table structure for table `Accounts_customer`
--
CREATE DataBase crm;
use crm;
DROP TABLE IF EXISTS `Accounts_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `Accounts_customer_user_id_0fd57a3c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_customer`
--

/*!40000 ALTER TABLE `Accounts_customer` DISABLE KEYS */;
INSERT INTO `Accounts_customer` VALUES (1,'sobhan',NULL,NULL,'2021-08-15 01:10:31.564530',1),(2,'sob',NULL,'sob@gmail.com','2021-08-15 01:13:19.705466',2),(3,'Ross',NULL,'Ross@gmail.com','2021-08-15 03:36:45.276743',3),(4,'Jack',NULL,'Jack@gmail.com','2021-08-15 03:37:23.976033',4),(5,'\"admin\"',NULL,'\"admin@gmail.com\"',NULL,5);
/*!40000 ALTER TABLE `Accounts_customer` ENABLE KEYS */;

--
-- Table structure for table `Accounts_order`
--

DROP TABLE IF EXISTS `Accounts_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Accounts_order_customer_id_d070b87b_fk_Accounts_customer_id` (`customer_id`),
  KEY `Accounts_order_product_id_0620c866_fk_Accounts_product_id` (`product_id`),
  CONSTRAINT `Accounts_order_customer_id_d070b87b_fk_Accounts_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `Accounts_customer` (`id`),
  CONSTRAINT `Accounts_order_product_id_0620c866_fk_Accounts_product_id` FOREIGN KEY (`product_id`) REFERENCES `Accounts_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_order`
--

/*!40000 ALTER TABLE `Accounts_order` DISABLE KEYS */;
INSERT INTO `Accounts_order` VALUES (1,NULL,'Pending','Test',1,2),(2,NULL,'\"Pending\"','\"New\"',5,4),(3,NULL,'\"Pending\"','\"Jadid\"',5,5),(4,NULL,'\"Pending\"','\"Car\"',5,6);
/*!40000 ALTER TABLE `Accounts_order` ENABLE KEYS */;

--
-- Table structure for table `Accounts_product`
--

DROP TABLE IF EXISTS `Accounts_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_product`
--

/*!40000 ALTER TABLE `Accounts_product` DISABLE KEYS */;
INSERT INTO `Accounts_product` VALUES (1,'\"Apple\"',123,'\"Fruit\"','\"Fruit\"',NULL),(2,'\"Orange\"',111,'\"Fruit\"','\"Fruit\"',NULL),(4,'\"Test',13231,'\"Test\"','\"Test\"',NULL),(5,'\"Benz\"',2000000,'\"Car\"','\"New Car\"',NULL),(6,'\"BMW\"',12313000,'\"Car\"','\"BMW\"',NULL);
/*!40000 ALTER TABLE `Accounts_product` ENABLE KEYS */;

--
-- Table structure for table `Accounts_product_tags`
--

DROP TABLE IF EXISTS `Accounts_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts_product_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Accounts_product_tags_product_id_tag_id_acf7d3a3_uniq` (`product_id`,`tag_id`),
  KEY `Accounts_product_tags_tag_id_467b78e4_fk_Accounts_tag_id` (`tag_id`),
  CONSTRAINT `Accounts_product_tags_product_id_9ba9a008_fk_Accounts_product_id` FOREIGN KEY (`product_id`) REFERENCES `Accounts_product` (`id`),
  CONSTRAINT `Accounts_product_tags_tag_id_467b78e4_fk_Accounts_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `Accounts_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_product_tags`
--

/*!40000 ALTER TABLE `Accounts_product_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts_product_tags` ENABLE KEYS */;

--
-- Table structure for table `Accounts_tag`
--

DROP TABLE IF EXISTS `Accounts_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts_tag`
--

/*!40000 ALTER TABLE `Accounts_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts_tag` ENABLE KEYS */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(2,'customer');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add customer',7,'add_customer'),(26,'Can change customer',7,'change_customer'),(27,'Can delete customer',7,'delete_customer'),(28,'Can view customer',7,'view_customer'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add tag',9,'add_tag'),(34,'Can change tag',9,'change_tag'),(35,'Can delete tag',9,'delete_tag'),(36,'Can view tag',9,'view_tag'),(37,'Can add order',10,'add_order'),(38,'Can change order',10,'change_order'),(39,'Can delete order',10,'delete_order'),(40,'Can view order',10,'view_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$PYz4lI9jumIhUYoRluDET8$2j9e5NjwP8e4NIMTngk0g3HitF3HIDIF6/CVXMLtCPs=','2021-08-16 00:57:32.224691',0,'sobhan','','','sobhan@gmail.com',1,1,'2021-08-15 01:10:31.000000'),(2,'pbkdf2_sha256$260000$16yNY4ATWt1ljVXh01g0Qg$v4TifsOefrne+RdGOofEdsgomNiRHhaB2/+rLmE/Ctk=',NULL,0,'sob','','','sob@gmail.com',0,1,'2021-08-15 01:13:19.000000'),(3,'pbkdf2_sha256$260000$bB78azoZ77aFyJFdpG66qV$/7MgO6/WH2xyK/ec27tFBspro5iDqmXroSfPMBOMT1w=',NULL,0,'Ross','','','Ross@gmail.com',0,1,'2021-08-15 03:36:45.000000'),(4,'pbkdf2_sha256$260000$LrsNP2G0j1EfJaBVjeDqEk$bdV7ZQxv2uoAhhkb4SrbwlH6ibXtAYd3S8SiAawx1J0=','2021-08-16 00:57:51.339941',0,'Jack','','','Jack@gmail.com',0,1,'2021-08-15 03:37:23.000000'),(5,'pbkdf2_sha256$260000$Hl1XLOzobyQAWB419UHUrL$QE0jg2VsqC7h1jP0xwJxnISGc4nrwdqFfcqNxB8AQ10=','2021-08-16 03:45:12.469511',1,'admin','','','admin@gmail.com',1,1,'2021-08-15 23:57:20.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (5,1,1),(4,2,2),(3,3,2),(2,4,2),(1,5,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-08-15 23:58:31.675280','1','admin',1,'[{\"added\": {}}]',3,5),(2,'2021-08-15 23:58:39.570842','1','admin',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,5),(3,'2021-08-15 23:58:47.904886','2','customer',1,'[{\"added\": {}}]',3,5),(4,'2021-08-16 00:46:52.423279','5','admin',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,5),(5,'2021-08-16 00:47:01.028872','4','Jack',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,5),(6,'2021-08-16 00:47:08.496378','3','Ross',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,5),(7,'2021-08-16 00:47:15.353508','2','sob',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,5),(8,'2021-08-16 00:47:23.027106','1','sobhan',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'Accounts','customer'),(10,'Accounts','order'),(8,'Accounts','product'),(9,'Accounts','tag'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-08-14 19:16:03.866675'),(2,'auth','0001_initial','2021-08-14 19:16:05.738287'),(3,'Accounts','0001_initial','2021-08-14 19:16:06.022045'),(4,'admin','0001_initial','2021-08-14 19:16:06.439023'),(5,'admin','0002_logentry_remove_auto_add','2021-08-14 19:16:06.462781'),(6,'admin','0003_logentry_add_action_flag_choices','2021-08-14 19:16:06.481673'),(7,'contenttypes','0002_remove_content_type_name','2021-08-14 19:16:06.753609'),(8,'auth','0002_alter_permission_name_max_length','2021-08-14 19:16:06.919488'),(9,'auth','0003_alter_user_email_max_length','2021-08-14 19:16:06.988790'),(10,'auth','0004_alter_user_username_opts','2021-08-14 19:16:07.016634'),(11,'auth','0005_alter_user_last_login_null','2021-08-14 19:16:07.152161'),(12,'auth','0006_require_contenttypes_0002','2021-08-14 19:16:07.157942'),(13,'auth','0007_alter_validators_add_error_messages','2021-08-14 19:16:07.202743'),(14,'auth','0008_alter_user_username_max_length','2021-08-14 19:16:07.405952'),(15,'auth','0009_alter_user_last_name_max_length','2021-08-14 19:16:07.610697'),(16,'auth','0010_alter_group_name_max_length','2021-08-14 19:16:07.662912'),(17,'auth','0011_update_proxy_permissions','2021-08-14 19:16:07.716644'),(18,'auth','0012_alter_user_first_name_max_length','2021-08-14 19:16:07.904972'),(19,'sessions','0001_initial','2021-08-14 19:16:08.043860'),(20,'Accounts','0002_order_product_tag','2021-08-15 04:20:24.812318');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dyw9prno3kav0kez5cd5wmqrpa9xcm9i','.eJxVjEsOwjAMBe-SNYri4LYOS_Y9Q-XEDimgVOpnhbg7VOoCtm9m3ssMvK1l2Badh1HMxYA5_W6R00PrDuTO9TbZNNV1HqPdFXvQxfaT6PN6uH8HhZfyrSnkhpRaR-DAd63PLDlgoJhRyEEHjNrxGb1q0CgCKA02OSQgdkjm_QHMvzeL:1mFPDH:JNBTlEVGmrNEBlpqll4TAy1q1REK25NLXA3mQzLENos','2021-08-29 23:06:43.193073');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-16  8:21:09

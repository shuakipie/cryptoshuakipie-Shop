-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (arm64)
--
-- Host: localhost    Database: shopwise
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'VnEUgWr6SzXtLq2vW6cFdGjg6gZ0CO6c',1,'2022-11-13 00:50:37','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Homepage middle 1','2027-11-13 00:00:00','not_set','IZ6WU8KUALYD','promotion/1.jpg','/product-categories/headphone',0,1,'published','2022-11-13 00:50:38','2022-11-13 00:50:38'),(2,'Homepage middle 2','2027-11-13 00:00:00','not_set','ILSFJVYFGCPZ','promotion/2.jpg','/product-categories/camera',0,2,'published','2022-11-13 00:50:38','2022-11-13 00:50:38'),(3,'Homepage middle 3','2027-11-13 00:00:00','not_set','ZDOZUZZIU7FT','promotion/3.jpg','/product-categories/watches',0,3,'published','2022-11-13 00:50:38','2022-11-13 00:50:38');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int unsigned NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Architecto quia voluptatem laborum enim. Ut veniam quam repudiandae velit sed ut sint dicta. Aut voluptas repellendus optio totam.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Fashion',0,'Vitae quo modi iusto. Dolor et eos nemo id. Expedita est et voluptas nihil. Placeat illum dolor maiores illum magnam deserunt.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Electronic',0,'Minima non quo ut ut iure distinctio. Quas consequatur ut voluptate aspernatur. Asperiores quos quis nihil itaque dolore. Rem aspernatur corporis ea eaque nam sunt.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'Commercial',0,'Nobis non est magni et. Laborum et officia est voluptatem quaerat. Sapiente facilis sit minus voluptatem est et. Fugiat facilis numquam eveniet nobis pariatur laborum.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
INSERT INTO `categories_translations` VALUES ('vi',1,'Thương mại điện tử',NULL),('vi',2,'Thời trang',NULL),('vi',3,'Điện tử',NULL),('vi',4,'Thương mại',NULL);
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state_id` int unsigned NOT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `widget_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Fashion live',NULL,NULL,'brands/1.png','published',0,1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(2,'Hand crafted',NULL,NULL,'brands/2.png','published',1,1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(3,'Mestonix',NULL,NULL,'brands/3.png','published',2,1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(4,'Sunshine',NULL,NULL,'brands/4.png','published',3,1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(5,'Pure',NULL,NULL,'brands/5.png','published',4,1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(6,'Anfold',NULL,NULL,'brands/6.png','published',5,1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(7,'Automotive',NULL,NULL,'brands/7.png','published',6,1,'2022-11-13 00:50:30','2022-11-13 00:50:30');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
INSERT INTO `ec_brands_translations` VALUES ('vi',1,'Fashion live',NULL),('vi',2,'Hand crafted',NULL),('vi',3,'Mestonix',NULL),('vi',4,'Sunshine',NULL),('vi',5,'Pure',NULL),('vi',6,'Anfold',NULL),('vi',7,'Automotive',NULL);
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(2,'EUR','€',0,2,1,0,0.84,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(3,'VND','₫',0,0,2,0,23203,'2022-11-13 00:50:30','2022-11-13 00:50:30');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'John Smith','john.smith@botble.com','+17707653429','PK','Alabama','Lake Lula','785 Retha Union Apt. 905',1,1,'2022-11-13 00:50:31','2022-11-13 00:50:31','99368-1578'),(2,'John Smith','john.smith@botble.com','+12707403335','MV','Hawaii','Otismouth','488 Leila Forge',1,0,'2022-11-13 00:50:31','2022-11-13 00:50:31','90935'),(3,'Rafaela Torphy','vjerde@example.net','+15649786771','TL','Oregon','Kurtbury','1156 Josiane Island Suite 061',2,1,'2022-11-13 00:50:31','2022-11-13 00:50:31','18850-5714'),(4,'Dock Gulgowski','estrella.mante@example.net','+14244249953','SG','West Virginia','East Casimerborough','593 Tiana Cliffs Suite 469',3,1,'2022-11-13 00:50:31','2022-11-13 00:50:31','64560-8854'),(5,'Allie Zieme','abby60@example.org','+13522633250','PT','Massachusetts','Casperview','5992 Rosenbaum Wall Apt. 559',4,1,'2022-11-13 00:50:31','2022-11-13 00:50:31','24736'),(6,'Loren Christiansen DVM','ada46@example.com','+18304639776','YT','District of Columbia','North Larry','9063 Etha Wells',5,1,'2022-11-13 00:50:31','2022-11-13 00:50:31','61987-4827'),(7,'Lesly Runolfsdottir','opouros@example.com','+14756358538','IO','Mississippi','Port Jackystad','984 Barrows Mill',6,1,'2022-11-13 00:50:31','2022-11-13 00:50:31','76471'),(8,'Silas Dach','hessel.gardner@example.com','+18623961953','YT','Montana','West Caliton','217 Zita Via',7,1,'2022-11-13 00:50:32','2022-11-13 00:50:32','94218-6025'),(9,'Gudrun Cronin','ioconner@example.com','+17178822708','CV','Hawaii','Port Dashawnton','93762 Kunze Extension',8,1,'2022-11-13 00:50:32','2022-11-13 00:50:32','14808-7189'),(10,'Prof. Floy Reynolds','myron82@example.net','+18457303136','PA','Arizona','Bennettton','870 Harber Cove',9,1,'2022-11-13 00:50:32','2022-11-13 00:50:32','54742'),(11,'Lula Weimann','marks.marcus@example.net','+18782792063','KH','Kansas','West Madeline','1826 Hegmann Road',10,1,'2022-11-13 00:50:32','2022-11-13 00:50:32','39581'),(12,'Jacklyn Dietrich','ekutch@example.net','+19702129093','PT','South Dakota','Mertiemouth','8812 Emelia Forest Suite 387',11,1,'2022-11-13 00:50:32','2022-11-13 00:50:32','84028-9764');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'John Smith','john.smith@botble.com','$2y$10$fwG0J0ET7uCfmxpoOKYWeOEkUCHlTlfPNXicUCthAcbZpkU1sWdHe','customers/1.jpg','1981-10-27','+14348530122',NULL,'2022-11-13 00:50:31','2022-11-13 00:50:31','2022-11-13 07:50:31',NULL,'activated'),(2,'Rafaela Torphy','vjerde@example.net','$2y$10$85.09sX51GoMuU8EvdJXI.QP1pckZEwyfap/TBc7roHdmwppKjjLG','customers/1.jpg','1994-10-15','+14247029540',NULL,'2022-11-13 00:50:31','2022-11-13 00:50:31','2022-11-13 07:50:31',NULL,'activated'),(3,'Dock Gulgowski','estrella.mante@example.net','$2y$10$E1LU5m4i1GBesKSgmavZeetrkPtxQQ3svaa4p2AbWtEZl300D2JJq','customers/2.jpg','1974-10-18','+15204357055',NULL,'2022-11-13 00:50:31','2022-11-13 00:50:31','2022-11-13 07:50:31',NULL,'activated'),(4,'Allie Zieme','abby60@example.org','$2y$10$FlZNXUtaxt.xtz8428IrPexOidk.9KQzwPDDpynBwA7FJPoSifJuq','customers/3.jpg','1983-10-16','+12794532464',NULL,'2022-11-13 00:50:31','2022-11-13 00:50:31','2022-11-13 07:50:31',NULL,'activated'),(5,'Loren Christiansen DVM','ada46@example.com','$2y$10$QkZfr8tIE8cRaqF0xzSow.uEfUyZVpcVK05pPnT/oLSzPsCjHoN..','customers/4.jpg','2000-10-23','+15402989878',NULL,'2022-11-13 00:50:31','2022-11-13 00:50:31','2022-11-13 07:50:31',NULL,'activated'),(6,'Lesly Runolfsdottir','opouros@example.com','$2y$10$Vaj/03fDrSTOVfmFxuHIUubuYj5YNtXiN0kiaIM2J4qdOcHtYVJp.','customers/5.jpg','1983-11-02','+17273052914',NULL,'2022-11-13 00:50:31','2022-11-13 00:50:31','2022-11-13 07:50:31',NULL,'activated'),(7,'Silas Dach','hessel.gardner@example.com','$2y$10$6n74b4TVI1yrSDjqpHzeXO2iXsV7.4SyyM6oRxH1aNyMvhrl2Pwlm','customers/6.jpg','1976-10-22','+18284672753',NULL,'2022-11-13 00:50:32','2022-11-13 00:50:32','2022-11-13 07:50:32',NULL,'activated'),(8,'Gudrun Cronin','ioconner@example.com','$2y$10$5cz4IXmnxUPoNsFQw2pvIumK8tmz.oYiowjhyBPn2i724YXUElsIK','customers/7.jpg','1975-11-11','+12697704042',NULL,'2022-11-13 00:50:32','2022-11-13 00:50:32','2022-11-13 07:50:32',NULL,'activated'),(9,'Prof. Floy Reynolds','myron82@example.net','$2y$10$wxDkXRHPgartRAP4WlzuJOmyfM5JVwiRuR6cEhQNC4Rr9WBrg3TLC','customers/8.jpg','2000-11-03','+12147132621',NULL,'2022-11-13 00:50:32','2022-11-13 00:50:32','2022-11-13 07:50:32',NULL,'activated'),(10,'Lula Weimann','marks.marcus@example.net','$2y$10$4gY.HFApH8k07WensZ6Jc.zfKMsVI24T78PnrZfJq3ztNjU6881SK','customers/9.jpg','1972-11-02','+14586529332',NULL,'2022-11-13 00:50:32','2022-11-13 00:50:32','2022-11-13 07:50:32',NULL,'activated'),(11,'Jacklyn Dietrich','ekutch@example.net','$2y$10$nbbghtWYsF93B6AFgVOJbuo1figcPvyLRcotwdrdyoC7Sj1jeHqoW','customers/10.jpg','1982-11-05','+17253158299',NULL,'2022-11-13 00:50:32','2022-11-13 00:50:32','2022-11-13 07:50:32',NULL,'activated');
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` int unsigned NOT NULL,
  `customer_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` int unsigned NOT NULL,
  `product_collection_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,23,85.4,15,2),(2,11,33.3,17,4);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Deal of the Day.','2022-12-05 00:00:00','published','2022-11-13 00:50:36','2022-11-13 00:50:36'),(2,'Gadgets & Accessories','2022-12-31 00:00:00','published','2022-11-13 00:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
INSERT INTO `ec_flash_sales_translations` VALUES ('vi',1,'Khuyến mãi trong ngày.'),('vi',2,'Tiện ích & Phụ kiện');
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `option_id` bigint NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,'1 Year',0,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(1,'2 Year',10,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(1,'3 Year',20,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'4GB',0,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'8GB',10,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'16GB',20,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Core i5',0,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Core i7',10,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Core i9',20,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'128GB',0,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'256GB',10,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'512GB',20,9999,0,'2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'RAM','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'CPU','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'HDD','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,'2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` int unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `option_id` bigint NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
INSERT INTO `ec_order_addresses` VALUES (1,'Jacklyn Dietrich','+19702129093','ekutch@example.net','PT','South Dakota','Mertiemouth','8812 Emelia Forest Suite 387',1,'84028-9764','shipping_address'),(2,'Lesly Runolfsdottir','+14756358538','opouros@example.com','IO','Mississippi','Port Jackystad','984 Barrows Mill',2,'76471','shipping_address'),(3,'Gudrun Cronin','+17178822708','ioconner@example.com','CV','Hawaii','Port Dashawnton','93762 Kunze Extension',3,'14808-7189','shipping_address'),(4,'Dock Gulgowski','+14244249953','estrella.mante@example.net','SG','West Virginia','East Casimerborough','593 Tiana Cliffs Suite 469',4,'64560-8854','shipping_address'),(5,'Jacklyn Dietrich','+19702129093','ekutch@example.net','PT','South Dakota','Mertiemouth','8812 Emelia Forest Suite 387',5,'84028-9764','shipping_address'),(6,'Silas Dach','+18623961953','hessel.gardner@example.com','YT','Montana','West Caliton','217 Zita Via',6,'94218-6025','shipping_address'),(7,'Prof. Floy Reynolds','+18457303136','myron82@example.net','PA','Arizona','Bennettton','870 Harber Cove',7,'54742','shipping_address'),(8,'Prof. Floy Reynolds','+18457303136','myron82@example.net','PA','Arizona','Bennettton','870 Harber Cove',8,'54742','shipping_address'),(9,'Jacklyn Dietrich','+19702129093','ekutch@example.net','PT','South Dakota','Mertiemouth','8812 Emelia Forest Suite 387',9,'84028-9764','shipping_address'),(10,'Gudrun Cronin','+17178822708','ioconner@example.com','CV','Hawaii','Port Dashawnton','93762 Kunze Extension',10,'14808-7189','shipping_address'),(11,'Lesly Runolfsdottir','+14756358538','opouros@example.com','IO','Mississippi','Port Jackystad','984 Barrows Mill',11,'76471','shipping_address'),(12,'Allie Zieme','+13522633250','abby60@example.org','PT','Massachusetts','Casperview','5992 Rosenbaum Wall Apt. 559',12,'24736','shipping_address'),(13,'Lula Weimann','+18782792063','marks.marcus@example.net','KH','Kansas','West Madeline','1826 Hegmann Road',13,'39581','shipping_address'),(14,'Prof. Floy Reynolds','+18457303136','myron82@example.net','PA','Arizona','Bennettton','870 Harber Cove',14,'54742','shipping_address'),(15,'John Smith','+17707653429','john.smith@botble.com','PK','Alabama','Lake Lula','785 Retha Union Apt. 905',15,'99368-1578','shipping_address'),(16,'Allie Zieme','+13522633250','abby60@example.org','PT','Massachusetts','Casperview','5992 Rosenbaum Wall Apt. 559',16,'24736','shipping_address'),(17,'Allie Zieme','+13522633250','abby60@example.org','PT','Massachusetts','Casperview','5992 Rosenbaum Wall Apt. 559',17,'24736','shipping_address'),(18,'Prof. Floy Reynolds','+18457303136','myron82@example.net','PA','Arizona','Bennettton','870 Harber Cove',18,'54742','shipping_address'),(19,'Lesly Runolfsdottir','+14756358538','opouros@example.com','IO','Mississippi','Port Jackystad','984 Barrows Mill',19,'76471','shipping_address'),(20,'Lesly Runolfsdottir','+14756358538','opouros@example.com','IO','Mississippi','Port Jackystad','984 Barrows Mill',20,'76471','shipping_address');
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
INSERT INTO `ec_order_histories` VALUES (1,'create_order_from_seeder','Order is created from the checkout page',NULL,1,NULL,'2022-10-30 16:50:36','2022-10-30 16:50:36'),(2,'confirm_order','Order was verified by %user_name%',0,1,NULL,'2022-10-30 16:50:36','2022-10-30 16:50:36'),(3,'confirm_payment','Payment was confirmed (amount $703.50) by %user_name%',0,1,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(4,'create_shipment','Created shipment for order',0,1,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(5,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,1,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(6,'create_order_from_seeder','Order is created from the checkout page',NULL,2,NULL,'2022-10-31 08:50:36','2022-10-31 08:50:36'),(7,'confirm_order','Order was verified by %user_name%',0,2,NULL,'2022-10-31 08:50:36','2022-10-31 08:50:36'),(8,'confirm_payment','Payment was confirmed (amount $336.38) by %user_name%',0,2,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(9,'create_shipment','Created shipment for order',0,2,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(10,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,2,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(11,'create_order_from_seeder','Order is created from the checkout page',NULL,3,NULL,'2022-10-29 00:50:36','2022-10-29 00:50:36'),(12,'confirm_order','Order was verified by %user_name%',0,3,NULL,'2022-10-29 00:50:36','2022-10-29 00:50:36'),(13,'confirm_payment','Payment was confirmed (amount $680.40) by %user_name%',0,3,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(14,'create_shipment','Created shipment for order',0,3,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(15,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(16,'create_order_from_seeder','Order is created from the checkout page',NULL,4,NULL,'2022-11-01 16:50:36','2022-11-01 16:50:36'),(17,'confirm_order','Order was verified by %user_name%',0,4,NULL,'2022-11-01 16:50:36','2022-11-01 16:50:36'),(18,'confirm_payment','Payment was confirmed (amount $703.20) by %user_name%',0,4,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(19,'create_shipment','Created shipment for order',0,4,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(20,'create_order_from_seeder','Order is created from the checkout page',NULL,5,NULL,'2022-11-02 08:50:36','2022-11-02 08:50:36'),(21,'confirm_order','Order was verified by %user_name%',0,5,NULL,'2022-11-02 08:50:36','2022-11-02 08:50:36'),(22,'confirm_payment','Payment was confirmed (amount $223.65) by %user_name%',0,5,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(23,'create_shipment','Created shipment for order',0,5,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(24,'create_order_from_seeder','Order is created from the checkout page',NULL,6,NULL,'2022-11-05 12:50:36','2022-11-05 12:50:36'),(25,'confirm_order','Order was verified by %user_name%',0,6,NULL,'2022-11-05 12:50:36','2022-11-05 12:50:36'),(26,'confirm_payment','Payment was confirmed (amount $992.15) by %user_name%',0,6,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(27,'create_shipment','Created shipment for order',0,6,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(28,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,6,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(29,'create_order_from_seeder','Order is created from the checkout page',NULL,7,NULL,'2022-11-07 04:50:36','2022-11-07 04:50:36'),(30,'confirm_order','Order was verified by %user_name%',0,7,NULL,'2022-11-07 04:50:36','2022-11-07 04:50:36'),(31,'confirm_payment','Payment was confirmed (amount $769.80) by %user_name%',0,7,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(32,'create_shipment','Created shipment for order',0,7,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(33,'create_order_from_seeder','Order is created from the checkout page',NULL,8,NULL,'2022-11-10 20:50:36','2022-11-10 20:50:36'),(34,'confirm_order','Order was verified by %user_name%',0,8,NULL,'2022-11-10 20:50:36','2022-11-10 20:50:36'),(35,'create_shipment','Created shipment for order',0,8,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(36,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(37,'create_order_from_seeder','Order is created from the checkout page',NULL,9,NULL,'2022-11-05 00:50:36','2022-11-05 00:50:36'),(38,'confirm_order','Order was verified by %user_name%',0,9,NULL,'2022-11-05 00:50:36','2022-11-05 00:50:36'),(39,'confirm_payment','Payment was confirmed (amount $860.18) by %user_name%',0,9,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(40,'create_shipment','Created shipment for order',0,9,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(41,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,9,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(42,'create_order_from_seeder','Order is created from the checkout page',NULL,10,NULL,'2022-11-11 04:50:36','2022-11-11 04:50:36'),(43,'confirm_order','Order was verified by %user_name%',0,10,NULL,'2022-11-11 04:50:36','2022-11-11 04:50:36'),(44,'confirm_payment','Payment was confirmed (amount $609.20) by %user_name%',0,10,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(45,'create_shipment','Created shipment for order',0,10,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(46,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,10,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(47,'create_order_from_seeder','Order is created from the checkout page',NULL,11,NULL,'2022-11-11 08:50:36','2022-11-11 08:50:36'),(48,'confirm_order','Order was verified by %user_name%',0,11,NULL,'2022-11-11 08:50:36','2022-11-11 08:50:36'),(49,'confirm_payment','Payment was confirmed (amount $1,401.20) by %user_name%',0,11,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(50,'create_shipment','Created shipment for order',0,11,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(51,'create_order_from_seeder','Order is created from the checkout page',NULL,12,NULL,'2022-11-06 06:50:36','2022-11-06 06:50:36'),(52,'confirm_order','Order was verified by %user_name%',0,12,NULL,'2022-11-06 06:50:36','2022-11-06 06:50:36'),(53,'confirm_payment','Payment was confirmed (amount $548.10) by %user_name%',0,12,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(54,'create_shipment','Created shipment for order',0,12,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(55,'create_order_from_seeder','Order is created from the checkout page',NULL,13,NULL,'2022-11-06 08:50:36','2022-11-06 08:50:36'),(56,'confirm_order','Order was verified by %user_name%',0,13,NULL,'2022-11-06 08:50:36','2022-11-06 08:50:36'),(57,'confirm_payment','Payment was confirmed (amount $217.05) by %user_name%',0,13,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(58,'create_shipment','Created shipment for order',0,13,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(59,'create_order_from_seeder','Order is created from the checkout page',NULL,14,NULL,'2022-11-07 04:50:36','2022-11-07 04:50:36'),(60,'confirm_order','Order was verified by %user_name%',0,14,NULL,'2022-11-07 04:50:36','2022-11-07 04:50:36'),(61,'confirm_payment','Payment was confirmed (amount $367.00) by %user_name%',0,14,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(62,'create_shipment','Created shipment for order',0,14,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(63,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,14,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(64,'create_order_from_seeder','Order is created from the checkout page',NULL,15,NULL,'2022-11-09 00:50:36','2022-11-09 00:50:36'),(65,'confirm_order','Order was verified by %user_name%',0,15,NULL,'2022-11-09 00:50:36','2022-11-09 00:50:36'),(66,'confirm_payment','Payment was confirmed (amount $938.50) by %user_name%',0,15,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(67,'create_shipment','Created shipment for order',0,15,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(68,'create_order_from_seeder','Order is created from the checkout page',NULL,16,NULL,'2022-11-10 22:50:36','2022-11-10 22:50:36'),(69,'confirm_order','Order was verified by %user_name%',0,16,NULL,'2022-11-10 22:50:36','2022-11-10 22:50:36'),(70,'confirm_payment','Payment was confirmed (amount $706.30) by %user_name%',0,16,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(71,'create_shipment','Created shipment for order',0,16,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(72,'create_order_from_seeder','Order is created from the checkout page',NULL,17,NULL,'2022-11-09 16:50:36','2022-11-09 16:50:36'),(73,'confirm_order','Order was verified by %user_name%',0,17,NULL,'2022-11-09 16:50:36','2022-11-09 16:50:36'),(74,'confirm_payment','Payment was confirmed (amount $964.80) by %user_name%',0,17,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(75,'create_shipment','Created shipment for order',0,17,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(76,'create_order_from_seeder','Order is created from the checkout page',NULL,18,NULL,'2022-11-11 18:50:36','2022-11-11 18:50:36'),(77,'confirm_order','Order was verified by %user_name%',0,18,NULL,'2022-11-11 18:50:36','2022-11-11 18:50:36'),(78,'confirm_payment','Payment was confirmed (amount $698.20) by %user_name%',0,18,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(79,'create_shipment','Created shipment for order',0,18,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(80,'create_order_from_seeder','Order is created from the checkout page',NULL,19,NULL,'2022-11-11 20:50:36','2022-11-11 20:50:36'),(81,'confirm_order','Order was verified by %user_name%',0,19,NULL,'2022-11-11 20:50:36','2022-11-11 20:50:36'),(82,'confirm_payment','Payment was confirmed (amount $1,219.90) by %user_name%',0,19,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(83,'create_shipment','Created shipment for order',0,19,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(84,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(85,'create_order_from_seeder','Order is created from the checkout page',NULL,20,NULL,'2022-11-12 14:50:36','2022-11-12 14:50:36'),(86,'confirm_order','Order was verified by %user_name%',0,20,NULL,'2022-11-12 14:50:36','2022-11-12 14:50:36'),(87,'create_shipment','Created shipment for order',0,20,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(88,'update_status','Order confirmed by %user_name%',0,1,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(89,'update_status','Order confirmed by %user_name%',0,2,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(90,'update_status','Order confirmed by %user_name%',0,3,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(91,'update_status','Order confirmed by %user_name%',0,6,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(92,'update_status','Order confirmed by %user_name%',0,9,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(93,'update_status','Order confirmed by %user_name%',0,10,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(94,'update_status','Order confirmed by %user_name%',0,14,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(95,'update_status','Order confirmed by %user_name%',0,19,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` int unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
INSERT INTO `ec_order_product` VALUES (1,1,2,224.00,22.40,'[]',NULL,36,'Boxed - Bluetooth Headphone',NULL,1358.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(2,1,2,111.00,11.10,'[]',NULL,54,'Macbook Pro 13 inch',NULL,1774.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(3,2,1,111.00,11.10,'[]',NULL,82,'Historic Alarm Clock (Digital)',NULL,820.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(4,2,1,80.25,8.03,'[]',NULL,92,'Dual Camera 20MP (Digital)',NULL,543.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(5,2,2,60.00,6.00,'[]',NULL,104,'Samsung Smart TV',NULL,1072.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(6,3,1,79.00,7.90,'[]',NULL,38,'Chikie - Bluetooth Speaker',NULL,504.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(7,3,3,51.00,5.10,'[]',NULL,44,'Camera Samsung SS-24',NULL,1878.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(8,3,3,122.00,12.20,'[]',NULL,86,'Phillips Mouse',NULL,2190.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(9,3,1,52.00,5.20,'[]',NULL,99,'Audio Equipment (Digital)',NULL,758.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(10,4,2,111.00,11.10,'[]',NULL,56,'Macbook Pro 13 inch',NULL,1774.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(11,4,3,111.00,11.10,'[]',NULL,80,'Historic Alarm Clock (Digital)',NULL,2460.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(12,4,2,60.00,6.00,'[]',NULL,101,'Samsung Smart TV',NULL,1072.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(13,5,1,126.00,12.60,'[]',NULL,69,'Cool Smart Watches (Digital)',NULL,511.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(14,5,2,40.50,4.05,'[]',NULL,94,'Smart Watches',NULL,1396.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(15,6,1,224.00,22.40,'[]',NULL,36,'Boxed - Bluetooth Headphone',NULL,679.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(16,6,2,130.00,13.00,'[]',NULL,58,'Apple Keyboard (Digital)',NULL,1498.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(17,6,3,112.00,11.20,'[]',NULL,67,'Apple Airpods Serial 3',NULL,1719.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(18,6,3,40.50,4.05,'[]',NULL,94,'Smart Watches',NULL,2094.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(19,7,3,127.00,12.70,'[]',NULL,47,'Apple iPhone 13 Plus',NULL,2583.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(20,7,2,111.00,11.10,'[]',NULL,52,'Apple Watch Serial 7',NULL,1608.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(21,7,1,130.00,13.00,'[]',NULL,60,'Apple Keyboard (Digital)',NULL,749.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(22,8,3,79.00,7.90,'[]',NULL,37,'Chikie - Bluetooth Speaker',NULL,1512.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(23,8,3,40.00,4.00,'[]',NULL,40,'Camera Hikvision HK-35VS8 (Digital)',NULL,2466.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(24,8,3,127.00,12.70,'[]',NULL,46,'Apple iPhone 13 Plus',NULL,2583.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(25,9,1,243.00,24.30,'[]',NULL,33,'Smart Home Speaker (Digital)',NULL,691.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(26,9,3,111.00,11.10,'[]',NULL,82,'Historic Alarm Clock (Digital)',NULL,2460.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(27,9,3,80.25,8.03,'[]',NULL,92,'Dual Camera 20MP (Digital)',NULL,1629.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(28,10,3,111.00,11.10,'[]',NULL,56,'Macbook Pro 13 inch',NULL,2661.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(29,10,1,130.00,13.00,'[]',NULL,59,'Apple Keyboard (Digital)',NULL,749.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(30,10,1,111.00,11.10,'[]',NULL,81,'Historic Alarm Clock (Digital)',NULL,820.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(31,11,3,224.00,22.40,'[]',NULL,36,'Boxed - Bluetooth Headphone',NULL,2037.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(32,11,3,111.00,11.10,'[]',NULL,52,'Apple Watch Serial 7',NULL,2412.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(33,11,3,117.00,11.70,'[]',NULL,78,'Leather Watch Band Serial 3',NULL,2175.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(34,12,2,79.00,7.90,'[]',NULL,38,'Chikie - Bluetooth Speaker',NULL,1008.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(35,12,2,122.00,12.20,'[]',NULL,86,'Phillips Mouse',NULL,1460.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(36,12,2,60.00,6.00,'[]',NULL,105,'Samsung Smart TV',NULL,1072.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(37,13,1,120.00,12.00,'[]',NULL,73,'Black Smart Watches',NULL,696.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(38,13,2,40.50,4.05,'[]',NULL,94,'Smart Watches',NULL,1396.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(39,14,3,79.00,7.90,'[]',NULL,37,'Chikie - Bluetooth Speaker',NULL,1512.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(40,14,1,111.00,11.10,'[]',NULL,54,'Macbook Pro 13 inch',NULL,887.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(41,15,1,112.00,11.20,'[]',NULL,45,'Leather Watch Band',NULL,793.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(42,15,3,126.00,12.60,'[]',NULL,71,'Cool Smart Watches (Digital)',NULL,1533.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(43,15,3,117.00,11.70,'[]',NULL,76,'Leather Watch Band Serial 3',NULL,2175.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(44,15,3,20.00,2.00,'[]',NULL,95,'Beat Headphone',NULL,2271.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(45,16,2,111.00,11.10,'[]',NULL,49,'Macbook Pro 2015 (Digital)',NULL,1196.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(46,16,3,112.00,11.20,'[]',NULL,87,'Gaming Keyboard',NULL,2055.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(47,16,2,60.00,6.00,'[]',NULL,102,'Samsung Smart TV',NULL,1072.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(48,17,2,329.00,32.90,'[]',NULL,34,'Headphone Ultra Bass',NULL,1688.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(49,17,1,127.00,12.70,'[]',NULL,47,'Apple iPhone 13 Plus',NULL,861.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(50,17,1,122.00,12.20,'[]',NULL,86,'Phillips Mouse',NULL,730.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(51,18,2,79.00,7.90,'[]',NULL,39,'Chikie - Bluetooth Speaker',NULL,1008.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(52,18,3,127.00,12.70,'[]',NULL,46,'Apple iPhone 13 Plus',NULL,2583.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(53,18,1,126.00,12.60,'[]',NULL,69,'Cool Smart Watches (Digital)',NULL,511.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(54,19,2,329.00,32.90,'[]',NULL,35,'Headphone Ultra Bass',NULL,1688.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(55,19,3,130.00,13.00,'[]',NULL,57,'Apple Keyboard (Digital)',NULL,2247.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(56,19,2,60.00,6.00,'[]',NULL,103,'Samsung Smart TV',NULL,1072.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(57,20,2,126.00,12.60,'[]',NULL,71,'Cool Smart Watches (Digital)',NULL,1022.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(58,20,3,117.00,11.70,'[]',NULL,75,'Leather Watch Band Serial 3',NULL,2175.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0),(59,20,1,112.00,11.20,'[]',NULL,87,'Gaming Keyboard',NULL,685.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','physical',0);
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` int unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` int unsigned NOT NULL COMMENT 'Order product id',
  `product_id` int unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int unsigned NOT NULL COMMENT 'Order ID',
  `store_id` int unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` int unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
INSERT INTO `ec_orders` VALUES (1,'#10000001',11,'1','default','completed',703.50,33.50,0.00,NULL,NULL,0.00,670.00,1,NULL,1,'2022-11-13 00:50:36','194zIwSmvURttv8lJjeHwQts87zCU',1,'2022-10-30 16:50:36','2022-11-13 00:50:36'),(2,'#10000002',6,'1','default','completed',336.38,25.13,0.00,NULL,NULL,0.00,311.25,1,NULL,1,'2022-11-13 00:50:36','boLbTMycFDVS75aZlp42UUFLLdsDg',2,'2022-10-31 08:50:36','2022-11-13 00:50:36'),(3,'#10000003',8,'1','default','completed',680.40,30.40,0.00,NULL,NULL,0.00,650.00,1,NULL,1,'2022-11-13 00:50:36','BctLi3qmEhGThZZsf6c5nKrPXy8aU',3,'2022-10-29 00:50:36','2022-11-13 00:50:36'),(4,'#10000004',3,'1','default','pending',703.20,28.20,0.00,NULL,NULL,0.00,675.00,1,NULL,1,NULL,'wPJWvcc9c1KxGOnLsKUQ3nXbwGPjR',4,'2022-11-01 16:50:36','2022-11-13 00:50:36'),(5,'#10000005',11,'1','default','pending',223.65,16.65,0.00,NULL,NULL,0.00,207.00,1,NULL,1,NULL,'Kd3kPhL6Y1Fq0WvsR2EZUgPAXgtux',5,'2022-11-02 08:50:36','2022-11-13 00:50:36'),(6,'#10000006',7,'1','default','completed',992.15,50.65,0.00,NULL,NULL,0.00,941.50,1,NULL,1,'2022-11-13 00:50:36','2eP3Xnow8ArTkcYAhvWxzPvNE9W0u',6,'2022-11-05 12:50:36','2022-11-13 00:50:36'),(7,'#10000007',9,'1','default','pending',769.80,36.80,0.00,NULL,NULL,0.00,733.00,1,NULL,1,NULL,'DP8gLAwsX69Rmdhd8MpsEmicJ9epE',7,'2022-11-07 04:50:36','2022-11-13 00:50:36'),(8,'#10000008',9,'1','default','completed',762.60,24.60,0.00,NULL,NULL,0.00,738.00,1,NULL,1,'2022-11-13 00:50:36','nOxdrY0UNHqsFbJmMPGN3GSo5FrDS',8,'2022-11-10 20:50:36','2022-11-13 00:50:36'),(9,'#10000009',11,'1','default','completed',860.18,43.43,0.00,NULL,NULL,0.00,816.75,1,NULL,1,'2022-11-13 00:50:36','Rx48CNgPKBPhUYBcnwbHJfm42uSEQ',9,'2022-11-05 00:50:36','2022-11-13 00:50:36'),(10,'#10000010',8,'1','default','completed',609.20,35.20,0.00,NULL,NULL,0.00,574.00,1,NULL,1,'2022-11-13 00:50:36','ROKfXqFKNcGP3uhC6LNvf75q8nIsg',10,'2022-11-11 04:50:36','2022-11-13 00:50:36'),(11,'#10000011',6,'1','default','pending',1401.20,45.20,0.00,NULL,NULL,0.00,1356.00,1,NULL,1,NULL,'xa41FueCJoKUCqTGLVaKXChkH3YMn',11,'2022-11-11 08:50:36','2022-11-13 00:50:36'),(12,'#10000012',4,'1','default','pending',548.10,26.10,0.00,NULL,NULL,0.00,522.00,1,NULL,1,NULL,'frGClvmv52cK1PYrxbmxCaY2yOLAN',12,'2022-11-06 06:50:36','2022-11-13 00:50:36'),(13,'#10000013',10,'1','default','pending',217.05,16.05,0.00,NULL,NULL,0.00,201.00,1,NULL,1,NULL,'FCm30BeLEeYfysWRZExhm0rhG7dKZ',13,'2022-11-06 08:50:36','2022-11-13 00:50:36'),(14,'#10000014',9,'1','default','completed',367.00,19.00,0.00,NULL,NULL,0.00,348.00,1,NULL,1,'2022-11-13 00:50:36','8nq9GdKVXSPF9tyXcsbg5LKj2nag2',14,'2022-11-07 04:50:36','2022-11-13 00:50:36'),(15,'#10000015',1,'1','default','pending',938.50,37.50,0.00,NULL,NULL,0.00,901.00,1,NULL,1,NULL,'Yo5PDn6Ed2cvEopiGhihXlwnPsaKo',15,'2022-11-09 00:50:36','2022-11-13 00:50:36'),(16,'#10000016',4,'1','default','pending',706.30,28.30,0.00,NULL,NULL,0.00,678.00,1,NULL,1,NULL,'kfL0KKPBpdKSBZj7hzePN1uJrj8ef',16,'2022-11-10 22:50:36','2022-11-13 00:50:36'),(17,'#10000017',4,'1','default','pending',964.80,57.80,0.00,NULL,NULL,0.00,907.00,1,NULL,1,NULL,'HG5Xy4vj6ngU7JI5gJpLjgX3kYHv9',17,'2022-11-09 16:50:36','2022-11-13 00:50:36'),(18,'#10000018',9,'1','default','pending',698.20,33.20,0.00,NULL,NULL,0.00,665.00,1,NULL,1,NULL,'bIhJpaq7DFcOZkWuRZAKYkU7EP5tM',18,'2022-11-11 18:50:36','2022-11-13 00:50:36'),(19,'#10000019',6,'1','default','completed',1219.90,51.90,0.00,NULL,NULL,0.00,1168.00,1,NULL,1,'2022-11-13 00:50:36','r90Ur6pgO3sZFWb0ZJ5kvSJ3PVvfK',19,'2022-11-11 20:50:36','2022-11-13 00:50:36'),(20,'#10000020',6,'1','default','pending',750.50,35.50,0.00,NULL,NULL,0.00,715.00,1,NULL,1,NULL,'swYSuxRH1KJInUrc4GexgQ8IrvTgk',20,'2022-11-12 14:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2022-11-13 00:50:31','2022-11-13 00:50:31',1),(2,'Size','size','text',1,1,1,'published',1,'2022-11-13 00:50:31','2022-11-13 00:50:31',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets_translations` VALUES ('vi',1,'Màu sắc'),('vi',2,'Kích thước');
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_attributes_attribute_set_id_status_index` (`attribute_set_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(2,1,'Blue','blue','#333333',NULL,0,2,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(3,1,'Red','red','#DA323F',NULL,0,3,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(4,1,'Black','back','#2F366C',NULL,0,4,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(5,1,'Brown','brown','#87554B',NULL,0,5,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(6,2,'S','s',NULL,NULL,1,1,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(7,2,'M','m',NULL,NULL,0,2,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(8,2,'L','l',NULL,NULL,0,3,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(9,2,'XL','xl',NULL,NULL,0,4,'published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(10,2,'XXL','xxl',NULL,NULL,0,5,'published','2022-11-13 00:50:31','2022-11-13 00:50:31');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` int NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
INSERT INTO `ec_product_attributes_translations` VALUES ('vi',1,'Xanh lá cây'),('vi',2,'Xanh da trời'),('vi',3,'Đỏ'),('vi',4,'Đen'),('vi',5,'Nâu'),('vi',6,'S'),('vi',7,'M'),('vi',8,'L'),('vi',9,'XL'),('vi',10,'XXL');
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Television',0,NULL,'published',0,'product-categories/p-1.png',1,'2022-11-13 00:50:30','2022-11-13 00:50:30'),(2,'Home Audio & Theaters',1,NULL,'published',0,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(3,'TV & Videos',1,NULL,'published',1,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(4,'Camera, Photos & Videos',1,NULL,'published',2,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(5,'Cellphones & Accessories',1,NULL,'published',3,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(6,'Headphones',1,NULL,'published',4,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(7,'Videos games',1,NULL,'published',5,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(8,'Wireless Speakers',1,NULL,'published',6,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(9,'Office Electronic',1,NULL,'published',7,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(10,'Mobile',0,NULL,'published',1,'product-categories/p-2.png',1,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(11,'Digital Cables',10,NULL,'published',0,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(12,'Audio & Video Cables',10,NULL,'published',1,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(13,'Batteries',10,NULL,'published',2,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(14,'Headphone',0,NULL,'published',2,'product-categories/p-3.png',1,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(15,'Computer & Tablets',14,NULL,'published',0,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(16,'Laptop',14,NULL,'published',1,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(17,'Monitors',14,NULL,'published',2,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(18,'Computer Components',14,NULL,'published',3,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(19,'Watches',0,NULL,'published',3,'product-categories/p-4.png',1,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(20,'Drive & Storages',19,NULL,'published',0,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(21,'Gaming Laptop',19,NULL,'published',1,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(22,'Security & Protection',19,NULL,'published',2,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(23,'Accessories',19,NULL,'published',3,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(24,'Game',0,NULL,'published',4,'product-categories/p-5.png',1,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(25,'Camera',0,NULL,'published',5,'product-categories/p-6.png',1,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(26,'Audio',0,NULL,'published',6,'product-categories/p-7.png',1,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(27,'Mobile & Tablet',0,NULL,'published',7,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(28,'Accessories',0,NULL,'published',8,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(29,'Home Audio & Theater',0,NULL,'published',9,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(30,'Tv & Smart Box',0,NULL,'published',10,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(31,'Printer',0,NULL,'published',11,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(32,'Computer',0,NULL,'published',12,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(33,'Fax Machine',0,NULL,'published',13,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31'),(34,'Mouse',0,NULL,'published',14,NULL,0,'2022-11-13 00:50:31','2022-11-13 00:50:31');
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
INSERT INTO `ec_product_categories_translations` VALUES ('vi',1,'Tivi',NULL),('vi',2,'Home Audio & Theaters',NULL),('vi',3,'TV & Videos',NULL),('vi',4,'Camera, Photos & Videos',NULL),('vi',5,'Cellphones & Accessories',NULL),('vi',6,'Headphones',NULL),('vi',7,'Videos games',NULL),('vi',8,'Wireless Speakers',NULL),('vi',9,'Office Electronic',NULL),('vi',10,'Di động',NULL),('vi',11,'Digital Cables',NULL),('vi',12,'Audio & Video Cables',NULL),('vi',13,'Batteries',NULL),('vi',14,'Tai nghe',NULL),('vi',15,'Computer & Tablets',NULL),('vi',16,'Laptop',NULL),('vi',17,'Monitors',NULL),('vi',18,'Computer Components',NULL),('vi',19,'Đồng hồ',NULL),('vi',20,'Drive & Storages',NULL),('vi',21,'Gaming Laptop',NULL),('vi',22,'Security & Protection',NULL),('vi',23,'Accessories',NULL),('vi',24,'Trò chơi',NULL),('vi',25,'Máy ảnh',NULL),('vi',26,'Âm thanh',NULL),('vi',27,'Di động & Máy tính bảng',NULL),('vi',28,'Phụ kiện',NULL),('vi',29,'Âm thanh & hình ảnh',NULL),('vi',30,'Tv & Smart Box',NULL),('vi',31,'Máy in',NULL),('vi',32,'Máy tính',NULL),('vi',33,'Máy Fax',NULL),('vi',34,'Chuột máy tính',NULL);
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,3,1),(2,10,2),(3,1,3),(4,5,4),(5,13,5),(6,6,6),(7,6,7),(8,14,8),(9,3,9),(10,11,10),(11,6,11),(12,4,12),(13,4,13),(14,14,14),(15,2,15),(16,6,16),(17,9,17),(18,7,18),(19,8,19),(20,6,20),(21,9,21),(22,2,22),(23,10,23),(24,3,24),(25,1,25),(26,4,26),(27,10,27),(28,4,28),(29,3,29),(30,1,30),(31,10,31);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_collection_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,1,1),(2,1,2),(3,3,3),(4,2,4),(5,3,5),(6,3,6),(7,1,7),(8,2,8),(9,2,9),(10,3,10),(11,3,11),(12,2,12),(13,3,13),(14,3,14),(15,2,15),(16,2,16),(17,3,17),(18,2,18),(19,2,19),(20,3,20),(21,3,21),(22,2,22),(23,3,23),(24,3,24),(25,1,25),(26,1,26),(27,1,27),(28,3,28),(29,1,29),(30,1,30),(31,1,31);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2022-11-13 00:50:31','2022-11-13 00:50:31',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2022-11-13 00:50:31','2022-11-13 00:50:31',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2022-11-13 00:50:31','2022-11-13 00:50:31',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
INSERT INTO `ec_product_collections_translations` VALUES ('vi',1,'Hàng mới về',NULL),('vi',2,'Bán chạy nhất',NULL),('vi',3,'Khuyến mãi đặc biệt',NULL);
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,1,28),(2,1,23),(3,1,3),(4,1,14),(5,2,27),(6,2,22),(7,2,10),(8,2,4),(9,3,28),(10,3,24),(11,3,20),(12,4,12),(13,4,17),(14,4,18),(15,4,9),(16,5,7),(17,5,20),(18,5,6),(19,5,9),(20,6,3),(21,6,14),(22,6,28),(23,6,1),(24,7,2),(25,7,31),(26,7,5),(27,8,12),(28,8,26),(29,8,3),(30,8,28),(31,9,6),(32,9,7),(33,9,1),(34,9,31),(35,10,23),(36,10,6),(37,10,30),(38,10,22),(39,11,18),(40,11,22),(41,11,30),(42,11,14),(43,12,20),(44,12,31),(45,12,26),(46,12,6),(47,13,8),(48,13,2),(49,13,23),(50,13,16),(51,14,16),(52,14,28),(53,14,2),(54,14,18),(55,15,31),(56,15,9),(57,15,1),(58,15,3),(59,16,5),(60,16,12),(61,16,3),(62,17,22),(63,17,13),(64,17,3),(65,17,31),(66,18,7),(67,18,20),(68,18,14),(69,18,5),(70,19,2),(71,19,27),(72,19,24),(73,19,23),(74,20,19),(75,20,24),(76,20,16),(77,20,17),(78,21,3),(79,21,20),(80,21,23),(81,21,30),(82,22,26),(83,22,10),(84,22,13),(85,22,19),(86,23,8),(87,23,25),(88,23,15),(89,23,20),(90,24,7),(91,24,31),(92,24,28),(93,24,15),(94,25,15),(95,25,10),(96,25,6),(97,25,26),(98,26,9),(99,26,31),(100,26,5),(101,27,18),(102,27,10),(103,27,5),(104,27,3),(105,28,10),(106,28,29),(107,28,18),(108,28,20),(109,29,17),(110,29,13),(111,29,9),(112,29,12),(113,30,21),(114,30,31),(115,30,23),(116,30,8),(117,31,23),(118,31,3),(119,31,6),(120,31,27);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
INSERT INTO `ec_product_files` VALUES (1,32,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(2,32,'product-files/1-1.jpg','{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(3,32,'product-files/1-2.jpg','{\"filename\":\"1-2.jpg\",\"url\":\"product-files\\/1-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1-2\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(4,32,'product-files/1-3.jpg','{\"filename\":\"1-3.jpg\",\"url\":\"product-files\\/1-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1-3\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(5,33,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(6,33,'product-files/1-1.jpg','{\"filename\":\"1-1.jpg\",\"url\":\"product-files\\/1-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(7,33,'product-files/1-2.jpg','{\"filename\":\"1-2.jpg\",\"url\":\"product-files\\/1-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1-2\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(8,33,'product-files/1-3.jpg','{\"filename\":\"1-3.jpg\",\"url\":\"product-files\\/1-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:35\",\"name\":\"1-3\",\"extension\":\"jpg\"}','2022-11-13 00:50:35','2022-11-13 00:50:35'),(9,40,'product-files/5.jpg','{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(10,40,'product-files/5-1.jpg','{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(11,40,'product-files/5-2.jpg','{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5-2\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(12,40,'product-files/5-3.jpg','{\"filename\":\"5-3.jpg\",\"url\":\"product-files\\/5-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5-3\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(13,41,'product-files/5.jpg','{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(14,41,'product-files/5-1.jpg','{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(15,41,'product-files/5-2.jpg','{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5-2\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(16,41,'product-files/5-3.jpg','{\"filename\":\"5-3.jpg\",\"url\":\"product-files\\/5-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"5-3\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(17,48,'product-files/9.jpg','{\"filename\":\"9.jpg\",\"url\":\"product-files\\/9.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"9\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(18,48,'product-files/9-1.jpg','{\"filename\":\"9-1.jpg\",\"url\":\"product-files\\/9-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"9-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(19,49,'product-files/9.jpg','{\"filename\":\"9.jpg\",\"url\":\"product-files\\/9.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"9\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(20,49,'product-files/9-1.jpg','{\"filename\":\"9-1.jpg\",\"url\":\"product-files\\/9-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"9-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(21,57,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(22,57,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(23,58,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(24,58,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(25,59,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(26,59,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(27,60,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(28,60,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(29,68,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"17\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(30,69,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"17\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(31,70,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"17\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(32,71,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"17\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(33,72,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"17\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(34,80,'product-files/21.jpg','{\"filename\":\"21.jpg\",\"url\":\"product-files\\/21.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"21\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(35,80,'product-files/21-1.jpg','{\"filename\":\"21-1.jpg\",\"url\":\"product-files\\/21-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"21-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(36,81,'product-files/21.jpg','{\"filename\":\"21.jpg\",\"url\":\"product-files\\/21.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"21\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(37,81,'product-files/21-1.jpg','{\"filename\":\"21-1.jpg\",\"url\":\"product-files\\/21-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"21-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(38,82,'product-files/21.jpg','{\"filename\":\"21.jpg\",\"url\":\"product-files\\/21.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"21\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(39,82,'product-files/21-1.jpg','{\"filename\":\"21-1.jpg\",\"url\":\"product-files\\/21-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"21-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(40,91,'product-files/25.jpg','{\"filename\":\"25.jpg\",\"url\":\"product-files\\/25.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"25\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(41,91,'product-files/25-1.jpg','{\"filename\":\"25-1.jpg\",\"url\":\"product-files\\/25-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"25-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(42,92,'product-files/25.jpg','{\"filename\":\"25.jpg\",\"url\":\"product-files\\/25.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"25\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(43,92,'product-files/25-1.jpg','{\"filename\":\"25-1.jpg\",\"url\":\"product-files\\/25-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"25-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(44,98,'product-files/29.jpg','{\"filename\":\"29.jpg\",\"url\":\"product-files\\/29.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"29\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(45,98,'product-files/29-1.jpg','{\"filename\":\"29-1.jpg\",\"url\":\"product-files\\/29-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"29-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(46,99,'product-files/29.jpg','{\"filename\":\"29.jpg\",\"url\":\"product-files\\/29.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"29\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36'),(47,99,'product-files/29-1.jpg','{\"filename\":\"29-1.jpg\",\"url\":\"product-files\\/29-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":2165,\"modified\":\"2022-11-13 07:50:36\",\"name\":\"29-1\",\"extension\":\"jpg\"}','2022-11-13 00:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (1,9),(1,12),(1,15),(1,30),(2,3),(2,6),(2,18),(2,24),(2,27),(3,21);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#ec2434','published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(2,'New','#00c9a7','published','2022-11-13 00:50:31','2022-11-13 00:50:31'),(3,'Sale','#fe9931','published','2022-11-13 00:50:31','2022-11-13 00:50:31');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
INSERT INTO `ec_product_labels_translations` VALUES ('vi',1,'Nổi bật',NULL),('vi',2,'Mới',NULL),('vi',3,'Giảm giá',NULL);
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` int unsigned NOT NULL,
  `tag_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,2),(1,3),(1,5),(2,2),(2,3),(2,6),(3,2),(3,3),(3,4),(4,1),(4,3),(4,6),(5,1),(5,2),(6,3),(6,4),(7,1),(7,2),(7,3),(8,1),(8,4),(8,5),(9,1),(9,2),(9,5),(10,2),(10,4),(10,5),(11,2),(11,5),(12,1),(12,5),(12,6),(13,2),(13,4),(13,6),(14,4),(14,5),(14,6),(15,2),(15,6),(16,1),(16,2),(16,6),(17,3),(17,4),(17,5),(18,3),(18,4),(18,5),(19,3),(19,5),(20,2),(20,5),(20,6),(21,3),(21,5),(22,1),(22,2),(22,5),(23,1),(23,2),(24,3),(24,5),(24,6),(25,1),(25,6),(26,2),(26,6),(27,3),(27,4),(28,2),(28,4),(28,6),(29,2),(29,5),(29,6),(30,3),(30,5),(31,1);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Electronic',NULL,'published','2022-11-13 00:50:36','2022-11-13 00:50:36'),(2,'Mobile',NULL,'published','2022-11-13 00:50:36','2022-11-13 00:50:36'),(3,'Iphone',NULL,'published','2022-11-13 00:50:36','2022-11-13 00:50:36'),(4,'Printer',NULL,'published','2022-11-13 00:50:36','2022-11-13 00:50:36'),(5,'Office',NULL,'published','2022-11-13 00:50:36','2022-11-13 00:50:36'),(6,'IT',NULL,'published','2022-11-13 00:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_product_id` int unsigned NOT NULL,
  `to_product_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int unsigned NOT NULL,
  `variation_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_variation_items_attribute_id_variation_id_index` (`attribute_id`,`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (15,1,8),(17,1,9),(19,1,10),(23,1,12),(29,1,15),(43,1,22),(45,1,23),(47,1,24),(65,1,33),(71,1,36),(81,1,41),(83,1,42),(95,1,48),(105,1,53),(129,1,65),(137,1,69),(25,2,13),(53,2,27),(55,2,28),(61,2,31),(63,2,32),(79,2,40),(97,2,49),(109,2,55),(121,2,61),(125,2,63),(133,2,67),(139,2,70),(7,3,4),(9,3,5),(27,3,14),(49,3,25),(59,3,30),(85,3,43),(89,3,45),(91,3,46),(93,3,47),(113,3,57),(119,3,60),(123,3,62),(141,3,71),(145,3,73),(1,4,1),(11,4,6),(13,4,7),(21,4,11),(35,4,18),(39,4,20),(41,4,21),(67,4,34),(75,4,38),(99,4,50),(103,4,52),(111,4,56),(131,4,66),(3,5,2),(5,5,3),(31,5,16),(33,5,17),(37,5,19),(51,5,26),(57,5,29),(69,5,35),(73,5,37),(77,5,39),(87,5,44),(101,5,51),(107,5,54),(115,5,58),(117,5,59),(127,5,64),(135,5,68),(143,5,72),(147,5,74),(4,6,2),(10,6,5),(20,6,10),(26,6,13),(28,6,14),(32,6,16),(46,6,23),(58,6,29),(72,6,36),(118,6,59),(126,6,63),(138,6,69),(144,6,72),(146,6,73),(148,6,74),(12,7,6),(16,7,8),(18,7,9),(40,7,20),(42,7,21),(44,7,22),(52,7,26),(64,7,32),(68,7,34),(78,7,39),(88,7,44),(90,7,45),(96,7,48),(100,7,50),(104,7,52),(106,7,53),(114,7,57),(134,7,67),(136,7,68),(142,7,71),(14,8,7),(22,8,11),(24,8,12),(30,8,15),(36,8,18),(48,8,24),(50,8,25),(56,8,28),(66,8,33),(74,8,37),(92,8,46),(102,8,51),(108,8,54),(122,8,61),(128,8,64),(140,8,70),(60,9,30),(70,9,35),(76,9,38),(84,9,42),(86,9,43),(112,9,56),(116,9,58),(120,9,60),(132,9,66),(2,10,1),(6,10,3),(8,10,4),(34,10,17),(38,10,19),(54,10,27),(62,10,31),(80,10,40),(82,10,41),(94,10,47),(98,10,49),(110,10,55),(124,10,62),(130,10,65);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `configurable_product_id` int unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_product_variations_product_id_configurable_product_id_index` (`product_id`,`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,32,1,1),(2,33,1,0),(3,34,2,1),(4,35,2,0),(5,36,3,1),(6,37,4,1),(7,38,4,0),(8,39,4,0),(9,40,5,1),(10,41,5,0),(11,42,6,1),(12,43,6,0),(13,44,6,0),(14,45,7,1),(15,46,8,1),(16,47,8,0),(17,48,9,1),(18,49,9,0),(19,50,10,1),(20,51,10,0),(21,52,11,1),(22,53,11,0),(23,54,12,1),(24,55,12,0),(25,56,12,0),(26,57,13,1),(27,58,13,0),(28,59,13,0),(29,60,13,0),(30,61,14,1),(31,62,14,0),(32,63,14,0),(33,64,15,1),(34,65,16,1),(35,66,16,0),(36,67,16,0),(37,68,17,1),(38,69,17,0),(39,70,17,0),(40,71,17,0),(41,72,17,0),(42,73,18,1),(43,74,18,0),(44,75,19,1),(45,76,19,0),(46,77,19,0),(47,78,19,0),(48,79,20,1),(49,80,21,1),(50,81,21,0),(51,82,21,0),(52,83,22,1),(53,84,22,0),(54,85,22,0),(55,86,23,1),(56,87,24,1),(57,88,24,0),(58,89,24,0),(59,90,24,0),(60,91,25,1),(61,92,25,0),(62,93,26,1),(63,94,26,0),(64,95,27,1),(65,96,28,1),(66,97,28,0),(67,98,29,1),(68,99,29,0),(69,100,30,1),(70,101,31,1),(71,102,31,0),(72,103,31,0),(73,104,31,0),(74,105,31,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,1,0),(2,2,1,0),(3,1,2,0),(4,2,2,0),(5,1,3,0),(6,2,3,0),(7,1,4,0),(8,2,4,0),(9,1,5,0),(10,2,5,0),(11,1,6,0),(12,2,6,0),(13,1,7,0),(14,2,7,0),(15,1,8,0),(16,2,8,0),(17,1,9,0),(18,2,9,0),(19,1,10,0),(20,2,10,0),(21,1,11,0),(22,2,11,0),(23,1,12,0),(24,2,12,0),(25,1,13,0),(26,2,13,0),(27,1,14,0),(28,2,14,0),(29,1,15,0),(30,2,15,0),(31,1,16,0),(32,2,16,0),(33,1,17,0),(34,2,17,0),(35,1,18,0),(36,2,18,0),(37,1,19,0),(38,2,19,0),(39,1,20,0),(40,2,20,0),(41,1,21,0),(42,2,21,0),(43,1,22,0),(44,2,22,0),(45,1,23,0),(46,2,23,0),(47,1,24,0),(48,2,24,0),(49,1,25,0),(50,2,25,0),(51,1,26,0),(52,2,26,0),(53,1,27,0),(54,2,27,0),(55,1,28,0),(56,2,28,0),(57,1,29,0),(58,2,29,0),(59,1,30,0),(60,2,30,0),(61,1,31,0),(62,2,31,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `brand_id` int unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `tax_id` int unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_by_id` int DEFAULT '0',
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `ec_products_sale_type_index` (`sale_type`),
  KEY `ec_products_start_date_index` (`start_date`),
  KEY `ec_products_end_date_index` (`end_date`),
  KEY `ec_products_sale_price_index` (`sale_price`),
  KEY `ec_products_is_variation_index` (`is_variation`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Smart Home Speaker (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1.jpg\",\"products\\/1-1.jpg\",\"products\\/1-2.jpg\",\"products\\/1-3.jpg\"]','HS-173-A0',0,19,0,1,1,2,0,0,243,NULL,NULL,NULL,12.00,19.00,19.00,691.00,1,29348,'2022-11-13 00:50:35','2022-11-13 00:50:35','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(2,'Headphone Ultra Bass','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]','HS-162-A0',0,11,0,1,1,6,0,0,329,NULL,NULL,NULL,19.00,14.00,11.00,844.00,1,184403,'2022-11-13 00:50:35','2022-11-13 00:50:35','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(3,'Boxed - Bluetooth Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3.jpg\",\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\"]','HS-118-A0',0,19,0,1,1,6,0,0,224,NULL,NULL,NULL,16.00,15.00,17.00,679.00,1,11784,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(4,'Chikie - Bluetooth Speaker','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\"]','HS-198-A0',0,10,0,1,1,4,0,0,79,67.94,NULL,NULL,13.00,20.00,17.00,504.00,1,123910,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(5,'Camera Hikvision HK-35VS8 (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\"]','HS-185-A0',0,17,0,1,1,2,0,0,40,NULL,NULL,NULL,19.00,10.00,12.00,822.00,1,114641,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(6,'Camera Samsung SS-24','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6.jpg\",\"products\\/6-1.jpg\"]','HS-144-A0',0,12,0,1,1,7,0,0,51,NULL,NULL,NULL,18.00,20.00,10.00,626.00,1,25365,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(7,'Leather Watch Band','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7.jpg\",\"products\\/7-1.jpg\"]','HS-137-A0',0,19,0,1,1,3,0,0,112,NULL,NULL,NULL,17.00,15.00,17.00,793.00,1,33798,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(8,'Apple iPhone 13 Plus','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8.jpg\",\"products\\/8-1.jpg\"]','HS-152-A0',0,15,0,1,1,2,0,0,127,101.6,NULL,NULL,12.00,19.00,13.00,861.00,1,20510,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(9,'Macbook Pro 2015 (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/9.jpg\",\"products\\/9-1.jpg\"]','HS-146-A0',0,13,0,1,1,2,0,0,111,NULL,NULL,NULL,17.00,17.00,14.00,598.00,1,41267,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(10,'Macbook Air 12 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/10.jpg\",\"products\\/10-1.jpg\"]','HS-101-A0',0,10,0,1,1,1,0,0,449,NULL,NULL,NULL,16.00,19.00,20.00,633.00,1,149871,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(11,'Apple Watch Serial 7','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/11.jpg\",\"products\\/11-1.jpg\"]','HS-106-A0',0,13,0,1,1,3,0,0,111,NULL,NULL,NULL,19.00,17.00,16.00,804.00,1,153156,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(12,'Macbook Pro 13 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/12.jpg\",\"products\\/12-1.jpg\"]','HS-123-A0',0,12,0,1,1,5,0,0,111,89.91,NULL,NULL,16.00,20.00,18.00,887.00,1,146622,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(13,'Apple Keyboard (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]','HS-160-A0',0,19,0,1,1,6,0,0,130,NULL,NULL,NULL,16.00,11.00,16.00,749.00,1,129651,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(14,'MacSafe 80W','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/14.jpg\",\"products\\/14-1.jpg\"]','HS-190-A0',0,18,0,1,1,4,0,0,123,NULL,NULL,NULL,14.00,19.00,17.00,829.00,1,23657,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(15,'Hand playstation','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]','HS-125-A0',0,17,0,1,1,1,0,0,123,NULL,NULL,NULL,13.00,15.00,11.00,884.00,1,56869,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(16,'Apple Airpods Serial 3','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/16.jpg\"]','HS-107-A0',0,19,0,1,1,4,0,0,112,91.84,NULL,NULL,17.00,13.00,19.00,573.00,1,159704,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(17,'Cool Smart Watches (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/17.jpg\"]','HS-196-A0',0,10,0,1,1,1,0,0,126,NULL,NULL,NULL,10.00,13.00,18.00,511.00,1,95850,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(18,'Black Smart Watches','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/18.jpg\",\"products\\/18-1.jpg\",\"products\\/18-2.jpg\"]','HS-191-A0',0,10,0,1,1,3,0,0,120,NULL,NULL,NULL,18.00,20.00,20.00,696.00,1,21665,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(19,'Leather Watch Band Serial 3','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/19.jpg\",\"products\\/19-1.jpg\"]','HS-167-A0',0,11,0,1,1,6,0,0,117,NULL,NULL,NULL,15.00,16.00,18.00,725.00,1,145731,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(20,'Macbook Pro 2015 13 inch','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/20.jpg\",\"products\\/20-1.jpg\"]','HS-158-A0',0,15,0,1,1,3,0,0,119,90.44,NULL,NULL,12.00,16.00,10.00,838.00,1,5480,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(21,'Historic Alarm Clock (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/21.jpg\",\"products\\/21-1.jpg\"]','HS-171-A0',0,17,0,1,1,5,0,0,111,NULL,NULL,NULL,12.00,17.00,20.00,820.00,1,104288,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(22,'Black Glasses','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/22.jpg\",\"products\\/22-1.jpg\"]','HS-132-A0',0,16,0,1,1,2,0,0,122,NULL,NULL,NULL,18.00,13.00,14.00,878.00,1,199604,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(23,'Phillips Mouse','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/23.jpg\",\"products\\/23-1.jpg\"]','HS-108-A0',0,13,0,1,1,7,0,0,122,NULL,NULL,NULL,10.00,17.00,11.00,730.00,1,165442,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(24,'Gaming Keyboard','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/24.jpg\",\"products\\/24-1.jpg\"]','HS-192-A0',0,10,0,1,1,6,0,0,112,87.36,NULL,NULL,20.00,14.00,20.00,685.00,1,130002,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(25,'Dual Camera 20MP (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/25.jpg\",\"products\\/25-1.jpg\"]','HS-118-A0',0,20,0,1,0,2,0,0,80.25,NULL,NULL,NULL,17.00,13.00,11.00,543.00,1,65272,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(26,'Smart Watches','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/26.jpg\",\"products\\/26-1.jpg\",\"products\\/26-2.jpg\"]','HS-112-A0',0,14,0,1,0,6,0,0,40.5,NULL,NULL,NULL,10.00,18.00,11.00,698.00,1,41287,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(27,'Beat Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/27.jpg\",\"products\\/27-1.jpg\"]','HS-165-A0',0,15,0,1,0,4,0,0,20,NULL,NULL,NULL,15.00,11.00,17.00,757.00,1,158799,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(28,'Red & Black Headphone','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/28.jpg\",\"products\\/28-1.jpg\"]','HS-107-A0',0,20,0,1,0,6,0,0,52,45.24,NULL,NULL,19.00,20.00,10.00,591.00,1,103702,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(29,'Audio Equipment (Digital)','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/29.jpg\",\"products\\/29-1.jpg\"]','HS-171-A0',0,19,0,1,0,5,0,0,52,NULL,NULL,NULL,16.00,18.00,18.00,758.00,1,56330,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(30,'Smart Televisions','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/30.jpg\",\"products\\/30-1.jpg\"]','HS-107-A0',0,17,0,1,0,1,0,0,110,NULL,NULL,NULL,18.00,12.00,18.00,673.00,1,136720,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(31,'Samsung Smart TV','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline.</p>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains&rsquo; signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/31.jpg\",\"products\\/31-1.jpg\"]','HS-154-A0',0,17,0,1,0,5,0,0,60,NULL,NULL,NULL,20.00,14.00,18.00,536.00,1,37602,'2022-11-13 00:50:35','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(32,'Smart Home Speaker (Digital)',NULL,NULL,'published','[\"products\\/1.jpg\"]','HS-173-A0',0,19,0,1,0,2,1,0,243,NULL,NULL,NULL,12.00,19.00,19.00,691.00,NULL,0,'2022-11-13 00:50:35','2022-11-13 00:50:35','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(33,'Smart Home Speaker (Digital)',NULL,NULL,'published','[\"products\\/1-1.jpg\"]','HS-173-A0-A1',0,19,0,1,0,2,1,0,243,NULL,NULL,NULL,12.00,19.00,19.00,691.00,NULL,0,'2022-11-13 00:50:35','2022-11-13 00:50:35','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(34,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2.jpg\"]','HS-162-A0',0,11,0,1,0,6,1,0,329,NULL,NULL,NULL,19.00,14.00,11.00,844.00,NULL,0,'2022-11-13 00:50:35','2022-11-13 00:50:35','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(35,'Headphone Ultra Bass',NULL,NULL,'published','[\"products\\/2-1.jpg\"]','HS-162-A0-A1',0,11,0,1,0,6,1,0,329,NULL,NULL,NULL,19.00,14.00,11.00,844.00,NULL,0,'2022-11-13 00:50:35','2022-11-13 00:50:35','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(36,'Boxed - Bluetooth Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','HS-118-A0',0,19,0,1,0,6,1,0,224,NULL,NULL,NULL,16.00,15.00,17.00,679.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(37,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4.jpg\"]','HS-198-A0',0,10,0,1,0,4,1,0,79,67.94,NULL,NULL,13.00,20.00,17.00,504.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(38,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4-1.jpg\"]','HS-198-A0-A1',0,10,0,1,0,4,1,0,79,66.36,NULL,NULL,13.00,20.00,17.00,504.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(39,'Chikie - Bluetooth Speaker',NULL,NULL,'published','[\"products\\/4-2.jpg\"]','HS-198-A0-A2',0,10,0,1,0,4,1,0,79,60.04,NULL,NULL,13.00,20.00,17.00,504.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(40,'Camera Hikvision HK-35VS8 (Digital)',NULL,NULL,'published','[\"products\\/5.jpg\"]','HS-185-A0',0,17,0,1,0,2,1,0,40,NULL,NULL,NULL,19.00,10.00,12.00,822.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(41,'Camera Hikvision HK-35VS8 (Digital)',NULL,NULL,'published','[\"products\\/5-1.jpg\"]','HS-185-A0-A1',0,17,0,1,0,2,1,0,40,NULL,NULL,NULL,19.00,10.00,12.00,822.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(42,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-144-A0',0,12,0,1,0,7,1,0,51,NULL,NULL,NULL,18.00,20.00,10.00,626.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(43,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6-1.jpg\"]','HS-144-A0-A1',0,12,0,1,0,7,1,0,51,NULL,NULL,NULL,18.00,20.00,10.00,626.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(44,'Camera Samsung SS-24',NULL,NULL,'published','[\"products\\/6.jpg\"]','HS-144-A0-A2',0,12,0,1,0,7,1,0,51,NULL,NULL,NULL,18.00,20.00,10.00,626.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(45,'Leather Watch Band',NULL,NULL,'published','[\"products\\/7.jpg\"]','HS-137-A0',0,19,0,1,0,3,1,0,112,NULL,NULL,NULL,17.00,15.00,17.00,793.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(46,'Apple iPhone 13 Plus',NULL,NULL,'published','[\"products\\/8.jpg\"]','HS-152-A0',0,15,0,1,0,2,1,0,127,101.6,NULL,NULL,12.00,19.00,13.00,861.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(47,'Apple iPhone 13 Plus',NULL,NULL,'published','[\"products\\/8-1.jpg\"]','HS-152-A0-A1',0,15,0,1,0,2,1,0,127,107.95,NULL,NULL,12.00,19.00,13.00,861.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(48,'Macbook Pro 2015 (Digital)',NULL,NULL,'published','[\"products\\/9.jpg\"]','HS-146-A0',0,13,0,1,0,2,1,0,111,NULL,NULL,NULL,17.00,17.00,14.00,598.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(49,'Macbook Pro 2015 (Digital)',NULL,NULL,'published','[\"products\\/9-1.jpg\"]','HS-146-A0-A1',0,13,0,1,0,2,1,0,111,NULL,NULL,NULL,17.00,17.00,14.00,598.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(50,'Macbook Air 12 inch',NULL,NULL,'published','[\"products\\/10.jpg\"]','HS-101-A0',0,10,0,1,0,1,1,0,449,NULL,NULL,NULL,16.00,19.00,20.00,633.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(51,'Macbook Air 12 inch',NULL,NULL,'published','[\"products\\/10-1.jpg\"]','HS-101-A0-A1',0,10,0,1,0,1,1,0,449,NULL,NULL,NULL,16.00,19.00,20.00,633.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(52,'Apple Watch Serial 7',NULL,NULL,'published','[\"products\\/11.jpg\"]','HS-106-A0',0,13,0,1,0,3,1,0,111,NULL,NULL,NULL,19.00,17.00,16.00,804.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(53,'Apple Watch Serial 7',NULL,NULL,'published','[\"products\\/11-1.jpg\"]','HS-106-A0-A1',0,13,0,1,0,3,1,0,111,NULL,NULL,NULL,19.00,17.00,16.00,804.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(54,'Macbook Pro 13 inch',NULL,NULL,'published','[\"products\\/12.jpg\"]','HS-123-A0',0,12,0,1,0,5,1,0,111,89.91,NULL,NULL,16.00,20.00,18.00,887.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(55,'Macbook Pro 13 inch',NULL,NULL,'published','[\"products\\/12-1.jpg\"]','HS-123-A0-A1',0,12,0,1,0,5,1,0,111,91.02,NULL,NULL,16.00,20.00,18.00,887.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(56,'Macbook Pro 13 inch',NULL,NULL,'published','[\"products\\/12.jpg\"]','HS-123-A0-A2',0,12,0,1,0,5,1,0,111,87.69,NULL,NULL,16.00,20.00,18.00,887.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(57,'Apple Keyboard (Digital)',NULL,NULL,'published','[\"products\\/13.jpg\"]','HS-160-A0',0,19,0,1,0,6,1,0,130,NULL,NULL,NULL,16.00,11.00,16.00,749.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(58,'Apple Keyboard (Digital)',NULL,NULL,'published','[\"products\\/13-1.jpg\"]','HS-160-A0-A1',0,19,0,1,0,6,1,0,130,NULL,NULL,NULL,16.00,11.00,16.00,749.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(59,'Apple Keyboard (Digital)',NULL,NULL,'published','[\"products\\/13.jpg\"]','HS-160-A0-A2',0,19,0,1,0,6,1,0,130,NULL,NULL,NULL,16.00,11.00,16.00,749.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(60,'Apple Keyboard (Digital)',NULL,NULL,'published','[\"products\\/13.jpg\"]','HS-160-A0-A3',0,19,0,1,0,6,1,0,130,NULL,NULL,NULL,16.00,11.00,16.00,749.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(61,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-190-A0',0,18,0,1,0,4,1,0,123,NULL,NULL,NULL,14.00,19.00,17.00,829.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(62,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14-1.jpg\"]','HS-190-A0-A1',0,18,0,1,0,4,1,0,123,NULL,NULL,NULL,14.00,19.00,17.00,829.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(63,'MacSafe 80W',NULL,NULL,'published','[\"products\\/14.jpg\"]','HS-190-A0-A2',0,18,0,1,0,4,1,0,123,NULL,NULL,NULL,14.00,19.00,17.00,829.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(64,'Hand playstation',NULL,NULL,'published','[\"products\\/15.jpg\"]','HS-125-A0',0,17,0,1,0,1,1,0,123,NULL,NULL,NULL,13.00,15.00,11.00,884.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(65,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-107-A0',0,19,0,1,0,4,1,0,112,91.84,NULL,NULL,17.00,13.00,19.00,573.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(66,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-107-A0-A1',0,19,0,1,0,4,1,0,112,97.44,NULL,NULL,17.00,13.00,19.00,573.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(67,'Apple Airpods Serial 3',NULL,NULL,'published','[\"products\\/16.jpg\"]','HS-107-A0-A2',0,19,0,1,0,4,1,0,112,99.68,NULL,NULL,17.00,13.00,19.00,573.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(68,'Cool Smart Watches (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-196-A0',0,10,0,1,0,1,1,0,126,NULL,NULL,NULL,10.00,13.00,18.00,511.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(69,'Cool Smart Watches (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-196-A0-A1',0,10,0,1,0,1,1,0,126,NULL,NULL,NULL,10.00,13.00,18.00,511.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(70,'Cool Smart Watches (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-196-A0-A2',0,10,0,1,0,1,1,0,126,NULL,NULL,NULL,10.00,13.00,18.00,511.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(71,'Cool Smart Watches (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-196-A0-A3',0,10,0,1,0,1,1,0,126,NULL,NULL,NULL,10.00,13.00,18.00,511.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(72,'Cool Smart Watches (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','HS-196-A0-A4',0,10,0,1,0,1,1,0,126,NULL,NULL,NULL,10.00,13.00,18.00,511.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(73,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18.jpg\"]','HS-191-A0',0,10,0,1,0,3,1,0,120,NULL,NULL,NULL,18.00,20.00,20.00,696.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(74,'Black Smart Watches',NULL,NULL,'published','[\"products\\/18-1.jpg\"]','HS-191-A0-A1',0,10,0,1,0,3,1,0,120,NULL,NULL,NULL,18.00,20.00,20.00,696.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(75,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19.jpg\"]','HS-167-A0',0,11,0,1,0,6,1,0,117,NULL,NULL,NULL,15.00,16.00,18.00,725.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(76,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19-1.jpg\"]','HS-167-A0-A1',0,11,0,1,0,6,1,0,117,NULL,NULL,NULL,15.00,16.00,18.00,725.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(77,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19.jpg\"]','HS-167-A0-A2',0,11,0,1,0,6,1,0,117,NULL,NULL,NULL,15.00,16.00,18.00,725.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(78,'Leather Watch Band Serial 3',NULL,NULL,'published','[\"products\\/19.jpg\"]','HS-167-A0-A3',0,11,0,1,0,6,1,0,117,NULL,NULL,NULL,15.00,16.00,18.00,725.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(79,'Macbook Pro 2015 13 inch',NULL,NULL,'published','[\"products\\/20.jpg\"]','HS-158-A0',0,15,0,1,0,3,1,0,119,90.44,NULL,NULL,12.00,16.00,10.00,838.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(80,'Historic Alarm Clock (Digital)',NULL,NULL,'published','[\"products\\/21.jpg\"]','HS-171-A0',0,17,0,1,0,5,1,0,111,NULL,NULL,NULL,12.00,17.00,20.00,820.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(81,'Historic Alarm Clock (Digital)',NULL,NULL,'published','[\"products\\/21-1.jpg\"]','HS-171-A0-A1',0,17,0,1,0,5,1,0,111,NULL,NULL,NULL,12.00,17.00,20.00,820.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(82,'Historic Alarm Clock (Digital)',NULL,NULL,'published','[\"products\\/21.jpg\"]','HS-171-A0-A2',0,17,0,1,0,5,1,0,111,NULL,NULL,NULL,12.00,17.00,20.00,820.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(83,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-132-A0',0,16,0,1,0,2,1,0,122,NULL,NULL,NULL,18.00,13.00,14.00,878.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(84,'Black Glasses',NULL,NULL,'published','[\"products\\/22-1.jpg\"]','HS-132-A0-A1',0,16,0,1,0,2,1,0,122,NULL,NULL,NULL,18.00,13.00,14.00,878.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(85,'Black Glasses',NULL,NULL,'published','[\"products\\/22.jpg\"]','HS-132-A0-A2',0,16,0,1,0,2,1,0,122,NULL,NULL,NULL,18.00,13.00,14.00,878.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(86,'Phillips Mouse',NULL,NULL,'published','[\"products\\/23.jpg\"]','HS-108-A0',0,13,0,1,0,7,1,0,122,NULL,NULL,NULL,10.00,17.00,11.00,730.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(87,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-192-A0',0,10,0,1,0,6,1,0,112,87.36,NULL,NULL,20.00,14.00,20.00,685.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(88,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24-1.jpg\"]','HS-192-A0-A1',0,10,0,1,0,6,1,0,112,94.08,NULL,NULL,20.00,14.00,20.00,685.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(89,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-192-A0-A2',0,10,0,1,0,6,1,0,112,81.76,NULL,NULL,20.00,14.00,20.00,685.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(90,'Gaming Keyboard',NULL,NULL,'published','[\"products\\/24.jpg\"]','HS-192-A0-A3',0,10,0,1,0,6,1,0,112,91.84,NULL,NULL,20.00,14.00,20.00,685.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(91,'Dual Camera 20MP (Digital)',NULL,NULL,'published','[\"products\\/25.jpg\"]','HS-118-A0',0,20,0,1,0,2,1,0,80.25,NULL,NULL,NULL,17.00,13.00,11.00,543.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(92,'Dual Camera 20MP (Digital)',NULL,NULL,'published','[\"products\\/25-1.jpg\"]','HS-118-A0-A1',0,20,0,1,0,2,1,0,80.25,NULL,NULL,NULL,17.00,13.00,11.00,543.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(93,'Smart Watches',NULL,NULL,'published','[\"products\\/26.jpg\"]','HS-112-A0',0,14,0,1,0,6,1,0,40.5,NULL,NULL,NULL,10.00,18.00,11.00,698.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(94,'Smart Watches',NULL,NULL,'published','[\"products\\/26-1.jpg\"]','HS-112-A0-A1',0,14,0,1,0,6,1,0,40.5,NULL,NULL,NULL,10.00,18.00,11.00,698.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(95,'Beat Headphone',NULL,NULL,'published','[\"products\\/27.jpg\"]','HS-165-A0',0,15,0,1,0,4,1,0,20,NULL,NULL,NULL,15.00,11.00,17.00,757.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(96,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28.jpg\"]','HS-107-A0',0,20,0,1,0,6,1,0,52,45.24,NULL,NULL,19.00,20.00,10.00,591.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(97,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/28-1.jpg\"]','HS-107-A0-A1',0,20,0,1,0,6,1,0,52,46.8,NULL,NULL,19.00,20.00,10.00,591.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(98,'Audio Equipment (Digital)',NULL,NULL,'published','[\"products\\/29.jpg\"]','HS-171-A0',0,19,0,1,0,5,1,0,52,NULL,NULL,NULL,16.00,18.00,18.00,758.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(99,'Audio Equipment (Digital)',NULL,NULL,'published','[\"products\\/29-1.jpg\"]','HS-171-A0-A1',0,19,0,1,0,5,1,0,52,NULL,NULL,NULL,16.00,18.00,18.00,758.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'digital'),(100,'Smart Televisions',NULL,NULL,'published','[\"products\\/30.jpg\"]','HS-107-A0',0,17,0,1,0,1,1,0,110,NULL,NULL,NULL,18.00,12.00,18.00,673.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(101,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-154-A0',0,17,0,1,0,5,1,0,60,NULL,NULL,NULL,20.00,14.00,18.00,536.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(102,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31-1.jpg\"]','HS-154-A0-A1',0,17,0,1,0,5,1,0,60,NULL,NULL,NULL,20.00,14.00,18.00,536.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(103,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-154-A0-A2',0,17,0,1,0,5,1,0,60,NULL,NULL,NULL,20.00,14.00,18.00,536.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(104,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-154-A0-A3',0,17,0,1,0,5,1,0,60,NULL,NULL,NULL,20.00,14.00,18.00,536.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical'),(105,'Samsung Smart TV',NULL,NULL,'published','[\"products\\/31.jpg\"]','HS-154-A0-A4',0,17,0,1,0,5,1,0,60,NULL,NULL,NULL,20.00,14.00,18.00,536.00,NULL,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','in_stock',0,'Botble\\ACL\\Models\\User',NULL,'physical');
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
INSERT INTO `ec_products_translations` VALUES ('vi',1,'Loa thông minh',NULL,NULL),('vi',2,'Tai nghe Ultra Bass',NULL,NULL),('vi',3,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',4,'Chikie - Loa Bluetooth',NULL,NULL),('vi',5,'Camera Hikvision HK-35VS8',NULL,NULL),('vi',6,'Camera Samsung SS-24',NULL,NULL),('vi',7,'Dây đeo đồng hồ bằng da',NULL,NULL),('vi',8,'Apple iPhone 13 Plus',NULL,NULL),('vi',9,'Macbook Pro 2015',NULL,NULL),('vi',10,'Macbook Air 12 inch',NULL,NULL),('vi',11,'Apple Watch Serial 7',NULL,NULL),('vi',12,'Macbook Pro 13 inch',NULL,NULL),('vi',13,'Bàn phím Apple',NULL,NULL),('vi',14,'MacSafe 80W',NULL,NULL),('vi',15,'Máy chơi game cầm tay',NULL,NULL),('vi',16,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',17,'Đồng hồ thông minh',NULL,NULL),('vi',18,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',19,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',20,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',21,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',22,'Kính đen',NULL,NULL),('vi',23,'Chuột máy tính Phillips',NULL,NULL),('vi',24,'Bàn phím Trò chơi',NULL,NULL),('vi',25,'Camera kép 20MP',NULL,NULL),('vi',26,'Đồng hồ thông minh',NULL,NULL),('vi',27,'Tai nghe Best',NULL,NULL),('vi',28,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',29,'Thiết bị âm thanh',NULL,NULL),('vi',30,'Tivi thông minh',NULL,NULL),('vi',31,'Tivi thông minh Samsung',NULL,NULL),('vi',32,'Loa thông minh',NULL,NULL),('vi',33,'Loa thông minh',NULL,NULL),('vi',34,'Tai nghe Ultra Bass',NULL,NULL),('vi',35,'Tai nghe Ultra Bass',NULL,NULL),('vi',36,'Đóng hộp - Tai nghe Bluetooth',NULL,NULL),('vi',37,'Chikie - Loa Bluetooth',NULL,NULL),('vi',38,'Chikie - Loa Bluetooth',NULL,NULL),('vi',39,'Chikie - Loa Bluetooth',NULL,NULL),('vi',40,'Camera Hikvision HK-35VS8',NULL,NULL),('vi',41,'Camera Hikvision HK-35VS8',NULL,NULL),('vi',42,'Camera Samsung SS-24',NULL,NULL),('vi',43,'Camera Samsung SS-24',NULL,NULL),('vi',44,'Camera Samsung SS-24',NULL,NULL),('vi',45,'Dây đeo đồng hồ bằng da',NULL,NULL),('vi',46,'Apple iPhone 13 Plus',NULL,NULL),('vi',47,'Apple iPhone 13 Plus',NULL,NULL),('vi',48,'Macbook Pro 2015',NULL,NULL),('vi',49,'Macbook Pro 2015',NULL,NULL),('vi',50,'Macbook Air 12 inch',NULL,NULL),('vi',51,'Macbook Air 12 inch',NULL,NULL),('vi',52,'Apple Watch Serial 7',NULL,NULL),('vi',53,'Apple Watch Serial 7',NULL,NULL),('vi',54,'Macbook Pro 13 inch',NULL,NULL),('vi',55,'Macbook Pro 13 inch',NULL,NULL),('vi',56,'Macbook Pro 13 inch',NULL,NULL),('vi',57,'Bàn phím Apple',NULL,NULL),('vi',58,'Bàn phím Apple',NULL,NULL),('vi',59,'Bàn phím Apple',NULL,NULL),('vi',60,'Bàn phím Apple',NULL,NULL),('vi',61,'MacSafe 80W',NULL,NULL),('vi',62,'MacSafe 80W',NULL,NULL),('vi',63,'MacSafe 80W',NULL,NULL),('vi',64,'Máy chơi game cầm tay',NULL,NULL),('vi',65,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',66,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',67,'Tai nghe Apple Airpods Serial 3',NULL,NULL),('vi',68,'Đồng hồ thông minh',NULL,NULL),('vi',69,'Đồng hồ thông minh',NULL,NULL),('vi',70,'Đồng hồ thông minh',NULL,NULL),('vi',71,'Đồng hồ thông minh',NULL,NULL),('vi',72,'Đồng hồ thông minh',NULL,NULL),('vi',73,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',74,'Đồng hồ thông minh màu đen',NULL,NULL),('vi',75,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',76,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',77,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',78,'Dây đeo đồng hồ dây da Serial 3',NULL,NULL),('vi',79,'Macbook Pro 2015 13 inch',NULL,NULL),('vi',80,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',81,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',82,'Đồng hồ báo thức cổ điển',NULL,NULL),('vi',83,'Kính đen',NULL,NULL),('vi',84,'Kính đen',NULL,NULL),('vi',85,'Kính đen',NULL,NULL),('vi',86,'Chuột máy tính Phillips',NULL,NULL),('vi',87,'Bàn phím Trò chơi',NULL,NULL),('vi',88,'Bàn phím Trò chơi',NULL,NULL),('vi',89,'Bàn phím Trò chơi',NULL,NULL),('vi',90,'Bàn phím Trò chơi',NULL,NULL),('vi',91,'Camera kép 20MP',NULL,NULL),('vi',92,'Camera kép 20MP',NULL,NULL),('vi',93,'Đồng hồ thông minh',NULL,NULL),('vi',94,'Đồng hồ thông minh',NULL,NULL),('vi',95,'Tai nghe Best',NULL,NULL),('vi',96,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',97,'Tai nghe Đỏ & Đen',NULL,NULL),('vi',98,'Thiết bị âm thanh',NULL,NULL),('vi',99,'Thiết bị âm thanh',NULL,NULL),('vi',100,'Tivi thông minh',NULL,NULL),('vi',101,'Tivi thông minh Samsung',NULL,NULL),('vi',102,'Tivi thông minh Samsung',NULL,NULL),('vi',103,'Tivi thông minh Samsung',NULL,NULL),('vi',104,'Tivi thông minh Samsung',NULL,NULL),('vi',105,'Tivi thông minh Samsung',NULL,NULL);
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `ec_reviews_product_id_customer_id_status_index` (`product_id`,`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,4,19,3.00,'Clean & perfect source code','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(2,5,3,5.00,'Good app, good backup service and support. Good documentation.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\"]'),(3,10,25,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(4,3,4,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\"]'),(5,4,4,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/30.jpg\"}'),(6,4,29,4.00,'Best ecommerce CMS online store!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/14.jpg\"}'),(7,3,26,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\"]'),(8,1,11,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(9,4,5,1.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(10,10,22,5.00,'Best ecommerce CMS online store!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(11,8,4,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/6.jpg\",\"products\\/25.jpg\"]'),(12,7,8,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(13,10,28,4.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/12.jpg\"]'),(14,8,13,2.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(15,1,8,4.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/22.jpg\"}'),(16,4,18,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(17,3,4,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(18,5,18,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(19,5,9,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\"]'),(20,5,3,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\"]'),(21,11,15,5.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/9.jpg\"]'),(22,7,28,5.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(23,6,19,4.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\"]'),(24,1,23,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(25,1,17,2.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(26,4,25,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/15.jpg\"}'),(27,3,11,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(28,4,2,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(29,1,18,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(30,4,22,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(31,8,30,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/27.jpg\"}'),(32,5,31,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/22.jpg\"}'),(33,10,19,3.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(34,11,4,1.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(35,5,30,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/10.jpg\"}'),(36,5,13,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/20.jpg\"]'),(37,1,3,1.00,'Good app, good backup service and support. Good documentation.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(38,2,3,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/6.jpg\",\"products\\/10.jpg\"]'),(39,8,26,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/12.jpg\"}'),(40,9,21,5.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(41,11,15,5.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(42,8,17,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/13.jpg\"}'),(43,11,27,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(44,1,16,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/20.jpg\"]'),(45,3,28,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/20.jpg\"]'),(46,8,26,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/11.jpg\"]'),(47,7,22,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(48,7,13,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(49,3,28,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/15.jpg\"}'),(50,1,17,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/6.jpg\",\"products\\/30.jpg\"]'),(51,3,12,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(52,11,6,2.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\"]'),(53,1,15,1.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/7.jpg\",\"products\\/17.jpg\"]'),(54,3,19,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/7.jpg\"]'),(55,8,6,1.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(56,9,2,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(57,6,16,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(58,10,14,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/7.jpg\",\"products\\/25.jpg\"]'),(59,10,18,5.00,'Clean & perfect source code','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(60,3,20,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/5.jpg\",\"products\\/9.jpg\"]'),(61,2,30,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/5.jpg\"]'),(62,11,27,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(63,10,27,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(64,1,14,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(65,5,18,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/7.jpg\"]'),(66,5,10,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/6.jpg\"]'),(67,10,27,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\"]'),(68,1,23,1.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/1.jpg\",\"2\":\"products\\/28.jpg\"}'),(69,5,18,2.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/7.jpg\",\"products\\/12.jpg\"]'),(70,10,9,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(71,7,17,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/6.jpg\"]'),(72,1,25,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(73,5,30,3.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/6.jpg\",\"products\\/31.jpg\"]'),(74,5,12,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/5.jpg\"]'),(75,2,15,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/7.jpg\"]'),(76,7,22,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\"]'),(77,9,12,3.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/17.jpg\"}'),(78,11,26,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/23.jpg\"}'),(79,6,15,5.00,'Clean & perfect source code','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/25.jpg\"}'),(80,2,16,1.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/6.jpg\"]'),(81,3,28,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\",\"products\\/5.jpg\"]'),(82,5,16,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\"]'),(83,7,10,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(84,11,26,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/6.jpg\"]'),(85,3,22,1.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(86,5,7,4.00,'Good app, good backup service and support. Good documentation.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/4.jpg\",\"2\":\"products\\/14.jpg\"}'),(87,2,19,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/13.jpg\"}'),(88,3,1,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(89,9,4,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/22.jpg\"]'),(90,5,17,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/4.jpg\"]'),(91,11,9,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\"]'),(92,4,12,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\"]'),(93,3,21,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\"]'),(94,1,15,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/3.jpg\",\"2\":\"products\\/23.jpg\"}'),(95,4,5,2.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/22.jpg\"]'),(96,3,2,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/3.jpg\",\"products\\/5.jpg\",\"products\\/30.jpg\"]'),(97,4,7,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\",\"products\\/7.jpg\"]'),(98,2,9,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','{\"0\":\"products\\/2.jpg\",\"2\":\"products\\/10.jpg\"}'),(99,11,24,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/1.jpg\",\"products\\/5.jpg\",\"products\\/19.jpg\"]'),(100,2,10,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2022-11-13 00:50:36','2022-11-13 00:50:36','[\"products\\/2.jpg\"]');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `shipment_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
INSERT INTO `ec_shipment_histories` VALUES (1,'create_from_order','Shipping was created from order %order_id%',0,1,1,'2022-10-30 16:50:36','2022-10-30 16:50:36'),(2,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,1,1,'2022-11-11 08:50:36','2022-11-13 00:50:36'),(3,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,1,1,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(4,'create_from_order','Shipping was created from order %order_id%',0,2,2,'2022-10-31 08:50:36','2022-10-31 08:50:36'),(5,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,2,2,'2022-11-11 10:50:36','2022-11-13 00:50:36'),(6,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,2,2,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(7,'create_from_order','Shipping was created from order %order_id%',0,3,3,'2022-10-29 00:50:36','2022-10-29 00:50:36'),(8,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,3,3,'2022-11-11 12:50:36','2022-11-13 00:50:36'),(9,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,3,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(10,'create_from_order','Shipping was created from order %order_id%',0,4,4,'2022-11-01 16:50:36','2022-11-01 16:50:36'),(11,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,4,4,'2022-11-11 14:50:36','2022-11-13 00:50:36'),(12,'create_from_order','Shipping was created from order %order_id%',0,5,5,'2022-11-02 08:50:36','2022-11-02 08:50:36'),(13,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,5,5,'2022-11-11 16:50:36','2022-11-13 00:50:36'),(14,'create_from_order','Shipping was created from order %order_id%',0,6,6,'2022-11-05 12:50:36','2022-11-05 12:50:36'),(15,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,6,6,'2022-11-11 18:50:36','2022-11-13 00:50:36'),(16,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,6,6,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(17,'create_from_order','Shipping was created from order %order_id%',0,7,7,'2022-11-07 04:50:36','2022-11-07 04:50:36'),(18,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,7,7,'2022-11-11 20:50:36','2022-11-13 00:50:36'),(19,'create_from_order','Shipping was created from order %order_id%',0,8,8,'2022-11-10 20:50:36','2022-11-10 20:50:36'),(20,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,8,8,'2022-11-11 22:50:36','2022-11-13 00:50:36'),(21,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,8,8,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(22,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,8,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(23,'create_from_order','Shipping was created from order %order_id%',0,9,9,'2022-11-05 00:50:36','2022-11-05 00:50:36'),(24,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,9,9,'2022-11-12 00:50:36','2022-11-13 00:50:36'),(25,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,9,9,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(26,'create_from_order','Shipping was created from order %order_id%',0,10,10,'2022-11-11 04:50:36','2022-11-11 04:50:36'),(27,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,10,10,'2022-11-12 02:50:36','2022-11-13 00:50:36'),(28,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,10,10,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(29,'create_from_order','Shipping was created from order %order_id%',0,11,11,'2022-11-11 08:50:36','2022-11-11 08:50:36'),(30,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,11,11,'2022-11-12 04:50:36','2022-11-13 00:50:36'),(31,'create_from_order','Shipping was created from order %order_id%',0,12,12,'2022-11-06 06:50:36','2022-11-06 06:50:36'),(32,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,12,12,'2022-11-12 06:50:36','2022-11-13 00:50:36'),(33,'create_from_order','Shipping was created from order %order_id%',0,13,13,'2022-11-06 08:50:36','2022-11-06 08:50:36'),(34,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,13,13,'2022-11-12 08:50:36','2022-11-13 00:50:36'),(35,'create_from_order','Shipping was created from order %order_id%',0,14,14,'2022-11-07 04:50:36','2022-11-07 04:50:36'),(36,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,14,14,'2022-11-12 10:50:36','2022-11-13 00:50:36'),(37,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,14,14,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(38,'create_from_order','Shipping was created from order %order_id%',0,15,15,'2022-11-09 00:50:36','2022-11-09 00:50:36'),(39,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,15,15,'2022-11-12 12:50:36','2022-11-13 00:50:36'),(40,'create_from_order','Shipping was created from order %order_id%',0,16,16,'2022-11-10 22:50:36','2022-11-10 22:50:36'),(41,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,16,16,'2022-11-12 14:50:36','2022-11-13 00:50:36'),(42,'create_from_order','Shipping was created from order %order_id%',0,17,17,'2022-11-09 16:50:36','2022-11-09 16:50:36'),(43,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,17,17,'2022-11-12 16:50:36','2022-11-13 00:50:36'),(44,'create_from_order','Shipping was created from order %order_id%',0,18,18,'2022-11-11 18:50:36','2022-11-11 18:50:36'),(45,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,18,18,'2022-11-12 18:50:36','2022-11-13 00:50:36'),(46,'create_from_order','Shipping was created from order %order_id%',0,19,19,'2022-11-11 20:50:36','2022-11-11 20:50:36'),(47,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,19,19,'2022-11-12 20:50:36','2022-11-13 00:50:36'),(48,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,19,19,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(49,'create_from_order','Shipping was created from order %order_id%',0,20,20,'2022-11-12 14:50:36','2022-11-12 14:50:36'),(50,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,20,20,'2022-11-12 22:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `transaction` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
INSERT INTO `ec_shipments` VALUES (1,1,NULL,3132.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0024125197','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-21 07:50:36','2022-11-13 07:50:36',NULL,NULL),(2,2,NULL,2435.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0085755983','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-14 07:50:36','2022-11-13 07:50:36',NULL,NULL),(3,3,NULL,5330.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0067293804','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-17 07:50:36','2022-11-13 07:50:36',NULL,NULL),(4,4,NULL,5306.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0043800396','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-21 07:50:36',NULL,NULL,NULL),(5,5,NULL,1907.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0053817267','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-21 07:50:36',NULL,NULL,NULL),(6,6,NULL,5990.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0042073886','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-15 07:50:36','2022-11-13 07:50:36',NULL,NULL),(7,7,NULL,4940.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0097415385','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-20 07:50:36',NULL,NULL,NULL),(8,8,NULL,6561.00,NULL,'','delivered',762.60,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0077403037','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-21 07:50:36','2022-11-13 07:50:36',NULL,NULL),(9,9,NULL,4780.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0069031569','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-17 07:50:36','2022-11-13 07:50:36',NULL,NULL),(10,10,NULL,4230.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD005406422','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-19 07:50:36','2022-11-13 07:50:36',NULL,NULL),(11,11,NULL,6624.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0045253465','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-18 07:50:36',NULL,NULL,NULL),(12,12,NULL,3540.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0042303374','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-21 07:50:36',NULL,NULL,NULL),(13,13,NULL,2092.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0085650138','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-22 07:50:36',NULL,NULL,NULL),(14,14,NULL,2399.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0089619093','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-15 07:50:36','2022-11-13 07:50:36',NULL,NULL),(15,15,NULL,6772.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0093848423','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-14 07:50:36',NULL,NULL,NULL),(16,16,NULL,4323.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0070503160','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-23 07:50:36',NULL,NULL,NULL),(17,17,NULL,3279.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0064631189','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-23 07:50:36',NULL,NULL,NULL),(18,18,NULL,4102.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0052912959','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-17 07:50:36',NULL,NULL,NULL),(19,19,NULL,5007.00,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0046100382','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-20 07:50:36','2022-11-13 07:50:36',NULL,NULL),(20,20,NULL,3882.00,NULL,'','approved',0.00,'completed','pending',0.00,0,'2022-11-13 00:50:36','2022-11-13 00:50:36','JJD0037381486','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2022-11-18 07:50:36',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` int unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` int unsigned NOT NULL,
  `type` enum('base_on_price','base_on_weight') COLLATE utf8mb4_unicode_ci DEFAULT 'base_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free shipping',1,'base_on_price',0.00,NULL,0.00,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(2,'Local Pickup',1,'base_on_price',0.00,NULL,20.00,'2022-11-13 00:50:36','2022-11-13 00:50:36'),(3,'Flat Rate',1,'base_on_price',0.00,NULL,25.00,'2022-11-13 00:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'Shopwise','sales@botble.com','123-456-7890','123 Street, Old Trafford','US','New York','New York',1,1,'2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10.000000,1,'published','2022-11-13 00:50:36','2022-11-13 00:50:36'),(2,'None',0.000000,2,'published','2022-11-13 00:50:36','2022-11-13 00:50:36');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_wish_lists_product_id_customer_id_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'Shipping',0,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Payment',1,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Order & Returns',2,'published','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
INSERT INTO `faq_categories_translations` VALUES ('vi',1,'VẬN CHUYỂN'),('vi',2,'THANH TOÁN'),('vi',3,'ĐƠN HÀNG & HOÀN TRẢ');
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` int NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
INSERT INTO `faqs_translations` VALUES ('vi',1,'Có những phương thức vận chuyển nào?','Ex Portland Pitchfork irure ria mép. Eutra fap trước khi họ bán hết theo đúng nghĩa đen. Aliquip ugh quyền xe đạp thực sự mlkshk, rượu bia thủ công mực seitan. '),('vi',2,'Bạn có giao hàng quốc tế không?','Áo hoodie túi tote Tofu mixtape. Quần đùi jean đánh chữ Wolf quinoa, túi messenger hữu cơ freegan cray. '),('vi',3,'Mất bao lâu để nhận được gói hàng của tôi?','Bữa nửa buổi ăn sáng bằng bụng heo quay từ máy đánh chữ VHS, cà phê có nguồn gốc đơn Paleo, Wes Anderson. Khoan Pitchfork linh hoạt, theo nghĩa đen là đổ qua fap theo nghĩa đen. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray bền vững slow-carb raw denim Church-key fap chillwave Etsy. +1 bộ dụng cụ đánh máy, đậu phụ Banksy Vice của American Apparel. '),('vi',4,'Phương thức thanh toán nào được chấp nhận?','Fashion Axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Quầy ảnh Voluptate fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur ria mép. Twee chia gian hàng chụp ảnh xe bán đồ ăn sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. '),('vi',5,'Mua trực tuyến có an toàn không?','Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia credit. Tiệc trên mái nhà Neutra Austin Brooklyn, Thundercats swag synth gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. '),('vi',6,'Làm cách nào để đặt hàng?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Định mức seitan trong tương lai. Master làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt chậm carb cấp độ tiếp theo. Vải thô denim polaroid nhạt từ trang trại đến bàn, đặt một con chim trên đó hình xăm lo-fi Wes Anderson Pinterest letterpress. Bậc thầy gian hàng ảnh Schlitz của Fingerstache McSweeney đang làm sạch thẻ bắt đầu bằng hashtag theo yêu cầu riêng, chillwave gentrify. '),('vi',7,'Làm cách nào để tôi có thể hủy hoặc thay đổi đơn hàng của mình?','Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Bữa tiệc nghệ thuật đích thực freegan semiotics jean shorts chia tín. Tiệc trên mái nhà Neutra Austin ở Brooklyn, synth Thundercats có gian hàng ảnh 8-bit. '),('vi',8,'Tôi có cần tài khoản để đặt hàng không?','Thundercats làm lung lay gian hàng ảnh 8-bit. Xà cạp letterpress kẻ sọc thủ công bia meh đạo đức Pinterest. Twee chia ảnh gian hàng xe bán thức ăn làm sẵn, bữa tiệc trên mái áo hoodie swag keytar PBR DIY. Cray ugh 3 wolf moon fap, rìu thời trang mỉa mai người bán thịt máy đánh chữ chambray VHS banjo nghệ thuật đường phố. '),('vi',9,'Làm cách nào để theo dõi đơn hàng của tôi?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Định mức seitan trong tương lai. Bậc thầy làm sạch American Apparel nhẹ nhàng làm sạch râu linh hoạt theo kiểu chậm carb cấp độ tiếp theo. '),('vi',10,'Làm cách nào để trả lại sản phẩm?','Kale chips Truffaut Williamsburg, fixie hashtag Pinterest raw denim c hambray uống giấm Carles street art Bushwick gastropub. Chìa khóa nhà thờ Wolf Tumblr. Xe tải thực phẩm kẻ sọc Echo Park YOLO cắn hella, giao dịch trực tiếp Thundercats legging quinoa trước khi bán hết. Có thể bạn chưa từng nghe nói về họ những người truyền bá vị umami đích thực uống giấm Pinterest Áo len Cosby, fingerstache fap High Life. ');
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` text COLLATE utf8mb4_unicode_ci,
  `lang_meta_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','b7208d8dd34f6950c1c0b770a950d94f',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'vi','b7208d8dd34f6950c1c0b770a950d94f',2,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(3,'en_US','984320e3cad98e13a65b2eb5b63dbdc2',1,'Botble\\Menu\\Models\\MenuLocation'),(4,'en_US','bf018ddd9c9c7726c26740950ce97261',1,'Botble\\Menu\\Models\\Menu'),(5,'en_US','e51ec55494babfa1162853fbb0070eeb',2,'Botble\\Menu\\Models\\Menu'),(6,'en_US','05e347bc45a169bbf86bf5081645e973',3,'Botble\\Menu\\Models\\Menu'),(7,'en_US','8ea7c09d5426ff71cc2c05bc2c830ccc',4,'Botble\\Menu\\Models\\Menu'),(8,'vi','0a9456d56e9c3d1989091a9bdd13d143',2,'Botble\\Menu\\Models\\MenuLocation'),(9,'vi','bf018ddd9c9c7726c26740950ce97261',5,'Botble\\Menu\\Models\\Menu'),(10,'vi','e51ec55494babfa1162853fbb0070eeb',6,'Botble\\Menu\\Models\\Menu'),(11,'vi','05e347bc45a169bbf86bf5081645e973',7,'Botble\\Menu\\Models\\Menu'),(12,'vi','8ea7c09d5426ff71cc2c05bc2c830ccc',8,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0),(2,'Tiếng Việt','vi','vi','vn',0,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1',1,'image/png',2165,'brands/1.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(2,0,'2',1,'image/png',2165,'brands/2.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(3,0,'3',1,'image/png',2165,'brands/3.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(4,0,'4',1,'image/png',2165,'brands/4.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(5,0,'5',1,'image/png',2165,'brands/5.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(6,0,'6',1,'image/png',2165,'brands/6.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(7,0,'7',1,'image/png',2165,'brands/7.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(8,0,'p-1',2,'image/png',2165,'product-categories/p-1.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(9,0,'p-2',2,'image/png',2165,'product-categories/p-2.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(10,0,'p-3',2,'image/png',2165,'product-categories/p-3.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(11,0,'p-4',2,'image/png',2165,'product-categories/p-4.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(12,0,'p-5',2,'image/png',2165,'product-categories/p-5.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(13,0,'p-6',2,'image/png',2165,'product-categories/p-6.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(14,0,'p-7',2,'image/png',2165,'product-categories/p-7.png','[]','2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(15,0,'1',3,'image/jpeg',2165,'customers/1.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(16,0,'10',3,'image/jpeg',2165,'customers/10.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(17,0,'2',3,'image/jpeg',2165,'customers/2.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(18,0,'3',3,'image/jpeg',2165,'customers/3.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(19,0,'4',3,'image/jpeg',2165,'customers/4.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(20,0,'5',3,'image/jpeg',2165,'customers/5.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(21,0,'6',3,'image/jpeg',2165,'customers/6.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(22,0,'7',3,'image/jpeg',2165,'customers/7.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(23,0,'8',3,'image/jpeg',2165,'customers/8.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(24,0,'9',3,'image/jpeg',2165,'customers/9.jpg','[]','2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(25,0,'1-1',4,'image/jpeg',2165,'products/1-1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(26,0,'1-2',4,'image/jpeg',2165,'products/1-2.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(27,0,'1-3',4,'image/jpeg',2165,'products/1-3.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(28,0,'1',4,'image/jpeg',2165,'products/1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(29,0,'10-1',4,'image/jpeg',2165,'products/10-1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(30,0,'10',4,'image/jpeg',2165,'products/10.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(31,0,'11-1',4,'image/jpeg',2165,'products/11-1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(32,0,'11',4,'image/jpeg',2165,'products/11.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(33,0,'12-1',4,'image/jpeg',2165,'products/12-1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(34,0,'12',4,'image/jpeg',2165,'products/12.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(35,0,'13-1',4,'image/jpeg',2165,'products/13-1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(36,0,'13',4,'image/jpeg',2165,'products/13.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(37,0,'14-1',4,'image/jpeg',2165,'products/14-1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(38,0,'14',4,'image/jpeg',2165,'products/14.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(39,0,'15-1',4,'image/jpeg',2165,'products/15-1.jpg','[]','2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(40,0,'15',4,'image/jpeg',2165,'products/15.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(41,0,'16',4,'image/jpeg',2165,'products/16.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(42,0,'17',4,'image/jpeg',2165,'products/17.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(43,0,'18-1',4,'image/jpeg',2165,'products/18-1.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(44,0,'18-2',4,'image/jpeg',2165,'products/18-2.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(45,0,'18',4,'image/jpeg',2165,'products/18.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(46,0,'19-1',4,'image/jpeg',2165,'products/19-1.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(47,0,'19',4,'image/jpeg',2165,'products/19.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(48,0,'2-1',4,'image/jpeg',2165,'products/2-1.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(49,0,'2-2',4,'image/jpeg',2165,'products/2-2.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(50,0,'2-3',4,'image/jpeg',2165,'products/2-3.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(51,0,'2',4,'image/jpeg',2165,'products/2.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(52,0,'20-1',4,'image/jpeg',2165,'products/20-1.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(53,0,'20',4,'image/jpeg',2165,'products/20.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(54,0,'21-1',4,'image/jpeg',2165,'products/21-1.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(55,0,'21',4,'image/jpeg',2165,'products/21.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(56,0,'22-1',4,'image/jpeg',2165,'products/22-1.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(57,0,'22',4,'image/jpeg',2165,'products/22.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(58,0,'23-1',4,'image/jpeg',2165,'products/23-1.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(59,0,'23',4,'image/jpeg',2165,'products/23.jpg','[]','2022-11-13 00:50:33','2022-11-13 00:50:33',NULL),(60,0,'24-1',4,'image/jpeg',2165,'products/24-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(61,0,'24',4,'image/jpeg',2165,'products/24.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(62,0,'25-1',4,'image/jpeg',2165,'products/25-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(63,0,'25',4,'image/jpeg',2165,'products/25.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(64,0,'26-1',4,'image/jpeg',2165,'products/26-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(65,0,'26-2',4,'image/jpeg',2165,'products/26-2.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(66,0,'26',4,'image/jpeg',2165,'products/26.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(67,0,'27-1',4,'image/jpeg',2165,'products/27-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(68,0,'27',4,'image/jpeg',2165,'products/27.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(69,0,'28-1',4,'image/jpeg',2165,'products/28-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(70,0,'28',4,'image/jpeg',2165,'products/28.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(71,0,'29-1',4,'image/jpeg',2165,'products/29-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(72,0,'29',4,'image/jpeg',2165,'products/29.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(73,0,'3-1',4,'image/jpeg',2165,'products/3-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(74,0,'3-2',4,'image/jpeg',2165,'products/3-2.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(75,0,'3-3',4,'image/jpeg',2165,'products/3-3.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(76,0,'3',4,'image/jpeg',2165,'products/3.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(77,0,'30-1',4,'image/jpeg',2165,'products/30-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(78,0,'30',4,'image/jpeg',2165,'products/30.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(79,0,'31-1',4,'image/jpeg',2165,'products/31-1.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(80,0,'31',4,'image/jpeg',2165,'products/31.jpg','[]','2022-11-13 00:50:34','2022-11-13 00:50:34',NULL),(81,0,'4-1',4,'image/jpeg',2165,'products/4-1.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(82,0,'4-2',4,'image/jpeg',2165,'products/4-2.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(83,0,'4-3',4,'image/jpeg',2165,'products/4-3.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(84,0,'4',4,'image/jpeg',2165,'products/4.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(85,0,'5-1',4,'image/jpeg',2165,'products/5-1.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(86,0,'5-2',4,'image/jpeg',2165,'products/5-2.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(87,0,'5-3',4,'image/jpeg',2165,'products/5-3.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(88,0,'5',4,'image/jpeg',2165,'products/5.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(89,0,'6-1',4,'image/jpeg',2165,'products/6-1.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(90,0,'6',4,'image/jpeg',2165,'products/6.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(91,0,'7-1',4,'image/jpeg',2165,'products/7-1.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(92,0,'7',4,'image/jpeg',2165,'products/7.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(93,0,'8-1',4,'image/jpeg',2165,'products/8-1.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(94,0,'8',4,'image/jpeg',2165,'products/8.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(95,0,'9-1',4,'image/jpeg',2165,'products/9-1.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(96,0,'9',4,'image/jpeg',2165,'products/9.jpg','[]','2022-11-13 00:50:35','2022-11-13 00:50:35',NULL),(97,0,'1',5,'image/jpeg',2165,'news/1.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(98,0,'10',5,'image/jpeg',2165,'news/10.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(99,0,'11',5,'image/jpeg',2165,'news/11.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(100,0,'2',5,'image/jpeg',2165,'news/2.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(101,0,'3',5,'image/jpeg',2165,'news/3.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(102,0,'4',5,'image/jpeg',2165,'news/4.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(103,0,'5',5,'image/jpeg',2165,'news/5.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(104,0,'6',5,'image/jpeg',2165,'news/6.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(105,0,'7',5,'image/jpeg',2165,'news/7.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(106,0,'8',5,'image/jpeg',2165,'news/8.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(107,0,'9',5,'image/jpeg',2165,'news/9.jpg','[]','2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(108,0,'1',6,'image/jpeg',2165,'testimonials/1.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(109,0,'2',6,'image/jpeg',2165,'testimonials/2.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(110,0,'3',6,'image/jpeg',2165,'testimonials/3.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(111,0,'4',6,'image/jpeg',2165,'testimonials/4.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(112,0,'1',7,'image/jpeg',3063,'sliders/1.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(113,0,'2',7,'image/jpeg',3063,'sliders/2.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(114,0,'3',7,'image/jpeg',3063,'sliders/3.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(115,0,'american-express',8,'image/png',3209,'general/american-express.png','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(116,0,'b-1',8,'image/jpeg',1955,'general/b-1.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(117,0,'b-2',8,'image/jpeg',1955,'general/b-2.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(118,0,'b-3',8,'image/jpeg',1955,'general/b-3.jpg','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(119,0,'discover',8,'image/png',2494,'general/discover.png','[]','2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(120,0,'favicon',8,'image/png',1803,'general/favicon.png','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(121,0,'logo-light',8,'image/png',3736,'general/logo-light.png','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(122,0,'logo',8,'image/png',3927,'general/logo.png','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(123,0,'master-card',8,'image/png',3407,'general/master-card.png','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(124,0,'newsletter',8,'image/jpeg',1248,'general/newsletter.jpg','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(125,0,'paypal',8,'image/png',2670,'general/paypal.png','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(126,0,'visa',8,'image/png',2841,'general/visa.png','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(127,0,'1',9,'image/jpeg',20539,'promotion/1.jpg','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(128,0,'2',9,'image/jpeg',18320,'promotion/2.jpg','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL),(129,0,'3',9,'image/jpeg',42872,'promotion/3.jpg','[]','2022-11-13 00:50:38','2022-11-13 00:50:38',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands','brands',0,'2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(2,0,'product-categories','product-categories',0,'2022-11-13 00:50:30','2022-11-13 00:50:30',NULL),(3,0,'customers','customers',0,'2022-11-13 00:50:31','2022-11-13 00:50:31',NULL),(4,0,'products','products',0,'2022-11-13 00:50:32','2022-11-13 00:50:32',NULL),(5,0,'news','news',0,'2022-11-13 00:50:36','2022-11-13 00:50:36',NULL),(6,0,'testimonials','testimonials',0,'2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(7,0,'sliders','sliders',0,'2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(8,0,'general','general',0,'2022-11-13 00:50:37','2022-11-13 00:50:37',NULL),(9,0,'promotion','promotion',0,'2022-11-13 00:50:38','2022-11-13 00:50:38',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,5,'main-menu','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `reference_id` int unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,1,0,NULL,NULL,'/products',NULL,0,'Products',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,1,0,NULL,NULL,'#',NULL,0,'Shop',NULL,'_self',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,1,3,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Product Category',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,1,3,1,'Botble\\Ecommerce\\Models\\Brand','/brands/fashion-live',NULL,0,'Brand',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(6,1,3,1,'Botble\\Ecommerce\\Models\\ProductTag','/product-tags/electronic',NULL,0,'Product Tag',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(7,1,3,NULL,NULL,'products/beat-headphone',NULL,0,'Product Single',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(8,1,0,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(9,1,8,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog Left Sidebar',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(10,1,8,1,'Botble\\Blog\\Models\\Category','/news/ecommerce',NULL,0,'Blog Category',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(11,1,8,1,'Botble\\Blog\\Models\\Tag','/tags/general',NULL,0,'Blog Tag',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(12,1,8,NULL,NULL,'news/4-expert-tips-on-how-to-choose-the-right-mens-wallet',NULL,0,'Blog Single',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(13,1,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(14,1,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Contact',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(15,2,0,4,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(16,2,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(17,2,0,6,'Botble\\Page\\Models\\Page','/location',NULL,0,'Location',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(18,2,0,7,'Botble\\Page\\Models\\Page','/affiliates',NULL,0,'Affiliates',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(19,2,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Contact',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(20,3,0,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Television',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(21,3,0,2,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/home-audio-theaters',NULL,0,'Mobile',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(22,3,0,3,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/tv-videos',NULL,0,'Headphone',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(23,3,0,4,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/camera-photos-videos',NULL,0,'Watches',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(24,3,0,5,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/cellphones-accessories',NULL,0,'Game',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(25,4,0,NULL,NULL,'/customer/overview',NULL,0,'My profile',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(26,4,0,NULL,NULL,'/wishlist',NULL,0,'Wishlist',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(27,4,0,NULL,NULL,'customer/orders',NULL,0,'Orders',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(28,4,0,NULL,NULL,'/orders/tracking',NULL,0,'Order tracking',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(29,5,0,NULL,NULL,'/',NULL,0,'Trang chủ',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(30,5,0,NULL,NULL,'/products',NULL,0,'Sản phẩm',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(31,5,0,NULL,NULL,'#',NULL,0,'Cửa hàng',NULL,'_self',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(32,5,31,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Danh mục sản phẩm',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(33,5,31,1,'Botble\\Ecommerce\\Models\\Brand','/brands/fashion-live',NULL,0,'Thương hiệu',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(34,5,31,1,'Botble\\Ecommerce\\Models\\ProductTag','/product-tags/electronic',NULL,0,'Tag sản phẩm',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(35,5,31,NULL,NULL,'products/beat-headphone',NULL,0,'Sản phẩm chi tiết',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(36,5,0,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Tin tức',NULL,'_self',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(37,5,36,3,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog Left Sidebar',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(38,5,36,5,'Botble\\Blog\\Models\\Category',NULL,NULL,0,'Danh mục',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(39,5,36,6,'Botble\\Blog\\Models\\Tag',NULL,NULL,0,'Tag bài viết',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(40,5,36,NULL,NULL,'news/vi/4-expert-tips-on-how-to-choose-the-right-mens-wallet',NULL,0,'Bài viết chi tiết',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(41,5,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'FAQ',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(42,5,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Liên hệ',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(43,6,0,4,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Về chúng tôi',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(44,6,0,5,'Botble\\Page\\Models\\Page','/faq',NULL,0,'Hỏi đáp',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(45,6,0,6,'Botble\\Page\\Models\\Page','/location',NULL,0,'Vị trí',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(46,6,0,7,'Botble\\Page\\Models\\Page','/affiliates',NULL,0,'Chi nhánh',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(47,6,0,2,'Botble\\Page\\Models\\Page','/contact-us',NULL,0,'Liên hệ',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(48,7,0,1,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/television',NULL,0,'Tivi',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(49,7,0,2,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/home-audio-theaters',NULL,0,'Di động',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(50,7,0,3,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/tv-videos',NULL,0,'Tai nghe',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(51,7,0,4,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/camera-photos-videos',NULL,0,'Đồng hồ',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(52,7,0,5,'Botble\\Ecommerce\\Models\\ProductCategory','/product-categories/cellphones-accessories',NULL,0,'Trò chơi',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(53,8,0,NULL,NULL,'/customer/overview',NULL,0,'Tài khoản của tôi',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(54,8,0,NULL,NULL,'/wishlist',NULL,0,'Danh sách yêu thích',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(55,8,0,NULL,NULL,'customer/orders',NULL,0,'Đơn hàng',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(56,8,0,NULL,NULL,'/orders/tracking',NULL,0,'Theo dõi đơn hàng',NULL,'_self',0,'2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Useful Links','useful-links','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Categories','categories','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'My Account','my-account','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,'Menu chính','menu-chinh','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(6,'Liên kết hữu ích','lien-ket-huu-ich','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(7,'Danh mục','danh-muc','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(8,'Tài khoản','tai-khoan','published','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"flaticon-tv\"]',1,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(2,'icon','[\"flaticon-responsive\"]',10,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(3,'icon','[\"flaticon-headphones\"]',14,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(4,'icon','[\"flaticon-watch\"]',19,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(5,'icon','[\"flaticon-console\"]',24,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(6,'icon','[\"flaticon-camera\"]',25,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(7,'icon','[\"flaticon-music-system\"]',26,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(8,'icon','[\"flaticon-responsive\"]',27,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(9,'icon','[\"flaticon-plugins\"]',28,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(10,'icon','[\"flaticon-music-system\"]',29,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(11,'icon','[\"flaticon-monitor\"]',30,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(12,'icon','[\"flaticon-printer\"]',31,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(13,'icon','[\"flaticon-tv\"]',32,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(14,'icon','[\"flaticon-fax\"]',33,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(15,'icon','[\"flaticon-mouse\"]',34,'Botble\\Ecommerce\\Models\\ProductCategory','2022-11-13 00:50:31','2022-11-13 00:50:31'),(16,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',1,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(17,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',2,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(18,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',3,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(19,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',4,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(20,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',5,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(21,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',6,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(22,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',7,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(23,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',8,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(24,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',9,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(25,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',10,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(26,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',11,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(27,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',12,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(28,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',13,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(29,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',14,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(30,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',15,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(31,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',16,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(32,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',17,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(33,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',18,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(34,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',19,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(35,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',20,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(36,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',21,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(37,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',22,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(38,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',23,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(39,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',24,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(40,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',25,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(41,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',26,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(42,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',27,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(43,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',28,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(44,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',29,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(45,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',30,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(46,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',31,'Botble\\Ecommerce\\Models\\Product','2022-11-13 00:50:35','2022-11-13 00:50:35'),(47,'button_text','[\"Shop now\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-11-13 00:50:37','2022-11-13 00:50:37'),(48,'button_text','[\"Discover now\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-11-13 00:50:37','2022-11-13 00:50:37'),(49,'button_text','[\"Shop now\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-11-13 00:50:37','2022-11-13 00:50:37'),(50,'button_text','[\"Mua ngay\"]',4,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-11-13 00:50:37','2022-11-13 00:50:37'),(51,'button_text','[\"Kh\\u00e1m ph\\u00e1 ngay\"]',5,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-11-13 00:50:37','2022-11-13 00:50:37'),(52,'button_text','[\"Mua ngay\"]',6,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_10_14_024629_drop_column_is_featured',1),(21,'2020_11_18_150916_ads_create_ads_table',2),(22,'2021_12_02_035301_add_ads_translations_table',2),(23,'2015_06_29_025744_create_audit_history',3),(24,'2015_06_18_033822_create_blog_table',4),(25,'2021_02_16_092633_remove_default_value_for_author_type',4),(26,'2021_12_03_030600_create_blog_translations',4),(27,'2022_04_19_113923_add_index_to_table_posts',4),(28,'2016_06_17_091537_create_contacts_table',5),(29,'2020_03_05_041139_create_ecommerce_tables',6),(30,'2021_01_01_044147_ecommerce_create_flash_sale_table',6),(31,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',6),(32,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',6),(33,'2021_02_18_073505_update_table_ec_reviews',6),(34,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',6),(35,'2021_03_10_025153_change_column_tax_amount',6),(36,'2021_03_20_033103_add_column_availability_to_table_ec_products',6),(37,'2021_04_28_074008_ecommerce_create_product_label_table',6),(38,'2021_05_31_173037_ecommerce_create_ec_products_translations',6),(39,'2021_06_28_153141_correct_slugs_data',6),(40,'2021_08_17_105016_remove_column_currency_id_in_some_tables',6),(41,'2021_08_30_142128_add_images_column_to_ec_reviews_table',6),(42,'2021_09_01_115151_remove_unused_fields_in_ec_products',6),(43,'2021_10_04_030050_add_column_created_by_to_table_ec_products',6),(44,'2021_10_05_122616_add_status_column_to_ec_customers_table',6),(45,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',6),(46,'2021_11_23_071403_correct_languages_for_product_variations',6),(47,'2021_11_28_031808_add_product_tags_translations',6),(48,'2021_12_01_031123_add_featured_image_to_ec_products',6),(49,'2022_01_01_033107_update_table_ec_shipments',6),(50,'2022_02_16_042457_improve_product_attribute_sets',6),(51,'2022_03_22_075758_correct_product_name',6),(52,'2022_04_19_113334_add_index_to_ec_products',6),(53,'2022_04_28_144405_remove_unused_table',6),(54,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',6),(55,'2022_05_18_143720_add_index_to_table_ec_product_categories',6),(56,'2022_06_16_095633_add_index_to_some_tables',6),(57,'2022_06_30_035148_create_order_referrals_table',6),(58,'2022_07_24_153815_add_completed_at_to_ec_orders_table',6),(59,'2022_08_14_032836_create_ec_order_returns_table',6),(60,'2022_08_14_033554_create_ec_order_return_items_table',6),(61,'2022_08_15_040324_add_billing_address',6),(62,'2022_08_30_091114_support_digital_products_table',6),(63,'2022_09_13_095744_create_options_table',6),(64,'2022_09_13_104347_create_option_value_table',6),(65,'2022_10_05_163518_alter_table_ec_order_product',6),(66,'2022_10_12_041517_create_invoices_table',6),(67,'2022_10_12_142226_update_orders_table',6),(68,'2022_10_13_024916_update_table_order_returns',6),(69,'2022_10_21_030830_update_columns_in_ec_shipments_table',6),(70,'2018_07_09_221238_create_faq_table',7),(71,'2021_12_03_082134_create_faq_translations',7),(72,'2016_10_03_032336_create_languages_table',8),(73,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(74,'2021_12_03_075608_create_page_translations',9),(75,'2019_11_18_061011_create_country_table',10),(76,'2021_12_03_084118_create_location_translations',10),(77,'2021_12_03_094518_migrate_old_location_data',10),(78,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',10),(79,'2022_01_16_085908_improve_plugin_location',10),(80,'2022_08_04_052122_delete_location_backup_tables',10),(81,'2022_10_29_065232_increase_states_abbreviation_column',10),(82,'2022_11_06_061847_increase_state_translations_abbreviation_column',10),(83,'2017_10_24_154832_create_newsletter_table',11),(84,'2017_05_18_080441_create_payment_tables',12),(85,'2021_03_27_144913_add_customer_type_into_table_payments',12),(86,'2021_05_24_034720_make_column_currency_nullable',12),(87,'2021_08_09_161302_add_metadata_column_to_payments_table',12),(88,'2021_10_19_020859_update_metadata_field',12),(89,'2022_06_28_151901_activate_paypal_stripe_plugin',12),(90,'2022_07_07_153354_update_charge_id_in_table_payments',12),(91,'2017_07_11_140018_create_simple_slider_table',13),(92,'2018_07_09_214610_create_testimonial_table',14),(93,'2021_12_03_083642_create_testimonials_translations',14),(94,'2016_10_07_193005_create_translations_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage','<div>[simple-slider key=\"home-slider\"][/simple-slider]</div><div>[featured-product-categories title=\"Top Categories\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[flash-sale title=\"Best deals for you\"][/flash-sale]</div><div>[product-collections title=\"Exclusive Products\"][/product-collections]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[trending-products title=\"Trending Products\"][/trending-products]</div><div>[product-blocks featured_product_title=\"Featured Products\" top_rated_product_title=\"Top Rated Products\" on_sale_product_title=\"On Sale Products\"][/product-blocks]</div><div>[featured-brands title=\"Our Brands\"][/featured-brands]</div><div>[featured-news title=\"Visit Our Blog\" subtitle=\"Our Blog updated the newest trend of the world regularly\"][/featured-news]</div><div>[testimonials title=\"Our Client Say!\"][/testimonials]</div><div>[our-features icon1=\"flaticon-shipped\" title1=\"Free Delivery\" subtitle1=\"Free shipping on all US order or order above $200\" icon2=\"flaticon-money-back\" title2=\"30 Day Returns Guarantee\" subtitle2=\"Simply return it within 30 days for an exchange\" icon3=\"flaticon-support\" title3=\"27/4 Online Support\" subtitle3=\"Contact us 24 hours a day, 7 days a week\"][/our-features]</div><div>[newsletter-form title=\"Join Our Newsletter Now\" subtitle=\"Register now to get updates on promotions.\"][/newsletter-form]</div>',1,NULL,'homepage',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Contact us','<p>[contact-form][/contact-form]</p>',1,NULL,'default',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Blog','<p>---</p>',1,NULL,'blog-sidebar',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'About us','<p>Alice, \'I\'ve often seen them at last, and they repeated their arguments to her, And mentioned me to him: She gave me a pair of white kid gloves and the others took the watch and looked at it uneasily, shaking it every now and then a row of lodging houses, and behind it, it occurred to her great delight it fitted! Alice opened the door between us. For instance, suppose it were white, but there was no longer to be ashamed of yourself for asking such a fall as this, I shall fall right THROUGH the.</p>',1,NULL,'default',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,'FAQ','<div>[faqs][/faqs]</div>',1,NULL,'default',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(6,'Location','<p>Alice thought to herself what such an extraordinary ways of living would be very likely it can talk: at any rate,\' said Alice: \'allow me to sell you a song?\' \'Oh, a song, please, if the Queen furiously, throwing an inkstand at the righthand bit again, and that\'s all the rest of the month is it?\' he said, \'on and off, for days and days.\' \'But what did the archbishop find?\' The Mouse did not much surprised at her side. She was a most extraordinary noise going on between the executioner, the.</p>',1,NULL,'default',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(7,'Affiliates','<p>The poor little thing sobbed again (or grunted, it was an old crab, HE was.\' \'I never went to the little creature down, and nobody spoke for some time after the candle is blown out, for she was ready to talk about cats or dogs either, if you want to go! Let me see: I\'ll give them a new idea to Alice, and tried to open it; but, as the hall was very uncomfortable, and, as the Dormouse turned out, and, by the end of your nose-- What made you so awfully clever?\' \'I have answered three questions.</p>',1,NULL,'default',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(8,'Brands','<p>[all-brands][/all-brands]</p>',1,NULL,'default',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
INSERT INTO `pages_translations` VALUES ('vi',1,'Trang chủ',NULL,'<div>[simple-slider key=\"slider-trang-chu\"][/simple-slider]</div><div>[featured-product-categories title=\"Danh mục nổi bật\" subtitle=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus blandit massa enim Nullam nunc varius.\"][/featured-product-categories]</div><div>[flash-sale title=\"Khuyến mãi tốt nhất cho bạn\"][/flash-sale]</div><div>[product-collections title=\"Sản phẩm độc quyền\"][/product-collections]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[trending-products title=\"Sản phẩm xu hướng\"][/trending-products]</div><div>[product-blocks featured_product_title=\"Nổi bật\" top_rated_product_title=\"Xếp hạng cao nhất\" on_sale_product_title=\"Đang khuyến mãi\"][/product-blocks]</div><div>[featured-brands title=\"Thương hiệu\"][/featured-brands]</div><div>[featured-news title=\"Tin tức\" subtitle=\"Blog của chúng tôi cập nhật các xu hướng mới nhất của thế giới thường xuyên\"][/featured-news]</div><div>[testimonials title=\"Nhận xét từ khách hàng!\"][/testimonials]</div><div>[our-features icon1=\"flaticon-shipped\" title1=\"Miễn phí vận chuyển\" subtitle1=\"Giao hàng miễn phí cho tất cả các đơn đặt hàng tại Hoa Kỳ hoặc đơn hàng trên $200\" icon2=\"flaticon-money-back\" title2=\"Đảm bảo hoàn trả trong 30 ngày\" subtitle2=\"Chỉ cần trả lại nó trong vòng 30 ngày để đổi\" icon3=\"flaticon-support\" title3=\"Hỗ trợ trực tuyến 27/4\" subtitle3=\"Liên hệ với chúng tôi 24 giờ một ngày, 7 ngày một tuần\"][/our-features]</div><div>[newsletter-form title=\"Theo dõi bản tin ngay bây giờ\" subtitle=\"Đăng ký ngay để cập nhật các chương trình khuyến mãi.\"][/newsletter-form]</div>'),('vi',2,'Liên hệ',NULL,'<p>[contact-form][/contact-form]</p>'),('vi',3,'Tin tức',NULL,'<p>---</p>'),('vi',4,'Về chúng tôi',NULL,'<p>Queen\'s voice in the same thing as \"I get what I say--that\'s the same thing with you,\' said the Mouse. \'Of course,\' the Mock Turtle yet?\' \'No,\' said the King. \'When did you do either!\' And the muscular strength, which it gave to my boy, I beat him when he sneezes; For he can EVEN finish, if he had come back in a large cauldron which seemed to Alice an excellent opportunity for repeating his remark, with variations. \'I shall sit here,\' the Footman remarked, \'till tomorrow--\' At this the whole.</p>'),('vi',5,'Câu hỏi thường gặp',NULL,'<div>[faqs][/faqs]</div>'),('vi',6,'Vị trí',NULL,'<p>I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, seriously, \'I\'ll have nothing more to come, so she turned the corner, but the Hatter were having tea at it: a Dormouse was sitting on a little scream, half of anger, and tried to speak, but for a conversation. \'You don\'t know much,\' said the Caterpillar seemed to her that she had sat down again in a twinkling! Half-past one, time for dinner!\' (\'I only wish people knew that: then they both sat silent and looked.</p>'),('vi',7,'Chi nhánh',NULL,'<p>Mock Turtle, and to stand on their faces, so that her neck would bend about easily in any direction, like a sky-rocket!\' \'So you think you can have no sort of a well?\' The Dormouse again took a minute or two the Caterpillar took the opportunity of taking it away. She did not venture to go among mad people,\' Alice remarked. \'Right, as usual,\' said the Queen. \'Never!\' said the sage, as he came, \'Oh! the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve been changed for Mabel! I\'ll try if I.</p>'),('vi',8,'Thương hiệu',NULL,'<p>[all-brands][/all-brands]</p>'),('vi',9,'Chính sách cookie',NULL,'<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>');
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` int unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',0,'A0A9DEVBHC','paypal',NULL,703.50,1,'completed','confirm',11,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(2,'USD',0,'S1M77F4GF7','paypal',NULL,336.38,2,'completed','confirm',6,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(3,'USD',0,'MAAFWTYBBK','paypal',NULL,680.40,3,'completed','confirm',8,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(4,'USD',0,'MTT7QYBKKP','razorpay',NULL,703.20,4,'completed','confirm',3,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(5,'USD',0,'ACMBOI5DJR','stripe',NULL,223.65,5,'completed','confirm',11,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(6,'USD',0,'IRB2ODPQWL','paystack',NULL,992.15,6,'completed','confirm',7,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(7,'USD',0,'XUG91FXCLW','paypal',NULL,769.80,7,'completed','confirm',9,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(8,'USD',0,'V1KVG7FIVY','cod',NULL,762.60,8,'pending','confirm',9,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(9,'USD',0,'E83GRPD3SA','paypal',NULL,860.18,9,'completed','confirm',11,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(10,'USD',0,'4HPASKLDYO','mollie',NULL,609.20,10,'completed','confirm',8,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(11,'USD',0,'DMF5AFMYL1','razorpay',NULL,1401.20,11,'completed','confirm',6,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(12,'USD',0,'EKYX6NBN30','paystack',NULL,548.10,12,'completed','confirm',4,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(13,'USD',0,'JK8ADEIDSM','mollie',NULL,217.05,13,'completed','confirm',10,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(14,'USD',0,'ALAX0JDAT9','mollie',NULL,367.00,14,'completed','confirm',9,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(15,'USD',0,'G2VQNQDVXB','stripe',NULL,938.50,15,'completed','confirm',1,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(16,'USD',0,'UMACZ1DSNH','paystack',NULL,706.30,16,'completed','confirm',4,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(17,'USD',0,'TQGWFWUQRD','stripe',NULL,964.80,17,'completed','confirm',4,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(18,'USD',0,'UP1TOUR757','paypal',NULL,698.20,18,'completed','confirm',9,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(19,'USD',0,'QJBEP7L7ZF','paypal',NULL,1219.90,19,'completed','confirm',6,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL),(20,'USD',0,'FBYXBLCRDZ','bank_transfer',NULL,750.50,20,'pending','confirm',6,NULL,NULL,'2022-11-13 00:50:36','2022-11-13 00:50:36','Botble\\Ecommerce\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1,1),(2,3,1),(3,1,2),(4,3,2),(5,2,3),(6,3,3),(7,1,4),(8,3,4),(9,2,5),(10,4,5),(11,2,6),(12,4,6),(13,1,7),(14,4,7),(15,2,8),(16,3,8),(17,2,9),(18,4,9),(19,1,10),(20,3,10),(21,2,11),(22,3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tag_id` int unsigned NOT NULL,
  `post_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,1,2),(7,2,2),(8,3,2),(9,4,2),(10,5,2),(11,1,3),(12,2,3),(13,3,3),(14,4,3),(15,5,3),(16,1,4),(17,2,4),(18,3,4),(19,4,4),(20,5,4),(21,1,5),(22,2,5),(23,3,5),(24,4,5),(25,5,5),(26,1,6),(27,2,6),(28,3,6),(29,4,6),(30,5,6),(31,1,7),(32,2,7),(33,3,7),(34,4,7),(35,5,7),(36,1,8),(37,2,8),(38,3,8),(39,4,8),(40,5,8),(41,1,9),(42,2,9),(43,3,9),(44,4,9),(45,5,9),(46,1,10),(47,2,10),(48,3,10),(49,4,10),(50,5,10),(51,1,11),(52,2,11),(53,3,11),(54,4,11),(55,5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `author_id` (`author_id`),
  KEY `author_type` (`author_type`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',1208,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Sexy Clutches: How to Buy & Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',758,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',270,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1801,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',2404,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',1817,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',1102,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',199,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',1349,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/10.jpg',1815,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',1979,NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
INSERT INTO `posts_translations` VALUES ('vi',1,'4 Lời khuyên của Chuyên gia về Cách Chọn Ví Nam Phù hợp','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',2,'Sexy Clutches: Cách Mua & Đeo Túi Clutch Thiết kế','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',3,'Xu hướng túi xách hàng đầu năm 2020 cần biết','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',4,'Cách Phối Màu Túi Xách Của Bạn Với Trang Phục','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',5,'Cách Chăm sóc Túi Da','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',6,'Chúng tôi đang nghiền ngẫm 10 xu hướng túi lớn nhất của mùa hè','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',7,'Những phẩm chất cần thiết của âm nhạc thành công cao','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',8,'9 điều tôi thích khi cạo đầu','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',9,'Tại sao làm việc theo nhóm thực sự biến giấc mơ thành công','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',10,'Thế giới phục vụ cho những người trung bình','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n'),('vi',11,'Các đương sự trên màn hình không phải là diễn viên','Bạn nên chú ý hơn khi chọn ví. Có rất nhiều trong số chúng trên thị trường với các mẫu mã và phong cách khác nhau. Khi bạn lựa chọn cẩn thận, bạn sẽ có thể mua một chiếc ví phù hợp với nhu cầu của bạn. Chưa kể nó sẽ giúp nâng tầm phong cách của bạn một cách đáng kể.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n');
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `updated_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\",\"mollie\"]',NULL,'2022-11-13 00:50:30'),(4,'language_hide_default','1',NULL,NULL),(5,'language_switcher_display','dropdown',NULL,NULL),(6,'language_display','all',NULL,NULL),(7,'language_hide_languages','[]',NULL,NULL),(8,'media_random_hash','c678504a510068756a7c3709a01c4c67',NULL,NULL),(9,'simple_slider_using_assets','0',NULL,NULL),(10,'permalink-botble-blog-models-post','news',NULL,NULL),(11,'permalink-botble-blog-models-category','news',NULL,NULL),(12,'permalink-botble-blog-models-tag','tags',NULL,NULL),(13,'payment_cod_status','1',NULL,NULL),(14,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(15,'payment_bank_transfer_status','1',NULL,NULL),(16,'payment_bank_transfer_description','Please send money to our bank account: ACB - 8210 4345 19.',NULL,NULL),(17,'plugins_ecommerce_customer_new_order_status','0',NULL,NULL),(18,'plugins_ecommerce_admin_new_order_status','0',NULL,NULL),(22,'New York','Singapore',NULL,NULL),(24,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,NULL),(25,'payment_stripe_payment_type','stripe_checkout',NULL,NULL),(26,'ecommerce_is_enabled_support_digital_products','1',NULL,NULL),(28,'ecommerce_store_name','Shopwise',NULL,NULL),(29,'ecommerce_store_phone','123-456-7890',NULL,NULL),(30,'ecommerce_store_address','123 Street, Old Trafford',NULL,NULL),(31,'ecommerce_store_state','New York',NULL,NULL),(32,'ecommerce_store_city','New York',NULL,NULL),(33,'ecommerce_store_country','US',NULL,NULL),(34,'admin_logo','general/logo-light.png',NULL,NULL),(35,'admin_favicon','general/favicon.png',NULL,NULL),(36,'theme','shopwise',NULL,NULL),(37,'theme-shopwise-site_title','Shopwise - Laravel Ecommerce system',NULL,NULL),(38,'theme-shopwise-copyright','© 2022 Botble Technologies. All Rights Reserved.',NULL,NULL),(39,'theme-shopwise-favicon','general/favicon.png',NULL,NULL),(40,'theme-shopwise-logo','general/logo.png',NULL,NULL),(41,'theme-shopwise-logo_footer','general/logo-light.png',NULL,NULL),(42,'theme-shopwise-address','123 Street, Old Trafford, NewYork, USA',NULL,NULL),(43,'theme-shopwise-hotline','123-456-7890',NULL,NULL),(44,'theme-shopwise-email','info@sitename.com',NULL,NULL),(45,'theme-shopwise-payment_methods','[\"general\\/visa.png\",\"general\\/paypal.png\",\"general\\/master-card.png\",\"general\\/discover.png\",\"general\\/american-express.png\"]',NULL,NULL),(46,'theme-shopwise-newsletter_image','general/newsletter.jpg',NULL,NULL),(47,'theme-shopwise-homepage_id','1',NULL,NULL),(48,'theme-shopwise-blog_page_id','3',NULL,NULL),(49,'theme-shopwise-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(50,'theme-shopwise-cookie_consent_learn_more_url','https://shopwise.test/cookie-policy',NULL,NULL),(51,'theme-shopwise-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(52,'theme-shopwise-about-us','If you are going to use of Lorem Ipsum need to be sure there isn\'t hidden of text',NULL,NULL),(53,'theme-shopwise-vi-primary_font','Roboto Condensed',NULL,NULL),(54,'theme-shopwise-vi-copyright','© 2021 Botble Technologies. Tất cả quyền đã được bảo hộ.',NULL,NULL),(55,'theme-shopwise-vi-cookie_consent_message','Trải nghiệm của bạn trên trang web này sẽ được cải thiện bằng cách cho phép cookie ',NULL,NULL),(56,'theme-shopwise-vi-cookie_consent_learn_more_url','https://shopwise.test/cookie-policy',NULL,NULL),(57,'theme-shopwise-vi-cookie_consent_learn_more_text','Chính sách cookie',NULL,NULL),(58,'theme-shopwise-vi-homepage_id','1',NULL,NULL),(59,'theme-shopwise-vi-blog_page_id','3',NULL,NULL),(60,'theme-shopwise-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"ion-social-facebook\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#3b5998\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"ion-social-twitter\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#00acee\"}],[{\"key\":\"social-name\",\"value\":\"Youtube\"},{\"key\":\"social-icon\",\"value\":\"ion-social-youtube\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#c4302b\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"ion-social-instagram\"},{\"key\":\"social-url\",\"value\":\"\"},{\"key\":\"social-color\",\"value\":\"#3f729b\"}]]',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` int unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Woman Fashion','sliders/1.jpg',NULL,'Get up to 50% off Today Only!',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,1,'Man Fashion','sliders/2.jpg',NULL,'50% off in all products',2,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,1,'Summer Sale','sliders/3.jpg',NULL,'Taking your Viewing Experience to Next Level',3,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,2,'Thời trang Nam','sliders/1.jpg',NULL,'Được giảm giá tới 50% Chỉ hôm nay!',1,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,2,'Thời trang Nữ','sliders/2.jpg',NULL,'Khuyến mãi 50% tất cả sản phẩm',2,'2022-11-13 00:50:37','2022-11-13 00:50:37'),(6,2,'Khuyến mãi hè','sliders/3.jpg',NULL,'Nâng trải nghiệm xem của bạn lên cấp độ tiếp theo',3,'2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Slider trang chủ','slider-trang-chu',NULL,'published','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'fashion-live',1,'Botble\\Ecommerce\\Models\\Brand','brands','2022-11-13 00:50:30','2022-11-13 00:50:30'),(2,'hand-crafted',2,'Botble\\Ecommerce\\Models\\Brand','brands','2022-11-13 00:50:30','2022-11-13 00:50:30'),(3,'mestonix',3,'Botble\\Ecommerce\\Models\\Brand','brands','2022-11-13 00:50:30','2022-11-13 00:50:30'),(4,'sunshine',4,'Botble\\Ecommerce\\Models\\Brand','brands','2022-11-13 00:50:30','2022-11-13 00:50:30'),(5,'pure',5,'Botble\\Ecommerce\\Models\\Brand','brands','2022-11-13 00:50:30','2022-11-13 00:50:30'),(6,'anfold',6,'Botble\\Ecommerce\\Models\\Brand','brands','2022-11-13 00:50:30','2022-11-13 00:50:30'),(7,'automotive',7,'Botble\\Ecommerce\\Models\\Brand','brands','2022-11-13 00:50:30','2022-11-13 00:50:30'),(8,'television',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:30','2022-11-13 00:50:30'),(9,'home-audio-theaters',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(10,'tv-videos',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(11,'camera-photos-videos',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(12,'cellphones-accessories',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(13,'headphones',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(14,'videos-games',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(15,'wireless-speakers',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(16,'office-electronic',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(17,'mobile',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(18,'digital-cables',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(19,'audio-video-cables',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(20,'batteries',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(21,'headphone',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(22,'computer-tablets',15,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(23,'laptop',16,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(24,'monitors',17,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(25,'computer-components',18,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(26,'watches',19,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(27,'drive-storages',20,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(28,'gaming-laptop',21,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(29,'security-protection',22,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(30,'accessories',23,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(31,'game',24,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(32,'camera',25,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(33,'audio',26,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(34,'mobile-tablet',27,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(35,'accessories',28,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(36,'home-audio-theater',29,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(37,'tv-smart-box',30,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(38,'printer',31,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(39,'computer',32,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(40,'fax-machine',33,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(41,'mouse',34,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2022-11-13 00:50:31','2022-11-13 00:50:31'),(42,'smart-home-speaker',1,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(43,'headphone-ultra-bass',2,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(44,'boxed-bluetooth-headphone',3,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(45,'chikie-bluetooth-speaker',4,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(46,'camera-hikvision-hk-35vs8',5,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(47,'camera-samsung-ss-24',6,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(48,'leather-watch-band',7,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(49,'apple-iphone-13-plus',8,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(50,'macbook-pro-2015',9,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(51,'macbook-air-12-inch',10,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(52,'apple-watch-serial-7',11,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(53,'macbook-pro-13-inch',12,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(54,'apple-keyboard',13,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(55,'macsafe-80w',14,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(56,'hand-playstation',15,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(57,'apple-airpods-serial-3',16,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(58,'cool-smart-watches',17,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(59,'black-smart-watches',18,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(60,'leather-watch-band-serial-3',19,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(61,'macbook-pro-2015-13-inch',20,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(62,'historic-alarm-clock',21,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(63,'black-glasses',22,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(64,'phillips-mouse',23,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(65,'gaming-keyboard',24,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(66,'dual-camera-20mp',25,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(67,'smart-watches',26,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(68,'beat-headphone',27,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(69,'red-black-headphone',28,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(70,'audio-equipment',29,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(71,'smart-televisions',30,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(72,'samsung-smart-tv',31,'Botble\\Ecommerce\\Models\\Product','products','2022-11-13 00:50:35','2022-11-13 00:50:35'),(73,'electronic',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-11-13 00:50:36','2022-11-13 00:50:36'),(74,'mobile',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-11-13 00:50:36','2022-11-13 00:50:36'),(75,'iphone',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-11-13 00:50:36','2022-11-13 00:50:36'),(76,'printer',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-11-13 00:50:36','2022-11-13 00:50:36'),(77,'office',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-11-13 00:50:36','2022-11-13 00:50:36'),(78,'it',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2022-11-13 00:50:36','2022-11-13 00:50:36'),(79,'ecommerce',1,'Botble\\Blog\\Models\\Category','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(80,'fashion',2,'Botble\\Blog\\Models\\Category','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(81,'electronic',3,'Botble\\Blog\\Models\\Category','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(82,'commercial',4,'Botble\\Blog\\Models\\Category','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(83,'general',1,'Botble\\Blog\\Models\\Tag','tags','2022-11-13 00:50:37','2022-11-13 00:50:37'),(84,'design',2,'Botble\\Blog\\Models\\Tag','tags','2022-11-13 00:50:37','2022-11-13 00:50:37'),(85,'fashion',3,'Botble\\Blog\\Models\\Tag','tags','2022-11-13 00:50:37','2022-11-13 00:50:37'),(86,'branding',4,'Botble\\Blog\\Models\\Tag','tags','2022-11-13 00:50:37','2022-11-13 00:50:37'),(87,'modern',5,'Botble\\Blog\\Models\\Tag','tags','2022-11-13 00:50:37','2022-11-13 00:50:37'),(88,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(89,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(90,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(91,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(92,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(93,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(94,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(95,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(96,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(97,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(98,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','news','2022-11-13 00:50:37','2022-11-13 00:50:37'),(99,'homepage',1,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(100,'contact-us',2,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(101,'blog',3,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(102,'about-us',4,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(103,'faq',5,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(104,'location',6,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(105,'affiliates',7,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(106,'brands',8,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37'),(107,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  `author_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User','','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Design',1,'Botble\\ACL\\Models\\User','','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Fashion',1,'Botble\\ACL\\Models\\User','','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'Branding',1,'Botble\\ACL\\Models\\User','','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,'Modern',1,'Botble\\ACL\\Models\\User','','published','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
INSERT INTO `tags_translations` VALUES ('vi',1,'Chung',NULL),('vi',2,'Thiết kế',NULL),('vi',3,'Thời trang',NULL),('vi',4,'Thương hiệu',NULL),('vi',5,'Hiện đại',NULL);
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Adam Williams','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/1.jpg','CEO Of Microsoft','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'Retha Deowalim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/2.jpg','CEO Of Apple','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'Sam J. Wasim','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/3.jpg','Pio Founder','published','2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'Usan Gulwarm','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua','testimonials/4.jpg','CEO Of Facewarm','published','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
INSERT INTO `testimonials_translations` VALUES ('vi',1,'Adam Williams',NULL,'Giám đốc Microsoft'),('vi',2,'Retha Deowalim',NULL,'Giám đốc Apple'),('vi',3,'Sam J. Wasim',NULL,'Nhà sáng lập Pio'),('vi',4,'Usan Gulwarm',NULL,'Giám đốc Facewarm');
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL DEFAULT '0',
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4929 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@botble.com',NULL,'$2y$10$29TOc9SWVaJTY.LWXutDQeoMRrAlwG8u2wESdP4cmFd9ks6mhVoGS',NULL,'2022-11-13 00:50:37','2022-11-13 00:50:37','System','Admin','botble',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','shopwise',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}','2022-11-13 00:50:37','2022-11-13 00:50:37'),(2,'CustomMenuWidget','footer_sidebar','shopwise',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Categories\",\"menu_id\":\"categories\"}','2022-11-13 00:50:37','2022-11-13 00:50:37'),(3,'CustomMenuWidget','footer_sidebar','shopwise',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"My Account\",\"menu_id\":\"my-account\"}','2022-11-13 00:50:37','2022-11-13 00:50:37'),(4,'CustomMenuWidget','footer_sidebar','shopwise-vi',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Li\\u00ean k\\u1ebft h\\u1eefu \\u00edch\",\"menu_id\":\"lien-ket-huu-ich\"}','2022-11-13 00:50:37','2022-11-13 00:50:37'),(5,'CustomMenuWidget','footer_sidebar','shopwise-vi',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Danh m\\u1ee5c\",\"menu_id\":\"danh-muc\"}','2022-11-13 00:50:37','2022-11-13 00:50:37'),(6,'CustomMenuWidget','footer_sidebar','shopwise-vi',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"T\\u00e0i kho\\u1ea3n\",\"menu_id\":\"tai-khoan\"}','2022-11-13 00:50:37','2022-11-13 00:50:37');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-13 14:50:55
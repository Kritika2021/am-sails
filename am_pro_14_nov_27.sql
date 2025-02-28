-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (x86_64)
--
-- Host: localhost    Database: astro_mihir_pro
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email_id` varchar(45) NOT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `admin_type` enum('SUB_ADMIN','SUPER_ADMIN') DEFAULT 'SUB_ADMIN',
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint DEFAULT '0',
  `deleted_on` timestamp NULL DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `profile_pic` varchar(200) DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `fcm_token` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (172,'astromihirr@gmail.com','astromihirr@gmail.com','9886219081','SUPER_ADMIN','2021-06-15 15:04:01',0,NULL,'$2b$13$CG72SpJ1nTlqFdb6WzJfceETsn7UBdjTSXKf2cpJgp6SGJguuYGw.',NULL,'Astro Mihir',NULL),(173,'welcomekritika@gmail.com','welcomekritika@gmail.com','9871204026','SUB_ADMIN','2022-07-05 04:33:32',0,NULL,'$2b$13$ATXkuJhO.vpuFkTB7UP3xeypndnTPCWNwF5VGKFP/TudeARKv/dWq',NULL,'kohli kritika',NULL),(174,'welcomekritika@yahoo.com','welcomekritika@yahoo.com','9871204024','SUB_ADMIN','2022-09-07 07:11:28',0,NULL,'$2b$13$qu83xCTTESoZM5CjJd428OHrWgm.CThWN1MvQjc7l7KvQy/YplfJq',NULL,'Test Admin',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation_media`
--

DROP TABLE IF EXISTS `conversation_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_media` (
  `media_id` bigint NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint NOT NULL,
  `media_url` varchar(500) NOT NULL,
  `is_deleted` tinyint DEFAULT '0',
  `media_type` enum('IMAGE','PDF','DOC') NOT NULL,
  `media_subtype` varchar(45) DEFAULT NULL,
  `deleted_on` timestamp NULL DEFAULT NULL,
  `added_by` bigint NOT NULL,
  `user_type` enum('USER','ADMIN') NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `file_name` varchar(200) DEFAULT NULL,
  `file_size` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`media_id`),
  KEY `fk_conversation_media_1_idx` (`conversation_id`),
  CONSTRAINT `fk_conversation_media_1` FOREIGN KEY (`conversation_id`) REFERENCES `question_converstations` (`question_converstation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation_media`
--

LOCK TABLES `conversation_media` WRITE;
/*!40000 ALTER TABLE `conversation_media` DISABLE KEYS */;
INSERT INTO `conversation_media` VALUES (243,2143,'https://astromihir.s3.amazonaws.com/production_storage/conversation_media/172_2022-01-11T19:42:03.126Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2022-01-11 19:42:03','Screenshot 2022-01-11 at 9.44.58 PM.png','211 KB'),(244,2182,'https://astromihir.s3.amazonaws.com/production_storage/conversation_media/74_2022-12-14T05:09:07.733Z.jpeg',0,'IMAGE','jpeg',NULL,74,'USER','2022-12-14 05:09:07','WhatsApp Image 2022-02-07 at 8.48.16 PM.jpeg','172 KB'),(245,2183,'https://astromihir.s3.amazonaws.com/production_storage/conversation_media/172_2022-12-15T05:27:47.494Z.jpeg',0,'IMAGE','jpeg',NULL,172,'ADMIN','2022-12-15 05:27:47','WhatsApp Image 2022-02-17 at 5.08.17 PM (2).jpeg','121 KB'),(246,2185,'https://astromihir.s3.amazonaws.com/production_storage/conversation_media/172_2022-12-15T12:55:13.899Z.jpeg',0,'IMAGE','jpeg',NULL,172,'ADMIN','2022-12-15 12:55:13','WhatsApp Image 2022-02-17 at 5.08.17 PM.jpeg','139 KB'),(247,2186,'https://astromihir.s3.amazonaws.com/production_storage/conversation_media/172_2022-12-15T13:14:55.566Z.jpeg',0,'IMAGE','jpeg',NULL,172,'ADMIN','2022-12-15 13:14:55','WhatsApp Image 2022-02-04 at 11.01.06 PM.jpeg','186 KB'),(248,2195,'https://novateur.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T13:56:35.285Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 13:56:35','logo_orange_background_R_padding_w512.png','17 KB'),(249,2196,'https://novateur.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T14:01:58.124Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 14:01:58','logo_orange_background_R_padding_w150.png','4 KB'),(250,2197,'https://novateur.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T14:04:38.527Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 14:04:38','logo_transparent_R_full.png','136 KB'),(251,2198,'https://novateur.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T14:11:43.122Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 14:11:43','logo_transparent_R_full.png','136 KB'),(252,2199,'https://astromihir.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T14:13:34.219Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 14:13:34','logo_orange_background_R_padding_w150.png','4 KB'),(253,2200,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T14:16:31.181Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 14:16:31','logo_orange_background_R_padding_w512.png','17 KB'),(254,2201,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T14:32:40.915Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 14:32:41','logo_orange_background_R_padding_w150.png','4 KB'),(255,2202,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T14:35:06.618Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 14:35:06','logo_orange_background_R_padding_w150.png','4 KB'),(256,2203,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/172_2023-11-05T15:12:55.658Z.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 15:12:55','logo_transparent_full_square_tm.png','253 KB'),(257,2204,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/172_582eb31a-b42e-420c-91d0-2f5939856eaa.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 15:18:56','logo_transparent_full_square_tm.png','253 KB'),(258,2206,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/172_fa6e6e77-943c-4a30-81f4-88458358075a.png',0,'IMAGE','png',NULL,172,'ADMIN','2023-11-05 15:20:13','logo_transparent_R_40px.png','5 KB'),(259,2209,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/72_dcffbb31-a63a-4c1f-80c4-07395ffd8e65.pdf',0,'PDF','pdf',NULL,72,'USER','2023-11-09 18:32:25','Livraison n°BL-2023-5 (1).pdf','331 KB'),(260,2213,'https://astromihir-public-doc.s3.amazonaws.com/production_storage/conversation_media/172_31fae382-4bfd-42bf-96e3-963722a658a2.jpg',0,'IMAGE','jpg',NULL,172,'ADMIN','2024-02-06 11:50:55','Screenshot_2023-12-23-10-52-02-376_com.miui.home.jpg','984 KB');
/*!40000 ALTER TABLE `conversation_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `converstation_read`
--

DROP TABLE IF EXISTS `converstation_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `converstation_read` (
  `read_id` bigint NOT NULL AUTO_INCREMENT,
  `conversation_id` bigint NOT NULL,
  `read_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `read_by` bigint NOT NULL,
  PRIMARY KEY (`read_id`),
  KEY `fk_converstation_read_1_idx` (`conversation_id`),
  KEY `fk_converstation_read_2_idx` (`read_by`),
  CONSTRAINT `fk_converstation_read_1` FOREIGN KEY (`conversation_id`) REFERENCES `question_converstations` (`question_converstation_id`),
  CONSTRAINT `fk_converstation_read_2` FOREIGN KEY (`read_by`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `converstation_read`
--

LOCK TABLES `converstation_read` WRITE;
/*!40000 ALTER TABLE `converstation_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `converstation_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `thread_id` bigint DEFAULT NULL,
  `is_read` tinyint DEFAULT '0',
  `sender_type` enum('ADMIN','USER') DEFAULT 'USER',
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `receiver_type` enum('ADMIN','USER') DEFAULT 'ADMIN',
  `notify_about` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notification_userid _idx` (`user_id`),
  KEY `notification_threadid_idx` (`thread_id`),
  CONSTRAINT `notification_threadid` FOREIGN KEY (`thread_id`) REFERENCES `question_threads` (`question_thread_id`),
  CONSTRAINT `notification_userid ` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=794 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (699,'Paid Query from Gopal Kohli','Test Paid Query',72,500,0,'USER','2021-06-15 19:17:44','ADMIN','PAID_QUERY_NOTIFY'),(700,'Message from Gopal Kohli','hello',72,500,0,'USER','2021-06-15 19:18:44','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(701,'Response ','hi',72,500,0,'ADMIN','2021-06-15 19:18:58','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(702,'Message from Gopal Kohli','ddd',72,500,0,'USER','2021-06-15 19:19:19','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(703,'Message from Gopal Kohli','rrr',72,500,0,'USER','2021-06-15 19:19:47','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(704,'Message from Gopal Kohli','sss',72,500,0,'USER','2021-06-15 19:20:01','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(705,'Response ','sss',72,500,0,'ADMIN','2021-06-15 19:20:13','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(706,'Message from Gopal Kohli','sss',72,500,0,'USER','2021-06-15 19:20:50','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(707,'Response ','sdd',72,500,0,'ADMIN','2021-06-15 19:21:25','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(708,'Message from Gopal Kohli','sdfsdf',72,500,0,'USER','2021-06-15 19:21:36','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(709,'Message from Gopal Kohli','ssd',72,500,0,'USER','2021-06-15 19:21:50','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(710,'Message from Gopal Kohli','sdfgfg',72,500,0,'USER','2021-06-15 19:21:58','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(711,'Message from Gopal Kohli','sadsf',72,500,0,'USER','2021-06-15 19:22:21','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(712,'Response ','ddfs',72,500,0,'ADMIN','2021-06-15 19:22:43','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(713,'Response ','werty',72,500,0,'ADMIN','2021-06-15 19:26:48','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(714,'Message from Gopal Kohli','sdfgh',72,500,0,'USER','2021-06-15 19:26:55','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(715,'Message from Gopal Kohli','asdfghg',72,500,0,'USER','2021-06-15 19:27:08','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(716,'Message from Gopal Kohli','dsdfg',72,500,0,'USER','2021-06-15 19:27:25','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(717,'Response ','hello2',72,500,0,'ADMIN','2021-06-15 19:28:53','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(718,'Response ','sdf',72,500,0,'ADMIN','2021-06-15 19:29:13','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(719,'Message from Gopal Kohli','ssdsfs',72,500,0,'USER','2021-06-15 19:29:22','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(720,'Message from Gopal Kohli','fdfdfd',72,500,0,'USER','2021-06-15 19:29:40','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(721,'Message from Gopal Kohli','dsfddfs',72,500,0,'USER','2021-06-15 19:29:47','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(722,'Message from Gopal Kohli','dsfsdf',72,500,0,'USER','2021-06-15 19:30:09','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(723,'Response ','asdcsda',72,500,0,'ADMIN','2021-06-15 19:30:19','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(724,'Message from Gopal Kohli','asdasdasda',72,500,0,'USER','2021-06-15 19:30:25','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(725,'Message from Gopal Kohli','assadfghj',72,500,0,'USER','2021-06-15 19:31:02','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(726,'Message from Gopal Kohli','sdfghj',72,500,0,'USER','2021-06-15 19:31:16','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(727,'Message from Gopal Kohli','sdfghjkl',72,500,0,'USER','2021-06-15 19:31:29','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(728,'Fee Request','₹1 requested by AstroMihir team',72,500,0,'ADMIN','2021-06-15 19:31:56','USER','PAYMENT_NOTIFY '),(729,'Response ','sdfg',72,500,0,'ADMIN','2021-06-15 19:32:18','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(730,'Fee Request','₹1 requested by AstroMihir team',72,500,0,'ADMIN','2021-08-24 18:08:02','USER','PAYMENT_NOTIFY '),(731,'Query from kritika','Test Query',73,501,0,'USER','2021-11-11 10:29:54','ADMIN','FREE_QUERY_NOTIFY'),(732,'Message from kritika','test query 2',73,501,0,'USER','2021-11-11 10:31:51','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(733,'Query from kritika','Test Query 3',73,502,0,'USER','2021-11-11 10:32:01','ADMIN','NEW_THREAD_CREATED'),(734,'Response ','1 attachment received ',72,500,0,'ADMIN','2022-01-11 19:42:04','USER','ATTACHMENT_NOTIFY'),(735,'User Locked','admin Astro Mihir team LOCKED you',74,NULL,0,'ADMIN','2022-07-04 04:31:47','USER','USER_LOCK_NOTIFY'),(736,'User Unlocked','admin Astro Mihir team UN-LOCKED you',74,NULL,0,'ADMIN','2022-07-04 04:35:03','USER','USER_UNLOCK_NOTIFY'),(737,'Response ','test Chat',73,501,0,'ADMIN','2022-07-04 05:49:21','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(738,'Response ','yes received',73,501,0,'ADMIN','2022-07-04 05:53:11','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(739,'Fee Request','₹1 requested by AstroMihir team',73,501,0,'ADMIN','2022-07-04 07:59:59','USER','PAYMENT_NOTIFY '),(740,'Fee Request','₹1 requested by AstroMihir team',73,502,0,'ADMIN','2022-07-05 04:30:08','USER','PAYMENT_NOTIFY '),(741,'Response ','test message',73,502,0,'ADMIN','2022-07-06 04:49:45','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(742,'Fee Request','₹1 requested by AstroMihir team',72,503,0,'ADMIN','2022-07-11 04:44:23','USER','PAYMENT_NOTIFY '),(743,'User Locked','gopal Astro Mihir team LOCKED you',72,NULL,0,'ADMIN','2022-07-18 06:17:07','USER','USER_LOCK_NOTIFY'),(744,'User Unlocked','gopal Astro Mihir team UN-LOCKED you',72,NULL,0,'ADMIN','2022-07-18 06:17:10','USER','USER_UNLOCK_NOTIFY'),(745,'Query from Kritika','I want to ask',74,504,0,'USER','2022-07-19 10:59:53','ADMIN','NEW_THREAD_CREATED'),(746,'Fee Request','₹1 requested by AstroMihir team',74,504,0,'ADMIN','2022-07-19 11:00:38','USER','PAYMENT_NOTIFY '),(747,'Fee Request','₹1 requested by AstroMihir team',74,504,0,'ADMIN','2022-07-19 11:02:06','USER','PAYMENT_NOTIFY '),(748,'Query from Kritika','I have one query',74,505,0,'USER','2022-09-07 06:08:30','ADMIN','NEW_THREAD_CREATED'),(749,'Message from Kritika','yes please',74,505,0,'USER','2022-09-07 06:09:17','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(750,'Payment Complete','Kittu made a payment of ₹1',74,504,0,'USER','2022-09-07 06:19:08','ADMIN','PAYMENT_COMPLETE_NOTIFY '),(751,'Response ','ok ',74,504,0,'ADMIN','2022-09-07 06:57:30','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(752,'Response ','ok',74,505,0,'ADMIN','2022-09-07 06:57:37','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(753,'Response ','yes',74,504,0,'ADMIN','2022-09-07 07:02:41','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(754,'Fee Request','₹1 requested by AstroMihir team',74,504,0,'ADMIN','2022-09-07 07:04:47','USER','PAYMENT_NOTIFY '),(755,'Query from Kittu','ask query',74,506,0,'USER','2022-11-15 07:19:11','ADMIN','NEW_THREAD_CREATED'),(756,'Response ','test',72,503,0,'ADMIN','2022-11-15 11:14:03','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(757,'Fee Request','₹1 requested by AstroMihir team',72,503,0,'ADMIN','2022-11-16 05:05:45','USER','PAYMENT_NOTIFY '),(758,'Query from Kittu','Testing Query User Side',74,507,0,'USER','2022-11-21 07:12:49','ADMIN','NEW_THREAD_CREATED'),(759,'Message from Kittu','hi',74,507,0,'USER','2022-11-30 11:02:08','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(760,'Message from Kittu','add new query',74,507,0,'USER','2022-12-05 06:43:48','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(761,'Query from Kittu','add new query conversation',74,508,0,'USER','2022-12-05 06:45:21','ADMIN','NEW_THREAD_CREATED'),(762,'Response ','testttt',74,508,0,'ADMIN','2022-12-05 06:47:28','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(763,'Message from Kittu','again test',74,508,0,'USER','2022-12-05 06:49:12','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(764,'Response ','admin reply',74,508,0,'ADMIN','2022-12-12 05:36:26','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(765,'Response ','admin reply',74,508,0,'ADMIN','2022-12-12 05:37:16','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(766,'Message from Kittu','1 attachment received ',74,508,0,'USER','2022-12-14 05:09:07','ADMIN','ATTACHMENT_NOTIFY'),(767,'Response ','1 attachment received ',74,507,0,'ADMIN','2022-12-15 05:27:48','USER','ATTACHMENT_NOTIFY'),(768,'Response ','hi this is message',74,507,0,'ADMIN','2022-12-15 11:22:32','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(769,'Response ','1 attachment received ',74,507,0,'ADMIN','2022-12-15 12:55:15','USER','ATTACHMENT_NOTIFY'),(770,'Response ','Testing image',74,507,0,'ADMIN','2022-12-15 13:14:56','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(771,'Message from gopal','Hello',72,500,1,'USER','2023-03-04 10:54:13','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(772,'Fee Request','₹1 requested by AstroMihir team',72,500,0,'ADMIN','2023-03-04 10:58:45','USER','PAYMENT_NOTIFY '),(773,'Fee Request','₹1 requested by AstroMihir team',74,508,0,'ADMIN','2023-03-04 11:28:18','USER','PAYMENT_NOTIFY '),(774,'Payment Complete','Kittu made a payment of ₹1',74,508,0,'USER','2023-03-04 11:29:29','ADMIN','PAYMENT_COMPLETE_NOTIFY '),(775,'Fee Request','₹1 requested by AstroMihir team',74,508,0,'ADMIN','2023-03-04 11:35:57','USER','PAYMENT_NOTIFY '),(776,'Fee Request','₹1 requested by AstroMihir team',74,508,0,'ADMIN','2023-03-04 11:40:43','USER','PAYMENT_NOTIFY '),(777,'Payment Complete','Kittu made a payment of ₹1',74,508,0,'USER','2023-03-04 11:42:16','ADMIN','PAYMENT_COMPLETE_NOTIFY '),(778,'Refunded Rs ₹1 on 07 Mar 2023,','Payment will be received in next 8-10 working days.',74,NULL,0,'ADMIN','2023-03-07 06:27:00','USER','REFUND_AMOUNT'),(779,'Response ','test3',72,500,0,'ADMIN','2023-11-05 14:13:35','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(780,'Response ','test',72,500,0,'ADMIN','2023-11-05 14:16:32','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(781,'Response ','test',72,500,0,'ADMIN','2023-11-05 14:32:42','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(782,'Response ','test4',72,500,0,'ADMIN','2023-11-05 14:35:08','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(783,'Response ','test5',72,500,0,'ADMIN','2023-11-05 15:12:55','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(784,'Response ','test6',72,500,0,'ADMIN','2023-11-05 15:18:59','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(785,'Response ','ffff',72,500,0,'ADMIN','2023-11-05 15:19:56','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(786,'Response ','test 9',72,500,0,'ADMIN','2023-11-05 15:20:15','USER','NEW_MESSAGE_CREATED_FROM_ADMIN'),(787,'Query from gopal','Hello',72,509,0,'USER','2023-11-08 18:40:58','ADMIN','NEW_THREAD_CREATED'),(788,'Query from gopal','Hello 3',72,510,0,'USER','2023-11-08 18:41:16','ADMIN','NEW_THREAD_CREATED'),(789,'Message from gopal','1 attachment received ',72,503,0,'USER','2023-11-09 18:32:25','ADMIN','ATTACHMENT_NOTIFY'),(790,'Query from Kittu','my new query',74,511,1,'USER','2024-01-31 10:27:16','ADMIN','NEW_THREAD_CREATED'),(791,'Message from Kittu','please create payment',74,511,0,'USER','2024-01-31 11:02:32','ADMIN','NEW_MESSAGE_CREATED_FROM_USER '),(792,'Fee Request','₹1 requested by AstroMihir team',74,511,0,'ADMIN','2024-01-31 11:03:38','USER','PAYMENT_NOTIFY '),(793,'Response ','1 attachment received ',74,511,0,'ADMIN','2024-02-06 11:50:56','USER','ATTACHMENT_NOTIFY');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transaction`
--

DROP TABLE IF EXISTS `payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_transaction` (
  `payment_transaction_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `conversation_thread_id` bigint DEFAULT NULL,
  `chat_id` bigint DEFAULT NULL,
  `amount` double NOT NULL,
  `GST` double NOT NULL,
  `total_amount` double NOT NULL,
  `currency_code` varchar(45) NOT NULL,
  `currency_symbol` varchar(45) NOT NULL,
  `additional_notes` varchar(200) DEFAULT NULL,
  `short_url` text NOT NULL,
  `payment_relation_id` varchar(200) NOT NULL,
  `payment_link_id` varchar(200) NOT NULL,
  `payment_id` varchar(200) DEFAULT NULL,
  `order_id` varchar(200) DEFAULT NULL,
  `payment_method` varchar(200) DEFAULT NULL,
  `payment_status` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paid_on` timestamp NULL DEFAULT NULL,
  `refund_id` varchar(200) DEFAULT NULL,
  `refund_entity` varchar(200) DEFAULT NULL,
  `refund_amount` int DEFAULT NULL,
  `refund_On` timestamp NULL DEFAULT NULL,
  `payment_for` enum('THREAD','REGISTRATION') DEFAULT 'THREAD',
  PRIMARY KEY (`payment_transaction_id`),
  KEY `fk_payment_transaction_1_idx` (`user_id`),
  KEY `fk_payment_transaction_2_idx` (`admin_id`),
  KEY `fk_payment_transaction_3_idx` (`conversation_thread_id`),
  KEY `fk_payment_transaction_4_idx` (`chat_id`),
  CONSTRAINT `fk_payment_transaction_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_payment_transaction_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `fk_payment_transaction_3` FOREIGN KEY (`conversation_thread_id`) REFERENCES `question_threads` (`question_thread_id`),
  CONSTRAINT `fk_payment_transaction_4` FOREIGN KEY (`chat_id`) REFERENCES `question_converstations` (`question_converstation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transaction`
--

LOCK TABLES `payment_transaction` WRITE;
/*!40000 ALTER TABLE `payment_transaction` DISABLE KEYS */;
INSERT INTO `payment_transaction` VALUES (264,72,NULL,500,2117,0.8200000000000001,0.18,1,'INR','₹','Test Paid Query','https://rzp.io/i/zsLh1LDXS3','HNRlYM7MhEKINf','plink_HNRlYM7MhEKINf','pay_HNRlxuWlPFDEKs','order_HNRlaK8bTqGptB','upi','captured','2021-06-15 19:14:38','2021-06-15 19:17:44',NULL,NULL,NULL,NULL,'REGISTRATION'),(274,72,172,500,2188,0.8200000000000001,0.18,1,'INR','₹','Test amount','https://rzp.io/i/i5KbGYz','LNQGEjXivKBoj4','plink_LNQGEjXivKBoj4',NULL,NULL,NULL,NULL,'2023-03-04 10:58:44',NULL,NULL,NULL,NULL,NULL,'THREAD'),(275,74,172,508,2189,0.8200000000000001,0.18,1,'INR','₹','new amount','https://rzp.io/i/Q2kSRRMLP','LNQlS0LCxhdG6H','plink_LNQlS0LCxhdG6H','pay_LNQmONH2Evh4fc','order_LNQlqTyycSKFK4','upi','captured','2023-03-04 11:28:17','2023-03-04 11:29:29',NULL,NULL,NULL,NULL,'THREAD'),(276,74,172,508,2191,0.8200000000000001,0.18,1,'INR','₹',NULL,'https://rzp.io/i/7QTZCPQI','LNQtXVFjkIfnsD','plink_LNQtXVFjkIfnsD',NULL,NULL,NULL,NULL,'2023-03-04 11:35:56',NULL,NULL,NULL,NULL,NULL,'THREAD'),(277,74,172,508,2192,0.8200000000000001,0.18,1,'INR','₹','again new amount','https://rzp.io/i/9pbNSRIXP','LNQyaL8IayOFkh','plink_LNQyaL8IayOFkh','pay_LNQzUO90OyxaQ5','order_LNQzGvDpKNLcaY','upi','captured','2023-03-04 11:40:43','2023-03-04 11:42:16','rfnd_LOXEYWypB5aizK','refund',1,'2023-03-07 06:27:00','THREAD'),(278,74,172,511,2212,0.8200000000000001,0.18,1,'INR','₹',NULL,'https://rzp.io/i/jJ54DUuTaO','NVCEVAtllnh7PO','plink_NVCEVAtllnh7PO',NULL,NULL,NULL,NULL,'2024-01-31 11:03:37',NULL,NULL,NULL,NULL,NULL,'THREAD');
/*!40000 ALTER TABLE `payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predefined_messages`
--

DROP TABLE IF EXISTS `predefined_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predefined_messages` (
  `messageId` bigint NOT NULL AUTO_INCREMENT,
  `message_content` text NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_on` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `admin_id` bigint NOT NULL,
  `deleted_by` bigint DEFAULT NULL,
  PRIMARY KEY (`messageId`),
  KEY `admin_id_idx` (`admin_id`),
  KEY `deleted_by_2_idx` (`deleted_by`),
  CONSTRAINT `admin_id_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `deleted_by_2` FOREIGN KEY (`deleted_by`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predefined_messages`
--

LOCK TABLES `predefined_messages` WRITE;
/*!40000 ALTER TABLE `predefined_messages` DISABLE KEYS */;
INSERT INTO `predefined_messages` VALUES (24,'<p>test message</p>','2022-07-06 04:44:15',NULL,0,172,NULL),(25,'<p>Rule 2 Message</p>','2022-07-06 04:58:30',NULL,0,172,NULL),(26,'<p>MESSAGE</p>','2022-08-05 05:39:40',NULL,0,172,NULL),(27,'<p>Test message 1</p>','2022-09-07 07:12:58',NULL,0,172,NULL);
/*!40000 ALTER TABLE `predefined_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_converstations`
--

DROP TABLE IF EXISTS `question_converstations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_converstations` (
  `question_converstation_id` bigint NOT NULL AUTO_INCREMENT,
  `question_thread_id` bigint NOT NULL,
  `conversation_content` text,
  `written_by` bigint NOT NULL,
  `user_type` enum('USER','ADMIN','SYSTEM') NOT NULL DEFAULT 'USER',
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint DEFAULT '0',
  `deleted_on` timestamp NULL DEFAULT NULL,
  `is_read` tinyint DEFAULT '0',
  `read_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`question_converstation_id`),
  KEY `fk_question_converstations_1_idx` (`question_thread_id`),
  CONSTRAINT `fk_question_converstations_1` FOREIGN KEY (`question_thread_id`) REFERENCES `question_threads` (`question_thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_converstations`
--

LOCK TABLES `question_converstations` WRITE;
/*!40000 ALTER TABLE `question_converstations` DISABLE KEYS */;
INSERT INTO `question_converstations` VALUES (2117,500,'Test Paid Query',72,'USER','2021-06-15 19:14:38',0,NULL,1,'2023-11-05 15:19:50'),(2118,500,'Payment of ₹1 received with transaction id #HNRlYM7MhEKINf via UPI on 15 Jun 2021',72,'SYSTEM','2021-06-15 19:17:44',0,NULL,1,'2023-11-09 18:38:30'),(2119,500,'<p>hello</p>',72,'USER','2021-06-15 19:18:44',0,NULL,1,'2023-11-05 15:19:50'),(2120,500,'<p>hi</p>',172,'ADMIN','2021-06-15 19:18:57',0,NULL,1,'2023-11-09 18:38:30'),(2121,500,'<p>ddd</p>',72,'USER','2021-06-15 19:19:19',0,NULL,1,'2023-11-05 15:19:50'),(2122,500,'<p>rrr</p>',72,'USER','2021-06-15 19:19:47',0,NULL,1,'2023-11-05 15:19:50'),(2123,500,'<p>sss</p>',72,'USER','2021-06-15 19:20:01',0,NULL,1,'2023-11-05 15:19:50'),(2124,500,'<p>sss</p>',172,'ADMIN','2021-06-15 19:20:12',0,NULL,1,'2023-11-09 18:38:30'),(2125,500,'<p>sss</p>',72,'USER','2021-06-15 19:20:50',0,NULL,1,'2023-11-05 15:19:50'),(2126,500,'<p>sdd</p>',168,'ADMIN','2021-06-15 19:21:25',0,NULL,1,'2023-11-09 18:38:30'),(2127,500,'<p>sdfsdf</p>',72,'USER','2021-06-15 19:21:36',0,NULL,1,'2023-11-05 15:19:50'),(2128,500,'<p>ssd</p>',72,'USER','2021-06-15 19:21:50',0,NULL,1,'2023-11-05 15:19:50'),(2129,500,'<p>sdfgfg</p>',72,'USER','2021-06-15 19:21:58',0,NULL,1,'2023-11-05 15:19:50'),(2130,500,'<p>sadsf</p>',72,'USER','2021-06-15 19:22:21',0,NULL,1,'2023-11-05 15:19:50'),(2131,500,'<p>ddfs</p>',168,'ADMIN','2021-06-15 19:22:43',0,NULL,1,'2023-11-09 18:38:30'),(2132,500,'<p>werty</p>',172,'ADMIN','2021-06-15 19:26:47',0,NULL,1,'2023-11-09 18:38:30'),(2133,500,'<p>sdfgh</p>',72,'USER','2021-06-15 19:26:55',0,NULL,1,'2023-11-05 15:19:50'),(2134,500,'<p>asdfghg</p>',72,'USER','2021-06-15 19:27:08',0,NULL,1,'2023-11-05 15:19:50'),(2135,500,'<p>dsdfg</p>',72,'USER','2021-06-15 19:27:25',0,NULL,1,'2023-11-05 15:19:50'),(2136,500,'<p>hello2</p>',172,'ADMIN','2021-06-15 19:28:52',0,NULL,1,'2023-11-09 18:38:30'),(2137,500,'<p>sdf</p>',172,'ADMIN','2021-06-15 19:29:12',0,NULL,1,'2023-11-09 18:38:30'),(2138,500,'<p>ssdsfs</p>',72,'USER','2021-06-15 19:29:22',0,NULL,1,'2023-11-05 15:19:50'),(2139,500,'<p>fdfdfd</p>',72,'USER','2021-06-15 19:29:40',0,NULL,1,'2023-11-05 15:19:50'),(2140,500,'<p>dsfddfs</p>',72,'USER','2021-06-15 19:29:47',0,NULL,1,'2023-11-05 15:19:50'),(2141,500,'<p>dsfsdf</p>',72,'USER','2021-06-15 19:30:09',0,NULL,1,'2023-11-05 15:19:50'),(2142,500,'<p>asdcsda</p>',172,'ADMIN','2021-06-15 19:30:19',0,NULL,1,'2023-11-09 18:38:30'),(2143,500,'<p>asdasdasda</p>',72,'USER','2021-06-15 19:30:25',0,NULL,1,'2023-11-05 15:19:50'),(2144,500,'<p>assadfghj</p>',72,'USER','2021-06-15 19:31:02',0,NULL,1,'2023-11-05 15:19:50'),(2145,500,'<p>sdfghj</p>',72,'USER','2021-06-15 19:31:16',0,NULL,1,'2023-11-05 15:19:50'),(2146,500,'<p>sdfghjkl</p>',72,'USER','2021-06-15 19:31:29',0,NULL,1,'2023-11-05 15:19:50'),(2147,500,NULL,172,'ADMIN','2021-06-15 19:31:55',0,NULL,1,'2023-11-09 18:38:30'),(2148,500,'<p>sdfg</p>',172,'ADMIN','2021-06-15 19:32:18',0,NULL,1,'2023-11-09 18:38:30'),(2149,500,NULL,172,'ADMIN','2021-08-24 18:08:00',0,NULL,1,'2023-11-09 18:38:30'),(2150,501,'Test Query',73,'USER','2021-11-11 10:29:54',0,NULL,1,'2023-11-05 14:04:41'),(2151,501,'<p>test query 2</p>',73,'USER','2021-11-11 10:31:51',0,NULL,1,'2023-11-05 14:04:41'),(2152,502,'Test Query 3',73,'USER','2021-11-11 10:32:01',0,NULL,1,'2023-11-05 14:04:40'),(2153,500,'',172,'ADMIN','2022-01-11 19:42:03',0,NULL,1,'2023-11-09 18:38:30'),(2154,501,'<p>test Chat</p>',172,'ADMIN','2022-07-04 05:49:20',0,NULL,0,NULL),(2155,501,'<p>yes received</p>',172,'ADMIN','2022-07-04 05:53:10',0,NULL,0,NULL),(2156,501,'test amount',172,'ADMIN','2022-07-04 07:59:58',0,NULL,0,NULL),(2157,502,'test',172,'ADMIN','2022-07-05 04:30:07',0,NULL,0,NULL),(2158,502,'<p>test message</p>',172,'ADMIN','2022-07-06 04:49:44',0,NULL,0,NULL),(2159,503,'test',72,'USER','2022-07-09 19:42:19',0,NULL,1,'2022-12-14 07:04:45'),(2160,503,'one rupee',172,'ADMIN','2022-07-11 04:44:21',0,NULL,1,'2023-11-09 18:31:58'),(2161,504,'I want to ask',74,'USER','2022-07-19 10:59:53',0,NULL,1,'2022-09-07 07:02:31'),(2162,504,'testing',172,'ADMIN','2022-07-19 11:00:37',0,NULL,1,'2023-03-04 11:27:37'),(2163,504,NULL,172,'ADMIN','2022-07-19 11:02:06',0,NULL,1,'2023-03-04 11:27:37'),(2164,505,'I have one query',74,'USER','2022-09-07 06:08:30',0,NULL,1,'2023-11-05 13:50:52'),(2165,505,'<p>yes please</p>',74,'USER','2022-09-07 06:09:17',0,NULL,1,'2023-11-05 13:50:52'),(2166,504,'Payment of ₹1 received with transaction id #JvCUlVwCCZu6SY via UPI on 07 Sep 2022',74,'SYSTEM','2022-09-07 06:19:08',0,NULL,1,'2023-03-04 11:27:37'),(2167,504,'<p>ok </p>',172,'ADMIN','2022-09-07 06:57:29',0,NULL,1,'2023-03-04 11:27:37'),(2168,505,'<p>ok</p>',172,'ADMIN','2022-09-07 06:57:36',0,NULL,1,'2022-09-12 07:17:37'),(2169,504,'<p>yes</p>',172,'ADMIN','2022-09-07 07:02:40',0,NULL,1,'2023-03-04 11:27:37'),(2170,504,'testing payment',172,'ADMIN','2022-09-07 07:04:46',0,NULL,1,'2023-03-04 11:27:37'),(2171,506,'ask query',74,'USER','2022-11-15 07:19:11',0,NULL,1,'2023-11-05 13:50:51'),(2172,503,'<p>test</p><p></p><p></p>',172,'ADMIN','2022-11-15 11:14:02',0,NULL,1,'2023-11-09 18:31:58'),(2173,503,'test amount',172,'ADMIN','2022-11-16 05:05:44',0,NULL,1,'2023-11-09 18:31:58'),(2174,507,'Testing Query User Side',74,'USER','2022-11-21 07:12:49',0,NULL,1,'2023-11-05 13:50:50'),(2175,507,'<p>hi</p><p></p>',74,'USER','2022-11-30 11:02:08',0,NULL,1,'2023-11-05 13:50:50'),(2176,507,'<p>add new query</p>',74,'USER','2022-12-05 06:43:48',0,NULL,1,'2023-11-05 13:50:50'),(2177,508,'add new query conversation',74,'USER','2022-12-05 06:45:21',0,NULL,1,'2023-11-05 13:57:25'),(2178,508,'<p>testttt</p><p></p>',172,'ADMIN','2022-12-05 06:47:27',0,NULL,1,'2023-03-04 11:40:01'),(2179,508,'<p>again test</p>',74,'USER','2022-12-05 06:49:12',0,NULL,1,'2023-11-05 13:57:25'),(2180,508,'<p>admin reply</p><p></p>',172,'ADMIN','2022-12-12 05:36:25',0,NULL,1,'2023-03-04 11:40:01'),(2181,508,'<p>admin reply</p><p></p>',172,'ADMIN','2022-12-12 05:37:15',0,NULL,1,'2023-03-04 11:40:01'),(2182,508,'',74,'USER','2022-12-14 05:09:07',0,NULL,1,'2023-11-05 13:57:25'),(2183,507,'',172,'ADMIN','2022-12-15 05:27:47',0,NULL,1,'2023-03-04 11:27:31'),(2184,507,'<p>hi this is message</p>',172,'ADMIN','2022-12-15 11:22:32',0,NULL,1,'2023-03-04 11:27:31'),(2185,507,'',172,'ADMIN','2022-12-15 12:55:13',0,NULL,1,'2023-03-04 11:27:31'),(2186,507,'<p>Testing image</p>',172,'ADMIN','2022-12-15 13:14:55',0,NULL,1,'2023-03-04 11:27:31'),(2187,500,'<p>Hello</p>',72,'USER','2023-03-04 10:54:13',0,NULL,1,'2023-11-05 15:19:50'),(2188,500,'Test amount',172,'ADMIN','2023-03-04 10:58:44',0,NULL,1,'2023-11-09 18:38:30'),(2189,508,'new amount',172,'ADMIN','2023-03-04 11:28:17',0,NULL,1,'2023-03-04 11:40:01'),(2190,508,'Payment of ₹1 received with transaction id #LNQlS0LCxhdG6H via UPI on 04 Mar 2023',74,'SYSTEM','2023-03-04 11:29:29',0,NULL,1,'2023-11-05 13:57:25'),(2191,508,NULL,172,'ADMIN','2023-03-04 11:35:56',0,NULL,1,'2023-03-04 11:40:01'),(2192,508,'again new amount',172,'ADMIN','2023-03-04 11:40:43',0,NULL,0,NULL),(2193,508,'Payment of ₹1 received with transaction id #LNQyaL8IayOFkh via UPI on 04 Mar 2023',74,'SYSTEM','2023-03-04 11:42:16',0,NULL,1,'2023-11-05 13:57:25'),(2194,508,'Refunded Rs ₹1 on 07 Mar 2023, payment will be received in next 8-10 working days.',74,'SYSTEM','2023-03-07 06:27:00',0,NULL,1,'2023-11-05 13:57:25'),(2195,500,'',172,'ADMIN','2023-11-05 13:56:35',0,NULL,1,'2023-11-09 18:38:30'),(2196,500,'',172,'ADMIN','2023-11-05 14:01:58',0,NULL,1,'2023-11-09 18:38:30'),(2197,500,'<p>test</p>',172,'ADMIN','2023-11-05 14:04:38',0,NULL,1,'2023-11-09 18:38:30'),(2198,500,'<p>test2</p>',172,'ADMIN','2023-11-05 14:11:43',0,NULL,1,'2023-11-09 18:38:30'),(2199,500,'<p>test3</p>',172,'ADMIN','2023-11-05 14:13:34',0,NULL,1,'2023-11-09 18:38:30'),(2200,500,'<p>test</p>',172,'ADMIN','2023-11-05 14:16:31',0,NULL,1,'2023-11-09 18:38:30'),(2201,500,'<p>test</p>',172,'ADMIN','2023-11-05 14:32:40',0,NULL,1,'2023-11-09 18:38:30'),(2202,500,'<p>test4</p>',172,'ADMIN','2023-11-05 14:35:06',0,NULL,1,'2023-11-09 18:38:30'),(2203,500,'<p>test5</p>',172,'ADMIN','2023-11-05 15:12:55',0,NULL,1,'2023-11-09 18:38:30'),(2204,500,'<p>test6</p>',172,'ADMIN','2023-11-05 15:18:56',0,NULL,1,'2023-11-09 18:38:30'),(2205,500,'<p>ffff</p>',172,'ADMIN','2023-11-05 15:19:56',0,NULL,1,'2023-11-09 18:38:30'),(2206,500,'<p>test 9</p>',172,'ADMIN','2023-11-05 15:20:13',0,NULL,1,'2023-11-09 18:38:30'),(2207,509,'Hello',72,'USER','2023-11-08 18:40:58',0,NULL,0,NULL),(2208,510,'Hello 3',72,'USER','2023-11-08 18:41:16',0,NULL,0,NULL),(2209,503,'',72,'USER','2023-11-09 18:32:25',0,NULL,0,NULL),(2210,511,'my new query',74,'USER','2024-01-31 10:27:16',0,NULL,1,'2024-01-31 11:01:55'),(2211,511,'<p>please create payment</p>',74,'USER','2024-01-31 11:02:32',0,NULL,0,NULL),(2212,511,NULL,172,'ADMIN','2024-01-31 11:03:37',0,NULL,0,NULL),(2213,511,'',172,'ADMIN','2024-02-06 11:50:55',0,NULL,0,NULL);
/*!40000 ALTER TABLE `question_converstations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_threads`
--

DROP TABLE IF EXISTS `question_threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_threads` (
  `question_thread_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `thread_type` enum('FREE','PAID') NOT NULL DEFAULT 'FREE',
  `is_deleted` tinyint DEFAULT '0',
  `deleted_on` timestamp NULL DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_thread_id`),
  KEY `fk_questions_threads_1_idx` (`user_id`),
  CONSTRAINT `fk_questions_threads_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=512 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_threads`
--

LOCK TABLES `question_threads` WRITE;
/*!40000 ALTER TABLE `question_threads` DISABLE KEYS */;
INSERT INTO `question_threads` VALUES (500,72,'PAID',0,NULL,'2021-06-15 19:14:38'),(501,73,'FREE',0,NULL,'2021-11-11 10:29:54'),(502,73,'FREE',0,NULL,'2021-11-11 10:32:01'),(503,72,'PAID',0,NULL,'2022-07-09 19:42:19'),(504,74,'FREE',0,NULL,'2022-07-19 10:59:53'),(505,74,'FREE',0,NULL,'2022-09-07 06:08:30'),(506,74,'FREE',0,NULL,'2022-11-15 07:19:11'),(507,74,'FREE',0,NULL,'2022-11-21 07:12:49'),(508,74,'FREE',0,NULL,'2022-12-05 06:45:21'),(509,72,'FREE',0,NULL,'2023-11-08 18:40:58'),(510,72,'FREE',0,NULL,'2023-11-08 18:41:16'),(511,74,'FREE',0,NULL,'2024-01-31 10:27:16');
/*!40000 ALTER TABLE `question_threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_settings`
--

DROP TABLE IF EXISTS `registration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_settings` (
  `settings_id` bigint NOT NULL AUTO_INCREMENT,
  `registration_amount` double NOT NULL,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_id` bigint DEFAULT NULL,
  `updated_on` timestamp NULL DEFAULT NULL,
  `currency_symbol` varchar(45) NOT NULL,
  `currency_code` varchar(45) NOT NULL,
  PRIMARY KEY (`settings_id`),
  KEY `admin_id_idx` (`admin_id`),
  CONSTRAINT `registration_settings_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_settings`
--

LOCK TABLES `registration_settings` WRITE;
/*!40000 ALTER TABLE `registration_settings` DISABLE KEYS */;
INSERT INTO `registration_settings` VALUES (1,1,'2021-06-15 14:55:31',172,'2022-07-18 06:15:46','₹','INR');
/*!40000 ALTER TABLE `registration_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules` (
  `pk_rulesId` bigint NOT NULL AUTO_INCREMENT,
  `rules_name` varchar(500) NOT NULL,
  `added_by` bigint NOT NULL,
  `added_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_on` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint DEFAULT NULL,
  PRIMARY KEY (`pk_rulesId`),
  KEY `added_by_idx` (`added_by`),
  KEY `deleted_by_idx` (`deleted_by`),
  CONSTRAINT `added_by` FOREIGN KEY (`added_by`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `deleted_by` FOREIGN KEY (`deleted_by`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules`
--

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` VALUES (53,'test rule update',172,'2022-07-06 04:44:33',0,NULL,NULL),(54,'Rule 2',172,'2022-07-06 04:58:58',0,NULL,NULL),(55,'Rule3',172,'2022-07-06 05:00:35',0,NULL,NULL),(56,'tagRule',172,'2022-09-07 07:13:43',0,NULL,NULL);
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules_messages`
--

DROP TABLE IF EXISTS `rules_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules_messages` (
  `pk_rules_message_id` bigint NOT NULL AUTO_INCREMENT,
  `fk_rules_id` bigint NOT NULL,
  `fk_message_id` bigint NOT NULL,
  `added_by` bigint NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_by` bigint DEFAULT NULL,
  `deleted_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pk_rules_message_id`),
  KEY `messageId_idx` (`fk_message_id`),
  KEY `rulesId_idx` (`fk_rules_id`),
  KEY `adminId_idx` (`added_by`),
  KEY `adminId_2_idx` (`deleted_by`),
  CONSTRAINT `adminId` FOREIGN KEY (`added_by`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `adminId_2` FOREIGN KEY (`deleted_by`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `messageId` FOREIGN KEY (`fk_message_id`) REFERENCES `predefined_messages` (`messageId`),
  CONSTRAINT `rulesId` FOREIGN KEY (`fk_rules_id`) REFERENCES `rules` (`pk_rulesId`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules_messages`
--

LOCK TABLES `rules_messages` WRITE;
/*!40000 ALTER TABLE `rules_messages` DISABLE KEYS */;
INSERT INTO `rules_messages` VALUES (102,54,25,172,'2022-07-06 04:58:58',0,NULL,NULL),(103,55,25,172,'2022-07-06 05:00:35',0,NULL,NULL),(104,55,25,172,'2022-07-06 05:00:35',0,NULL,NULL),(105,56,26,172,'2022-09-07 07:13:43',0,NULL,NULL),(106,56,26,172,'2022-09-07 07:13:43',0,NULL,NULL),(107,56,26,172,'2022-09-07 07:13:43',0,NULL,NULL),(108,53,27,172,'2022-09-13 11:57:25',0,NULL,NULL);
/*!40000 ALTER TABLE `rules_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules_tag`
--

DROP TABLE IF EXISTS `rules_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rules_tag` (
  `pk_rules_tag_id` bigint NOT NULL AUTO_INCREMENT,
  `fk_rules_id` bigint NOT NULL,
  `fk_tag_id` bigint NOT NULL,
  `added_by` bigint NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) DEFAULT '0',
  `deleted_by` bigint DEFAULT NULL,
  `deleted_on` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pk_rules_tag_id`),
  KEY `rules_id_idx` (`fk_rules_id`),
  KEY `tag_id_idx` (`fk_tag_id`),
  CONSTRAINT `rules_id` FOREIGN KEY (`fk_rules_id`) REFERENCES `rules` (`pk_rulesId`),
  CONSTRAINT `tag_id` FOREIGN KEY (`fk_tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules_tag`
--

LOCK TABLES `rules_tag` WRITE;
/*!40000 ALTER TABLE `rules_tag` DISABLE KEYS */;
INSERT INTO `rules_tag` VALUES (81,54,40,172,'2022-07-06 04:58:58',0,NULL,NULL),(82,55,41,172,'2022-07-06 05:00:35',0,NULL,NULL),(83,56,41,172,'2022-09-07 07:13:43',0,NULL,NULL),(84,56,40,172,'2022-09-07 07:13:43',0,NULL,NULL),(85,53,40,172,'2022-09-13 11:57:25',0,NULL,NULL);
/*!40000 ALTER TABLE `rules_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` bigint NOT NULL AUTO_INCREMENT,
  `created_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tag_content` text NOT NULL,
  `deleted_on` timestamp NULL DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `admin_id` bigint NOT NULL,
  `deleted_by` bigint DEFAULT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `admin_id_idx` (`admin_id`),
  KEY `deleted_by_idx` (`deleted_by`),
  CONSTRAINT `admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `deleted_by_3` FOREIGN KEY (`deleted_by`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (40,'2022-07-06 04:43:37','testtag',NULL,0,172,NULL),(41,'2022-07-06 05:00:12','tag 2',NULL,0,172,NULL),(42,'2022-08-05 05:33:54','test',NULL,0,172,NULL),(43,'2022-09-07 07:13:11','Tag22',NULL,0,172,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_emp`
--

DROP TABLE IF EXISTS `test_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_emp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `xp` int DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_emp`
--

LOCK TABLES `test_emp` WRITE;
/*!40000 ALTER TABLE `test_emp` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(45) NOT NULL,
  `password` varchar(500) DEFAULT NULL,
  `country_code` varchar(10) NOT NULL,
  `is_mobile_number_verified` tinyint DEFAULT '0',
  `is_email_verified` tinyint DEFAULT '0',
  `is_locked` tinyint DEFAULT '0',
  `birth_date_time` timestamp NULL DEFAULT NULL,
  `birth_date` varchar(100) DEFAULT NULL,
  `birth_time` varchar(100) DEFAULT NULL,
  `birth_place` varchar(45) DEFAULT NULL,
  `birth_address` varchar(500) DEFAULT NULL,
  `registered_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `profile_pic` varchar(500) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `timezone` varchar(45) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `mobile_verified_on` timestamp NULL DEFAULT NULL,
  `registration_type` enum('FREE','PAID') DEFAULT 'FREE',
  `payment_status` varchar(200) DEFAULT NULL,
  `payment_relation_id` varchar(200) DEFAULT NULL,
  `locked_by` bigint DEFAULT NULL,
  `fcm_token` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `admin_id_fk_idx` (`locked_by`),
  CONSTRAINT `user_admin_id_fk` FOREIGN KEY (`locked_by`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (72,'gopal','gopal.kohli@gmail.com','9886219081','$2b$13$1uIbGeGuCxD.Rp30Pf5RCe2fYIQlTfmas2CTRjpJ/Y29nnZa9R8A6','91',1,0,0,'2022-04-05 06:30:00','2022-04-05','12:00 PM','Dehradun','Rishikesh, Uttarakhand, India','2021-06-15 19:14:17',NULL,NULL,'Asia/Calcutta','30.0869281','78.2676116','2022-07-09 19:42:19','PAID','captured','HNRlYM7MhEKINf',172,NULL),(73,'kritika','kritika@yahoo.com','9871204025','$2b$13$7K1WMJTBNUmp241kv2e8C.OxgP.2.mqI/p/7nuDgkoMy/.FLcHuje','91',1,0,0,'1990-04-29 03:15:00','1990-04-29','08:45 AM','Dehradun','Dehradun, Uttarakhand, India','2021-11-11 10:29:34',NULL,NULL,'Asia/Calcutta','30.3164945','78.03219179999999','2021-11-11 10:29:54','FREE',NULL,NULL,NULL,NULL),(74,'Kittu','kritika09malhotra@gmail.com','9871204026','$2b$13$YcrZQVV7c.xVvEVl7B8cEOH6ie8dbj/eEGCkb9prw6GmylDYTasrC','91',1,0,0,'1990-04-29 03:15:00','1990-04-29','08:45 AM','Bangalore Urban','Bengaluru, Karnataka, India','2022-07-04 04:27:24','https://astromihir.s3.amazonaws.com/production_storage/user_profile_pic/74_2022-12-07T05:42:13.451Z.jpg',NULL,'Asia/Calcutta','12.9715987','77.5945627',NULL,'FREE',NULL,NULL,172,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_lock_unlock_log`
--

DROP TABLE IF EXISTS `user_lock_unlock_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_lock_unlock_log` (
  `user_lock_unlock_id` bigint NOT NULL AUTO_INCREMENT,
  `admin_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `action` enum('LOCK','UNLOCK') NOT NULL DEFAULT 'LOCK',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_lock_unlock_id`),
  KEY `admin_id_idx` (`admin_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `ulul_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`),
  CONSTRAINT `ulul_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_lock_unlock_log`
--

LOCK TABLES `user_lock_unlock_log` WRITE;
/*!40000 ALTER TABLE `user_lock_unlock_log` DISABLE KEYS */;
INSERT INTO `user_lock_unlock_log` VALUES (64,172,74,'LOCK','2022-07-04 04:31:47'),(65,172,74,'UNLOCK','2022-07-04 04:35:03'),(66,172,72,'LOCK','2022-07-18 06:17:07'),(67,172,72,'UNLOCK','2022-07-18 06:17:10');
/*!40000 ALTER TABLE `user_lock_unlock_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'astro_mihir_pro'
--

--
-- Dumping routines for database 'astro_mihir_pro'
--
/*!50003 DROP PROCEDURE IF EXISTS `addMediaToConversation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `addMediaToConversation`(
IN conversationId BIGINT,
IN mediaUrl VARCHAR(500),
IN mediaType VARCHAR(100),
IN mediaSubType VARCHAR(100),
IN userId BIGINT,
IN addedBy VARCHAR(100),
IN filename VARCHAR(200),
IN fileSize VARCHAR(200)
)
BEGIN
	INSERT INTO conversation_media (conversation_id, media_url, media_type, media_subtype, added_by, user_type, created_on, file_name, file_size)
	VALUES (conversationId, mediaUrl, mediaType, mediaSubType, userId, addedBy, now(), filename, fileSize);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addNewQueryConversationChat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `addNewQueryConversationChat`(IN threadId BIGINT,IN query_content TEXT,IN userId BIGINT,IN addedBy VARCHAR(100))
BEGIN
	declare user_Id bigint default userId;
    if (addedBy = "USER") then
	SELECT qt.user_id into user_Id FROM question_threads qt where qt.question_thread_id = threadId;
    end if;
	if (userId = user_Id) then 
    
		INSERT INTO question_converstations(question_thread_id, conversation_content, written_by, user_type, created_on)
		VALUES (threadId, query_content, userId, addedBy, now());
		SELECT last_insert_id() AS conversationId;
    else
		select null as conversationId;
    end if ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `add_admin`(IN admin_name VARCHAR(500),IN email_Id VARCHAR(500),
IN  phone_number VARCHAR(45),IN admin_types VARCHAR(45),IN password_value VARCHAR(200),IN loggedInAdminId bigint)
BEGIN
	declare isDeleted varchar(20) default 0;
	declare adminType varchar(20) default 0;
    declare adminId int default null;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
select a.admin_type into adminType from admin a where a.admin_id = loggedInAdminId and a.is_deleted = 0 LIMIT 1;
if(adminType = 'SUPER_ADMIN') then
    SELECT a.admin_id,a.is_deleted into adminId,isDeleted
	FROM admin AS a 
	WHERE (a.email_id = email_Id OR a.mobile_number = phone_number OR a.username = email_Id) LIMIT 1;
	if(adminId is not null) THEN
		if(isDeleted = 1 ) THEN
			 UPDATE admin AS a
			 SET a.full_name = admin_name,a.username=email_Id,a.is_deleted = 0,
			 a.email_id=email_Id,a.mobile_number=phone_number,a.admin_type=admin_types,a.password = password_value
			 WHERE a.admin_id = adminId;
				SET isSuccess = 1;
				  SET message = 'SUCCESS';
        ELSE
			SET message = "ADMIN_ALREADY_EXISTS";
			SET isSuccess = 0;
		END IF;
	ELSE 
		INSERT INTO admin (full_name,username,email_id,mobile_number,admin_type,password) 
		VALUES (admin_name,email_Id,email_Id,phone_number,admin_types,password_value);
		SET isSuccess = 1;
          SET message = 'SUCCESS';
	END IF;
else   
		SET message = "UNAUTHORISED";
		SET isSuccess = 0;
END IF;  
	SELECT isSuccess,message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_transaction_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `add_transaction_data`(
IN transaction_id varchar(50),
IN amount varchar(255),
IN currency varchar(255),
IN mobile_number int,
IN email varchar(255),
IN created_on datetime,
IN conversation_thread_id varchar(255),
IN chat_id varchar(255),
IN short_url varchar(255),
IN notify_sms bool,
IN notify_email bool
)
BEGIN
	INSERT INTO transaction(transaction_id, amount, currency, mobile_number, email, created_on, conversation_thread_id, chat_id, short_url, notify_sms, notify_email) values(transaction_id, amount, currency, mobile_number, email, created_on, conversation_thread_id, chat_id, short_url, notify_sms, notify_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adminDashboard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `adminDashboard`(IN startDate timestamp, IN endDate timestamp)
BEGIN
# OVERALL REVENUE
SELECT sum(pt.total_amount) as totalRevenue,sum(pt.refund_amount) as totalRefund, pt.currency_symbol, pt.currency_code
FROM payment_transaction pt
WHERE pt.payment_status = "captured";
# TOTAL REVENUE ON FILTER
SELECT sum(pt.total_amount) as totalRevenue,sum(pt.refund_amount) as totalRefund, pt.currency_symbol, pt.currency_code, pt.paid_on
FROM payment_transaction pt
WHERE pt.payment_status = "captured" and
	pt.paid_on between startDate and endDate;
    
# TOTAL AMOUNT
SELECT sum(pt.total_amount) as totalRevenue, pt.currency_symbol, pt.currency_code,
(SELECT sum(pt.total_amount)
FROM payment_transaction pt
where pt.payment_status = "captured" and pt.refund_id is null) as receivedAmount
FROM payment_transaction pt ;
# TOTAL AMOUNT ON FILTER
SELECT sum(pt.total_amount) as totalRevenue, pt.currency_symbol, pt.currency_code,
(SELECT sum(pt.total_amount)
FROM payment_transaction pt
where pt.payment_status = "captured" and pt.refund_id is null and pt.paid_on between startDate and endDate) as receivedAmount
FROM payment_transaction pt 
WHERE pt.paid_on between startDate and endDate;

# TOTAL QUERY AND REPLY
SELECT count(b.question_thread_id) as totalQuery, count(b.question_converstation_id) as totalAnswered
FROM (SELECT qt.question_thread_id, qc.question_converstation_id, qt.created_on
FROM question_threads qt
LEFT JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id and qc.user_type = "ADMIN" and qc.is_deleted = 0)
WHERE qt.is_deleted = 0
GROUP BY qt.question_thread_id) as b;
# TOTAL QUERY AND REPLY FILTER
SELECT count(b.question_thread_id) as totalQuery, count(b.question_converstation_id) as totalAnswered
FROM (SELECT qt.question_thread_id, qc.question_converstation_id, qt.created_on
FROM question_threads qt
LEFT JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id and qc.user_type = "ADMIN" and qc.is_deleted = 0)
WHERE qt.is_deleted = 0 and qt.created_on between startDate and endDate
GROUP BY qt.question_thread_id) as b;

# TOTAL USER
SELECT count(u.user_id) as totalUser
FROM user u;

# TOTAL USER FILTER
SELECT count(u.user_id) as totalUser
FROM user u
WHERE u.registered_on between startDate and endDate;

# LAST THREE TRANSACTION
SELECT u.username, pt.paid_on, pt.total_amount, pt.currency_code, pt.currency_symbol
FROM payment_transaction pt
JOIN user u ON (u.user_id = pt.user_id)
WHERE pt.payment_status = "captured"
ORDER BY pt.payment_transaction_id DESC LIMIT 3;

-- # LAST THREE QUERY
SELECT u.username, u.email_id,count(qt.question_thread_id) as query_count
FROM question_threads qt
JOIN user u ON (u.user_id = qt.user_id)
WHERE qt.is_deleted = 0
group BY qt.user_id
ORDER BY max(qt.created_on) DESC LIMIT 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `adminProfileUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `adminProfileUpdate`(IN username VARCHAR(50),
	IN mobileNumber varchar(15),IN adminId BIGINT, IN password VARCHAR(500))
BEGIN
	declare existing_adminId int default null;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;

	SELECT a.admin_id into existing_adminId
	FROM admin AS a 
	WHERE (a.mobile_number = mobileNumber ) AND a.is_deleted = 0;
    if(existing_adminId is not null and existing_adminId != adminId) THEN
		SET message = "ADMIN_ALREADY_EXISTS";
		SET isSuccess = 0;
	ELSE 
		IF(password IS NULL ) THEN
			UPDATE admin a
			SET a.full_name = username, a.mobile_number= mobileNumber
			WHERE a.admin_id = adminId;
            SET isSuccess = 1;
            SET message = 'SUCCESS';
		ELSE
			UPDATE admin a
			SET a.full_name = username, a.mobile_number= mobileNumber,a.password = password
			WHERE a.admin_id = adminId;
            SET isSuccess = 1;
            SET message = 'SUCCESS';
		END IF;
    end if;
   
   SELECT isSuccess,message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_conversation_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_conversation_mail`(IN question_thread_id bigint)
BEGIN
	SELECT u.username,u.user_id,u.email_id,qt.question_thread_id
	FROM question_threads as qt
	INNER JOIN  user as u
	ON u.user_id = qt.user_id
	where qt.question_thread_id = question_thread_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_conversation_userprofile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_conversation_userprofile`(IN user_id BIGINT)
BEGIN
	SELECT  u.username,u.profile_pic,u.birth_place,u.birth_date_time, u.user_id 
	FROM user AS u 
	WHERE u.user_id = user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_list_all_queries_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_list_all_queries_threads`(IN search_text varchar(20),IN limit_number int(20),IN offset_number int(20))
BEGIN
IF(search_text IS NULL) THEN
	SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
		 (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
        (select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
        (select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
        (SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on DESC 
	LIMIT limit_number OFFSET offset_number;
ELSE
	SELECT qt.question_thread_id,u.user_id, u.username, u.profile_pic, count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
		(select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
		(select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
		(select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
		(Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") AS success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
	WHERE (qc.conversation_content LIKE search_text OR u.username LIKE search_text)  AND qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on DESC 
	LIMIT limit_number OFFSET offset_number;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_list_all_queries_thread_by_user_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_list_all_queries_thread_by_user_id`(IN search_text varchar(20),IN limit_number int(20),IN offset_number int(20),IN userId bigint)
BEGIN
IF(search_text IS NULL) THEN
	SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
        (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
        (select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
        (select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
        (SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.is_deleted = 0 AND qt.user_id = userId
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on DESC
	LIMIT limit_number OFFSET offset_number;
ELSE
	SELECT qt.question_thread_id,u.user_id, u.username, u.profile_pic, count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
        (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
		(select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
		(select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
		(Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") AS success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
	WHERE (qc.conversation_content LIKE search_text OR u.username LIKE search_text)  AND qt.is_deleted = 0 AND qt.user_id = userId
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on DESC 
	LIMIT limit_number OFFSET offset_number;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_list_no_reply_queries_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_list_no_reply_queries_threads`(IN search_text varchar(20),IN limit_number int(20),IN offset_number int(20))
BEGIN
IF(search_text IS NULL) THEN
	SELECT th.* from
	(SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count,
        (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
        (select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
        (select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
    FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on ASC) AS th 
    WHERE th.admin_message_count = 0
	LIMIT limit_number OFFSET offset_number;
ELSE
	SELECT th.* from
	(SELECT qt.question_thread_id,u.user_id, u.username, u.profile_pic, count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
       (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
		(select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
		(select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
		(Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
	WHERE (qc.conversation_content LIKE search_text OR u.username LIKE search_text)  AND qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on ASC) AS th 
    WHERE th.admin_message_count = 0
	LIMIT limit_number OFFSET offset_number;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_list_pending_response_queries_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_list_pending_response_queries_threads`(IN search_text varchar(20),IN limit_number int(20),IN offset_number int(20))
BEGIN
IF(search_text IS NULL) THEN
	SELECT th.* from
	(SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count,
       (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
        (select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
        (select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on ASC) AS th 
    WHERE th.last_message_by != "ADMIN" AND th.admin_message_count > 0
	LIMIT limit_number OFFSET offset_number;
ELSE
	SELECT th.* from
	(SELECT qt.question_thread_id,u.user_id, u.username, u.profile_pic, count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
        (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
		(select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
		(select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
		(Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
    FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
	WHERE (qc.conversation_content LIKE search_text OR u.username LIKE search_text)  AND qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on ASC) AS th 
	WHERE th.last_message_by != "ADMIN" AND th.admin_message_count > 0
	LIMIT limit_number OFFSET offset_number;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_list_replied_queries_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_list_replied_queries_threads`(IN search_text varchar(20),IN limit_number int(20),IN offset_number int(20))
BEGIN
IF(search_text IS NULL) THEN
	SELECT th.* from
	(SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
        (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
        (select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
        (select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on DESC) AS th 
    WHERE th.last_message_by = "ADMIN"
	LIMIT limit_number OFFSET offset_number;
ELSE
	SELECT th.* from
	(SELECT qt.question_thread_id,u.user_id, u.username, u.profile_pic, count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
        (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
		(select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = qt.question_thread_id and qcs.user_type = 'USER') AS admin_message_count,
		(select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
		(Select q.user_type from question_converstations q where q.question_thread_id = qt.question_thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
	WHERE (qc.conversation_content LIKE search_text OR u.username LIKE search_text)  AND qt.is_deleted = 0 
	GROUP BY qt.question_thread_id
	ORDER BY qt.created_on DESC) AS th 
    WHERE th.last_message_by = "ADMIN"
	LIMIT limit_number OFFSET offset_number;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_logincheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_logincheck`(IN username VARCHAR(500))
BEGIN
	SELECT * FROM admin AS ad WHERE ad.username = username AND is_deleted = "0";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_message_conversation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_message_conversation`( IN thread_id BIGINT,IN limit_number INT, IN offset_number INT)
BEGIN
	SELECT qt.question_thread_id,qc.created_on,qc.question_converstation_id,qc.conversation_content,
			qc.written_by,qc.user_type,ad.admin_id,ad.full_name AS admin_full_name,ad.profile_pic AS admin_profile_pic,
			u.user_id,u.username AS user_full_name,u.profile_pic AS user_profile_pic, ps.*,
            cm.media_id,cm.media_url,cm.media_type,cm.media_subtype,cm.file_name,cm.file_size
	FROM question_threads qt
	JOIN question_converstations qc ON(qc.question_thread_id = qt.question_thread_id)
    LEFT JOIN conversation_media cm ON (cm.conversation_id = qc.question_converstation_id AND cm.is_deleted = 0)
	LEFT JOIN admin ad ON(ad.admin_id = qc.written_by AND qc.user_type = 'ADMIN')
	LEFT JOIN user u ON(u.user_id = qc.written_by AND qc.user_type = 'USER')
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id)
	WHERE qt.question_thread_id = thread_id AND qt.is_deleted = 0 
	ORDER BY qc.created_on DESC
	LIMIT limit_number OFFSET offset_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_message_conversation_socket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_message_conversation_socket`( IN thread_id BIGINT)
BEGIN
	SELECT qt.question_thread_id,qc.created_on,qc.question_converstation_id,qc.conversation_content,
			qc.written_by,qc.user_type,ad.admin_id,ad.full_name AS admin_full_name,ad.profile_pic AS admin_profile_pic,
			u.user_id,u.username AS user_full_name,u.profile_pic AS user_profile_pic, ps.*,
            cm.media_id,cm.media_url,cm.media_type,cm.media_subtype,cm.file_name,cm.file_size
	FROM question_threads qt
	JOIN question_converstations qc ON(qc.question_thread_id = qt.question_thread_id)
    LEFT JOIN conversation_media cm ON (cm.conversation_id = qc.question_converstation_id AND cm.is_deleted = 0)
	LEFT JOIN admin ad ON(ad.admin_id = qc.written_by AND qc.user_type = 'ADMIN')
	LEFT JOIN user u ON(u.user_id = qc.written_by AND qc.user_type = 'USER')
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id)
	WHERE qt.question_thread_id = thread_id AND qt.is_deleted = 0 
	ORDER BY qc.created_on DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_thread_by_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_thread_by_thread`(IN thread_id BIGINT)
BEGIN
	SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, 
         (select qc.conversation_content from question_converstations qc 
			where qc.question_thread_id = qt.question_thread_id ORDER BY qc.created_on DESC limit 1) AS conversation_content,
        qt.created_on,
		(select count(qcs.question_converstation_id) from question_converstations qcs where qcs.question_thread_id = thread_id and qcs.user_type = 'ADMIN') AS admin_message_count,
        (select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = thread_id and qucs.is_read = 0 and qucs.user_type = "ADMIN") AS unread_message_count,
        (Select q.user_type from question_converstations q where q.question_thread_id = thread_id order by q.created_on desc limit 1) AS last_message_by,
		(SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.question_thread_id = thread_id
    GROUP BY qt.question_thread_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_thread_by_thread_socket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_thread_by_thread_socket`(IN thread_id BIGINT)
BEGIN
	SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, min(qc.conversation_content) AS conversation_content,qt.created_on, qc.is_read
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id and ps.payment_status = "captured")
    WHERE qt.question_thread_id = thread_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_write_Fileuplode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `admin_write_Fileuplode`(in content text ,
in thread_id bigint ,in admin_id bigint, in media varchar(200),in userType varchar (5))
BEGIN

declare c_id int  default null;
declare isSuccess tinyint(1) default 0;
declare message varchar(100) default null;

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;

START TRANSACTION;
	INSERT INTO question_converstations (conversation_content, question_thread_id,written_by,user_type)
	VALUES (content ,thread_id,admin_id,userType);
	SET c_id = last_insert_id();
 
	IF(media is not null) THEN
	INSERT INTO conversation_media (conversation_id,media_url,media_type,media_subtype,user_type)
	VALUES(c_id,media,'IMAGE','JPEG',userType);
	END IF;
COMMIT;
 
 SET message = "SUCCESS";
 SET isSuccess = 1;
 SELECT isSuccess,message,c_id as 'conversation_id';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ask_query_after_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `ask_query_after_login`(IN userId varchar(50),IN query_content text, IN registration_type varchar(50))
BEGIN
    declare threadId int default null;
	declare conversationId int default null;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
    
START TRANSACTION;

	INSERT INTO question_threads(`user_id`, thread_type)
	VALUES (userId, registration_type);
	SET threadId = LAST_INSERT_ID();
		
	INSERT INTO question_converstations(`question_thread_id`,`conversation_content`,`written_by`,`user_type`)
	VALUES (threadId,query_content,userId,"USER");
    SET conversationId = LAST_INSERT_ID(); 
    COMMIT;

    SET message = "SUCCESS";
    SET isSuccess = 1;
    SELECT isSuccess,message,userId,threadId,query_content,conversationId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ask_query_before_sign_up` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ask_query_before_sign_up`(IN full_name VARCHAR(50),IN country_code VARCHAR(6) , IN mobile_number VARCHAR(20), IN email_id VARCHAR(50), IN birth_place VARCHAR(100), IN birth_date_time TIMESTAMP, IN query_content TEXT, IN latitude VARCHAR(50), IN longitude VARCHAR(50), IN timezone VARCHAR(50))
BEGIN
	
    declare userId,isLocked,threadId int default null;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
    
START TRANSACTION;
    
    SELECT u.user_id,u.is_locked INTO userId,isLocked 
	FROM user u 
	WHERE u.mobile_number = mobile_number;
    
    IF(userId is not null) THEN
		IF(isLocked = 1) THEN
			set message = "USER_BLOCKED";
            SET isSuccess = 0;
        END IF;    
    ELSE 
      INSERT INTO user(`username`,`email_id`,`mobile_number`,`country_code`,`is_mobile_number_verified`,`is_email_verified`,`is_locked`,`birth_date_time`,`birth_place`,`timezone`,`latitude`,`longitude`)
	  VALUES(full_name,email_id,mobile_number,country_code,0,0,0,birth_date_time,birth_place,timezone,latitude,longitude);
	  SET userId = LAST_INSERT_ID();	
	END IF;
    
	INSERT INTO question_threads(`user_id`)
	VALUES (userId);
	SET threadId = LAST_INSERT_ID();
		
	INSERT INTO question_converstations(`question_thread_id`,`conversation_content`,`written_by`,`user_type`)
	VALUES (threadId,query_content,userId,"USER");
COMMIT;

    SET message = "SUCCESS";
    SET isSuccess = 1;
    SELECT isSuccess,message,userId,threadId,full_name,email_id,mobile_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkAdminExistAndChangePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `checkAdminExistAndChangePassword`(IN email_id VARCHAR(500), IN password_value VARCHAR(200))
BEGIN
	declare adminId int default null;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;

	SELECT a.admin_id into adminId
	FROM admin AS a 
	WHERE (a.email_id = email_id )AND a.is_deleted = 0;
    
    if(adminId is not null) THEN
		UPDATE admin a
			SET a.password = password_value
			WHERE a.admin_id = adminId;
            SET isSuccess = 1;
            SET message = 'SUCCESS';
	ELSE 
			SET message = "EMAIL_DOES_NOT_EXIST";
			SET isSuccess = 0;
	END IF;
   
   IF(isSuccess = 1) THEN
       SELECT a.admin_type as admin_type, a.full_name as full_name, isSuccess, message FROM admin AS a WHERE (a.email_id = email_id )AND a.is_deleted = 0;
   ELSE
    SELECT isSuccess,message;
   END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `checkTagIsUsedInRulesBeforeDeletion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `checkTagIsUsedInRulesBeforeDeletion`(IN tagId BIGINT)
BEGIN

SELECT * from rules_tag where fk_tag_id = tagId && is_deleted = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createNewPayment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `createNewPayment`(IN user_id BIGINT, IN admin_id BIGINT, IN conversation_thread_id BIGINT, IN chat_id BIGINT,
	IN amount double, IN GST double, IN total_amount double, IN currency_code VARCHAR(45), IN currency_symbol VARCHAR(45),
    IN additional_notes VARCHAR(200), IN short_url TEXT, IN payment_relation_id VARCHAR(200), IN payment_link_id VARCHAR(200), IN payment_for VARCHAR(200))
BEGIN
INSERT INTO payment_transaction(user_id, admin_id, conversation_thread_id, chat_id, amount, GST, total_amount, currency_code, currency_symbol, additional_notes, short_url, payment_relation_id, payment_link_id, payment_for)
VALUES(user_id, admin_id, conversation_thread_id, chat_id, amount, GST, total_amount, currency_code, currency_symbol, additional_notes, short_url, payment_relation_id, payment_link_id, payment_for);
SELECT LAST_INSERT_ID() AS payment_transaction_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `createNewPaymentForRegistration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `createNewPaymentForRegistration`(IN user_id BIGINT,
IN conversation_thread_id BIGINT, IN chat_id BIGINT, IN amount double, 
IN GST double, IN total_amount double, IN currency_code VARCHAR(45), IN currency_symbol VARCHAR(45),
IN additional_notes VARCHAR(200), IN short_url TEXT, IN payment_relation_id VARCHAR(200), 
IN payment_link_id VARCHAR(200), IN payment_for VARCHAR(200))
BEGIN
INSERT INTO payment_transaction(user_id, conversation_thread_id, chat_id, amount, GST, total_amount, currency_code, currency_symbol, additional_notes, short_url, payment_relation_id, payment_link_id, payment_for)
VALUES(user_id, conversation_thread_id, chat_id, amount, GST, total_amount, currency_code, currency_symbol, additional_notes, short_url, payment_relation_id, payment_link_id, payment_for);

UPDATE user u SET u.payment_relation_id = payment_relation_id WHERE u.user_id = user_id;

SELECT LAST_INSERT_ID() AS payment_transaction_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_predefined_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `create_new_predefined_message`( IN admin_value BIGINT,IN message_text TEXT)
BEGIN

    declare messageId int default null;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
    
    SELECT pm.messageId into messageId
	FROM predefined_messages pm 
	WHERE pm.message_content = message_text AND pm.is_deleted = 0;
	if(messageId is not null) THEN
		SET message = "MESSAGE_ALREADY_EXISTS";
		SET isSuccess = 0;
	ELSE 
		INSERT INTO predefined_messages(admin_id,message_content)
		VALUES (admin_value,message_text);	
		SET isSuccess = 1;
	END IF;
    
	SELECT isSuccess,message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_rules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `create_new_rules`(
IN rules_name VARCHAR(500),
IN admin_id BIGINT)
BEGIN
INSERT INTO rules (rules_name, added_by) 
VALUES(rules_name, admin_id);

SELECT last_insert_id() as rulesId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_new_tag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `create_new_tag`(in admin_Id bigint,in tag_Content text)
BEGIN
    declare tagId int default null ;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
    SELECT t.tag_id INTO tagId
	FROM tags t 
	WHERE t.tag_content = tag_Content AND t.is_deleted = 0;
		IF(tagId is not null) THEN
		SET message = "TAG_ALREADY_EXISTS";
		SET isSuccess = 0;
	ELSE 
		INSERT INTO tags ( admin_id,tag_content)
		VALUES  (admin_Id,tag_Content );
		SET isSuccess = 1;
	END IF;
    
	SELECT isSuccess,message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dashboard_Graph` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `dashboard_Graph`(in years int)
BEGIN
# REVENUE EARNING
SELECT DATE_FORMAT(paid_on,'%m-%Y') as monthYear,DATE_FORMAT(paid_on,'%m')as month,DATE_FORMAT(paid_on,'%y')as year,sum(pt.total_amount) as paidAmount
FROM payment_transaction as pt
where (payment_status= "captured" and refund_id is null and year(paid_on)= years)
GROUP BY MONTH (paid_on),YEAR (paid_on) ;
# REVENUE REFUND 
SELECT DATE_FORMAT(refund_On,'%m-%Y') as monthYear,DATE_FORMAT(refund_On,'%m')as month,DATE_FORMAT(refund_On,'%y')as year,sum(pt.refund_amount) as refundAmount
FROM payment_transaction as pt
where (payment_status= "captured" and refund_id is not null and year(refund_On)= years)
GROUP BY MONTH (refund_On) , YEAR (refund_On);

# TOTAL USER 
SELECT DATE_FORMAT(u.registered_on,'%m-%Y') as monthYear,DATE_FORMAT(u.registered_on,'%m')as month,
DATE_FORMAT(u.registered_on,'%y')as year,count(u.user_id) as totalUser
FROM user as u
where (u.username is not null and u.is_locked = 0 and year(u.registered_on)= years)
GROUP BY MONTH (u.registered_on) , YEAR (u.registered_on);

# QUERY ANSWER PENDING PENDING
select c.totalQuery,c.totalAnswered,c.monthYear,c.month,c.year,(c.totalQuery - c.totalAnswered) as pendingQueries 
from (
	select  count(b.question_thread_id) as totalQuery,count(b.question_converstation_id) as totalAnswered,DATE_FORMAT(b.created_on,'%m-%Y') as monthYear,DATE_FORMAT(b.created_on,'%m')as month,
	DATE_FORMAT(b.created_on,'%y')as year
	from (
		SELECT qt.question_thread_id, qc.question_converstation_id, qt.created_on
		FROM question_threads qt
		LEFT JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id and qc.user_type = "ADMIN" and qc.is_deleted = 0)
		WHERE qt.is_deleted = 0 and year(qt.created_on)= years
		GROUP BY qt.question_thread_id
	) as b
	group by MONTH(b.created_on),YEAR(b.created_on) 
) as c;

# TOP CITIES USER
SELECT count(*)as userCount, birth_place from user
group by birth_place
ORDER BY userCount DESC limit 10 ;

# TOP CITIES REVENUE
SELECT sum(pt.total_amount)as totalAmount, u.birth_place 
from user as u 
join payment_transaction as pt on(pt.user_id=u.user_id)
where pt.payment_status = "captured" group by u.birth_place 
ORDER BY totalAmount DESC limit 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `deleteAdmin`(IN adminId bigint,IN loggedInAdminId bigint)
BEGIN
    declare adminType varchar(20) default 0;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;

	select a.admin_type into adminType from admin a where a.admin_id = loggedInAdminId and a.is_deleted = 0;
	if(adminType = 'SUPER_ADMIN') then 
		update admin set is_deleted = 1 where admin_id = adminId;
        SET message = "SUCCESS";
		SET isSuccess = 1;
	else   
		SET message = "UNAUTHORISED";
		SET isSuccess = 0;
    end if;    
    SELECT isSuccess,message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_predefined_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `delete_predefined_message`( IN message_Id INT(20),IN admin_id BIGINT)
BEGIN
    DECLARE MESSAGES_COUNT INT DEFAULT 0;
    DECLARE SUCCESS BOOL DEFAULT 0;
	SELECT COUNT(*) INTO MESSAGES_COUNT from rules_messages where fk_message_id = message_Id AND is_deleted = 0;

	if MESSAGES_COUNT = 0 THEN
		UPDATE predefined_messages AS pm 
	    SET  pm.is_deleted = 1 , pm.deleted_on = CURRENT_TIMESTAMP ,pm.deleted_by = admin_id
	    WHERE pm.messageId = message_Id ;
	
        SET SUCCESS = 1;
	ELSE 
		SET SUCCESS = 0;
    END IF;
    
    SELECT SUCCESS, MESSAGES_COUNT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_rules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `delete_rules`(IN rulesId BIGINT, IN adminId BIGINT)
BEGIN
UPDATE rules_messages SET is_deleted = 1, deleted_on = current_timestamp(), deleted_by = adminId 
WHERE fk_rules_id = rulesId;

UPDATE rules_tag SET is_deleted = 1, deleted_on = current_timestamp(), deleted_by = adminId 
WHERE fk_rules_id = rulesId;

UPDATE rules SET is_deleted = 1, deleted_on = current_timestamp(), deleted_by = adminId 
WHERE pk_rulesId = rulesId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_tags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `delete_tags`(IN tag_id BIGINT,IN admin_id BIGINT )
BEGIN
    DECLARE TAG_COUNT INT DEFAULT 0;
    DECLARE SUCCESS BOOL DEFAULT 0;
	SELECT COUNT(*) INTO TAG_COUNT from rules_tag where fk_tag_id = tag_id && is_deleted = 0;

	if TAG_COUNT = 0 THEN
		UPDATE tags AS t 
		SET  t.is_deleted = 1 , t.deleted_on = CURRENT_TIMESTAMP ,t.deleted_by = admin_id
		WHERE t.tag_id = tag_id ;
	
        SET SUCCESS = 1;
	ELSE 
		SET SUCCESS = 0;
    END IF;
    
    SELECT SUCCESS, TAG_COUNT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `editAdmin`(IN username VARCHAR(50),
	IN mobileNumber varchar(15),IN adminId BIGINT, IN admin_Type VARCHAR(500),IN loggedInAdminId bigint)
BEGIN
	declare adminType varchar(20) default 0;
	declare existing_adminId int default null;
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
select a.admin_type into adminType from admin a where a.admin_id = loggedInAdminId and a.is_deleted = 0;
if(adminType = 'SUPER_ADMIN') then
	SELECT a.admin_id into existing_adminId
	FROM admin AS a 
	WHERE (a.mobile_number = mobileNumber )AND a.is_deleted = 0;
    if(existing_adminId is not null and existing_adminId != adminId) THEN
		SET message = "ADMIN_ALREADY_EXISTS";
		SET isSuccess = 0;
	ELSE 
			UPDATE admin a
			SET a.full_name = username, a.mobile_number= mobileNumber,a.admin_type = admin_Type
			WHERE a.admin_id = adminId;
            SET isSuccess = 1;
            SET message = 'SUCCESS';
		END IF;
else   
		SET message = "UNAUTHORISED";
		SET isSuccess = 0;
end if;    
   
   SELECT isSuccess,message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `edit_predefined_messages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `edit_predefined_messages`(IN message TEXT, IN message_Id INT(20) )
BEGIN
	UPDATE predefined_messages AS pm
	SET pm.message_content = message WHERE pm.messageId = message_Id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `firstTimePasswordSet` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `firstTimePasswordSet`(IN password VARCHAR(500), IN user_id BIGINT)
BEGIN
	UPDATE user AS u SET u.password = password WHERE u.user_id = user_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `firstTimePasswordSetDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `firstTimePasswordSetDA`(IN password VARCHAR(500), IN user_id BIGINT)
BEGIN
	UPDATE user AS u SET u.password = password WHERE u.user_id = user_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getAdmin`(in search varchar(50))
BEGIN
    IF(search = "")THEN
		SELECT username, email_id, mobile_number, admin_type, created_on FROM admin WHERE is_deleted = 0 ;
	ELSE
		SELECT username, email_id, mobile_number, admin_type, created_on FROM admin WHERE is_deleted = 0 AND username REGEXP search ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllRules` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getAllRules`()
BEGIN
	SELECT rs.pk_rulesId AS rules_Id, rs.rules_name, pm.messageId, pm.message_content AS message,
	tg.tag_id, tg.tag_content AS tag_name
	FROM rules rs
	JOIN rules_messages rm ON(rm.fk_rules_id = rs.pk_rulesId)
	JOIN rules_tag rt ON (rt.fk_rules_id = rs.pk_rulesId)
	JOIN predefined_messages pm ON(pm.messageId = rm.fk_message_id && rm.is_deleted = 0)
	JOIN tags tg ON(tg.tag_id = rt.fk_tag_id && rt.is_deleted = 0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllRulesWithSearch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getAllRulesWithSearch`(IN search_text VARCHAR(20),IN limit_number INT(20),IN offset_number INT(20))
BEGIN
	IF(search_text IS NULL ) THEN
		SELECT rs.pk_rulesId AS rules_Id, rs.rules_name, pm.messageId, pm.message_content AS message,
		tg.tag_id, tg.tag_content AS tag_name
		FROM rules rs
		JOIN rules_messages rm ON(rm.fk_rules_id = rs.pk_rulesId)
		JOIN rules_tag rt ON (rt.fk_rules_id = rs.pk_rulesId)
		JOIN predefined_messages pm ON(pm.messageId = rm.fk_message_id && rm.is_deleted = 0)
		JOIN tags tg ON(tg.tag_id = rt.fk_tag_id && rt.is_deleted = 0)
        LIMIT limit_number OFFSET offset_number;
	ELSE
		SELECT rs.pk_rulesId AS rules_Id, rs.rules_name, pm.messageId, pm.message_content AS message,
		tg.tag_id, tg.tag_content AS tag_name
		FROM rules rs
		JOIN rules_messages rm ON(rm.fk_rules_id = rs.pk_rulesId)
		JOIN rules_tag rt ON (rt.fk_rules_id = rs.pk_rulesId)
		JOIN predefined_messages pm ON(pm.messageId = rm.fk_message_id && rm.is_deleted = 0)
		JOIN tags tg ON(tg.tag_id = rt.fk_tag_id && rt.is_deleted = 0)
			WHERE (rs.pk_rulesId LIKE search_text 
			OR rs.rules_name LIKE search_text 
            OR pm.message_content LIKE search_text 
			OR tg.tag_content LIKE search_text)
            LIMIT limit_number OFFSET offset_number;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPaymentCompletedList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getPaymentCompletedList`(IN serach_text VARCHAR(45),IN _limit INT,IN _offset INT)
BEGIN
IF(serach_text is null) THEN
	SELECT pt.payment_transaction_id, pt.user_id, u.username, pt.amount, pt.GST, pt.total_amount, pt.currency_code, pt.currency_symbol, 
		concat('#',pt.payment_relation_id) as transactionId, pt.order_id, pt.payment_method, pt.paid_on, pt.payment_status, pt.refund_id
	FROM payment_transaction pt
	JOIN user u ON (u.user_id = pt.user_id and u.is_locked = 0)
	WHERE pt.payment_status = "Captured"
    LIMIT _limit OFFSET _offset;
ELSE 
	SELECT pt.payment_transaction_id, pt.user_id, u.username, pt.amount, pt.GST, pt.total_amount, pt.currency_code, pt.currency_symbol, 
		concat('#',pt.payment_relation_id) as transactionId, pt.order_id, pt.payment_method, pt.paid_on, pt.payment_status, pt.refund_id
	FROM payment_transaction pt
	JOIN user u ON (u.user_id = pt.user_id and u.is_locked = 0)
	WHERE pt.payment_status = "Captured" AND (u.username LIKE serach_text OR pt.amount LIKE serach_text OR pt.payment_relation_id LIKE serach_text
		OR pt.payment_method LIKE serach_text OR pt.total_amount LIKE serach_text)
	LIMIT _limit OFFSET _offset;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPaymentListInConsumer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getPaymentListInConsumer`(IN serach_text VARCHAR(45),IN user_Id INT,IN from_date DATE,IN to_date DATE,IN p_status VARCHAR(45),IN _limit INT,IN _offset INT)
BEGIN
	IF(serach_text is null AND from_date is null AND to_date is null AND p_status = "ALL") THEN
		SELECT pt.payment_transaction_id, pt.paid_on ,pt.amount,pt.GST,pt.payment_status,pt.currency_code,
		pt.total_amount,pt.currency_symbol,pt.payment_method,pt.payment_relation_id,pt.refund_id,pt.refund_entity
		FROM payment_transaction AS pt
        WHERE pt.user_id = user_Id
		LIMIT _limit OFFSET _offset;
	ELSEIF (serach_text is not null AND from_date is null AND to_date is null AND p_status = "ALL") THEN
		SELECT pt.payment_transaction_id, pt.paid_on  ,pt.amount,pt.GST,pt.payment_status,pt.currency_code,
		pt.total_amount,pt.currency_symbol,pt.payment_method,pt.payment_relation_id,pt.refund_id,pt.refund_entity
		FROM payment_transaction AS pt
		WHERE  pt.user_id = user_Id AND (pt.amount LIKE serach_text OR pt.payment_relation_id LIKE serach_text OR pt.paid_on LIKE serach_text
		OR pt.payment_method LIKE serach_text OR pt.total_amount LIKE serach_text OR pt.payment_status LIKE serach_text OR pt.payment_relation_id LIKE serach_text)
		LIMIT _limit OFFSET _offset;
	elseif (serach_text is null AND from_date is not null AND to_date is not null AND p_status = "ALL") then
		SELECT pt.payment_transaction_id, pt.paid_on ,pt.amount,pt.GST,pt.payment_status,pt.currency_code,
		pt.total_amount,pt.currency_symbol,pt.payment_method,pt.payment_relation_id,pt.refund_id,pt.refund_entity
		FROM payment_transaction AS pt
        WHERE pt.user_id = user_Id AND pt.created_on between from_date and to_date
		LIMIT _limit OFFSET _offset;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getRulesByRuleId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getRulesByRuleId`(IN rulesId BIGINT)
BEGIN

SELECT pk_rulesId, rules_name FROM rules WHERE pk_rulesId = rulesId;

SELECT rm.fk_message_id as messageId, pm.message_content as message  FROM rules_messages rm 
JOIN predefined_messages pm ON(pm.messageId = rm.fk_message_id) WHERE fk_rules_id = rulesId && rm.is_deleted = 0;

SELECT fk_tag_id as tagId, tg.tag_content as tag_name FROM rules_tag rt JOIN tags tg 
ON(tg.tag_id = rt.fk_tag_id) WHERE fk_rules_id = rulesId && rt.is_deleted = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getSingleConversationSocket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getSingleConversationSocket`(IN userId BIGINT,IN threadId BIGINT,IN converstation_id bigint)
BEGIN
	SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	SELECT qt.question_thread_id,qc.created_on,qc.question_converstation_id,qc.conversation_content,
			qc.written_by,qc.user_type,ad.admin_id,ad.full_name AS admin_full_name,ad.profile_pic AS admin_profile_pic,
			u.user_id,u.username AS user_full_name,u.profile_pic AS user_profile_pic, ps.*,
            cm.media_id,cm.media_url,cm.media_type,cm.media_subtype,cm.file_name,cm.file_size,ps.additional_notes
	FROM question_threads qt
	JOIN question_converstations qc ON(qc.question_thread_id = qt.question_thread_id)
	LEFT JOIN conversation_media cm ON (cm.conversation_id = qc.question_converstation_id AND cm.is_deleted = 0)
	LEFT JOIN admin ad ON(ad.admin_id = qc.written_by AND qc.user_type = 'ADMIN')
	LEFT JOIN user u ON(u.user_id = qc.written_by AND qc.user_type = 'USER')
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id)
	WHERE qt.question_thread_id = threadId AND qt.user_id = userId AND qt.is_deleted = 0 AND qc.question_converstation_id = converstation_id
	GROUP BY qc.question_converstation_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserConversationByQueryThread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getUserConversationByQueryThread`(IN userId BIGINT,IN threadId BIGINT,IN limit_number INT,IN offset_number INT)
BEGIN
	SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	SELECT qt.question_thread_id,qc.created_on,qc.question_converstation_id,qc.conversation_content,
			qc.written_by,qc.user_type,ad.admin_id,ad.full_name AS admin_full_name,ad.profile_pic AS admin_profile_pic,
			u.user_id,u.username AS user_full_name,u.profile_pic AS user_profile_pic, ps.*,
            cm.media_id,cm.media_url,cm.media_type,cm.media_subtype,cm.file_name,cm.file_size,ps.additional_notes
	FROM question_threads qt
	JOIN question_converstations qc ON(qc.question_thread_id = qt.question_thread_id)
	LEFT JOIN conversation_media cm ON (cm.conversation_id = qc.question_converstation_id AND cm.is_deleted = 0)
	LEFT JOIN admin ad ON(ad.admin_id = qc.written_by AND qc.user_type = 'ADMIN')
	LEFT JOIN user u ON(u.user_id = qc.written_by AND qc.user_type = 'USER')
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id)
	WHERE qt.question_thread_id = threadId AND qt.user_id = userId AND qt.is_deleted = 0
	GROUP BY qc.question_converstation_id 
	ORDER BY qc.created_on DESC
	LIMIT limit_number OFFSET offset_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserQueryList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getUserQueryList`(IN userId bigint,IN search_text varchar(20),IN limit_number int(20),IN offset_number int(20))
BEGIN
IF(search_text IS NULL) THEN
	SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, (select qcc.conversation_content from question_converstations qcc where
		qcc.question_thread_id = qt.question_thread_id order by qcc.created_on desc limit 1) AS conversation_content,max(qc.created_on) as created_on , COALESCE (count(cr.read_id), 0) AS isRead,
        (select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id)
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN converstation_read cr ON (cr.conversation_id = qc.question_converstation_id)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.is_deleted = 0 AND qt.user_id = userId
	group by qt.question_thread_id
	ORDER BY created_on DESC 
	LIMIT limit_number OFFSET offset_number;
ELSE
	SELECT qt.question_thread_id,u.user_id, u.username, u.profile_pic, count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) as payment_count, (select qcc.conversation_content from question_converstations qcc where
		qcc.question_thread_id = qt.question_thread_id order by qcc.created_on desc limit 1) AS conversation_content,max(qc.created_on) as created_on , COALESCE(count(cr.read_id), 0) AS isRead,
		(select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id)
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN converstation_read cr ON (cr.conversation_id = qc.question_converstation_id)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
	WHERE qc.conversation_content like search_text AND qt.is_deleted = 0 AND qt.user_id = userId
	GROUP BY qt.question_thread_id
	ORDER BY created_on DESC 
	LIMIT limit_number OFFSET offset_number;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserQueryListSocket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getUserQueryListSocket`(IN userId bigint)
BEGIN
	SELECT qt.question_thread_id,u.user_id, u.username,u.profile_pic,count(qc.question_converstation_id) AS conversation_count,
		count(ps.payment_transaction_id) AS payment_count, (select qcc.conversation_content from question_converstations qcc where
		qcc.question_thread_id = qt.question_thread_id order by qcc.created_on desc limit 1) AS conversation_content,max(qc.created_on) as created_on , COALESCE (count(cr.read_id), 0) AS isRead,
		(select count(qucs.question_converstation_id) from question_converstations qucs where qucs.question_thread_id = qt.question_thread_id and qucs.is_read = 0 and qucs.user_type = "USER") AS unread_message_count,
        (SELECT count(pts.payment_transaction_id) FROM payment_transaction pts where pts.conversation_thread_id = qt.question_thread_id and pts.payment_status = "captured") as success_payment_count
	FROM question_threads AS qt 
	JOIN user u ON (u.user_id = qt.user_id)
	JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id AND qc.is_deleted = 0)
    LEFT JOIN converstation_read cr ON (cr.conversation_id = qc.question_converstation_id)
    LEFT JOIN payment_transaction ps ON (ps.chat_id = qc.question_converstation_id and ps.user_id = u.user_id)
    WHERE qt.is_deleted = 0 AND qt.user_id = userId
	group by qt.question_thread_id
	ORDER BY created_on DESC ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUserUnreadQueryConversation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `getUserUnreadQueryConversation`(IN userId BIGINT)
BEGIN
	SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	SELECT qt.question_thread_id, qc.question_converstation_id, qc.conversation_content,a.username, a.admin_id
	FROM question_threads qt
	JOIN question_converstations qc ON (qt.question_thread_id = qc.question_thread_id AND qc.is_deleted = 0)
	JOIN admin a ON (a.admin_id = qc.written_by)
	WHERE qt.user_id = userId AND qc.is_read = 0 AND qc.user_type = 'ADMIN' AND qt.is_deleted = 0
	GROUP BY qc.question_converstation_id
	ORDER BY qc.question_converstation_id DESC
	LIMIT 20;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_admin_conversation_media_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_admin_conversation_media_log`(IN adminId BIGINT, IN limit_number INT(20),
IN offset_number INT(20))
BEGIN
	SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	SELECT qt.question_thread_id,qc.created_on,qc.question_converstation_id,qc.conversation_content,
			u.username AS user_full_name, cm.media_id, cm.media_url, cm.media_type
	FROM question_threads qt
	JOIN question_converstations qc ON(qc.question_thread_id = qt.question_thread_id)
	LEFT JOIN conversation_media cm ON (cm.conversation_id = qc.question_converstation_id AND cm.is_deleted = 0)
	LEFT JOIN admin ad ON(ad.admin_id = qc.written_by AND qc.user_type = 'ADMIN')
	LEFT JOIN user u ON(u.user_id = qt.user_id)
	WHERE qc.user_type = 'ADMIN' AND qc.written_by = adminId
    LIMIT limit_number OFFSET offset_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_admin_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_admin_list`(IN search_text VARCHAR(20),IN limit_number INT(20),IN offset_number INT(20),IN admin_Id BIGINT)
BEGIN
	IF(search_text IS NULL ) THEN
		SELECT a.admin_id, a.username, a.email_id, a.mobile_number, a.admin_type, a.profile_pic, a.full_name
		FROM admin AS a 
		WHERE a.is_deleted = 0 AND a.admin_id != admin_Id
		ORDER BY a.username DESC
        LIMIT limit_number OFFSET offset_number;
	ELSE
		SELECT a.admin_id, a.username, a.email_id, a.mobile_number, a.admin_type, a.profile_pic, a.full_name
		FROM admin AS a 
		WHERE (a.username LIKE search_text 
        OR a.full_name LIKE search_text 
		OR a.email_id LIKE search_text 
		OR a.mobile_number LIKE search_text)
        AND a.is_deleted = 0 AND a.admin_id != admin_Id
		ORDER BY a.username DESC 
        LIMIT limit_number OFFSET offset_number;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_admin_payment_request_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_admin_payment_request_log`(IN adminId bigint, IN limit_number INT(20),
IN offset_number INT(20))
BEGIN
	SELECT u.username AS user_full_name, ps.* FROM payment_transaction ps LEFT JOIN user u ON(u.user_id = ps.user_id)
	WHERE ps.payment_for = 'THREAD' AND ps.admin_id = adminId
    LIMIT limit_number OFFSET offset_number;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_notification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_all_notification`(IN receiverType varchar(20))
BEGIN
	SELECT * FROM notification AS nt 
    WHERE nt.is_read = 0 and receiver_type = receiverType
    ORDER BY nt.created_on DESC ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_all_notification_for_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_all_notification_for_admin`(IN receiverType varchar(20),IN limit_number int(20),IN offset_number int(20))
BEGIN
	SELECT * FROM notification AS nt 
    WHERE nt.is_read = 0 and receiver_type = receiverType
    ORDER BY nt.created_on DESC 
    LIMIT limit_number OFFSET offset_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_conversation_media` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_conversation_media`(IN c_id BIGINT)
BEGIN
	SELECT * FROM conversation_media WHERE conversation_id = c_id AND is_deleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_customer_list`(IN search_text VARCHAR(20),IN limit_number INT(20),IN offset_number INT(20))
BEGIN
	IF(search_text IS NULL ) THEN
		SELECT u.username, u.mobile_number, u.gender, u.email_id, u.user_id ,u.profile_pic,u.is_locked,count(qt.question_thread_id) AS queries,
			(SELECT sum(pt.total_amount)
			FROM payment_transaction pt
			WHERE pt.payment_status = "captured" AND pt.user_id = u.user_id) AS total_amount
		FROM user AS u 
		LEFT JOIN question_threads qt ON (qt.user_id = u.user_id)
		GROUP BY user_id 
        LIMIT limit_number OFFSET offset_number;
	ELSE
		SELECT u.username, u.mobile_number, u.gender, u.email_id, u.user_id ,u.profile_pic,u.is_locked,count(qt.question_thread_id) AS queries,
			(SELECT sum(pt.total_amount)
			FROM payment_transaction pt
			WHERE pt.payment_status = "captured" AND pt.user_id = u.user_id) AS total_amount
		FROM user AS u 
		LEFT JOIN question_threads qt ON (qt.user_id = u.user_id)
		WHERE (u.username LIKE search_text OR  u.mobile_number LIKE search_text OR u.email_id LIKE search_text)
        GROUP BY user_id  
        LIMIT limit_number OFFSET offset_number;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_fcm_token_for_all_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_fcm_token_for_all_admin`()
BEGIN
	SELECT fcm_token FROM admin where fcm_token is not null and is_deleted =0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_fcm_token_for_all_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_fcm_token_for_all_user`(in userId BIGINT)
BEGIN
	SELECT fcm_token FROM user where fcm_token is not null and user_id = userId  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_firstquery_by_userid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_firstquery_by_userid`(IN user_ID bigint)
BEGIN
		SELECT qc.*,qt.user_id FROM question_converstations qc 
		join question_threads qt on (qc.question_thread_id = qt.question_thread_id)
		where qc.written_by = user_ID and qc.user_type = "user"
		order by qc.created_on desc limit 1 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_last_conversation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_last_conversation`(IN question_thread bigint)
BEGIN
	SELECT qc.*,qt.user_id FROM question_converstations qc 
	join question_threads qt on (qc.question_thread_id = qt.question_thread_id)
	where qc.question_thread_id = question_thread
	order by qc.created_on asc limit 1 ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_notification_for_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_notification_for_user`(IN userId bigint,IN limit_number int(20),IN offset_number int(20))
BEGIN
	SELECT * FROM notification nt
    WHERE nt.is_read = 0 and receiver_type ="USER" and user_id = userId
    ORDER BY nt.created_on DESC 
    LIMIT limit_number OFFSET offset_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_payment_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_payment_details`()
BEGIN
	# TOTAL AMOUNT
    SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
	SELECT sum(pt.total_amount) as totalRevenue, pt.currency_symbol, pt.currency_code,
	(SELECT sum(pt.total_amount)
	FROM payment_transaction pt
	where pt.payment_status = "captured" and pt.refund_id is null) as receivedAmount
	FROM payment_transaction pt ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_predefined_messages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_predefined_messages`(IN search_text VARCHAR(20),
IN limit_number INT(20),IN offset_number INT(20))
BEGIN
IF(search_text IS NULL) THEN
	SELECT pm.message_content,pm.messageId 
    FROM predefined_messages AS pm
	WHERE  pm.is_deleted = 0 
	ORDER BY pm.created_on DESC 
	LIMIT limit_number OFFSET offset_number;
ELSE
	SELECT pm.message_content,pm.messageId FROM predefined_messages AS pm
	WHERE pm.message_content LIKE search_text AND pm.is_deleted = 0 
	ORDER BY pm.created_on DESC 
	LIMIT limit_number OFFSET offset_number;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_registration_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_registration_settings`()
BEGIN
	SELECT rs.settings_id,rs.registration_amount,rs.created_on,rs.admin_id,rs.updated_on,rs.currency_symbol,rs.currency_code,
	a.username,a.email_id,a.mobile_number,a.admin_type,a.is_deleted,a.full_name,a.profile_pic
	FROM registration_settings AS rs
	LEFT JOIN admin AS a
	ON rs.admin_id = a.admin_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tag_names` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_tag_names`()
BEGIN
	SELECT t.tag_id,t.tag_content 
    FROM tags  AS t
    WHERE t.is_deleted = 0
	ORDER BY t.tag_id DESC ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_lock_unlock_by_admin_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `get_user_lock_unlock_by_admin_log`(IN adminId bigint, IN limit_number INT(20),
IN offset_number INT(20))
BEGIN
	SELECT u.username AS user_full_name, ulul.* FROM user_lock_unlock_log ulul 	
    LEFT JOIN user u ON(u.user_id = ulul.user_id) WHERE ulul.admin_id = adminId
    LIMIT limit_number OFFSET offset_number;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `list_all_queries_threads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `list_all_queries_threads`(IN search_text varchar(20))
BEGIN
	SELECT u.username, u.profile_pic, qc.conversation_content, qc.created_on,u.user_id,qt.question_thread_id,qc.question_converstation_id, qr.read_id
	FROM question_threads AS qt 
	LEFT JOIN question_converstations AS qc ON qt.question_thread_id = qc.question_thread_id
	LEFT JOIN user u ON (u.user_id = qt.user_id AND (u.registration_type = 'FREE' OR u.payment_status = 'captured'))
	LEFT JOIN converstation_read AS qr ON qc.question_converstation_id = qr.conversation_id
	WHERE qc.conversation_content LIKE search_text
	ORDER BY qc.created_on DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `message_conversation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `message_conversation`(IN search_text VARCHAR(20),IN limit_number INT(20),IN offset_number INT(20))
BEGIN
	IF(search_text IS NULL ) THEN
		SELECT u.username, u.profile_pic, qc.conversation_content, qc.created_on,u.user_id,qt.question_thread_id,qc.question_converstation_id, qr.read_id,ad.admin_id,ad.username
		FROM question_threads AS qt 
		LEFT JOIN question_converstations AS qc ON qt.question_thread_id = qc.question_thread_id
		LEFT JOIN user AS u ON u.user_id = qt.user_id
		LEFT JOIN converstation_read AS qr ON qc.question_converstation_id = qr.read_by
		LEFT JOIN admin AS ad ON ad.admin_id = qr.conversation_id
		ORDER BY qc.created_on DESC ;
	ELSE
		SELECT u.username, u.profile_pic, qc.conversation_content, qc.created_on,u.user_id,qt.question_thread_id,qc.question_converstation_id,qr.read_id,ad.admin_id,ad.username as admin_name
		FROM question_threads AS qt 
		LEFT JOIN question_converstations AS qc ON qt.question_thread_id = qc.question_thread_id
		LEFT JOIN user AS u ON u.user_id = qt.user_id
		LEFT JOIN converstation_read AS qr ON qc.question_converstation_id = qr.conversation_id
		LEFT JOIN admin AS ad ON ad.admin_id = qr.conversation_id
		WHERE qc.conversation_content LIKE search_text
		ORDER BY qc.created_on DESC ;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `new_procedure`(in years int)
BEGIN
# REVENUE EARNING
SELECT DATE_FORMAT(paid_on,'%m-%Y') as monthYear,DATE_FORMAT(paid_on,'%m')as month,DATE_FORMAT(paid_on,'%y')as year,sum(pt.total_amount) as paidAmount
FROM payment_transaction as pt
where (payment_status= "captured" and refund_id is null and year(paid_on)= years)
GROUP BY MONTH (paid_on),YEAR (paid_on) ;
# REVENUE REFUND 
SELECT DATE_FORMAT(refund_On,'%m-%Y') as monthYear,DATE_FORMAT(refund_On,'%m')as month,DATE_FORMAT(refund_On,'%y')as year,sum(pt.refund_amount) as refundAmount
FROM payment_transaction as pt
where (payment_status= "captured" and refund_id is not null and year(refund_On)= years)
GROUP BY MONTH (refund_On) , YEAR (refund_On);

# TOTAL USER 
SELECT DATE_FORMAT(u.registered_on,'%m-%Y') as monthYear,DATE_FORMAT(u.registered_on,'%m')as month,
DATE_FORMAT(u.registered_on,'%y')as year,count(u.user_id) as totalUser
FROM user as u
where (u.username is not null and u.is_locked = 0 and year(u.registered_on)= years)
GROUP BY MONTH (u.registered_on) , YEAR (u.registered_on);

# QUERY ANSWER PENDING PENDING
select c.totalQuery,c.totalAnswered,c.monthYear,c.month,c.year,(c.totalQuery - c.totalAnswered) as pendingQueries 
from (
	select  count(b.question_thread_id) as totalQuery,count(b.question_converstation_id) as totalAnswered,DATE_FORMAT(b.created_on,'%m-%Y') as monthYear,DATE_FORMAT(b.created_on,'%m')as month,
	DATE_FORMAT(b.created_on,'%y')as year
	from (
		SELECT qt.question_thread_id, qc.question_converstation_id, qt.created_on
		FROM question_threads qt
		LEFT JOIN question_converstations qc ON (qc.question_thread_id = qt.question_thread_id and qc.user_type = "ADMIN" and qc.is_deleted = 0)
		WHERE qt.is_deleted = 0 and year(qt.created_on)= years
		GROUP BY qt.question_thread_id
	) as b
	group by MONTH(b.created_on),YEAR(b.created_on) 
) as c;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_test1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `new_test1`(IN search_text VARCHAR(20))
BEGIN
	IF(search_text IS NULL ) THEN
		SELECT rs.pk_rulesId AS rules_Id, rs.rules_name, pm.messageId, pm.message_content AS message,
		tg.tag_id, tg.tag_content AS tag_name
		FROM rules rs
		JOIN rules_messages rm ON(rm.fk_rules_id = rs.pk_rulesId)
		JOIN rules_tag rt ON (rt.fk_rules_id = rs.pk_rulesId)
		JOIN predefined_messages pm ON(pm.messageId = rm.fk_message_id && rm.is_deleted = 0)
		JOIN tags tg ON(tg.tag_id = rt.fk_tag_id && rt.is_deleted = 0);
	ELSE
		SELECT rs.pk_rulesId AS rules_Id, rs.rules_name, pm.messageId, pm.message_content AS message,
		tg.tag_id, tg.tag_content AS tag_name
		FROM rules rs
		JOIN rules_messages rm ON(rm.fk_rules_id = rs.pk_rulesId)
		JOIN rules_tag rt ON (rt.fk_rules_id = rs.pk_rulesId)
		JOIN predefined_messages pm ON(pm.messageId = rm.fk_message_id && rm.is_deleted = 0)
		JOIN tags tg ON(tg.tag_id = rt.fk_tag_id && rt.is_deleted = 0)
			WHERE (rs.pk_rulesId LIKE search_text 
			OR rs.rules_name LIKE search_text 
            OR pm.message_content LIKE search_text 
			OR tg.tag_content LIKE search_text);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `password`(IN password VARCHAR(500), IN user_id BIGINT)
BEGIN
	UPDATE user AS u SET u.password = password WHERE u.user_id = user_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `profileUpdateSaveChanges` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `profileUpdateSaveChanges`(IN username VARCHAR(50),
	IN email_id VARCHAR(255) ,IN user_id BIGINT, IN password VARCHAR(500))
BEGIN
	IF(password IS NULL ) THEN
		UPDATE user u
		SET u.username = username, u.email_id= email_id
		WHERE u.user_id = user_id;
	ELSE
		UPDATE user u
		SET u.username = username, u.email_id= email_id,u.password = password
		WHERE u.user_id = user_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `readUsersConversationByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `readUsersConversationByUser`(IN threadId BIGINT,IN readBy varchar(100))
BEGIN
	UPDATE question_converstations qc SET qc.is_read = 1, qc.read_on = now()
	WHERE qc.question_thread_id = threadId  AND user_type IN (readBy,"SYSTEM");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `read_notification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `read_notification`(IN notificationId bigint,IN receiverType varchar(20))
BEGIN
	UPDATE notification AS nt SET nt.is_read = 1
    WHERE nt.notification_id = notificationId and nt.receiver_type = receiverType ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `refundAmountUpdateInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `refundAmountUpdateInfo`(IN paymentTransId BIGINT, IN refundId VARCHAR(200), IN entity VARCHAR(200), IN amount INT)
BEGIN
UPDATE payment_transaction pt SET pt.refund_id = refundId, pt.refund_entity = entity, pt.refund_amount = amount, pt.refund_On = now()
WHERE pt.payment_transaction_id = paymentTransId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registerNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `registerNewUser`(IN full_name varchar(100),IN country_code varchar(6), 
	IN mobile_number varchar(20), IN email_id varchar(50), IN birth_place varchar(100), 
    IN birth_date_time TIMESTAMP, IN latitude varchar(50), IN longitude varchar(50), IN timezone varchar(50), 
    IN birth_date VARCHAR(100), IN birth_time VARCHAR(100), IN registration_type VARCHAR(100), 
    IN birth_address VARCHAR(500))
BEGIN
	
    declare userId,isLocked int default null;
    declare isSuccess, is_valid tinyint(1) default 0;
    declare message varchar(100) default null;
    declare registration varchar(100) default 'FREE';
    declare payment_status varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
    
START TRANSACTION;
    
    SELECT u.user_id, u.is_locked, u.is_mobile_number_verified, u.registration_type, u.payment_status
    into userId, isLocked, is_valid, registration, payment_status FROM user u 
	WHERE u.mobile_number = mobile_number AND u.country_code = country_code LIMIT 1;
    
    -- IF(isLocked = 1) then
	-- SET message = "USER_BLOCKED";
	-- SET isSuccess = 0;
    
	IF((is_valid = 1 OR is_valid is true) AND registration = 'FREE') THEN
		SET message = "USER_ALREADY_EXIST";
        SET isSuccess = 0;
	ELSEIF((is_valid = 1 OR is_valid is true) AND registration = 'PAID' AND payment_status = 'captured') THEN
		SET message = "USER_ALREADY_EXIST";
        SET isSuccess = 0;
    ELSEIF(userId is null) THEN
		INSERT INTO user(username, email_id, mobile_number, country_code, birth_date_time, birth_place, 
        timezone , latitude, longitude, birth_date, birth_time, registration_type, birth_address)
		VALUES(full_name, email_id, mobile_number, country_code, birth_date_time, birth_place, 
        timezone, latitude, longitude, birth_date, birth_time, registration_type, birth_address);
		SET userId = LAST_INSERT_ID();
        SET message = "SUCCESS";
		SET isSuccess = 1;
    ELSE 
		UPDATE user u SET u.username = full_name, u.email_id = email_id, u.birth_date_time = birth_date_time,
			u.birth_place = birth_place, u.timezone = timezone, u.latitude = latitude, u.longitude = longitude, u.birth_date = birth_date,
            u.birth_time = birth_time, u.registration_type = registration_type, u.birth_address = birth_address
		WHERE u.user_id = userId;
        
		UPDATE question_threads qt SET qt.is_deleted = 1, qt.deleted_on = current_timestamp() where qt.user_id = userId;
        
        SET message = "SUCCESS";
		SET isSuccess = 1;
	END IF;
COMMIT;
SELECT isSuccess,message,userId,full_name,email_id,mobile_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `test`(IN search_text VARCHAR(20),IN limit_number INT(20),IN offset_number INT(20))
BEGIN
	IF(search_text IS NULL) THEN
	 SELECT pm.message_content,pm.messageId FROM predefined_messages  AS pm
	 ORDER BY pm.created_on DESC 
	 LIMIT limit_number OFFSET offset_number;
	ELSE
	 SELECT pm.message_content,pm.messageId FROM predefined_messages  AS pm
	 WHERE pm.message_content LIKE search_text
	 ORDER BY pm.created_on DESC 
	 LIMIT limit_number OFFSET offset_number;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test_emp_sp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `test_emp_sp`()
BEGIN
	SELECT * FROM test_emp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `transaction`(IN thread_id bigint)
BEGIN
	SELECT pt.payment_transaction_id,pt.conversation_thread_id,pt.user_id,pt.total_amount,pt.payment_method,
	pt.currency_symbol,pt.total_amount,
	(case when (payment_status is null AND pt.refund_id is null) then pt.created_on 
		when (payment_status = "captured" AND pt.refund_id is null) then pt.paid_on
		when payment_status = "captured" AND pt.refund_id is not null then pt.refund_On 
		when payment_status = "failed" AND pt.refund_id is null then pt.paid_on else pt.created_on
		end) as transaction_date,
		(case when (payment_status is null AND pt.refund_id is null) then 'Pending'
		when (payment_status = "captured" AND pt.refund_id is null) then 'Paid'
		when payment_status = "captured" AND pt.refund_id is not null then 'Refunded' 
		when payment_status = "failed" AND pt.refund_id is null then 'Failed' else 'Pending'
		end) as payment_status
	FROM payment_transaction AS pt
	where pt.conversation_thread_id = thread_id
	ORDER BY pt.payment_transaction_id DESC ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transaction_list_in_thread` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `transaction_list_in_thread`(IN thread_id bigint)
BEGIN
	SELECT pt.payment_transaction_id,pt.conversation_thread_id,pt.user_id,pt.total_amount,
	pt.currency_symbol,pt.total_amount,
		(CASE WHEN (payment_status is null AND pt.refund_id is null) THEN pt.created_on 
		WHEN (payment_status = "captured" AND pt.refund_id is null) THEN pt.paid_on
		WHEN (payment_status = "captured" AND pt.refund_id is not null) THEN pt.refund_On 
		WHEN (payment_status = "failed" AND pt.refund_id is null) THEN pt.paid_on ELSE pt.created_on
		END) AS transaction_date,
		(CASE WHEN (payment_status is null AND pt.refund_id is null) THEN 'Pending'
		WHEN (payment_status = "captured" AND pt.refund_id is null) THEN 'Paid'
		WHEN (payment_status = "captured" AND pt.refund_id is not null) THEN 'Refunded' 
		WHEN (payment_status = "failed" AND pt.refund_id is null) THEN 'Failed' ELSE 'Pending'
		END) AS payment_status
	FROM payment_transaction AS pt
	WHERE pt.conversation_thread_id = thread_id
	ORDER BY pt.payment_transaction_id DESC ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUserProfileWhileRegister` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `updateUserProfileWhileRegister`(IN full_name varchar(100),IN country_code varchar(6) , 
	IN mobile_number varchar(20),IN email_id varchar(50), IN birth_place varchar(100), 
    IN birth_date_time TIMESTAMP, IN latitude varchar(50), IN longitude varchar(50),
    IN timezone varchar(50), IN birth_date VARCHAR(100), IN birth_time VARCHAR(100), 
    IN birth_address VARCHAR(500))
BEGIN
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    declare userId bigint default null;
    
	SELECT u.user_id into userId
	FROM user u 
	WHERE u.mobile_number = mobile_number AND u.country_code = country_code LIMIT 1;
    
	UPDATE user u SET u.username = full_name, u.email_id = email_id, u.birth_date_time = birth_date_time,
	u.birth_place = birth_place, u.timezone = timezone, u.latitude = latitude, u.longitude = longitude,
    u.birth_date = birth_date,u.birth_time = birth_time, u.birth_address = birth_address
	WHERE u.mobile_number = mobile_number AND u.country_code = country_code;
    
	SET message = "SUCCESS";
	SET isSuccess = 1;
    SELECT isSuccess,message,userId,full_name,email_id,mobile_number;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `update_payment`(IN payment_id VARCHAR(200), IN order_id VARCHAR(200), 
IN payment_method VARCHAR(200), IN payment_status VARCHAR(200), IN payment_relation_id VARCHAR(200))
BEGIN

declare userId int default null;
declare paymentFor varchar(200) default null;
declare isSuccess tinyint(1) default 0;
declare message varchar(100) default null;
declare paymentStatus varchar(200) default null;
declare isPaymentCaptureRepeating tinyint default 1;

DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          ROLLBACK;  -- rollback any changes made in the transaction
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;

Select pt.user_id, pt.payment_for, pt.payment_status into userId, paymentFor, paymentStatus from payment_transaction pt 
where pt.payment_relation_id = payment_relation_id;

if(paymentStatus = 'captured') then
SET message = "SUCCESS";
SET isSuccess = 1;
SET isPaymentCaptureRepeating = 0;
else 
UPDATE payment_transaction ps SET ps.payment_id = payment_id, ps.order_id = order_id, 
ps.payment_method = payment_method, ps.payment_status = payment_status, 
ps.paid_on = now() WHERE ps.payment_relation_id = payment_relation_id;

IF(paymentFor = "REGISTRATION") then
UPDATE user u SET u.payment_status = payment_status WHERE u.user_id = userId;
END IF; 

END IF;

SET message = "SUCCESS";
SET isSuccess = 1;

SELECT isSuccess, message, paymentFor,isPaymentCaptureRepeating;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_profile_pic` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `update_profile_pic`(IN userId bigint,IN profilePic varchar(800))
BEGIN
	UPDATE user SET profile_pic = profilePic
	WHERE user_id = userId ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_registration_settings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `update_registration_settings`(IN adminId BIGINT,IN settings_Id BIGINT,IN amount INT,IN currencySymbol varchar(45),IN currencyCode varchar(45))
BEGIN
	UPDATE registration_settings AS rs
	SET rs.registration_amount = amount,rs.admin_id = adminId , rs.updated_on = now() ,rs.currency_symbol = currencySymbol,rs.currency_code = currencyCode
	WHERE rs.settings_id = settings_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_all_attachments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `user_all_attachments`(IN thread_id VARCHAR (20))
BEGIN
	SELECT cm.media_url,cm.media_id,cm.file_name,cm.file_size,cm.created_on
	FROM question_converstations AS qc JOIN conversation_media AS cm
	ON qc.question_converstation_id = cm.conversation_id 
	WHERE qc.question_thread_id = thread_id
	ORDER BY cm.created_on DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_conversation_mail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `user_conversation_mail`(IN question_thread_id bigint)
BEGIN
SELECT u.username,u.user_id,u.email_id,qt.question_thread_id
	FROM question_threads as qt
	INNER JOIN  user as u
	ON u.user_id = qt.user_id
	where qt.question_thread_id = question_thread_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_lock_unlock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `user_lock_unlock`(IN isLocked tinyint(1), IN userId bigint, IN loggedInAdminId bigint)
BEGIN
    declare isSuccess tinyint(1) default 0;
    declare message varchar(100) default null;
    
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @sqlstate = RETURNED_SQLSTATE, 
		  @errno = MYSQL_ERRNO, @text = MESSAGE_TEXT;
		  SET @full_error = CONCAT("ERROR ", @errno, " (", @sqlstate, "): ", @text);
          
        SET message = "SQL_EXCEPTION";
		SET isSuccess = 0;
		SELECT isSuccess,message,@full_error;
    END;
		UPDATE user as u SET u.is_locked = isLocked ,u.locked_by = loggedInAdminId WHERE u.user_id = userId;
        if(isLocked = 1) THEN
			INSERT INTO user_lock_unlock_log (admin_id, user_id, action) VALUES (loggedInAdminId, userId, 'LOCK');
        ELSE
			INSERT INTO user_lock_unlock_log (admin_id, user_id, action) VALUES (loggedInAdminId, userId, 'UNLOCK');
        END IF;
        
        SET message = "SUCCESS";
		SET isSuccess = 1;
    SELECT isSuccess,message,isLocked;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_logincheck` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `user_logincheck`(IN mobile_number VARCHAR(500))
BEGIN
	SELECT * FROM user u WHERE u.mobile_number = mobile_number;
    -- AND is_locked = "0";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login_mobile_number` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `user_login_mobile_number`(IN country_code VARCHAR(10), IN mobile_number VARCHAR(20))
BEGIN
	DECLARE is_valid tinyint(1) default 0;
	DECLARE userId int default null;

	SELECT u.user_id, u.is_mobile_number_verified INTO userId, is_valid FROM user u 
	WHERE u.country_code = country_code AND u.mobile_number = mobile_number LIMIT 1;
	
    IF(userId is not null AND (is_valid = 0 OR is_valid is false)) THEN
		UPDATE user u SET u.is_mobile_number_verified = 1, u.mobile_verified_on = now() 
        WHERE u.user_id = userId;
	END IF;
	
    SELECT u.user_id,u.username,u.email_id,u.mobile_number,u.country_code, u.is_mobile_number_verified, 
    u.is_email_verified,u.profile_pic,u.gender, u.registration_type, u.payment_status, u.is_locked
	FROM user u WHERE u.country_code = country_code AND u.mobile_number = mobile_number;
    -- AND u.is_locked = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login_password`(IN country_code VARCHAR(10), IN mobile_number VARCHAR(20))
BEGIN
	SELECT u.user_id,u.username,u.email_id,u.mobile_number,u.country_code,
			u.is_mobile_number_verified,u.is_email_verified,u.profile_pic,
            u.gender,u.password, u.is_locked
    FROM user u 
    WHERE u.country_code = country_code AND u.mobile_number = mobile_number 
    AND u.is_mobile_number_verified = 1;
    -- AND u.is_locked = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_sent_received_attachments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`astromihir`@`%` PROCEDURE `user_sent_received_attachments`(in thread_id VARCHAR (20),in user_types VARCHAR (20))
BEGIN
	SELECT cm.media_url,cm.media_id,cm.file_name,cm.file_size,cm.created_on
	FROM question_converstations AS qc JOIN conversation_media AS cm
	ON qc.question_converstation_id = cm.conversation_id 
	WHERE qc.question_thread_id = thread_id AND cm.user_type = user_types
	ORDER BY cm.created_on DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-14 11:33:27

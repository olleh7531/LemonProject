-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lemon00
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `album` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `album_name` varchar(200) DEFAULT NULL,
  `release` date NOT NULL,
  `album_art_img` text,
  `agency` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'그래프 테스트','2018-10-05',NULL,NULL),(2,'그래프 테스트2','2018-10-05',NULL,NULL),(3,'아이티윌','2018-10-05',NULL,NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `board_num` int(11) NOT NULL,
  `post_num` int(11) NOT NULL,
  `cmt_num` int(11) NOT NULL,
  `cmt_reply` varchar(50) DEFAULT NULL,
  `cmt_secret` tinyint(4) DEFAULT '0',
  `cmt_content` text NOT NULL,
  `cmt_email` varchar(100) NOT NULL,
  `cmt_timestamp` timestamp NOT NULL,
  `cmt_updated_timestamp` timestamp NULL DEFAULT NULL,
  `cmt_ip` varchar(15) NOT NULL,
  `cmt_like` int(11) DEFAULT '0',
  `cmt_dislike` int(11) DEFAULT '0',
  `cmt_blame` mediumint(9) DEFAULT '0',
  `cmt_device` varchar(45) NOT NULL,
  `cmt_del` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`no`),
  KEY `cmt_mem_email_fk_idx` (`cmt_email`),
  CONSTRAINT `cmt_mem_email_fk` FOREIGN KEY (`cmt_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_log`
--

DROP TABLE IF EXISTS `download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `download_log` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `down_level` tinyint(4) NOT NULL,
  `down_user_email` varchar(100) NOT NULL,
  `down_user_ip` varchar(15) NOT NULL,
  `down_music_num` int(11) NOT NULL,
  `down_datetime` timestamp NOT NULL,
  PRIMARY KEY (`no`),
  KEY `down_mem_email_fk_idx` (`down_user_email`),
  KEY `down_music_num_fk_idx` (`down_music_num`),
  CONSTRAINT `down_mem_email_fk` FOREIGN KEY (`down_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `down_music_num_fk` FOREIGN KEY (`down_music_num`) REFERENCES `music` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_log`
--

LOCK TABLES `download_log` WRITE;
/*!40000 ALTER TABLE `download_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `download_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `friends` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(100) NOT NULL,
  `receive_id` varchar(100) NOT NULL,
  `check` tinyint(4) DEFAULT '0',
  `follow_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  KEY `member_follow_fk_idx` (`sender_id`,`receive_id`),
  KEY `member_receive_fk_idx` (`receive_id`),
  CONSTRAINT `fr_receive_email_fk` FOREIGN KEY (`receive_id`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fr_send_email_fk` FOREIGN KEY (`sender_id`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good`
--

DROP TABLE IF EXISTS `good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `good` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `music_no` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `good_member_fk_idx` (`user_email`),
  KEY `music_no_fk_idx` (`music_no`),
  CONSTRAINT `good_member_email_fk` FOREIGN KEY (`user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `good_music_no_fk` FOREIGN KEY (`music_no`) REFERENCES `music` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good`
--

LOCK TABLES `good` WRITE;
/*!40000 ALTER TABLE `good` DISABLE KEYS */;
/*!40000 ALTER TABLE `good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hashtag` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(20) NOT NULL,
  `hash_music_num` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `hash_music_num_fk_idx` (`hash_music_num`),
  CONSTRAINT `hash_music_num_fk` FOREIGN KEY (`hash_music_num`) REFERENCES `music` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquire`
--

DROP TABLE IF EXISTS `inquire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inquire` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `inqu_sort` varchar(50) NOT NULL,
  `inqu_subject` varchar(100) NOT NULL,
  `inqu_condition` varchar(45) NOT NULL DEFAULT '접수중',
  `inqu_register_date` timestamp NOT NULL,
  `user_nickname` varchar(100) NOT NULL COMMENT '유저 닉네임',
  PRIMARY KEY (`no`),
  KEY `inq_mem_nick_fk0_idx` (`user_nickname`),
  CONSTRAINT `inq_mem_nick_fk0` FOREIGN KEY (`user_nickname`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquire`
--

LOCK TABLES `inquire` WRITE;
/*!40000 ALTER TABLE `inquire` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazine`
--

DROP TABLE IF EXISTS `magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `magazine` (
  `no` int(11) NOT NULL,
  `ma_subject` varchar(100) NOT NULL,
  `ma_readcount` int(11) DEFAULT NULL,
  `ma_register_date` timestamp NOT NULL,
  `ma_content` text NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazine`
--

LOCK TABLES `magazine` WRITE;
/*!40000 ALTER TABLE `magazine` DISABLE KEYS */;
/*!40000 ALTER TABLE `magazine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `member` (
  `email_id` varchar(100) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `birth` varchar(10) NOT NULL,
  `level` tinyint(4) DEFAULT '0',
  `img` text,
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `register_date` datetime NOT NULL,
  `register_ip` varchar(15) NOT NULL,
  `is_deny` tinyint(4) NOT NULL DEFAULT '0',
  `chk` tinyint(4) NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `no_UNIQUE` (`no`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('test1','1234','테스트','테스트1','남','1995-02-01',NULL,NULL,1,'2018-10-05 00:00:00','255.255.255.255',0,0),('test2','1234','테스트','테스트2','남','1995-02-01',NULL,NULL,2,'2018-10-05 12:32:07','255.255.255.255',0,0),('test3','1234','테스트','테스트3','남','1995-02-01',NULL,NULL,5,'2018-10-05 11:23:44','255.255.255.255',0,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `track_no` int(11) DEFAULT NULL,
  `music_name` varchar(200) NOT NULL,
  `singer_name` varchar(200) NOT NULL,
  `lyrics` text,
  `album_num` int(11) DEFAULT NULL,
  `musicfile` text,
  PRIMARY KEY (`no`),
  KEY `album_music_albumname_idx` (`album_num`),
  CONSTRAINT `music_album_num_fk` FOREIGN KEY (`album_num`) REFERENCES `album` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
INSERT INTO `music` VALUES (1,1,'1번음악','그래프 테스트',NULL,1,NULL),(2,2,'2번음악','그래프 테스트',NULL,1,NULL),(3,3,'3번음악','그래프 테스트',NULL,1,NULL),(4,4,'4번음악','그래프 테스트',NULL,1,NULL),(5,1,'그래프1','그래프 테스트2',NULL,2,NULL),(6,2,'그래프2','그래프 테스트2',NULL,2,NULL),(7,3,'그래프3','그래프 테스트2',NULL,2,NULL),(8,1,'아이티윌1','홍길동',NULL,3,NULL),(9,2,'아이티윌2','홍길동',NULL,3,NULL),(10,3,'아이티윌3','홍길동',NULL,3,NULL);
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_sub`
--

DROP TABLE IF EXISTS `music_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music_sub` (
  `music_no` int(11) NOT NULL,
  `mugood` int(11) DEFAULT '0',
  `mureadcount` int(11) DEFAULT '0',
  `musicVideo` text,
  `music_time` varchar(50) NOT NULL,
  `music_genre` varchar(45) NOT NULL,
  PRIMARY KEY (`music_no`),
  CONSTRAINT `sub_music_no_fk` FOREIGN KEY (`music_no`) REFERENCES `music` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music_sub`
--

LOCK TABLES `music_sub` WRITE;
/*!40000 ALTER TABLE `music_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `music_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_board`
--

DROP TABLE IF EXISTS `notice_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notice_board` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `noti_sort` varchar(50) NOT NULL,
  `noti_subject` varchar(100) NOT NULL,
  `noti_readcount` int(11) DEFAULT '0',
  `noti_nickname` varchar(30) NOT NULL COMMENT '관리자 닉네임',
  `noti_register_date` timestamp NOT NULL,
  `noti_content` text NOT NULL,
  PRIMARY KEY (`no`),
  KEY `member_notice_fk_idx` (`noti_nickname`),
  CONSTRAINT `noti_member_nick_fk` FOREIGN KEY (`noti_nickname`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_board`
--

LOCK TABLES `notice_board` WRITE;
/*!40000 ALTER TABLE `notice_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `playlist` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `music_no` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `play_member_fk_idx` (`user_email`),
  KEY `music_no_fk_idx` (`music_no`),
  CONSTRAINT `play_member_email_fk` FOREIGN KEY (`user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `play_music_no_fk` FOREIGN KEY (`music_no`) REFERENCES `music` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlog`
--

DROP TABLE IF EXISTS `playlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `playlog` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `music_no` int(11) NOT NULL,
  `Playtime` datetime NOT NULL,
  `p_user_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `plog_mem_email_fk_idx` (`user_email`),
  KEY `plog_mu_num_fk_idx` (`music_no`),
  CONSTRAINT `plog_mem_email_fk` FOREIGN KEY (`user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plog_mu_num_fk` FOREIGN KEY (`music_no`) REFERENCES `music` (`no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlog`
--

LOCK TABLES `playlog` WRITE;
/*!40000 ALTER TABLE `playlog` DISABLE KEYS */;
INSERT INTO `playlog` VALUES (3,'test1',1,'2018-10-05 11:23:44',''),(4,'test1',1,'2018-10-05 11:33:44',''),(5,'test1',1,'2018-10-05 11:35:44',''),(6,'test1',1,'2018-10-05 11:36:44',''),(7,'test1',1,'2018-10-05 11:37:44',''),(8,'test1',1,'2018-10-05 11:38:44',''),(9,'test1',1,'2018-10-05 11:39:44',''),(10,'test1',1,'2018-10-05 12:10:44',''),(11,'test1',1,'2018-10-05 12:11:44',''),(12,'test1',1,'2018-10-05 12:12:44',''),(13,'test1',1,'2018-10-05 12:13:44',''),(14,'test1',1,'2018-10-05 12:14:44',''),(15,'test1',1,'2018-10-05 12:15:44',''),(16,'test1',1,'2018-10-05 12:16:44',''),(17,'test1',1,'2018-10-05 12:17:44',''),(18,'test1',2,'2018-10-05 11:10:44',''),(19,'test1',2,'2018-10-05 11:11:44',''),(20,'test1',2,'2018-10-05 11:12:44',''),(21,'test1',2,'2018-10-05 11:13:44',''),(22,'test1',2,'2018-10-05 11:14:44',''),(23,'test1',2,'2018-10-05 11:15:44',''),(24,'test1',2,'2018-10-05 11:16:44',''),(25,'test1',2,'2018-10-05 11:17:44',''),(26,'test1',2,'2018-10-05 11:18:44',''),(27,'test1',2,'2018-10-05 11:19:44',''),(28,'test1',2,'2018-10-05 11:20:44',''),(29,'test1',2,'2018-10-05 11:22:44',''),(30,'test1',2,'2018-10-05 11:25:44',''),(31,'test1',2,'2018-10-05 12:25:44',''),(32,'test1',2,'2018-10-05 12:26:44',''),(33,'test1',2,'2018-10-05 12:27:44',''),(34,'test1',2,'2018-10-05 12:28:44',''),(35,'test1',2,'2018-10-05 12:29:44',''),(36,'test1',2,'2018-10-05 12:30:44',''),(37,'test2',2,'2018-10-05 12:30:44',''),(38,'test2',2,'2018-10-05 12:31:44',''),(39,'test2',2,'2018-10-05 11:31:44',''),(40,'test2',2,'2018-10-05 11:35:44','');
/*!40000 ALTER TABLE `playlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rating` (
  `album_num` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `rating_mem_id` varchar(100) NOT NULL,
  PRIMARY KEY (`album_num`),
  KEY `rating_mem_email_fk_idx` (`rating_mem_id`),
  CONSTRAINT `rating_album_num_fk` FOREIGN KEY (`album_num`) REFERENCES `album` (`no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rating_mem_email_fk` FOREIGN KEY (`rating_mem_id`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `search` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `search_keyword` text NOT NULL,
  `search_date` timestamp NULL DEFAULT NULL,
  `search_ip` varchar(15) NOT NULL,
  `search_eamil` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-16 18:52:43

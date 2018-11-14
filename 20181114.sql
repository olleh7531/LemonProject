-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lemon
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
  `al_num` int(11) NOT NULL AUTO_INCREMENT,
  `al_name` varchar(200) DEFAULT NULL,
  `al_release` date NOT NULL,
  `al_art_img` text,
  `al_agency` varchar(100) DEFAULT NULL,
  `al_content` text,
  PRIMARY KEY (`al_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist_photo`
--

DROP TABLE IF EXISTS `artist_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `artist_photo` (
  `ar_num` int(11) NOT NULL AUTO_INCREMENT,
  `ar_subject` varchar(200) DEFAULT NULL,
  `ar_content` text,
  `ar_registerdate` date DEFAULT NULL,
  `ar_readcount` int(11) DEFAULT NULL,
  `ar_singer_num` int(11) NOT NULL,
  `ar_photo` text,
  PRIMARY KEY (`ar_num`),
  KEY `ar_singer_num_fk_idx` (`ar_singer_num`),
  CONSTRAINT `ar_singer_num_fk` FOREIGN KEY (`ar_singer_num`) REFERENCES `singer` (`si_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist_photo`
--

LOCK TABLES `artist_photo` WRITE;
/*!40000 ALTER TABLE `artist_photo` DISABLE KEYS */;
INSERT INTO `artist_photo` VALUES (1,'아이유1','아\r\n이\r\n유','2018-11-13',0,1,'아이유1.jpg'),(2,'아이유2','아이유2','2018-11-13',0,1,'아이유2.jpg'),(3,'아이유3','아이유3','2018-11-13',0,1,'아이유3.jpg'),(4,'아이유4','아이유4','2018-11-13',0,1,'아이유4.jpg'),(5,'아이유5','아이유5','2018-11-13',0,1,'아이유5.jpg'),(6,'아이유6','아이유6','2018-11-13',0,1,'아이유6.jpg'),(7,'아이유7','아이유7','2018-11-13',0,1,'아이유7.jpg'),(8,'아이유8','아이유8','2018-11-13',0,1,'아이유8.jpg'),(9,'아이유9','아이유9','2018-11-13',0,1,'아이유9.jpg'),(10,'아이유10','아이유10','2018-11-13',0,1,'아이유10.jpg'),(11,'아이유11','아이유11','2018-11-13',0,1,'아이유11.jpg'),(12,'아이유12','아이유12','2018-11-13',0,1,'아이유12.jpg'),(13,'아이유13','아이유13','2018-11-13',0,1,'아이유13.jpg'),(14,'아이유14','아이유14','2018-11-13',0,1,'아이유14.jpg'),(15,'아이유15','아이유15','2018-11-13',0,1,'아이유15.jpg'),(16,'아이유16','아이유16','2018-11-13',0,1,'아이유16.jpg'),(17,'아이유17','아이유17','2018-11-13',0,1,'아이유17.jpg'),(18,'아이유18','아이유18','2018-11-13',0,1,'아이유18.jpg'),(19,'아이유19','아이유19','2018-11-13',0,1,'아이유19.jpg'),(20,'아이유20','아이유20','2018-11-13',0,1,'아이유20.jpg'),(21,'아이유21','아이유21','2018-11-13',0,1,'아이유21.jpg'),(22,'아이유22','아이유22','2018-11-13',0,1,'아이유22.jpg'),(23,'아이유23','아이유23','2018-11-13',0,1,'아이유23.jpg'),(24,'아이유24','아이유24','2018-11-13',0,1,'아이유24.jpg'),(25,'아이유25','아이유25','2018-11-13',0,1,'아이유25.jpg'),(26,'아이유26','아이유26','2018-11-13',0,1,'아이유26.jpg');
/*!40000 ALTER TABLE `artist_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chart`
--

DROP TABLE IF EXISTS `chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chart` (
  `ch_num` int(11) NOT NULL AUTO_INCREMENT,
  `ch_music_num` int(11) DEFAULT NULL,
  `ch_playcnt` int(11) DEFAULT NULL,
  `ch_downcnt` int(11) DEFAULT NULL,
  `ch_updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`ch_num`),
  KEY `ch_music_num_idx` (`ch_music_num`),
  CONSTRAINT `ch_music_num` FOREIGN KEY (`ch_music_num`) REFERENCES `music` (`mu_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chart`
--

LOCK TABLES `chart` WRITE;
/*!40000 ALTER TABLE `chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `cmt_num` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_category` int(11) NOT NULL,
  `cmt_text_num` int(11) NOT NULL,
  `cmt_content` text NOT NULL,
  `cmt_email` varchar(100) NOT NULL,
  `cmt_timestamp` timestamp NOT NULL,
  `cmt_ip` varchar(15) NOT NULL,
  `cmt_like` int(11) DEFAULT '0',
  `cmt_dislike` int(11) DEFAULT '0',
  `cmt_blame` mediumint(9) DEFAULT '0',
  PRIMARY KEY (`cmt_num`),
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
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `conversation` (
  `con_num` int(11) NOT NULL AUTO_INCREMENT,
  `con_sender` varchar(45) DEFAULT NULL,
  `con_receiver` varchar(45) DEFAULT NULL,
  `con_content` varchar(1000) DEFAULT NULL,
  `sendtime` date DEFAULT NULL,
  `channel` int(11) DEFAULT NULL,
  PRIMARY KEY (`con_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_config`
--

DROP TABLE IF EXISTS `download_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `download_config` (
  `doc_user_email` varchar(100) NOT NULL,
  `doc_cookie1` varchar(45) DEFAULT NULL,
  `doc_cookie2` varchar(45) DEFAULT NULL,
  `doc_cookie3` varchar(45) DEFAULT NULL,
  `doc_downcnt` int(11) DEFAULT NULL,
  `doc_ckcnt` int(11) DEFAULT NULL,
  `ck1_updatetime` datetime DEFAULT NULL,
  `ck2_updatetime` datetime DEFAULT NULL,
  `ck3_updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`doc_user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_config`
--

LOCK TABLES `download_config` WRITE;
/*!40000 ALTER TABLE `download_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `download_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `download_log`
--

DROP TABLE IF EXISTS `download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `download_log` (
  `do_num` int(11) NOT NULL AUTO_INCREMENT,
  `do_level` tinyint(4) NOT NULL,
  `do_user_email` varchar(100) NOT NULL,
  `do_user_ip` varchar(15) NOT NULL,
  `do_music_num` int(11) NOT NULL,
  `do_downtime` timestamp NOT NULL,
  PRIMARY KEY (`do_num`),
  KEY `down_mem_email_fk_idx` (`do_user_email`),
  KEY `down_music_num_fk_idx` (`do_music_num`),
  CONSTRAINT `down_mem_email_fk` FOREIGN KEY (`do_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `down_music_num_fk` FOREIGN KEY (`do_music_num`) REFERENCES `music` (`mu_num`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `download_log2`
--

DROP TABLE IF EXISTS `download_log2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `download_log2` (
  `do2_num` int(11) NOT NULL AUTO_INCREMENT,
  `do2_level` tinyint(4) NOT NULL,
  `do2_user_email` varchar(100) NOT NULL,
  `do2_user_ip` varchar(15) NOT NULL,
  `do2_music_num` int(11) NOT NULL,
  `do2_downtime` timestamp NOT NULL,
  PRIMARY KEY (`do2_num`),
  KEY `do2_mem_email_fk_idx` (`do2_user_email`),
  KEY `do2_music_num_fk_idx` (`do2_music_num`),
  CONSTRAINT `do2_mem_email_fk` FOREIGN KEY (`do2_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `do2_music_num_fk` FOREIGN KEY (`do2_music_num`) REFERENCES `music` (`mu_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='????????? ??? ???????????? ????? ???? ??????? ??';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `download_log2`
--

LOCK TABLES `download_log2` WRITE;
/*!40000 ALTER TABLE `download_log2` DISABLE KEYS */;
/*!40000 ALTER TABLE `download_log2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `friends` (
  `fr_num` int(11) NOT NULL AUTO_INCREMENT,
  `sender_nick` varchar(100) NOT NULL,
  `receiver_nick` varchar(100) NOT NULL,
  `fr_check` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`fr_num`),
  KEY `fr_send_nickl_fk_idx` (`sender_nick`),
  KEY `fr_receive_nick_fk_idx` (`receiver_nick`),
  CONSTRAINT `fr_receive_nick_fk` FOREIGN KEY (`receiver_nick`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fr_send_nickl_fk` FOREIGN KEY (`sender_nick`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `go_num` int(11) NOT NULL AUTO_INCREMENT,
  `go_user_email` varchar(100) NOT NULL,
  `go_category` int(11) NOT NULL,
  `go_text_num` int(11) NOT NULL COMMENT '?? ???????? ??',
  PRIMARY KEY (`go_num`),
  KEY `go_user_email_fk_idx` (`go_user_email`),
  CONSTRAINT `go_user_email_fk` FOREIGN KEY (`go_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `ha_num` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(20) NOT NULL,
  `ha_music_num` int(11) NOT NULL,
  PRIMARY KEY (`ha_num`),
  KEY `hash_music_num_fk_idx` (`ha_music_num`),
  CONSTRAINT `hash_music_num_fk` FOREIGN KEY (`ha_music_num`) REFERENCES `music` (`mu_num`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `helpboard`
--

DROP TABLE IF EXISTS `helpboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `helpboard` (
  `he_num` int(11) NOT NULL AUTO_INCREMENT,
  `he_category1` varchar(30) NOT NULL,
  `he_category2` varchar(30) DEFAULT NULL,
  `environment` varchar(30) DEFAULT NULL,
  `os` varchar(30) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `anwser_status` varchar(20) DEFAULT '0',
  `he_nickname` varchar(30) NOT NULL COMMENT '?????? ?????',
  `he_register_date` timestamp NOT NULL,
  `he_subject` varchar(100) NOT NULL,
  `he_content` text NOT NULL,
  `answer_content` text,
  `answer_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`he_num`),
  KEY `member_notice_fk_idx` (`he_nickname`),
  CONSTRAINT `noti_member_nick_fk` FOREIGN KEY (`he_nickname`) REFERENCES `member` (`nickname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `helpboard`
--

LOCK TABLES `helpboard` WRITE;
/*!40000 ALTER TABLE `helpboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `helpboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazine`
--

DROP TABLE IF EXISTS `magazine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `magazine` (
  `ma_num` int(11) NOT NULL,
  `ma_category` varchar(45) DEFAULT NULL,
  `ma_subject` varchar(100) NOT NULL,
  `ma_readcount` int(11) DEFAULT NULL,
  `ma_register_date` timestamp NOT NULL,
  `ma_content` text NOT NULL,
  PRIMARY KEY (`ma_num`)
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
  `pass` varchar(30) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `birth` varchar(10) NOT NULL,
  `level` tinyint(4) DEFAULT '0',
  `img` text,
  `register_datetime` datetime NOT NULL,
  `register_ip` varchar(15) NOT NULL,
  `level_updatetime` datetime DEFAULT NULL,
  `is_deny` tinyint(4) NOT NULL DEFAULT '0',
  `chk` tinyint(4) NOT NULL,
  `mobile` varchar(13) DEFAULT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `address1` text,
  `address2` text,
  `email_cert` tinyint(4) DEFAULT NULL,
  `receive_email` tinyint(4) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music` (
  `mu_num` int(11) NOT NULL AUTO_INCREMENT,
  `music_name` varchar(200) NOT NULL,
  `lyrics` text,
  `musicfile` text NOT NULL,
  `music_genre` varchar(50) DEFAULT NULL,
  `music_time` varchar(8) DEFAULT NULL,
  `singer_num` int(11) DEFAULT NULL,
  `album_num` int(11) DEFAULT NULL,
  `track_num` int(11) DEFAULT NULL,
  `music_video` text,
  PRIMARY KEY (`mu_num`),
  KEY `album_music_albumname_idx` (`album_num`),
  KEY `music_singer_num_fk_idx` (`singer_num`),
  CONSTRAINT `music_album_num_fk` FOREIGN KEY (`album_num`) REFERENCES `album` (`al_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `music_singer_num_fk` FOREIGN KEY (`singer_num`) REFERENCES `singer` (`si_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `music`
--

LOCK TABLES `music` WRITE;
/*!40000 ALTER TABLE `music` DISABLE KEYS */;
/*!40000 ALTER TABLE `music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music_sub`
--

DROP TABLE IF EXISTS `music_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music_sub` (
  `ms_music_num` int(11) NOT NULL,
  `ms_playcount` int(11) DEFAULT '0',
  `ms_downcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`ms_music_num`),
  CONSTRAINT `ms_music_num_fk` FOREIGN KEY (`ms_music_num`) REFERENCES `music` (`mu_num`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notice` (
  `no_num` int(11) NOT NULL AUTO_INCREMENT,
  `no_category` varchar(30) NOT NULL,
  `no_subject` varchar(100) NOT NULL,
  `no_content` text NOT NULL,
  `no_readcount` int(11) DEFAULT NULL,
  `no_reg_date` date DEFAULT NULL,
  PRIMARY KEY (`no_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `playlist` (
  `pls_num` int(11) NOT NULL AUTO_INCREMENT,
  `pls_user_email` varchar(100) NOT NULL,
  `pls_music_num` int(11) NOT NULL,
  `pls_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`pls_num`),
  KEY `play_member_fk_idx` (`pls_user_email`),
  KEY `music_no_fk_idx` (`pls_music_num`),
  CONSTRAINT `pls_member_email_fk` FOREIGN KEY (`pls_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pls_music_num_fk` FOREIGN KEY (`pls_music_num`) REFERENCES `music` (`mu_num`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `pl_num` int(11) NOT NULL AUTO_INCREMENT,
  `pl_user_email` varchar(100) NOT NULL,
  `pl_music_num` int(11) NOT NULL,
  `pl_playtime` timestamp NOT NULL,
  `pl_user_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`pl_num`),
  KEY `plog_mem_email_fk_idx` (`pl_user_email`),
  KEY `plog_mu_num_fk_idx` (`pl_music_num`),
  CONSTRAINT `plog_mem_email_fk` FOREIGN KEY (`pl_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plog_mu_num_fk` FOREIGN KEY (`pl_music_num`) REFERENCES `music` (`mu_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlog`
--

LOCK TABLES `playlog` WRITE;
/*!40000 ALTER TABLE `playlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rating` (
  `ra_album_num` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `rating_mem_id` varchar(100) NOT NULL,
  PRIMARY KEY (`ra_album_num`),
  KEY `rating_mem_email_fk_idx` (`rating_mem_id`),
  CONSTRAINT `rating_album_num_fk` FOREIGN KEY (`ra_album_num`) REFERENCES `album` (`al_num`) ON DELETE CASCADE ON UPDATE CASCADE,
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
-- Table structure for table `search_chart`
--

DROP TABLE IF EXISTS `search_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `search_chart` (
  `sc_num` int(11) NOT NULL AUTO_INCREMENT,
  `sc_keyword` text,
  `sc_date` datetime DEFAULT NULL,
  `sc_gender1` int(11) DEFAULT NULL,
  `sc_gender2` int(11) DEFAULT NULL,
  `sc_generation1` int(11) DEFAULT NULL,
  `sc_generation2` int(11) DEFAULT NULL,
  `sc_generation3` int(11) DEFAULT NULL,
  `sc_generation4` int(11) DEFAULT NULL,
  `sc_generation5` int(11) DEFAULT NULL,
  `sc_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`sc_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_chart`
--

LOCK TABLES `search_chart` WRITE;
/*!40000 ALTER TABLE `search_chart` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchlog`
--

DROP TABLE IF EXISTS `searchlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `searchlog` (
  `se_num` int(11) NOT NULL AUTO_INCREMENT,
  `se_keyword` text NOT NULL,
  `se_date` timestamp NULL DEFAULT NULL,
  `se_ip` varchar(15) DEFAULT NULL,
  `se_eamil` varchar(100) DEFAULT NULL,
  `se_gender` varchar(5) DEFAULT NULL,
  `se_generation` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`se_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchlog`
--

LOCK TABLES `searchlog` WRITE;
/*!40000 ALTER TABLE `searchlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer`
--

DROP TABLE IF EXISTS `singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `singer` (
  `si_num` int(11) NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(10) NOT NULL,
  `singer_name` varchar(200) DEFAULT NULL,
  `real_name` varchar(200) DEFAULT NULL,
  `debut_year` date DEFAULT NULL,
  `debut_song` varchar(100) DEFAULT NULL,
  `si_agency` varchar(100) DEFAULT NULL,
  `si_picture` varchar(200) DEFAULT NULL,
  `si_genre` text,
  `si_birth` date DEFAULT NULL,
  `si_gender` varchar(5) DEFAULT NULL,
  `group_singer_num` text,
  PRIMARY KEY (`si_num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer`
--

LOCK TABLES `singer` WRITE;
/*!40000 ALTER TABLE `singer` DISABLE KEYS */;
INSERT INTO `singer` VALUES (1,'솔로','아이유','이지은','2008-09-17','미아','카카오M, 페이브엔터테인먼트','아이유-삐삐.PNG','발라드, 댄스, R&B/Soul','1993-05-15','여성',',,'),(2,'솔로','박명수','','1998-12-15','바보사랑','거성엔터테인먼트','박명수.jpg','발라드, 댄스','1970-08-26','남성',',,'),(3,'그룹','이유 갓지(GOD G) 않은 이유 (박명수, 아이유)','','2015-08-21','레옹','','이유 갓지(GOD G) 않은 이유 (박명수, 아이유).jpg','댄스',NULL,'혼성',',1,2,');
/*!40000 ALTER TABLE `singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starpost`
--

DROP TABLE IF EXISTS `starpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `starpost` (
  `st_num` int(11) NOT NULL,
  `st_file` text NOT NULL,
  `st_subject` varchar(100) DEFAULT NULL,
  `st_content` text NOT NULL,
  `st_readcount` int(11) DEFAULT NULL,
  `st_singer_num` int(11) NOT NULL,
  PRIMARY KEY (`st_num`),
  KEY `st_singer_num_fk_idx` (`st_singer_num`),
  CONSTRAINT `st_singer_num_fk` FOREIGN KEY (`st_singer_num`) REFERENCES `singer` (`si_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `starpost`
--

LOCK TABLES `starpost` WRITE;
/*!40000 ALTER TABLE `starpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `starpost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-14 10:17:27

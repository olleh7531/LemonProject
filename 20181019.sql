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
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `al_name` varchar(200) DEFAULT NULL,
  `al_release` date NOT NULL,
  `al_art_img` text,
  `al_agency` varchar(100) DEFAULT NULL,
  `al_content` text,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'그래프 테스트','2018-10-05',NULL,NULL,NULL),(2,'그래프 테스트2','2018-10-05',NULL,NULL,NULL),(3,'아이티윌','2018-10-05',NULL,NULL,NULL);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `board_num` int(11) NOT NULL,
  `post_num` int(11) NOT NULL,
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
  `cmt_ref` int(11) DEFAULT NULL,
  `cmt_lev` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
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
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `down_level` tinyint(4) NOT NULL,
  `down_user_email` varchar(100) NOT NULL,
  `down_user_ip` varchar(15) NOT NULL,
  `down_music_num` int(11) NOT NULL,
  `down_datetime` timestamp NOT NULL,
  PRIMARY KEY (`num`),
  KEY `down_mem_email_fk_idx` (`down_user_email`),
  KEY `down_music_num_fk_idx` (`down_music_num`),
  CONSTRAINT `down_mem_email_fk` FOREIGN KEY (`down_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `down_music_num_fk` FOREIGN KEY (`down_music_num`) REFERENCES `music` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(100) NOT NULL,
  `receive_id` varchar(100) NOT NULL,
  `check` tinyint(4) DEFAULT '0',
  `follow_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`num`),
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
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hashtag` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag` varchar(20) NOT NULL,
  `hash_music_num` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `hash_music_num_fk_idx` (`hash_music_num`),
  CONSTRAINT `hash_music_num_fk` FOREIGN KEY (`hash_music_num`) REFERENCES `music` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `he_category1` varchar(30) NOT NULL,
  `he_category2` varchar(30) DEFAULT NULL,
  `environment` varchar(30) DEFAULT NULL,
  `os` varchar(30) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `anwser_status` varchar(20) DEFAULT '0',
  `he_nickname` varchar(30) NOT NULL COMMENT '관리자 닉네임',
  `he_register_date` timestamp NOT NULL,
  `he_subject` varchar(100) NOT NULL,
  `he_content` text NOT NULL,
  `answer_content` text,
  `answer_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`num`),
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
  `num` int(11) NOT NULL,
  `ma_category` varchar(45) DEFAULT NULL,
  `ma_subject` varchar(100) NOT NULL,
  `ma_readcount` int(11) DEFAULT NULL,
  `ma_register_date` timestamp NOT NULL,
  `ma_content` text NOT NULL,
  PRIMARY KEY (`num`)
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
-- Table structure for table `mu_good`
--

DROP TABLE IF EXISTS `mu_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mu_good` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `mg_user_email` varchar(100) NOT NULL,
  `mg_music_no` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `good_member_fk_idx` (`mg_user_email`),
  KEY `music_no_fk_idx` (`mg_music_no`),
  CONSTRAINT `good_member_email_fk` FOREIGN KEY (`mg_user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `good_music_no_fk` FOREIGN KEY (`mg_music_no`) REFERENCES `music` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_good`
--

LOCK TABLES `mu_good` WRITE;
/*!40000 ALTER TABLE `mu_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `mu_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `music`
--

DROP TABLE IF EXISTS `music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `music` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `track_no` int(11) DEFAULT NULL,
  `music_name` varchar(200) NOT NULL,
  `singer_num` int(11) NOT NULL,
  `lyrics` text,
  `album_num` int(11) DEFAULT NULL,
  `musicfile` text,
  PRIMARY KEY (`num`),
  KEY `album_music_albumname_idx` (`album_num`),
  KEY `music_singer_num_fk_idx` (`singer_num`),
  CONSTRAINT `music_album_num_fk` FOREIGN KEY (`album_num`) REFERENCES `album` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `music_singer_num_fk` FOREIGN KEY (`singer_num`) REFERENCES `singer` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `music_num` int(11) NOT NULL,
  `mu_good` int(11) DEFAULT '0',
  `mu_readcount` int(11) DEFAULT '0',
  `mu_Video` text,
  `mu_time` varchar(50) NOT NULL,
  `mu_genre` varchar(45) NOT NULL,
  PRIMARY KEY (`music_num`),
  CONSTRAINT `sub_music_no_fk` FOREIGN KEY (`music_num`) REFERENCES `music` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `no_category` varchar(30) NOT NULL,
  `no_subject` varchar(100) NOT NULL,
  `no_content` text NOT NULL,
  `no_readcount` int(11) DEFAULT NULL,
  `no_reg_date` date DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'서비스 소식','ㅁㄴㅇㄹ','<p>ㅌㅊㅍㅋㅊㅍㅌㅋ</p>',1,'2018-10-19'),(2,'서비스 종료','ㄴㅇㄻ','<p>ㅋㅌㅊㅍㅌㅊㅍㅋㅌㅊㅍㅋ</p>',20,'2018-10-19');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `playlist` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `music_no` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `play_member_fk_idx` (`user_email`),
  KEY `music_no_fk_idx` (`music_no`),
  CONSTRAINT `play_member_email_fk` FOREIGN KEY (`user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `play_music_no_fk` FOREIGN KEY (`music_no`) REFERENCES `music` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(100) NOT NULL,
  `music_no` int(11) NOT NULL,
  `playtime` timestamp NOT NULL,
  `p_user_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `plog_mem_email_fk_idx` (`user_email`),
  KEY `plog_mu_num_fk_idx` (`music_no`),
  CONSTRAINT `plog_mem_email_fk` FOREIGN KEY (`user_email`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `plog_mu_num_fk` FOREIGN KEY (`music_no`) REFERENCES `music` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `album_num` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `rating_mem_id` varchar(100) NOT NULL,
  PRIMARY KEY (`album_num`),
  KEY `rating_mem_email_fk_idx` (`rating_mem_id`),
  CONSTRAINT `rating_album_num_fk` FOREIGN KEY (`album_num`) REFERENCES `album` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `search_keyword` text NOT NULL,
  `search_date` timestamp NULL DEFAULT NULL,
  `search_ip` varchar(15) NOT NULL,
  `search_eamil` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer`
--

DROP TABLE IF EXISTS `singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `singer` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `activity_type` varchar(10) NOT NULL,
  `singer_name` varchar(200) NOT NULL,
  `si_group_name` varchar(200) DEFAULT NULL,
  `debut_year` date DEFAULT NULL,
  `debut_song` varchar(100) DEFAULT NULL,
  `si_agency` varchar(100) DEFAULT NULL,
  `si_picture` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer`
--

LOCK TABLES `singer` WRITE;
/*!40000 ALTER TABLE `singer` DISABLE KEYS */;
/*!40000 ALTER TABLE `singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `st_good`
--

DROP TABLE IF EXISTS `st_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `st_good` (
  `num` int(11) NOT NULL,
  `sg_useremail` varchar(100) NOT NULL,
  `sg_num` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `sg_useremail_fk_idx` (`sg_useremail`),
  KEY `sg_num_idx` (`sg_num`),
  CONSTRAINT `sg_num` FOREIGN KEY (`sg_num`) REFERENCES `starpost` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sg_useremail_fk` FOREIGN KEY (`sg_useremail`) REFERENCES `member` (`email_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `st_good`
--

LOCK TABLES `st_good` WRITE;
/*!40000 ALTER TABLE `st_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `st_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `starpost`
--

DROP TABLE IF EXISTS `starpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `starpost` (
  `num` int(11) NOT NULL,
  `st_file` text NOT NULL,
  `st_subject` varchar(100) DEFAULT NULL,
  `st_content` text NOT NULL,
  `st_readcount` int(11) DEFAULT NULL,
  `st_singer_num` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `st_singer_num_fk_idx` (`st_singer_num`),
  CONSTRAINT `st_singer_num_fk` FOREIGN KEY (`st_singer_num`) REFERENCES `singer` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
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

-- Dump completed on 2018-10-19 17:23:05
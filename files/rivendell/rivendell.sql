-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Rivendell
-- ------------------------------------------------------
-- Server version	5.5.35-0+wheezy1

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
-- Table structure for table `AUDIO_PERMS`
--

DROP TABLE IF EXISTS `AUDIO_PERMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUDIO_PERMS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` char(10) DEFAULT NULL,
  `SERVICE_NAME` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GROUP_IDX` (`GROUP_NAME`),
  KEY `SERVICE_IDX` (`SERVICE_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUDIO_PERMS`
--

LOCK TABLES `AUDIO_PERMS` WRITE;
/*!40000 ALTER TABLE `AUDIO_PERMS` DISABLE KEYS */;
INSERT INTO `AUDIO_PERMS` VALUES (1,'TEMP','Production'),(2,'TEST','Production'),(3,'TRAFFIC','Production'),(4,'MUSIC','Production'),(5,'BEDS','Production'),(6,'STINGS','Production'),(7,'MACROS','Production'),(8,'LEGAL','Production'),(9,'IDENTS','Production');
/*!40000 ALTER TABLE `AUDIO_PERMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUDIO_PORTS`
--

DROP TABLE IF EXISTS `AUDIO_PORTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUDIO_PORTS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `CARD_NUMBER` int(11) NOT NULL,
  `CLOCK_SOURCE` int(11) DEFAULT '0',
  `INPUT_0_LEVEL` int(11) DEFAULT '0',
  `INPUT_0_TYPE` int(11) DEFAULT '0',
  `INPUT_0_MODE` int(11) DEFAULT '0',
  `INPUT_1_LEVEL` int(11) DEFAULT '0',
  `INPUT_1_TYPE` int(11) DEFAULT '0',
  `INPUT_1_MODE` int(11) DEFAULT '0',
  `INPUT_2_LEVEL` int(11) DEFAULT '0',
  `INPUT_2_TYPE` int(11) DEFAULT '0',
  `INPUT_2_MODE` int(11) DEFAULT '0',
  `INPUT_3_LEVEL` int(11) DEFAULT '0',
  `INPUT_3_TYPE` int(11) DEFAULT '0',
  `INPUT_3_MODE` int(11) DEFAULT '0',
  `INPUT_4_LEVEL` int(11) DEFAULT '0',
  `INPUT_4_TYPE` int(11) DEFAULT '0',
  `INPUT_4_MODE` int(11) DEFAULT '0',
  `INPUT_5_LEVEL` int(11) DEFAULT '0',
  `INPUT_5_TYPE` int(11) DEFAULT '0',
  `INPUT_5_MODE` int(11) DEFAULT '0',
  `INPUT_6_LEVEL` int(11) DEFAULT '0',
  `INPUT_6_TYPE` int(11) DEFAULT '0',
  `INPUT_6_MODE` int(11) DEFAULT '0',
  `INPUT_7_LEVEL` int(11) DEFAULT '0',
  `INPUT_7_TYPE` int(11) DEFAULT '0',
  `INPUT_7_MODE` int(11) DEFAULT '0',
  `OUTPUT_0_LEVEL` int(11) DEFAULT '0',
  `OUTPUT_1_LEVEL` int(11) DEFAULT '0',
  `OUTPUT_2_LEVEL` int(11) DEFAULT '0',
  `OUTPUT_3_LEVEL` int(11) DEFAULT '0',
  `OUTPUT_4_LEVEL` int(11) DEFAULT '0',
  `OUTPUT_5_LEVEL` int(11) DEFAULT '0',
  `OUTPUT_6_LEVEL` int(11) DEFAULT '0',
  `OUTPUT_7_LEVEL` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`),
  KEY `CARD_NUMBER_IDX` (`CARD_NUMBER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUDIO_PORTS`
--

LOCK TABLES `AUDIO_PORTS` WRITE;
/*!40000 ALTER TABLE `AUDIO_PORTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUDIO_PORTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTOFILLS`
--

DROP TABLE IF EXISTS `AUTOFILLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTOFILLS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SERVICE` char(10) DEFAULT NULL,
  `CART_NUMBER` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SERVICE_IDX` (`SERVICE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTOFILLS`
--

LOCK TABLES `AUTOFILLS` WRITE;
/*!40000 ALTER TABLE `AUTOFILLS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUTOFILLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUX_METADATA`
--

DROP TABLE IF EXISTS `AUX_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUX_METADATA` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FEED_ID` int(10) unsigned DEFAULT NULL,
  `VAR_NAME` char(16) DEFAULT NULL,
  `CAPTION` char(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FEED_ID_IDX` (`FEED_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUX_METADATA`
--

LOCK TABLES `AUX_METADATA` WRITE;
/*!40000 ALTER TABLE `AUX_METADATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `AUX_METADATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CART`
--

DROP TABLE IF EXISTS `CART`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CART` (
  `NUMBER` int(10) unsigned NOT NULL,
  `TYPE` int(10) unsigned NOT NULL,
  `GROUP_NAME` char(10) NOT NULL,
  `TITLE` char(255) DEFAULT NULL,
  `ARTIST` char(255) DEFAULT NULL,
  `ALBUM` char(255) DEFAULT NULL,
  `YEAR` date DEFAULT NULL,
  `ISRC` char(12) DEFAULT NULL,
  `LABEL` char(64) DEFAULT NULL,
  `CONDUCTOR` char(64) DEFAULT NULL,
  `CLIENT` char(64) DEFAULT NULL,
  `AGENCY` char(64) DEFAULT NULL,
  `PUBLISHER` char(64) DEFAULT NULL,
  `COMPOSER` char(64) DEFAULT NULL,
  `USER_DEFINED` char(255) DEFAULT NULL,
  `SONG_ID` char(32) DEFAULT NULL,
  `BPM` int(10) unsigned DEFAULT '0',
  `USAGE_CODE` int(11) DEFAULT '0',
  `FORCED_LENGTH` int(10) unsigned DEFAULT NULL,
  `AVERAGE_LENGTH` int(10) unsigned DEFAULT NULL,
  `LENGTH_DEVIATION` int(10) unsigned DEFAULT '0',
  `AVERAGE_SEGUE_LENGTH` int(10) unsigned DEFAULT NULL,
  `AVERAGE_HOOK_LENGTH` int(10) unsigned DEFAULT '0',
  `CUT_QUANTITY` int(10) unsigned DEFAULT NULL,
  `LAST_CUT_PLAYED` int(10) unsigned DEFAULT NULL,
  `PLAY_ORDER` int(10) unsigned DEFAULT NULL,
  `VALIDITY` int(10) unsigned DEFAULT '2',
  `START_DATETIME` datetime DEFAULT NULL,
  `END_DATETIME` datetime DEFAULT NULL,
  `ENFORCE_LENGTH` enum('N','Y') DEFAULT 'N',
  `PRESERVE_PITCH` enum('N','Y') DEFAULT 'N',
  `ASYNCRONOUS` enum('N','Y') DEFAULT 'N',
  `OWNER` char(64) DEFAULT NULL,
  `MACROS` text,
  `SCHED_CODES` varchar(255) DEFAULT NULL,
  `NOTES` text,
  `METADATA_DATETIME` datetime DEFAULT NULL,
  `USE_EVENT_LENGTH` enum('N','Y') DEFAULT 'N',
  PRIMARY KEY (`NUMBER`),
  KEY `GROUP_NAME_IDX` (`GROUP_NAME`),
  KEY `TITLE_IDX` (`TITLE`),
  KEY `ARTIST_IDX` (`ARTIST`),
  KEY `ALBUM_IDX` (`ALBUM`),
  KEY `LABEL_IDX` (`LABEL`),
  KEY `CLIENT_IDX` (`CLIENT`),
  KEY `AGENCY_IDX` (`AGENCY`),
  KEY `PUBLISHER_IDX` (`PUBLISHER`),
  KEY `COMPOSER_IDX` (`COMPOSER`),
  KEY `USER_DEFINED_IDX` (`USER_DEFINED`),
  KEY `OWNER_IDX` (`OWNER`),
  KEY `METADATA_DATETIME_IDX` (`METADATA_DATETIME`),
  KEY `CONDUCTOR_IDX` (`CONDUCTOR`),
  KEY `SONG_ID_IDX` (`SONG_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CART`
--

LOCK TABLES `CART` WRITE;
/*!40000 ALTER TABLE `CART` DISABLE KEYS */;
INSERT INTO `CART` VALUES (999999,1,'TEST','Test Tone','Rivendell Radio Automation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,10000,NULL,0,NULL,0,1,NULL,NULL,2,NULL,NULL,'N','N','N',NULL,NULL,NULL,NULL,'2011-11-10 07:44:47','N');
/*!40000 ALTER TABLE `CART` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CARTSLOTS`
--

DROP TABLE IF EXISTS `CARTSLOTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CARTSLOTS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `SLOT_NUMBER` int(10) unsigned NOT NULL,
  `MODE` int(11) NOT NULL DEFAULT '0',
  `DEFAULT_MODE` int(11) NOT NULL DEFAULT '-1',
  `STOP_ACTION` int(11) NOT NULL DEFAULT '0',
  `DEFAULT_STOP_ACTION` int(11) NOT NULL DEFAULT '-1',
  `CART_NUMBER` int(11) DEFAULT '0',
  `DEFAULT_CART_NUMBER` int(11) NOT NULL DEFAULT '0',
  `HOOK_MODE` int(11) DEFAULT '0',
  `DEFAULT_HOOK_MODE` int(11) DEFAULT '-1',
  `SERVICE_NAME` char(10) DEFAULT NULL,
  `CARD` int(11) NOT NULL DEFAULT '0',
  `INPUT_PORT` int(11) NOT NULL DEFAULT '0',
  `OUTPUT_PORT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`,`SLOT_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARTSLOTS`
--

LOCK TABLES `CARTSLOTS` WRITE;
/*!40000 ALTER TABLE `CARTSLOTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CARTSLOTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIPBOARD`
--

DROP TABLE IF EXISTS `CLIPBOARD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIPBOARD` (
  `CUT_NAME` char(12) NOT NULL,
  `CART_NUMBER` int(10) unsigned NOT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  `OUTCUE` char(64) DEFAULT NULL,
  `LENGTH` int(10) unsigned DEFAULT NULL,
  `ORIGIN_DATETIME` datetime DEFAULT NULL,
  `ORIGIN_NAME` char(64) DEFAULT NULL,
  `WEIGHT` int(10) unsigned DEFAULT '1',
  `LAST_PLAY_DATETIME` datetime DEFAULT NULL,
  `PLAY_COUNTER` int(10) unsigned DEFAULT '0',
  `CODING_FORMAT` int(10) unsigned DEFAULT NULL,
  `SAMPLE_RATE` int(10) unsigned DEFAULT NULL,
  `BIT_RATE` int(10) unsigned DEFAULT NULL,
  `CHANNELS` int(10) unsigned DEFAULT NULL,
  `PLAY_GAIN` int(11) DEFAULT '0',
  `START_POINT` int(11) DEFAULT '-1',
  `END_POINT` int(11) DEFAULT '-1',
  `FADEUP_POINT` int(11) DEFAULT '-1',
  `FADEDOWN_POINT` int(11) DEFAULT '-1',
  `SEGUE_START_POINT` int(11) DEFAULT '-1',
  `SEGUE_END_POINT` int(11) DEFAULT '-1',
  `HOOK_START_POINT` int(11) DEFAULT '-1',
  `HOOK_END_POINT` int(11) DEFAULT '-1',
  `TALK_START_POINT` int(11) DEFAULT '-1',
  `TALK_END_POINT` int(11) DEFAULT '-1',
  PRIMARY KEY (`CUT_NAME`),
  KEY `CART_NUMBER_IDX` (`CART_NUMBER`),
  KEY `DESCRIPTION_IDX` (`DESCRIPTION`),
  KEY `OUTCUE_IDX` (`OUTCUE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIPBOARD`
--

LOCK TABLES `CLIPBOARD` WRITE;
/*!40000 ALTER TABLE `CLIPBOARD` DISABLE KEYS */;
INSERT INTO `CLIPBOARD` VALUES ('clip',0,'Default Clipboard',NULL,NULL,NULL,NULL,1,NULL,0,NULL,NULL,NULL,NULL,0,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1);
/*!40000 ALTER TABLE `CLIPBOARD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLOCKS`
--

DROP TABLE IF EXISTS `CLOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLOCKS` (
  `NAME` char(64) NOT NULL,
  `SHORT_NAME` char(8) DEFAULT NULL,
  `ARTISTSEP` int(10) unsigned DEFAULT NULL,
  `COLOR` char(7) DEFAULT NULL,
  `REMARKS` char(255) DEFAULT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLOCKS`
--

LOCK TABLES `CLOCKS` WRITE;
/*!40000 ALTER TABLE `CLOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLOCK_PERMS`
--

DROP TABLE IF EXISTS `CLOCK_PERMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLOCK_PERMS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CLOCK_NAME` char(64) DEFAULT NULL,
  `SERVICE_NAME` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`CLOCK_NAME`),
  KEY `SERVICE_IDX` (`SERVICE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLOCK_PERMS`
--

LOCK TABLES `CLOCK_PERMS` WRITE;
/*!40000 ALTER TABLE `CLOCK_PERMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLOCK_PERMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUTS`
--

DROP TABLE IF EXISTS `CUTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUTS` (
  `CUT_NAME` char(12) NOT NULL,
  `CART_NUMBER` int(10) unsigned NOT NULL,
  `EVERGREEN` enum('N','Y') DEFAULT 'N',
  `DESCRIPTION` char(64) DEFAULT NULL,
  `OUTCUE` char(64) DEFAULT NULL,
  `ISRC` char(12) DEFAULT NULL,
  `ISCI` char(32) DEFAULT NULL,
  `LENGTH` int(10) unsigned DEFAULT NULL,
  `ORIGIN_DATETIME` datetime DEFAULT NULL,
  `START_DATETIME` datetime DEFAULT NULL,
  `END_DATETIME` datetime DEFAULT NULL,
  `SUN` enum('N','Y') DEFAULT 'Y',
  `MON` enum('N','Y') DEFAULT 'Y',
  `TUE` enum('N','Y') DEFAULT 'Y',
  `WED` enum('N','Y') DEFAULT 'Y',
  `THU` enum('N','Y') DEFAULT 'Y',
  `FRI` enum('N','Y') DEFAULT 'Y',
  `SAT` enum('N','Y') DEFAULT 'Y',
  `START_DAYPART` time DEFAULT NULL,
  `END_DAYPART` time DEFAULT NULL,
  `ORIGIN_NAME` char(64) DEFAULT NULL,
  `WEIGHT` int(10) unsigned DEFAULT '1',
  `LAST_PLAY_DATETIME` datetime DEFAULT NULL,
  `UPLOAD_DATETIME` datetime DEFAULT NULL,
  `PLAY_COUNTER` int(10) unsigned DEFAULT '0',
  `LOCAL_COUNTER` int(10) unsigned DEFAULT '0',
  `VALIDITY` int(10) unsigned DEFAULT '2',
  `CODING_FORMAT` int(10) unsigned DEFAULT NULL,
  `SAMPLE_RATE` int(10) unsigned DEFAULT NULL,
  `BIT_RATE` int(10) unsigned DEFAULT NULL,
  `CHANNELS` int(10) unsigned DEFAULT NULL,
  `PLAY_GAIN` int(11) DEFAULT '0',
  `START_POINT` int(11) DEFAULT '-1',
  `END_POINT` int(11) DEFAULT '-1',
  `FADEUP_POINT` int(11) DEFAULT '-1',
  `FADEDOWN_POINT` int(11) DEFAULT '-1',
  `SEGUE_START_POINT` int(11) DEFAULT '-1',
  `SEGUE_END_POINT` int(11) DEFAULT '-1',
  `SEGUE_GAIN` int(11) DEFAULT '-3000',
  `HOOK_START_POINT` int(11) DEFAULT '-1',
  `HOOK_END_POINT` int(11) DEFAULT '-1',
  `TALK_START_POINT` int(11) DEFAULT '-1',
  `TALK_END_POINT` int(11) DEFAULT '-1',
  PRIMARY KEY (`CUT_NAME`),
  KEY `CART_NUMBER_IDX` (`CART_NUMBER`),
  KEY `DESCRIPTION_IDX` (`DESCRIPTION`),
  KEY `OUTCUE_IDX` (`OUTCUE`),
  KEY `ORIGIN_DATETIME_IDX` (`ORIGIN_DATETIME`),
  KEY `START_DATETIME_IDX` (`START_DATETIME`),
  KEY `END_DATETIME_IDX` (`END_DATETIME`),
  KEY `ISCI_IDX` (`ISCI`),
  KEY `ISRC_IDX` (`ISRC`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUTS`
--

LOCK TABLES `CUTS` WRITE;
/*!40000 ALTER TABLE `CUTS` DISABLE KEYS */;
INSERT INTO `CUTS` VALUES ('999999_001',999999,'N','1 kHz at Reference Level [-16 dBFS]','[tone]',NULL,NULL,10000,'2011-11-10 07:44:47',NULL,NULL,'Y','Y','Y','Y','Y','Y','Y',NULL,NULL,'RDGen',1,NULL,NULL,0,0,2,0,48000,0,2,0,0,10000,-1,-1,-1,-1,-3000,-1,-1,-1,-1);
/*!40000 ALTER TABLE `CUTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DECKS`
--

DROP TABLE IF EXISTS `DECKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DECKS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `CHANNEL` int(10) unsigned NOT NULL,
  `CARD_NUMBER` int(11) DEFAULT '-1',
  `STREAM_NUMBER` int(11) DEFAULT '-1',
  `PORT_NUMBER` int(11) DEFAULT '-1',
  `MON_PORT_NUMBER` int(11) DEFAULT '-1',
  `DEFAULT_MONITOR_ON` enum('N','Y') DEFAULT 'N',
  `PORT_TYPE` enum('A','D') DEFAULT 'A',
  `DEFAULT_FORMAT` int(11) DEFAULT '0',
  `DEFAULT_CHANNELS` int(11) DEFAULT '2',
  `DEFAULT_SAMPRATE` int(11) DEFAULT '44100',
  `DEFAULT_BITRATE` int(11) DEFAULT '0',
  `DEFAULT_THRESHOLD` int(11) DEFAULT '0',
  `SWITCH_STATION` char(64) DEFAULT NULL,
  `SWITCH_MATRIX` int(11) DEFAULT '-1',
  `SWITCH_OUTPUT` int(11) DEFAULT '-1',
  `SWITCH_DELAY` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`),
  KEY `CHANNEL_IDX` (`CHANNEL`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DECKS`
--

LOCK TABLES `DECKS` WRITE;
/*!40000 ALTER TABLE `DECKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DECKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DROPBOXES`
--

DROP TABLE IF EXISTS `DROPBOXES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DROPBOXES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) DEFAULT NULL,
  `GROUP_NAME` char(10) DEFAULT NULL,
  `PATH` char(255) DEFAULT NULL,
  `NORMALIZATION_LEVEL` int(11) DEFAULT '1',
  `AUTOTRIM_LEVEL` int(11) DEFAULT '1',
  `SINGLE_CART` enum('N','Y') DEFAULT 'N',
  `TO_CART` int(10) unsigned DEFAULT '0',
  `USE_CARTCHUNK_ID` enum('N','Y') DEFAULT 'N',
  `TITLE_FROM_CARTCHUNK_ID` enum('N','Y') DEFAULT 'N',
  `DELETE_CUTS` enum('N','Y') DEFAULT 'N',
  `DELETE_SOURCE` enum('N','Y') DEFAULT 'Y',
  `METADATA_PATTERN` char(64) DEFAULT NULL,
  `STARTDATE_OFFSET` int(11) DEFAULT '0',
  `ENDDATE_OFFSET` int(11) DEFAULT '0',
  `FIX_BROKEN_FORMATS` enum('N','Y') DEFAULT 'N',
  `LOG_PATH` char(255) DEFAULT NULL,
  `IMPORT_CREATE_DATES` enum('N','Y') DEFAULT 'N',
  `CREATE_STARTDATE_OFFSET` int(11) DEFAULT '0',
  `CREATE_ENDDATE_OFFSET` int(11) DEFAULT '0',
  `SET_USER_DEFINED` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DROPBOXES`
--

LOCK TABLES `DROPBOXES` WRITE;
/*!40000 ALTER TABLE `DROPBOXES` DISABLE KEYS */;
/*!40000 ALTER TABLE `DROPBOXES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DROPBOX_PATHS`
--

DROP TABLE IF EXISTS `DROPBOX_PATHS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DROPBOX_PATHS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DROPBOX_ID` int(11) NOT NULL,
  `FILE_PATH` char(255) NOT NULL,
  `FILE_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FILE_PATH_IDX` (`DROPBOX_ID`,`FILE_PATH`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DROPBOX_PATHS`
--

LOCK TABLES `DROPBOX_PATHS` WRITE;
/*!40000 ALTER TABLE `DROPBOX_PATHS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DROPBOX_PATHS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENCODERS`
--

DROP TABLE IF EXISTS `ENCODERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENCODERS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` char(32) NOT NULL,
  `STATION_NAME` char(64) DEFAULT NULL,
  `COMMAND_LINE` char(255) DEFAULT NULL,
  `DEFAULT_EXTENSION` char(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NAME_IDX` (`NAME`,`STATION_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENCODERS`
--

LOCK TABLES `ENCODERS` WRITE;
/*!40000 ALTER TABLE `ENCODERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENCODERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENCODER_BITRATES`
--

DROP TABLE IF EXISTS `ENCODER_BITRATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENCODER_BITRATES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENCODER_ID` int(11) NOT NULL,
  `BITRATES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENCODER_ID_IDX` (`ENCODER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENCODER_BITRATES`
--

LOCK TABLES `ENCODER_BITRATES` WRITE;
/*!40000 ALTER TABLE `ENCODER_BITRATES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENCODER_BITRATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENCODER_CHANNELS`
--

DROP TABLE IF EXISTS `ENCODER_CHANNELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENCODER_CHANNELS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENCODER_ID` int(11) NOT NULL,
  `CHANNELS` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENCODER_ID_IDX` (`ENCODER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENCODER_CHANNELS`
--

LOCK TABLES `ENCODER_CHANNELS` WRITE;
/*!40000 ALTER TABLE `ENCODER_CHANNELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENCODER_CHANNELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ENCODER_SAMPLERATES`
--

DROP TABLE IF EXISTS `ENCODER_SAMPLERATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ENCODER_SAMPLERATES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENCODER_ID` int(11) NOT NULL,
  `SAMPLERATES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENCODER_ID_IDX` (`ENCODER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENCODER_SAMPLERATES`
--

LOCK TABLES `ENCODER_SAMPLERATES` WRITE;
/*!40000 ALTER TABLE `ENCODER_SAMPLERATES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ENCODER_SAMPLERATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTS`
--

DROP TABLE IF EXISTS `EVENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENTS` (
  `NAME` char(64) NOT NULL,
  `PROPERTIES` char(64) DEFAULT NULL,
  `DISPLAY_TEXT` char(64) DEFAULT NULL,
  `NOTE_TEXT` char(255) DEFAULT NULL,
  `PREPOSITION` int(11) DEFAULT '-1',
  `TIME_TYPE` int(11) DEFAULT '0',
  `GRACE_TIME` int(11) DEFAULT '0',
  `POST_POINT` enum('N','Y') DEFAULT 'N',
  `USE_AUTOFILL` enum('N','Y') DEFAULT 'N',
  `AUTOFILL_SLOP` int(11) DEFAULT '-1',
  `USE_TIMESCALE` enum('N','Y') DEFAULT 'N',
  `IMPORT_SOURCE` int(11) DEFAULT '0',
  `START_SLOP` int(11) DEFAULT '0',
  `END_SLOP` int(11) DEFAULT '0',
  `FIRST_TRANS_TYPE` int(11) DEFAULT '0',
  `DEFAULT_TRANS_TYPE` int(11) DEFAULT '0',
  `COLOR` char(7) DEFAULT NULL,
  `SCHED_GROUP` varchar(10) DEFAULT NULL,
  `TITLE_SEP` int(10) unsigned DEFAULT NULL,
  `HAVE_CODE` varchar(10) DEFAULT NULL,
  `HOR_SEP` int(10) unsigned DEFAULT NULL,
  `HOR_DIST` int(10) unsigned DEFAULT NULL,
  `NESTED_EVENT` char(64) DEFAULT NULL,
  `REMARKS` char(255) DEFAULT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTS`
--

LOCK TABLES `EVENTS` WRITE;
/*!40000 ALTER TABLE `EVENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_PERMS`
--

DROP TABLE IF EXISTS `EVENT_PERMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_PERMS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` char(64) DEFAULT NULL,
  `SERVICE_NAME` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`EVENT_NAME`),
  KEY `SERVICE_IDX` (`SERVICE_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_PERMS`
--

LOCK TABLES `EVENT_PERMS` WRITE;
/*!40000 ALTER TABLE `EVENT_PERMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_PERMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXTENDED_PANELS`
--

DROP TABLE IF EXISTS `EXTENDED_PANELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXTENDED_PANELS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) NOT NULL,
  `OWNER` char(64) NOT NULL,
  `PANEL_NO` int(11) NOT NULL,
  `ROW_NO` int(11) NOT NULL,
  `COLUMN_NO` int(11) NOT NULL,
  `LABEL` char(64) DEFAULT NULL,
  `CART` int(11) DEFAULT NULL,
  `DEFAULT_COLOR` char(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LOAD_IDX` (`TYPE`,`OWNER`,`PANEL_NO`),
  KEY `SAVE_IDX` (`TYPE`,`OWNER`,`PANEL_NO`,`ROW_NO`,`COLUMN_NO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXTENDED_PANELS`
--

LOCK TABLES `EXTENDED_PANELS` WRITE;
/*!40000 ALTER TABLE `EXTENDED_PANELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXTENDED_PANELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXTENDED_PANEL_NAMES`
--

DROP TABLE IF EXISTS `EXTENDED_PANEL_NAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXTENDED_PANEL_NAMES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) NOT NULL,
  `OWNER` char(64) NOT NULL,
  `PANEL_NO` int(11) NOT NULL,
  `NAME` char(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LOAD_IDX` (`TYPE`,`OWNER`,`PANEL_NO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXTENDED_PANEL_NAMES`
--

LOCK TABLES `EXTENDED_PANEL_NAMES` WRITE;
/*!40000 ALTER TABLE `EXTENDED_PANEL_NAMES` DISABLE KEYS */;
/*!40000 ALTER TABLE `EXTENDED_PANEL_NAMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEEDS`
--

DROP TABLE IF EXISTS `FEEDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEEDS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `KEY_NAME` char(8) NOT NULL,
  `CHANNEL_TITLE` char(255) DEFAULT NULL,
  `CHANNEL_DESCRIPTION` text,
  `CHANNEL_CATEGORY` char(64) DEFAULT NULL,
  `CHANNEL_LINK` char(255) DEFAULT NULL,
  `CHANNEL_COPYRIGHT` char(64) DEFAULT NULL,
  `CHANNEL_WEBMASTER` char(64) DEFAULT NULL,
  `CHANNEL_LANGUAGE` char(5) DEFAULT 'en-us',
  `BASE_URL` char(255) DEFAULT NULL,
  `BASE_PREAMBLE` char(255) DEFAULT NULL,
  `PURGE_URL` char(255) DEFAULT NULL,
  `PURGE_USERNAME` char(64) DEFAULT NULL,
  `PURGE_PASSWORD` char(64) DEFAULT NULL,
  `HEADER_XML` text,
  `CHANNEL_XML` text,
  `ITEM_XML` text,
  `CAST_ORDER` enum('N','Y') DEFAULT 'N',
  `MAX_SHELF_LIFE` int(11) DEFAULT NULL,
  `LAST_BUILD_DATETIME` datetime DEFAULT NULL,
  `ORIGIN_DATETIME` datetime DEFAULT NULL,
  `ENABLE_AUTOPOST` enum('N','Y') DEFAULT 'N',
  `KEEP_METADATA` enum('N','Y') DEFAULT 'Y',
  `UPLOAD_FORMAT` int(11) DEFAULT '2',
  `UPLOAD_CHANNELS` int(11) DEFAULT '2',
  `UPLOAD_SAMPRATE` int(11) DEFAULT '44100',
  `UPLOAD_BITRATE` int(11) DEFAULT '32000',
  `UPLOAD_QUALITY` int(11) DEFAULT '0',
  `UPLOAD_EXTENSION` char(16) DEFAULT 'mp3',
  `NORMALIZE_LEVEL` int(11) DEFAULT '-100',
  `REDIRECT_PATH` char(255) DEFAULT NULL,
  `MEDIA_LINK_MODE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `KEY_NAME` (`KEY_NAME`),
  KEY `KEY_NAME_IDX` (`KEY_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEEDS`
--

LOCK TABLES `FEEDS` WRITE;
/*!40000 ALTER TABLE `FEEDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEEDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEED_PERMS`
--

DROP TABLE IF EXISTS `FEED_PERMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEED_PERMS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER_NAME` char(255) DEFAULT NULL,
  `KEY_NAME` char(8) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_IDX` (`USER_NAME`),
  KEY `KEYNAME_IDX` (`KEY_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEED_PERMS`
--

LOCK TABLES `FEED_PERMS` WRITE;
/*!40000 ALTER TABLE `FEED_PERMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEED_PERMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GPIS`
--

DROP TABLE IF EXISTS `GPIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GPIS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `MATRIX` int(11) NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `MACRO_CART` int(11) DEFAULT '0',
  `OFF_MACRO_CART` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MATRIX_IDX` (`STATION_NAME`,`MATRIX`,`NUMBER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GPIS`
--

LOCK TABLES `GPIS` WRITE;
/*!40000 ALTER TABLE `GPIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `GPIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GPOS`
--

DROP TABLE IF EXISTS `GPOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GPOS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `MATRIX` int(11) NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `MACRO_CART` int(11) DEFAULT '0',
  `OFF_MACRO_CART` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MATRIX_IDX` (`STATION_NAME`,`MATRIX`,`NUMBER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GPOS`
--

LOCK TABLES `GPOS` WRITE;
/*!40000 ALTER TABLE `GPOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `GPOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUPS`
--

DROP TABLE IF EXISTS `GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUPS` (
  `NAME` char(10) NOT NULL,
  `DESCRIPTION` char(255) DEFAULT NULL,
  `DEFAULT_CART_TYPE` int(10) unsigned DEFAULT '1',
  `DEFAULT_LOW_CART` int(10) unsigned DEFAULT '0',
  `DEFAULT_HIGH_CART` int(10) unsigned DEFAULT '0',
  `CUT_SHELFLIFE` int(11) DEFAULT '-1',
  `DELETE_EMPTY_CARTS` enum('N','Y') DEFAULT 'N',
  `DEFAULT_TITLE` char(255) DEFAULT 'Imported from %f.%e',
  `ENFORCE_CART_RANGE` enum('N','Y') DEFAULT 'N',
  `REPORT_TFC` enum('N','Y') DEFAULT 'Y',
  `REPORT_MUS` enum('N','Y') DEFAULT 'Y',
  `ENABLE_NOW_NEXT` enum('N','Y') DEFAULT 'N',
  `COLOR` char(7) DEFAULT NULL,
  PRIMARY KEY (`NAME`),
  KEY `IDX_REPORT_TFC` (`REPORT_TFC`),
  KEY `IDX_REPORT_MUS` (`REPORT_MUS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUPS`
--

LOCK TABLES `GROUPS` WRITE;
/*!40000 ALTER TABLE `GROUPS` DISABLE KEYS */;
INSERT INTO `GROUPS` VALUES ('TEMP','Temporary Carts',1,0,0,-1,'N','Imported from %f.%e','N','N','N','N',NULL),('TEST','Test Carts',1,0,0,-1,'N','Imported from %f.%e','N','N','N','N',NULL),('TRAFFIC','Traffic Carts',1,1,10000,-1,'N','Imported from %f.%e','N','Y','N','N',NULL),('MUSIC','Music Carts',1,10001,40000,-1,'N','Imported from %f.%e','N','N','Y','Y',NULL),('BEDS','Music Bed Carts',1,40001,45000,-1,'N','Imported from %f.%e','N','N','N','N',NULL),('STINGS','Short stingers',1,45001,50000,-1,'N','Imported from %f.%e','N','N','N','N',NULL),('MACROS','Macro Carts',2,50001,60000,-1,'N','Imported from %f.%e','N','N','N','N',NULL),('LEGAL','Legal IDs',1,60001,60100,-1,'N','Imported from %f.%e','N','N','N','N',NULL),('IDENTS','General IDs',1,60101,60500,-1,'N','Imported from %f.%e','N','N','N','N',NULL);
/*!40000 ALTER TABLE `GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOSTVARS`
--

DROP TABLE IF EXISTS `HOSTVARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HOSTVARS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `NAME` char(32) NOT NULL,
  `VARVALUE` char(255) DEFAULT NULL,
  `REMARK` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `NAME_IDX` (`STATION_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOSTVARS`
--

LOCK TABLES `HOSTVARS` WRITE;
/*!40000 ALTER TABLE `HOSTVARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `HOSTVARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMPORT_TEMPLATES`
--

DROP TABLE IF EXISTS `IMPORT_TEMPLATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMPORT_TEMPLATES` (
  `NAME` char(64) NOT NULL,
  `CART_OFFSET` int(11) DEFAULT NULL,
  `CART_LENGTH` int(11) DEFAULT NULL,
  `TITLE_OFFSET` int(11) DEFAULT NULL,
  `TITLE_LENGTH` int(11) DEFAULT NULL,
  `HOURS_OFFSET` int(11) DEFAULT NULL,
  `HOURS_LENGTH` int(11) DEFAULT NULL,
  `MINUTES_OFFSET` int(11) DEFAULT NULL,
  `MINUTES_LENGTH` int(11) DEFAULT NULL,
  `SECONDS_OFFSET` int(11) DEFAULT NULL,
  `SECONDS_LENGTH` int(11) DEFAULT NULL,
  `LEN_HOURS_OFFSET` int(11) DEFAULT NULL,
  `LEN_HOURS_LENGTH` int(11) DEFAULT NULL,
  `LEN_MINUTES_OFFSET` int(11) DEFAULT NULL,
  `LEN_MINUTES_LENGTH` int(11) DEFAULT NULL,
  `LEN_SECONDS_OFFSET` int(11) DEFAULT NULL,
  `LEN_SECONDS_LENGTH` int(11) DEFAULT NULL,
  `LENGTH_OFFSET` int(11) DEFAULT NULL,
  `LENGTH_LENGTH` int(11) DEFAULT NULL,
  `DATA_OFFSET` int(11) DEFAULT NULL,
  `DATA_LENGTH` int(11) DEFAULT NULL,
  `EVENT_ID_OFFSET` int(11) DEFAULT NULL,
  `EVENT_ID_LENGTH` int(11) DEFAULT NULL,
  `ANNC_TYPE_OFFSET` int(11) DEFAULT NULL,
  `ANNC_TYPE_LENGTH` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMPORT_TEMPLATES`
--

LOCK TABLES `IMPORT_TEMPLATES` WRITE;
/*!40000 ALTER TABLE `IMPORT_TEMPLATES` DISABLE KEYS */;
INSERT INTO `IMPORT_TEMPLATES` VALUES ('Rivendell Standard Import',10,6,25,34,0,2,3,2,6,2,60,2,63,2,66,2,NULL,NULL,69,32,NULL,NULL,NULL,NULL),('PowerGold Music Scheduling',10,6,25,34,0,2,3,2,6,2,60,2,63,2,66,2,NULL,NULL,69,32,NULL,NULL,NULL,NULL),('RadioTraffic.com',10,6,25,34,0,2,3,2,6,2,60,2,63,2,66,2,NULL,NULL,69,32,NULL,NULL,NULL,NULL),('CounterPoint Traffic',10,6,25,34,0,2,3,2,6,2,60,2,63,2,66,2,NULL,NULL,102,32,69,32,NULL,NULL),('Visual Traffic',14,6,25,39,5,2,8,2,11,2,0,0,97,2,99,2,NULL,NULL,0,0,0,0,NULL,NULL),('Music 1',10,6,25,34,0,2,3,2,6,2,60,2,63,2,66,2,NULL,NULL,69,32,NULL,NULL,NULL,NULL),('WideOrbit Traffic',10,6,25,34,0,2,3,2,6,2,60,2,63,2,66,2,NULL,NULL,102,32,69,32,NULL,NULL),('NaturalLog',9,6,19,40,0,2,3,2,6,2,61,2,64,2,67,2,NULL,NULL,0,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `IMPORT_TEMPLATES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INPUTS`
--

DROP TABLE IF EXISTS `INPUTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INPUTS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `MATRIX` int(11) NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `NAME` char(64) DEFAULT NULL,
  `FEED_NAME` char(8) DEFAULT NULL,
  `CHANNEL_MODE` int(11) DEFAULT NULL,
  `ENGINE_NUM` int(11) DEFAULT '-1',
  `DEVICE_NUM` int(11) DEFAULT '-1',
  `NODE_HOSTNAME` char(255) DEFAULT NULL,
  `NODE_TCP_PORT` int(11) DEFAULT NULL,
  `NODE_SLOT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MATRIX_IDX` (`STATION_NAME`,`MATRIX`,`NUMBER`),
  KEY `NODE_IDX` (`STATION_NAME`,`MATRIX`,`NUMBER`,`NODE_HOSTNAME`,`NODE_TCP_PORT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INPUTS`
--

LOCK TABLES `INPUTS` WRITE;
/*!40000 ALTER TABLE `INPUTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `INPUTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ISCI_XREFERENCE`
--

DROP TABLE IF EXISTS `ISCI_XREFERENCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ISCI_XREFERENCE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CART_NUMBER` int(10) unsigned NOT NULL,
  `ISCI` char(32) NOT NULL,
  `FILENAME` char(64) NOT NULL,
  `LATEST_DATE` date NOT NULL,
  `TYPE` char(1) NOT NULL,
  `ADVERTISER_NAME` char(30) DEFAULT NULL,
  `PRODUCT_NAME` char(35) DEFAULT NULL,
  `CREATIVE_TITLE` char(30) DEFAULT NULL,
  `REGION_NAME` char(80) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CART_NUMBER_IDX` (`CART_NUMBER`),
  KEY `TYPE_IDX` (`TYPE`,`LATEST_DATE`),
  KEY `LATEST_DATE_IDX` (`LATEST_DATE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ISCI_XREFERENCE`
--

LOCK TABLES `ISCI_XREFERENCE` WRITE;
/*!40000 ALTER TABLE `ISCI_XREFERENCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ISCI_XREFERENCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JACK_CLIENTS`
--

DROP TABLE IF EXISTS `JACK_CLIENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JACK_CLIENTS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  `COMMAND_LINE` char(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_STATION_NAME` (`STATION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JACK_CLIENTS`
--

LOCK TABLES `JACK_CLIENTS` WRITE;
/*!40000 ALTER TABLE `JACK_CLIENTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `JACK_CLIENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIVEWIRE_GPIO_SLOTS`
--

DROP TABLE IF EXISTS `LIVEWIRE_GPIO_SLOTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIVEWIRE_GPIO_SLOTS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `MATRIX` int(11) NOT NULL,
  `SLOT` int(11) NOT NULL,
  `IP_ADDRESS` char(15) DEFAULT NULL,
  `SOURCE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`,`MATRIX`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIVEWIRE_GPIO_SLOTS`
--

LOCK TABLES `LIVEWIRE_GPIO_SLOTS` WRITE;
/*!40000 ALTER TABLE `LIVEWIRE_GPIO_SLOTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIVEWIRE_GPIO_SLOTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOGS`
--

DROP TABLE IF EXISTS `LOGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGS` (
  `NAME` char(64) NOT NULL,
  `LOG_EXISTS` enum('N','Y') DEFAULT 'Y',
  `TYPE` int(11) NOT NULL DEFAULT '0',
  `SERVICE` char(10) NOT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  `ORIGIN_USER` char(255) NOT NULL,
  `ORIGIN_DATETIME` datetime NOT NULL,
  `LINK_DATETIME` datetime NOT NULL,
  `MODIFIED_DATETIME` datetime NOT NULL,
  `AUTO_REFRESH` enum('N','Y') DEFAULT 'N',
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `PURGE_DATE` date DEFAULT NULL,
  `IMPORT_DATE` date DEFAULT NULL,
  `SCHEDULED_TRACKS` int(10) unsigned DEFAULT '0',
  `COMPLETED_TRACKS` int(10) unsigned DEFAULT '0',
  `MUSIC_LINKS` int(11) DEFAULT '0',
  `MUSIC_LINKED` enum('N','Y') DEFAULT 'N',
  `TRAFFIC_LINKS` int(11) DEFAULT '0',
  `TRAFFIC_LINKED` enum('N','Y') DEFAULT 'N',
  `NEXT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`NAME`),
  KEY `NAME_IDX` (`NAME`,`LOG_EXISTS`),
  KEY `SERVICE_IDX` (`SERVICE`),
  KEY `DESCRIPTION_IDX` (`DESCRIPTION`),
  KEY `ORIGIN_USER_IDX` (`ORIGIN_USER`),
  KEY `START_DATE_IDX` (`START_DATE`),
  KEY `END_DATE_IDX` (`END_DATE`),
  KEY `TYPE_IDX` (`TYPE`,`LOG_EXISTS`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOGS`
--

LOCK TABLES `LOGS` WRITE;
/*!40000 ALTER TABLE `LOGS` DISABLE KEYS */;
INSERT INTO `LOGS` VALUES ('SAMPLE','Y',0,'Production','Sample Log','user','2011-11-10 07:44:47','0000-00-00 00:00:00','0000-00-00 00:00:00','N','0000-00-00','0000-00-00',NULL,NULL,0,0,0,'N',0,'N',0);
/*!40000 ALTER TABLE `LOGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOG_MODES`
--

DROP TABLE IF EXISTS `LOG_MODES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOG_MODES` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `MACHINE` int(10) unsigned NOT NULL,
  `START_MODE` int(11) NOT NULL DEFAULT '0',
  `OP_MODE` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`,`MACHINE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOG_MODES`
--

LOCK TABLES `LOG_MODES` WRITE;
/*!40000 ALTER TABLE `LOG_MODES` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOG_MODES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATRICES`
--

DROP TABLE IF EXISTS `MATRICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MATRICES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `NAME` char(64) DEFAULT NULL,
  `MATRIX` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `LAYER` int(11) DEFAULT '86',
  `PORT_TYPE` int(11) DEFAULT '0',
  `PORT_TYPE_2` int(11) DEFAULT '0',
  `CARD` int(11) DEFAULT '-1',
  `PORT` int(11) NOT NULL,
  `PORT_2` int(11) NOT NULL,
  `IP_ADDRESS` char(16) DEFAULT NULL,
  `IP_ADDRESS_2` char(16) DEFAULT NULL,
  `IP_PORT` int(11) DEFAULT NULL,
  `IP_PORT_2` int(11) DEFAULT NULL,
  `USERNAME` char(32) DEFAULT NULL,
  `USERNAME_2` char(32) DEFAULT NULL,
  `PASSWORD` char(32) DEFAULT NULL,
  `PASSWORD_2` char(32) DEFAULT NULL,
  `START_CART` int(10) unsigned DEFAULT NULL,
  `STOP_CART` int(10) unsigned DEFAULT NULL,
  `START_CART_2` int(10) unsigned DEFAULT NULL,
  `STOP_CART_2` int(10) unsigned DEFAULT NULL,
  `GPIO_DEVICE` char(255) DEFAULT NULL,
  `INPUTS` int(11) NOT NULL,
  `OUTPUTS` int(11) NOT NULL,
  `GPIS` int(11) NOT NULL,
  `GPOS` int(11) NOT NULL,
  `FADERS` int(11) DEFAULT '0',
  `DISPLAYS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MATRIX_IDX` (`STATION_NAME`,`MATRIX`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATRICES`
--

LOCK TABLES `MATRICES` WRITE;
/*!40000 ALTER TABLE `MATRICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `MATRICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOWNEXT_PLUGINS`
--

DROP TABLE IF EXISTS `NOWNEXT_PLUGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOWNEXT_PLUGINS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `LOG_MACHINE` int(10) unsigned NOT NULL DEFAULT '0',
  `PLUGIN_PATH` char(255) DEFAULT NULL,
  `PLUGIN_ARG` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION_NAME`,`LOG_MACHINE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOWNEXT_PLUGINS`
--

LOCK TABLES `NOWNEXT_PLUGINS` WRITE;
/*!40000 ALTER TABLE `NOWNEXT_PLUGINS` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOWNEXT_PLUGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OUTPUTS`
--

DROP TABLE IF EXISTS `OUTPUTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OUTPUTS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `MATRIX` int(11) NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `NAME` char(64) DEFAULT NULL,
  `ENGINE_NUM` int(11) DEFAULT '-1',
  `DEVICE_NUM` int(11) DEFAULT '-1',
  `NODE_HOSTNAME` char(255) DEFAULT NULL,
  `NODE_TCP_PORT` int(11) DEFAULT NULL,
  `NODE_SLOT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MATRIX_IDX` (`STATION_NAME`,`MATRIX`,`NUMBER`),
  KEY `NODE_IDX` (`STATION_NAME`,`MATRIX`,`NUMBER`,`NODE_HOSTNAME`,`NODE_TCP_PORT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OUTPUTS`
--

LOCK TABLES `OUTPUTS` WRITE;
/*!40000 ALTER TABLE `OUTPUTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `OUTPUTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PANELS`
--

DROP TABLE IF EXISTS `PANELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PANELS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) NOT NULL,
  `OWNER` char(64) NOT NULL,
  `PANEL_NO` int(11) NOT NULL,
  `ROW_NO` int(11) NOT NULL,
  `COLUMN_NO` int(11) NOT NULL,
  `LABEL` char(64) DEFAULT NULL,
  `CART` int(11) DEFAULT NULL,
  `DEFAULT_COLOR` char(7) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LOAD_IDX` (`TYPE`,`OWNER`,`PANEL_NO`),
  KEY `SAVE_IDX` (`TYPE`,`OWNER`,`PANEL_NO`,`ROW_NO`,`COLUMN_NO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PANELS`
--

LOCK TABLES `PANELS` WRITE;
/*!40000 ALTER TABLE `PANELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PANELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PANEL_NAMES`
--

DROP TABLE IF EXISTS `PANEL_NAMES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PANEL_NAMES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) NOT NULL,
  `OWNER` char(64) NOT NULL,
  `PANEL_NO` int(11) NOT NULL,
  `NAME` char(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `LOAD_IDX` (`TYPE`,`OWNER`,`PANEL_NO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PANEL_NAMES`
--

LOCK TABLES `PANEL_NAMES` WRITE;
/*!40000 ALTER TABLE `PANEL_NAMES` DISABLE KEYS */;
/*!40000 ALTER TABLE `PANEL_NAMES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PODCASTS`
--

DROP TABLE IF EXISTS `PODCASTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PODCASTS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FEED_ID` int(10) unsigned NOT NULL,
  `STATUS` int(10) unsigned DEFAULT '1',
  `ITEM_TITLE` char(255) DEFAULT NULL,
  `ITEM_DESCRIPTION` text,
  `ITEM_CATEGORY` char(64) DEFAULT NULL,
  `ITEM_LINK` char(255) DEFAULT NULL,
  `ITEM_COMMENTS` char(255) DEFAULT NULL,
  `ITEM_AUTHOR` char(255) DEFAULT NULL,
  `ITEM_SOURCE_TEXT` char(64) DEFAULT NULL,
  `ITEM_SOURCE_URL` char(255) DEFAULT NULL,
  `AUDIO_FILENAME` char(255) DEFAULT NULL,
  `AUDIO_LENGTH` int(10) unsigned DEFAULT NULL,
  `AUDIO_TIME` int(10) unsigned DEFAULT NULL,
  `SHELF_LIFE` int(11) DEFAULT NULL,
  `ORIGIN_DATETIME` datetime DEFAULT NULL,
  `EFFECTIVE_DATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FEED_ID_IDX` (`FEED_ID`,`ORIGIN_DATETIME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PODCASTS`
--

LOCK TABLES `PODCASTS` WRITE;
/*!40000 ALTER TABLE `PODCASTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `PODCASTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Production_SRT`
--

DROP TABLE IF EXISTS `Production_SRT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Production_SRT` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LENGTH` int(11) DEFAULT NULL,
  `LOG_NAME` char(64) DEFAULT NULL,
  `LOG_ID` int(11) DEFAULT NULL,
  `CART_NUMBER` int(10) unsigned DEFAULT NULL,
  `CUT_NUMBER` int(11) DEFAULT NULL,
  `TITLE` char(255) DEFAULT NULL,
  `ARTIST` char(255) DEFAULT NULL,
  `PUBLISHER` char(64) DEFAULT NULL,
  `COMPOSER` char(64) DEFAULT NULL,
  `ALBUM` char(255) DEFAULT NULL,
  `LABEL` char(64) DEFAULT NULL,
  `USAGE_CODE` int(11) DEFAULT NULL,
  `ISRC` char(12) DEFAULT NULL,
  `ISCI` char(32) DEFAULT NULL,
  `STATION_NAME` char(64) DEFAULT NULL,
  `EVENT_DATETIME` datetime DEFAULT NULL,
  `SCHEDULED_TIME` time DEFAULT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `EVENT_SOURCE` int(11) DEFAULT NULL,
  `PLAY_SOURCE` int(11) DEFAULT NULL,
  `START_SOURCE` int(11) DEFAULT '0',
  `ONAIR_FLAG` enum('N','Y') DEFAULT 'N',
  `EXT_START_TIME` time DEFAULT NULL,
  `EXT_LENGTH` int(11) DEFAULT NULL,
  `EXT_CART_NAME` char(32) DEFAULT NULL,
  `EXT_DATA` char(32) DEFAULT NULL,
  `EXT_EVENT_ID` char(8) DEFAULT NULL,
  `EXT_ANNC_TYPE` char(8) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `EVENT_DATETIME_IDX` (`EVENT_DATETIME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Production_SRT`
--

LOCK TABLES `Production_SRT` WRITE;
/*!40000 ALTER TABLE `Production_SRT` DISABLE KEYS */;
/*!40000 ALTER TABLE `Production_SRT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDAIRPLAY`
--

DROP TABLE IF EXISTS `RDAIRPLAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDAIRPLAY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION` char(40) NOT NULL,
  `SEGUE_LENGTH` int(11) DEFAULT '250',
  `TRANS_LENGTH` int(11) DEFAULT '50',
  `OP_MODE` int(11) DEFAULT '2',
  `START_MODE` int(11) DEFAULT '0',
  `LOG_MODE_STYLE` int(11) DEFAULT '0',
  `PIE_COUNT_LENGTH` int(11) DEFAULT '15000',
  `PIE_COUNT_ENDPOINT` int(11) DEFAULT '0',
  `CHECK_TIMESYNC` enum('N','Y') DEFAULT 'N',
  `STATION_PANELS` int(11) DEFAULT '3',
  `USER_PANELS` int(11) DEFAULT '3',
  `SHOW_AUX_1` enum('N','Y') DEFAULT 'Y',
  `SHOW_AUX_2` enum('N','Y') DEFAULT 'Y',
  `CLEAR_FILTER` enum('N','Y') DEFAULT 'N',
  `DEFAULT_TRANS_TYPE` int(11) DEFAULT '0',
  `BAR_ACTION` int(10) unsigned DEFAULT '0',
  `FLASH_PANEL` enum('N','Y') DEFAULT 'N',
  `PANEL_PAUSE_ENABLED` enum('N','Y') DEFAULT 'N',
  `BUTTON_LABEL_TEMPLATE` char(32) DEFAULT '%t',
  `PAUSE_ENABLED` enum('N','Y') DEFAULT NULL,
  `DEFAULT_SERVICE` char(10) DEFAULT NULL,
  `HOUR_SELECTOR_ENABLED` enum('N','Y') DEFAULT 'N',
  `DESCRIPTION_TEMPLATE` char(64) DEFAULT '%i',
  `TITLE_TEMPLATE` char(64) DEFAULT '%t',
  `ARTIST_TEMPLATE` char(64) DEFAULT '%a',
  `OUTCUE_TEMPLATE` char(64) DEFAULT '%o',
  `UDP_ADDR0` char(255) DEFAULT NULL,
  `UDP_PORT0` int(10) unsigned DEFAULT NULL,
  `UDP_STRING0` char(255) DEFAULT NULL,
  `LOG_RML0` char(255) DEFAULT NULL,
  `UDP_ADDR1` char(255) DEFAULT NULL,
  `UDP_PORT1` int(10) unsigned DEFAULT NULL,
  `UDP_STRING1` char(255) DEFAULT NULL,
  `LOG_RML1` char(255) DEFAULT NULL,
  `UDP_ADDR2` char(255) DEFAULT NULL,
  `UDP_PORT2` int(10) unsigned DEFAULT NULL,
  `UDP_STRING2` char(255) DEFAULT NULL,
  `LOG_RML2` char(255) DEFAULT NULL,
  `EXIT_CODE` int(11) DEFAULT '0',
  `EXIT_PASSWORD` char(41) DEFAULT '',
  `SKIN_PATH` char(255) DEFAULT '/usr/share/pixmaps/rivendell/rdairplay_skin.png',
  `SHOW_COUNTERS` enum('N','Y') DEFAULT 'N',
  `AUDITION_PREROLL` int(11) DEFAULT '10000',
  `LOG0_START_MODE` int(11) DEFAULT '0',
  `LOG0_AUTO_RESTART` enum('N','Y') DEFAULT 'N',
  `LOG0_LOG_NAME` char(64) DEFAULT NULL,
  `LOG0_CURRENT_LOG` char(64) DEFAULT NULL,
  `LOG0_RUNNING` enum('N','Y') DEFAULT 'N',
  `LOG0_LOG_ID` int(11) DEFAULT '-1',
  `LOG0_LOG_LINE` int(11) DEFAULT '-1',
  `LOG0_NOW_CART` int(10) unsigned DEFAULT '0',
  `LOG0_NEXT_CART` int(10) unsigned DEFAULT '0',
  `LOG1_START_MODE` int(11) DEFAULT '0',
  `LOG1_AUTO_RESTART` enum('N','Y') DEFAULT 'N',
  `LOG1_LOG_NAME` char(64) DEFAULT NULL,
  `LOG1_CURRENT_LOG` char(64) DEFAULT NULL,
  `LOG1_RUNNING` enum('N','Y') DEFAULT 'N',
  `LOG1_LOG_ID` int(11) DEFAULT '-1',
  `LOG1_LOG_LINE` int(11) DEFAULT '-1',
  `LOG1_NOW_CART` int(10) unsigned DEFAULT '0',
  `LOG1_NEXT_CART` int(10) unsigned DEFAULT '0',
  `LOG2_START_MODE` int(11) DEFAULT '0',
  `LOG2_AUTO_RESTART` enum('N','Y') DEFAULT 'N',
  `LOG2_LOG_NAME` char(64) DEFAULT NULL,
  `LOG2_CURRENT_LOG` char(64) DEFAULT NULL,
  `LOG2_RUNNING` enum('N','Y') DEFAULT 'N',
  `LOG2_LOG_ID` int(11) DEFAULT '-1',
  `LOG2_LOG_LINE` int(11) DEFAULT '-1',
  `LOG2_NOW_CART` int(10) unsigned DEFAULT '0',
  `LOG2_NEXT_CART` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDAIRPLAY`
--

LOCK TABLES `RDAIRPLAY` WRITE;
/*!40000 ALTER TABLE `RDAIRPLAY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDAIRPLAY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDAIRPLAY_CHANNELS`
--

DROP TABLE IF EXISTS `RDAIRPLAY_CHANNELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDAIRPLAY_CHANNELS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `INSTANCE` int(10) unsigned NOT NULL,
  `CARD` int(11) NOT NULL DEFAULT '0',
  `PORT` int(11) NOT NULL DEFAULT '0',
  `START_RML` char(255) DEFAULT NULL,
  `STOP_RML` char(255) DEFAULT NULL,
  `GPIO_TYPE` int(10) unsigned DEFAULT '0',
  `START_GPI_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `START_GPI_LINE` int(11) NOT NULL DEFAULT '-1',
  `START_GPO_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `START_GPO_LINE` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPI_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPI_LINE` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPO_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPO_LINE` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`,`INSTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDAIRPLAY_CHANNELS`
--

LOCK TABLES `RDAIRPLAY_CHANNELS` WRITE;
/*!40000 ALTER TABLE `RDAIRPLAY_CHANNELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDAIRPLAY_CHANNELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDCATCH`
--

DROP TABLE IF EXISTS `RDCATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDCATCH` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION` char(64) NOT NULL,
  `ERROR_RML` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDCATCH`
--

LOCK TABLES `RDCATCH` WRITE;
/*!40000 ALTER TABLE `RDCATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDCATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDHOTKEYS`
--

DROP TABLE IF EXISTS `RDHOTKEYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDHOTKEYS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) DEFAULT NULL,
  `MODULE_NAME` char(64) DEFAULT NULL,
  `KEY_ID` int(11) DEFAULT NULL,
  `KEY_VALUE` char(64) DEFAULT NULL,
  `KEY_LABEL` char(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDHOTKEYS`
--

LOCK TABLES `RDHOTKEYS` WRITE;
/*!40000 ALTER TABLE `RDHOTKEYS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDHOTKEYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDLIBRARY`
--

DROP TABLE IF EXISTS `RDLIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDLIBRARY` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION` char(40) NOT NULL,
  `INSTANCE` int(10) unsigned NOT NULL,
  `INPUT_CARD` int(11) DEFAULT '0',
  `INPUT_STREAM` int(11) DEFAULT '0',
  `INPUT_PORT` int(11) DEFAULT '0',
  `INPUT_TYPE` enum('A','D') DEFAULT 'A',
  `OUTPUT_CARD` int(11) DEFAULT '0',
  `OUTPUT_STREAM` int(11) DEFAULT '0',
  `OUTPUT_PORT` int(11) DEFAULT '0',
  `VOX_THRESHOLD` int(11) DEFAULT '-5000',
  `TRIM_THRESHOLD` int(11) DEFAULT '0',
  `RECORD_GPI` int(11) DEFAULT '-1',
  `PLAY_GPI` int(11) DEFAULT '-1',
  `STOP_GPI` int(11) DEFAULT '-1',
  `DEFAULT_FORMAT` int(10) unsigned DEFAULT '0',
  `DEFAULT_CHANNELS` int(10) unsigned DEFAULT '2',
  `DEFAULT_SAMPRATE` int(10) unsigned DEFAULT '44100',
  `DEFAULT_LAYER` int(10) unsigned DEFAULT '0',
  `DEFAULT_BITRATE` int(10) unsigned DEFAULT '0',
  `DEFAULT_RECORD_MODE` int(10) unsigned DEFAULT '0',
  `DEFAULT_TRIM_STATE` enum('N','Y') DEFAULT 'N',
  `MAXLENGTH` int(11) DEFAULT NULL,
  `TAIL_PREROLL` int(10) unsigned DEFAULT '1500',
  `RIPPER_DEVICE` char(64) DEFAULT '/dev/cdrom',
  `PARANOIA_LEVEL` int(11) DEFAULT '0',
  `RIPPER_LEVEL` int(11) DEFAULT '-1300',
  `CDDB_SERVER` char(64) DEFAULT 'freedb.freedb.org',
  `ENABLE_EDITOR` enum('N','Y') DEFAULT 'N',
  `SRC_CONVERTER` int(11) DEFAULT '1',
  `LIMIT_SEARCH` int(11) DEFAULT '1',
  `SEARCH_LIMITED` enum('N','Y') DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION`,`INSTANCE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDLIBRARY`
--

LOCK TABLES `RDLIBRARY` WRITE;
/*!40000 ALTER TABLE `RDLIBRARY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDLIBRARY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDLOGEDIT`
--

DROP TABLE IF EXISTS `RDLOGEDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDLOGEDIT` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION` char(64) NOT NULL,
  `INPUT_CARD` int(11) DEFAULT '-1',
  `INPUT_PORT` int(11) DEFAULT '0',
  `OUTPUT_CARD` int(11) DEFAULT '-1',
  `OUTPUT_PORT` int(11) DEFAULT '0',
  `FORMAT` int(10) unsigned DEFAULT '0',
  `SAMPRATE` int(10) unsigned DEFAULT '44100',
  `LAYER` int(10) unsigned DEFAULT '0',
  `BITRATE` int(10) unsigned DEFAULT '0',
  `ENABLE_SECOND_START` enum('N','Y') DEFAULT 'Y',
  `DEFAULT_CHANNELS` int(10) unsigned DEFAULT '2',
  `MAXLENGTH` int(11) DEFAULT '0',
  `TAIL_PREROLL` int(10) unsigned DEFAULT '2000',
  `START_CART` int(10) unsigned DEFAULT '0',
  `END_CART` int(10) unsigned DEFAULT '0',
  `REC_START_CART` int(10) unsigned DEFAULT '0',
  `REC_END_CART` int(10) unsigned DEFAULT '0',
  `TRIM_THRESHOLD` int(11) DEFAULT '-3000',
  `RIPPER_LEVEL` int(11) DEFAULT '-1300',
  `DEFAULT_TRANS_TYPE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDLOGEDIT`
--

LOCK TABLES `RDLOGEDIT` WRITE;
/*!40000 ALTER TABLE `RDLOGEDIT` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDLOGEDIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDPANEL`
--

DROP TABLE IF EXISTS `RDPANEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDPANEL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION` char(40) NOT NULL,
  `STATION_PANELS` int(11) DEFAULT '3',
  `USER_PANELS` int(11) DEFAULT '3',
  `CLEAR_FILTER` enum('N','Y') DEFAULT 'N',
  `FLASH_PANEL` enum('N','Y') DEFAULT 'N',
  `PANEL_PAUSE_ENABLED` enum('N','Y') DEFAULT 'N',
  `BUTTON_LABEL_TEMPLATE` char(32) DEFAULT '%t',
  `DEFAULT_SERVICE` char(10) DEFAULT NULL,
  `SKIN_PATH` char(255) DEFAULT '/usr/share/pixmaps/rivendell/rdpanel_skin.png',
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDPANEL`
--

LOCK TABLES `RDPANEL` WRITE;
/*!40000 ALTER TABLE `RDPANEL` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDPANEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RDPANEL_CHANNELS`
--

DROP TABLE IF EXISTS `RDPANEL_CHANNELS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDPANEL_CHANNELS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `INSTANCE` int(10) unsigned NOT NULL,
  `CARD` int(11) NOT NULL DEFAULT '0',
  `PORT` int(11) NOT NULL DEFAULT '0',
  `START_RML` char(255) DEFAULT NULL,
  `STOP_RML` char(255) DEFAULT NULL,
  `GPIO_TYPE` int(10) unsigned DEFAULT '0',
  `START_GPI_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `START_GPI_LINE` int(11) NOT NULL DEFAULT '-1',
  `START_GPO_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `START_GPO_LINE` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPI_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPI_LINE` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPO_MATRIX` int(11) NOT NULL DEFAULT '-1',
  `STOP_GPO_LINE` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`,`INSTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RDPANEL_CHANNELS`
--

LOCK TABLES `RDPANEL_CHANNELS` WRITE;
/*!40000 ALTER TABLE `RDPANEL_CHANNELS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RDPANEL_CHANNELS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECORDINGS`
--

DROP TABLE IF EXISTS `RECORDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RECORDINGS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `IS_ACTIVE` enum('N','Y') DEFAULT 'Y',
  `STATION_NAME` char(64) NOT NULL,
  `TYPE` int(11) DEFAULT '0',
  `CHANNEL` int(10) unsigned NOT NULL,
  `CUT_NAME` char(12) NOT NULL,
  `SUN` enum('N','Y') DEFAULT 'N',
  `MON` enum('N','Y') DEFAULT 'N',
  `TUE` enum('N','Y') DEFAULT 'N',
  `WED` enum('N','Y') DEFAULT 'N',
  `THU` enum('N','Y') DEFAULT 'N',
  `FRI` enum('N','Y') DEFAULT 'N',
  `SAT` enum('N','Y') DEFAULT 'N',
  `DESCRIPTION` char(64) DEFAULT NULL,
  `START_TYPE` int(10) unsigned DEFAULT '0',
  `START_TIME` time DEFAULT NULL,
  `START_LENGTH` int(11) DEFAULT '0',
  `START_MATRIX` int(11) DEFAULT '-1',
  `START_LINE` int(11) DEFAULT '-1',
  `START_OFFSET` int(11) DEFAULT '0',
  `END_TYPE` int(11) DEFAULT '0',
  `END_TIME` time DEFAULT NULL,
  `END_LENGTH` int(11) DEFAULT '0',
  `END_MATRIX` int(11) DEFAULT '-1',
  `END_LINE` int(11) DEFAULT '-1',
  `LENGTH` int(10) unsigned DEFAULT NULL,
  `START_GPI` int(11) DEFAULT '-1',
  `END_GPI` int(11) DEFAULT '-1',
  `ALLOW_MULT_RECS` enum('N','Y') DEFAULT 'N',
  `MAX_GPI_REC_LENGTH` int(10) unsigned DEFAULT '3600000',
  `TRIM_THRESHOLD` int(11) DEFAULT NULL,
  `NORMALIZE_LEVEL` int(11) DEFAULT '-1300',
  `STARTDATE_OFFSET` int(10) unsigned DEFAULT '0',
  `ENDDATE_OFFSET` int(10) unsigned DEFAULT '0',
  `EVENTDATE_OFFSET` int(11) DEFAULT '0',
  `FORMAT` int(11) DEFAULT '0',
  `CHANNELS` int(11) DEFAULT '2',
  `SAMPRATE` int(11) DEFAULT '44100',
  `BITRATE` int(11) DEFAULT '0',
  `QUALITY` int(11) DEFAULT '0',
  `MACRO_CART` int(11) DEFAULT '-1',
  `SWITCH_INPUT` int(11) DEFAULT '-1',
  `SWITCH_OUTPUT` int(11) DEFAULT '-1',
  `EXIT_CODE` int(11) DEFAULT '0',
  `EXIT_TEXT` text,
  `ONE_SHOT` enum('N','Y') DEFAULT 'N',
  `URL` char(255) DEFAULT NULL,
  `URL_USERNAME` char(64) DEFAULT NULL,
  `URL_PASSWORD` char(64) DEFAULT NULL,
  `ENABLE_METADATA` enum('N','Y') DEFAULT 'N',
  `FEED_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECORDINGS`
--

LOCK TABLES `RECORDINGS` WRITE;
/*!40000 ALTER TABLE `RECORDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECORDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPLICATORS`
--

DROP TABLE IF EXISTS `REPLICATORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPLICATORS` (
  `NAME` char(32) NOT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  `TYPE_ID` int(10) unsigned NOT NULL,
  `STATION_NAME` char(64) DEFAULT NULL,
  `FORMAT` int(10) unsigned DEFAULT '0',
  `CHANNELS` int(10) unsigned DEFAULT '2',
  `SAMPRATE` int(10) unsigned DEFAULT '48000',
  `BITRATE` int(10) unsigned DEFAULT '0',
  `QUALITY` int(10) unsigned DEFAULT '0',
  `URL` char(255) DEFAULT NULL,
  `URL_USERNAME` char(64) DEFAULT NULL,
  `URL_PASSWORD` char(64) DEFAULT NULL,
  `ENABLE_METADATA` enum('N','Y') DEFAULT 'N',
  `NORMALIZATION_LEVEL` int(11) DEFAULT '0',
  PRIMARY KEY (`NAME`),
  KEY `TYPE_ID_IDX` (`TYPE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPLICATORS`
--

LOCK TABLES `REPLICATORS` WRITE;
/*!40000 ALTER TABLE `REPLICATORS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPLICATORS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPLICATOR_MAP`
--

DROP TABLE IF EXISTS `REPLICATOR_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPLICATOR_MAP` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REPLICATOR_NAME` char(32) NOT NULL,
  `GROUP_NAME` char(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `REPLICATOR_NAME_IDX` (`REPLICATOR_NAME`),
  KEY `GROUP_NAME_IDX` (`GROUP_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPLICATOR_MAP`
--

LOCK TABLES `REPLICATOR_MAP` WRITE;
/*!40000 ALTER TABLE `REPLICATOR_MAP` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPLICATOR_MAP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPL_CART_STATE`
--

DROP TABLE IF EXISTS `REPL_CART_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPL_CART_STATE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REPLICATOR_NAME` char(32) NOT NULL,
  `CART_NUMBER` int(10) unsigned NOT NULL,
  `POSTED_FILENAME` char(255) DEFAULT NULL,
  `ITEM_DATETIME` datetime NOT NULL,
  `REPOST` enum('N','Y') DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `REPLICATOR_NAME_IDX` (`REPLICATOR_NAME`,`CART_NUMBER`,`POSTED_FILENAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPL_CART_STATE`
--

LOCK TABLES `REPL_CART_STATE` WRITE;
/*!40000 ALTER TABLE `REPL_CART_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPL_CART_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPL_CUT_STATE`
--

DROP TABLE IF EXISTS `REPL_CUT_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPL_CUT_STATE` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REPLICATOR_NAME` char(32) NOT NULL,
  `CUT_NAME` char(12) NOT NULL,
  `ITEM_DATETIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `REPLICATOR_NAME_IDX` (`REPLICATOR_NAME`,`CUT_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPL_CUT_STATE`
--

LOCK TABLES `REPL_CUT_STATE` WRITE;
/*!40000 ALTER TABLE `REPL_CUT_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPL_CUT_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORTS`
--

DROP TABLE IF EXISTS `REPORTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPORTS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` char(64) NOT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  `EXPORT_FILTER` int(11) DEFAULT NULL,
  `EXPORT_PATH` char(255) DEFAULT NULL,
  `WIN_EXPORT_PATH` char(255) DEFAULT NULL,
  `EXPORT_TFC` enum('N','Y') DEFAULT 'N',
  `FORCE_TFC` enum('N','Y') DEFAULT 'N',
  `EXPORT_MUS` enum('N','Y') DEFAULT 'N',
  `FORCE_MUS` enum('N','Y') DEFAULT 'N',
  `EXPORT_GEN` enum('N','Y') DEFAULT 'N',
  `STATION_ID` char(16) DEFAULT NULL,
  `CART_DIGITS` int(10) unsigned DEFAULT '6',
  `USE_LEADING_ZEROS` enum('N','Y') DEFAULT 'N',
  `LINES_PER_PAGE` int(11) DEFAULT '66',
  `SERVICE_NAME` char(64) DEFAULT NULL,
  `STATION_TYPE` int(11) DEFAULT '0',
  `STATION_FORMAT` char(64) DEFAULT NULL,
  `FILTER_ONAIR_FLAG` enum('N','Y') DEFAULT 'N',
  `FILTER_GROUPS` enum('N','Y') DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  KEY `IDX_NAME` (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORTS`
--

LOCK TABLES `REPORTS` WRITE;
/*!40000 ALTER TABLE `REPORTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPORTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORT_GROUPS`
--

DROP TABLE IF EXISTS `REPORT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPORT_GROUPS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REPORT_NAME` char(64) NOT NULL,
  `GROUP_NAME` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REPORT_NAME` (`REPORT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORT_GROUPS`
--

LOCK TABLES `REPORT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REPORT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPORT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORT_SERVICES`
--

DROP TABLE IF EXISTS `REPORT_SERVICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPORT_SERVICES` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REPORT_NAME` char(64) NOT NULL,
  `SERVICE_NAME` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REPORT_NAME` (`REPORT_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORT_SERVICES`
--

LOCK TABLES `REPORT_SERVICES` WRITE;
/*!40000 ALTER TABLE `REPORT_SERVICES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPORT_SERVICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORT_STATIONS`
--

DROP TABLE IF EXISTS `REPORT_STATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REPORT_STATIONS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `REPORT_NAME` char(64) NOT NULL,
  `STATION_NAME` char(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REPORT_NAME` (`REPORT_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORT_STATIONS`
--

LOCK TABLES `REPORT_STATIONS` WRITE;
/*!40000 ALTER TABLE `REPORT_STATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPORT_STATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SAMPLE_LOG`
--

DROP TABLE IF EXISTS `SAMPLE_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SAMPLE_LOG` (
  `ID` int(11) NOT NULL,
  `COUNT` int(11) NOT NULL,
  `TYPE` int(11) DEFAULT '0',
  `SOURCE` int(11) NOT NULL,
  `START_TIME` int(11) DEFAULT NULL,
  `GRACE_TIME` int(11) DEFAULT '0',
  `CART_NUMBER` int(10) unsigned NOT NULL,
  `TIME_TYPE` int(11) NOT NULL,
  `POST_POINT` enum('N','Y') DEFAULT 'N',
  `TRANS_TYPE` int(11) NOT NULL,
  `START_POINT` int(11) NOT NULL DEFAULT '-1',
  `END_POINT` int(11) NOT NULL DEFAULT '-1',
  `FADEUP_POINT` int(11) DEFAULT '-1',
  `FADEUP_GAIN` int(11) DEFAULT '-3000',
  `FADEDOWN_POINT` int(11) DEFAULT '-1',
  `FADEDOWN_GAIN` int(11) DEFAULT '-3000',
  `SEGUE_START_POINT` int(11) NOT NULL DEFAULT '-1',
  `SEGUE_END_POINT` int(11) NOT NULL DEFAULT '-1',
  `SEGUE_GAIN` int(11) DEFAULT '-3000',
  `DUCK_UP_GAIN` int(11) DEFAULT '0',
  `DUCK_DOWN_GAIN` int(11) DEFAULT '0',
  `COMMENT` char(255) DEFAULT NULL,
  `LABEL` char(64) DEFAULT NULL,
  `ORIGIN_USER` char(255) DEFAULT NULL,
  `ORIGIN_DATETIME` datetime DEFAULT NULL,
  `EVENT_LENGTH` int(11) DEFAULT '-1',
  `LINK_EVENT_NAME` char(64) DEFAULT NULL,
  `LINK_START_TIME` int(11) DEFAULT NULL,
  `LINK_LENGTH` int(11) DEFAULT '0',
  `LINK_START_SLOP` int(11) DEFAULT '0',
  `LINK_END_SLOP` int(11) DEFAULT '0',
  `LINK_ID` int(11) DEFAULT '-1',
  `LINK_EMBEDDED` enum('N','Y') DEFAULT 'N',
  `EXT_START_TIME` time DEFAULT NULL,
  `EXT_LENGTH` int(11) DEFAULT NULL,
  `EXT_CART_NAME` char(32) DEFAULT NULL,
  `EXT_DATA` char(32) DEFAULT NULL,
  `EXT_EVENT_ID` char(32) DEFAULT NULL,
  `EXT_ANNC_TYPE` char(8) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `COUNT_IDX` (`COUNT`),
  KEY `CART_NUMBER_IDX` (`CART_NUMBER`),
  KEY `LABEL_IDX` (`LABEL`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SAMPLE_LOG`
--

LOCK TABLES `SAMPLE_LOG` WRITE;
/*!40000 ALTER TABLE `SAMPLE_LOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `SAMPLE_LOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCHED_CODES`
--

DROP TABLE IF EXISTS `SCHED_CODES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCHED_CODES` (
  `CODE` varchar(10) NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCHED_CODES`
--

LOCK TABLES `SCHED_CODES` WRITE;
/*!40000 ALTER TABLE `SCHED_CODES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCHED_CODES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICES`
--

DROP TABLE IF EXISTS `SERVICES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICES` (
  `NAME` char(10) NOT NULL,
  `DESCRIPTION` char(255) DEFAULT NULL,
  `NAME_TEMPLATE` char(255) DEFAULT NULL,
  `DESCRIPTION_TEMPLATE` char(255) DEFAULT NULL,
  `PROGRAM_CODE` char(255) DEFAULT NULL,
  `CHAIN_LOG` enum('N','Y') DEFAULT 'N',
  `TRACK_GROUP` char(10) DEFAULT NULL,
  `AUTOSPOT_GROUP` char(10) DEFAULT NULL,
  `AUTO_REFRESH` enum('N','Y') DEFAULT 'N',
  `DEFAULT_LOG_SHELFLIFE` int(11) DEFAULT '-1',
  `ELR_SHELFLIFE` int(11) DEFAULT '-1',
  `TFC_PATH` char(255) DEFAULT NULL,
  `TFC_PREIMPORT_CMD` text,
  `TFC_WIN_PATH` char(255) DEFAULT NULL,
  `TFC_WIN_PREIMPORT_CMD` text,
  `TFC_IMPORT_TEMPLATE` char(64) DEFAULT 'Rivendell Standard Import',
  `TFC_LABEL_CART` char(32) DEFAULT NULL,
  `TFC_TRACK_CART` char(32) DEFAULT NULL,
  `TFC_BREAK_STRING` char(64) DEFAULT NULL,
  `TFC_TRACK_STRING` char(64) DEFAULT NULL,
  `TFC_CART_OFFSET` int(11) DEFAULT NULL,
  `TFC_CART_LENGTH` int(11) DEFAULT NULL,
  `TFC_TITLE_OFFSET` int(11) DEFAULT NULL,
  `TFC_TITLE_LENGTH` int(11) DEFAULT NULL,
  `TFC_START_OFFSET` int(11) DEFAULT NULL,
  `TFC_START_LENGTH` int(11) DEFAULT NULL,
  `TFC_HOURS_OFFSET` int(11) DEFAULT NULL,
  `TFC_HOURS_LENGTH` int(11) DEFAULT NULL,
  `TFC_MINUTES_OFFSET` int(11) DEFAULT NULL,
  `TFC_MINUTES_LENGTH` int(11) DEFAULT NULL,
  `TFC_SECONDS_OFFSET` int(11) DEFAULT NULL,
  `TFC_SECONDS_LENGTH` int(11) DEFAULT NULL,
  `TFC_LEN_HOURS_OFFSET` int(11) DEFAULT NULL,
  `TFC_LEN_HOURS_LENGTH` int(11) DEFAULT NULL,
  `TFC_LEN_MINUTES_OFFSET` int(11) DEFAULT NULL,
  `TFC_LEN_MINUTES_LENGTH` int(11) DEFAULT NULL,
  `TFC_LEN_SECONDS_OFFSET` int(11) DEFAULT NULL,
  `TFC_LEN_SECONDS_LENGTH` int(11) DEFAULT NULL,
  `TFC_LENGTH_OFFSET` int(11) DEFAULT NULL,
  `TFC_LENGTH_LENGTH` int(11) DEFAULT NULL,
  `TFC_DATA_OFFSET` int(11) DEFAULT NULL,
  `TFC_DATA_LENGTH` int(11) DEFAULT NULL,
  `TFC_EVENT_ID_OFFSET` int(11) DEFAULT NULL,
  `TFC_EVENT_ID_LENGTH` int(11) DEFAULT NULL,
  `TFC_ANNC_TYPE_OFFSET` int(11) DEFAULT NULL,
  `TFC_ANNC_TYPE_LENGTH` int(11) DEFAULT NULL,
  `MUS_PATH` char(255) DEFAULT NULL,
  `MUS_PREIMPORT_CMD` text,
  `MUS_WIN_PATH` char(255) DEFAULT NULL,
  `MUS_WIN_PREIMPORT_CMD` text,
  `MUS_IMPORT_TEMPLATE` char(64) DEFAULT 'Rivendell Standard Import',
  `MUS_LABEL_CART` char(32) DEFAULT NULL,
  `MUS_TRACK_CART` char(32) DEFAULT NULL,
  `MUS_BREAK_STRING` char(64) DEFAULT NULL,
  `MUS_TRACK_STRING` char(64) DEFAULT NULL,
  `MUS_CART_OFFSET` int(11) DEFAULT NULL,
  `MUS_CART_LENGTH` int(11) DEFAULT NULL,
  `MUS_TITLE_OFFSET` int(11) DEFAULT NULL,
  `MUS_TITLE_LENGTH` int(11) DEFAULT NULL,
  `MUS_START_OFFSET` int(11) DEFAULT NULL,
  `MUS_START_LENGTH` int(11) DEFAULT NULL,
  `MUS_HOURS_OFFSET` int(11) DEFAULT NULL,
  `MUS_HOURS_LENGTH` int(11) DEFAULT NULL,
  `MUS_MINUTES_OFFSET` int(11) DEFAULT NULL,
  `MUS_MINUTES_LENGTH` int(11) DEFAULT NULL,
  `MUS_SECONDS_OFFSET` int(11) DEFAULT NULL,
  `MUS_SECONDS_LENGTH` int(11) DEFAULT NULL,
  `MUS_LEN_HOURS_OFFSET` int(11) DEFAULT NULL,
  `MUS_LEN_HOURS_LENGTH` int(11) DEFAULT NULL,
  `MUS_LEN_MINUTES_OFFSET` int(11) DEFAULT NULL,
  `MUS_LEN_MINUTES_LENGTH` int(11) DEFAULT NULL,
  `MUS_LEN_SECONDS_OFFSET` int(11) DEFAULT NULL,
  `MUS_LEN_SECONDS_LENGTH` int(11) DEFAULT NULL,
  `MUS_LENGTH_OFFSET` int(11) DEFAULT NULL,
  `MUS_LENGTH_LENGTH` int(11) DEFAULT NULL,
  `MUS_DATA_OFFSET` int(11) DEFAULT NULL,
  `MUS_DATA_LENGTH` int(11) DEFAULT NULL,
  `MUS_EVENT_ID_OFFSET` int(11) DEFAULT NULL,
  `MUS_EVENT_ID_LENGTH` int(11) DEFAULT NULL,
  `MUS_ANNC_TYPE_OFFSET` int(11) DEFAULT NULL,
  `MUS_ANNC_TYPE_LENGTH` int(11) DEFAULT NULL,
  `CLOCK0` char(64) DEFAULT NULL,
  `CLOCK1` char(64) DEFAULT NULL,
  `CLOCK2` char(64) DEFAULT NULL,
  `CLOCK3` char(64) DEFAULT NULL,
  `CLOCK4` char(64) DEFAULT NULL,
  `CLOCK5` char(64) DEFAULT NULL,
  `CLOCK6` char(64) DEFAULT NULL,
  `CLOCK7` char(64) DEFAULT NULL,
  `CLOCK8` char(64) DEFAULT NULL,
  `CLOCK9` char(64) DEFAULT NULL,
  `CLOCK10` char(64) DEFAULT NULL,
  `CLOCK11` char(64) DEFAULT NULL,
  `CLOCK12` char(64) DEFAULT NULL,
  `CLOCK13` char(64) DEFAULT NULL,
  `CLOCK14` char(64) DEFAULT NULL,
  `CLOCK15` char(64) DEFAULT NULL,
  `CLOCK16` char(64) DEFAULT NULL,
  `CLOCK17` char(64) DEFAULT NULL,
  `CLOCK18` char(64) DEFAULT NULL,
  `CLOCK19` char(64) DEFAULT NULL,
  `CLOCK20` char(64) DEFAULT NULL,
  `CLOCK21` char(64) DEFAULT NULL,
  `CLOCK22` char(64) DEFAULT NULL,
  `CLOCK23` char(64) DEFAULT NULL,
  `CLOCK24` char(64) DEFAULT NULL,
  `CLOCK25` char(64) DEFAULT NULL,
  `CLOCK26` char(64) DEFAULT NULL,
  `CLOCK27` char(64) DEFAULT NULL,
  `CLOCK28` char(64) DEFAULT NULL,
  `CLOCK29` char(64) DEFAULT NULL,
  `CLOCK30` char(64) DEFAULT NULL,
  `CLOCK31` char(64) DEFAULT NULL,
  `CLOCK32` char(64) DEFAULT NULL,
  `CLOCK33` char(64) DEFAULT NULL,
  `CLOCK34` char(64) DEFAULT NULL,
  `CLOCK35` char(64) DEFAULT NULL,
  `CLOCK36` char(64) DEFAULT NULL,
  `CLOCK37` char(64) DEFAULT NULL,
  `CLOCK38` char(64) DEFAULT NULL,
  `CLOCK39` char(64) DEFAULT NULL,
  `CLOCK40` char(64) DEFAULT NULL,
  `CLOCK41` char(64) DEFAULT NULL,
  `CLOCK42` char(64) DEFAULT NULL,
  `CLOCK43` char(64) DEFAULT NULL,
  `CLOCK44` char(64) DEFAULT NULL,
  `CLOCK45` char(64) DEFAULT NULL,
  `CLOCK46` char(64) DEFAULT NULL,
  `CLOCK47` char(64) DEFAULT NULL,
  `CLOCK48` char(64) DEFAULT NULL,
  `CLOCK49` char(64) DEFAULT NULL,
  `CLOCK50` char(64) DEFAULT NULL,
  `CLOCK51` char(64) DEFAULT NULL,
  `CLOCK52` char(64) DEFAULT NULL,
  `CLOCK53` char(64) DEFAULT NULL,
  `CLOCK54` char(64) DEFAULT NULL,
  `CLOCK55` char(64) DEFAULT NULL,
  `CLOCK56` char(64) DEFAULT NULL,
  `CLOCK57` char(64) DEFAULT NULL,
  `CLOCK58` char(64) DEFAULT NULL,
  `CLOCK59` char(64) DEFAULT NULL,
  `CLOCK60` char(64) DEFAULT NULL,
  `CLOCK61` char(64) DEFAULT NULL,
  `CLOCK62` char(64) DEFAULT NULL,
  `CLOCK63` char(64) DEFAULT NULL,
  `CLOCK64` char(64) DEFAULT NULL,
  `CLOCK65` char(64) DEFAULT NULL,
  `CLOCK66` char(64) DEFAULT NULL,
  `CLOCK67` char(64) DEFAULT NULL,
  `CLOCK68` char(64) DEFAULT NULL,
  `CLOCK69` char(64) DEFAULT NULL,
  `CLOCK70` char(64) DEFAULT NULL,
  `CLOCK71` char(64) DEFAULT NULL,
  `CLOCK72` char(64) DEFAULT NULL,
  `CLOCK73` char(64) DEFAULT NULL,
  `CLOCK74` char(64) DEFAULT NULL,
  `CLOCK75` char(64) DEFAULT NULL,
  `CLOCK76` char(64) DEFAULT NULL,
  `CLOCK77` char(64) DEFAULT NULL,
  `CLOCK78` char(64) DEFAULT NULL,
  `CLOCK79` char(64) DEFAULT NULL,
  `CLOCK80` char(64) DEFAULT NULL,
  `CLOCK81` char(64) DEFAULT NULL,
  `CLOCK82` char(64) DEFAULT NULL,
  `CLOCK83` char(64) DEFAULT NULL,
  `CLOCK84` char(64) DEFAULT NULL,
  `CLOCK85` char(64) DEFAULT NULL,
  `CLOCK86` char(64) DEFAULT NULL,
  `CLOCK87` char(64) DEFAULT NULL,
  `CLOCK88` char(64) DEFAULT NULL,
  `CLOCK89` char(64) DEFAULT NULL,
  `CLOCK90` char(64) DEFAULT NULL,
  `CLOCK91` char(64) DEFAULT NULL,
  `CLOCK92` char(64) DEFAULT NULL,
  `CLOCK93` char(64) DEFAULT NULL,
  `CLOCK94` char(64) DEFAULT NULL,
  `CLOCK95` char(64) DEFAULT NULL,
  `CLOCK96` char(64) DEFAULT NULL,
  `CLOCK97` char(64) DEFAULT NULL,
  `CLOCK98` char(64) DEFAULT NULL,
  `CLOCK99` char(64) DEFAULT NULL,
  `CLOCK100` char(64) DEFAULT NULL,
  `CLOCK101` char(64) DEFAULT NULL,
  `CLOCK102` char(64) DEFAULT NULL,
  `CLOCK103` char(64) DEFAULT NULL,
  `CLOCK104` char(64) DEFAULT NULL,
  `CLOCK105` char(64) DEFAULT NULL,
  `CLOCK106` char(64) DEFAULT NULL,
  `CLOCK107` char(64) DEFAULT NULL,
  `CLOCK108` char(64) DEFAULT NULL,
  `CLOCK109` char(64) DEFAULT NULL,
  `CLOCK110` char(64) DEFAULT NULL,
  `CLOCK111` char(64) DEFAULT NULL,
  `CLOCK112` char(64) DEFAULT NULL,
  `CLOCK113` char(64) DEFAULT NULL,
  `CLOCK114` char(64) DEFAULT NULL,
  `CLOCK115` char(64) DEFAULT NULL,
  `CLOCK116` char(64) DEFAULT NULL,
  `CLOCK117` char(64) DEFAULT NULL,
  `CLOCK118` char(64) DEFAULT NULL,
  `CLOCK119` char(64) DEFAULT NULL,
  `CLOCK120` char(64) DEFAULT NULL,
  `CLOCK121` char(64) DEFAULT NULL,
  `CLOCK122` char(64) DEFAULT NULL,
  `CLOCK123` char(64) DEFAULT NULL,
  `CLOCK124` char(64) DEFAULT NULL,
  `CLOCK125` char(64) DEFAULT NULL,
  `CLOCK126` char(64) DEFAULT NULL,
  `CLOCK127` char(64) DEFAULT NULL,
  `CLOCK128` char(64) DEFAULT NULL,
  `CLOCK129` char(64) DEFAULT NULL,
  `CLOCK130` char(64) DEFAULT NULL,
  `CLOCK131` char(64) DEFAULT NULL,
  `CLOCK132` char(64) DEFAULT NULL,
  `CLOCK133` char(64) DEFAULT NULL,
  `CLOCK134` char(64) DEFAULT NULL,
  `CLOCK135` char(64) DEFAULT NULL,
  `CLOCK136` char(64) DEFAULT NULL,
  `CLOCK137` char(64) DEFAULT NULL,
  `CLOCK138` char(64) DEFAULT NULL,
  `CLOCK139` char(64) DEFAULT NULL,
  `CLOCK140` char(64) DEFAULT NULL,
  `CLOCK141` char(64) DEFAULT NULL,
  `CLOCK142` char(64) DEFAULT NULL,
  `CLOCK143` char(64) DEFAULT NULL,
  `CLOCK144` char(64) DEFAULT NULL,
  `CLOCK145` char(64) DEFAULT NULL,
  `CLOCK146` char(64) DEFAULT NULL,
  `CLOCK147` char(64) DEFAULT NULL,
  `CLOCK148` char(64) DEFAULT NULL,
  `CLOCK149` char(64) DEFAULT NULL,
  `CLOCK150` char(64) DEFAULT NULL,
  `CLOCK151` char(64) DEFAULT NULL,
  `CLOCK152` char(64) DEFAULT NULL,
  `CLOCK153` char(64) DEFAULT NULL,
  `CLOCK154` char(64) DEFAULT NULL,
  `CLOCK155` char(64) DEFAULT NULL,
  `CLOCK156` char(64) DEFAULT NULL,
  `CLOCK157` char(64) DEFAULT NULL,
  `CLOCK158` char(64) DEFAULT NULL,
  `CLOCK159` char(64) DEFAULT NULL,
  `CLOCK160` char(64) DEFAULT NULL,
  `CLOCK161` char(64) DEFAULT NULL,
  `CLOCK162` char(64) DEFAULT NULL,
  `CLOCK163` char(64) DEFAULT NULL,
  `CLOCK164` char(64) DEFAULT NULL,
  `CLOCK165` char(64) DEFAULT NULL,
  `CLOCK166` char(64) DEFAULT NULL,
  `CLOCK167` char(64) DEFAULT NULL,
  PRIMARY KEY (`NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICES`
--

LOCK TABLES `SERVICES` WRITE;
/*!40000 ALTER TABLE `SERVICES` DISABLE KEYS */;
INSERT INTO `SERVICES` VALUES ('Production','Default Audio Service',NULL,'Production log for %m/%d/%Y',NULL,'N',NULL,NULL,'N',-1,-1,NULL,NULL,NULL,NULL,'Rivendell Standard Import',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Rivendell Standard Import',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `SERVICES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVICE_PERMS`
--

DROP TABLE IF EXISTS `SERVICE_PERMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVICE_PERMS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) DEFAULT NULL,
  `SERVICE_NAME` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION_NAME`),
  KEY `SERVICE_IDX` (`SERVICE_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVICE_PERMS`
--

LOCK TABLES `SERVICE_PERMS` WRITE;
/*!40000 ALTER TABLE `SERVICE_PERMS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SERVICE_PERMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATIONS`
--

DROP TABLE IF EXISTS `STATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATIONS` (
  `NAME` char(64) NOT NULL,
  `DESCRIPTION` char(64) DEFAULT NULL,
  `USER_NAME` char(255) DEFAULT NULL,
  `DEFAULT_NAME` char(255) DEFAULT NULL,
  `IPV4_ADDRESS` char(15) DEFAULT '127.0.0.2',
  `HTTP_STATION` char(64) DEFAULT 'localhost',
  `CAE_STATION` char(64) DEFAULT 'localhost',
  `TIME_OFFSET` int(11) DEFAULT '0',
  `BACKUP_DIR` char(255) DEFAULT NULL,
  `BACKUP_LIFE` int(11) DEFAULT '0',
  `BROADCAST_SECURITY` int(10) unsigned DEFAULT '0',
  `HEARTBEAT_CART` int(10) unsigned DEFAULT '0',
  `HEARTBEAT_INTERVAL` int(10) unsigned DEFAULT '0',
  `STARTUP_CART` int(10) unsigned DEFAULT '0',
  `EDITOR_PATH` char(255) DEFAULT '',
  `FILTER_MODE` int(11) DEFAULT '0',
  `START_JACK` enum('N','Y') DEFAULT 'N',
  `JACK_SERVER_NAME` char(64) DEFAULT NULL,
  `JACK_COMMAND_LINE` char(255) DEFAULT NULL,
  `CUE_CARD` int(11) DEFAULT '0',
  `CUE_PORT` int(11) DEFAULT '0',
  `CUE_START_CART` int(10) unsigned DEFAULT NULL,
  `CUE_STOP_CART` int(10) unsigned DEFAULT NULL,
  `CARTSLOT_COLUMNS` int(11) DEFAULT '1',
  `CARTSLOT_ROWS` int(11) DEFAULT '8',
  `ENABLE_DRAGDROP` enum('N','Y') DEFAULT 'Y',
  `ENFORCE_PANEL_SETUP` enum('N','Y') DEFAULT 'N',
  `SYSTEM_MAINT` enum('N','Y') DEFAULT 'Y',
  `STATION_SCANNED` enum('N','Y') DEFAULT 'N',
  `HAVE_OGGENC` enum('N','Y') DEFAULT 'N',
  `HAVE_OGG123` enum('N','Y') DEFAULT 'N',
  `HAVE_FLAC` enum('N','Y') DEFAULT 'N',
  `HAVE_TWOLAME` enum('N','Y') DEFAULT 'N',
  `HAVE_LAME` enum('N','Y') DEFAULT 'N',
  `HAVE_MPG321` enum('N','Y') DEFAULT 'N',
  `HPI_VERSION` char(16) DEFAULT NULL,
  `JACK_VERSION` char(16) DEFAULT NULL,
  `ALSA_VERSION` char(16) DEFAULT NULL,
  `CARD0_DRIVER` int(11) DEFAULT '0',
  `CARD0_NAME` char(64) DEFAULT NULL,
  `CARD0_INPUTS` int(11) DEFAULT '-1',
  `CARD0_OUTPUTS` int(11) DEFAULT '-1',
  `CARD1_DRIVER` int(11) DEFAULT '0',
  `CARD1_NAME` char(64) DEFAULT NULL,
  `CARD1_INPUTS` int(11) DEFAULT '-1',
  `CARD1_OUTPUTS` int(11) DEFAULT '-1',
  `CARD2_DRIVER` int(11) DEFAULT '0',
  `CARD2_NAME` char(64) DEFAULT NULL,
  `CARD2_INPUTS` int(11) DEFAULT '-1',
  `CARD2_OUTPUTS` int(11) DEFAULT '-1',
  `CARD3_DRIVER` int(11) DEFAULT '0',
  `CARD3_NAME` char(64) DEFAULT NULL,
  `CARD3_INPUTS` int(11) DEFAULT '-1',
  `CARD3_OUTPUTS` int(11) DEFAULT '-1',
  `CARD4_DRIVER` int(11) DEFAULT '0',
  `CARD4_NAME` char(64) DEFAULT NULL,
  `CARD4_INPUTS` int(11) DEFAULT '-1',
  `CARD4_OUTPUTS` int(11) DEFAULT '-1',
  `CARD5_DRIVER` int(11) DEFAULT '0',
  `CARD5_NAME` char(64) DEFAULT NULL,
  `CARD5_INPUTS` int(11) DEFAULT '-1',
  `CARD5_OUTPUTS` int(11) DEFAULT '-1',
  `CARD6_DRIVER` int(11) DEFAULT '0',
  `CARD6_NAME` char(64) DEFAULT NULL,
  `CARD6_INPUTS` int(11) DEFAULT '-1',
  `CARD6_OUTPUTS` int(11) DEFAULT '-1',
  `CARD7_DRIVER` int(11) DEFAULT '0',
  `CARD7_NAME` char(64) DEFAULT NULL,
  `CARD7_INPUTS` int(11) DEFAULT '-1',
  `CARD7_OUTPUTS` int(11) DEFAULT '-1',
  PRIMARY KEY (`NAME`),
  KEY `DESCRIPTION_IDX` (`DESCRIPTION`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATIONS`
--

LOCK TABLES `STATIONS` WRITE;
/*!40000 ALTER TABLE `STATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `STATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SWITCHER_NODES`
--

DROP TABLE IF EXISTS `SWITCHER_NODES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SWITCHER_NODES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) DEFAULT NULL,
  `MATRIX` int(11) DEFAULT NULL,
  `BASE_OUTPUT` int(11) DEFAULT '0',
  `HOSTNAME` char(64) DEFAULT NULL,
  `PASSWORD` char(64) DEFAULT NULL,
  `TCP_PORT` int(11) DEFAULT NULL,
  `DESCRIPTION` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `STATION_IDX` (`STATION_NAME`,`MATRIX`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SWITCHER_NODES`
--

LOCK TABLES `SWITCHER_NODES` WRITE;
/*!40000 ALTER TABLE `SWITCHER_NODES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SWITCHER_NODES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SYSTEM`
--

DROP TABLE IF EXISTS `SYSTEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SYSTEM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SAMPLE_RATE` int(10) unsigned DEFAULT '48000',
  `DUP_CART_TITLES` enum('N','Y') NOT NULL DEFAULT 'Y',
  `MAX_POST_LENGTH` int(10) unsigned DEFAULT '10000000',
  `ISCI_XREFERENCE_PATH` char(255) DEFAULT NULL,
  `TEMP_CART_GROUP` char(10) DEFAULT 'TEMP',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SYSTEM`
--

LOCK TABLES `SYSTEM` WRITE;
/*!40000 ALTER TABLE `SYSTEM` DISABLE KEYS */;
INSERT INTO `SYSTEM` VALUES (1,48000,'Y',10000000,NULL,'TEMP');
/*!40000 ALTER TABLE `SYSTEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRIGGERS`
--

DROP TABLE IF EXISTS `TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TRIGGERS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CUT_NAME` char(12) DEFAULT NULL,
  `TRIGGER_CODE` int(10) unsigned DEFAULT NULL,
  `OFFSET` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CUT_NAME_IDX` (`CUT_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRIGGERS`
--

LOCK TABLES `TRIGGERS` WRITE;
/*!40000 ALTER TABLE `TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TTYS`
--

DROP TABLE IF EXISTS `TTYS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TTYS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PORT_ID` int(10) unsigned NOT NULL,
  `ACTIVE` enum('N','Y') NOT NULL DEFAULT 'N',
  `STATION_NAME` char(64) NOT NULL,
  `PORT` char(20) DEFAULT NULL,
  `BAUD_RATE` int(11) DEFAULT '9600',
  `DATA_BITS` int(11) DEFAULT '8',
  `STOP_BITS` int(11) DEFAULT '1',
  `PARITY` int(11) DEFAULT '0',
  `TERMINATION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `STATION_NAME_IDX` (`STATION_NAME`),
  KEY `ACTIVE_IDX` (`ACTIVE`),
  KEY `PORT_ID_IDX` (`PORT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TTYS`
--

LOCK TABLES `TTYS` WRITE;
/*!40000 ALTER TABLE `TTYS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TTYS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `LOGIN_NAME` char(255) NOT NULL,
  `FULL_NAME` char(255) DEFAULT NULL,
  `PHONE_NUMBER` char(20) DEFAULT NULL,
  `DESCRIPTION` char(255) DEFAULT NULL,
  `PASSWORD` char(32) DEFAULT NULL,
  `ENABLE_WEB` enum('N','Y') DEFAULT 'N',
  `ADMIN_USERS_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `ADMIN_CONFIG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `CREATE_CARTS_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `DELETE_CARTS_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `MODIFY_CARTS_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `EDIT_AUDIO_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `ASSIGN_CART_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `CREATE_LOG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `DELETE_LOG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `DELETE_REC_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `PLAYOUT_LOG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `ARRANGE_LOG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `MODIFY_TEMPLATE_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `ADDTO_LOG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `REMOVEFROM_LOG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `CONFIG_PANELS_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `VOICETRACK_LOG_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `EDIT_CATCHES_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `ADD_PODCAST_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `EDIT_PODCAST_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  `DELETE_PODCAST_PRIV` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`LOGIN_NAME`),
  KEY `FULL_NAME_IDX` (`FULL_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES ('admin','Rivendell Administrator',NULL,'Default Administrator Account','','N','Y','Y','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N','N'),('user','Rivendell User',NULL,'Default User Account','','N','N','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y');
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_PERMS`
--

DROP TABLE IF EXISTS `USER_PERMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_PERMS` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USER_NAME` char(255) DEFAULT NULL,
  `GROUP_NAME` char(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_IDX` (`USER_NAME`),
  KEY `GROUP_IDX` (`GROUP_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_PERMS`
--

LOCK TABLES `USER_PERMS` WRITE;
/*!40000 ALTER TABLE `USER_PERMS` DISABLE KEYS */;
INSERT INTO `USER_PERMS` VALUES (1,'user','TEMP'),(2,'user','TEST'),(3,'user','TRAFFIC'),(4,'user','MUSIC'),(5,'user','BEDS'),(6,'user','STINGS'),(7,'user','MACROS'),(8,'user','LEGAL'),(9,'user','IDENTS');
/*!40000 ALTER TABLE `USER_PERMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VERSION`
--

DROP TABLE IF EXISTS `VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VERSION` (
  `DB` int(11) NOT NULL,
  `LAST_MAINT_DATETIME` datetime DEFAULT '1970-01-01 00:00:00',
  `LAST_ISCI_XREFERENCE` datetime DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`DB`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VERSION`
--

LOCK TABLES `VERSION` WRITE;
/*!40000 ALTER TABLE `VERSION` DISABLE KEYS */;
INSERT INTO `VERSION` VALUES (234,'1970-01-01 00:00:00','1970-01-01 00:00:00');
/*!40000 ALTER TABLE `VERSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VGUEST_RESOURCES`
--

DROP TABLE IF EXISTS `VGUEST_RESOURCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VGUEST_RESOURCES` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `STATION_NAME` char(64) NOT NULL,
  `MATRIX_NUM` int(11) NOT NULL,
  `VGUEST_TYPE` int(11) NOT NULL,
  `NUMBER` int(11) NOT NULL,
  `ENGINE_NUM` int(11) DEFAULT '-1',
  `DEVICE_NUM` int(11) DEFAULT '-1',
  `SURFACE_NUM` int(11) DEFAULT '0',
  `RELAY_NUM` int(11) DEFAULT '-1',
  `BUSS_NUM` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `STATION_MATRIX_IDX` (`STATION_NAME`,`MATRIX_NUM`,`VGUEST_TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VGUEST_RESOURCES`
--

LOCK TABLES `VGUEST_RESOURCES` WRITE;
/*!40000 ALTER TABLE `VGUEST_RESOURCES` DISABLE KEYS */;
/*!40000 ALTER TABLE `VGUEST_RESOURCES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_CONNECTIONS`
--

DROP TABLE IF EXISTS `WEB_CONNECTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_CONNECTIONS` (
  `SESSION_ID` int(10) unsigned NOT NULL,
  `LOGIN_NAME` char(255) DEFAULT NULL,
  `IP_ADDRESS` char(16) DEFAULT NULL,
  `TIME_STAMP` datetime DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_CONNECTIONS`
--

LOCK TABLES `WEB_CONNECTIONS` WRITE;
/*!40000 ALTER TABLE `WEB_CONNECTIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `WEB_CONNECTIONS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-05 12:08:15

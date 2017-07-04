CREATE DATABASE  IF NOT EXISTS `socialnetwork` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `socialnetwork`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: socialnetwork
-- ------------------------------------------------------
-- Server version	5.7.9

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
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `f1` int(11) NOT NULL,
  `f2` int(11) NOT NULL,
  `since` date DEFAULT NULL,
  PRIMARY KEY (`f2`,`f1`),
  UNIQUE KEY `f1_UNIQUE` (`f1`),
  UNIQUE KEY `f2_UNIQUE` (`f2`),
  KEY `f1_idx` (`f1`),
  CONSTRAINT `f1` FOREIGN KEY (`f1`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `f2` FOREIGN KEY (`f2`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (2145053,2132287,'2017-07-04'),(2132287,2145053,'2017-07-04');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `id_poster` int(11) NOT NULL,
  `date` date NOT NULL,
  `visibility` enum('public','private','only me') NOT NULL DEFAULT 'public',
  `post_info` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='			\n	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `from` int(11) NOT NULL,
  `to` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `status` enum('pending','approved') DEFAULT 'pending',
  PRIMARY KEY (`from`,`to`),
  UNIQUE KEY `to_UNIQUE` (`to`),
  UNIQUE KEY `from_UNIQUE` (`from`),
  CONSTRAINT `from` FOREIGN KEY (`from`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `to` FOREIGN KEY (`to`) REFERENCES `user` (`idno`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `idno` int(11) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` char(45) DEFAULT NULL,
  `lastname` char(20) DEFAULT NULL,
  `status` enum('pending','active','deactivated','suspended','offline') NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`idno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2117170,'hotdog','Francico III','Cacas','offline'),(2117356,'kitty','Bryle','Castro','suspended'),(2130915,'cheese','Gian','Dumpit','deactivated'),(2132287,'webtekis','Evrian','Diano','active'),(2145053,'Fishball','renz','Willie','offline'),(2146632,'chicken ','Johnson','Ampaguey','pending'),(2153143,'dinakdakan','Jaren','Nebab','deactivated'),(2153442,'ganda','Tristan','Villareal','active'),(2154780,'ginataan','Samantha','Dacanay','suspended'),(2156551,'lipstick','Lorraine','Padawan','active'),(2158498,'bulalo','Iyar','Benitez','pending');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-04 15:51:52

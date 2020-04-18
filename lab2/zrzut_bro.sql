-- MySQL dump 10.13  Distrib 5.5.21, for Win32 (x86)
--
-- Host: localhost    Database: bro
-- ------------------------------------------------------
-- Server version	5.5.21-log

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
-- Table structure for table `osoby`
--

DROP TABLE IF EXISTS `osoby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `osoby` (
  `id_o` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `imie` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `nazwisko` char(21) COLLATE utf8_unicode_ci NOT NULL,
  `wiek` tinyint(4) DEFAULT NULL,
  `miasto` char(31) COLLATE utf8_unicode_ci DEFAULT 'Nibylandia',
  PRIMARY KEY (`id_o`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoby`
--

LOCK TABLES `osoby` WRITE;
/*!40000 ALTER TABLE `osoby` DISABLE KEYS */;
INSERT INTO `osoby` VALUES (1,'Ola','lis',20,'Zabrze'),(2,'Ela','Pis',23,'Mysiogóra'),(3,'Adam','Mickiewicz',44,'Nibylandia');
/*!40000 ALTER TABLE `osoby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scal`
--

DROP TABLE IF EXISTS `scal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scal` (
  `id_s` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `id_o` tinyint(3) unsigned NOT NULL,
  `id_t` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_s`),
  KEY `id_o` (`id_o`),
  KEY `id_t` (`id_t`),
  CONSTRAINT `scal_ibfk_1` FOREIGN KEY (`id_o`) REFERENCES `osoby` (`id_o`),
  CONSTRAINT `scal_ibfk_2` FOREIGN KEY (`id_t`) REFERENCES `telefony` (`id_t`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scal`
--

LOCK TABLES `scal` WRITE;
/*!40000 ALTER TABLE `scal` DISABLE KEYS */;
INSERT INTO `scal` VALUES (1,1,2),(2,1,4),(3,2,2),(4,3,1);
/*!40000 ALTER TABLE `scal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefony`
--

DROP TABLE IF EXISTS `telefony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefony` (
  `id_t` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `numer` char(9) COLLATE utf8_unicode_ci NOT NULL,
  `typ` enum('stacjonarny','komórka') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'komórka',
  `operator` enum('play','orange','ATM','era') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_t`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefony`
--

LOCK TABLES `telefony` WRITE;
/*!40000 ALTER TABLE `telefony` DISABLE KEYS */;
INSERT INTO `telefony` VALUES (1,'123123123','stacjonarny',''),(2,'32423424','komórka','orange'),(3,'456456456','komórka','era'),(4,'333333333','komórka','ATM');
/*!40000 ALTER TABLE `telefony` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04 10:26:27

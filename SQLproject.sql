-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: ducarrouge15201291
-- ------------------------------------------------------
-- Server version	5.7.9-log

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
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidates` (
  `CaId` int(11) NOT NULL,
  `CaName` varchar(45) DEFAULT NULL,
  `CaAddress` varchar(45) DEFAULT NULL,
  `CaTel` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`CaId`),
  KEY `Ca_FK_Interviews_idx` (`CaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
INSERT INTO `candidates` VALUES (1,'Morgan','Stockholm','0834545555'),(2,'Edward','Berlin','0835412552'),(3,'Mike','London','0014156843235'),(4,'Steve','Dublin','+353834599874'),(5,'Laura','New York',NULL),(6,'Christine','Paris','+33687858631'),(7,'Jordan','Milano','003398563321'),(8,'Michael','Roma',NULL),(9,'Steven','Tokyo','0869854415'),(10,'John','Sydney','+8955223658');
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidatesskills`
--

DROP TABLE IF EXISTS `candidatesskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidatesskills` (
  `CaId` int(11) NOT NULL AUTO_INCREMENT,
  `CaSk` varchar(45) NOT NULL,
  PRIMARY KEY (`CaId`,`CaSk`),
  CONSTRAINT `skills_FK_candidate` FOREIGN KEY (`CaId`) REFERENCES `candidates` (`CaId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatesskills`
--

LOCK TABLES `candidatesskills` WRITE;
/*!40000 ALTER TABLE `candidatesskills` DISABLE KEYS */;
INSERT INTO `candidatesskills` VALUES (1,'art'),(2,'administrative'),(2,'business'),(2,'organisation'),(3,'marketing'),(3,'online marketing'),(3,'social media'),(4,'programming'),(4,'web design'),(5,'account'),(5,'business'),(5,'finance'),(6,'human resources'),(7,'administrative'),(7,'economics'),(8,'administrative'),(8,'politics'),(9,'economics'),(9,'finance'),(10,'human resources'),(10,'management');
/*!40000 ALTER TABLE `candidatesskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `CoId` int(11) NOT NULL,
  `CoName` varchar(45) DEFAULT NULL,
  `CoRefName` varchar(45) DEFAULT NULL,
  `CoAddress` varchar(45) DEFAULT NULL,
  `CoTel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CoId`),
  CONSTRAINT `Companies_FKK_Position` FOREIGN KEY (`CoId`) REFERENCES `positions` (`CoId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Google','Sundar Pichai','Mountain View','+15251545'),(2,'Facebook','Mark Zuckerberg','Menlo Park','0002588215'),(3,'Twitter','Jack Dorsey','San Francisco','008828499'),(4,'FitBit','James Park','San Francisco','966482005'),(5,'Nike','Phil Knight','Eugene','+963221541'),(6,'Winchester','','New Haven','025483499'),(7,'Allianz','Oliver Bate','Berlin','0695926326'),(8,'Adidas','Herbert Hainer','Herzogenaurach','626599822'),(9,'Apple','Tim Cook','Cupertino','+52556989'),(10,'Goldman Sachs','Lloyd Blankfein','New York','+233699822');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interviews` (
  `CaId` int(11) NOT NULL,
  `PoId` int(11) NOT NULL,
  `IntDate` date NOT NULL,
  `HiringDecision` enum('Yes','No') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`CaId`,`PoId`,`IntDate`),
  KEY `Interviews_FK_Positions_idx` (`PoId`),
  CONSTRAINT `interviews_FK_candidates` FOREIGN KEY (`CaId`) REFERENCES `candidates` (`CaId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviews`
--

LOCK TABLES `interviews` WRITE;
/*!40000 ALTER TABLE `interviews` DISABLE KEYS */;
INSERT INTO `interviews` VALUES (1,1,'2015-01-01','No'),(1,2,'2015-01-02','No'),(1,3,'2015-01-15','Yes'),(2,2,'2015-01-06','No'),(2,2,'2015-01-15','No'),(3,3,'2015-02-01','No'),(3,4,'2015-02-06','No'),(4,5,'2015-01-20','No'),(5,6,'2015-02-12','No'),(5,7,'2015-02-16','Yes'),(6,6,'2015-01-19','No'),(6,6,'2015-01-26','No'),(6,8,'2015-01-18','No'),(7,4,'2015-01-01','Yes'),(8,8,'2015-01-29','No'),(8,9,'2015-02-01','No'),(10,10,'2015-02-15','No'),(10,11,'2015-02-20','No'),(10,12,'2015-02-28','Yes');
/*!40000 ALTER TABLE `interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `PoId` int(11) NOT NULL,
  `CoId` int(11) NOT NULL,
  `PoType` varchar(45) DEFAULT NULL,
  KEY `Positions_FK_Companies_idx` (`CoId`),
  KEY `Positions_FK_Interviews_idx` (`PoId`),
  CONSTRAINT `Positions_FK_Interviews` FOREIGN KEY (`PoId`) REFERENCES `interviews` (`PoId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,1,'Engineering'),(2,1,'Sales'),(3,2,'Management'),(4,2,'Administrative'),(5,3,'Business'),(6,4,'Sales'),(7,5,'Engineering'),(8,6,'Sales'),(9,8,'Marketing'),(10,9,'Human Resources'),(11,7,'Sales'),(12,10,'Management');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positionsskills`
--

DROP TABLE IF EXISTS `positionsskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positionsskills` (
  `PoId` int(11) NOT NULL,
  `PoSk` varchar(300) NOT NULL,
  PRIMARY KEY (`PoId`,`PoSk`),
  CONSTRAINT `PositionsSkills_FK_Position` FOREIGN KEY (`PoId`) REFERENCES `positions` (`PoId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positionsskills`
--

LOCK TABLES `positionsskills` WRITE;
/*!40000 ALTER TABLE `positionsskills` DISABLE KEYS */;
INSERT INTO `positionsskills` VALUES (1,'administrative'),(1,'programming'),(1,'web design'),(2,'marketing'),(2,'organisation'),(3,'administrative'),(3,'management'),(3,'organisation'),(4,'administrative'),(4,'sales'),(5,'accounting'),(5,'finance'),(6,'sales'),(7,'management'),(7,'programming'),(7,'web design'),(8,'marketing'),(8,'organisation'),(9,'digital marketing'),(9,'social media'),(10,'administrative'),(10,'human resources'),(10,'management'),(10,'organisation'),(11,'marketing'),(11,'organisation'),(11,'sales'),(12,'administrative'),(12,'management');
/*!40000 ALTER TABLE `positionsskills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-14 21:44:40

-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: xxxxxxxxx
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
  `PoSk` varchar(45) NOT NULL,
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

--
-- Dumping routines for database 'xxxxxxxxx'
--
/*!50003 DROP PROCEDURE IF EXISTS `CountAdminPositions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountAdminPositions`(IN PoSk VARCHAR(45))
BEGIN
SELECT COUNT(Distinct PoId)
FROM positions JOIN positionsskills
ON positions.PoId = positionsskills.PoId
WHERE PoSk = 'Administrative';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCandidateByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCandidateByID`(IN InputID INT)
BEGIN
SELECT *
FROM candidates
WHERE CaId = InputID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCandidateByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCandidateByName`(IN InputName VARCHAR(45))
BEGIN
SELECT *
FROM candidates
WHERE CaName = InputName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCandidatesInterviewed2+` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCandidatesInterviewed2+`()
BEGIN
SELECT candidates.CaName, candidates.CaId, COUNT(*)
FROM candidates JOIN interviews
ON candidates.CaId = interviews.CaId
HAVING COUNT(*) > 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCandidateWithSkillsForPositionID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCandidateWithSkillsForPositionID`(IN InputPoId INT)
BEGIN
SELECT *
FROM candidatesskills JOIN candidates
ON candidatesskills.CaId = candidate.CaId
JOIN interviews
ON candidates.CaId = interviews.CaId
JOIN positions
ON interviews.PoId = positions.PoId
JOIN positionsskills
ON positions.PoId = positionsskills.PoId
WHERE PoId = InputPoId AND candidatesskills.CaSk=positionsskills.PoSK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompanyByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompanyByID`(IN InputCoID INT)
BEGIN
SELECT *
FROM companies
WHERE CoId = InputCoID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompanyByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompanyByName`(IN InputCoName VARCHAR(45))
BEGIN
SELECT *
FROM companies
WHERE CoName = InputCoName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetInterviewsOnDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetInterviewsOnDate`(IN InputDate DATE)
BEGIN
SELECT * 
FROM interviews
WHERE interviews.IntDate = InputDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPositionByID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPositionByID`(IN InputPositionID INT)
BEGIN
SELECT *
FROM positions
WHERE PoId = InputPositionID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPositionForSkill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPositionForSkill`(IN InputPoSkill VARCHAR(45))
BEGIN
SELECT *
FROM positions JOIN positionsskills
ON positions.PoId = positionsskills.PoId

WHERE PoSk = InputPoSkill;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPositionsByCompany` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPositionsByCompany`()
BEGIN
SELECT *
FROM positions
GROUP BY positions.CoId
ORDER BY positions.CoId ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_CANDIDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_CANDIDATE`(
        IN  input_id                    INT(11)       , 
        IN  input_name                  VARCHAR(45)   , 
        IN  input_address               VARCHAR(45)   , 
        IN  input_tel                   VARCHAR(45) 
     )
BEGIN 

    INSERT INTO candidates
         (
           CaId                    , 
           CaName                  ,
           CaAddress               , 
           CaTel                    
         )
    VALUES 
         ( 
           input_id                , 
           input_name              , 
           input_address           , 
           input_tel                   
         ) ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_CANDIDATE_SKILL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_CANDIDATE_SKILL`(
        IN  input_id                    INT(11)       ,  
        IN  input_skill                 VARCHAR(45) 
     )
BEGIN 

    INSERT INTO candidatesskills
         (
           CaId                    ,  
           CaSk                    
         )
    VALUES 
         ( 
           input_id                , 
           input_skill                
         ) ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_COMPANY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_COMPANY`(
        IN  input_co_id                 INT(11), 
        IN 	input_co_name				VARCHAR(45),
        IN  input_co_RefName            VARCHAR(45), 
        IN  input_co_address            VARCHAR(45),
        IN	input_co_tel				VARCHAR(45)
     )
BEGIN 

    INSERT INTO companies
         (
           CoId                    , 
           CoName                  ,
           CoRefName			   ,
           CoAddress               , 
           CoTel                   
         )
    VALUES 
         ( 
           input_co_id                , 
           input_co_name              , 
           input_co_RefName			  ,
           input_co_address           , 
           input_co_tel                   
         ) ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_INTERVIEW` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_INTERVIEW`(
        IN  candidate_id		INT(11), 
        IN  position_id			INT(11), 
        IN  interview_date      DATE, 
        IN  input_decision      ENUM('Yes','No')
     )
BEGIN 

    INSERT INTO interviews
         (
           CaId, 
           PoId,
           IntDate, 
           HiringDecision                    
         )
    VALUES 
         ( 
           candidate_id, 
           position_id, 
           interview_date, 
           input_decision                   
         ) ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_POSITION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_POSITION`(
        IN  input_po_id			INT(11), 
        IN  input_co_id			INT(11), 
        IN  input_type      	VARCHAR(45)
     )
BEGIN 

    INSERT INTO positions
         (
           PoId, 
           CoId, 
           PoType                    
         )
    VALUES 
         ( 
           input_po_id, 
           input_co_id, 
           input_type                   
         ) ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSERT_POSITION_SKILL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERT_POSITION_SKILL`(
        IN  input_po_id			INT(11), 
        IN  input_po_skill      VARCHAR(300)
     )
BEGIN 

    INSERT INTO positionsskills
         (
           PoId, 
           PoSk                   
         )
    VALUES 
         ( 
           input_po_id, 
           input_po_skill                   
         ) ; 
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

-- Dump completed on 2015-11-18 18:51:11

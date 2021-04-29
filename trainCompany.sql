-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: trainCompany
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `Conductor`
--

DROP TABLE IF EXISTS `Conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conductor` (
  `Opr_id` int NOT NULL,
  `Cndr_id` int NOT NULL,
  `Cndr_name` char(20) NOT NULL,
  `Cert_num` int NOT NULL,
  `Train_id` int NOT NULL,
  PRIMARY KEY (`Cndr_id`),
  KEY `Opr_id` (`Opr_id`),
  CONSTRAINT `Conductor_ibfk_1` FOREIGN KEY (`Opr_id`) REFERENCES `Operator` (`Opr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conductor`
--

LOCK TABLES `Conductor` WRITE;
/*!40000 ALTER TABLE `Conductor` DISABLE KEYS */;
INSERT INTO `Conductor` VALUES (735808,63602,'Noah',823607,6290),(211646,137556,'Eleanor',809443,2572),(91435,531869,'Skyler',519247,9419),(178915,596562,'Kai',67414,7115),(17919,797296,'Laith',495623,9319),(690344,806423,'Vincent',592681,402),(493200,859677,'Karen',369463,6966),(878227,859821,'Myles',722982,597),(801973,914603,'Eaton',506521,1583),(412777,953236,'Richard',586574,4983);
/*!40000 ALTER TABLE `Conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operator`
--

DROP TABLE IF EXISTS `Operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Operator` (
  `Opr_id` int NOT NULL,
  `Opr_name` char(20) NOT NULL,
  `Cert_num` int NOT NULL,
  `Train_id` int NOT NULL,
  `Cndr_id` int NOT NULL,
  PRIMARY KEY (`Opr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operator`
--

LOCK TABLES `Operator` WRITE;
/*!40000 ALTER TABLE `Operator` DISABLE KEYS */;
INSERT INTO `Operator` VALUES (17919,'Rigel',866947,4053,836795),(91435,'Hashim',117350,8522,800473),(178915,'Ocean',928367,7776,655854),(211646,'Blossom',336946,895,895815),(412777,'Wesley',330574,2075,211251),(493200,'Wilma',147735,148,538408),(690344,'Rachel',637431,7551,793114),(735808,'Odessa',710906,4922,584058),(801973,'Declan',246657,243,211913),(878227,'April',320318,5854,729284);
/*!40000 ALTER TABLE `Operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Route` (
  `Route_id` int NOT NULL,
  `Stop_name` char(100) NOT NULL,
  `Fare` int NOT NULL,
  PRIMARY KEY (`Route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

LOCK TABLES `Route` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
INSERT INTO `Route` VALUES (847,'Hearst',174),(2707,'Allappuzha',128),(4142,'Columbia',195),(5059,'Brentwood',74),(5125,'Châtellerault',126),(5314,'Denver',160),(5646,'Eckernförde',134),(8109,'Alcorcón',63),(8351,'Argyle',13),(9235,'Grado',122);
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train` (
  `Train_id` int NOT NULL,
  `Schd_id` int NOT NULL,
  `Dptr_date` char(255) NOT NULL,
  `Arr_date` char(255) NOT NULL,
  `Route_id` int NOT NULL,
  PRIMARY KEY (`Train_id`),
  KEY `Route_id` (`Route_id`),
  CONSTRAINT `Train_ibfk_1` FOREIGN KEY (`Route_id`) REFERENCES `Route` (`Route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
INSERT INTO `Train` VALUES (176,681,'2021-06-20','2021-07-02',847),(339,100,'2020-08-11','2020-10-14',5314),(340,141,'2020-11-06','2020-05-16',4142),(986,396,'2021-07-15','2020-07-08',5125),(1079,247,'2021-06-25','2021-08-14',5646),(1427,945,'2020-05-03','2020-05-27',8109),(1719,245,'2021-02-03','2021-03-13',5059),(2781,531,'2021-02-19','2021-11-01',2707),(2849,795,'2020-10-19','2020-10-30',8351),(2955,851,'2020-01-19','2020-11-08',9235);
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-28 21:31:43

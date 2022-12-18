-- MySQL dump 10.13  Distrib 5.7.39, for Linux (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version       5.7.39-0ubuntu0.18.04.2

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
-- Table structure for table `cabinets`
--

DROP TABLE IF EXISTS `cabinets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabinets` (
  `cabinet_id` int(11) NOT NULL AUTO_INCREMENT,
  `cabinet_num` varchar(45) DEFAULT NULL,
  `cabinet_descr` varchar(45) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cabinet_id`),
  KEY `department_id_idx` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabinets`
--

LOCK TABLES `cabinets` WRITE;
/*!40000 ALTER TABLE `cabinets` DISABLE KEYS */;
INSERT INTO `cabinets` VALUES (1,'10','Хірургічний кабінет',1),(2,'11','Неврологічний кабінет',2),(3,'12','Терапевтичний кабінет',3),(4,'20','Рентгенологічний кабінет',4),(5,'21','Кабінет ультразвукової діагностики',5);
/*!40000 ALTER TABLE `cabinets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_descr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Хірургія'),(2,'Неврологія'),(3,'Терапія'),(4,'Рентгенологія'),(5,'Ультра звукова діагностика');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnos`
--

DROP TABLE IF EXISTS `diagnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnos` (
  `diagnos_id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnost_descr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`diagnos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnos`
--

LOCK TABLES `diagnos` WRITE;
/*!40000 ALTER TABLE `diagnos` DISABLE KEYS */;
INSERT INTO `diagnos` VALUES (1,'Гострий катаральний апендицит'),(2,'Гострий гангренозний апендицит.'),(3,'Гострий интерстициальний панкреатит.'),(4,'Придбана невправимая пупкова грижа'),(6,'Відркритий перелом лівої верхньої кінцівки');
/*!40000 ALTER TABLE `diagnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(45) DEFAULT NULL,
  `doctor_descr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Лікар1','лікар-хірург'),(2,'Лікар2','Лікар-невропатолог'),(3,'Лікар3','Лікар-терапевт'),(4,'Лікар4','Лікар-ренгенолог'),(5,'Лікар5','Лікар з ультразвукової діагностики'),(7,'Лаборант','Лаборант1'),(8,'Лаборант2','Лаборант2');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicines` (
  `medicine_id` int(11) NOT NULL AUTO_INCREMENT,
  `medicines_name` varchar(200) DEFAULT NULL,
  `medicine_amount` int(11) DEFAULT NULL,
  `medicine_price` int(11) DEFAULT NULL,
  `medicine_manufacturer` varchar(75) DEFAULT NULL,
  `medicine_dose` float DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
INSERT INTO `medicines` VALUES (2,'Ібупрофен',100,25,'Дарниця',10),(3,'Преднізолон',100,20,'Дарниця',5.5),(4,'Лідокаїн',100,15,'Фармак',10),(9,'Ібупрофен',50,30,'Дарниця',15);
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(45) DEFAULT NULL,
  `diagnos_id` int(11) DEFAULT NULL,
  `patient_sex` varchar(45) DEFAULT NULL,
  `patient_age` varchar(45) DEFAULT NULL,
  `patient_address` varchar(45) DEFAULT NULL,
  `patient_phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `diagnos_id_idx` (`diagnos_id`),
  CONSTRAINT `diagnos_id` FOREIGN KEY (`diagnos_id`) REFERENCES `diagnos` (`diagnos_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Пацієнт1',1,'ч','26','вул Виноградна',1111111),(2,'Пацієнт2',2,'ч','69','вул Сливова',2222222),(3,'Пацієнт3',3,'ч','19','вул Грушева',3333333),(4,'Пацієнт4',4,'ж','64','вул Соняшникова',4444444),(5,'Пацієнт5',6,'ж','53','вул Перемоги',5555555);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scedule`
--

DROP TABLE IF EXISTS `scedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scedule` (
  `scedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `cabinet_num` varchar(45) DEFAULT NULL,
  `doctor_name` varchar(45) DEFAULT NULL,
  `patient_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`scedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scedule`
--

LOCK TABLES `scedule` WRITE;
/*!40000 ALTER TABLE `scedule` DISABLE KEYS */;
INSERT INTO `scedule` VALUES (1,'10','Лікар1','Пацієнт1'),(3,'11','Лікар3','Пацієнт3'),(4,'20','Лікар4','Пацієнт4');
/*!40000 ALTER TABLE `scedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scedule_date`
--

DROP TABLE IF EXISTS `scedule_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scedule_date` (
  `scedule_date_id` int(11) NOT NULL AUTO_INCREMENT,
  `scedule_date` datetime(6) DEFAULT NULL,
  `scedule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`scedule_date_id`),
  KEY `scedule_id_idx` (`scedule_id`),
  CONSTRAINT `scedule_id` FOREIGN KEY (`scedule_id`) REFERENCES `scedule` (`scedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scedule_date`
--

LOCK TABLES `scedule_date` WRITE;
/*!40000 ALTER TABLE `scedule_date` DISABLE KEYS */;
INSERT INTO `scedule_date` VALUES (1,'2022-10-25 09:00:00.000000',1),(3,'2022-10-25 11:00:00.000000',3),(4,'2022-10-25 12:00:00.000000',4);
/*!40000 ALTER TABLE `scedule_date` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-23 13:27:08

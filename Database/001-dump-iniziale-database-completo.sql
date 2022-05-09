-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: biltek_bd
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `associazione`
--

DROP TABLE IF EXISTS `associazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associazione` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Prodotto` int NOT NULL,
  `CodiceProdotto` varchar(200) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  CONSTRAINT `associazione_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associazione`
--

LOCK TABLES `associazione` WRITE;
/*!40000 ALTER TABLE `associazione` DISABLE KEYS */;
INSERT INTO `associazione` VALUES (6,8,'string2',_binary '\0'),(9,17,'string2',_binary '\0'),(10,18,'stringx123',_binary '');
/*!40000 ALTER TABLE `associazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcodeprodotto`
--

DROP TABLE IF EXISTS `barcodeprodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcodeprodotto` (
  `Id_BarcodeProdotto` int NOT NULL AUTO_INCREMENT,
  `Barcode` varchar(30) NOT NULL,
  `Id_Prodotto` int NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_BarcodeProdotto`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  CONSTRAINT `barcodeprodotto_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodeprodotto`
--

LOCK TABLES `barcodeprodotto` WRITE;
/*!40000 ALTER TABLE `barcodeprodotto` DISABLE KEYS */;
INSERT INTO `barcodeprodotto` VALUES (3,'string1',8,_binary ''),(5,'string1',8,_binary '\0');
/*!40000 ALTER TABLE `barcodeprodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bilancia`
--

DROP TABLE IF EXISTS `bilancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bilancia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Codice` varchar(20) NOT NULL,
  `Id_Modello` int NOT NULL,
  `PortCOM` varchar(45) NOT NULL,
  `BaudRate` int NOT NULL,
  `DataBits` int NOT NULL,
  `Parity` int NOT NULL,
  `StopBit` int NOT NULL,
  `HandShake` int NOT NULL,
  `CommandForWeight` varchar(45) NOT NULL,
  `WeightConversion` decimal(10,2) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Modello` (`Id_Modello`),
  CONSTRAINT `bilancia_ibfk_1` FOREIGN KEY (`Id_Modello`) REFERENCES `modello` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilancia`
--

LOCK TABLES `bilancia` WRITE;
/*!40000 ALTER TABLE `bilancia` DISABLE KEYS */;
INSERT INTO `bilancia` VALUES (4,'APSOXI','AAAAA',4,'COM1',9600,8,0,1,0,'SP',100.00,_binary '','2022-03-15 19:14:07','2022-03-15 19:25:03',NULL),(6,'PX3202','string',4,'COM1',4800,8,0,1,0,'0P',1000.00,_binary '','2022-03-15 19:26:14',NULL,'2022-03-15 19:28:24'),(7,'AYTTX4','string',5,'COM1',9600,8,0,1,0,'AX',100.00,_binary '','2022-03-15 19:27:44',NULL,NULL),(8,'YTHBVG','prueba',4,'COM2',4800,8,0,1,0,'TY',1000.00,_binary '','2022-03-22 08:14:48',NULL,NULL),(9,'TGSRWE','15asa',4,'COM2',4800,8,0,1,0,'AA',500.00,_binary '','2022-04-07 10:04:08','2022-04-07 10:05:50','2022-04-07 10:07:33'),(10,'TGSRWR','15asa',4,'COM2',4800,8,0,1,0,'sp',500.00,_binary '\0','2022-05-03 13:50:28','2022-05-03 13:51:57','2022-05-03 13:52:38');
/*!40000 ALTER TABLE `bilancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bilanciamodulo`
--

DROP TABLE IF EXISTS `bilanciamodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bilanciamodulo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Bilancia` int NOT NULL,
  `Id_Modulo` int NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  KEY `Id_Modulo` (`Id_Modulo`),
  CONSTRAINT `bilanciamodulo_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bilanciamodulo_ibfk_2` FOREIGN KEY (`Id_Modulo`) REFERENCES `modulo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilanciamodulo`
--

LOCK TABLES `bilanciamodulo` WRITE;
/*!40000 ALTER TABLE `bilanciamodulo` DISABLE KEYS */;
INSERT INTO `bilanciamodulo` VALUES (1,4,2,_binary '','2022-03-15 19:29:26','2022-03-15 19:41:38','2022-03-15 19:42:39'),(2,4,2,_binary '','2022-03-15 19:43:32',NULL,NULL),(3,4,2,_binary '\0','2022-05-03 15:20:10','2022-05-03 15:21:10','2022-05-03 15:21:45');
/*!40000 ALTER TABLE `bilanciamodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(200) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Latte e derivati',_binary ''),(2,'Dolci ',_binary '\0'),(3,'Dolci',_binary ''),(4,'string2',_binary '\0');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controllopeso`
--

DROP TABLE IF EXISTS `controllopeso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controllopeso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Prodotto` int NOT NULL,
  `Id_Lotto` int NOT NULL,
  `NumeroControllo` int NOT NULL,
  `DataOra` datetime NOT NULL,
  `Pesata` decimal(10,2) NOT NULL,
  `NumeroPesata` int NOT NULL,
  `Adatto` bit(1) DEFAULT NULL,
  `Annullato` datetime DEFAULT NULL,
  `Ripristina` bit(1) DEFAULT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  KEY `controllopeso_ibfk_2` (`Id_Lotto`),
  CONSTRAINT `controllopeso_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `controllopeso_ibfk_2` FOREIGN KEY (`Id_Lotto`) REFERENCES `lotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controllopeso`
--

LOCK TABLES `controllopeso` WRITE;
/*!40000 ALTER TABLE `controllopeso` DISABLE KEYS */;
INSERT INTO `controllopeso` VALUES (680,8,13,3,'2022-05-09 14:58:34',10.00,0,_binary '\0','2022-05-09 15:00:55',NULL,_binary '\0'),(681,8,13,3,'2022-05-09 14:59:54',14.00,1,_binary '\0','2022-05-09 15:00:52',NULL,_binary '\0'),(682,8,13,3,'2022-05-09 15:10:04',110.00,0,_binary '\0','2022-05-09 15:10:19',NULL,_binary '\0'),(683,9,14,2,'2022-05-09 15:10:49',110.00,1,_binary '\0','2022-05-09 15:11:23',NULL,_binary '\0'),(684,9,14,2,'2022-05-09 15:10:54',110.00,2,_binary '\0','2022-05-09 15:11:23',NULL,_binary '\0'),(685,9,14,2,'2022-05-09 15:10:58',110.00,3,_binary '\0','2022-05-09 15:11:23',NULL,_binary '\0'),(686,8,13,3,'2022-05-09 15:38:28',10.00,0,_binary '\0','2022-05-09 16:08:53',_binary '\0',_binary '\0'),(687,9,14,2,'2022-05-09 15:48:38',180.00,1,_binary '','2022-05-09 15:49:03',_binary '\0',_binary '\0'),(688,9,14,2,'2022-05-09 15:48:44',180.00,2,_binary '','2022-05-09 15:49:03',_binary '\0',_binary '\0'),(689,9,14,2,'2022-05-09 15:48:49',180.00,3,_binary '','2022-05-09 15:49:03',_binary '\0',_binary '\0'),(690,9,14,2,'2022-05-09 15:49:25',180.00,1,_binary '','2022-05-09 15:58:08',_binary '',_binary '\0'),(691,9,14,2,'2022-05-09 15:49:33',180.00,2,_binary '','2022-05-09 15:58:08',_binary '',_binary '\0'),(692,9,14,2,'2022-05-09 15:49:37',180.00,3,_binary '','2022-05-09 15:58:08',_binary '',_binary '\0'),(693,9,14,2,'2022-05-09 15:51:56',14.00,1,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(694,9,14,2,'2022-05-09 15:51:58',14.00,2,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(695,9,14,2,'2022-05-09 15:52:00',14.00,3,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(696,9,14,2,'2022-05-09 15:54:05',10.00,1,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(697,9,14,2,'2022-05-09 15:54:07',10.00,2,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(698,9,14,2,'2022-05-09 15:54:09',10.00,3,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(699,9,16,2,'2022-05-09 15:55:23',10.00,1,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(700,9,16,2,'2022-05-09 15:55:24',10.00,2,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(701,9,16,2,'2022-05-09 15:55:26',10.00,3,_binary '\0','2022-05-09 15:58:08',_binary '',_binary '\0'),(702,9,16,2,'2022-05-09 15:57:45',10.00,1,_binary '\0','2022-05-09 15:58:08',_binary '\0',_binary '\0'),(703,9,16,2,'2022-05-09 15:57:48',10.00,2,_binary '\0','2022-05-09 15:58:08',_binary '\0',_binary '\0'),(704,9,16,2,'2022-05-09 15:57:50',10.00,3,_binary '\0','2022-05-09 15:58:08',_binary '\0',_binary '\0'),(705,9,16,2,'2022-05-09 15:58:21',10.00,0,_binary '\0','2022-05-09 15:58:23',_binary '\0',_binary '\0'),(706,9,16,2,'2022-05-09 15:58:25',10.00,1,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(707,9,16,2,'2022-05-09 15:58:27',10.00,2,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(708,9,16,2,'2022-05-09 15:58:29',10.00,3,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(709,9,16,2,'2022-05-09 16:01:11',10.00,1,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(710,9,16,2,'2022-05-09 16:01:13',10.00,2,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(711,9,16,2,'2022-05-09 16:01:15',10.00,3,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(712,9,16,2,'2022-05-09 16:02:19',10.00,1,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(713,9,16,2,'2022-05-09 16:02:21',10.00,2,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(714,9,16,2,'2022-05-09 16:02:22',10.00,3,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(715,9,16,2,'2022-05-09 16:03:41',10.00,1,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(716,9,16,2,'2022-05-09 16:03:44',10.00,2,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(717,9,16,2,'2022-05-09 16:03:50',10.00,3,_binary '\0','2022-05-09 16:06:56',_binary '',_binary '\0'),(718,9,16,2,'2022-05-09 16:06:42',10.00,1,_binary '\0','2022-05-09 16:06:56',_binary '\0',_binary '\0'),(719,9,16,2,'2022-05-09 16:06:43',10.00,2,_binary '\0','2022-05-09 16:06:56',_binary '\0',_binary '\0'),(720,9,16,2,'2022-05-09 16:06:45',10.00,3,_binary '\0','2022-05-09 16:06:56',_binary '\0',_binary '\0'),(721,9,16,2,'2022-05-09 16:08:24',10.00,1,_binary '\0','2022-05-09 16:08:36',_binary '\0',_binary '\0'),(722,9,16,2,'2022-05-09 16:08:26',10.00,2,_binary '\0','2022-05-09 16:08:36',_binary '\0',_binary '\0'),(723,9,16,2,'2022-05-09 16:08:28',10.00,3,_binary '\0','2022-05-09 16:08:36',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `controllopeso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controlloschedulatore`
--

DROP TABLE IF EXISTS `controlloschedulatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controlloschedulatore` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Prodotto` int NOT NULL,
  `NumeroControllo` int NOT NULL,
  `Ora` datetime NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  CONSTRAINT `controlloschedulatore_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controlloschedulatore`
--

LOCK TABLES `controlloschedulatore` WRITE;
/*!40000 ALTER TABLE `controlloschedulatore` DISABLE KEYS */;
INSERT INTO `controlloschedulatore` VALUES (4,8,1,'2022-04-27 00:00:00',_binary ''),(5,8,2,'2022-04-27 09:00:00',_binary ''),(7,8,3,'2022-04-27 10:00:00',_binary ''),(8,8,4,'2022-04-27 19:00:00',_binary ''),(9,8,4,'2022-04-27 00:00:00',_binary ''),(11,9,1,'2022-04-29 00:00:00',_binary ''),(12,9,2,'2022-04-29 07:08:00',_binary ''),(14,9,3,'2022-04-29 14:14:00',_binary '\0'),(15,12,1,'2022-04-29 00:00:00',_binary ''),(16,12,2,'2022-04-29 14:14:00',_binary ''),(17,10,1,'2022-04-29 00:00:00',NULL);
/*!40000 ALTER TABLE `controlloschedulatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formula`
--

DROP TABLE IF EXISTS `formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formula` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Algoritmo` varchar(100) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formula`
--

LOCK TABLES `formula` WRITE;
/*!40000 ALTER TABLE `formula` DISABLE KEYS */;
INSERT INTO `formula` VALUES (2,'modificado','XYZ',_binary '','2022-03-15 19:44:12','2022-03-15 19:47:08',NULL),(3,'string','string',_binary '\0','2022-03-15 19:44:17',NULL,'2022-03-15 19:47:36'),(4,'string','string',_binary '','2022-03-15 19:44:23',NULL,NULL),(5,'string','string',_binary '\0','2022-05-03 15:23:15','2022-05-03 15:24:28','2022-05-03 15:25:21');
/*!40000 ALTER TABLE `formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulaprodotto`
--

DROP TABLE IF EXISTS `formulaprodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulaprodotto` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Prodotto` int NOT NULL,
  `Id_Formula` int NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  KEY `Id_Formula` (`Id_Formula`),
  CONSTRAINT `formulaprodotto_ibfk_1` FOREIGN KEY (`Id_Formula`) REFERENCES `formula` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formulaprodotto_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulaprodotto`
--

LOCK TABLES `formulaprodotto` WRITE;
/*!40000 ALTER TABLE `formulaprodotto` DISABLE KEYS */;
INSERT INTO `formulaprodotto` VALUES (5,8,2,_binary '','2022-04-07 10:22:02',NULL,NULL),(6,8,2,_binary '\0','2022-05-03 15:27:28','2022-05-03 15:28:22','2022-05-03 15:29:02');
/*!40000 ALTER TABLE `formulaprodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impianto`
--

DROP TABLE IF EXISTS `impianto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impianto` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impianto`
--

LOCK TABLES `impianto` WRITE;
/*!40000 ALTER TABLE `impianto` DISABLE KEYS */;
INSERT INTO `impianto` VALUES (1,'modificado',_binary '','2022-03-15 19:06:04','2022-03-15 19:08:17',NULL),(2,'string2',_binary '\0','2022-05-03 15:30:39','2022-05-03 15:31:42','2022-05-03 15:34:05');
/*!40000 ALTER TABLE `impianto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impiantobilancia`
--

DROP TABLE IF EXISTS `impiantobilancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `impiantobilancia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Impianto` int NOT NULL,
  `Id_Bilancia` int NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Impianto` (`Id_Impianto`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  CONSTRAINT `impiantobilancia_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `impiantobilancia_ibfk_2` FOREIGN KEY (`Id_Impianto`) REFERENCES `impianto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiantobilancia`
--

LOCK TABLES `impiantobilancia` WRITE;
/*!40000 ALTER TABLE `impiantobilancia` DISABLE KEYS */;
INSERT INTO `impiantobilancia` VALUES (1,1,4,_binary '','2022-03-15 20:08:32','2022-03-15 20:09:09',NULL),(2,1,4,_binary '\0','2022-05-03 15:35:31','2022-05-03 15:36:42','2022-05-03 15:37:21');
/*!40000 ALTER TABLE `impiantobilancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotto`
--

DROP TABLE IF EXISTS `lotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotto` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Prodotto` int NOT NULL,
  `CodiceLotto` varchar(200) NOT NULL,
  `SogliaMinima` int NOT NULL,
  `SogliaMassima` int NOT NULL,
  `Tolleranza` decimal(10,2) NOT NULL,
  `PesoStandard` decimal(10,2) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  CONSTRAINT `lotto_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotto`
--

LOCK TABLES `lotto` WRITE;
/*!40000 ALTER TABLE `lotto` DISABLE KEYS */;
INSERT INTO `lotto` VALUES (13,8,'ook',0,1000,50.00,500.00,_binary ''),(14,9,'ook7',0,400,27.00,180.00,_binary ''),(15,10,'ook8',0,120,14.00,70.00,_binary ''),(16,9,'ook7',0,400,27.00,180.00,_binary ''),(17,18,'ooo',0,400,350.00,3500.00,_binary '');
/*!40000 ALTER TABLE `lotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazzino`
--

DROP TABLE IF EXISTS `magazzino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazzino` (
  `Id_Magazzino` int NOT NULL AUTO_INCREMENT,
  `Id_Prodotto` int NOT NULL,
  `Lotto` varchar(20) NOT NULL,
  `Scadenza` date NOT NULL,
  `QuantitaDiCarico` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_Magazzino`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  CONSTRAINT `magazzino_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazzino`
--

LOCK TABLES `magazzino` WRITE;
/*!40000 ALTER TABLE `magazzino` DISABLE KEYS */;
INSERT INTO `magazzino` VALUES (4,8,'string2','2022-05-03',20.00,_binary '\0');
/*!40000 ALTER TABLE `magazzino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misurazione`
--

DROP TABLE IF EXISTS `misurazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misurazione` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Bilancia` int NOT NULL,
  `Id_Prodotto` int NOT NULL,
  `Peso` decimal(10,4) NOT NULL,
  `Id_FormulaProdotto` int NOT NULL,
  `Id_Utente` int DEFAULT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  KEY `Id_FormulaProdotto` (`Id_FormulaProdotto`),
  KEY `Id_Utente` (`Id_Utente`),
  CONSTRAINT `misurazione_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `misurazione_ibfk_2` FOREIGN KEY (`Id_FormulaProdotto`) REFERENCES `formulaprodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `misurazione_ibfk_3` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `misurazione_ibfk_4` FOREIGN KEY (`Id_Utente`) REFERENCES `utente` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misurazione`
--

LOCK TABLES `misurazione` WRITE;
/*!40000 ALTER TABLE `misurazione` DISABLE KEYS */;
INSERT INTO `misurazione` VALUES (126,4,8,100.0000,5,3,_binary '','2022-05-04 15:32:55',NULL,NULL),(127,4,9,185.0000,5,3,_binary '','2022-05-05 07:14:55',NULL,NULL),(128,4,9,185.0000,5,3,_binary '','2022-05-05 07:14:57',NULL,NULL),(129,4,9,185.0000,5,3,_binary '','2022-05-05 07:14:59',NULL,NULL),(130,4,9,10.0000,5,3,_binary '','2022-05-05 07:15:22',NULL,NULL),(131,4,9,10.0000,5,3,_binary '','2022-05-05 07:15:24',NULL,NULL),(132,4,8,510.0000,5,3,_binary '','2022-05-06 12:20:24',NULL,NULL),(133,4,8,510.0000,5,3,_binary '','2022-05-06 12:20:26',NULL,NULL),(134,4,8,510.0000,5,3,_binary '','2022-05-06 12:20:29',NULL,NULL),(135,4,8,510.0000,5,3,_binary '','2022-05-06 12:22:08',NULL,NULL),(136,4,12,300.0000,5,3,_binary '','2022-05-06 15:16:53',NULL,NULL),(137,4,12,500.0000,5,3,_binary '','2022-05-06 15:18:14',NULL,NULL),(138,4,12,500.0000,5,3,_binary '','2022-05-06 15:18:40',NULL,NULL),(139,4,12,500.0000,5,3,_binary '','2022-05-06 15:18:45',NULL,NULL),(140,4,12,500.0000,5,3,_binary '','2022-05-06 15:18:50',NULL,NULL),(141,4,12,100.0000,5,3,_binary '','2022-05-06 15:19:23',NULL,NULL),(142,4,12,100.0000,5,3,_binary '','2022-05-06 15:22:06',NULL,NULL),(143,4,12,475.0000,5,3,_binary '','2022-05-06 15:22:44',NULL,NULL),(144,4,9,100.0000,5,3,_binary '','2022-05-06 15:24:07',NULL,NULL),(145,4,9,185.0000,5,3,_binary '','2022-05-06 15:24:39',NULL,NULL),(146,4,9,185.0000,5,3,_binary '','2022-05-06 15:24:55',NULL,NULL),(147,4,8,400.0000,5,3,_binary '','2022-05-06 15:49:07',NULL,NULL),(148,4,8,400.0000,5,3,_binary '','2022-05-06 15:49:55',NULL,NULL),(149,4,8,125.0000,5,3,_binary '','2022-05-06 15:52:45',NULL,NULL),(150,4,8,100.0000,5,3,_binary '','2022-05-06 15:54:55',NULL,NULL),(151,4,8,100.0000,5,3,_binary '','2022-05-06 15:55:04',NULL,NULL),(152,4,8,100.0000,5,3,_binary '','2022-05-06 15:55:06',NULL,NULL),(153,4,8,100.0000,5,3,_binary '','2022-05-06 15:55:20',NULL,NULL),(154,4,8,100.0000,5,3,_binary '','2022-05-06 15:56:22',NULL,NULL),(155,4,8,100.0000,5,3,_binary '','2022-05-06 15:56:25',NULL,NULL),(156,4,8,100.0000,5,3,_binary '','2022-05-06 15:56:30',NULL,NULL),(157,4,9,100.0000,5,3,_binary '','2022-05-06 15:56:47',NULL,NULL),(158,4,9,100.0000,5,3,_binary '','2022-05-06 15:56:49',NULL,NULL),(159,4,9,100.0000,5,3,_binary '','2022-05-06 15:56:52',NULL,NULL),(160,4,9,100.0000,5,3,_binary '','2022-05-06 15:57:00',NULL,NULL),(161,4,8,100.0000,5,3,_binary '','2022-05-06 16:09:38',NULL,NULL),(162,4,12,50.0000,5,3,_binary '','2022-05-06 16:10:35',NULL,NULL),(163,4,8,520.0000,5,3,_binary '','2022-05-06 16:11:48',NULL,NULL),(164,4,8,100.0000,5,3,_binary '','2022-05-09 14:24:15',NULL,NULL),(165,4,8,10.0000,5,3,_binary '','2022-05-09 14:58:34',NULL,NULL),(166,4,8,14.0000,5,3,_binary '','2022-05-09 14:59:54',NULL,NULL),(167,4,8,110.0000,5,3,_binary '','2022-05-09 15:10:04',NULL,NULL),(168,4,9,110.0000,5,3,_binary '','2022-05-09 15:10:49',NULL,NULL),(169,4,9,110.0000,5,3,_binary '','2022-05-09 15:10:54',NULL,NULL),(170,4,9,110.0000,5,3,_binary '','2022-05-09 15:10:58',NULL,NULL),(171,4,8,10.0000,5,3,_binary '','2022-05-09 15:38:28',NULL,NULL),(172,4,9,180.0000,5,3,_binary '','2022-05-09 15:48:38',NULL,NULL),(173,4,9,180.0000,5,3,_binary '','2022-05-09 15:48:44',NULL,NULL),(174,4,9,180.0000,5,3,_binary '','2022-05-09 15:48:49',NULL,NULL),(175,4,9,180.0000,5,3,_binary '','2022-05-09 15:49:25',NULL,NULL),(176,4,9,180.0000,5,3,_binary '','2022-05-09 15:49:33',NULL,NULL),(177,4,9,180.0000,5,3,_binary '','2022-05-09 15:49:37',NULL,NULL),(178,4,9,14.0000,5,3,_binary '','2022-05-09 15:51:56',NULL,NULL),(179,4,9,14.0000,5,3,_binary '','2022-05-09 15:51:58',NULL,NULL),(180,4,9,14.0000,5,3,_binary '','2022-05-09 15:52:00',NULL,NULL),(181,4,9,10.0000,5,3,_binary '','2022-05-09 15:54:05',NULL,NULL),(182,4,9,10.0000,5,3,_binary '','2022-05-09 15:54:07',NULL,NULL),(183,4,9,10.0000,5,3,_binary '','2022-05-09 15:54:09',NULL,NULL),(184,4,9,10.0000,5,3,_binary '','2022-05-09 15:55:23',NULL,NULL),(185,4,9,10.0000,5,3,_binary '','2022-05-09 15:55:24',NULL,NULL),(186,4,9,10.0000,5,3,_binary '','2022-05-09 15:55:26',NULL,NULL),(187,4,9,10.0000,5,3,_binary '','2022-05-09 15:57:45',NULL,NULL),(188,4,9,10.0000,5,3,_binary '','2022-05-09 15:57:48',NULL,NULL),(189,4,9,10.0000,5,3,_binary '','2022-05-09 15:57:50',NULL,NULL),(190,4,9,10.0000,5,3,_binary '','2022-05-09 15:58:21',NULL,NULL),(191,4,9,10.0000,5,3,_binary '','2022-05-09 15:58:25',NULL,NULL),(192,4,9,10.0000,5,3,_binary '','2022-05-09 15:58:27',NULL,NULL),(193,4,9,10.0000,5,3,_binary '','2022-05-09 15:58:29',NULL,NULL),(194,4,9,10.0000,5,3,_binary '','2022-05-09 16:01:11',NULL,NULL),(195,4,9,10.0000,5,3,_binary '','2022-05-09 16:01:13',NULL,NULL),(196,4,9,10.0000,5,3,_binary '','2022-05-09 16:01:15',NULL,NULL),(197,4,9,10.0000,5,3,_binary '','2022-05-09 16:02:19',NULL,NULL),(198,4,9,10.0000,5,3,_binary '','2022-05-09 16:02:21',NULL,NULL),(199,4,9,10.0000,5,3,_binary '','2022-05-09 16:02:22',NULL,NULL),(200,4,9,10.0000,5,3,_binary '','2022-05-09 16:03:41',NULL,NULL),(201,4,9,10.0000,5,3,_binary '','2022-05-09 16:03:44',NULL,NULL),(202,4,9,10.0000,5,3,_binary '','2022-05-09 16:03:50',NULL,NULL),(203,4,9,10.0000,5,3,_binary '','2022-05-09 16:06:42',NULL,NULL),(204,4,9,10.0000,5,3,_binary '','2022-05-09 16:06:43',NULL,NULL),(205,4,9,10.0000,5,3,_binary '','2022-05-09 16:06:45',NULL,NULL),(206,4,9,10.0000,5,3,_binary '','2022-05-09 16:08:24',NULL,NULL),(207,4,9,10.0000,5,3,_binary '','2022-05-09 16:08:26',NULL,NULL),(208,4,9,10.0000,5,3,_binary '','2022-05-09 16:08:28',NULL,NULL);
/*!40000 ALTER TABLE `misurazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modello`
--

DROP TABLE IF EXISTS `modello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modello` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modello`
--

LOCK TABLES `modello` WRITE;
/*!40000 ALTER TABLE `modello` DISABLE KEYS */;
INSERT INTO `modello` VALUES (4,'AAA',_binary '','2022-03-15 14:56:51',NULL,NULL),(5,'PX3020',_binary '','2022-04-01 05:36:10',NULL,NULL),(7,'string2',_binary '\0','2022-05-03 15:47:58','2022-05-03 15:48:48','2022-05-03 15:49:26');
/*!40000 ALTER TABLE `modello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (2,'prueba modificado',_binary '','2022-03-15 18:22:29','2022-03-15 18:54:03','2022-03-15 18:54:28'),(3,'otra prueba',_binary '','2022-03-15 18:55:44',NULL,NULL),(4,'string2',_binary '\0','2022-05-03 15:50:34','2022-05-03 15:51:22','2022-05-03 15:51:53');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotto` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Id_UnitaMisura` int NOT NULL,
  `Id_TipologiaProdotto` int NOT NULL,
  `Id_Categorie` int NOT NULL,
  `CodiceProdotto` varchar(200) DEFAULT NULL,
  `MinimoScortaMagazzino` decimal(10,2) NOT NULL,
  `SogliaMinima` int NOT NULL,
  `SogliaMassima` int NOT NULL,
  `Tolleranza` decimal(10,2) DEFAULT NULL,
  `PesoStandard` decimal(10,2) DEFAULT NULL,
  `NumeroPesateControllo` int NOT NULL,
  `NumeroControllo` int NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_UnitaMisura` (`Id_UnitaMisura`),
  KEY `Id_TipologiaProdotto` (`Id_TipologiaProdotto`),
  KEY `Id_Reparto` (`Id_Categorie`),
  CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`Id_TipologiaProdotto`) REFERENCES `tipologiaprodotto` (`Id_TipologiaProdotto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prodotto_ibfk_2` FOREIGN KEY (`Id_UnitaMisura`) REFERENCES `unitamisura` (`Id_UnitaMisura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prodotto_ibfk_3` FOREIGN KEY (`Id_Categorie`) REFERENCES `categorie` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (8,'Formaggio',2,1,1,NULL,50.00,0,1000,10.00,500.00,20,4,_binary '','2022-04-07 10:10:23',NULL,NULL),(9,'Burro',2,1,1,NULL,50.00,0,400,15.00,180.00,3,2,_binary '','2022-04-07 10:10:57',NULL,NULL),(10,'Caffe\'',2,1,2,NULL,150.00,0,120,20.00,70.00,2,1,_binary '','2022-04-07 10:11:11','2022-04-07 10:12:16','2022-04-07 10:13:00'),(12,'Pane',2,1,2,NULL,50.00,0,400,NULL,200.00,5,2,_binary '','2022-04-21 15:49:23','2022-04-21 15:50:45',NULL),(13,'string1',2,1,1,NULL,50.00,0,500,10.00,250.00,6,4,_binary '\0','2022-04-29 10:55:18','2022-04-29 10:56:56','2022-04-29 10:58:47'),(14,'Formaggio1',2,1,1,NULL,50.00,0,800,10.00,500.00,20,4,_binary '\0','2022-05-03 14:02:54','2022-05-03 14:04:00','2022-05-03 14:04:30'),(17,'string',2,1,1,'string2',10.00,0,200,10.00,200.00,10,3,_binary '\0','2022-05-06 14:07:41','2022-05-06 14:17:25','2022-05-06 14:19:29'),(18,'prueba1',2,1,1,'stringx123',10.00,0,400,10.00,3500.00,0,0,_binary '','2022-05-06 16:07:25',NULL,NULL);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ruoli`
--

DROP TABLE IF EXISTS `ruoli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ruoli` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(60) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ruoli`
--

LOCK TABLES `ruoli` WRITE;
/*!40000 ALTER TABLE `ruoli` DISABLE KEYS */;
INSERT INTO `ruoli` VALUES (1,'Admin',_binary ''),(2,'Manager',_binary ''),(3,'Operatore',_binary ''),(4,' Audit',_binary ''),(5,'string2',_binary '\0');
/*!40000 ALTER TABLE `ruoli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipologiaprodotto`
--

DROP TABLE IF EXISTS `tipologiaprodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipologiaprodotto` (
  `Id_TipologiaProdotto` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_TipologiaProdotto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologiaprodotto`
--

LOCK TABLES `tipologiaprodotto` WRITE;
/*!40000 ALTER TABLE `tipologiaprodotto` DISABLE KEYS */;
INSERT INTO `tipologiaprodotto` VALUES (1,'Solido',_binary ''),(2,'Liquido',_binary ''),(8,'string1',_binary '\0');
/*!40000 ALTER TABLE `tipologiaprodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitamisura`
--

DROP TABLE IF EXISTS `unitamisura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitamisura` (
  `Id_UnitaMisura` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_UnitaMisura`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitamisura`
--

LOCK TABLES `unitamisura` WRITE;
/*!40000 ALTER TABLE `unitamisura` DISABLE KEYS */;
INSERT INTO `unitamisura` VALUES (1,'t',_binary ''),(2,'kg',_binary ''),(3,'g',_binary ''),(4,'mg',_binary ''),(5,'µg',_binary ''),(6,'mcg',_binary ''),(7,'ng',_binary ''),(8,'pg',_binary ''),(9,'gn',_binary ''),(10,'gg',_binary ''),(11,'gt',_binary '');
/*!40000 ALTER TABLE `unitamisura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Utente` varchar(50) NOT NULL DEFAULT '',
  `Password` varchar(50) NOT NULL DEFAULT '',
  `Email` varchar(100) NOT NULL,
  `Id_Ruoli` int NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `utente_ibfk_1` (`Id_Ruoli`),
  CONSTRAINT `utente_ibfk_1` FOREIGN KEY (`Id_Ruoli`) REFERENCES `ruoli` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (3,'admin','admin','admin@gmail.com',1,_binary ''),(4,'string2','string2','string2',3,_binary '\0'),(5,'manager','manager','manager@gmail.com',2,_binary '');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verificamisurazione`
--

DROP TABLE IF EXISTS `verificamisurazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verificamisurazione` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Id_Misurazione` int NOT NULL,
  `Attivo` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Misurazione` (`Id_Misurazione`),
  CONSTRAINT `verificamisurazione_ibfk_1` FOREIGN KEY (`Id_Misurazione`) REFERENCES `misurazione` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verificamisurazione`
--

LOCK TABLES `verificamisurazione` WRITE;
/*!40000 ALTER TABLE `verificamisurazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `verificamisurazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'biltek_bd'
--

--
-- Dumping routines for database 'biltek_bd'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_associazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_associazione`(IN `action` INT, IN `Id` INT, IN `Id_Prodotto` INT, IN `CodiceProdotto` VARCHAR(200))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					associazione 
						(Id_Prodotto,CodiceProdotto,Attivo)
					VALUES
						(Id_Prodotto,CodiceProdotto,1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE associazione a
					SET	 a.CodiceProdotto = CodiceProdotto,
						a.Id_Prodotto = Id_Prodotto
				WHERE a.Id = Id; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE associazione a
					SET	 Attivo = 0
				WHERE a.Id = Id; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_barcodeprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_barcodeprodotto`(IN `action` INT, IN `Id_BarcodeProdotto` INT, IN `Barcode` VARCHAR(30), IN `Id_Prodotto` INT)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					barcodeprodotto 
						(Barcode, Id_Prodotto, Attivo)
					VALUES
						(Barcode, Id_Prodotto, 1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE barcodeprodotto b
					SET	 b.Barcode = Barcode,
						b.Id_Prodotto = Id_Prodotto
				WHERE b.Id_BarcodeProdotto = Id_BarcodeProdotto; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_BarcodeProdotto as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE barcodeprodotto b
					SET	 Attivo = 0
				WHERE b.Id_BarcodeProdotto = Id_BarcodeProdotto; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_BarcodeProdotto as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_bilancia`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100), IN `Codice` VARCHAR(20), IN `Id_Modello` INT, IN `PortCOM` VARCHAR(45), IN `BaudRate` INT, IN `DataBits` INT, IN `Parity` INT, IN `StopBit` INT, IN `HandShake` INT, IN `CommandForWeight` VARCHAR(45), IN `WeightConversion` DECIMAL(10,2))
BEGIN
	declare rowAffected int;
	declare lastId int;
    
    case action
		when 1 then
			begin
				INSERT INTO 
					bilancia 
						(Nome,Codice,id_Modello,PortCOM,BaudRate,DataBits,Parity,StopBit,HandShake,CommandForWeight,WeightConversion,DataCreazione, Attivo)
					VALUES
						(Nome,Codice,Id_Modello,PortCOM,BaudRate,DataBits,Parity,StopBit,HandShake,CommandForWeight,WeightConversion,now(),1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastId;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastId as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE bilancia b
					SET	 b.Nome = Nome,
						b.Codice = Codice,
						b.Id_Modello = Id_Modello, 
                        b.PortCOM = PortCOM,
                        b.BaudRate = BaudRate,
                        b.DataBits = DataBits,
                        b.Parity = Parity,
                        b.StopBit = StopBit,
                        b.HandShake = HandShake,
                        b.CommandForWeight = CommandForWeight,
                        b.WeightConversion = WeightConversion,
						DataUltimaModifica =now() 
				WHERE b.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE bilancia b
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE b.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_bilanciamodulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_bilanciamodulo`(IN `action` INT, IN `id` INT, IN `Id_Bilancia` INT, IN `Id_Modulo` INT)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					bilanciamodulo 
						(Id_Bilancia,Id_Modulo,DataCreazione,Attivo)
					values
						(Id_Bilancia,Id_Modulo,now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE bilanciamodulo b
					SET	 Id_Bilancia = Id_Bilancia,
						Id_Modulo = Id_Modulo,
						DataUltimaModifica = now() 
				WHERE b.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE bilanciamodulo b
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE b.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_categorie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_categorie`(IN `action` INT, IN `Id` INT, IN `Nome` VARCHAR(200))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					categorie
						(Nome, Attivo)
					VALUES
						(Nome, 1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE categorie c
					SET	 c.Nome = Nome
				WHERE c.Id = Id; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE categorie c
					SET	 Attivo = 0
				WHERE c.Id = Id; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_controllopeso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_controllopeso`(IN `action` INT, IN `Id` INT, IN `Id_Prodotto` INT, IN `NumeroControllo` INT,  IN `DataOra` DATETIME, IN `Pesata` DECIMAL(10,2),IN `NumeroPesata` INT, IN `Adatto` bit(1), IN `Annullato` DATETIME )
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					controllopeso
						(Id_Prodotto,NumeroControllo,DataOra,Pesata,NumeroPesata,Adatto,Annullato,Attivo)
					VALUES
						(Id_Prodotto,NumeroControllo,DataOra,Pesata,NumeroPesata,Adatto,Annullato,1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE controllopeso c
					SET	 c.Id_Prodotto = Id_Prodotto,
						c.NumeroControllo = NumeroControllo,
                        c.DataOra = DataOra,
                        c.Pesata = Pesata,
                        c.NumeroPesata = NumeroPesata,
                        c.Adatto = Adatto,
                        c.Annullato = Annullato
				WHERE c.Id = Id; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE controllopeso c
					SET	 Attivo = 0,
                    Annullato = now()
				WHERE c.Id = c.Id; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_controlloschedulatore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_controlloschedulatore`(IN `action` INT, IN `Id` INT, IN `Id_Prodotto` INT, IN `NumeroControllo` INT, IN `Ora` DATETIME)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					controlloschedulatore
						(Id_Prodotto,NumeroControllo,Ora,Attivo)
					VALUES
						(Id_Prodotto,NumeroControllo,Ora,1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE controlloschedulatore c
					SET	 c.Id_Prodotto = Id_Prodotto,
						c.NumeroControllo = NumeroControllo,
                        c.Ora = Ora
				WHERE c.Id = Id; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE controlloschedulatore c
					SET	 Attivo = 0
				WHERE c.Id = Id; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_formula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_formula`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100), IN `Algoritmo` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					formula 
						(Nome,Algoritmo, DataCreazione, Attivo)
					values
						(Nome ,Algoritmo, now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE formula f
					SET	 f.Nome = Nome,
						f.Algoritmo = Algoritmo ,
						f.DataUltimaModifica = now() 
				WHERE f.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE formula f
					SET	 Attivo = 0,
						DataEliminazione =now() 
				WHERE f.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_formulaprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_formulaprodotto`(IN `action` INT, IN `id` INT, IN `Id_Prodotto` VARCHAR(100), IN `Id_Formula` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					formulaprodotto 
						(Id_Prodotto,Id_Formula, DataCreazione, Attivo)
					values
						(Id_Prodotto ,Id_Formula, now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE formulaprodotto f
					SET	 f.Id_Prodotto = Id_Prodotto ,
						f.Id_Formula = Id_Formula,
						f.DataUltimaModifica = now() 
				WHERE f.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE formulaprodotto f
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE f.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_impianto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_impianto`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					impianto 
						(Nome, DataCreazione, Attivo)
					values
						(Nome, now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE impianto i
					SET	 i.Nome = Nome,
						i.DataUltimaModifica = now() 
				WHERE i.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE impianto i
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE i.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_impiantobilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_impiantobilancia`(IN `action` INT, IN `id` INT, IN `id_Impianto` INT, IN `id_bilancia` INT)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					impiantobilancia 
						(Id_Impianto, Id_Bilancia, DataCreazione, Attivo)
					values
						(id_Impianto,id_Bilancia, now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE impiantobilancia i
					SET	 i.Id_Impianto = Id_Impianto ,
						i.Id_Bilancia = Id_Bilancia,
						i.DataUltimaModifica =now() 
				WHERE i.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE impiantobilancia i
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE i.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_lotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_lotto`(IN `action` INT, IN `Id` INT, IN `Id_Prodotto` INT, IN `CodiceLotto` VARCHAR(200), IN `SogliaMinima` INT, IN `SogliaMassima` INT, IN `Tolleranza` DECIMAL(10,2), IN `PesoStandard` DECIMAL(10,2))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					lotto 
						(Id_Prodotto,CodiceLotto,SogliaMinima,SogliaMassima,Tolleranza,PesoStandard,Attivo)
					VALUES
						(Id_Prodotto,CodiceLotto,SogliaMinima,SogliaMassima,Tolleranza,PesoStandard,1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE lotto l
					SET	l.Id_Prodotto = Id_Prodotto,
                    l.CodiceLotto = CodiceLotto,
                    l.SogliaMinima = SogliaMinima,
                    l.SogliaMassima = SogliaMassima,
                    l.Tolleranza = Tolleranza,
                    l.PesoStandard = PesoStandard
				WHERE l.Id = Id; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE lotto l
					SET	 Attivo = 0
				WHERE l.Id = Id; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_magazzino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_magazzino`(IN `action` INT, IN `Id_Magazzino` INT, IN `Id_Prodotto` INT, IN `Lotto` VARCHAR(20), IN `Scadenza` DATE, IN `QuantitaDiCarico` DECIMAL(10,2))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					magazzino 
						(Id_Prodotto, Lotto, Scadenza, QuantitaDiCarico, Attivo)
					VALUES
						(Id_Prodotto, Lotto, Scadenza, QuantitaDiCarico, 1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE magazzino m
					SET	 m.Id_Prodotto = Id_Prodotto,
						 m.Lotto = Lotto,
						 m.Scadenza = Scadenza,
						 m.QuantitaDiCarico = QuantitaDiCarico
				WHERE m.Id_Magazzino = Id_Magazzino; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_Magazzino as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE magazzino m
					SET	 Attivo = 0
				WHERE m.Id_Magazzino = Id_Magazzino; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_Magazzino as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_misurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_misurazione`(IN `action` INT, IN `id` INT, IN `id_bilancia` INT, IN `id_prodotto` INT, IN `peso` INT, IN `id_FormulaProdotto` INT, IN `id_Utente` INT)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					misurazione 
						(Id_Bilancia, Id_Prodotto , Peso, Id_FormulaProdotto,Id_Utente, DataCreazione, Attivo)
					value
						(id_Bilancia,id_Prodotto, Peso, id_FormulaProdotto,id_Utente, now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE misurazione m
					SET	 m.Id_Bilancia = id_Bilancia ,
						m.Id_Prodotto = id_Prodotto ,
                        m.Peso = peso,
						m.Id_FormulaProdotto = id_FormulaProdotto,
                        m.Id_Utente = id_Utente,
						m.DataUltimaModifica = now() 
				WHERE m.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE misurazione m
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE m.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_modello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_modello`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					modello 
						(Nome, DataCreazione, Attivo)
					values
						(Nome, now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE modello m
					SET	 m.Nome = Nome,
						DataUltimaModifica = now() 
				WHERE m.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE modello m
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE m.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_modulo`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					modulo 
						(Nome,DataCreazione, Attivo)
					values
						(Nome, now(), 1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE modulo m
					SET	 m.Nome = Nome,
						DataUltimaModifica = now() 
				WHERE m.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE modulo m
					SET	 Attivo = 0,
						DataEliminazione = now() 
				WHERE m.id= id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_prodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_prodotto`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100), IN `Id_UnitaMisura` INT, IN `Id_TipologiaProdotto` INT, IN `Id_Categorie` INT,IN `CodiceProdotto` VARCHAR(200), IN `MinimoScortaMagazzino` DECIMAL(10,2), IN `SogliaMinima` INT, IN `SogliaMassima` INT, IN `Tolleranza` DECIMAL(10,2), IN `PesoStandard` DECIMAL(10,2), IN `NumeroPesateControllo` INT, IN `NumeroControllo` INT)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					prodotto 
						(Nome,Id_UnitaMisura,Id_TipologiaProdotto,Id_Categorie,CodiceProdotto,MinimoScortaMagazzino,SogliaMinima,SogliaMassima,Tolleranza,PesoStandard,NumeroPesateControllo,NumeroControllo,DataCreazione,Attivo)
					values
						(Nome,Id_UnitaMisura,Id_TipologiaProdotto,Id_Categorie,CodiceProdotto,MinimoScortaMagazzino,SogliaMinima,SogliaMassima,Tolleranza,PesoStandard,NumeroPesateControllo,NumeroControllo,now(),1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;	
                
                INSERT INTO 
					associazione 
						(Id_Prodotto,CodiceProdotto,Attivo)
					VALUES
						(lastid,CodiceProdotto,1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;		
                
				
            end;
		when 2 then
			begin
				UPDATE prodotto m
					SET	 m.Nome = Nome,
                    	m.Id_UnitaMisura = Id_UnitaMisura,
                        m.Id_TipologiaProdotto = Id_TipologiaProdotto,
                        m.Id_Categorie = Id_Categorie,
                        m.CodiceProdotto = CodiceProdotto,
                        m.MinimoScortaMagazzino = MinimoScortaMagazzino,
                        m.SogliaMinima = SogliaMinima,
                        m.SogliaMassima = SogliaMassima,
                        m.Tolleranza = Tolleranza,
                        m.PesoStandard = PesoStandard,
                        m.NumeroPesateControllo = NumeroPesateControllo,
                        m.NumeroControllo = NumeroControllo,
						DataUltimaModifica =now() 
				WHERE m.id = id; 
                
				select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
                UPDATE associazione a
					SET	 a.CodiceProdotto = CodiceProdotto,
						a.Id_Prodotto = Id_Prodotto
				WHERE a.Id_Prodotto = Id_Prodotto AND a.Attivo=1; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            end;
		when 3 then
			begin
            
				UPDATE prodotto b
					SET	 Attivo = 0,
						DataEliminazione =now() 
				WHERE b.id = id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, id as id;
				end if;
                
                UPDATE associazione a
					SET	 Attivo = 0
				WHERE a.Id_Prodotto = Id_Prodotto AND a.Attivo=1; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_ruoli` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_ruoli`(IN `action` INT, IN `Id` INT, IN `Nome` VARCHAR(60))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					ruoli 
						(Nome, Attivo)
					VALUES
						(Nome, 1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE ruoli r
					SET	 r.Nome = Nome						
				WHERE r.Id = Id; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE ruoli r
					SET	 Attivo = 0
				WHERE r.Id = Id; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_tipologiaprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_tipologiaprodotto`(IN `action` INT, IN `Id_TipologiaProdotto` INT, IN `Nome` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					tipologiaprodotto 
						(Nome, Attivo)
					VALUES
						(Nome, 1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE tipologiaprodotto t
					SET	 t.Nome = Nome 
				WHERE t.Id_TipologiaProdotto = Id_TipologiaProdotto; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_TipologiaProdotto as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE tipologiaprodotto t
					SET	 Attivo = 0
				WHERE t.Id_TipologiaProdotto = Id_TipologiaProdotto; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_TipologiaProdotto as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_unitamisura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_unitamisura`(IN `action` INT, IN `Id_UnitaMisura` INT, IN `Nome` VARCHAR(45))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					unitamisura 
						(Nome, Attivo)
					VALUES
						(Nome, 1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE unitamisura u
					SET	 u.Nome = Nome 
				WHERE u.Id_UnitaMisura = Id_UnitaMisura; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_UnitaMisura as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE unitamisura u
					SET	 Attivo = 0
				WHERE u.Id_UnitaMisura = Id_UnitaMisura; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_UnitaMisura as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_utente`(IN `action` INT, IN `Id` INT, IN `Utente` VARCHAR(50), IN `Password` VARCHAR(50),IN `Email` VARCHAR(100),IN `Id_Ruoli` INT)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					utente 
						(Utente,Password,Email,Id_Ruoli,Attivo)
					VALUES
						(Utente,Password,Email,Id_Ruoli,1);
				SELECT ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 THEN
					SELECT 'error' as status, 'The registry could not be saved' as response, '0' as id;
				ELSE 
					SELECT 'success' as status, 'OK' as response, lastid as id;
				END if;					
            END;
		WHEN 2 THEN
			BEGIN
				UPDATE utente u
					SET	 u.Utente = Utente,
					 u.Password = Password,
                     u.Email = Email,
                     u.Id_Ruoli = Id_Ruoli
				WHERE u.Id = Id; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE utente u
					SET	 Attivo = 0
				WHERE u.Id = Id; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id as id;
				END if;
                
            END;
		ELSE 
            SELECT 'error' as status, 'No action matches' as response, '0' as id;        
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_verificamisurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_verificamisurazione`(IN `action` INT, IN `id` INT, IN `id_Misurazione` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					verificamisurazione 
						(Id_Misurazione,DataCreazione,Attivo)
					values
						(id_Misurazione,now(),1);
				select ROW_COUNT() into rowAffected;	
				SELECT LAST_INSERT_ID() into lastid;
				
				 if rowAffected = 0 then
					select 'error' as status, 'The registry could not be saved' as response, '0' as id;
				else 
					select 'success' as status, 'OK' as response, lastid as id;
				end if;					
            end;
		when 2 then
			begin
				UPDATE verificamisurazione v
					SET	 v.Id_Misurazione = id_Misurazione 
				WHERE v.Id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, Id as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE verificamisurazione v
					SET	 Attivo = 0,
                    DataEliminazione =now() 
				WHERE v.Id = Id; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, Id as id;
				end if;
                
            end;
		else 
            select 'error' as status, 'No action matches' as response, '0' as id;        
    end case;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_conf_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_conf_bilancia`()
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='SELECT b.Id, b.Nome, 
							 b.Codice, 
                             b.PortCOM, 
                             b.BaudRate, 
                             b.DataBits, 
                             b.Parity, 
                             b.StopBit, 
                             b.HandShake, 
                             b.CommandForWeight, 
                             b.WeightConversion, 
                             m.Id as IdModello , 
                             m.Nome as NomeModello 
					 FROM bilancia as b 
			   INNER JOIN modello as m ON b.Id_Modello = m.Id 
		WHERE b.Attivo=1 AND m.Attivo=1';
	
	set @querySearchfinal= querySearch;
    
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_associazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_associazione`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Prodotto,
		CodiceProdotto,
		Attivo
	FROM 
		associazione a
    WHERE
		a.Attivo=1 and
		a.Id=Id;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_barcodeprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_barcodeprodotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id_BarcodeProdotto,
		Barcode,
		Id_Prodotto,
		Attivo
	FROM 
		barcodeprodotto b
    WHERE
		b.Attivo=1 and
		b.Id_BarcodeProdotto=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_bilancia`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		Codice,
		Id_Modello,
        PortCOM,
        BaudRate,
        DataBits,
        Parity,
        StopBit,
        HandShake,
        CommandForWeight,
        WeightConversion,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		bilancia b
    WHERE
		b.Attivo=1 and
		b.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_bilancia_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_bilancia_modulo`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Bilancia,
		Id_Modulo,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		bilanciamodulo b
    WHERE
		b.Attivo=1 and
		b.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_categorie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_categorie`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		Attivo
	FROM 
		categorie c
    WHERE
		c.Attivo=1 and
		c.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_controllopeso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_controllopeso`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Prodotto,
        NumeroControllo,
        DataOra,
        Pesata,
        NumeroPesata,
        Adatto,
        Annullato,
		Attivo
	FROM 
		controllopeso c
    WHERE
		c.Attivo=1 and
		c.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_controlloschedulatore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_controlloschedulatore`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
        Id_Prodotto,
        NumeroControllo,
        Ora,
		Attivo
	FROM 
		controlloschedulatore c
    WHERE
		c.Attivo=1 and
		c.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_formula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_formula`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		Algoritmo,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		formula f
    WHERE
		f.Attivo=1 and
		f.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_formulaprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_formulaprodotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Prodotto,
		Id_Formula,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		formulaprodotto f
    WHERE
		f.Attivo=1 and
		f.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_impianto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impianto`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		impianto i
    WHERE
		i.Attivo=1 and
		i.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_impiantobilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impiantobilancia`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Impianto,
		Id_Bilancia,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		impiantobilancia i
    WHERE
		i.Attivo=1 and
		i.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_lotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_lotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Prodotto,
        CodiceLotto,
        SogliaMinima,
        SogliaMassima,
        Tolleranza,
        PesoStandard,
		Attivo
	FROM 
		lotto l
    WHERE
		l.Attivo=1 and
		l.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_magazzino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_magazzino`(IN `Id` INT)
BEGIN

	SELECT 
		Id_Magazzino,
		Id_Prodotto,
		Lotto,
		Scadenza,
		QuantitaDiCarico,
		Attivo
	FROM 
		magazzino m
    WHERE
		m.Attivo=1 and
		m.Id_Magazzino=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_misurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_misurazione`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Bilancia,
		Id_Prodotto,
		Peso,
		Id_FormulaProdotto,
        Id_Utente,
		DataCreazione,
		DataEliminazione,
		Attivo
	FROM 
		misurazione m
    WHERE
		m.Attivo=1 and
		m.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_modello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_modello`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		modello m
    WHERE
		m.Attivo=1 and
		m.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_modulo`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		modulo m
    WHERE
		m.Attivo=1 and
		m.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_prodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_prodotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
        Id_UnitaMisura,
        Id_TipologiaProdotto,
        Id_Categorie,
        CodiceProdotto,
        MinimoScortaMagazzino,
        SogliaMinima,
        SogliaMassima,
        Tolleranza,
        PesoStandard,
        NumeroPesateControllo,
        NumeroControllo,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Attivo
	FROM 
		prodotto p
    WHERE
		p.Attivo=1 and
		p.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_ruoli` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_ruoli`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		Attivo
	FROM 
		ruoli r
    WHERE
		r.Attivo=1 and
		r.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_tipologiaprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_tipologiaprodotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id_TipologiaProdotto,
		Nome,
		Attivo
	FROM 
		tipologiaprodotto t
    WHERE
		t.Attivo=1 and
		t.Id_TipologiaProdotto=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_unitamisura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_unitamisura`(IN `Id` INT)
BEGIN

	SELECT 
		Id_UnitaMisura,
		Nome,
		Attivo
	FROM 
		unitamisura u
    WHERE
		u.Attivo=1 and
		u.Id_UnitaMisura=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_utente`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Utente,
		Password,
        Email,
        Id_Ruoli,
		Attivo
	FROM 
		utente u
    WHERE
		u.Attivo=1 and
		u.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_utente_by_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_utente_by_utente`(IN `utente` varchar(50))
BEGIN

	SELECT 
		Id,
		Utente,
		Password,
        Email,
        Id_Ruoli,
		Attivo
	FROM 
		utente u
    WHERE
		u.Attivo=1 and
		u.utente=utente;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_verificamisurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_verificamisurazione`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Misurazione,
		DataCreazione,
		DataEliminazione,
		Attivo
	FROM 
		verificamisurazione v
    WHERE
		v.Attivo=1 and
		v.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_associazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_associazione`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Prodotto ,
							CodiceProdotto
						from associazione 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_barcode_prodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_barcode_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_BarcodeProdotto ,
							Barcode ,
							Id_Prodotto
						from barcodeprodotto 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN

	
	declare	querySearch VARCHAR(800);
    set querySearch ='SELECT Id,Nome,Codice,Id_Modello,PortCOM,BaudRate,DataBits,Parity,StopBit,HandShake,HandShake,WeightConversion FROM bilancia b\r\n\t\twhere Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_bilancia_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia_modulo`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Bilancia ,
							Id_Modulo 
						from bilanciamodulo b 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_categorie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_categorie`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from categorie 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_controllo_peso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_controllo_peso`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Prodotto ,
							NumeroControllo ,
                            DataOra ,
                            Pesata ,
                            NumeroPesata ,
                            Adatto ,
                            Annullato 
						from controllopeso 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_controllo_schedulatore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_controllo_schedulatore`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Prodotto ,
							NumeroControllo ,
                            Ora
						from controlloschedulatore 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_formula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_formula`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome,
							Algoritmo
						from formula 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_formula_prodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_formula_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Prodotto,
							Id_Formula
						from formulaprodotto 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_impianto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impianto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from impianto 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_impianto_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impianto_bilancia`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Impianto,
							Id_Bilancia
						from impiantobilancia 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_lotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_lotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Prodotto ,
							CodiceLotto ,
                            SogliaMinima ,
                            SogliaMassima ,
                            Tolleranza ,
                            PesoStandard
						from lotto 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_magazzino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_magazzino`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_Magazzino ,
							Id_Prodotto ,
							Lotto ,
							Scadenza ,
							QuantitaDiCarico
						from magazzino 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_misurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_misurazione`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,\r\n\t\t\t\t\t\t\tId_Bilancia,\r\n\t\t\t\t\t\t\tId_Prodotto,\r\n\t\t\t\t\t\t\tPeso,\r\n\t\t\t\t\t\t\tId_FormulaProdotto,Id_Utente from misurazione \r\n\t\t\t\t\t\twhere Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_modello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_modello`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
     set querySearch ='select Id ,
							Nome
						from modello
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_modulo`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from modulo 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_prodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id,Nome,Id_UnitaMisura,Id_TipologiaProdotto,Id_Categorie,CodiceProdotto,MinimoScortaMagazzino,SogliaMinima,SogliaMassima,Tolleranza,PesoStandard,NumeroPesateControllo,NumeroControllo from prodotto \r\n\t\t\t\t\t\twhere Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_ruoli` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_ruoli`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from ruoli 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_tipologia_prodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipologia_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_TipologiaProdotto ,
							Nome
						from tipologiaprodotto 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_unitamisura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_unitamisura`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_UnitaMisura ,\r\n\t\t\t\t\t\t\tNome\r\n\t\t\t\t\t\tfrom unitamisura \r\n\t\t\t\t\t\twhere Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_utente`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Utente ,
							Password ,
                            Email ,
                            Id_Ruoli
						from utente 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_verificamisurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_verificamisurazione`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id, 
							Id_Misurazione 
						from verificamisurazione 
						where Attivo=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

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

-- Dump completed on 2022-05-09 16:15:30

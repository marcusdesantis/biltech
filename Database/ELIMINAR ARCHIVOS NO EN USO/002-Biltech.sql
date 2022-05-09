-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
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
-- Table structure for table `barcodeprodotto`
--

DROP TABLE IF EXISTS `barcodeprodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcodeprodotto` (
  `Id_BarcodeProdotto` int NOT NULL AUTO_INCREMENT,
  `Barcode` varchar(30) NOT NULL,
  `Id_Prodotto` int NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_BarcodeProdotto`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  CONSTRAINT `barcodeprodotto_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodeprodotto`
--

LOCK TABLES `barcodeprodotto` WRITE;
/*!40000 ALTER TABLE `barcodeprodotto` DISABLE KEYS */;
INSERT INTO `barcodeprodotto` VALUES (3,'string1',8,_binary '');
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Modello` (`Id_Modello`),
  CONSTRAINT `bilancia_ibfk_1` FOREIGN KEY (`Id_Modello`) REFERENCES `modello` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilancia`
--

LOCK TABLES `bilancia` WRITE;
/*!40000 ALTER TABLE `bilancia` DISABLE KEYS */;
INSERT INTO `bilancia` VALUES (4,'APSOXI','AAAAA',4,'COM1',9600,8,0,1,0,'SP',100.00,_binary '','2022-03-15 19:14:07','2022-03-15 19:25:03',NULL),(6,'PX3202','string',4,'COM1',4800,8,0,1,0,'0P',1000.00,_binary '','2022-03-15 19:26:14',NULL,'2022-03-15 19:28:24'),(7,'AYTTX4','string',5,'COM1',9600,8,0,1,0,'AX',100.00,_binary '','2022-03-15 19:27:44',NULL,NULL),(8,'YTHBVG','prueba',4,'COM2',4800,8,0,1,0,'TY',1000.00,_binary '','2022-03-22 08:14:48',NULL,NULL),(9,'TGSRWE','15asa',4,'COM2',4800,8,0,1,0,'AA',500.00,_binary '','2022-04-07 10:04:08','2022-04-07 10:05:50','2022-04-07 10:07:33');
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  KEY `Id_Modulo` (`Id_Modulo`),
  CONSTRAINT `bilanciamodulo_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bilanciamodulo_ibfk_2` FOREIGN KEY (`Id_Modulo`) REFERENCES `modulo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilanciamodulo`
--

LOCK TABLES `bilanciamodulo` WRITE;
/*!40000 ALTER TABLE `bilanciamodulo` DISABLE KEYS */;
INSERT INTO `bilanciamodulo` VALUES (1,4,2,_binary '','2022-03-15 19:29:26','2022-03-15 19:41:38','2022-03-15 19:42:39'),(2,4,2,_binary '','2022-03-15 19:43:32',NULL,NULL);
/*!40000 ALTER TABLE `bilanciamodulo` ENABLE KEYS */;
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formula`
--

LOCK TABLES `formula` WRITE;
/*!40000 ALTER TABLE `formula` DISABLE KEYS */;
INSERT INTO `formula` VALUES (2,'modificado','XYZ',_binary '','2022-03-15 19:44:12','2022-03-15 19:47:08',NULL),(3,'string','string',_binary '\0','2022-03-15 19:44:17',NULL,'2022-03-15 19:47:36'),(4,'string','string',_binary '','2022-03-15 19:44:23',NULL,NULL);
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  KEY `Id_Formula` (`Id_Formula`),
  CONSTRAINT `formulaprodotto_ibfk_1` FOREIGN KEY (`Id_Formula`) REFERENCES `formula` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formulaprodotto_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulaprodotto`
--

LOCK TABLES `formulaprodotto` WRITE;
/*!40000 ALTER TABLE `formulaprodotto` DISABLE KEYS */;
INSERT INTO `formulaprodotto` VALUES (5,8,2,_binary '','2022-04-07 10:22:02',NULL,NULL);
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impianto`
--

LOCK TABLES `impianto` WRITE;
/*!40000 ALTER TABLE `impianto` DISABLE KEYS */;
INSERT INTO `impianto` VALUES (1,'modificado',_binary '','2022-03-15 19:06:04','2022-03-15 19:08:17',NULL);
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Impianto` (`Id_Impianto`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  CONSTRAINT `impiantobilancia_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `impiantobilancia_ibfk_2` FOREIGN KEY (`Id_Impianto`) REFERENCES `impianto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiantobilancia`
--

LOCK TABLES `impiantobilancia` WRITE;
/*!40000 ALTER TABLE `impiantobilancia` DISABLE KEYS */;
INSERT INTO `impiantobilancia` VALUES (1,1,4,_binary '','2022-03-15 20:08:32','2022-03-15 20:09:09',NULL);
/*!40000 ALTER TABLE `impiantobilancia` ENABLE KEYS */;
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
  `Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_Magazzino`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  CONSTRAINT `magazzino_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazzino`
--

LOCK TABLES `magazzino` WRITE;
/*!40000 ALTER TABLE `magazzino` DISABLE KEYS */;
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
  `Active` bit(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misurazione`
--

LOCK TABLES `misurazione` WRITE;
/*!40000 ALTER TABLE `misurazione` DISABLE KEYS */;
INSERT INTO `misurazione` VALUES (73,4,8,220.0000,5,1,_binary '','2022-04-07 10:32:18',NULL,'2022-04-07 10:37:17'),(74,6,8,420.0000,5,1,_binary '','2022-04-07 10:32:57','2022-04-07 10:49:36','2022-04-07 10:41:48');
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modello`
--

LOCK TABLES `modello` WRITE;
/*!40000 ALTER TABLE `modello` DISABLE KEYS */;
INSERT INTO `modello` VALUES (4,'AAA',_binary '','2022-03-15 14:56:51',NULL,NULL),(5,'PX3020',_binary '','2022-04-01 05:36:10',NULL,NULL);
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (2,'prueba modificado',_binary '','2022-03-15 18:22:29','2022-03-15 18:54:03','2022-03-15 18:54:28'),(3,'otra prueba',_binary '','2022-03-15 18:55:44',NULL,NULL);
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
  `Id_Reparto` int NOT NULL,
  `MinimoScortaMagazzino` decimal(10,2) NOT NULL,
  `SogliaMinima` int NOT NULL,
  `SogliaMassima` int NOT NULL,
  `Tolleranza` decimal(10,2) DEFAULT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_UnitaMisura` (`Id_UnitaMisura`),
  KEY `Id_TipologiaProdotto` (`Id_TipologiaProdotto`),
  KEY `Id_Reparto` (`Id_Reparto`),
  CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`Id_TipologiaProdotto`) REFERENCES `tipologiaprodotto` (`Id_TipologiaProdotto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prodotto_ibfk_2` FOREIGN KEY (`Id_UnitaMisura`) REFERENCES `unitamisura` (`Id_UnitaMisura`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `prodotto_ibfk_3` FOREIGN KEY (`Id_Reparto`) REFERENCES `reparto` (`Id_Reparto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (8,'prodotto1',2,1,1,50.00,0,500,10.00,_binary '','2022-04-07 10:10:23',NULL,NULL),(9,'prodotto2',2,1,1,50.00,0,400,15.00,_binary '','2022-04-07 10:10:57',NULL,NULL),(10,'prodotto3',2,1,1,150.00,0,450,20.00,_binary '','2022-04-07 10:11:11','2022-04-07 10:12:16','2022-04-07 10:13:00'),(12,'prodotto5',2,1,1,50.00,0,400,15.00,_binary '','2022-04-21 15:49:23','2022-04-21 15:50:45',NULL);
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparto`
--

DROP TABLE IF EXISTS `reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reparto` (
  `Id_Reparto` int NOT NULL AUTO_INCREMENT,
  `Nome_Reparto` varchar(200) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_Reparto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparto`
--

LOCK TABLES `reparto` WRITE;
/*!40000 ALTER TABLE `reparto` DISABLE KEYS */;
INSERT INTO `reparto` VALUES (1,'Reparto1',_binary ''),(2,'string2',_binary '\0');
/*!40000 ALTER TABLE `reparto` ENABLE KEYS */;
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
  `Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id_TipologiaProdotto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipologiaprodotto`
--

LOCK TABLES `tipologiaprodotto` WRITE;
/*!40000 ALTER TABLE `tipologiaprodotto` DISABLE KEYS */;
INSERT INTO `tipologiaprodotto` VALUES (1,'Prueba',_binary ''),(2,'string2',_binary '\0');
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
  `Active` bit(1) DEFAULT NULL,
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
  `Active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'admin','admin',_binary ''),(2,'string1','string1',_binary '\0');
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
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Misurazione` (`Id_Misurazione`),
  CONSTRAINT `verificamisurazione_ibfk_1` FOREIGN KEY (`Id_Misurazione`) REFERENCES `misurazione` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verificamisurazione`
--

LOCK TABLES `verificamisurazione` WRITE;
/*!40000 ALTER TABLE `verificamisurazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `verificamisurazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'biltek_bd'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_barcodeprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Barcode, Id_Prodotto, Active)
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
					SET	 Active = 0
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Nome,Codice,id_Modello,PortCOM,BaudRate,DataBits,Parity,StopBit,HandShake,CommandForWeight,WeightConversion,DataCreazione, Active)
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
					SET	 Active = 0,
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Id_Bilancia,Id_Modulo,DataCreazione,Active)
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
					SET	 Active = 0,
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_formula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Nome,Algoritmo, DataCreazione, Active)
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
					SET	 Active = 0,
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Id_Prodotto,Id_Formula, DataCreazione, Active)
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
					SET	 Active = 0,
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Nome, DataCreazione, Active)
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
					SET	 Active = 0,
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Id_Impianto, Id_Bilancia, DataCreazione, Active)
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
					SET	 Active = 0,
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_magazzino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Id_Prodotto, Lotto, Scadenza, QuantitaDiCarico, Active)
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
					SET	 Active = 0
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Id_Bilancia, Id_Prodotto , Peso, Id_FormulaProdotto,Id_Utente, DataCreazione, Active)
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
					SET	 Active = 0,
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Nome, DataCreazione, Active)
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
					SET	 Active = 0,
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Nome,DataCreazione, Active)
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
					SET	 Active = 0,
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_prodotto`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100), IN `Id_UnitaMisura` INT, IN `Id_TipologiaProdotto` INT, IN `Id_Reparto` INT, IN `MinimoScortaMagazzino` DECIMAL(10,2), IN `SogliaMinima` INT, IN `SogliaMassima` INT, IN `Tolleranza` DECIMAL(10,2))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					prodotto 
						(Nome,Id_UnitaMisura,Id_TipologiaProdotto,Id_Reparto,MinimoScortaMagazzino,SogliaMinima,SogliaMassima,Tolleranza,DataCreazione,Active)
					values
						(Nome,Id_UnitaMisura,Id_TipologiaProdotto,Id_Reparto,MinimoScortaMagazzino,SogliaMinima,SogliaMassima,Tolleranza,now(),1);
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
				UPDATE prodotto m
					SET	 m.Nome = Nome,
                    	m.Id_UnitaMisura = Id_UnitaMisura,
                        m.Id_TipologiaProdotto = Id_TipologiaProdotto,
                        m.Id_Reparto = Id_Reparto,
                        m.MinimoScortaMagazzino = MinimoScortaMagazzino,
                        m.SogliaMinima = SogliaMinima,
                        m.SogliaMassima = SogliaMassima,
                        m.Tolleranza = Tolleranza,
						DataUltimaModifica =now() 
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
            
				UPDATE prodotto b
					SET	 Active = 0,
						DataEliminazione =now() 
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_reparto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_reparto`(IN `action` INT, IN `Id_Reparto` INT, IN `Nome_Reparto` VARCHAR(200))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					reparto 
						(Nome_Reparto, Active)
					VALUES
						(Nome_Reparto, 1);
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
				UPDATE reparto r
					SET	 r.Nome_Reparto = Nome_Reparto 
				WHERE r.Id_Reparto = Id_Reparto; 
                
                 SELECT ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_Reparto as id;
				END if;
		
            END;
		WHEN 3 THEN
			BEGIN
            
				UPDATE reparto r
					SET	 Active = 0
				WHERE r.Id_Reparto = Id_Reparto; 
                
                SELECT ROW_COUNT() into rowAffected;
				if rowAffected = 0 THEN
					SELECT 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				ELSE
					SELECT 'success' as status, 'OK' as response, Id_Reparto as id;
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Nome, Active)
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
					SET	 Active = 0
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Nome, Active)
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
					SET	 Active = 0
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_utente`(IN `action` INT, IN `Id` INT, IN `Utente` VARCHAR(50), IN `Password` VARCHAR(50))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    CASE action
		WHEN 1 THEN
			BEGIN
				INSERT INTO 
					utente 
						(Utente,Password,Active)
					VALUES
						(Utente,Password,1);
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
					 u.Password = Password
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
					SET	 Active = 0
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						(Id_Misurazione)
					values
						(id_Misurazione);
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
				UPDATE verificamisurazione m
					SET	 m.Id_Misurazione = Id_Misurazione 
				WHERE m.id = id; 
                
                 select ROW_COUNT() into rowAffected;	
                 
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be Modified' as response, '0' as id;	
				else
					select 'success' as status, 'OK' as response, idBrand as id;
				end if;
		
            end;
		when 3 then
			begin
            
				UPDATE brand b
					SET	 Active = 0
				WHERE b.idBrand = idBrand; 
                
                select ROW_COUNT() into rowAffected;
				if rowAffected = 0 then
					select 'error' as status, 'The Registry could not be deleted' as response, '0' as id; 
				else
					select 'success' as status, 'OK' as response, idBrand as id;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_barcodeprodotto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_barcodeprodotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id_BarcodeProdotto,
		Barcode,
		Id_Prodotto,
		Active
	FROM 
		barcodeprodotto b
    WHERE
		b.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
		Active
	FROM 
		bilancia b
    WHERE
		b.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
		Active
	FROM 
		bilanciamodulo b
    WHERE
		b.Active=1 and
		b.Id=Id;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
		Active
	FROM 
		formula f
    WHERE
		f.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
		Active
	FROM 
		formulaprodotto f
    WHERE
		f.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impianto`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Active
	FROM 
		impiato i
    WHERE
		i.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
		Active
	FROM 
		impiantobilancia i
    WHERE
		i.Active=1 and
		i.Id=Id;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_magazzino`(IN `Id` INT)
BEGIN

	SELECT 
		Id_Magazzino,
		Id_Prodotto,
		Lotto,
		Scadenza,
		QuantitaDiCarico,
		Active
	FROM 
		magazzino m
    WHERE
		m.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
		Active
	FROM 
		misurazione m
    WHERE
		m.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_modello`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Active
	FROM 
		modello m
    WHERE
		m.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_modulo`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Active
	FROM 
		modulo m
    WHERE
		m.Active=1 and
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
        Id_Reparto,
        MinimoScortaMagazzino,
        SogliaMinima,
        SogliaMassima,
        Tolleranza,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Active
	FROM 
		prodotto p
    WHERE
		p.Active=1 and
		p.Id=Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_reparto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_reparto`(IN `Id` INT)
BEGIN

	SELECT 
		Id_Reparto,
		Nome_Reparto,
		Active
	FROM 
		reparto r
    WHERE
		r.Active=1 and
		r.Id_Reparto=Id;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_tipologiaprodotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id_TipologiaProdotto,
		Nome,
		Active
	FROM 
		tipologiaprodotto t
    WHERE
		t.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_unitamisura`(IN `Id` INT)
BEGIN

	SELECT 
		Id_UnitaMisura,
		Nome,
		Active
	FROM 
		unitamisura u
    WHERE
		u.Active=1 and
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_utente`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Utente,
		Password,
		Active
	FROM 
		utente u
    WHERE
		u.Active=1 and
		u.Id=Id;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_verificamisurazione`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Id_Misurazione,
		DataCreazione,
		DataEliminazione,
		Active
	FROM 
		verificamisurazione v
    WHERE
		v.Active=1 and
		v.Id=Id;

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_barcode_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_BarcodeProdotto ,
							Barcode ,
							Id_Prodotto
						from barcodeprodotto 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN

	
	declare	querySearch VARCHAR(800);
    set querySearch ='SELECT Id,Nome,Codice,Id_Modello,PortCOM,BaudRate,DataBits,Parity,StopBit,HandShake,HandShake,WeightConversion FROM bilancia b\r\n\t\twhere Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia_modulo`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Bilancia ,
							Id_Modulo 
						from bilanciamodulo b 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_formula`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome,
							Algoritmo
						from formula 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_formula_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Prodotto,
							Id_Formula
						from formulaprodotto 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impianto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from impianto 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impianto_bilancia`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Impianto,
							Id_Bilancia
						from impiantobilancia 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
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
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_misurazione`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,\r\n\t\t\t\t\t\t\tId_Bilancia,\r\n\t\t\t\t\t\t\tId_Prodotto,\r\n\t\t\t\t\t\t\tPeso,\r\n\t\t\t\t\t\t\tId_FormulaProdotto,Id_Utente from misurazione \r\n\t\t\t\t\t\twhere Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_modello`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
     set querySearch ='select Id ,
							Nome
						from modello
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_modulo`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from modulo 
						where Active=1 ';
	
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
    set querySearch ='select Id,Nome,Id_UnitaMisura,Id_TipologiaProdotto,Id_Reparto,MinimoScortaMagazzino,SogliaMinima,SogliaMassima,Tolleranza from prodotto \r\n\t\t\t\t\t\twhere Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_reparto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_reparto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_Reparto ,
							Nome_Reparto
						from reparto 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipologia_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_TipologiaProdotto ,
							Nome
						from tipologiaprodotto 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_unitamisura`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_UnitaMisura ,\r\n\t\t\t\t\t\t\tNome\r\n\t\t\t\t\t\tfrom unitamisura \r\n\t\t\t\t\t\twhere Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_utente`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Utente ,
							Password
						from utente 
						where Active=1 ';
	
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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_verificamisurazione`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id, 
							Id_Misurazione 
						from verificamisurazione 
						where Active=1 ';
	
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

-- Dump completed on 2022-04-21 16:08:13

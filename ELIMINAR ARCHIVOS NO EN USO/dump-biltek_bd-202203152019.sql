-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: biltek_bd
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.21-MariaDB

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
-- Table structure for table `bilancia`
--

DROP TABLE IF EXISTS `bilancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bilancia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Codice` varchar(20) NOT NULL,
  `Id_Modello` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Modello` (`Id_Modello`),
  CONSTRAINT `bilancia_ibfk_1` FOREIGN KEY (`Id_Modello`) REFERENCES `modello` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilancia`
--

LOCK TABLES `bilancia` WRITE;
/*!40000 ALTER TABLE `bilancia` DISABLE KEYS */;
INSERT INTO `bilancia` VALUES (4,'modificado','AAAAA',4,'','2022-03-15 19:14:07','2022-03-15 19:25:03',NULL),(6,'string','string',4,'\0','2022-03-15 19:26:14',NULL,'2022-03-15 19:28:24'),(7,'string','string',4,'','2022-03-15 19:27:44',NULL,NULL);
/*!40000 ALTER TABLE `bilancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bilanciamodulo`
--

DROP TABLE IF EXISTS `bilanciamodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bilanciamodulo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Bilancia` int(11) NOT NULL,
  `Id_Modulo` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  KEY `Id_Modulo` (`Id_Modulo`),
  CONSTRAINT `bilanciamodulo_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bilanciamodulo_ibfk_2` FOREIGN KEY (`Id_Modulo`) REFERENCES `modulo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilanciamodulo`
--

LOCK TABLES `bilanciamodulo` WRITE;
/*!40000 ALTER TABLE `bilanciamodulo` DISABLE KEYS */;
INSERT INTO `bilanciamodulo` VALUES (1,4,2,'','2022-03-15 19:29:26','2022-03-15 19:41:38','2022-03-15 19:42:39'),(2,4,2,'','2022-03-15 19:43:32',NULL,NULL);
/*!40000 ALTER TABLE `bilanciamodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formula`
--

DROP TABLE IF EXISTS `formula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formula` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Algoritmo` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formula`
--

LOCK TABLES `formula` WRITE;
/*!40000 ALTER TABLE `formula` DISABLE KEYS */;
INSERT INTO `formula` VALUES (2,'modificado','XYZ','','2022-03-15 19:44:12','2022-03-15 19:47:08',NULL),(3,'string','string','\0','2022-03-15 19:44:17',NULL,'2022-03-15 19:47:36'),(4,'string','string','','2022-03-15 19:44:23',NULL,NULL);
/*!40000 ALTER TABLE `formula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulaprodotto`
--

DROP TABLE IF EXISTS `formulaprodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formulaprodotto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Prodotto` int(11) NOT NULL,
  `Id_Formula` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  KEY `Id_Formula` (`Id_Formula`),
  CONSTRAINT `formulaprodotto_ibfk_1` FOREIGN KEY (`Id_Formula`) REFERENCES `formula` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `formulaprodotto_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulaprodotto`
--

LOCK TABLES `formulaprodotto` WRITE;
/*!40000 ALTER TABLE `formulaprodotto` DISABLE KEYS */;
INSERT INTO `formulaprodotto` VALUES (2,2,2,'','2022-03-15 19:54:15','2022-03-15 19:54:58','2022-03-15 19:57:36');
/*!40000 ALTER TABLE `formulaprodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impianto`
--

DROP TABLE IF EXISTS `impianto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impianto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impianto`
--

LOCK TABLES `impianto` WRITE;
/*!40000 ALTER TABLE `impianto` DISABLE KEYS */;
INSERT INTO `impianto` VALUES (1,'modificado','','2022-03-15 19:06:04','2022-03-15 19:08:17',NULL);
/*!40000 ALTER TABLE `impianto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impiantobilancia`
--

DROP TABLE IF EXISTS `impiantobilancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impiantobilancia` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Impianto` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Impianto` (`Id_Impianto`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  CONSTRAINT `impiantobilancia_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `impiantobilancia_ibfk_2` FOREIGN KEY (`Id_Impianto`) REFERENCES `impianto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impiantobilancia`
--

LOCK TABLES `impiantobilancia` WRITE;
/*!40000 ALTER TABLE `impiantobilancia` DISABLE KEYS */;
INSERT INTO `impiantobilancia` VALUES (1,1,4,'','2022-03-15 20:08:32','2022-03-15 20:09:09',NULL);
/*!40000 ALTER TABLE `impiantobilancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misurazione`
--

DROP TABLE IF EXISTS `misurazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misurazione` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Bilancia` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Peso` decimal(10,4) NOT NULL,
  `Id_FormulaProdotto` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Bilancia` (`Id_Bilancia`),
  KEY `Id_Prodotto` (`Id_Prodotto`),
  KEY `Id_FormulaProdotto` (`Id_FormulaProdotto`),
  CONSTRAINT `misurazione_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `misurazione_ibfk_2` FOREIGN KEY (`Id_FormulaProdotto`) REFERENCES `formulaprodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `misurazione_ibfk_3` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misurazione`
--

LOCK TABLES `misurazione` WRITE;
/*!40000 ALTER TABLE `misurazione` DISABLE KEYS */;
INSERT INTO `misurazione` VALUES (22,4,2,55.0000,2,'','2022-03-15 20:17:26',NULL,'2022-03-15 20:18:02');
/*!40000 ALTER TABLE `misurazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modello`
--

DROP TABLE IF EXISTS `modello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modello` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modello`
--

LOCK TABLES `modello` WRITE;
/*!40000 ALTER TABLE `modello` DISABLE KEYS */;
INSERT INTO `modello` VALUES (4,'AAA','','2022-03-15 14:56:51',NULL,NULL);
/*!40000 ALTER TABLE `modello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modulo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (2,'prueba modificado','','2022-03-15 18:22:29','2022-03-15 18:54:03','2022-03-15 18:54:28'),(3,'otra prueba','','2022-03-15 18:55:44',NULL,NULL);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotto`
--

DROP TABLE IF EXISTS `prodotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodotto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotto`
--

LOCK TABLES `prodotto` WRITE;
/*!40000 ALTER TABLE `prodotto` DISABLE KEYS */;
INSERT INTO `prodotto` VALUES (2,'prodotto I modificado','','2022-03-15 18:57:15','2022-03-15 18:58:15','2022-03-15 19:02:30');
/*!40000 ALTER TABLE `prodotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verificamisurazione`
--

DROP TABLE IF EXISTS `verificamisurazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verificamisurazione` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Misurazione` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Id_Misurazione` (`Id_Misurazione`),
  CONSTRAINT `verificamisurazione_ibfk_1` FOREIGN KEY (`Id_Misurazione`) REFERENCES `misurazione` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_bilancia`(IN `action` INT, IN `id` INT, IN `nome` VARCHAR(100), IN `codice` VARCHAR(20), IN `Id_Modello` INT)
BEGIN
	declare rowAffected int;
	declare lastId int;
    
    case action
		when 1 then
			begin
				INSERT INTO 
					bilancia 
						(Nome,Codice,id_Modello,DataCreazione, Active)
					VALUES
						(nome,Codice,Id_Modello,now(),1);
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_misurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_misurazione`(IN `action` INT, IN `id` INT, IN `id_bilancia` INT, IN `id_prodotto` INT, IN `peso` INT, IN `id_FormulaProdotto` INT)
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					misurazione 
						(Id_Bilancia, Id_Prodotto , Peso, Id_FormulaProdotto, DataCreazione, Active)
					values
						(Id_Bilancia,Id_Prodotto, Peso, Id_FormulaProdotto, now(), 1);
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
					SET	 m.Id_Bilancia = Id_Bilancia ,
						m.Id_Prodotto = Id_Prodotto ,
						m.Id_FormulaProdotto = Id_FormulaProdotto,
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_modello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_prodotto`(IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))
BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					prodotto 
						(Nome,DataCreazione ,Active)
					values
						(Nome, now(),1);
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_abm_verificamisurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_misurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_prodotto`(IN `Id` INT)
BEGIN

	SELECT 
		Id,
		Nome,
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_verificamisurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_bilancia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN

	
	declare	querySearch VARCHAR(800);
    set querySearch ='SELECT Id,
			Nome,
			Codice,
			Id_Modello 
		FROM bilancia b
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_bilancia_modulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_misurazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_misurazione`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Bilancia,
							Id_Prodotto,
							Peso,
							Id_FormulaProdotto
						from misurazione 
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_list_modello` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_prodotto`(IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)
BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from prodotto 
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
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

-- Dump completed on 2022-03-15 20:19:25

-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2022 a las 18:04:53
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biltek_bd`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_barcodeprodotto` (IN `action` INT, IN `Id_BarcodeProdotto` INT, IN `Barcode` VARCHAR(30), IN `Id_Prodotto` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_bilancia` (IN `action` INT, IN `id` INT, IN `nome` VARCHAR(100), IN `codice` VARCHAR(20), IN `Id_Modello` INT)  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_bilanciamodulo` (IN `action` INT, IN `id` INT, IN `Id_Bilancia` INT, IN `Id_Modulo` INT)  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_formula` (IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100), IN `Algoritmo` VARCHAR(100))  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_formulaprodotto` (IN `action` INT, IN `id` INT, IN `Id_Prodotto` VARCHAR(100), IN `Id_Formula` VARCHAR(100))  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_impianto` (IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_impiantobilancia` (IN `action` INT, IN `id` INT, IN `id_Impianto` INT, IN `id_bilancia` INT)  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_magazzino` (IN `action` INT, IN `Id_Magazzino` INT, IN `Id_Prodotto` INT, IN `Lotto` VARCHAR(20), IN `Scadenza` DATE, IN `QuantitaDiCarico` DECIMAL(10,2))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_misurazione` (IN `action` INT, IN `id` INT, IN `id_bilancia` INT, IN `id_prodotto` INT, IN `peso` INT, IN `id_FormulaProdotto` INT)  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_modello` (IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_modulo` (IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_prodotto` (IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100), IN `Id_UnitaMisura` INT, IN `Id_TipologiaProdotto` INT, IN `MinimoScortaMagazzino` DECIMAL(10,2))  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					prodotto 
						(Nome,Id_UnitaMisura,Id_TipologiaProdotto,MinimoScortaMagazzino, DataCreazione,Active)
					values
						(Nome,Id_UnitaMisura,Id_TipologiaProdotto,MinimoScortaMagazzino ,now(),1);
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
                        m.MinimoScortaMagazzino = MinimoScortaMagazzino,
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_tipologiaprodotto` (IN `action` INT, IN `Id_TipologiaProdotto` INT, IN `Nome` VARCHAR(100))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_unitamisura` (IN `action` INT, IN `Id_UnitaMisura` INT, IN `Nome` VARCHAR(45))  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_verificamisurazione` (IN `action` INT, IN `id` INT, IN `id_Misurazione` VARCHAR(100))  BEGIN
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
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_barcodeprodotto` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_bilancia` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_bilancia_modulo` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_formula` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_formulaprodotto` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impianto` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impiantobilancia` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_magazzino` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_misurazione` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_modello` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_modulo` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_prodotto` (IN `Id` INT)  BEGIN

	SELECT 
		Id,
		Nome,
        Id_UnitaMisura,
        Id_TipologiaProdotto,
        MinimoScortaMagazzino,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Active
	FROM 
		prodotto p
    WHERE
		p.Active=1 and
		p.Id=Id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_tipologiaprodotto` (IN `Id` INT)  BEGIN

	SELECT 
		Id_TipologiaProdotto,
		Nome,
		Active
	FROM 
		tipologiaprodotto t
    WHERE
		t.Active=1 and
		t.Id_TipologiaProdotto=Id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_unitamisura` (IN `Id` INT)  BEGIN

	SELECT 
		Id_UnitaMisura,
		Nome,
		Active
	FROM 
		unitamisura u
    WHERE
		u.Active=1 and
		u.Id_UnitaMisura=Id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_verificamisurazione` (IN `Id` INT)  BEGIN

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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_barcode_prodotto` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_BarcodeProdotto ,
							Barcode ,
							Id_Prodotto
						from barcodeprodotto 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN

	
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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia_modulo` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Bilancia ,
							Id_Modulo 
						from bilanciamodulo b 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_formula` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome,
							Algoritmo
						from formula 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_formula_prodotto` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Prodotto,
							Id_Formula
						from formulaprodotto 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impianto` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from impianto 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_impianto_bilancia` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Id_Impianto,
							Id_Bilancia
						from impiantobilancia 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_magazzino` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_misurazione` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
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

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_modello` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
     set querySearch ='select Id ,
							Nome
						from modello
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_modulo` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id ,
							Nome
						from modulo 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_prodotto` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id,Nome,Id_UnitaMisura,Id_TipologiaProdotto,MinimoScortaMagazzino from prodotto \r\n\t\t\t\t\t\twhere Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_tipologia_prodotto` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_TipologiaProdotto ,
							Nome
						from tipologiaprodotto 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_unitamisura` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id_UnitaMisura ,\r\n\t\t\t\t\t\t\tNome\r\n\t\t\t\t\t\tfrom unitamisura \r\n\t\t\t\t\t\twhere Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_verificamisurazione` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id, 
							Id_Misurazione 
						from verificamisurazione 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcodeprodotto`
--

CREATE TABLE `barcodeprodotto` (
  `Id_BarcodeProdotto` int(11) NOT NULL,
  `Barcode` varchar(30) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `barcodeprodotto`
--

INSERT INTO `barcodeprodotto` (`Id_BarcodeProdotto`, `Barcode`, `Id_Prodotto`, `Active`) VALUES
(1, 'string2', 2, b'0'),
(2, 'string2', 2, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bilancia`
--

CREATE TABLE `bilancia` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Codice` varchar(20) NOT NULL,
  `Id_Modello` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bilancia`
--

INSERT INTO `bilancia` (`Id`, `Nome`, `Codice`, `Id_Modello`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(4, 'modificado', 'AAAAA', 4, b'1', '2022-03-15 19:14:07', '2022-03-15 19:25:03', NULL),
(6, 'string', 'string', 4, b'0', '2022-03-15 19:26:14', NULL, '2022-03-15 19:28:24'),
(7, 'string', 'string', 4, b'1', '2022-03-15 19:27:44', NULL, NULL),
(8, 'prueba', 'prueba', 4, b'1', '2022-03-22 08:14:48', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bilanciamodulo`
--

CREATE TABLE `bilanciamodulo` (
  `Id` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Id_Modulo` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bilanciamodulo`
--

INSERT INTO `bilanciamodulo` (`Id`, `Id_Bilancia`, `Id_Modulo`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(1, 4, 2, b'1', '2022-03-15 19:29:26', '2022-03-15 19:41:38', '2022-03-15 19:42:39'),
(2, 4, 2, b'1', '2022-03-15 19:43:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Algoritmo` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `formula`
--

INSERT INTO `formula` (`Id`, `Nome`, `Algoritmo`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(2, 'modificado', 'XYZ', b'1', '2022-03-15 19:44:12', '2022-03-15 19:47:08', NULL),
(3, 'string', 'string', b'0', '2022-03-15 19:44:17', NULL, '2022-03-15 19:47:36'),
(4, 'string', 'string', b'1', '2022-03-15 19:44:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulaprodotto`
--

CREATE TABLE `formulaprodotto` (
  `Id` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Id_Formula` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impianto`
--

CREATE TABLE `impianto` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `impianto`
--

INSERT INTO `impianto` (`Id`, `Nome`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(1, 'modificado', b'1', '2022-03-15 19:06:04', '2022-03-15 19:08:17', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impiantobilancia`
--

CREATE TABLE `impiantobilancia` (
  `Id` int(11) NOT NULL,
  `Id_Impianto` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `impiantobilancia`
--

INSERT INTO `impiantobilancia` (`Id`, `Id_Impianto`, `Id_Bilancia`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(1, 1, 4, b'1', '2022-03-15 20:08:32', '2022-03-15 20:09:09', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `magazzino`
--

CREATE TABLE `magazzino` (
  `Id_Magazzino` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Lotto` varchar(20) NOT NULL,
  `Scadenza` date NOT NULL,
  `QuantitaDiCarico` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `magazzino`
--

INSERT INTO `magazzino` (`Id_Magazzino`, `Id_Prodotto`, `Lotto`, `Scadenza`, `QuantitaDiCarico`, `Active`) VALUES
(1, 3, 'string', '2022-03-22', '15.00', b'1'),
(2, 3, 'string2', '2022-03-22', '17.00', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `misurazione`
--

CREATE TABLE `misurazione` (
  `Id` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Peso` decimal(10,4) NOT NULL,
  `Id_FormulaProdotto` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modello`
--

CREATE TABLE `modello` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modello`
--

INSERT INTO `modello` (`Id`, `Nome`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(4, 'AAA', b'1', '2022-03-15 14:56:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`Id`, `Nome`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(2, 'prueba modificado', b'1', '2022-03-15 18:22:29', '2022-03-15 18:54:03', '2022-03-15 18:54:28'),
(3, 'otra prueba', b'1', '2022-03-15 18:55:44', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prodotto`
--

CREATE TABLE `prodotto` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Id_UnitaMisura` int(11) NOT NULL,
  `Id_TipologiaProdotto` int(11) NOT NULL,
  `MinimoScortaMagazzino` decimal(10,2) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prodotto`
--

INSERT INTO `prodotto` (`Id`, `Nome`, `Id_UnitaMisura`, `Id_TipologiaProdotto`, `MinimoScortaMagazzino`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(3, 'Prueba', 2, 1, '15.00', b'1', '2022-03-22 10:03:10', NULL, NULL),
(4, 'string2', 2, 1, '7.00', b'0', '2022-03-22 11:54:36', '2022-03-22 11:55:48', '2022-03-22 11:56:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipologiaprodotto`
--

CREATE TABLE `tipologiaprodotto` (
  `Id_TipologiaProdotto` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipologiaprodotto`
--

INSERT INTO `tipologiaprodotto` (`Id_TipologiaProdotto`, `Nome`, `Active`) VALUES
(1, 'Prueba', b'1'),
(2, 'string2', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unitamisura`
--

CREATE TABLE `unitamisura` (
  `Id_UnitaMisura` int(11) NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `Active` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unitamisura`
--

INSERT INTO `unitamisura` (`Id_UnitaMisura`, `Nome`, `Active`) VALUES
(1, 'string1', b'0'),
(2, 'prueba', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificamisurazione`
--

CREATE TABLE `verificamisurazione` (
  `Id` int(11) NOT NULL,
  `Id_Misurazione` int(11) NOT NULL,
  `Active` bit(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `barcodeprodotto`
--
ALTER TABLE `barcodeprodotto`
  ADD PRIMARY KEY (`Id_BarcodeProdotto`);

--
-- Indices de la tabla `bilancia`
--
ALTER TABLE `bilancia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Modello` (`Id_Modello`);

--
-- Indices de la tabla `bilanciamodulo`
--
ALTER TABLE `bilanciamodulo`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`),
  ADD KEY `Id_Modulo` (`Id_Modulo`);

--
-- Indices de la tabla `formula`
--
ALTER TABLE `formula`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `formulaprodotto`
--
ALTER TABLE `formulaprodotto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`),
  ADD KEY `Id_Formula` (`Id_Formula`);

--
-- Indices de la tabla `impianto`
--
ALTER TABLE `impianto`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `impiantobilancia`
--
ALTER TABLE `impiantobilancia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Impianto` (`Id_Impianto`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`);

--
-- Indices de la tabla `magazzino`
--
ALTER TABLE `magazzino`
  ADD PRIMARY KEY (`Id_Magazzino`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`);

--
-- Indices de la tabla `misurazione`
--
ALTER TABLE `misurazione`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Bilancia` (`Id_Bilancia`),
  ADD KEY `Id_Prodotto` (`Id_Prodotto`),
  ADD KEY `Id_FormulaProdotto` (`Id_FormulaProdotto`);

--
-- Indices de la tabla `modello`
--
ALTER TABLE `modello`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `prodotto`
--
ALTER TABLE `prodotto`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_UnitaMisura` (`Id_UnitaMisura`),
  ADD KEY `Id_TipologiaProdotto` (`Id_TipologiaProdotto`);

--
-- Indices de la tabla `tipologiaprodotto`
--
ALTER TABLE `tipologiaprodotto`
  ADD PRIMARY KEY (`Id_TipologiaProdotto`);

--
-- Indices de la tabla `unitamisura`
--
ALTER TABLE `unitamisura`
  ADD PRIMARY KEY (`Id_UnitaMisura`);

--
-- Indices de la tabla `verificamisurazione`
--
ALTER TABLE `verificamisurazione`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_Misurazione` (`Id_Misurazione`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `barcodeprodotto`
--
ALTER TABLE `barcodeprodotto`
  MODIFY `Id_BarcodeProdotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bilancia`
--
ALTER TABLE `bilancia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `bilanciamodulo`
--
ALTER TABLE `bilanciamodulo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `formulaprodotto`
--
ALTER TABLE `formulaprodotto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `impianto`
--
ALTER TABLE `impianto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `impiantobilancia`
--
ALTER TABLE `impiantobilancia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `magazzino`
--
ALTER TABLE `magazzino`
  MODIFY `Id_Magazzino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `misurazione`
--
ALTER TABLE `misurazione`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `modello`
--
ALTER TABLE `modello`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipologiaprodotto`
--
ALTER TABLE `tipologiaprodotto`
  MODIFY `Id_TipologiaProdotto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unitamisura`
--
ALTER TABLE `unitamisura`
  MODIFY `Id_UnitaMisura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `verificamisurazione`
--
ALTER TABLE `verificamisurazione`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bilancia`
--
ALTER TABLE `bilancia`
  ADD CONSTRAINT `bilancia_ibfk_1` FOREIGN KEY (`Id_Modello`) REFERENCES `modello` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bilanciamodulo`
--
ALTER TABLE `bilanciamodulo`
  ADD CONSTRAINT `bilanciamodulo_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bilanciamodulo_ibfk_2` FOREIGN KEY (`Id_Modulo`) REFERENCES `modulo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `formulaprodotto`
--
ALTER TABLE `formulaprodotto`
  ADD CONSTRAINT `formulaprodotto_ibfk_1` FOREIGN KEY (`Id_Formula`) REFERENCES `formula` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `formulaprodotto_ibfk_2` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `impiantobilancia`
--
ALTER TABLE `impiantobilancia`
  ADD CONSTRAINT `impiantobilancia_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `impiantobilancia_ibfk_2` FOREIGN KEY (`Id_Impianto`) REFERENCES `impianto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `magazzino`
--
ALTER TABLE `magazzino`
  ADD CONSTRAINT `magazzino_ibfk_1` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `misurazione`
--
ALTER TABLE `misurazione`
  ADD CONSTRAINT `misurazione_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_2` FOREIGN KEY (`Id_FormulaProdotto`) REFERENCES `formulaprodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_3` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prodotto`
--
ALTER TABLE `prodotto`
  ADD CONSTRAINT `prodotto_ibfk_1` FOREIGN KEY (`Id_TipologiaProdotto`) REFERENCES `tipologiaprodotto` (`Id_TipologiaProdotto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prodotto_ibfk_2` FOREIGN KEY (`Id_UnitaMisura`) REFERENCES `unitamisura` (`Id_UnitaMisura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `verificamisurazione`
--
ALTER TABLE `verificamisurazione`
  ADD CONSTRAINT `verificamisurazione_ibfk_1` FOREIGN KEY (`Id_Misurazione`) REFERENCES `misurazione` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

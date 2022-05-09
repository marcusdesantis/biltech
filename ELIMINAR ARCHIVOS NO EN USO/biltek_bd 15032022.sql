-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2022 a las 22:49:37
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_bilancia` (IN `action` INT, IN `id` INT, IN `nome` VARCHAR(100), IN `codice` VARCHAR(20), IN `idModello` INT)  BEGIN
	declare rowAffected int;
	declare lastId int;
    
    case action
		when 1 then
			begin
				INSERT INTO 
					bilancia 
						(Nome,Codice,id_Modello)
					VALUES
						(nome,Codice,idModello);
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
					SET	 Nome = Nome,
						Codice = Codice
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
					SET	 Active = 0
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_bilanciamodulo` (IN `action` INT, IN `id` INT, IN `idBilancia` INT, IN `idModulo` INT)  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					bilanciamodulo 
						(id_Bilancia,id_Modulo)
					values
						(idBilancia,idModulo);
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
					SET	 Id_Bilancia = idBilancia,
						Id_Modulo = idModulo
				WHERE b.id = id; 
                
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_formula` (IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100), IN `Algoritmo` VARCHAR(100))  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					formula 
						(Nome,Algoritmo)
					values
						(Nome ,Algoritmo);
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
						f.formula = formula
				WHERE f.id = id; 
                
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_formulaprodotto` (IN `action` INT, IN `id` INT, IN `Id_Prodotto` VARCHAR(100), IN `Id_Formula` VARCHAR(100))  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					formulaprodotto 
						(Id_Prodotto,Id_Formula)
					values
						(Nome ,Id_Formula);
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
						f.Id_Formula = Id_Formula 
				WHERE f.id = id; 
                
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_impianto` (IN `action` INT, IN `id` INT, IN `Nome` VARCHAR(100))  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					impianto 
						(Nome)
					values
						(Nome);
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
					SET	 i.Nome = Nome 
				WHERE i.id = id; 
                
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_impiantobilancia` (IN `action` INT, IN `id` INT, IN `id_Impianto` INT, IN `id_bilancia` INT)  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					impiantobilancia 
						(Id_Impianto, Id_Bilancia)
					values
						(id_Impianto,id_Bilancia);
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
						i.Id_Bilancia = Id_Bilancia 
				WHERE i.id = id; 
                
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_misurazione` (IN `action` INT, IN `id` INT, IN `id_bilancia` INT, IN `id_prodotto` INT, IN `peso` INT, IN `id_FormulaProdotto` INT)  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					misurazione 
						(Id_Bilancia, Id_Bilancia, Peso, Id_FormulaProdotto)
					values
						(Id_Bilancia,Id_Bilancia, Peso, Id_FormulaProdotto);
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
						m.Id_FormulaProdotto = Id_FormulaProdotto 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_modello` (IN `action` INT, IN `id` INT, IN `Nombe` VARCHAR(100))  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					modello 
						(Nome)
					values
						(Nome);
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
					SET	 m.Nome = Nome  
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_modulo` (IN `action` INT, IN `id` INT, IN `Nombe` VARCHAR(100))  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					modulo 
						(Nome)
					values
						(Nome);
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
					SET	 m.Nome = Nome  
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_abm_prodotto` (IN `action` INT, IN `id` INT, IN `Nombe` VARCHAR(100))  BEGIN
	declare rowAffected int;
	declare lastid int;
    
    case action
		when 1 then
			begin
				insert into 
					prodotto 
						(Nome)
					values
						(Nome);
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
					SET	 m.Nome = Nome  
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_bilanciamodulo` (IN `Id` INT)  BEGIN

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impiato` (IN `Id` INT)  BEGIN

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_impiatobilancia` (IN `Id` INT)  BEGIN

	SELECT 
		Id,
		Id_Impianto,
		Id_Bilancia,
		DataCreazione,
		DataUltimaModifica,
		DataEliminazione,
		Active
	FROM 
		impiatobilancia i
    WHERE
		i.Active=1 and
		i.Id=Id;

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_bilancia` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN

	/*set querySearch =querySearch*/
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
     set querySearch ='select Id ,\r\n\t\t\t\t\t\t\tNome\r\n\t\t\t\t\t\tfrom modello \r\n\t\t\t\t\t\twhere Active=1 ';
	
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
    set querySearch ='select Id ,
							Nome
						from prodotto 
						where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_verificamisurazione` (IN `bus_value` VARCHAR(100), IN `bus_parameter` VARCHAR(100), IN `currentPageNumber` INT, IN `amountShow` INT)  BEGIN
	declare	querySearch VARCHAR(800);
    set querySearch ='select Id, Id_Misurazione from verificamisurazione where Active=1 ';
	
	set @querySearchfinal= concat(querySearch,' and ', bus_parameter, ' like ', '''' , '%', upper(bus_value), '%', '''');
    
	PREPARE myquery FROM @querySearchfinal; 
	
	EXECUTE myquery;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bilancia`
--

CREATE TABLE `bilancia` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Codice` varchar(20) NOT NULL,
  `Id_Modello` int(11) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bilanciamodulo`
--

CREATE TABLE `bilanciamodulo` (
  `Id` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Id_Modulo` int(11) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula`
--

CREATE TABLE `formula` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Algoritmo` varchar(100) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulaprodotto`
--

CREATE TABLE `formulaprodotto` (
  `Id` int(11) NOT NULL,
  `Id_Prodotto` int(11) NOT NULL,
  `Id_Formula` int(11) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
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
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impiantobilancia`
--

CREATE TABLE `impiantobilancia` (
  `Id` int(11) NOT NULL,
  `Id_Impianto` int(11) NOT NULL,
  `Id_Bilancia` int(11) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modello`
--

CREATE TABLE `modello` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modello`
--

INSERT INTO `modello` (`Id`, `Nome`, `Active`, `DataCreazione`, `DataUltimaModifica`, `DataEliminazione`) VALUES
(4, 'AAA', 1, '2022-03-15 14:56:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prodotto`
--

CREATE TABLE `prodotto` (
  `Id` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Active` datetime DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataUltimaModifica` datetime DEFAULT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificamisurazione`
--

CREATE TABLE `verificamisurazione` (
  `Id` int(11) NOT NULL,
  `Id_Misurazione` int(11) NOT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `DataCreazione` datetime NOT NULL,
  `DataEliminazione` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

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
  ADD PRIMARY KEY (`Id`);

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
-- AUTO_INCREMENT de la tabla `bilancia`
--
ALTER TABLE `bilancia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `bilanciamodulo`
--
ALTER TABLE `bilanciamodulo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formula`
--
ALTER TABLE `formula`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `formulaprodotto`
--
ALTER TABLE `formulaprodotto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `impianto`
--
ALTER TABLE `impianto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impiantobilancia`
--
ALTER TABLE `impiantobilancia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `misurazione`
--
ALTER TABLE `misurazione`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `modello`
--
ALTER TABLE `modello`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prodotto`
--
ALTER TABLE `prodotto`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- Filtros para la tabla `misurazione`
--
ALTER TABLE `misurazione`
  ADD CONSTRAINT `misurazione_ibfk_1` FOREIGN KEY (`Id_Bilancia`) REFERENCES `bilancia` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_2` FOREIGN KEY (`Id_FormulaProdotto`) REFERENCES `formulaprodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `misurazione_ibfk_3` FOREIGN KEY (`Id_Prodotto`) REFERENCES `prodotto` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `verificamisurazione`
--
ALTER TABLE `verificamisurazione`
  ADD CONSTRAINT `verificamisurazione_ibfk_1` FOREIGN KEY (`Id_Misurazione`) REFERENCES `misurazione` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

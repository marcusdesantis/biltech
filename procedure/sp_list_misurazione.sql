DELIMITER $$
CREATE PROCEDURE `sp_list_misurazione`(
	in bus_value varchar(100), 
	in bus_parameter varchar(100), 
	in currentPageNumber int, 
	in amountShow int
)
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

END$$
DELIMITER ;
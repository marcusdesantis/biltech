DELIMITER $$
CREATE PROCEDURE `sp_list_bilancia`(
	in bus_value varchar(100), 
	in bus_parameter varchar(100), 
	in currentPageNumber int, 
	in amountShow int
)
BEGIN

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
DELIMITER ;



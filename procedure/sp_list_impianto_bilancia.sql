DELIMITER $$
CREATE PROCEDURE `sp_list_impianto_bilancia`(
	in bus_value varchar(100), 
	in bus_parameter varchar(100), 
	in currentPageNumber int, 
	in amountShow int
)
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

END$$
DELIMITER ;

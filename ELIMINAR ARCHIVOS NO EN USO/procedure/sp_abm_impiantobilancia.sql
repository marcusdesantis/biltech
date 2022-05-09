DELIMITER $$
CREATE PROCEDURE sp_abm_impiantobilancia(
	in action int, 
 	in id int,
 	in id_Impianto int,
 	in id_bilancia int
)
BEGIN
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
            
				/*UPDATE brand b
					SET	 Active = 0
				WHERE b.idBrand = idBrand; 
                */
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
DELIMITER ;
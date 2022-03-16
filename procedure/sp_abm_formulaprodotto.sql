DELIMITER $$
CREATE PROCEDURE sp_abm_formulaprodotto(
	in action int, 
 	in id int,
 	in Id_Prodotto varchar(100),
 	in Id_Formula varchar(100)
)
BEGIN
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
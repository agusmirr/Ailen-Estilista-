use ailen_estilista ; 


DROP FUNCTION IF EXISTS FN_nombre_productO ; 
DELIMITER //
CREATE function FN_NOMBRE_PRODUCTO ( P_ID INT ) 
RETURNS VARCHAR (200)
DETERMINISTIC 
begin
declare VARIABLE_NOMBRE VARCHAR (200)  ; 
SET VARIABLE_NOMBRE =  (
                           SELECT NOMBRE  
                          FROM PRODUCTOS 
                          WHERE ID_PRODUCTO = P_ID
                           ) ;
RETURN VARIABLE_NOMBRE ; 
END //
DELIMITER ; 

SELECT FN_nombre_producto (1) ; 


DROP FUNCTION FN_STOCK_MENOR;
DELIMITER $$
CREATE function FN_STOCK_MENOR ( P_MENOR INT, var_id int )
RETURNS INT 
DETERMINISTIC
    begin
        declare  var_condition int;

        if (select stock from productos where id_producto=var_id) < P_MENOR THEN
            set var_condition = var_id;
        else
            set var_condition = null;
        end if;
        return var_condition;
    END $$
    DELIMITER ; 
    
select * from productos where id_producto=ANY(select FN_STOCK_MENOR(10, id_producto) from productos)
USE AILEN_ESTILISTA ; 
-- ESTA VISTA SIRVE PARA PODER ENCONTRAR EN ORDEN ALFAVETICO EL APELLIDO DE UN CLIENTE--

CREATE OR replace VIEW VS_CLIENTES AS 
SELECT APELLIDO 
FROM CLIENTES
ORDER BY APELLIDO ASC ; 

SELECT * FROM vs_clientes ; 


-- ESTA VISTA SIRVE PARA PODER SABER QUE PRODUCTOS PERTENECEN A LA CATEGORIA CUIDADO FACIAL --


CREATE OR REPLACE VIEW VS_PRODUCTO_CUIDADO_FACIAL AS 
SELECT ID_PRODUCTO FROM PRODUCTOS 
WHERE CATEGORIA  = 'CUIDADO FACIAL'  ; 

SELECT * FROM vs_producto_cuidado_facial ; 


-- ESTA VISTA SIRVE PARA SABER QUE SERVICIO TIENE EL PRECIO MAS BAJO-- 
CREATE OR REPLACE VIEW VS_SERVICIOS AS 
SELECT PRECIO, id_servicio, tipo_de_servicio FROM SERVICIOS 
ORDER BY PRECIO desc ; 

SELECT * FROM  vs_servicios ; 

-- ESTA VISTA SIRVE PARA UNIR TANTO LA Tabla CLIENTES, PEDIDOS Y PRODUCTOS--
-- DE ESTA MANERA SE PUEDE VER QUE PRODUCTO PIDIO CADA CLIENTE Y OBTENER EN UNA SOLA VISTA TODA LA INFO NECESARIA PARA HACER EL ENVIO--

CREATE OR REPLACE VIEW VS_PEDIDOS_PRODUC_CLIENTES AS 
SELECT P.id_pedido , P.id_producto , PROD.NOMBRE,  P.CANTIDAD , C.apellido, C.direccion 
FROM pedidos AS P INNER JOIN PRODUCTOS AS PROD INNER JOIN CLIENTES AS C
ON P.id_clientes = C.id_clientes
;

SELECT * FROM VS_PEDIDOS_PRODUC_CLIENTES ; 


SELECT * FROM venta_por_producto ; 

-- esta vista muesta que producto (con su respectivo id) se vendio mas -- 

create or replace view vs_frecuencia_venta as 
SELECT  v.id_producto, produc.nombre , sum(v.cantidad) 
FROM venta_por_producto as v inner join productos as produc
on v.id_producto = produc.id_producto
group by v.ID_PRODUCTO 
order by  sum(v.CANTIDAD) desc ; 
 
 select * from vs_frecuencia_venta ; 
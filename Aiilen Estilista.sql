create schema Ailen_Estilista; 
use ailen_estilista; 

create table clientes ( 
id_clientes int primary key auto_increment ,
nombre text(30) ,
apellido text(30) , 
telefono int ,
direccion varchar(30) ,
email varchar(30) 
) ;

create table servicios (
id_servicio int primary key auto_increment , 
tipo_de_servicio text(30) , 
precio numeric (10,2) not null , 
id_clientes int not null 
) ; 


create table pedidos (
id_pedido int primary key auto_increment , 
id_clientes int not null , 
fecha date ,
id_producto int not null
) ; 

create table productos (
id_producto int primary key auto_increment ,
nombre text(50) , 
categoria text(30) , 
marca varchar(50) , 
stock int 
) ; 

create table venta_por_producto (
id_venta int primary key auto_increment , 
id_pedido int not null ,
id_producto int not null ,  
cantidad int 
) ; 

alter table servicios
add foreign key (id_clientes)
references clientes (id_clientes); 

alter table pedidos
add foreign key (id_clientes)
references clientes (id_clientes) ; 

alter table venta_por_producto 
add foreign key (id_pedido) 
references pedidos (id_pedido) ; 

alter table venta_por_producto
add foreign key (id_producto)
references productos (id_producto) ; 

alter table pedidos
add foreign key (id_producto)
references productos (id_producto) ; 



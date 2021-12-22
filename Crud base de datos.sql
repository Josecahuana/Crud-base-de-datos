#Jose Luis Cahuana Geronimo

#CREACION DE LA BASE DE DATOS
create database CrudFarmacia;

#USAR LA BASE DE DATOS
Use CrudFarmacia;


#CREACION DE TABLAS
create table usuario
(
id_usuario int(8) primary key auto_increment not null,
id_empleado int(8)not null,
tipo_usuario varchar(13)not null,
nombre varchar(30)not null,
contraseña varchar(10) not null
);


#creacion de la tabla de empleados
create table empleado 
(
id_empleado int(8)primary key auto_increment not null, 
nombre_e varchar(30)not null, 
direccion_e varchar(30)null, 
cargo varchar(30) not null, 
edad varchar(2)not null,  
estado_civil varchar(10)null,
celular int null, 
hora_ingreso datetime not null,
clave varchar (20) not null 
);

#Crear tabla clientes
CREATE table cliente
(
id_cliente int(8) primary key auto_increment not null,
nombre_cli varchar(30)not null,
direccion_cli varchar(30) null,
sexo varchar(10)not null,
dni BIGINT not null,
ruc BIGINT null,
Celular int null,
edad_descuento varchar(3) not null
);


#Crear la tabla de compra generada
create table compra
(
id_compra int(8) primary key auto_increment not null,
fecha datetime not null,
id_cliente int (8) null,
id_empleado int(8) null,
nombre_e varchar(30) null,
nombre_cli varchar(30)null,
tipo_de_pago varchar(8) null, 
total int null 
);


#Crear la tabla proveedor
create table proveedor 
( 
id_proveedor int(8)primary key auto_increment not null,
nombre_prov varchar(30)not null,
direccion_prov varchar(40)null,
email varchar(40) not null,
telefono char(7)null,
celular char(10)null
);


#Crear tabla detalle de proveedor y empleado
create table detalle_solicitar
(
id_detalle_solicitar int(8) primary key auto_increment not null,
id_proveedor int(8) not null,
id_empleado int(8)not null,
fecha datetime not null
);


#Crear la tabla de categoria de producto
create table categoria 
( 
id_categoria int(8)primary key auto_increment not null, 
descripcion varchar(30)not null 
);


#Crear la tabla de producto
create table producto 
( 
id_producto int(8) primary key auto_increment not null, 
id_categoria int(8)not null, 
id_proveedor int(8)null, 
nombre_pro varchar(30)not null, 
stock int not null, 
fecha_cad datetime not null, 
pre_compra decimal(10,2) not null
);


#Crear la tabla de detalle de producto y proveedor
create table detalle_pedido 
( 
id_detalle_pedido int(8)primary key auto_increment not null, 
id_producto int(8) not null, 
nombre_pro varchar(40) not null, 
cantidad decimal(10,2)null, 
precio_venta decimal(10,2), 
importe decimal(10,2) 
);


#Crear tabla que contiene la factura
create table factura
(
id_factura int(8) primary key auto_increment not null,
id_compra int(8)not null, 
id_empleado int(8) not null, 
nombre_cli varchar(30)not null, 
subtotal int not null, 
descuento int null, 
total int not null,
fecha datetime not null
);


#Creacion de los Constraints

#Tabla Usuario
alter table usuario add constraint pk_id_empleado foreign key(id_empleado) references empleado(id_empleado);

#Tabla Compra
alter table compra add constraint fk_id_empleados foreign key(id_empleado) references empleado(id_empleado);
alter table compra add constraint fk_id_clientes foreign key(id_cliente) references cliente(id_cliente);

#Tabla Producto
alter table producto add constraint fk_id_proveedor foreign key(id_proveedor) references proveedor(id_proveedor);  
alter table producto add constraint fk_id_categoria foreign key(id_categoria) references categoria(id_categoria);

#Tabla Detalle_pedido
alter table detalle_pedido add constraint fk_id_producto foreign key(id_producto) references producto(id_producto);

#Tabla Factura
alter table factura add constraint fk_id_compra foreign key(id_compra) references compra(id_compra);

#Tabla detalle_solicitar
alter table detalle_solicitar add constraint fk_proveedor_id foreign key(id_proveedor) references proveedor(id_proveedor);
alter table detalle_solicitar add constraint fk_empleado_id foreign key(id_empleado) references empleado(id_empleado);


#Creacion de restricciones 

alter table cliente add constraint ck_sexo check(sexo IN('Masculino','Femenino'));
alter table cliente add constraint ck_dni check(LENGTH(dni)=8);
alter table cliente add constraint ck_ruc check(LENGTH(ruc)=11);
alter table cliente add constraint ck_celular check(LENGTH(celular)=9);
alter table cliente add constraint uni_dni unique(dni);
alter table cliente add constraint uni_ruc  unique(ruc) ;
alter table empleado add constraint ck_estado_civil check(estado_civil IN('Soltero','Casado','Divorciado'));
alter table empleado add constraint ck_celular_e check(LENGTH(celular)=9);
alter table usuario add constraint ck_tipo_usuario check(tipo_usuario IN ('Administrador','Empleado'));
alter table compra add constraint ck_tipo_de_pago check(tipo_de_pago IN('Efectivo','Tarjeta'));
alter table proveedor add constraint ck_celular_p check(LENGTH(celular)=9);



#Insertar

#ISERTAR DATOS A LAS TABLAS Empleado
insert into Empleado(nombre_e,direccion_e,cargo,edad,estado_civil,celular,hora_ingreso,clave) 
values('Jose Cahuana','San vicente','Administrador','21','Casado',159321647,'2021-12-22 08:00:00','1234');
insert into Empleado(nombre_e,direccion_e,cargo,edad,estado_civil,celular,hora_ingreso,clave) 
values('Luis Rocha','Quilmana','Empleado','24','Soltero',123552687,'2021-12-22 09:00:00','1234');
insert into Empleado(nombre_e, direccion_e,cargo,edad,estado_civil,celular,hora_ingreso,clave)  
values('Brayan Grial','San vicente','Empleado','30','Casado',164523978,'2021-12-22 10:00:00','1934');
insert into Empleado(nombre_e, direccion_e,cargo,edad,estado_civil,celular,hora_ingreso,clave)  
values('Ernesto Fuente','Sam vicente','Empleado','20','Soltero',121235647,'2021-12-22 11:00:00','1234');
insert into Empleado(nombre_e, direccion_e,cargo,edad,estado_civil,celular,hora_ingreso,clave)   
values('Luis Ferrer','Imperial','Empleado','24','Soltero',156345780,'2021-12-22 12:00:00','1234');


#INSERTAR DATOS A LA TABLA Usuario
insert into usuario(id_empleado,tipo_usuario,nombre,contraseña) 
values('1','Administrador','Jose Cahuana','pescado2');
insert into usuario(id_empleado,tipo_usuario,nombre,contraseña) 
values('2','Empleado','Luis Rocha','keoc4512');
insert into usuario(id_empleado,tipo_usuario,nombre,contraseña)  
values('3','Empleado','Brayan Grial','oo.ll125');
insert into usuario(id_empleado,tipo_usuario,nombre,contraseña)  
values('4','Empleado','Ernesto Fuente','fuente32');
insert into usuario(id_empleado,tipo_usuario,nombre,contraseña)  
values('5','Empleado','Luis Ferrer','ferr45er');

#ISERTAR DATOS A LAS TABLAS Cliente
insert into cliente(nombre_cli,direccion_cli,sexo,dni,ruc,celular,edad_descuento) 
values('Lina','San vicente','Femenino',72884742,12345651245,997547215, 20);
insert into cliente(nombre_cli,direccion_cli,sexo,dni,ruc,celular,edad_descuento)  
values('Jose luis','San vicente','Masculino',84884342,10841884342,997547655, 24);
insert into cliente(nombre_cli,direccion_cli,sexo,dni,ruc,celular,edad_descuento)  
values('Cristina','Sam vicente','Femenino',84884042,18084884042,997547699,22);
insert into cliente(nombre_cli,direccion_cli,sexo,dni,ruc,celular,edad_descuento)  
values('Dany','San vicente','Masculino',84884942,10848849402,997547688,26);

#INSERTAR DATOS A LAS TABLAS Proveedor
insert into proveedor(nombre_prov,direccion_prov,email,telefono,celular) 
values('Metro','Lima','metro@gmail.com','3244550','997287262');
insert into proveedor(nombre_prov,direccion_prov,email,telefono,celular) 
values('Inkafarma','Asia','inkafarma@gmail.com','3246343','997284534');
insert into proveedor(nombre_prov,direccion_prov,email,telefono,celular) 
values('oukitas','La victoria','oukitas@gmail.com','3244334','997287234');
insert into proveedor(nombre_prov,direccion_prov,email,telefono,celular)  
values('credifarma','Mala','credifarma@gmail.com','3246343','997287564');

#INSERTAR DATOS A LAS TABLAS Categorias
insert into categoria(descripcion) 
values('Dolor muscular');
insert into categoria(descripcion)  
values('Dolor de cabeza');
insert into categoria(descripcion)  
values('Dolor de diente');
insert into categoria(descripcion)  
values('Infecciones');
insert into categoria(descripcion)  
values('Resfrio');
insert into categoria(descripcion) 
values('Fiebre');

#INSERTAR DATOS A LAS TABLAS Producto
insert into producto(id_categoria,id_proveedor,nombre_pro,stock,fecha_cad,pre_compra) 
values('2','1','naproxeno',20,'2022-12-10 00:00:00','0.30');
insert into producto(id_categoria,id_proveedor,nombre_pro,stock,fecha_cad,pre_compra) 
values('2','2','PANADOL',19,'2022-12-10 00:00:00','1.00');
insert into producto(id_categoria,id_proveedor,nombre_pro,stock,fecha_cad,pre_compra)  
values('1','1','DOLOCONTO',18,'2022-12-10 00:00:00','1.00');
insert into producto(id_categoria,id_proveedor,nombre_pro,stock,fecha_cad,pre_compra)  
values('3','4','FORTE AS',20,'2022-12-10 00:00:00','1.00');

#INSERTAR DATOS A LAS TABLAS Detalle_pedido
insert into detalle_pedido(id_producto,nombre_pro,cantidad,precio_venta,importe) 
values('2','PANADOL','13.3','2.50','0.10');
insert into detalle_pedido(id_producto,nombre_pro,cantidad,precio_venta,importe) 
values('2','PANADOL','14.3','2.50','0.10');
insert into detalle_pedido(id_producto,nombre_pro,cantidad,precio_venta,importe) 
values('2','PANADOL','19.3','2.50','0.10');
insert into detalle_pedido(id_producto,nombre_pro,cantidad,precio_venta,importe) 
values('3','DOLOCONTO','15.3','1.50','0.12');
insert into detalle_pedido(id_producto,nombre_pro,cantidad,precio_venta,importe) 
values('1','naproxeno','20.3','1.50','0.11');

#INSERTAR DATOS A LAS TABLAS Detalle_solicitar
insert into detalle_solicitar(id_proveedor,id_empleado,fecha) 
values('2','1','2021-11-10 09:30:00');
insert into detalle_solicitar(id_proveedor,id_empleado,fecha)  
values('2','1','2021-11-10 09:30:00');
insert into detalle_solicitar(id_proveedor,id_empleado,fecha)  
values('2','1','2021-11-10 09:30:00');
insert into detalle_solicitar(id_proveedor,id_empleado,fecha)  
values('3','1','2021-11-10 10:30:00');
insert into detalle_solicitar(id_proveedor,id_empleado,fecha)  
values('1','1','2021-11-10 08:30:00');

#INSERTAR DATOS A LAS TABLAS Compra
insert into compra(fecha,id_cliente,id_empleado,nombre_e,nombre_cli,tipo_de_pago,total) 
values('2021-10-10 08:00:00','1','2','Luis Rocha','Lina','Tarjeta','245');
insert into compra(fecha,id_cliente,id_empleado,nombre_e,nombre_cli,tipo_de_pago,total)  
values('2021-11-11 09:10:00','3','2','Luis Rocha','Cristina','Tarjeta','80');
insert into compra(fecha,id_cliente,id_empleado,nombre_e,nombre_cli,tipo_de_pago,total)  
values('2021-10-11 09:30:00','2','4','Ernesto Fuente','Jose luis','Efectivo','600');
insert into compra(fecha,id_cliente,id_empleado,nombre_e,nombre_cli,tipo_de_pago,total)  
values('2021-11-11 09:40:00','4','5','Luis Ferrer','Dany','Efectivo','6754');
insert into compra(fecha,id_cliente,id_empleado,nombre_e,nombre_cli,tipo_de_pago,total)  
values('2020-11-11 09:50:00','4','3','Brayan Grial','Dany','Efectivo','345');

#Actualizar
Update proveedor set celular='985453492' WHERE nombre_prov = 'credifarma';
Update empleado set estado_civil ='Soltero' Where nombre_e ='Jose luis';


#Eiminar
Delete from compra where nombre_e='Luis Ferrer';
Delete from compra where nombre_e='Ernesto Fuente';
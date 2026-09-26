create database retail_project;

create table CLIENTES (
	IDCLIENTE serial primary key,
	NOMBRECLIENTE varchar (50) not null,
	EMAIL varchar (50) not null,
	EDAD int not null check (EDAD > 0)
	);

create table PRODUCTOS (
	IDPRODUCTO serial primary key,
	NOMBREPRODUCTO varchar (50) not null,
	CATEGORIA varchar (50) not null,
	PRECIO DECIMAL (10,2) not null check (PRECIO > 0),
	STOCK int not null check (STOCK > 0)
	);

select * from CLIENTES;
select * from PRODUCTOS;

create table VENTAS (
	IDVENTA serial primary key,
	IDCLIENTE int references CLIENTES(IDCLIENTE),
	IDPRODUCTO int references PRODUCTOS(IDPRODUCTO),
	FECHAVENTA date not null 
	);

begin;
insert into CLIENTES (NOMBRECLIENTE,EMAIL,EDAD)
values
	('MARIELA RODRIGUEZ', 'MARI.ROD@CORREO.COM.AR', '25'),
	('MARIO GUTIERREZ', 'MARI.GUD@CORREO.COM.AR', '14'),
	('MATIAS PEREZ', 'MATIP@CORREO.COM.AR', '20'),
	('CAMILA JUAREZ', 'CAMJU@CORREO.COM.AR', '22'),
	('MARIANO LOPEZ', 'MARIAN.LO@CORREO.COM.AR', '35'),
	('DANIELA SUAREZ', 'SUAREZD@CORREO.COM.AR', '32');
commit;

begin;
insert into PRODUCTOS (NOMBREPRODUCTO,CATEGORIA,PRECIO,STOCK)
values
	('MOUSE', 'ELECTRONICA' , '20000', '10'),
	('MATE' , 'VARIOS' , '10000', '20'),
	('AURICULARES','ELECTRONICA' , '10000', '50'),
	('TERMO' , 'VARIOS', '20000', '10'),
	('MONITOR', 'ELECTRONICA' , '100000', '10');
commit;

begin;
insert into VENTAS (IDCLIENTE,IDPRODUCTO,FECHAVENTA)
values
	('1','2','2026-05-04'),
	('2','3','2026-05-05'),
	('3','1','2026-05-06'),
	('4','1','2026-05-06'),
	('5','5','2026-05-10'),
	('6','2','2026-05-12');
commit;

update productos p 
set PRECIO=PRECIO*1.25
where CATEGORIA='ELECTRONICA';

update PRODUCTOS P
set PRECIO=PRECIO*0.85
where CATEGORIA='VARIOS';

select * from PRODUCTOS;

delete from ventas 
where IDCLIENTE = 6;

select * from VENTAS;
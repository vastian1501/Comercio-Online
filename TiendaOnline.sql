drop database TiendaOnline;
create database TiendaOnline
default character set utf8 collate utf8_unicode_ci;
use TiendaOnline;

create table cliente (
	dni varchar(9) not null primary key,
	nombre varchar(14),
	apellidos varchar(20),
	direccion varchar(60),
	email varchar(80),
	tlfn varchar(12)
)engine=InnoDB;

create table vendedor (
	id_vendedor int(3) not null auto_increment primary key,
	nombre varchar(30),
	direccion varchar(60)
)engine=InnoDB;

create table categoria (
	id_categoria int(3) not null auto_increment primary key,
	nombre varchar(30),
	descripcion varchar(60)
)engine=InnoDB;

create table producto (
	id_producto int(3) not null auto_increment primary key,
	nombre varchar(14),
	descripcion varchar(40),
	precio int(14),
	stock int(7),
	id_vendedor int(3),
	id_categoria int(3),
	constraint producto_FK foreign key (id_vendedor) references vendedor(id_vendedor),
	constraint producto_FK2 foreign key (id_categoria) references categoria(id_categoria)
)engine=InnoDB;

create table pedido (
	id_pedido int(2) not null auto_increment primary key,
	nombre varchar(14),
	fecha datetime,
	total int(7),
	cantidad int(7),
	dni_cliente varchar(9),
	id_producto int(3),
	constraint pedido_FK foreign key (dni_cliente) references cliente(dni),
	constraint pedido_FK2 foreign key (id_producto) references producto(id_producto)
)engine=InnoDB;

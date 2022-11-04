--BASE DE DATOS Y TABLAS

create database VentaRepuestos
go

use VentaRepuestos 
go

create table ROL(
IdRol int identity(1,1) primary key not null,
Descripcion varchar(60) not null,
Estado bit default 1 not null,
FechaRegistro datetime default getdate() 
)
go

create table TIENDA(
IdTienda int identity(1,1) primary key not null,
Nombre varchar(60) not null,
RUC varchar(60) not null,
Direccion varchar(100) not null,
Telefono char(8) check (Telefono like '[5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
Estado bit default 1 not null,
FechaRegistro datetime default getdate()
)
go

create table USUARIO(
IdUsuario int identity(1,1) primary key not null,
Nombres varchar(60) not null,
Apellidos varchar(60) not null,
Usuario varchar(60) not null,
Clave varchar(60) not null,
Direccion varchar(100) not null,
Telefono char(8) check (Telefono like '[5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
IdTienda int references TIENDA(IdTienda) not null,
IdRol int references ROL(IdRol) not null,
Estado bit default 1 not null,
FechaRegistro datetime default getdate() 
)
go

create table DEPARTAMENTOS(
IdDptos int identity(1,1) primary key not null,
NombreDpto nvarchar(48) not null
)
go

create table MUNICIPIOS(
IdMun int identity(1,1) primary key not null,
NombreMun nvarchar(45) not null,
IdDptos int foreign key references DEPARTAMENTOS(IdDptos) not null
)
go

create table PROVEEDORES(
IdProv int identity(1,1) primary key not null,
NombreProv nvarchar(75) not null,
DirProv nvarchar(150) not null,
Telefono char(8) check(Telefono like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
EstadoProv bit default 1 not null,
IdMun int foreign key references MUNICIPIOS(IdMun) not null,
FechaRegistro datetime default getdate() 
)
go

create table CATEGORIA(
IdCategoria int identity(1,1) primary key not null,
Descripcion varchar(100) not null,
Estado bit default 1 not null,
FechaRegistro datetime default getdate() 
)

go

create table PRODUCTOS(
IdProd char(5) primary key not null,
CodEmpr varchar(15),
DescProd varchar(70) not null,
Tipo varchar (70)not null,
Marca nvarchar (70)not null,
Existp int not null,
Costo float not null,
Preciop float not null,
EstadoPr bit default 1 not null,
IdProv int foreign key references PROVEEDORES(IdProv) not null,
IdCategoria int references CATEGORIA(IdCategoria),
IdTienda int foreign key references TIENDA(IdTienda) not null,
FechaRegistro datetime default getdate() 
)
go

create rule EPos
as 
@v>0
go
  
sp_bindrule 'EPos','PRODUCTOS.Preciop'
go
sp_bindrule 'EPos', 'PRODUCTOS.Existp'
go


create table CLIENTES(
IdCliente char(5) primary key not null,
PNC nvarchar(15) not null,
SNC nvarchar(15) ,
PAC nvarchar(15) not null,
SAC nvarchar(15) ,
DirC nvarchar(75) not null,
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Estadoc bit default 1 not null,
IdMun int foreign key references MUNICIPIOS(IdMun) not null,
FechaRegistro datetime default getdate() 
)
go

create table VENTAS(
IdVenta int identity(1,1) primary key not null,
TotalV float not null,
IdTienda int foreign key references TIENDA(IdTienda) not null,
IdUsuario int foreign key references USUARIO(IdUsuario) not null,
IdCliente char(5) foreign key references CLIENTES(IdCliente) not null,
FechaVenta datetime default getdate() 
)
go

create table DET_VENTAS(
IdVenta int foreign key references VENTAS(IdVenta) not null,
IdProd char(5) foreign key references PRODUCTOS(IdProd) not null,
Descuento float,
Cantv int not null,
Subtp float,
FechaRegistro datetime default getdate(),
primary key(IdVenta,IdProd)
)
go

Create rule NoNeg
as
@x>= 0
go

sp_bindrule 'NoNeg','VENTAS.Totalv'
go
sp_bindrule 'EPos', 'DET_VENTAS.Cantv'
go
sp_bindrule 'Epos', 'DET_VENTAS.Subtp'
go


create table PEDIDOS(
IdPedido int identity(1,1) primary key not null,
IdProv int foreign key references PROVEEDORES(IdProv) not null,
SubTotalP float,
TotalP float,
EstadoPe bit default 1 not null,
FechaPedido datetime default getdate()
)
go

create table DET_PEDIDOS(
IdPedido int foreign key references PEDIDOS(IdPedido) not null,
IdProd char(5) foreign key references PRODUCTOS(IdProd) not null,
Cantped int not null,
Subtp float,
Preciop float,
FechaRegistro datetime default getdate(),
primary key(IdPedido,IdProd)
)
go

sp_bindrule 'NoNeg','PEDIDOS.SubTotalP'
go
sp_bindrule 'NoNeg', 'PEDIDOS.TotalP'
go
sp_bindrule 'NoNeg', 'DET_PEDIDOS.Subtp'
go
sp_bindrule 'EPos', 'DET_PEDIDOS.Subtp'
go
sp_bindrule 'EPos', 'DET_PEDIDOS.Preciop'
go


create table COMPRAS(
IdCompra char(5) primary key not null,
IdPedido int foreign key references PEDIDOS(IdPedido) not null,
Subtotalc float,
Totalc float,
IdUsuario int references USUARIO(IdUsuario) not null,
IdProveedor int references PROVEEDORES(IdProv) not null,
IdTienda int references TIENDA(IdTienda) not null,
FechaCompras datetime default getdate()
)
go

create table DET_COMPRAS(
IdCompra char(5) foreign key references COMPRAS(IdCompra) not null,
IdProd char(5) foreign key references PRODUCTOS(IdProd) not null,
Costoc float not null,
Cantc int not null,
Precioc float not null,
Subtcom float,
FechaRegistro datetime default getdate(),
primary key(IdCompra,IdProd)
)
go

sp_bindrule 'NoNeg','COMPRAS.Subtotalc'
go
sp_bindrule 'NoNeg', 'COMPRAS.Totalc'
go
sp_bindrule 'EPos', 'DET_COMPRAS.Cantc'
go
sp_bindrule 'EPos', 'DET_COMPRAS.Precioc'
go
sp_bindrule 'NoNeg', 'DET_COMPRAS.Subtcom'
go
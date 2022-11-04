--PROCEDIMIENTOS

use VentaRepuestos
go

--Usuario administrador
sp_addlogin 'Admin','admin123*','VentaRepuestos'
sp_addsrvrolemember 'Admin','sysadmin'
sp_adduser 'Admin','Phd'
sp_addrolemember 'db_ddladmin','Phd'

--Usuario Lector/Escritor
sp_addlogin 'Guadalupe','12345*','VentaRepuestos'
sp_addsrvrolemember 'Guadalupe','dbcreator'
sp_adduser 'Guadalupe','DUNI'
sp_addrolemember 'db_datawriter','DUNI'
sp_addrolemember 'db_datareader','DUNI'

--Eliminar usuario
create proc eliminarUsuario
@id int
as
    
	if exists (select IdUsuario from USUARIO where IdUsuario=@id)
  begin
       update USUARIO set estado=0 where IdUsuario=@id
  end
go

--Editar Usuario
create proc editUsuario
@id int,
@tel char(8),
@dir varchar(100)
as
  if exists (select IdUsuario from USUARIO where IdUsuario=@id)
  begin
       update USUARIO set Telefono=@tel where idUsuario=@id
	   update USUARIO set Direccion=@dir where idUsuario=@id
  end
go

--Agregar Usuario
create proc agergarUsuario
@nombres varchar(60),@apellidos varchar(60),@usuaio varchar(60),@clave varchar(60),
@direccion varchar(100),@telefono char(8),@idT int,@idR int,@estado bit,@fecha datetime
as
   insert into USUARIO(Nombres,Apellidos,Usuario,Clave,Direccion,Telefono,IdTienda,IdRol,Estado,FechaRegistro) values (@nombres,@apellidos,@usuaio,@clave,@direccion,@telefono,@idT,@idR,@estado,@fecha) 
go

--Mostrar Usuario
create proc MostrarUsuarios
as
     select IdUsuario as ID,Nombres as Nombres,Apellidos as Apellidos,Usuario as Usuario, Clave as Clave ,Direccion as Direccion,Telefono as Telefono,IdTienda as IdTienda,
	 IdRol as IdRol,Estado as Estado, FechaRegistro as FechaRegistro from USUARIO where Estado=1
     
go

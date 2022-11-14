create procedure consultaEmpleado(@idSucursal int, @idPuesto int, @fechaInicioContratacion date,
 @fechaFinContratacion date,@idEmpleado int )
as 
	
	select Empleado.idEmpleado,Empleado.cedula, Empleado.nombreEmpleado, empleado.apellido1, empleado.apellido2 ,
	Estado.nombre as estado, Empleado.fechaNacimiento, Sucursal.nombreSucursal, Puesto.nombrePuesto ,
	Empleado.fechaContratacion, Empleado.correo
	from Empleado inner join Estado on Empleado.idEstado=Estado.idEstado
	inner join Sucursal on Empleado.idSucursal= Sucursal.idSucursal 
	inner join Puesto on Empleado.idPuesto = Puesto.idPuesto
	where idEmpleado = isnull(@idEmpleado, idEmpleado) and 
	Empleado.idSucursal = ISNULL(@idSucursal, Empleado.idSucursal) and
	Empleado.idPuesto = ISNULL(@idPuesto, Empleado.idPuesto) and
	Empleado.fechaContratacion between 
			isnull(@fechaInicioContratacion, CAST('1999-01-01' as date)) and 
			isnull(@fechaFinContratacion, DATEADD(day,1, getdate()));

go


create procedure consultaCliente(@Cedula int ,@idCliente int )
as 
	BEGIN
	select Cliente.idCliente,Cliente.cedula, Cliente.nombre, Cliente.apellido1, Cliente.apellido2 ,
	Estado.nombre as estado, Cliente.fechaNacimiento, Cliente.celular, Cliente.correo
	from Cliente inner join Estado on Cliente.idEstado=Estado.idEstado
	where Cliente.idCliente = isnull(@idCliente, Cliente.idCliente) and 
	Cliente.cedula=isnull(@cedula,Cliente.cedula)
	END
go

create procedure consultaClienteC(@Correo varchar(60))
as 
	BEGIN
	select Cliente.idCliente,Cliente.cedula, Cliente.nombre, Cliente.apellido1, Cliente.apellido2 
	, Cliente.fechaNacimiento, Cliente.celular, Cliente.correo
	from Cliente 
	where Cliente.correo = isnull(@Correo ,Cliente.correo) 
	END
go


create procedure montoRecolectadoEnvio(@idSucursal int, @fechaInicial date, @fechaFin date, @idCliente int )
as 
	BEGIN
	select sum(Envio.costoEnvio) as totalesEnvios , Sucursal.nombreSucursal, Factura.idCliente, Envio.fechaEnvio 
	from Factura  inner join Envio on Factura.idFactura=Envio.idFactura 
	inner join Sucursal on Factura.idSucursal= Sucursal.idSucursal
	where Envio.fechaEnvio between isnull(@fechaInicial,Envio.fechaEnvio) and isnull(@fechaFin, Envio.fechaEnvio) 
	and Factura.idSucursal=isnull(@idSucursal, Factura.idSucursal) and Factura.idCliente=isnull(@idCliente,Factura.idCliente)
	group by  Sucursal.nombreSucursal, Factura.idCliente, Envio.fechaEnvio ;
	END
go

create procedure infoPrecioProductoSucursal(@idProducto int, @nombre varchar(50))
as
	select Producto.nombre, Producto.idCategoria,  Producto.descripcion, Producto.precio from Producto 
	where Producto.idProducto = isnull(@idProducto, Producto.idProducto)
	and Producto.nombre= isnull(@nombre,Producto.nombre);

go

GO
CREATE PROCEDURE getFoto @idFoto int WITH ENCRYPTION AS
BEGIN
	SELECT Fotos.foto 
    FROM Fotos
    WHERE Fotos.idFoto = @idFoto;
END
GO


GO
CREATE PROCEDURE getNombreProducto @idProducto int WITH ENCRYPTION AS
BEGIN
	SELECT Producto.nombre
    FROM Producto
    WHERE Producto.idProducto = @idProducto;
END
GO

CREATE PROCEDURE getNombreProductoFoto @idFoto int WITH ENCRYPTION AS
BEGIN
	SELECT Producto.nombre
    FROM Fotos inner join 
	Producto on Fotos.idProducto = Producto.idProducto where idFoto=@idFoto;
END
GO


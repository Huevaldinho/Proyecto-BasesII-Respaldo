-- CRUD Cliente
-- drop procedure CRUDcliente;
go
CREATE PROCEDURE CRUDcliente @opcion int, @idCliente int, @idEstado int, 
							 @cedula bigint, @nombre varchar(50), @apellido1 varchar(50), 
							 @apellido2 varchar(50), @fechaNacimiento date, @correo varchar(50), 
							 @celular varchar(20)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idEstado is null or @cedula is null or 
					   @nombre is null or @apellido1 is null or @apellido2 is null or 
					   @fechaNacimiento is null or @correo is null or @celular is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idEstado is not null and (select count(idEstado) from Estado 
									  where idEstado=@idEstado)=0)
		begin
            set @error=4; set @errorMsg='El id del estado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Cliente(idEstado, cedula,nombre, apellido1, apellido2,
								fechaNacimiento, correo, celular) 
			values (@idEstado, @cedula,@nombre, @apellido1, @apellido2,
					@fechaNacimiento, @correo, @celular)
		end
	if (@opcion = 1)
		begin
			select idCliente, idEstado, cedula,nombre, apellido1, apellido2,
				   fechaNacimiento, correo, celular
			from Cliente where idCliente = @idCliente;
		end
	if (@opcion = 2)
		begin
			update Cliente 
			set idEstado = ISNULL(@idEstado,idEstado),
				cedula = ISNULL(@cedula,cedula),
				nombre = ISNULL(@nombre,nombre),
				apellido1 = ISNULL(@apellido1,apellido1),
				apellido2 = ISNULL(@apellido2,apellido2),
				fechaNacimiento = ISNULL(@fechaNacimiento,fechaNacimiento),
				correo = ISNULL(@correo,correo),
				celular = ISNULL(@celular,celular)
			where idCliente = @idCliente;
		end
	if (@opcion = 3)
		begin
			update Cliente 
			set idEstado = 1
			where idCliente = @idCliente;
		end
END
GO 


-- CRUD Factura
-- drop procedure CRUDfactura;
go
CREATE or alter PROCEDURE  CRUDfactura @opcion int, @idFactura int, @idSucursal int, @idCliente  int,
				 @idEmpleado int, @idMetodoPago int, @total money
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idSucursal is null or @idCliente is null or @idEmpleado is null or 
					   @idMetodoPago is null or @total is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idSucursal is not null and (select count(idSucursal) from Sucursal 
									  where idSucursal=@idSucursal)=0)
		begin
            set @error=3; set @errorMsg='El id de la sucursal debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idCliente is not null and (select count(idCliente) from Cliente 
									  where idCliente=@idCliente)=0)
		begin
            set @error=4; set @errorMsg='El id del estado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idEmpleado is not null and (select count(idEmpleado) from Empleado 
									  where idEmpleado=@idEmpleado)=0)
		begin
            set @error=5; set @errorMsg='El id del estado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idMetodoPago is not null and (select count(idMetodoPago) from MetodoPago 
									  where idMetodoPago=@idMetodoPago)=0)
		begin
            set @error=6; set @errorMsg='El id del estado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Factura(idSucursal, idCliente, idEmpleado, idMetodoPago, total, 
								fechaFactura) 
			values (@idSucursal, @idCliente, @idEmpleado, @idMetodoPago, @total, getDate());
		end
	if (@opcion = 1)
		begin
			select idFactura, idSucursal, idCliente, idEmpleado, idMetodoPago, total, fechaFactura
			from Factura where idFactura = @idFactura;
		end
	if (@opcion = 2)
		begin
			update Factura 
			set idSucursal = ISNULL(@idSucursal,idSucursal),
				idCliente = ISNULL(@idCliente,idCliente),
				idEmpleado = ISNULL(@idEmpleado,idEmpleado),
				idMetodoPago = ISNULL(@idMetodoPago,idMetodoPago),
				total = ISNULL(@total,total)
			where idFactura = @idFactura;
		end
END
GO

-- CRUD Detalle
-- drop procedure CRUDdetalle;
go
CREATE PROCEDURE CRUDdetalle @opcion int, @idDetalle int, @idUnidad int, @idFactura int,
							 @subTotal int
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idUnidad is null or @idFactura is null or @subTotal is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idUnidad is not null and (select count(idUnidad) from Unidad 
									  where idUnidad=@idUnidad)=0)
		begin
            set @error=3; set @errorMsg='El id de la unidad debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idFactura is not null and (select count(idFactura) from Factura 
									  where idFactura=@idFactura)=0)
		begin
            set @error=4; set @errorMsg='El id del factura debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	
	if (@opcion = 0) 
		begin
			insert into Detalle(idUnidad, idFactura, subTotal) 
						values (@idUnidad, @idFactura, @subTotal)
		end
	if (@opcion = 1)
		begin
			select idDetalle, idUnidad, idFactura, subTotal from Detalle 
			where idDetalle = @idDetalle;
		end
	if (@opcion = 2)
		begin
			update Detalle 
			set idUnidad = ISNULL(@idUnidad,idUnidad),
				idFactura = ISNULL(@idFactura,idFactura),
				subTotal = ISNULL(@subTotal,subTotal)
			where idDetalle = @idDetalle;
		end
	if (@opcion = 3)
		begin
			delete from Detalle
			where idDetalle = @idDetalle;
		end
END
GO
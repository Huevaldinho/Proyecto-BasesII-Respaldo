
go
CREATE PROCEDURE CRUDUsuarioEmpleado @opcion int, @idUsuarioEmpleado int,@idEmpleado int,
									 @contrasenna varchar(30)
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idEmpleado is null or @contrasenna is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	if (@idEmpleado is not null and (select count(idEmpleado) from Empleado 
									  where idEmpleado=@idEmpleado)=0)
		begin
            set @error=4; set @errorMsg='El id del empleado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into UsuarioEmpleado (idEmpleado, contrasenna)
					  values (@idEmpleado, @contrasenna)
		end
	if (@opcion = 1)
		begin
			select idEmpleado, contrasenna
			from UsuarioEmpleado where idUsuarioEmpleado = @idUsuarioEmpleado;
		end
	if (@opcion = 2)
		begin
			update UsuarioEmpleado 
			set idEmpleado = ISNULL(@idEmpleado,idEmpleado), 
				contrasenna = ISNULL(@contrasenna,contrasenna)
			where idUsuarioEmpleado = @idUsuarioEmpleado;
		end
END
GO


go
CREATE PROCEDURE CRUDUsuarioCliente @opcion int, @idUsuarioCliente int,@idCliente int,
									 @contrasenna varchar(30)
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idCliente is null or @contrasenna is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	if (@idCliente is not null and (select count(idCliente) from Cliente 
									  where idCliente=@idCliente)=0)
		begin
            set @error=4; set @errorMsg='El id del Cliente debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into UsuarioCliente(idCliente, contrasenna)
					  values (@idCliente, @contrasenna)
		end
	if (@opcion = 1)
		begin
			select idCliente, contrasenna
			from UsuarioCliente where idUsuarioCliente = @idUsuarioCliente;
		end
	if (@opcion = 2)
		begin
			update UsuarioCliente
			set idCliente = ISNULL(@idCliente,idCliente), 
				contrasenna = ISNULL(@contrasenna,contrasenna)
			where idUsuarioCliente = @idUsuarioCliente;
		end
END
GO

-- CRUD	Unidad
-- drop procedure CRUDunidad;
go
CREATE PROCEDURE CRUDunidad @opcion int, @idUnidad int, @idLote  int, @idEstado int 
							with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idUnidad is null or @idLote is null or @idEstado is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idLote is not null and (select count(idLote) from LoteProducto 
									  where idLote=@idLote)=0)
		begin
            set @error=3; set @errorMsg='El id del lote debe existir. %s %d';
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
			insert into Unidad(idLote, idEstado) 
			values (@idLote, @idEstado)
		end
	if (@opcion = 1)
		begin
			select idUnidad, idLote, idEstado from Unidad where idUnidad = @idUnidad;
		end
	if (@opcion = 2)
		begin
			update Unidad 
			set idLote = ISNULL(@idLote,idLote),
				idEstado = ISNULL(@idEstado,idEstado)
			where idUnidad = @idUnidad;
		end
	if (@opcion = 3)
		begin
			update Unidad 
			set idEstado = 2
			where idUnidad = @idUnidad;
		end
END
GO 

-- CRUD	LoteProducto
-- drop procedure CRUDlote;
go
CREATE PROCEDURE CRUDlote @opcion int, @idLote int, @idPedido int, @fechaProduccion date, 
						  @fechaExpiracion date, @cantidad int, @costoLote int, @porcentajeGanancia float 
							with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idPedido is null or @fechaProduccion is null or 
					   @fechaExpiracion is null or @cantidad is null or @costoLote is null or 
					   @porcentajeGanancia is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idPedido is not null and (select count(idPedido) from Pedido 
									  where idPedido=@idPedido)=0)
		begin
            set @error=3; set @errorMsg='El id del pedido debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end


	-- opciones
	if (@opcion = 0) 
		begin
			insert into LoteProducto( idPedido, fechaProduccion, fechaExpiracion, 
									cantidad, costoLote,porcentajeGanancia) 
			values ( @idPedido, @fechaProduccion, @fechaExpiracion, @cantidad, @costoLote,
					@porcentajeGanancia)
		end
	if (@opcion = 1)
		begin
			select idLote, idPedido, fechaProduccion, fechaExpiracion, cantidad, costoLote,
				   porcentajeGanancia
			from LoteProducto where idLote = @idLote;
		end
	if (@opcion = 2)
		begin
			update LoteProducto 
			set idPedido = ISNULL(@idPedido,idPedido),
				fechaProduccion = ISNULL(@fechaProduccion,fechaProduccion),
				fechaExpiracion = ISNULL(@fechaExpiracion,fechaExpiracion),
				cantidad = ISNULL(@cantidad,cantidad),
				costoLote = ISNULL(@costoLote,costoLote),
				porcentajeGanancia = ISNULL(@porcentajeGanancia,porcentajeGanancia)
			where idLote = @idLote;
		end
END
GO 

-- CRUD	ProductoXImpuesto
-- drop procedure CRUDproductoximpuesto;
go
CREATE PROCEDURE CRUDproductoximpuesto @opcion int, @idProductoXImpuesto int, @idProducto int, 
									   @idImpuesto int
							with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idProductoXImpuesto is null or @idProducto is null or 
					   @idImpuesto is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idProducto is not null and (select count(idProducto) from Producto 
									  where idProducto=@idProducto)=0)
		begin
            set @error=3; set @errorMsg='El id de la categoria debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idImpuesto is not null and (select count(idImpuesto) from Impuesto 
									  where idImpuesto=@idImpuesto)=0)
		begin
            set @error=4; set @errorMsg='El id del impuesto debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end


	-- opciones
	if (@opcion = 0) 
		begin
			insert into ProductoXImpuesto(idProducto, idImpuesto) values (@idProducto, @idImpuesto)
		end
	if (@opcion = 1)
		begin
			select idProductoXImpuesto, idProducto, idImpuesto
			from ProductoXImpuesto where idProductoXImpuesto = @idProductoXImpuesto;
		end
	if (@opcion = 2)
		begin
			update ProductoXImpuesto 
			set idProducto = ISNULL(@idProducto,idProducto),
				idImpuesto = ISNULL(@idImpuesto,idImpuesto)
			where idProductoXImpuesto = @idProductoXImpuesto;
		end
END
GO 

-- CRUD	Descuento
-- drop procedure CRUDdescuento;
go
CREATE PROCEDURE CRUDdescuento @opcion int, @idDescuento int, @idLote int, @porcentaje float
							   with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idDescuento is null or @idLote is null or @porcentaje is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idLote is not null and (select count(idLote) from LoteProducto
									  where idLote=@idLote)=0)
		begin
            set @error=3; set @errorMsg='El id del lote debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Descuento(idLote, porcentaje) values (@idLote, @porcentaje)
		end
	if (@opcion = 1)
		begin
			select idDescuento, idLote, porcentaje
			from Descuento where idDescuento = @idDescuento;
		end
	if (@opcion = 2)
		begin
			update Descuento 
			set idLote = ISNULL(@idLote,idLote),
				porcentaje = ISNULL(@porcentaje,porcentaje)
			where idDescuento = @idDescuento;
		end
	if (@opcion = 3)
		begin
			delete from Descuento where idDescuento = @idDescuento;
		end
END
GO 

-- CRUD	Impuesot
-- drop procedure CRUDimpuesto;
go
CREATE PROCEDURE CRUDimpuesto @opcion int, @idImpuesto int, @porcentaje float
							   with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idImpuesto is null or @porcentaje is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Impuesto(porcentaje) values (@porcentaje)
		end
	if (@opcion = 1)
		begin
			select idImpuesto, porcentaje
			from Impuesto where idImpuesto = @idImpuesto;
		end
	if (@opcion = 2)
		begin
			update Impuesto 
			set porcentaje = ISNULL(@porcentaje,porcentaje)
			where idImpuesto = @idImpuesto;
		end
END
GO 

-- CRUD Sucursal
-- drop procedure CRUDsucursal;
go
CREATE PROCEDURE CRUDsucursal @opcion int, @idSucursal int,@idUbicacion int,
									  @idAdministrador int,
									  @nombreSucursal varchar(50), @ubicacionG geography
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idUbicacion is null or @idAdministrador is null or
					   @nombreSucursal is null or @ubicacionG is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idUbicacion is not null and (select count(idUbicacion) from Ubicacion 
									  where idUbicacion=@idUbicacion)=0)
		begin
            set @error=3; set @errorMsg='El id de la ubicación debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idAdministrador is not null and (select count(idEmpleado) from Empleado 
									  where idEmpleado=@idAdministrador)=0)
		begin
            set @error=4; set @errorMsg='El id del administrador debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Sucursal (idUbicacion, idAdministrador, nombreSucursal, ubicacionG)
					  values (@idUbicacion, @idAdministrador, @nombreSucursal, @ubicacionG)
		end
	if (@opcion = 1)
		begin
			select idSucursal, idUbicacion, idAdministrador, nombreSucursal, ubicacionG
			from Sucursal where idSucursal = @idSucursal;
		end
	if (@opcion = 2)
		begin
			update Sucursal 
			set idUbicacion = ISNULL(@idUbicacion,idUbicacion), 
				idAdministrador = ISNULL(@idAdministrador,idAdministrador), 
				nombreSucursal = ISNULL(@nombreSucursal,nombreSucursal), 
				ubicacionG = ISNULL(@ubicacionG,ubicacionG)
			where idSucursal = @idSucursal;
		end
END
GO

-- CRUD Envío
-- drop procedure CRUDenvio;
go
CREATE PROCEDURE CRUDenvio @opcion int, @idEnvio int,@idFactura int, 
						   @idEstado int, @costoEnvio money, @fechaEnvio date, @ubicacionG geography
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idFactura is null or
					   @costoEnvio is null or @fechaEnvio is null or @idEstado is null or @ubicacionG is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idFactura is not null and (select count(idFactura) from Factura 
									  where idFactura=@idFactura)=0)
		begin
            set @error=4; set @errorMsg='El id de la factura debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idEstado is not null and (select count(idEstado) from Estado 
									  where idEstado=@idEstado)=0)
		begin
            set @error=4; set @errorMsg='El id de la factura debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Envio (idFactura, costoEnvio, fechaEnvio, idEstado, ubicacionG)
					  values (@idFactura, @costoEnvio, @fechaEnvio, @idEstado, @ubicacionG)
		end
	if (@opcion = 1)
		begin
			select idEnvio, idFactura, costoEnvio, fechaEnvio, idEstado, ubicacionG
			from Envio where idEnvio = @idEnvio;
		end
	if (@opcion = 2)
		begin
			update Envio 
			set idFactura = ISNULL(@idFactura,idFactura), 
				costoEnvio = ISNULL(@costoEnvio,costoEnvio), 
				fechaEnvio = ISNULL(@fechaEnvio,fechaEnvio), 
				idEstado = ISNULL(@idEstado,idEstado), 
				ubicacionG = ISNULL(@ubicacionG,ubicacionG)
			where idEnvio = @idEnvio;
		end
	if (@opcion = 3)
		begin
			update Envio 
			set idEstado = 6
			where idEnvio = @idEnvio;
		end
END
GO

-- CRUD Ubicación
-- drop procedure CRUDubicacion;
go
CREATE PROCEDURE CRUDubicacion @opcion int, @idUbicacion int, @idDistrito int, 
							   @descripcion varchar(250)
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idDistrito is null or @descripcion is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idDistrito is not null and (select count(idDistrito) from Distrito 
									  where idDistrito=@idDistrito)=0)
		begin
            set @error=3; set @errorMsg='El id del distrito debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Ubicacion (idDistrito, descripcion)
					  values (@idDistrito, @descripcion)
		end
	if (@opcion = 1)
		begin
			select idUbicacion, idDistrito, descripcion
			from Ubicacion where idUbicacion = @idUbicacion;
		end
	if (@opcion = 2)
		begin
			update Ubicacion 
			set idDistrito = ISNULL(@idDistrito,idDistrito), 
				descripcion = ISNULL(@descripcion,descripcion)
			where idUbicacion = @idUbicacion;
		end
END
GO

-- CRUD Distrito
-- drop procedure CRUDdistrito;
go
CREATE PROCEDURE CRUDdistrito @opcion int, @idDistrito int, @idCanton int, 
							   @nombreDistrito varchar(100)
							   with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idCanton is null or @nombreDistrito is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idCanton is not null and (select count(idCanton) from Canton 
									  where idCanton=@idCanton)=0)
		begin
            set @error=3; set @errorMsg='El id del canton debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Distrito (idCanton, nombreDistrito)
					  values (@idCanton, @nombreDistrito)
		end
	if (@opcion = 1)
		begin
			select idDistrito, idCanton, nombreDistrito
			from Distrito where idDistrito= @idDistrito;
		end
	if (@opcion = 2)
		begin
			update Distrito 
			set idCanton = ISNULL(@idCanton,idCanton), 
				nombreDistrito = ISNULL(@nombreDistrito,nombreDistrito)
			where idDistrito= @idDistrito;
		end
END
GO

-- CRUD Cantón
-- drop procedure CRUDcanton;
go
CREATE PROCEDURE CRUDcanton @opcion int, @idCanton int, @idProvincia int, 
							   @nombreCanton varchar(100)
							   with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idProvincia is null or @nombreCanton is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idProvincia is not null and (select count(idProvincia) from Provincia 
									  where idProvincia=@idProvincia)=0)
		begin
            set @error=3; set @errorMsg='El id de la provincia debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Canton (idProvincia, nombreCanton)
					  values (@idProvincia, @nombreCanton)
		end
	if (@opcion = 1)
		begin
			select idCanton, idProvincia, nombreCanton
			from Canton where idCanton= @idCanton;
		end
	if (@opcion = 2)
		begin
			update Canton 
			set idProvincia = ISNULL(@idProvincia,idProvincia), 
				nombreCanton = ISNULL(@nombreCanton,nombreCanton)
			where idCanton= @idCanton;
		end
END
GO

-- CRUD Provincia
-- drop procedure CRUDprovincia;
go
CREATE PROCEDURE CRUDprovincia @opcion int, @idProvincia int, @idPais int, 
							   @nombreProvincia varchar(100)
							   with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idPais is null or @nombreProvincia is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idPais is not null and (select count(idPais) from Pais 
									  where idPais=@idPais)=0)
		begin
            set @error=3; set @errorMsg='El id del país debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Provincia (idPais, nombreProvincia)
					  values (@idPais, @nombreProvincia)
		end
	if (@opcion = 1)
		begin
			select idProvincia, idPais, nombreProvincia
			from Provincia where idProvincia= @idProvincia;
		end
	if (@opcion = 2)
		begin
			update Provincia 
			set idPais = ISNULL(@idPais,idPais), 
				nombreProvincia = ISNULL(@nombreProvincia,nombreProvincia)
			where idProvincia= @idProvincia;
		end
END
GO


-- CRUD Pais
-- drop procedure CRUDpais;
go
CREATE PROCEDURE CRUDpais @opcion int, @idPais int, @idMoneda int, @nombrePais varchar(100)
							   with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idMoneda is null or @nombrePais is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idMoneda is not null and (select count(idMoneda) from Moneda 
									  where idMoneda=@idMoneda)=0)
		begin
            set @error=3; set @errorMsg='El id del la moneda debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Pais (idMoneda, nombrePais)
					  values (@idMoneda, @nombrePais)
		end
	if (@opcion = 1)
		begin
			select idPais, idMoneda, nombrePais
			from Pais where idPais= @idPais;
		end
	if (@opcion = 2)
		begin
			update Pais 
			set idMoneda = ISNULL(@idMoneda,idMoneda), 
				nombrePais = ISNULL(@nombrePais,nombrePais)
			where idPais= @idPais;
		endio
END
GO

-- CRUD Moneda
-- drop procedure CRUDmoneda;
go
CREATE PROCEDURE CRUDmoneda @opcion int, @idMoneda int, @nombreDivisa varchar(100), 
							@cambioDolar money
							with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombreDivisa is null or @cambioDolar is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Moneda (nombreDivisa, cambioDolar)
					  values (@nombreDivisa, @cambioDolar)
		end
	if (@opcion = 1)
		begin
			select idMoneda, nombreDivisa, cambioDolar
			from Moneda where idMoneda= @idMoneda;
		end
	if (@opcion = 2)
		begin
			update Moneda 
			set nombreDivisa = ISNULL(@nombreDivisa,nombreDivisa), 
				cambioDolar = ISNULL(@cambioDolar,cambioDolar)
			where idMoneda= @idMoneda;
		end
END
GO

-- CRUD Horario
-- drop procedure CRUDhorario;
go
CREATE PROCEDURE CRUDhorario @opcion int, @idHorario int, @horaApertura time, @horaCierre time, 
							 @dia varchar(1)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idHorario is null or @horaApertura is null or @horaCierre is null or
					   @dia is null ) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idHorario is not null and (select count(idHorario) from Horario 
									  where idHorario=@idHorario)=0)
		begin
            set @error=3; set @errorMsg='El id del horario debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Horario (horaApertura, horaCierre, dia)
					  values (@horaApertura, @horaCierre, @dia)
		end
	if (@opcion = 1)
		begin
			select idHorario, horaApertura, horaCierre, dia
			from Horario where idHorario = @idHorario;
		end
	if (@opcion = 2)
		begin
			update Horario 
			set horaApertura = ISNULL(@horaApertura,horaApertura), 
				horaCierre = ISNULL(@horaCierre,horaCierre), 
				dia = ISNULL(@dia,dia)
			where idHorario = @idHorario;
		end
END
GO

-- CRUD HorarioXSucursal
-- drop procedure CRUDhorarioxsucursal;
go
CREATE PROCEDURE CRUDhorarioxsucursal @opcion int, @idHorarioXSucursal int, @idHorario int, 
									  @idSucursal int 
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idHorario is null or @idSucursal is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idHorario is not null and (select count(idHorario) from Horario 
									  where idHorario=@idHorario)=0)
		begin
            set @error=3; set @errorMsg='El id del horario debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idSucursal is not null and (select count(idSucursal) from Sucursal 
									  where idSucursal=@idSucursal)=0)
		begin
            set @error=4; set @errorMsg='El id de la sucursal debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into HorarioXSucursal(idHorario, idSucursal)
					  values (@idHorario, @idSucursal)
		end
	if (@opcion = 1)
		begin
			select idHorarioXSucursal, idHorario, idSucursal
			from HorarioXSucursal where idHorarioXSucursal = @idHorarioXSucursal;
		end
	if (@opcion = 2)
		begin
			update HorarioXSucursal 
			set idHorario = ISNULL(@idHorario,idHorario), 
				idSucursal = ISNULL(@idSucursal,idSucursal)
			where idHorarioXSucursal = @idHorarioXSucursal;
		end
END
GO

-- CRUD	Fotos
-- drop procedure CRUDfotos;
go
CREATE PROCEDURE CRUDfotos @opcion int, @idFoto int, @idProducto int, @foto varbinary(max)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idProducto is null or @foto is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idProducto is not null and (select count(idProducto) from Producto 
									  where idProducto=@idProducto)=0)
		begin
            set @error=3; set @errorMsg='El id del producto debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Fotos(idProducto, foto) 
			values (@idProducto, @foto)
		end
	if (@opcion = 1)
		begin
			select idFoto, idProducto, foto
			from Fotos where idFoto = @idFoto;
		end
	if (@opcion = 2)
		begin
			update Fotos 
			set idProducto = ISNULL(@idProducto,idProducto),
				foto = ISNULL(@foto,foto)
			where idFoto = @idFoto;
		end
END
GO 

-- CRUD	Categoria
-- drop procedure CRUDcategoria;
go
CREATE PROCEDURE CRUDcategoria @opcion int, @idCategoria int, @nombre varchar(50), 
							 @descripcion varchar(150)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombre is null or @descripcion is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Categoria(nombre, descripcion) 
			values (@nombre, @descripcion)
		end
	if (@opcion = 1)
		begin
			select idCategoria, nombre, descripcion
			from Categoria where idCategoria = @idCategoria;
		end
	if (@opcion = 2)
		begin
			update Categoria 
			set nombre = ISNULL(@nombre,nombre),
				descripcion = ISNULL(@descripcion,descripcion)
			where idCategoria = @idCategoria;
		end
END
GO 

-- CRUD	Inventario
-- drop procedure CRUDinventario;
go
CREATE PROCEDURE CRUDinventario @opcion int, @idInventario int, @idProducto int, @idSucursal int, 
								@cantidad int, @minimo int, @maximo int
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idProducto is null or @idSucursal is null or 
					   @cantidad is null or @minimo is null or @maximo is null))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idProducto is not null and (select count(idProducto) from Producto 
									  where idProducto=@idProducto)=0)
		begin
            set @error=3; set @errorMsg='El id del producto debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idSucursal is not null and (select count(idSucursal) from Sucursal 
									  where idSucursal=@idSucursal)=0)
		begin
            set @error=3; set @errorMsg='El id del sucursal debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Inventario(idProducto, idSucursal, cantidad, minimo, maximo) 
			values (@idProducto, @idSucursal, @cantidad, @minimo, @maximo)
		end
	if (@opcion = 1)
		begin
			select idInventario, idProducto, idSucursal, cantidad, minimo, maximo
			from Inventario where idInventario = @idInventario;
		end
	if (@opcion = 2)
		begin
			update Inventario 
			set idProducto = ISNULL(@idProducto,idProducto),
				idSucursal = ISNULL(@idSucursal,idSucursal),
				cantidad = ISNULL(@cantidad,cantidad),
				minimo = ISNULL(@minimo,minimo),
				maximo = ISNULL(@maximo,maximo)
			where idInventario = @idInventario;
		end
END
GO 

-- CRUD	Producto
-- drop procedure CRUDproducto;
go
CREATE PROCEDURE CRUDproducto @opcion int, @idProducto int, @idCategoria int, @nombre varchar(50), 
							 @descripcion varchar(150), @precio money 
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idCategoria is null or @nombre is null or @descripcion is null or 
					   @precio is null ))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idCategoria is not null and (select count(idCategoria) from Categoria 
									  where idCategoria=@idCategoria)=0)
		begin
            set @error=3; set @errorMsg='El id de la categoria debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Producto(idCategoria, nombre, descripcion, precio) 
			values (@idCategoria, @nombre, @descripcion, @precio)
		end
	if (@opcion = 1)
		begin
			select idProducto, idCategoria, nombre, descripcion, precio
			from Producto where idProducto = @idProducto;
		end
	if (@opcion = 2)
		begin
			update Producto 
			set idCategoria = ISNULL(@idCategoria,idCategoria),
				nombre = ISNULL(@nombre,nombre),
				descripcion = ISNULL(@descripcion,descripcion),
				precio = ISNULL(@precio,precio)
			where idProducto = @idProducto;
		end
END
GO 

-- CRUD	Pedido
-- drop procedure CRUDpedido;
go
CREATE PROCEDURE CRUDpedido @opcion int, @idPedido int, @idSucursal  int, @idProveedor int, 
							@idEstado int, @idProducto int, @fechaSolicitud datetime, 
							@fechaRecibido datetime, @cantidad int  
							with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idSucursal  is null or @idProveedor is null or 
					   @idEstado is null or @idProducto is null or @fechaSolicitud is null or
					   @fechaRecibido is null or @cantidad is null))
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
	if (@idEstado is not null and (select count(idEstado) from Estado 
									  where idEstado=@idEstado)=0)
		begin
            set @error=4; set @errorMsg='El id del estado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idProducto is not null and (select count(idProducto) from Producto 
									  where idProducto=@idProducto)=0)
		begin
            set @error=5; set @errorMsg='El id del producto debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idProducto is not null and ([dbo].[validarProovedor](@idProveedor)) = 0)
		begin
            set @error=5; set @errorMsg='El id del proveedor debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Pedido(idSucursal, idProveedor, idEstado, idProducto, fechaSolicitud,
								fechaRecibido, cantidad) 
			values (@idSucursal, @idProveedor, @idEstado, @idProducto, @fechaSolicitud,
					@fechaRecibido, @cantidad)
		end
	if (@opcion = 1)
		begin
			select idPedido, idSucursal, idProveedor, idEstado, idProducto, fechaSolicitud,
				   fechaRecibido, cantidad
			from Pedido where idPedido = @idPedido;
		end
	if (@opcion = 2)
		begin
			update Pedido 
			set idSucursal = ISNULL(@idSucursal,idSucursal),
				idProveedor = ISNULL(@idProveedor,idProveedor),
				idEstado = ISNULL(@idEstado,idEstado),
				idProducto = ISNULL(@idProducto,idProducto),
				fechaSolicitud = ISNULL(@fechaSolicitud,fechaSolicitud),
				fechaRecibido = ISNULL(@fechaRecibido,fechaRecibido),
				cantidad = ISNULL(@cantidad,cantidad)
			where idPedido = @idPedido;
		end
	if (@opcion = 3)
		begin
			update Pedido 
			set idEstado = 2
			where idPedido = @idPedido;
		end
END
GO 

-- CRUD Departamento
-- drop procedure CRUDdepartamento;
go
CREATE PROCEDURE CRUDdepartamento @opcion int, @idDepartamento int, @nombreDepartamento varchar(25)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombreDepartamento is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Departamento (nombreDepartamento) values (@nombreDepartamento)
		end
	if (@opcion = 1)
		begin
			select idDepartamento, nombreDepartamento
			from Departamento where idDepartamento = @idDepartamento;
		end
	if (@opcion = 2)
		begin
			update Departamento 
			set nombreDepartamento = ISNULL(@nombreDepartamento,nombreDepartamento)
			where idDepartamento = @idDepartamento;
		end
END
GO

-- CRUD M�todo de Pago
-- drop procedure CRUDmetodopago;
go
CREATE PROCEDURE CRUDmetodopago @opcion int, @idMetodoPago int, @nombreMetodoPago varchar(100)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombreMetodoPago is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into MetodoPago (nombreMetodoPago) values (@nombreMetodoPago)
		end
	if (@opcion = 1)
		begin
			select idMetodoPago, nombreMetodoPago
			from MetodoPago where idMetodoPago = @idMetodoPago;
		end
	if (@opcion = 2)
		begin
			update MetodoPago 
			set nombreMetodoPago = ISNULL(@nombreMetodoPago,nombreMetodoPago)
			where idMetodoPago = @idMetodoPago;
		end
END
GO

-- CRUD Puesto
-- drop procedure CRUDpuesto;
go
CREATE PROCEDURE CRUDpuesto @opcion int, @idPuesto int, @idDepartamento int, 
							@nombrePuesto varchar(100), @salario money
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idDepartamento is null or @nombrePuesto is null or @salario is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idDepartamento is not null and (select count(idDepartamento) from Departamento 
									  where idDepartamento=@idDepartamento)=0)
		begin
            set @error=3; set @errorMsg='El id del departamento debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Puesto (idDepartamento, nombrePuesto, salario) 
			values (@idDepartamento, @nombrePuesto, @salario)
		end
	if (@opcion = 1)
		begin
			select idPuesto, idDepartamento, nombrePuesto, salario
			from Puesto where idPuesto = @idPuesto;
		end
	if (@opcion = 2)
		begin
			update Puesto 
			set idDepartamento = ISNULL(@idDepartamento,idDepartamento),
				nombrePuesto = ISNULL(@nombrePuesto,nombrePuesto),
				salario = ISNULL(@salario,salario)
			where idPuesto = @idPuesto;
		end
END
GO

-- CRUD Empleado
-- drop procedure CRUDempleado;
go
CREATE PROCEDURE CRUDempleado @opcion int, @idEmpleado int, @idPuesto int, @idSucursal int, 
							  @idEstado int, @cedula bigint, @nombreEmpleado varchar(100), 
							  @apellido1 varchar(100), @apellido2 varchar(100), 
							  @fechaContratacion smalldatetime, @fechaNacimiento date, 
							  @correo varchar(50), @foto varbinary(max)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idPuesto is null or @idSucursal is null or @idEstado is null or 
					   @cedula is null or @nombreEmpleado is null or @apellido1 is null or
					   @apellido2 is null or @fechaContratacion is null or 
					   @fechaNacimiento is null or @correo is null or @foto is null ))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idPuesto is not null and (select count(idPuesto) from Puesto 
									  where idPuesto=@idPuesto)=0)
		begin
            set @error=3; set @errorMsg='El id del puesto debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idSucursal is not null and (select count(idSucursal) from Sucursal 
									  where idSucursal=@idSucursal)=0)
		begin
            set @error=3; set @errorMsg='El id del departamento debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idEstado is not null and (select count(idEstado) from Estado 
									  where idEstado=@idEstado)=0)
		begin
            set @error=3; set @errorMsg='El id del departamento debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Empleado (idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, 
								  apellido1, apellido2, fechaContratacion, fechaNacimiento, correo, foto) 
			values (@idPuesto, @idSucursal, @idEstado, @cedula, @nombreEmpleado, @apellido1,
					@apellido2, @fechaContratacion, @fechaNacimiento, @correo, @foto)
		end
	if (@opcion = 1)
		begin
			select idEmpleado, idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
				   apellido2, fechaContratacion, fechaNacimiento, correo, foto
			from Empleado where idEmpleado = @idEmpleado;
		end
	if (@opcion = 2)
		begin
			update Empleado 
			set idPuesto = ISNULL(@idPuesto,idPuesto),
				idSucursal = ISNULL(@idSucursal,idSucursal),
				idEstado = ISNULL(@idEstado,idEstado),
				cedula = ISNULL(@cedula,cedula),
				nombreEmpleado = ISNULL(@nombreEmpleado,nombreEmpleado),
				apellido1 = ISNULL(@apellido1,apellido1),
				apellido2 = ISNULL(@apellido2,apellido2),
				fechaContratacion = ISNULL(@fechaContratacion,fechaContratacion),
				fechaNacimiento = ISNULL(@fechaNacimiento,fechaNacimiento),
				correo = ISNULL(@correo,correo),
				foto = ISNULL(@foto,foto)
			where idEmpleado = @idEmpleado;
		end
	if (@opcion = 3)
		begin
			update Empleado 
			set idEstado = 2
			where idEmpleado = @idEmpleado;
		end
END
GO

-- CRUD Estado
-- drop procedure CRUDestado;
go
CREATE PROCEDURE CRUDestado @opcion int, @idEstado int, @nombre varchar(50) with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombre is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Estado (nombre) values (@nombre)
		end
	if (@opcion = 1)
		begin
			select idEstado, nombre
			from Estado where idEstado = @idEstado;
		end
	if (@opcion = 2)
		begin
			update Estado 
			set nombre = ISNULL(@nombre,nombre)
			where idEstado = @idEstado;
		end
END
GO

-- CRUD Bono
-- drop procedure CRUDbono;
go
CREATE PROCEDURE CRUDbono @opcion int, @idBono int, @idEmpleado int, @cantidadBono money, 
						  @fechaBono smalldatetime 
						  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idEmpleado is null or @cantidadBono is null or @fechaBono is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idEmpleado is not null and (select count(idEmpleado) from Empleado 
									  where idEmpleado=@idEmpleado)=0)
		begin
            set @error=3; set @errorMsg='El id del empleado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Bono (idEmpleado, cantidadBono,fechaBono) 
					  values (@idEmpleado, @cantidadBono, @fechaBono)
		end
	if (@opcion = 1)
		begin
			select idBono, idEmpleado, cantidadBono,fechaBono
			from Bono where idBono = @idBono;
		end
	if (@opcion = 2)
		begin
			update Bono 
			set idEmpleado = ISNULL(@idEmpleado,idEmpleado),
			    cantidadBono = ISNULL(@cantidadBono,cantidadBono),
			    fechaBono = ISNULL(@fechaBono,fechaBono)
			where idBono = @idBono;
		end
END
GO

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
			set idEstado = 2
			where idCliente = @idCliente;
		end
END
GO 

-- CRUD Factura
-- drop procedure CRUDfactura;
go
CREATE PROCEDURE CRUDfactura @opcion int, @idFactura int, @idSucursal int, @idCliente  int,
				 @idEmpleado int, @idMetodoPago int, @total money, @fechaFactura datetime
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
					   @idMetodoPago is null or @total is null or @fechaFactura is null))
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
			values (@idSucursal, @idCliente, @idEmpleado, @idMetodoPago, @total, @fechaFactura)
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
				total = ISNULL(@total,total),
				fechaFactura = ISNULL(@fechaFactura,fechaFactura)
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

--Procedimiento Ortorgar Bono a Empleado
--FALTA PROBARLO
CREATE OR ALTER PROCEDURE OtorgarBono WITH ENCRYPTION AS
BEGIN
	/*
	La empresa otorga un bono a los facturadores que hayan facturado mas de 1000 productos
	en una semana.
	Se debe conectar a un Job que lo ejecute cada semana a la misma hora, ejemplo todos los 
	viernes a las 5pm.
	*/
	

	--Inserta bono de 100 dolares en la fecha actual a todos los empleados que hayan vendido mas de mil productos en la semana
	INSERT INTO Bono(idEmpleado,cantidadBono,fechaBono)  
		
		SELECT idEmpleado,100,GETDATE() from (
			SELECT F.idEmpleado, SUM(DISTINCT D.idUnidad) as cantidadProductosVendidos FROM Factura AS F 
				inner join Empleado AS E ON E.idEmpleado = F.idEmpleado --De factura salta a empleado para ver que si este activo y sea facturador
				inner join Estado AS Es ON Es.idEstado = E.idEstado	--De empleado salta a estado para ver que el empleado este activo
				inner join Puesto AS P ON P.idPuesto = E.idPuesto	--De empleado salta a puesto para ver que el empleado sea facturador
				inner join Detalle AS D on D.idFactura = F.idFactura --De factura salta a detalle para contar los productos vendidos
				WHERE 
					fechaFactura >= DATEADD(day, -7, GETDATE()) --Le resta 7 dias a la fecha actual. Es decir una semana entera. 
					AND P.idPuesto = 1 --Puesto 1 es Facturador
					AND Es.idEstado = 2 --Estado 2 es Activo.	
			
				GROUP BY F.idEmpleado --Agrupa por empleado
				HAVING SUM(DISTINCT D.idUnidad)>=1000 --Filtra las agrupaciones que tengan mas de 1000 ventas en la semana.
			) empleadosYcantidadProductosVendidos; 
END
GO



--Procedimiento Obtener Informacion de Bonos
--FALTA PROBARLO
CREATE OR ALTER PROCEDURE ObtenerInfoBono @idEmpleado INT,
								@fechaInicio SMALLDATETIME,
								@fechaFin SMALLDATETIME,
								@idSucursal INT,
								@idPais INT
								WITH ENCRYPTION AS
BEGIN
	/*
		Se debe poder obtener informaci�n sobre los bonos recibidos por empleado, fechas,
		succursal y/o pais.
		Si todos los parametros son nulos, muestra todos los bonos de todos los empleados.
	*/

		SELECT E.idEmpleado as idEmpleado,B.fechaBono,S.nombreSucursal as nombreSucursal,
				Pa.nombrePais as pais FROM Bono AS B

		inner join Empleado AS E ON E.idEmpleado = B.idEmpleado --Salta de bono a empleado
		inner join Sucursal AS S ON S.idSucursal = E.idSucursal	--Salta de Empleado a Sucursal
		inner join Ubicacion AS U ON U.idUbicacion = S.idUbicacion --Salta de Sucursal a Ubicacion
		inner join Distrito AS D ON D.idDistrito = U.idDistrito	--Salta de Ubicacion a Distrito
		inner join Canton AS C ON C.idCanton = D.idCanton	--Salta de Distrito a Canton
		inner join Provincia AS P ON P.idProvincia = C.idProvincia --Salta de Canton a Provincia
		inner join Pais AS Pa ON Pa.idPais = P.idPais --Salta de Provincia a Pais

		WHERE E.idEmpleado = ISNULL(@idEmpleado,E.idEmpleado) --Filtra por empleado
			AND B.fechaBono>= ISNULL(@fechaInicio,B.fechaBono) --Filtra por fecha inicio
			AND B.fechaBono<= ISNULL(@fechaFin,B.fechaBono) --Filtra por fecha fin
			AND S.idSucursal = ISNULL(@idSucursal,S.idSucursal) --Filtra por sucursal
			AND Pa.idPais = ISNULL(@idPais,Pa.idPais) --Filtra por pais

END
GO


--Procedimiento para ReOrdenar Productos - El trigger se ve en la tabla con la que se dispara.
CREATE or alter TRIGGER reOrdenarProducto ON Inventario AFTER UPDATE AS
BEGIN
	-- select * from inserted
	Declare @idProveedor INT,
	@idProducto INT,
	@maximo INT,
	@cantidad INT,
	@minimo INT,
	@idSucursal INT
	select  @idProducto = idProducto, @idSucursal = idSucursal, @maximo = maximo,
			@minimo = minimo, @cantidad = cantidad
			from inserted;
	
    if @cantidad <= @minimo
	
		set @idProveedor = (SELECT proveedor.idProveedor FROM (select TOP 1 min(ProXPru.costoProducto) as masBarato, ProXPru.idProveedor from 
						[POSTGRESQL].[Proveedores].[dbo].[proveedorxproducto] as ProXPru
						inner join [POSTGRESQL].[Proveedores].[dbo].[proveedor] as Pro on [Pro].idproveedor = [ProXPru].idproveedor
						where [ProXPru].idProducto = @idProducto
						AND [ProXPru].cantidadDisponible >= (@maximo - @cantidad)
						AND [Pro].estado = 2
						group by [ProXPru].idProveedor) as proveedor );
		INSERT INTO Pedido (idSucursal,idProveedor,idEstado,idProducto,fechaSolicitud,cantidad)
		VALUES (@idSucursal,@idProveedor,3,@idProducto,GETDATE(),(@maximo - @cantidad));
END
GO


--Consultar Sucursales
CREATE OR ALTER PROCEDURE consultarInfoSucursales WITH ENCRYPTION AS
BEGIN
		--Procedimiento para obtener informacion de todas las sucursales de este pais.

		--Devuelve idSucursal, ubicacionG, idAdministrador, nombreSucursal
		declare @latitud float
		declare @longitud float




		SELECT idSucursal,ubicacionG.Lat as latitud,ubicacionG.Long as longitud,idAdministrador,nombreSucursal from Sucursal;

END
GO

--Consultar horarios de sucursal
CREATE OR ALTER PROCEDURE consultarHorariosXSucursal @idSucursal INT WITH ENCRYPTION AS
BEGIN
	declare @error int = 0,@errorMsg varchar(100);
	if @idSucursal is Null
		begin
			
			set @error=1; set @errorMsg='Debe ingresar el @idSucursal. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	select H.dia,H.horaApertura,H.horaCierre from Horario as H inner join HorarioXSucursal 
	as HxS on HxS.idHorario = H.idHorario where HxS.idSucursal = @idSucursal ;

END
GO

--Consultar nombre,apellido y correo de empleado por idEmpleado.
CREATE OR ALTER PROCEDURE consultarEmpleadoAdmin @idEmpleado INT WITH ENCRYPTION AS
BEGIN
	declare @error int = 0,@errorMsg varchar(100);
	if @idEmpleado is Null
		begin
			set @error=1; set @errorMsg='Debe ingresar el @idEmpleado. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	select nombreEmpleado,apellido1,correo from Empleado where idEmpleado=@idEmpleado;
END
GO


--Obtiene la distancia (en kilometros) entre dos puntos geograficos.
--Recibe la latitud y longitud de ambos puntos.
CREATE OR ALTER PROCEDURE calcularDistanciaEntrePuntos @lat1 float=NUll,@lng1 float=NUll,
													   @lat2 float=NULL,@lng2 float=NULL WITH ENCRYPTION AS
BEGIN
	declare @error int = 0,@errorMsg varchar(100);
	if (@lat1 IS NULL) OR (@lng1 IS NULL) OR (@lat2 IS NULL) OR (@lat2 IS NULL)
		begin
			set @error=1; set @errorMsg='Debe ingresar @lat1,@lng1,@lat2,@lng2 %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	SELECT geography::Point(@lat1, @lng1, 4326).STDistance(geography::Point(@lat2, @lng2, 4326))/1000 as kilometros;  


END
GO




/*
Estado:
1 - Inactivo
2 - Activo

Puesto:
1 - Facturador

Moneda:
1 - Dolar

*/


--Procedimiento Facturar
GO
CREATE PROCEDURE Facturar @idFactura int WITH ENCRYPTION AS
BEGIN
    IF (SELECT count(*) FROM Factura WHERE Factura.idFactura = @idFactura) = 0
        print 'El id de la factura no existe';
    ElSE
    DECLARE @idDetalle INT,
    @montoTemp INT = 0,
    @idProducto INT,
    @idSucursal INT;
    DECLARE detalleCursor -- Para recorrer los detalles
        CURSOR for 
            SELECT idDetalle
            FROM Detalle	
            WHERE Detalle.idFactura = @idFactura;
        
            begin transaction;

            OPEN detalleCursor;
            FETCH NEXT FROM detalleCursor INTO @idDetalle;
			WHILE @@fetch_status = 0
            begin
                -- vamos sumando los subtotales
				SET @montoTemp = @montoTemp + (SELECT subTotal FROM Detalle
				WHERE Detalle.idDetalle = @idDetalle); 
				--vamos cambiando el estado de las unidades a vendido
                UPDATE Unidad
                SET idEstado = 5
                where Unidad.idUnidad = (SELECT idUnidad FROM Detalle WHERE Detalle.idDetalle = @idDetalle)
                --conseguimos idProducto y idSucursal para actualizar detalle
                SELECT @idProducto = Pedido.idProducto, @idSucursal = Pedido.idSucursal
                FROM Detalle 
                INNER JOIN Unidad ON Unidad.idUnidad = Detalle.idUnidad
                INNER JOIN LoteProducto ON LoteProducto.idLote = Unidad.idLote
	            INNER JOIN Pedido ON Pedido.idPedido = LoteProducto.idPedido 
                WHERE Detalle.idDetalle = @idDetalle
                --vamos cambiando la cantidad del inventario
                UPDATE Inventario
                SET cantidad = Inventario.cantidad - 1
                where idProducto = @idProducto and idSucursal = @idSucursal
                --Pasamos al siguiente idDetalle
                FETCH NEXT FROM detalleCursor INTO @idDetalle;
            end;
            CLOSE detalleCursor;
			DEALLOCATE detalleCursor;
            --annadimos costo de envio si tiene
            SET @montoTemp = @montoTemp + isnull((SELECT Envio.costoEnvio FROM Envio
			WHERE Envio.idFactura = @idFactura), 0.0) 
             --actualizamos el monto total de la factura
            UPDATE Factura
            SET total = @montoTemp
            WHERE Factura.idFactura = @idFactura;

            commit;
END
GO

--Procedimiento getIdProveedores
GO
CREATE  PROCEDURE getIdProveedores @nombreProducto varchar(20),
                                 @nombreProveedor varchar(20),
                                 @idPais INT,
                                 @idProvincia int,
                                 @idCanton int,
                                 @idDistrito int,
                                 @idUbicacion int
                                WITH ENCRYPTION AS
BEGIN
	SELECT Prov.idProveedor
    FROM [POSTGRESQL].[Proveedores].[dbo].[proveedorxproducto] AS PXP
    INNER JOIN Producto ON Producto.idProducto = PXP.idProducto --Obtener producto
    INNER JOIN [POSTGRESQL].[Proveedores].[dbo].[proveedor] as Prov --Optener poveedor
    ON Prov.idProveedor = PXP.idProveedor
    INNER JOIN Ubicacion ON Ubicacion.idUbicacion = Prov.idUbicacion
    INNER JOIN Distrito ON Distrito.idDistrito = Ubicacion.idDistrito --Obtener distrito
    INNER JOIN Canton ON Canton.idCanton = Distrito.idCanton --Obtener canton
    INNER JOIN Provincia ON Provincia.idProvincia = Canton.idProvincia --Obtener provincia
    INNER JOIN Pais ON Pais.idPais = Provincia.idPais --Obtener pais
	WHERE Prov.nombreProveedor = isnull(@nombreProveedor, Prov.nombreProveedor) and
    Prov.estado = 2 AND --Proveedor activo
    Producto.nombre = isnull(@nombreProducto, Producto.nombre) AND
    Ubicacion.idUbicacion = isnull(@idUbicacion, Ubicacion.idUbicacion) AND
    Distrito.idDistrito = isnull(@idDistrito, Distrito.idDistrito) AND
    Canton.idCanton = isnull(@idCanton, Canton.idCanton) AND
    Provincia.idProvincia = isnull(@idProvincia, Provincia.idProvincia) AND
    Pais.idPais = isnull(@idPais, Pais.idPais) ;
end
go

--Procedimiento informacion de precios de los proveedores
GO
CREATE PROCEDURE getCatalogoProv @idProveedor INT,
                                 @idProducto INT
                                WITH ENCRYPTION AS
BEGIN
	SELECT Producto.idProducto, Producto.nombre as nombreProducto, PXP.costoProducto, Prov.idProveedor, Prov.nombreProveedor
    FROM [POSTGRESQL].[Proveedores].[dbo].[proveedorxproducto] AS PXP
    INNER JOIN Producto ON Producto.idProducto = PXP.idProducto
    INNER JOIN [POSTGRESQL].[Proveedores].[dbo].[proveedor] as Prov
    ON Prov.idProveedor = PXP.idProveedor
	WHERE PXP.idProveedor = isnull(@idProveedor, PXP.idProveedor) and
    Prov.estado = 2 --Proveedor activo
    AND PXP.idProducto = isnull(@idProducto, PXP.idProducto);
end
go


--Procedimiento de reportes para ver productos mas vendidos
GO
CREATE PROCEDURE ReportesProductos @idPais INT,
                        @idProducto INT,
                        @idSucursal INT,
                        @idProveedor INT,
                        @fechaInc date,
                        @fechaFin date
                        WITH ENCRYPTION AS
BEGIN
	SELECT count(Detalle.idDetalle) as vendidos, Producto.nombre,
    Sucursal.nombreSucursal, Prov.nombreProveedor,
    Pais.nombrePais, Factura.fechaFactura
    FROM Detalle
    INNER JOIN Unidad ON Unidad.idUnidad = Detalle.idUnidad
    INNER JOIN LoteProducto ON LoteProducto.idLote = Unidad.idLote
	INNER JOIN Pedido ON Pedido.idPedido = LoteProducto.idPedido 
    INNER JOIN Producto ON Producto.idProducto = Pedido.idProducto --Para obtener nombre de producto    
    INNER JOIN [POSTGRESQL].[Proveedores].[dbo].[proveedor] as Prov 
    ON Prov.idProveedor = Pedido.idProveedor --Para obtener nombreProveedor
    INNER JOIN Factura ON Factura.idFactura = Detalle.idFactura --Para obtener la fechaFactura
    INNER JOIN Sucursal ON  Sucursal.idSucursal = Pedido.idSucursal --Para obtener el nombreSucursal
    inner join Ubicacion ON Ubicacion.idUbicacion = Sucursal.idUbicacion
    inner join Distrito ON Distrito.idDistrito = Ubicacion.idDistrito
    inner join Canton ON Canton.idCanton = Distrito.idCanton
    inner join Provincia ON Provincia.idProvincia = Canton.idProvincia
    inner join Pais ON Pais.idPais = Provincia.idPais --Para obtener el nombrePais
	WHERE Pais.idPais = isnull(@idPais, Pais.idPais) and
    Producto.idProducto = isnull(@idProducto, Producto.idProducto) and
    Sucursal.idSucursal = isnull(@idSucursal, Sucursal.idSucursal) and
    Prov.idProveedor = isnull(@idProveedor, Prov.idProveedor) and
    Prov.estado = 2 and --Proveedor activo
    Factura.fechaFactura BETWEEN isnull(@fechaInc, Factura.fechaFactura) and
    isnull(@fechaFin, Factura.fechaFactura)
    GROUP BY Producto.nombre, Sucursal.nombreSucursal, Prov.nombreProveedor,
    Pais.nombrePais, Factura.fechaFactura
    ORDER BY vendidos DESC ;
END
GO

--Procedimiento de reportes para ver Clientes mas frecuentes
GO
CREATE PROCEDURE ReportesClientes @idPais INT,
                        @idProducto INT,
                        @idSucursal INT,
                        @idProveedor INT,
                        @fechaInc date,
                        @fechaFin date
                        WITH ENCRYPTION AS
BEGIN
	SELECT count(Factura.idFactura) as cantFacturas, CONCAT(Cliente.nombre,' ',Cliente.apellido1,' ',
    Cliente.apellido2) as nombreCompleto, Producto.nombre as nombreProducto,
    Sucursal.nombreSucursal, Prov.nombreProveedor,
    Pais.nombrePais, Factura.fechaFactura
    FROM Factura
    INNER JOIN Cliente ON Cliente.idCliente = Factura.idCliente --Para obtener nombre del cliente  
    INNER JOIN Detalle ON Detalle.idFactura = Factura.idFactura
    INNER JOIN Unidad ON Unidad.idUnidad = Detalle.idUnidad
    INNER JOIN LoteProducto ON LoteProducto.idLote = Unidad.idLote
	INNER JOIN Pedido ON Pedido.idPedido = LoteProducto.idPedido 
    INNER JOIN Producto ON Producto.idProducto = Pedido.idProducto --Para obtener nombre de producto    
    INNER JOIN [POSTGRESQL].[Proveedores].[dbo].[proveedor] as Prov 
    ON Prov.idProveedor = Pedido.idProveedor --Para obtener nombreProveedor
    INNER JOIN Sucursal ON  Sucursal.idSucursal = Pedido.idSucursal --Para obtener el nombreSucursal
    inner join Ubicacion ON Ubicacion.idUbicacion = Sucursal.idUbicacion
    inner join Distrito ON Distrito.idDistrito = Ubicacion.idDistrito
    inner join Canton ON Canton.idCanton = Distrito.idCanton
    inner join Provincia ON Provincia.idProvincia = Canton.idProvincia
    inner join Pais ON Pais.idPais = Provincia.idPais --Para obtener nombrePais
	WHERE Pais.idPais = isnull(@idPais, Pais.idPais) and
    Producto.idProducto = isnull(@idProducto, Producto.idProducto) and
    Sucursal.idSucursal = isnull(@idSucursal, Sucursal.idSucursal) and
    Prov.idProveedor = isnull(@idProveedor, Prov.idProveedor) and
    Prov.estado = 2 and --Proveedor activo
    Factura.fechaFactura BETWEEN isnull(@fechaInc, Factura.fechaFactura) and
    isnull(@fechaFin, Factura.fechaFactura)
    GROUP BY Cliente.nombre,Cliente.apellido1,Cliente.apellido2, Producto.nombre, Sucursal.nombreSucursal, Prov.nombreProveedor,
    Pais.nombrePais, Factura.fechaFactura
    ORDER BY cantFacturas DESC ;
END
GO

--Procedimiento de reportes para ver productos expirados
GO
CREATE PROCEDURE ReportesVencimientos @idPais INT,
                        @idProducto INT,
                        @idSucursal INT,
                        @idProveedor INT,
                        @fechaInc date,
                        @fechaFin date
                        WITH ENCRYPTION AS
BEGIN
	SELECT count(Unidad.idUnidad) as vencidos, Producto.nombre,
    Sucursal.nombreSucursal, Prov.nombreProveedor,
    Pais.nombrePais, Pedido.fechaRecibido
    FROM Unidad
    INNER JOIN LoteProducto ON LoteProducto.idLote = Unidad.idLote
	INNER JOIN Pedido ON Pedido.idPedido = LoteProducto.idPedido -- Para obtener la fecha de recibido
    INNER JOIN Producto ON Producto.idProducto = Pedido.idProducto --Para obtener nombre de producto    
    INNER JOIN [POSTGRESQL].[Proveedores].[dbo].[proveedor] as Prov 
    ON Prov.idProveedor = Pedido.idProveedor --Para obtener nombreProveedor
    INNER JOIN Sucursal ON  Sucursal.idSucursal = Pedido.idSucursal --Para obtener el nombreSucursal
    inner join Ubicacion ON Ubicacion.idUbicacion = Sucursal.idUbicacion
    inner join Distrito ON Distrito.idDistrito = Ubicacion.idDistrito
    inner join Canton ON Canton.idCanton = Distrito.idCanton
    inner join Provincia ON Provincia.idProvincia = Canton.idProvincia
    inner join Pais ON Pais.idPais = Provincia.idPais --Para obtener el nombrePais
	WHERE Pais.idPais = isnull(@idPais, Pais.idPais) and
    Producto.idProducto = isnull(@idProducto, Producto.idProducto) and
    Unidad.idEstado = 4 and --Producto vencido
    Sucursal.idSucursal = isnull(@idSucursal, Sucursal.idSucursal) and
    Prov.idProveedor = isnull(@idProveedor, Prov.idProveedor) and
    Prov.estado = 2 and --Proveedor activo
    Pedido.fechaRecibido BETWEEN isnull(@fechaInc, Pedido.fechaRecibido) and
    isnull(@fechaFin, Pedido.fechaRecibido)
    GROUP BY Producto.nombre, Sucursal.nombreSucursal, Prov.nombreProveedor,
    Pais.nombrePais, Pedido.fechaRecibido
    ORDER BY vencidos DESC ;
END
GO

--Proceso para conseguir el id del usuario de un cliente segun su correo
GO
CREATE PROCEDURE getUsuarioCliente @correo varchar(50) WITH ENCRYPTION AS
BEGIN
	SELECT UsuarioCliente.idUsuarioCliente 
    FROM Cliente
    inner join UsuarioCliente on UsuarioCliente.idCliente = Cliente.idCliente
    WHERE Cliente.correo = @correo;
END
GO

--Proceso para conseguir el id del cliente segun su correo
GO
CREATE PROCEDURE getIdCliente @correo varchar(50) WITH ENCRYPTION AS
BEGIN
	SELECT Cliente.idCliente 
    FROM Cliente
    WHERE Cliente.correo = @correo;
END
GO

--Proceso para conseguir el id del usuario de un empleado segun su correo
GO
CREATE PROCEDURE getUsuarioEmpleado @correo varchar(50) WITH ENCRYPTION AS
BEGIN
	SELECT UsuarioEmpleado.idUsuarioEmpleado
    FROM Empleado
    inner join UsuarioEmpleado on UsuarioEmpleado.idEmpleado = Empleado.idEmpleado
    WHERE Empleado.correo = @correo;
END
GO

--Proceso para conseguir el id del empleado segun su correo
GO
CREATE PROCEDURE getIdEmpleado @correo varchar(50) WITH ENCRYPTION AS
BEGIN
	SELECT Empleado.idEmpleado 
    FROM Empleado
    WHERE Empleado.correo = @correo;
END
GO

--Proceso para conseguir el id del empleado segun su correo
GO
CREATE or alter PROCEDURE getSucursal @nombrePais varchar(50), @idProvincia int, @idCanton int, @idDistrito int WITH ENCRYPTION AS
BEGIN
	SELECT idSucursal, nombreSucursal 
    FROM Sucursal
    inner join Ubicacion ON Ubicacion.idUbicacion = Sucursal.idUbicacion
    inner join Distrito ON Distrito.idDistrito = Ubicacion.idDistrito
    inner join Canton ON Canton.idCanton = Distrito.idCanton
    inner join Provincia ON Provincia.idProvincia = Canton.idProvincia
    inner join Pais ON Pais.idPais = Provincia.idPais
    WHERE Pais.nombrePais = isnull(@nombrePais, Pais.nombrePais) and
    Provincia.idProvincia = isnull(@idProvincia, Provincia.idProvincia) and
    Canton.idCanton = isnull(@idCanton, Canton.idCanton) and
    Distrito.idDistrito = isnull(@idDistrito, Distrito.idDistrito);
END
GO

--Proceso para conseguir el la cantidad disponible en un inventario
GO
CREATE or alter PROCEDURE getCantidadInventario @idProducto INT, @idSucursal int WITH ENCRYPTION AS
BEGIN
	SELECT Inventario.cantidad, Inventario.idProducto, Inventario.idSucursal
    FROM Inventario
    WHERE Inventario.idProducto = isnull(@idProducto, Inventario.idProducto) and
    Inventario.idSucursal = isnull(@idSucursal, Inventario.idSucursal);
END
GO
 
--Calcular el subtotal del detalle
GO
CREATE PROCEDURE calcularSubtotal @idUnidad int WITH ENCRYPTION AS
BEGIN
    DECLARE @precio INT, @Descuentos INT, @Impuestos INT
	
	SELECT @precio = Producto.precio, @Descuentos = Descuento.porcentaje,
    @Impuestos = SUM(Impuesto.porcentaje)
    FROM Unidad
    inner join LoteProducto on LoteProducto.idLote = Unidad.idLote
    inner join Descuento on Descuento.idLote = LoteProducto.idLote --Obtenemos el descuento del producto
    inner join Pedido on Pedido.idPedido = LoteProducto.idPedido
    inner join Producto on Producto.idProducto = Pedido.idProducto --Obtenemos el precio del producto
    inner join ProductoxImpuesto on ProductoxImpuesto.idProducto = Pedido.idProducto
    inner join Impuesto on Impuesto.idImpuesto = ProductoxImpuesto.idImpuesto --Obtenemos el impuesto del producto
    WHERE Unidad.idUnidad = @idUnidad
	group by Producto.precio, Descuento.porcentaje;
    select (@precio -( @precio * @Descuentos) + @precio * @Impuestos) as subtotal;
END
GO

GO
CREATE or alter PROCEDURE getUnidadProducto @idProducto int WITH ENCRYPTION AS
BEGIN
    select unidad.idUnidad from unidad
    inner join LoteProducto on LoteProducto.idLote = Unidad.idLote
    inner join Pedido on Pedido.idPedido = LoteProducto.idPedido
    inner join Producto on Producto.idProducto = Pedido.idProducto --Obtenemos producto
    where Producto.idProducto = isnull(@idProducto,Producto.idProducto)
    and (unidad.idEstado = 3 or unidad.idEstado = 10)
END
GO

GO
CREATE or alter PROCEDURE getInfoDetalle @idFactura int WITH ENCRYPTION AS
BEGIN
    select producto.nombre, detalle.subTotal from detalle
    inner join Unidad on Unidad.idUnidad = detalle.idUnidad
    inner join LoteProducto on LoteProducto.idLote = Unidad.idLote
    inner join Pedido on Pedido.idPedido = LoteProducto.idPedido
    inner join Producto on Producto.idProducto = Pedido.idProducto --Obtenemos producto
    where Detalle.idFactura = isnull(@idFactura,Detalle.idFactura)
END
GO

--Trigger de Lote: Cambia el estado del pedido y modifica la cantidad del inventario
GO
CREATE or alter TRIGGER recibirLote ON LoteProducto AFTER INSERT AS
BEGIN
	
	Declare @idPedido INT,
    @idProducto INT,
    @idSucursal INT,
	@cantidad INT
	
	select @idPedido = inserted.idPedido, @cantidad = inserted.cantidad,
    @idProducto = Pedido.idProducto, @idSucursal = Pedido.idSucursal
    from inserted inner join Pedido on Pedido.idPedido = inserted.idPedido;
    
    update Pedido 
	set idEstado = 7, --Ponemos el pedido en estado recibidio
    fechaRecibido = getdate() --Asignamos fecha en que se recibio el pedido
	where idPedido = @idPedido; 

    update Inventario
    set cantidad = Inventario.cantidad + @cantidad --Aumentamos la cantidad de producto del inventario
    where idSucursal = @idSucursal and idProducto = @idProducto;
END
GO

--Trigger de crear Detalle: Debe de cambiar el estado de la unidad a reservado
GO
CREATE or alter TRIGGER crearDetalle ON Detalle AFTER INSERT AS
BEGIN
    --Cambiamos el estado de la unidad a reservado
    update Unidad 
	set idEstado = 9 
	where idUnidad = (select idUnidad from inserted); 
END
GO

--Trigger de borrar Detalle: Debe de cambiar el estado de la unidad a exhibiendo
GO
CREATE or alter TRIGGER crearDetalle ON Detalle AFTER DELETE AS
BEGIN
    --Cambiamos el estado de la unidad a exhibiendo
    update Unidad 
	set idEstado = 3
	where idUnidad = (select idUnidad from deleted); 
END
GO

-- Dados 2 ubicaciones, indique la distancia que hay entre ellos
-- drop procedure getDistance;

go
CREATE OR ALTER PROCEDURE getDistance @idUbicacion1 geography, @idUbicacion2 geography with encryption AS
BEGIN
	--Calcula la distancia entre las dos ubicaciones pasadas como argumentos.
    declare @error int,@errorMsg varchar(100);

	-- validacion
    if (@idUbicacion1 is null or @idUbicacion2 is null) 
		RAISERROR (@errorMsg,16,1,N' Error numero',1); 
	else
		begin
			SELECT @idUbicacion1.STDistance(@idUbicacion2);  
		end
END
GO


-- PedidoDomicilio 
-- drop procedure getSucursalCercanaExistencias;
go
CREATE OR ALTER PROCEDURE getSucursalCercanaExistencias @idUbicacion int, @idProducto int
											   with encryption AS
BEGIN
    declare @error int,@errorMsg varchar(100), @i int = 1, @idUbicacionSucursal int,
	@minDistance float = 1000000, @d float, @idSucursalCursor int, @SucursalCercanaFinal int;
	DECLARE getMin CURSOR FOR SELECT idUbicacion, idSucursal FROM Sucursal

	-- validacion
    if (@idUbicacion is null or (select count(idUbicacion) from Ubicacion 
								where idUbicacion=@idUbicacion)=0)
		begin
            set @error=2; set @errorMsg='La ubicacion debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idProducto is null or (select count(idProducto) from Producto 
								where idProducto=@idProducto)=0)
		begin
            set @error=2; set @errorMsg='El producto debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end 
	if (select sum(cantidad) from Inventario where idProducto=@idProducto)=0
		begin
            set @error=2; set @errorMsg='No hay del producto en ninguna sucursal. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end 

	OPEN getMin
	FETCH NEXT FROM getMin INTO @idUbicacionSucursal, @idSucursalCursor
	WHILE @@fetch_status = 0
	BEGIN
		execute getDistance @idUbicacion, @idUbicacionSucursal, @d output;
		if (select cantidad from Inventario where idProducto=@idProducto
											and idSucursal=@idSucursalCursor)>0 and
			@minDistance > @d 
			begin 
				set @minDistance = @d;
				set @SucursalCercanaFinal = @idSucursalCursor;
			end
		FETCH NEXT FROM getMin INTO @idUbicacionSucursal, @idSucursalCursor
	END
	CLOSE getMin
	DEALLOCATE getMin
	select @SucursalCercanaFinal;
END
GO

-- determinar si van a
-- expirer en una semana y se pone en descuento, si un producto ya ha expirado debe de
-- sacarlo del exhibidor

go
CREATE PROCEDURE ponerProductoEnDescuento @idLote int, @porcentaje float WITH ENCRYPTION AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
	if (@idLote is null or (select count(idLote) from LoteProducto where idLote=@idLote)=0)
		begin
            set @error=1; set @errorMsg='El id del lote  no puede ser nulo y debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@porcentaje < 0)
		begin
            set @error=2; set @errorMsg='El porcentaje debe ser positivo. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if DATEDIFF(week, getdate(), (select fechaExpiracion from LoteProducto where @idLote = idLote)) > 1 
		begin 
			set @error=3; set @errorMsg='El producto no va a expirar en una semana. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error);
		end
	-- opciones
	if @error = 0
		begin
			update Unidad set idEstado = 10 where idLote = @idLote; -- actualiza las unidades del lote
			insert into Descuento (idLote, porcentaje) values (@idLote, @porcentaje);
		end
END
GO

go
CREATE PROCEDURE sacarDeExhibidor @idLote int WITH ENCRYPTION AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
	if (@idLote is null or (select count(idLote) from LoteProducto where idLote=@idLote)=0)
		begin
            set @error=3; set @errorMsg='El id del lote  no puede ser nulo y debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if DATEDIFF(day, getdate(), (select fechaExpiracion from LoteProducto where @idLote = idLote)) > 0 
		begin 
			set @error=3; set @errorMsg='El producto no ha expirado. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error);
		end

	-- opciones
	update Unidad set idEstado = 4 where idLote = @idLote; -- actualiza las unidades del lote
END
GO

create procedure consultaEmpleado(@idSucursal int, @idPuesto int, @fechaContratacion date, @idEmpleado int )
as 
	
	select Empleado.cedula, Empleado.nombreEmpleado, empleado.apellido1, empleado.apellido2 ,
	Estado.nombre, Empleado.fechaNacimiento, Sucursal.nombreSucursal, Puesto.nombrePuesto
	from Empleado inner join Estado on Empleado.idEstado=Estado.idEstado
	inner join Sucursal on Empleado.idSucursal= Sucursal.idSucursal 
	inner join Puesto on Empleado.idPuesto = Puesto.idPuesto
	where idEmpleado = isnull(@idEmpleado, idEmpleado) and 
	Empleado.idSucursal = ISNULL(@idSucursal, Empleado.idSucursal) and
	Empleado.idPuesto = ISNULL(@idPuesto, Empleado.idPuesto) and
	Empleado.fechaContratacion= ISNULL(@fechaContratacion,Empleado.fechaContratacion);

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
	select sum(Envio.costoEnvio) as totalesEnvios , Sucursal.nombreSucursal, Factura.idCliente, Envio.fechaEnvio 
	from Factura  inner join Envio on Factura.idFactura=Envio.idFactura 
	inner join Sucursal on Factura.idSucursal= Sucursal.idSucursal
	where Envio.fechaEnvio between isnull(@fechaInicial,Envio.fechaEnvio) and isnull(@fechaFin, Envio.fechaEnvio) 
	and Factura.idSucursal=isnull(@idSucursal, Factura.idSucursal) and Factura.idCliente=isnull(@idCliente,Factura.idCliente)
	group by  Sucursal.nombreSucursal, Factura.idCliente, Envio.fechaEnvio ;

go

create procedure infoPrecioProductoSucursal(@idProducto int, @nombre varchar(50))
as
	select Producto.nombre, Producto.precio from Producto 
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


--Procedimiento buscarProducto
GO
CREATE PROCEDURE buscarProducto @idSucursal INT,
                                 @str varchar(50)
                                WITH ENCRYPTION AS
BEGIN
	select Producto.idProducto, nombre,descripcion,precio from Producto inner join 
								Inventario on Inventario.idProducto = Producto.idProducto
                                where nombre like @str 
								and Inventario.idSucursal = @idSucursal;
end
go


-- Procedimiento que obtiene las ganancias netas
-- Se debe poder obtener informacion sobre ganancias netas igualmente por fechas, país,
-- sucursales y/o categoría de productos.

GO
CREATE PROCEDURE getGananciasNetas @fechaInicio date, @fechaFinal date, @idPais int, @idSucursal int,
								   @idCategoria int
								   WITH ENCRYPTION AS
BEGIN
	declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    IF (@fechaInicio is not null and @fechaFinal is not null and @fechaFinal < @fechaInicio)
	begin
		set @error=1; set @errorMsg='El rango de las fechas no es válido. %s %d';
		RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
	end
	IF (@idPais is not null and (select count(idPais) from Pais where idPais = @idPais)=0 )
	begin
		set @error=2; set @errorMsg='El idPais indicado no existe. %s %d';
		RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
	end
	
	IF (@idSucursal is not null and (select count(idSucursal) from Sucursal 
									 where idSucursal = @idSucursal)=0)
	begin
		set @error=3; set @errorMsg='El idSucursal indicado no existe. %s %d';
		RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
	end

	IF (@idCategoria is not null and (select count(idCategoria) from Categoria 
									  where idCategoria = @idCategoria)=0)
	begin
		set @error=4; set @errorMsg='El idCategoria indicado no existe. %s %d';
		RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
	end

	-- ganancias netas
	ELSE
	begin
		SELECT
			LoteProducto.porcentajeGanancia, LoteProducto.costoLote,
			LoteProducto.porcentajeGanancia * LoteProducto.costoLote as ganancia,
			LoteProducto.fechaProduccion, Pedido.idSucursal, Provincia.idPais, Producto.idCategoria
        FROM
            LoteProducto
            INNER JOIN Pedido ON Pedido.idPedido =  LoteProducto.idPedido

            INNER JOIN Sucursal ON Sucursal.idSucursal =  Pedido.idSucursal
            INNER JOIN Ubicacion ON Ubicacion.idUbicacion =  Sucursal.idUbicacion
            INNER JOIN Distrito ON Distrito.idDistrito =  Ubicacion.idDistrito
            INNER JOIN Canton ON Canton.idCanton =  Distrito.idCanton
            INNER JOIN Provincia ON Provincia.idProvincia = Canton.idProvincia

            INNER JOIN Producto ON Producto.idProducto = Pedido.idProducto 
        WHERE 
            LoteProducto.fechaProduccion between 
			isnull(@fechaInicio, CAST('1999-01-01' as date)) and 
			isnull(@fechaFinal, DATEADD(day,1, getdate())) and 
			Pedido.idSucursal = isnull(@idSucursal, Pedido.idSucursal) and
			Provincia.idPais = isnull(@idPais, Provincia.idPais) and
			Producto.idCategoria = isnull(@idCategoria, Producto.idCategoria);
	end
END
GO

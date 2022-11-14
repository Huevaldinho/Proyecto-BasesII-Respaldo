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
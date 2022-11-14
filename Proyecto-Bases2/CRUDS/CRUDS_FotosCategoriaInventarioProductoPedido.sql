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
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

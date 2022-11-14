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

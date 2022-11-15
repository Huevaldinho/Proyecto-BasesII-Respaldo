


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
    @montoTemp money = 0,
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
CREATE or alter PROCEDURE getIdProveedores @idProducto int,
                                 @nombreProveedor varchar(100),
                                 @idPais INT,
                                 @idProvincia int,
                                 @idCanton int,
                                 @idDistrito int
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
	WHERE (@nombreProveedor is null or Prov.nombreProveedor like '%'+@nombreProveedor+'%') and
    Prov.estado = 2 AND --Proveedor activo
    Producto.idProducto = isnull(@idProducto, Producto.idProducto) AND
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

--Procedimiento cambioMoneda
GO
CREATE PROCEDURE getCambioMoneda @idPais INT
                                WITH ENCRYPTION AS
BEGIN
	SELECT Moneda.nombreDivisa, Moneda.cambioDolar
    FROM Pais 
    INNER JOIN Moneda ON Moneda.idMoneda = Pais.idMoneda
	WHERE Pais.idPais = isnull(@idPais, Pais.idPais)
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
CREATE or alter PROCEDURE calcularSubtotal @idUnidad int WITH ENCRYPTION AS
BEGIN
    DECLARE @precio MONEY, @Descuentos Float, @Impuestos float, @idLoteProducto int, @idProducto int
	-- Seleccionamos id's
	SELECT @idLoteProducto = LoteProducto.idLote, @idProducto = Pedido.idProducto
    FROM Unidad
    inner join LoteProducto on LoteProducto.idLote = Unidad.idLote
    inner join Pedido on Pedido.idPedido = LoteProducto.idPedido
	WHERE Unidad.idUnidad = @idUnidad;
	-- Seleccionamos precio
	set @precio = isnull((Select Producto.precio
	FROM Producto where Producto.idProducto = @idProducto), 0.0);
	-- Seleccionamos descuento
	set @Descuentos = isnull((Select Descuento.porcentaje
	FROM Descuento where Descuento.idLote = @idLoteProducto), 0.0);
	-- Seleccionamos impuesto
	set @Impuestos = isnull((Select sum(Impuesto.porcentaje)
	FROM ProductoxImpuesto
	inner join Impuesto on Impuesto.idImpuesto = ProductoxImpuesto.idImpuesto
	where ProductoxImpuesto.idProducto = @idProducto), 0.0);
	-- Hacemos la suma
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
    where Producto.idProducto = @idProducto
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



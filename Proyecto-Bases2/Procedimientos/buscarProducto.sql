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


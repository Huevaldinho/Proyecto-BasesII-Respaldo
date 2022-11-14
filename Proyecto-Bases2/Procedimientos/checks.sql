--Funcion para validar que el proveedor existe en postgresql
CREATE FUNCTION validarProveedor(@idProveedor int) returns int
AS
BEGIN
    if @idProveedor is null
		return 0;

    DECLARE @proveedorExiste   int;
    set @proveedorExiste = 0;--No existe por defecto

       IF EXISTS( select idProveedor from [POSTGRESQL].[Proveedores].[dbo].[proveedor]
                    where idProveedor = @idProveedor and estado=2)
            BEGIN
                set @proveedorExiste = 1;--Si existe en la base de datos de recursos humanos
            END

    RETURN @proveedorExiste;--Retorna 0 si no existe y 1 si existe.
END
GO


--Check de proveedor en pedido.
ALTER TABLE [dbo].[Pedido] ADD CONSTRAINT validarProveedorConstraint CHECK([dbo].[validarProveedor](idProveedor)=1);

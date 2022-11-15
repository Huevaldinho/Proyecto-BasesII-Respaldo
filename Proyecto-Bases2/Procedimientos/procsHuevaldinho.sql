

--Procedimiento Ortorgar Bono a Empleado
CREATE OR ALTER PROCEDURE OtorgarBono WITH ENCRYPTION AS
BEGIN
	/*
	La empresa otorga un bono a los facturadores que hayan facturado mas de 1000 productos
	en tres meses.

	*/
	--Inserta bono de 100 dolares en la fecha actual a todos los empleados que hayan vendido mas de mil productos en tres meses.
	INSERT INTO Bono(idEmpleado,cantidadBono,fechaBono)  
		
		SELECT idEmpleado,100,GETDATE() from (
			SELECT F.idEmpleado, SUM(DISTINCT D.idUnidad) as cantidadProductosVendidos FROM Factura AS F 
				inner join Empleado AS E ON E.idEmpleado = F.idEmpleado --De factura salta a empleado para ver que si este activo y sea facturador
				inner join Estado AS Es ON Es.idEstado = E.idEstado	--De empleado salta a estado para ver que el empleado este activo
				inner join Puesto AS P ON P.idPuesto = E.idPuesto	--De empleado salta a puesto para ver que el empleado sea facturador
				inner join Detalle AS D on D.idFactura = F.idFactura --De factura salta a detalle para contar los productos vendidos
				WHERE 
					fechaFactura >= DATEADD(day, -90, GETDATE()) --Le resta 90 dias a la fecha actual. Es decir 3 meses.
					AND P.idPuesto = 1 --Puesto 1 es Facturador
					AND Es.idEstado = 2 --Estado 2 es Activo.	
			
				GROUP BY F.idEmpleado --Agrupa por empleado
				HAVING SUM(DISTINCT D.idUnidad)>=1000 --Filtra las agrupaciones que tengan mas de 1000 ventas
			) empleadosYcantidadProductosVendidos; 
END
GO
--Procedimiento Obtener Informacion de Bonos
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
--Obtiene la sucursal mas cercana que tenga el producto que se busca.
CREATE OR ALTER PROCEDURE sucursalExistenciasMasCercana @lat FLOAT,@lon FLOAT,@idProducto FLOAT
WITH ENCRYPTION AS
BEGIN
	SELECT TOP 1 S.idSucursal,S.nombreSucursal,
	S.ubicacionG.STDistance(geography::Point(@lat,@lon, 4326))/1000 AS kilometrosDistancia,
	I.idProducto,P.nombre AS nombreProducto,I.cantidad 
	FROM dbo.Inventario AS I
		INNER JOIN dbo.Producto AS P ON P.idProducto=I.idProducto
		INNER JOIN dbo.Sucursal AS S ON S.idSucursal = I.idSucursal
		WHERE I.idProducto=@idProducto AND cantidad>0 ORDER BY kilometrosDistancia DESC;--Ordena por el que este mas cerca del cliente
	
    
	
END
GO
--Muestra los pedidos realizados por una o todas las sucursales.
CREATE OR ALTER PROCEDURE mostrarPedidos @idSucursal INT WITH ENCRYPTION AS
BEGIN
	--Retorna
	--nombreSucursal,nombreProducto,cantidad,fechaSolicitud,fechaRecibido,estado,idProveedor
	SELECT Suc.nombreSucursal AS sucursal,Pro.nombre AS nombreProducto,
			Pedi.cantidad,Pedi.fechaSolicitud,Pedi.fechaRecibido,Est.nombre AS estado,
			Pedi.idProveedor AS idProveedor
	FROM dbo.Pedido  AS Pedi
		INNER JOIN dbo.Sucursal AS Suc ON Suc.idSucursal=Pedi.idSucursal
		INNER JOIN dbo.Producto AS Pro ON Pro.idProducto = Pedi.idProducto
		INNER JOIN dbo.Estado AS Est ON Est.idEstado=Pedi.idEstado

		WHERE Pedi.idSucursal=ISNULL(@idSucursal,Pedi.idSucursal)

END
GO
--Muestra id sucursal y el administrador de la sucursal. idSucursal y idEmpleado
CREATE OR ALTER PROCEDURE validarAdministrador WITH ENCRYPTION AS
BEGIN

	SELECT S.idSucursal,S.idAdministrador FROM dbo.Sucursal AS S 
	INNER JOIN dbo.Empleado AS Em ON Em.idEmpleado = S.idAdministrador;
END
GO

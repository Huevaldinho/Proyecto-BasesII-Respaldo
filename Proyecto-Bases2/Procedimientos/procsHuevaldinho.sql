

--Procedimiento Ortorgar Bono a Empleado
--FALTA PROBARLO
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

/*Procedimiento viejo hecho por felipe usando cursor, se reemplazo por otro que hizo fer.
--Procedimiento para ReOrdenar Productos - El trigger se ve en la tabla con la que se dispara.
CREATE TRIGGER reOrdenarProducto ON Inventario AFTER UPDATE AS
BEGIN
 			--de inventario  de postgres  de estado  de inventario del sistema  de inventario
    --Se crea cursor de cada uno inventario de productos que se necesita hacer pedido. Solo necesita leer.
    DECLARE CursorInventario CURSOR READ_ONLY FOR 
		SELECT I.idSucursal,I.idProducto, (I.maximo-I.cantidad) as cantidadAPedir FROM Inventario as I
		WHERE I.cantidad <= I.minimo;

	DECLARE @idSucursal INT, @idProducto INT, @cantidadAPedir INT, @idProveedor INT;
    

	OPEN CursorInventario;
	FETCH NEXT FROM CursorInventario INTO @idSucursal, @idProducto,@cantidadAPedir
	
		WHILE @@FETCH_STATUS = 0  
			BEGIN  
				--Selecciona el id del proveedor que tenga el costo del producto mas barato y tenga suficiente cantidad del producto
				--ademas el proveedor debe estar Activo (estado = 2)
				 SET @idProveedor = 
					(SELECT idProveedor FROM  (
						select TOP 1 min(ProXPru.costoProducto) as masBarato, ProXPru.idProveedor from 
								[POSTGRESQL].[Proveedores].[dbo].[proveedorxproducto] as ProXPru
								inner join [POSTGRESQL].[Proveedores].[dbo].[proveedor] as Pro on [Pro].idproveedor = [ProXPru].idproveedor
								where [ProXPru].idProducto = @idProducto
									AND [ProXPru].cantidadDisponible >= @cantidadAPedir
									AND [Pro].estado = 2
								group by [ProXPru].idProveedor) proveedor);

				IF @idProveedor IS NOT NULL--Encontro proveedor que venda mas barato y que tiene suficiente cantidad
					BEGIN

						INSERT INTO Pedido (idSucursal,idProveedor,idEstado,idProducto,fechaSolicitud,fechaRecibido,cantidad)
							VALUES (@idSucursal,@idProveedor,3,@idProducto,GETDATE(),null,@cantidadAPedir);

					END
										
				 FETCH NEXT FROM CursorInventario INTO @idSucursal, @idProducto,@cantidadAPedir
			END 

	CLOSE CursorInventario;
	DEALLOCATE CursorInventario;

END
GO;

*/
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


--SELECT * FROM dbo.Sucursal
--UPDATE dbo.Sucursal SET ubicacionG=geography::Point(9.857921092067665, -83.90623797616558, 4326) WHERE idSucursal=2;
--UPDATE dbo.Sucursal SET ubicacionG=geography::Point(9.954464275803844, -84.06751798893421, 4326) WHERE idSucursal=5;
--UPDATE dbo.Sucursal SET ubicacionG=geography::Point(9.935005356421582, -84.12910427183374, 4326) WHERE idSucursal=8;

--exec calcularDistanciaEntrePuntos NULL,NULL,NULL,NULL

--SELECT geography::Point(null, null, 4326)






-- --Procedimiento Consultar Supermercado
-- CREATE OR ALTER PROCEDURE ConsultarSupermercado @idSucursal int,@ubicacionCliente geography WITH ENCRYPTION AS
-- 	/*
-- 		El cliente puede consultar los supermercados, el horario, si esta abierto o no,
-- 		nombre del administrador, la distancia que se encuentra desde donde se consulta
-- 	*/
-- BEGIN
-- 	if @idSucursal is null
-- 		RAISERROR('Debe ingresar el id de la sucursal (@idSucursal).', 17, 1);
-- 	if @distancia is null
-- 		RAISERROR('Debe ingresar la ubicacion del cliente (@ubicacionCliente).', 17, 1);

-- 	--Calcula distancia de la ubicacion del cliente a la sucursal
-- 	set @distancia = @ubicacionCliente.STDistance(
-- 						(select U.ubicacionG from Sucursal as S 
-- 							inner join Ubicacion as U on U.[idUbicacion] = S.[idUbicacion]
-- 							where S.idSucursal = @idSucursal)
-- 						);

-- 	--Para que seleccione el horario y si está abierto es mejor que se haga desde python
-- 	--para que python pase un parametro que sea un varchar con el horario que aqui nada mas se seleccione
-- 	--y que pase otro parametro varchar que diga si esta abierto o  no.
-- 	--SucursalAbierta(@idSucursal) se sustituye por el parametro de si esta abierto.
-- 	--Horarios utiliza el otro parametro que trae el horario.
	

-- 	--Usar case para decir si esta abierto o no
-- 	select S.idSucursal,@distancia as distanciaDeSucursal,--Sucursal y distancia
-- 			Em.[nombreEmpleado] as nombreAdmin,Em.[apellido1] as apellidoAdmin,--Info admin
-- 			SucursalAbierta(@idSucursal) as abierto,--Abierto (llama funcion que determina si esta abierto o no)
-- 			 --Horarios se tiene que formar en un string para que el select sea de un solo registro. Tipo horario= L:6am - 8pm,M:7am - 8pm.
	
-- 	from Sucursal as S 

-- 	inner join Empleado as Em on Em.idEmpleado = S.idAdministrador --Salta de Sucursal a Empleado para ver info del admin
-- 	inner join HorarioXSucursal as HxS on HxS.idSucursal = S.idSucursal --Salta de Sucursal a Horario x Sucural para ver los horarios

-- 	where idSucursal = @idSucursal; --Selecciona solo la info de la sucursal ingresada.

-- END
-- GO;

-- --ESTA FUNCION SE TIENE QUE HACER EN PYTHON POR LA COMPARACION DE DIA Y GETDATE()
-- CREATE FUNCTION SucursalAbierta (@idSucursal int) RETURNS varchar(2) AS  
-- BEGIN
-- 	return (select TOP 1 
-- 				CASE
-- 					WHEN compara el dia que es un varchar con un getdate no se puede? THEN 'Si'
-- 					ELSE 'No'
-- 				END as sucursalAbierta
-- 				from HorarioXSucursal as HxS 
-- 				inner join Sucursal as S on S.idSucursal = HxS.idSucursal --Salta de horario x sucursal a horario para filtrar la sucursal
-- 				inner join Horario as H on H.idHorario = HxS.idHorario --Salta de horario x sucursal a horario para obtener info del horario
-- 				where S.idSucursal=@idSucursal
-- 	);

-- END;
-- GO;

-- --------------------------------------------------------------------------------------------------------------
-- ---------------------------PRUEBAS DE PROCEDIMIENTOS-----------------------------------------------------
-- --------------------------------------------------------------------------------------------------------------
-- --Pruebas Otorgar Bono
-- exec OtorgarBono; -- Aun no hay informacion suficiente en los registros para que se otorgen bonos.



-- --Pruebas Obtener Info Bono
-- GO;

-- --Pruebas ObtenerInfoBono
-- select * from Bono;
-- select * from Pais;
-- select * from Sucursal
-- exec ObtenerInfoBono null,null,null,null,null;--Toma todos los bonos
-- exec ObtenerInfoBono null,null,null,null,1;--Toma los bonos realizados en las sucursales de Panama
-- exec ObtenerInfoBono null,null,null,null,2;--Toma los bonos realizados en las sucursales de Costa Rica
-- exec ObtenerInfoBono null,null,null,null,3;--Toma los bonos realizados en las sucursales de Colombia
-- exec ObtenerInfoBono 1,null,null,null,1;--Toma los bonos del empleado 1 de Pamama
-- exec ObtenerInfoBono 5,null,null,null,2;--Toma los bonos del empleado 5 de Costa Rica
-- exec ObtenerInfoBono 7,null,null,null,3;--Toma los bonos del empleado 5 de Colombia
-- exec ObtenerInfoBono null,null,null,2,null;--Toma los bonos de la sucursal 2 (WalmartCROreamuno)
-- declare @fechaInicio smalldatetime,@fechaFin smalldatetime;
-- set @fechaInicio = (SELECT CAST('2020-08-25' AS smalldatetime)); 
-- set @fechaFin = (SELECT CAST('2021-12-08' AS smalldatetime)); 
-- exec ObtenerInfoBono null,@fechaInicio,null,null,null;--Toma los bonos mayores a la fecha inicio
-- exec ObtenerInfoBono null,@fechaInicio,@fechaFin,null,null;--Toma los bonos mayores a la fecha inicio y menor a la fecha fin
-- exec ObtenerInfoBono null,@fechaInicio,null,null,1;--Toma los bonos mayores a la fecha inicio y menor a la fecha fin en Panama
-- --Probar el resto de combinaciones cuando se tenga mas info en la base
-- GO;


-- --
-- Select * from [dbo].[HorarioXSucursal];
-- select * from [dbo].[Horario];



-- --Asi consulta a postgesq 
-- SELECT * from [POSTGRESQL].[Proveedores].[dbo].[proveedor];
-- SELECT * from [POSTGRESQL].[Proveedores].[dbo].[proveedorxproducto];

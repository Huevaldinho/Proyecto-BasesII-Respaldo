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
            set @error=3; set @errorMsg='El id de la ubicaci�n debe existir. %s %d';
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

-- CRUD Env�o
-- drop procedure CRUDenvio;
go
CREATE or alter PROCEDURE CRUDenvio @opcion int, @idEnvio int, @idFactura int, 
						   @idEstado int, @costoEnvio money, @fechaEnvio date,
						   @lat float, @lon float
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idFactura is null or @costoEnvio is null
					or @idEstado is null or @lat is null
					or @lon is null) )
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
					  values (@idFactura, @costoEnvio, @fechaEnvio, @idEstado, geography::Point(@lat, @lon, 4326))
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
				ubicacionG = ISNULL(geography::Point(@lat, @lon, 4326),ubicacionG)
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

-- CRUD Ubicaci�n
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

-- CRUD Cant�n
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
            set @error=3; set @errorMsg='El id del pa�s debe existir. %s %d';
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
		end
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

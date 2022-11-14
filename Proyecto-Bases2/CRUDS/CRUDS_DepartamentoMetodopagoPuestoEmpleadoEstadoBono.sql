-- CRUD Departamento
-- drop procedure CRUDdepartamento;
go
CREATE PROCEDURE CRUDdepartamento @opcion int, @idDepartamento int, @nombreDepartamento varchar(25)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombreDepartamento is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Departamento (nombreDepartamento) values (@nombreDepartamento)
		end
	if (@opcion = 1)
		begin
			select idDepartamento, nombreDepartamento
			from Departamento where idDepartamento = @idDepartamento;
		end
	if (@opcion = 2)
		begin
			update Departamento 
			set nombreDepartamento = ISNULL(@nombreDepartamento,nombreDepartamento)
			where idDepartamento = @idDepartamento;
		end
END
GO

-- CRUD M�todo de Pago
-- drop procedure CRUDmetodopago;
go
CREATE PROCEDURE CRUDmetodopago @opcion int, @idMetodoPago int, @nombreMetodoPago varchar(100)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombreMetodoPago is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into MetodoPago (nombreMetodoPago) values (@nombreMetodoPago)
		end
	if (@opcion = 1)
		begin
			select idMetodoPago, nombreMetodoPago
			from MetodoPago where idMetodoPago = @idMetodoPago;
		end
	if (@opcion = 2)
		begin
			update MetodoPago 
			set nombreMetodoPago = ISNULL(@nombreMetodoPago,nombreMetodoPago)
			where idMetodoPago = @idMetodoPago;
		end
END
GO

-- CRUD Puesto
-- drop procedure CRUDpuesto;
go
CREATE PROCEDURE CRUDpuesto @opcion int, @idPuesto int, @idDepartamento int, 
							@nombrePuesto varchar(100), @salario money
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idDepartamento is null or @nombrePuesto is null or @salario is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idDepartamento is not null and (select count(idDepartamento) from Departamento 
									  where idDepartamento=@idDepartamento)=0)
		begin
            set @error=3; set @errorMsg='El id del departamento debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Puesto (idDepartamento, nombrePuesto, salario) 
			values (@idDepartamento, @nombrePuesto, @salario)
		end
	if (@opcion = 1)
		begin
			select idPuesto, idDepartamento, nombrePuesto, salario
			from Puesto where idPuesto = @idPuesto;
		end
	if (@opcion = 2)
		begin
			update Puesto 
			set idDepartamento = ISNULL(@idDepartamento,idDepartamento),
				nombrePuesto = ISNULL(@nombrePuesto,nombrePuesto),
				salario = ISNULL(@salario,salario)
			where idPuesto = @idPuesto;
		end
END
GO
 
-- CRUD Empleado
-- drop procedure CRUDempleado;
go
CREATE PROCEDURE CRUDempleado @opcion int, @idEmpleado int, @idPuesto int, @idSucursal int, 
							  @idEstado int, @cedula bigint, @nombreEmpleado varchar(100), 
							  @apellido1 varchar(100), @apellido2 varchar(100), 
							  @fechaContratacion smalldatetime, @fechaNacimiento date, 
							  @correo varchar(50), @foto varbinary(max)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>3)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idPuesto is null or @idSucursal is null or @idEstado is null or 
					   @cedula is null or @nombreEmpleado is null or @apellido1 is null or
					   @apellido2 is null or @fechaContratacion is null or 
					   @fechaNacimiento is null or @correo is null or @foto is null ))
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idPuesto is not null and (select count(idPuesto) from Puesto 
									  where idPuesto=@idPuesto)=0)
		begin
            set @error=3; set @errorMsg='El id del puesto debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idSucursal is not null and (select count(idSucursal) from Sucursal 
									  where idSucursal=@idSucursal)=0)
		begin
            set @error=3; set @errorMsg='El id del departamento debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idEstado is not null and (select count(idEstado) from Estado 
									  where idEstado=@idEstado)=0)
		begin
            set @error=3; set @errorMsg='El id del departamento debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Empleado (idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, 
								  apellido1, apellido2, fechaContratacion, fechaNacimiento, correo, foto) 
			values (@idPuesto, @idSucursal, @idEstado, @cedula, @nombreEmpleado, @apellido1,
					@apellido2, @fechaContratacion, @fechaNacimiento, @correo, @foto)
		end
	if (@opcion = 1)
		begin
			select idEmpleado, idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
				   apellido2, fechaContratacion, fechaNacimiento, correo
			from Empleado where idEmpleado = @idEmpleado;
		end
	if (@opcion = 2)
		begin
			update Empleado 
			set idPuesto = ISNULL(@idPuesto,idPuesto),
				idSucursal = ISNULL(@idSucursal,idSucursal),
				idEstado = ISNULL(@idEstado,idEstado),
				cedula = ISNULL(@cedula,cedula),
				nombreEmpleado = ISNULL(@nombreEmpleado,nombreEmpleado),
				apellido1 = ISNULL(@apellido1,apellido1),
				apellido2 = ISNULL(@apellido2,apellido2),
				fechaContratacion = ISNULL(@fechaContratacion,fechaContratacion),
				fechaNacimiento = ISNULL(@fechaNacimiento,fechaNacimiento),
				correo = ISNULL(@correo,correo),
				foto = ISNULL(@foto,foto)
			where idEmpleado = @idEmpleado;
		end
	if (@opcion = 3)
		begin
			update Empleado 
			set idEstado = 1
			where idEmpleado = @idEmpleado;
		end
END
GO

-- CRUD Estado
-- drop procedure CRUDestado;
go
CREATE PROCEDURE CRUDestado @opcion int, @idEstado int, @nombre varchar(50) with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@nombre is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Estado (nombre) values (@nombre)
		end
	if (@opcion = 1)
		begin
			select idEstado, nombre
			from Estado where idEstado = @idEstado;
		end
	if (@opcion = 2)
		begin
			update Estado 
			set nombre = ISNULL(@nombre,nombre)
			where idEstado = @idEstado;
		end
END
GO

-- CRUD Bono
-- drop procedure CRUDbono;
go
CREATE PROCEDURE CRUDbono @opcion int, @idBono int, @idEmpleado int, @cantidadBono money, 
						  @fechaBono smalldatetime 
						  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idEmpleado is null or @cantidadBono is null or @fechaBono is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idEmpleado is not null and (select count(idEmpleado) from Empleado 
									  where idEmpleado=@idEmpleado)=0)
		begin
            set @error=3; set @errorMsg='El id del empleado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Bono (idEmpleado, cantidadBono,fechaBono) 
					  values (@idEmpleado, @cantidadBono, @fechaBono)
		end
	if (@opcion = 1)
		begin
			select idBono, idEmpleado, cantidadBono,fechaBono
			from Bono where idBono = @idBono;
		end
	if (@opcion = 2)
		begin
			update Bono 
			set idEmpleado = ISNULL(@idEmpleado,idEmpleado),
			    cantidadBono = ISNULL(@cantidadBono,cantidadBono),
			    fechaBono = ISNULL(@fechaBono,fechaBono)
			where idBono = @idBono;
		end
END
GO
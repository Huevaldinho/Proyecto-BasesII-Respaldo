
go
CREATE PROCEDURE CRUDUsuarioEmpleado @opcion int, @idUsuarioEmpleado int,@idEmpleado int,
									 @contrasenna varchar(30)
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idEmpleado is null or @contrasenna is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	if (@idEmpleado is not null and (select count(idEmpleado) from Empleado 
									  where idEmpleado=@idEmpleado)=0)
		begin
            set @error=4; set @errorMsg='El id del empleado debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into UsuarioEmpleado (idEmpleado, contrasenna)
					  values (@idEmpleado, @contrasenna)
		end
	if (@opcion = 1)
		begin
			select idEmpleado, contrasenna
			from UsuarioEmpleado where idUsuarioEmpleado = @idUsuarioEmpleado;
		end
	if (@opcion = 2)
		begin
			update UsuarioEmpleado 
			set idEmpleado = ISNULL(@idEmpleado,idEmpleado), 
				contrasenna = ISNULL(@contrasenna,contrasenna)
			where idUsuarioEmpleado = @idUsuarioEmpleado;
		end
END
GO


go
CREATE PROCEDURE CRUDUsuarioCliente @opcion int, @idUsuarioCliente int,@idCliente int,
									 @contrasenna varchar(30)
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idCliente is null or @contrasenna is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	if (@idCliente is not null and (select count(idCliente) from Cliente 
									  where idCliente=@idCliente)=0)
		begin
            set @error=4; set @errorMsg='El id del Cliente debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into UsuarioCliente(idCliente, contrasenna)
					  values (@idCliente, @contrasenna)
		end
	if (@opcion = 1)
		begin
			select idCliente, contrasenna
			from UsuarioCliente where idUsuarioCliente = @idUsuarioCliente;
		end
	if (@opcion = 2)
		begin
			update UsuarioCliente
			set idCliente = ISNULL(@idCliente,idCliente), 
				contrasenna = ISNULL(@contrasenna,contrasenna)
			where idUsuarioCliente = @idUsuarioCliente;
		end
END
GO
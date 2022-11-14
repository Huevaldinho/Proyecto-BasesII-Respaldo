-- CRUD Horario
-- drop procedure CRUDhorario;
go
CREATE PROCEDURE CRUDhorario @opcion int, @idHorario int, @horaApertura time, @horaCierre time, 
							 @dia varchar(1)
							 with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idHorario is null or @horaApertura is null or @horaCierre is null or
					   @dia is null ) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idHorario is not null and (select count(idHorario) from Horario 
									  where idHorario=@idHorario)=0)
		begin
            set @error=3; set @errorMsg='El id del horario debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into Horario (horaApertura, horaCierre, dia)
					  values (@horaApertura, @horaCierre, @dia)
		end
	if (@opcion = 1)
		begin
			select idHorario, horaApertura, horaCierre, dia
			from Horario where idHorario = @idHorario;
		end
	if (@opcion = 2)
		begin
			update Horario 
			set horaApertura = ISNULL(@horaApertura,horaApertura), 
				horaCierre = ISNULL(@horaCierre,horaCierre), 
				dia = ISNULL(@dia,dia)
			where idHorario = @idHorario;
		end
END
GO

-- CRUD HorarioXSucursal
-- drop procedure CRUDhorarioxsucursal;
go
CREATE PROCEDURE CRUDhorarioxsucursal @opcion int, @idHorarioXSucursal int, @idHorario int, 
									  @idSucursal int 
									  with encryption AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
    if (@opcion is null or @opcion<0 or @opcion>2)
        begin
            set @error=1; set @errorMsg='Debe ingresar el parametro @opcion. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
        end
	if (@opcion=0 and (@idHorario is null or @idSucursal is null) )
		begin
            set @error=2; set @errorMsg='Para crear, no pueden haber atributos nulos. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idHorario is not null and (select count(idHorario) from Horario 
									  where idHorario=@idHorario)=0)
		begin
            set @error=3; set @errorMsg='El id del horario debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@idSucursal is not null and (select count(idSucursal) from Sucursal 
									  where idSucursal=@idSucursal)=0)
		begin
            set @error=4; set @errorMsg='El id de la sucursal debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end

	-- opciones
	if (@opcion = 0) 
		begin
			insert into HorarioXSucursal(idHorario, idSucursal)
					  values (@idHorario, @idSucursal)
		end
	if (@opcion = 1)
		begin
			select idHorarioXSucursal, idHorario, idSucursal
			from HorarioXSucursal where idHorarioXSucursal = @idHorarioXSucursal;
		end
	if (@opcion = 2)
		begin
			update HorarioXSucursal 
			set idHorario = ISNULL(@idHorario,idHorario), 
				idSucursal = ISNULL(@idSucursal,idSucursal)
			where idHorarioXSucursal = @idHorarioXSucursal;
		end
END
GO
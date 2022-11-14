-- determinar si van a
-- expirer en una semana y se pone en descuento, si un producto ya ha expirado debe de
-- sacarlo del exhibidor
-- use CostaRica;
go
CREATE PROCEDURE ponerProductoEnDescuento @idLote int, @porcentaje float WITH ENCRYPTION AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
	if (@idLote is null or (select count(idLote) from LoteProducto where idLote=@idLote)=0)
		begin
            set @error=1; set @errorMsg='El id del lote  no puede ser nulo y debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if (@porcentaje < 0)
		begin
            set @error=2; set @errorMsg='El porcentaje debe ser positivo. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if DATEDIFF(week, getdate(), (select fechaExpiracion from LoteProducto where @idLote = idLote)) > 1 
		begin 
			set @error=3; set @errorMsg='El producto no va a expirar en una semana. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error);
		end
	-- opciones
	if @error = 0
		begin
			update Unidad set idEstado = 10 where idLote = @idLote; -- actualiza las unidades del lote
			insert into Descuento (idLote, porcentaje) values (@idLote, @porcentaje);
		end
END
GO

go
CREATE PROCEDURE sacarDeExhibidor @idLote int WITH ENCRYPTION AS
BEGIN
    declare @error int = 0,@errorMsg varchar(100);

	-- validaciones
	if (@idLote is null or (select count(idLote) from LoteProducto where idLote=@idLote)=0)
		begin
            set @error=3; set @errorMsg='El id del lote  no puede ser nulo y debe existir. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error); 
		end
	if DATEDIFF(day, getdate(), (select fechaExpiracion from LoteProducto where @idLote = idLote)) > 0 
		begin 
			set @error=3; set @errorMsg='El producto no ha expirado. %s %d';
			RAISERROR (@errorMsg,16,1,N' Error numero',@error);
		end

	-- opciones
	update Unidad set idEstado = 4 where idLote = @idLote; -- actualiza las unidades del lote
END
GO
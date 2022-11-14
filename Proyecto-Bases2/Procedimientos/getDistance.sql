
-- Dados 2 ubicaciones, indique la distancia que hay entre ellos
-- drop procedure getDistance;

go
CREATE OR ALTER PROCEDURE getDistance @idUbicacion1 geography, @idUbicacion2 geography with encryption AS
BEGIN
	--Calcula la distancia entre las dos ubicaciones pasadas como argumentos.
    declare @error int,@errorMsg varchar(100);

	-- validacion
    if (@idUbicacion1 is null or @idUbicacion2 is null) 
		RAISERROR (@errorMsg,16,1,N' Error numero',1); 
	else
		begin
			SELECT @idUbicacion1.STDistance(@idUbicacion2);  
		end
END
GO
--Prueba
--DECLARE @g geography;  
--DECLARE @h geography;  
--SET @g = geography::STGeomFromText('LINESTRING(-122.360 47.656, -122.343 47.656)', 4326);  
--SET @h = geography::STGeomFromText('POINT(-122.34900 47.65100)', 4326);  
--exec getDistance @g,@h

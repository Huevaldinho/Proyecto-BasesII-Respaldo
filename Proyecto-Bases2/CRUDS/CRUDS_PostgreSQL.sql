-- 0 Create, 1 Read, 2 Update, 3 Delete

CREATE OR REPLACE PROCEDURE dbo.CRUD_Proveedor(in _flag integer, in _idProveedor integer, 
								  in _idUbicacion integer,
                                  in _nombreProveedor character varying(20),in _celular character varying (15),
								  in _correo character varying (50), 
								  in _estado integer, in _lat float8,in _lon float8,
                                  out _outidProveedor integer, out _outidUbicacion integer,
                                  out _outnombreProveedor character varying(20),out _outcelular character varying (15),
								  out _outcorreo character varying (50), 
								  out _outestado integer, in _outlat float8,in _outlon float8)
LANGUAGE plpgsql
AS $$
BEGIN
IF (_flag != 0 AND _flag != 1 AND _flag != 2 AND _flag != 3)  THEN
    RAISE NOTICE 'La opcion está fuera del rango';

ElSIF ((_idUbicacion IS NULL  OR _nombreProveedor IS NULL  OR _celular IS NULL
         OR _correo IS NULL or _lat is null or _lon is null)  AND _flag = 0) THEN
    RAISE NOTICE 'Debe completar todos los parametros para crear';

ElSIF ((select count(idProveedor) from dbo.Proveedor where _idProveedor = idProveedor)=0
    AND _flag != 0) THEN
    RAISE NOTICE 'El proveedor no existe';

ElSIF _flag = 0 THEN
	insert into dbo.Proveedor (idUbicacion, nombreProveedor, celular, correo, estado, lat, lon)
    values(_idUbicacion, _nombreProveedor, _celular, _correo, 2, _lat, _lon);

ElSIF _flag = 1 THEN
    select idProveedor, idUbicacion, nombreProveedor, celular, correo, estado, lat, lon
    into _outidProveedor, _outidUbicacion , _outnombreProveedor , _outcelular, _outcorreo, _outestado, _outlat, _outlon
	from dbo.Proveedor
	where dbo.Proveedor.idProveedor = _idProveedor;

ElSIF _flag = 2 THEN
    UPDATE dbo.Proveedor 
    SET idUbicacion =  COALESCE (_idUbicacion, Proveedor.idUbicacion),
		nombreProveedor=  COALESCE (_nombreProveedor, Proveedor.nombreProveedor),
        celular =  COALESCE (_celular, Proveedor.celular),
        correo =  COALESCE (_correo, Proveedor.correo),
		estado =  COALESCE (_estado, Proveedor.estado),
		lat =  COALESCE (_lat, Proveedor.lat),
		lon =  COALESCE (_lon, Proveedor.lon)
    where idProveedor = _idProveedor;
	
ElSIF _flag = 3 THEN
    UPDATE dbo.Proveedor
    SET Estado = 1
    where idProveedor = _idProveedor;

END IF;
END;
$$;

-- 0 Create, 1 Read, 2 Update

CREATE OR REPLACE PROCEDURE dbo.CRUD_ProveedorXProducto(in _flag integer, 
								  in _idProveedorXProducto integer, 
								  in _idProveedor integer,in _idProducto integer,
								  in _costoProducto integer, in _cantidadDisponible integer,
								  out _outidProveedorXProducto integer, 
								  out _outidProveedor integer,out _outidProducto integer,
								  out _outcostoProducto integer, out _outcantidadDisponible integer)
LANGUAGE plpgsql
AS $$
BEGIN
IF (_flag != 0 AND _flag != 1 AND _flag != 2)  THEN
    RAISE NOTICE 'La opcion está fuera del rango';

ElSIF ((_idProveedor IS NULL  OR _idProducto IS NULL  OR _costoProducto IS NULL
         OR _cantidadDisponible IS NULL)  AND _flag = 0) THEN
    RAISE NOTICE 'Debe completar todos los parametros para crear';

ElSIF ((select count(idProveedorXProducto) from dbo.ProveedorXProducto 
		where _idProveedorXProducto = idProveedorXProducto)=0
    	AND _flag != 0) THEN
    RAISE NOTICE 'El idProveedorXProducto no existe';
	
ElSIF ( _idProveedor IS NOT NULL
		AND (select count(idProveedor) from dbo.Proveedor where _idProveedor = idProveedor)=0
    	AND (_flag = 0 OR _flag = 2)) THEN
    RAISE NOTICE 'El idProveedor no existe';

ElSIF _flag = 0 THEN
	insert into dbo.ProveedorXProducto (idProveedor, idProducto, costoProducto, cantidadDisponible)
    values(_idProveedor, _idProducto, _costoProducto, _cantidadDisponible);

ElSIF _flag = 1 THEN
    select idProveedorXProducto,idProveedor, idProducto, costoProducto, cantidadDisponible
    into _outidProveedorXProducto, _outidProveedor , _outidProducto , _outcostoProducto, _outcantidadDisponible
	from dbo.ProveedorXProducto
	where dbo.ProveedorXProducto.idProveedorXProducto = _idProveedorXProducto;

ElSIF _flag = 2 THEN
    UPDATE dbo.ProveedorXProducto 
    SET idProveedor =  COALESCE (_idProveedor, ProveedorXProducto.idProveedor),
		idProducto=  COALESCE (_idProducto, ProveedorXProducto.idProducto),
        costoProducto =  COALESCE (_costoProducto, ProveedorXProducto.costoProducto),
        cantidadDisponible =  COALESCE (_cantidadDisponible, ProveedorXProducto.cantidadDisponible)
    where idProveedorXProducto = _idProveedorXProducto;

END IF;
END;
$$;


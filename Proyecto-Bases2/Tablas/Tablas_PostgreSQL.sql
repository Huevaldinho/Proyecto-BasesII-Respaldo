--Creación de tablas en PostgreSQL

-- SCHEMA: dbo

-- DROP SCHEMA IF EXISTS dbo ;

CREATE SCHEMA IF NOT EXISTS dbo
    AUTHORIZATION postgres;

CREATE TABLE dbo.Proveedor 
(
    idProveedor integer GENERATED ALWAYS AS IDENTITY, PRIMARY KEY(idProveedor),
	idUbicacion integer,
	nombreProveedor character varying(20),
	celular character varying (15),
	correo character varying (50),
	estado integer,
	lat float8,
	lon float8
);

CREATE TABLE dbo.ProveedorXProducto
(
    idProveedorXProducto integer GENERATED ALWAYS AS IDENTITY, PRIMARY KEY(idProveedorXProducto),
	idProveedor integer,
	CONSTRAINT tablaproveedor_pkey FOREIGN KEY (idProveedor) REFERENCES dbo.Proveedor(idProveedor),
	idProducto integer,
	costoProducto integer,
	cantidadDisponible integer
);

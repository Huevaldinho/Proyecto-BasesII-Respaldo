INSERT INTO dbo.Proveedor(idUbicacion, nombreProveedor, celular, correo, estado)
VALUES (1,'Coca Cola', 77770000, 'cocacola@gmail.com',2);
INSERT INTO dbo.Proveedor(idUbicacion, nombreProveedor, celular, correo, estado)
VALUES (5,'Tropical', 50004000, 'tropical@gmail.com',2);
INSERT INTO dbo.Proveedor(idUbicacion, nombreProveedor, celular, correo, estado)
VALUES (9,'Monster', 10002365, 'monster@gmail.com',2);

INSERT INTO dbo.ProveedorxProducto(idProveedor, idProducto, costoProducto, cantidadDisponible)
VALUES (1, 1, 1.5, 300);
INSERT INTO dbo.ProveedorxProducto(idProveedor, idProducto, costoProducto, cantidadDisponible)
VALUES (2, 2, 1.5, 150);
INSERT INTO dbo.ProveedorxProducto(idProveedor, idProducto, costoProducto, cantidadDisponible)
VALUES (3, 3, 1.5, 200);
--Monedas
use CostaRica;
insert into Moneda(nombreDivisa, cambioDolar) values ('Dolar', 1),('Colon', 624.61),('Peso', 4822);

--Metodos pago

insert into MetodoPago(nombreMetodoPago) values('Efectivo'),('AmericanExpress'),('PayPal');

--Paises
insert into Pais(nombrePais, idMoneda) values('Panama', 1),('Costa Rica', 2),('Colombia', 3);

--Provincias  
insert into Provincia(nombreProvincia, idPais) values
                    ('Cocle', 1),('Cartago', 2),('Arauca', 3),
                    ('Colon', 1),('San Jose', 2),('Meta', 3),
                    ('Los Santos', 1),('Heredia', 2),('Cordoba',3);

--Cantones
insert into Canton(nombreCanton, idProvincia) values
                    ('Toza', 1),('Oreamuno', 2),('Filipinas', 3),
                    ('Margarita', 4),('Moravia', 5),('Casibare', 6),
                    ('Las Tablas', 7),('San Rafael', 8),('Valencia', 9);

--Distritos
insert into Distrito(nombreDistrito, idCanton) values
                ('DistToza', 1),('DistOreamuno', 2),('DistFilipinas', 3),
                ('DistMargarita', 4),('DistMoravia', 5),('DistCasibare', 6),
                ('DistLas Tablas', 7),('DistSan Rafael', 8),('DistValencia', 9);

--Ubicaciones  
insert into Ubicacion(idDistrito, descripcion) values
        (1, 'DistToza, en el centro'),
        (2, 'DistOreamuno, en el centro'),
        (3, 'DistFilipinas, en el centro'),
        (4, 'DistMargarita, en el centro'),
        (5, 'DistMoravia, en el centro'),
        (6, 'DistCasibare, en el centro'),
        (7, 'DistLas Tablas, en el centro'),
        (8, 'DistSan Rafael, en el centro'),
        (9, 'DistValencia, en el centro');

--Sucursales
insert into Sucursal(idUbicacion, nombreSucursal, idAdministrador) values
                    (1, 'WalmartPanToza', 1),(2, 'WalmartCROreamuno', 2),
                    (3, 'WalmartColFilipinas', 3),(4, 'WalmartPanMargarita', 4),
                    (5, 'WalmartCRMoravia', 5),(6, 'WalmartColCasibare', 6),
                    (7, 'WalmartPanTablas', 7),(8, 'WalmartCRSanRafa', 8),
                    (9, 'WalmartColValencia', 9);
    
--Horarios
insert into Horario(horaApertura, horaCierre, dia) values
                    ('10:10:00', '15:10:00', 'L'),
                    ('08:10:00', '19:10:00', 'M'),
                    ('05:10:00', '12:10:00', 'K'),
                    ('10:10:00', '20:10:00', 'J'),
                    ('07:10:00', '14:10:00', 'V'),
                    ('11:10:00', '22:10:00', 'S'),
                    ('09:10:00', '16:10:00', 'D');

--Horarios por sucursales
insert into HorarioxSucursal(idHorario, idSucursal) values
            (1, 1),(1, 2),(1, 3),(2, 4),(2, 5),(2, 6),(3, 1),(3, 2),
            (3, 3),(4, 4),(4, 5),(4, 6),(5, 1),(5, 1),(5, 2),(6, 3),
            (6, 4),(6, 5),(7, 6),(7, 1),(7, 2);

--Estados
insert into Estado(nombre) values
            ('Inactivo'), ('Activo'), ('Exhibiendo'),
            ('Vencido'), ('Vendido'), ('Pendiente'),
            ('Recibido'), ('Entregado'), ('Reservado'); 

--Departamentos
insert into Departamento(nombreDepartamento) values 
            ('Servicio Cliente'),
            ('Finanzas'),
            ('Planeacion');

--Puestos

insert into Puesto(nombrePuesto, idDepartamento, salario) values
                ('Facturador', 1,  50000),
                ('Admin', 2,  10000000),
                ('Junior', 3,  10000);


--Empleado
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento)
            values
            (1, 1, 1, 18181818, 'Juan', 'Cerdas', 'Mora', 'JCerdas@gmail.com', '2020-12-15', '2002-12-15'),
            (2, 1, 2, 20202112, 'Estefania', 'Retana', 'Jimenez', 'ERetana@gmail.com', '2019-12-15', '1998-12-15'),
            (3, 1, 3, 21563214, 'Mario', 'Mata', 'Torres', 'MMata@gmail.com', '2008-12-15', '1930-12-15'),
            (1, 2, 1, 18181818, 'Eduardo', 'Achiles',  'Washington', 'EAchiles@gmail.com','2020-12-15', '2002-12-15'),
            (2, 2, 2, 20202112, 'Iliana', 'Solano', 'Sanabria', 'ISolano@gmail.com', '2019-12-15', '1998-12-15'),
            (3, 2, 3, 21563214, 'Juana', 'Rhea', 'Farmer', 'JRhea@gmail.com', '2008-12-15', '1930-12-15'),
            (1, 3, 1, 18181818, 'Hank', 'Hill',  'Allcot', 'HHill@gmail.com', '2020-12-15', '2002-12-15'),
            (2, 3, 2, 20202112, 'Angel', 'Kidd', 'Plumb', 'AKidd@gmail.com' , '2019-12-15', '1998-12-15'),
            (3, 3, 3, 21563214, 'Riley', 'Joy', 'Giles', 'RJoy@gmail.com', '2008-12-15', '1930-12-15');


--UsuarioEmpleados
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
                    (1, 'pato123'), (2, 'gym800'),
                    (3, 'emergencia911'), (4, 'semana15'),
                    (5, 'elTecManda'), (6, 'ingcompu2021'),
                    (7, 'prctbases2'), (8, 'baseWalm123'),
                    (9, 'perrosSaltar12');
					
--Bonos 
insert into Bono(idEmpleado, cantidadBono, fechaBono) values
                (1, 200, '2022-12-15'),
                (5, 220, '2018-06-15'),
                (7, 100, '2021-12-08');

--Clientes
INSERT INTO Cliente (idEstado, cedula, correo, nombre, apellido1, apellido2, celular, fechaNacimiento) VALUES
                    (2,'642251186','Clint_Abbey9788@jiman.org','Clint','Abbey','Abbey','03580761344','8/14/2116'),
                    (2,'341348422','Marie_James2557@bretoux.com','Marie','James','James','27856534784','6/3/3904'),
                    (2,'077033035','Enoch_Robertson8669@twipet.com','Enoch','Robertson','Robertson','50137164585','11/16/7802'),
                    (2,'886541162','Anthony_Reid7408@mafthy.com','Anthony','Reid','Reid','80441182861','10/8/2167'),
                    (2,'227466732','Kurt_Flanders8379@kideod.biz','Kurt','Flanders','Flanders','18288681272','1/10/5686'),
                    (2,'316248681','Manuel_Hudson1629@famism.biz','Manuel','Hudson','Hudson','13607677236','8/29/8519'),
                    (2,'836588574','Chuck_Booth2390@twipet.com','Chuck','Booth','Booth','70370145442','7/7/4145'),
                    (2,'430232454','Chester_Pitt8135@zorer.org','Chester','Pitt','Pitt','58455422007','7/22/8935'),
                    (2,'117680518','Ema_Buckley6022@zorer.org','Ema','Buckley','Buckley','28867756705','7/24/4932'),
                    (2,'346412830','Chuck_Mcneill2800@acrit.org','Chuck','Mcneill','Mcneill','56864618105','3/3/3708'),
                    (2,'225285270','Madison_Horton9836@gompie.com','Madison','Horton','Horton','57223236616','7/13/1896'),
                    (2,'138717688','Melody_Verdon4298@twace.org','Melody','Verdon','Verdon','56613523021','2/7/7393'),
                    (2,'163768281','Luke_Sloan1479@ubusive.com','Luke','Sloan','Sloan','20185138085','5/28/1686'),
                    (2,'062407665','Mona_Weldon3875@sheye.org','Mona','Weldon','Weldon','88610628773','4/8/7374'),
                    (2,'687110645','Barry_Giles3288@cispeto.com','Barry','Giles','Giles','31301007062','8/15/8051');

--UsuarioClientes
INSERT INTO UsuarioCliente (idCliente, contrasenna) VALUES
                    (1, 'pato123'), (2, 'gym800'),
                    (3, 'emergencia911'), (4, 'semana15'),
                    (5, 'elTecManda'), (6, 'ingcompu2021'),
                    (7, 'prctbases2'), (8, 'baseWalm123'),
                    (9, 'perrosSaltar12'), (10, 'password111'),
                    (11, 'constra123'), (12, 'insert1234'),
                    (13, 'delete1234'), (14, 'lol123'),
                    (15, 'pass444');



--Inventario
insert into Inventario(idProducto,idSucursal,cantidad, minimo, maximo) values
                        (1, 1,20, 5,40),
                        (3, 1,5, 5,40),
                        (1, 2,20, 5,30),
                        (2, 2,20, 5,30),
                        (3, 2,20, 5,30),
                        (3, 3,10, 5,40);


--Pedidos
insert into Pedido(idSucursal,idProveedor,idEstado,idProducto,fechaSolicitud,fechaRecibido,cantidad) values 
                    (1,3,6,1,getDate(), null,30), /*Pediente 6 y recibido 7*/
                    (1,1,7,2,'2022-04-20', '2022-04-26', 25), /*Pediente 6 y recibido 7*/
                    (2,2,7,1,'2021-09-21', '2021-09-25',30), /*Pediente 6 y recibido 7*/
                    (3,3,7,3,'2022-02-10','2022-02-15' ,20); /*Pediente 6 y recibido 7*/


--Lotes de productos
insert into LoteProducto(idPedido, fechaProduccion,fechaExpiracion,cantidad,
                        costoLote,porcentajeGanancia)values
                    (1,'2021-12-08','2022-12-08',25, 45, 0.10),
                    (2,'2021-08-20','2022-01-02',30, 50, 0.10),
                    (3,'2021-06-21','2022-12-15',20, 30, 0.10);

select * from	Pedido

--Unidades
insert into Unidad(idLote, idEstado) values
(1,4),(1,4),(1,4),(1,5),(1,5),(1,5),(1,5),(1,5),(1,3),(1,3),
(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(2,3),
(2,3),(2,5),(2,5),(2,5),(2,5),(2,5),(2,5),(2,5),(2,3),(2,3),
(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),
(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(3,3),
(1,4),(1,4),(1,4),(1,5),(1,5),(1,5),(1,5),(1,5),(1,3),(1,3),
(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(2,3),
(2,3),(2,5),(2,5),(2,5),(2,5),(2,5),(2,5),(2,5),(2,3),(2,3),
(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),
(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3);


--Impuestos
insert into Impuesto(porcentaje) values
            (0.10),(0.05),(0.08);

--Descuentos
insert into Descuento(idLote,porcentaje) values
        (1,0.10),(2,0.20),(3,0.05);

--Impuestos por productos
insert into ProductoXImpuesto(idProducto,idImpuesto) values
    (1,1),(2,3),(3,2);

--Fotos
insert into fotos(idProducto) values
    (1),(2),(3);
	
--Facturas
insert into Factura(idSucursal, idCliente, idEmpleado, idMetodoPago, total, fechaFactura) values
                    (1, 1, 1, 1, 0, '2022-12-15'),(1, 2, 4, 3, 0, '2022-12-15'),(2, 1, 1, 1, 0, '2022-12-15'),
                    (2, 3, 4, 3, 0, '2022-12-15'),(3, 4, 1, 1, 0, '2022-12-15'),(3, 5, 4, 3, 0, '2022-12-15');

--Detalles
insert into Detalle(idUnidad, idFactura, subTotal) values
            (4, 1, 2),(5, 1, 3),(6, 1, 2),(7, 2, 2),(8, 2, 3),
            (9, 3, 2),(21, 3, 2),(22, 3, 2),(23, 4, 2),(24, 4, 2),
            (25, 5, 2),(26, 5, 2),(27, 5, 2),(28, 6, 2),(29, 6, 2);

--Envios 
insert into Envio(idFactura, idEstado, costoEnvio, fechaEnvio) values
                (3, 8, 10, '2022-12-15'),
                (2, 6, 10, '2022-10-30');

--Monedas
use Panama;
insert into Moneda(nombreDivisa, cambioDolar) values ('Dolar', 1), ('Balboa', 0.99);

--Metodos pago
insert into MetodoPago(nombreMetodoPago) values('Efectivo'),('AmericanExpress'),('PayPal');

--Paises
insert into Pais(nombrePais, idMoneda) values('Panama', 2);

--Provincias  
insert into Provincia(nombreProvincia, idPais) values
                    ('Bocas del Toro', 1),('Chiriqui', 1),('Herrera', 1),
                    ('Los Santos', 1);

--Cantones
insert into Canton(nombreCanton, idProvincia) values
                    ('Almirantea', 1),('Bocas del Toro', 1),('Changuinola', 1),
					('Alanje', 2),('Baru', 2),('Puerto Armuelles', 2),
                    ('Boqueron', 3),('Bajo Boquete', 3),('Boquete', 3),
					('Bugaba', 4),('David', 4),('Dolega', 4);

--Distritos
insert into Distrito(nombreDistrito, idCanton) values
                ('Gualaca', 1),('Remedios', 1),('Renacimiento', 1),
                ('Las Lajas', 2),('San Felix', 3),('Horconcitos', 4),
				('San Lorenzo', 5),('Volcan', 5),('Tierras Altas', 5),
                ('Tole', 6),('Aguadulce', 7),('Anton', 8),
				('Ola', 9),('Nata', 10),('La Pintada', 10),
				('Chagres', 11),('Donoso', 12),('Penonome', 12);

--Ubicaciones  
insert into Ubicacion(descripcion, idDistrito) values
('Cerca de tienda Angeles', 1),('En la segunda entrada despues del angel', 1),('Condominio Blancos',1),
('Calle 1, Avenida 21', 2),('Calle 6, Avenida 27', 2),('Calle 15374, Avenida 82', 3),
('Calle 2, Avenida 22', 4),('Calle 7, Avenida 72', 5),('Calle 35, Avenida 82', 6),
('Calle 3, Avenida 282', 7),('Calle 8, Avenida 25', 8),('Calle 57, Avenida 82', 9),
('Calle 4, Avenida 28', 10),('Calle 9, Avenida 52', 11),('Calle 688, Avenida 5872', 12),
('Calle 5, Avenida 25', 13),('Calle 101, Avenida 2',14),('Calle 8, Avenida 24578', 15),
('Calle 4, Avenida 222', 16),('Calle 10, Avenida 22',17),('Calle 86, Avenida 24', 18);

--Sucursales
insert into Sucursal(idUbicacion, nombreSucursal, idAdministrador, ubicacionG) values
(12,'AECOM', 2, geography::Point( 74.58456813576495,-30.974227269502236, 4326) ),
(1,'ENEL', 24, geography::Point( 50.28344136050032,35.37197210190337, 4326) ),
(20,'DynCorp', 1, geography::Point( 60.21611651540226,-17.518730626249337, 4326) ),
(15,'Demaco', 20, geography::Point( -20.89567221281463,-64.89065339328809, 4326) ),
(14,'Leadertech Consulting', 6, geography::Point( 66.20279446981539,50.371992978321856, 4326) ),
(9,'AECOM', 7, geography::Point( 87.2550868371039,-71.85355658744733, 4326) ),
(13,'Erickson', 19, geography::Point( 14.381907778336071,-51.446148138701545, 4326) ),
(16,'BuzzFeed', 9, geography::Point( 77.25284401521941,81.11849060671955, 4326) ),
(13,'21st Century Fox', 19, geography::Point( 58.70871624536696,-81.68424711498513, 4326) ),
(1,'Telekom', 3, geography::Point( -43.08543891930161,-50.76181791564326, 4326) ),
(1,'Mars', 8, geography::Point( -61.88139367633985,-70.50206937643381, 4326) ),
(17,'21st Century Fox', 8, geography::Point( 40.74318669294166,57.824135629532805, 4326) ),
(15,'Demaco', 21, geography::Point( -52.38526265281516,-30.81006019649977, 4326) ),
(7,'UPC', 5, geography::Point( -74.51710760703193,36.408103679305725, 4326) ),
(18,'Facebook', 21, geography::Point( 84.06514132132591,-48.95192251568117, 4326) ),
(1,'21st Century Fox', 6, geography::Point( 55.39140334047386,-24.06319757156821, 4326) ),
(13,'Global Print', 7, geography::Point( 53.0183982921933,73.9907494595981, 4326) ),
(4,'Apple Inc.', 21, geography::Point( 87.06822312868559,-33.18135244912809, 4326) ),
(1,'DynCorp', 16, geography::Point( -14.660206812029358,42.82246732026806, 4326) ),
(15,'Metro Cash&Carry', 5, geography::Point( 62.981922029068585,-28.537149020521284, 4326) ),
(4,'Areon Impex', 5, geography::Point( 39.59824127786965,-70.6270996345589, 4326) ),
(19,'Facebook', 21, geography::Point( -22.14742177735785,66.10023202428206, 4326) ),
(11,'Boeing', 8, geography::Point( 39.13613345941451,2.3593101313370823, 4326) ),
(19,'Zepter', 23, geography::Point( -87.12437456495472,46.98327762143259, 4326) ),
(9,'21st Century Fox', 21, geography::Point( -68.2537039729405,77.56164180601539, 4326) ),
(13,'BuzzFeed', 5, geography::Point( -84.0632127248019,-55.575672050800726, 4326) ),
(10,'Demaco', 24, geography::Point( -1.9015055006462802,-60.92510069892547, 4326) ),
(12,'Metro Cash&Carry', 9, geography::Point( -62.230900008913004,57.60732224873348, 4326) ),
(17,'BuzzFeed', 10, geography::Point( -72.16466293658755,11.331296232016669, 4326) ),
(9,'ExxonMobil', 11, geography::Point( 53.17561135576642,-69.01034137236921, 4326) ),
(14,'CarMax', 4, geography::Point( 1.87039835945032,81.55319210377704, 4326) ),
(13,'It Smart Group', 13, geography::Point( 33.70227335434616,28.360710806510667, 4326) ),
(20,'Areon Impex', 24, geography::Point( -89.35384909430468,-9.324568590814337, 4326) ),
(1,'AECOM', 10, geography::Point( 56.30736079069101,67.99578204162174, 4326) ),
(19,'Facebook', 14, geography::Point( 59.961303839050544,-83.50557369107536, 4326) ),
(8,'Mars', 2, geography::Point( 11.776255235815256,69.23587077747811, 4326) ),
(1,'ENEL', 22, geography::Point( 20.436966612362284,-88.56953396367102, 4326) ),
(9,'21st Century Fox', 20, geography::Point( -61.5480628231295,1.1699462299242782, 4326) ),
(4,'Telekom', 13, geography::Point( 58.216318097412625,12.162377851904012, 4326) ),
(17,'Danone', 20, geography::Point( 14.889007449244758,-72.64332619728313, 4326) ),
(10,'Carrefour', 2, geography::Point( -0.8921780702080468,44.160857341036206, 4326) ),
(18,'Global Print', 18, geography::Point( -19.77004354133848,4.348597656697521, 4326) ),
(16,'Mars', 3, geography::Point( 72.21002943067944,46.09757354993317, 4326) ),
(7,'Biolife Grup', 23, geography::Point( 67.00042777135499,-1.7521275071411537, 4326) ),
(5,'UPC', 3, geography::Point( 31.027032616437836,85.16949584366867, 4326) ),
(12,'Telekom', 18, geography::Point( -36.737225042865305,-1.2168771629011843, 4326) ),
(16,'ENEL', 4, geography::Point( -53.38178370370958,-17.11102525770073, 4326) ),
(7,'Metro Cash&Carry', 9, geography::Point( -9.19570840814039,18.89623192094875, 4326) ),
(11,'Vodafone', 18, geography::Point( -67.57577368609631,46.76265935210225, 4326) ),
(7,'ENEL', 13, geography::Point( -74.97190031483336,-5.182698174741773, 4326) );
    
--Horarios
insert into Horario(horaApertura, horaCierre, dia) values
                    ('10:10:00', '15:10:00', 'L'),
                    ('08:10:00', '19:10:00', 'K'),
                    ('05:10:00', '12:10:00', 'M'),
                    ('10:10:00', '20:10:00', 'J'),
                    ('07:10:00', '14:10:00', 'V'),
                    ('11:10:00', '22:10:00', 'S'),
                    ('09:10:00', '16:10:00', 'D');

--Horarios por sucursales
insert into HorarioxSucursal(idHorario, idSucursal) values
(1, 1),(2, 1),(3, 1),(4, 1),(5, 1),(6, 1),(7, 1),
(1, 2),(2, 2),(3, 2),(4, 2),(5, 2),(6, 2),(7, 2),
(1, 3),(2, 3),(3, 3),(4, 3),(5, 3),(6, 3),(7, 3),
(1, 4),(2, 4),(3, 4),(4, 4),(5, 4),(6, 4),(7, 4),
(1, 5),(2, 5),(3, 5),(4, 5),(5, 5),(6, 5),(7, 5),
(1, 6),(2, 6),(3, 6),(4, 6),(5, 6),(6, 6),(7, 6),
(1, 7),(2, 7),(3, 7),(4, 7),(5, 7),(6, 7),(7, 7),
(1, 8),(2, 8),(3, 8),(4, 8),(5, 8),(6, 8),(7, 8),
(1, 9),(2, 9),(3, 9),(4, 9),(5, 9),(6, 9),(7, 9),
(1, 10),(2, 10),(3, 10),(4, 10),(5, 10),(6, 10),(7, 10),
(1, 11),(2, 11),(3, 11),(4, 11),(5, 11),(6, 11),(7, 11),
(1, 12),(2, 12),(3, 12),(4, 12),(5, 12),(6, 12),(7, 12),
(1, 13),(2, 13),(3, 13),(4, 13),(5, 13),(6, 13),(7, 13),
(1, 14),(2, 14),(3, 14),(4, 14),(5, 14),(6, 14),(7, 14),
(1, 15),(2, 15),(3, 15),(4, 15),(5, 15),(6, 15),(7, 15),
(1, 16),(2, 16),(3, 16),(4, 16),(5, 16),(6, 16),(7, 16),
(1, 17),(2, 17),(3, 17),(4, 17),(5, 17),(6, 17),(7, 17),
(1, 18),(2, 18),(3, 18),(4, 18),(5, 18),(6, 18),(7, 18),
(1, 19),(2, 19),(3, 19),(4, 19),(5, 19),(6, 19),(7, 19),
(1, 20),(2, 20),(3, 20),(4, 20),(5, 20),(6, 20),(7, 20),
(1, 21),(2, 21),(3, 21),(4, 21),(5, 21),(6, 21),(7, 21),
(1, 22),(2, 22),(3, 22),(4, 22),(5, 22),(6, 22),(7, 22),
(1, 23),(2, 23),(3, 23),(4, 23),(5, 23),(6, 23),(7, 23),
(1, 24),(2, 24),(3, 24),(4, 24),(5, 24),(6, 24),(7, 24),
(1, 25),(2, 25),(3, 25),(4, 25),(5, 25),(6, 25),(7, 25),
(1, 26),(2, 26),(3, 26),(4, 26),(5, 26),(6, 26),(7, 26),
(1, 27),(2, 27),(3, 27),(4, 27),(5, 27),(6, 27),(7, 27),
(1, 28),(2, 28),(3, 28),(4, 28),(5, 28),(6, 28),(7, 28),
(1, 29),(2, 29),(3, 29),(4, 29),(5, 29),(6, 29),(7, 29),
(1, 30),(2, 30),(3, 30),(4, 30),(5, 30),(6, 30),(7, 30),
(1, 31),(2, 31),(3, 31),(4, 31),(5, 31),(6, 31),(7, 31),
(1, 32),(2, 32),(3, 32),(4, 32),(5, 32),(6, 32),(7, 32),
(1, 33),(2, 33),(3, 33),(4, 33),(5, 33),(6, 33),(7, 33),
(1, 34),(2, 34),(3, 34),(4, 34),(5, 34),(6, 34),(7, 34),
(1, 35),(2, 35),(3, 35),(4, 35),(5, 35),(6, 35),(7, 35),
(1, 36),(2, 36),(3, 36),(4, 36),(5, 36),(6, 36),(7, 36),
(1, 37),(2, 37),(3, 37),(4, 37),(5, 37),(6, 37),(7, 37),
(1, 38),(2, 38),(3, 38),(4, 38),(5, 38),(6, 38),(7, 38),
(1, 39),(2, 39),(3, 39),(4, 39),(5, 39),(6, 39),(7, 39),
(1, 40),(2, 40),(3, 40),(4, 40),(5, 40),
(1, 41),(2, 41),(3, 41),(4, 41),(5, 41),
(1, 42),(2, 42),(3, 42),(4, 42),(5, 42),
(1, 43),(2, 43),(3, 43),(4, 43),(5, 43),
(1, 44),(2, 44),(3, 44),(4, 44),(5, 44),
(1, 45),(2, 45),(3, 45),(4, 45),(5, 45),
(1, 46),(2, 46),(3, 46),(4, 46),(5, 46),
(1, 47),(2, 47),(3, 47),(4, 47),(5, 47),
(1, 48),(2, 48),(3, 48),(4, 48),(5, 48),
(1, 49),(2, 49),(3, 49),(4, 49),(5, 49),
(1, 50),(2, 50),(3, 50),(4, 50),(5, 50);

--Estados
insert into Estado(nombre) values
('Inactivo'), ('Activo'), ('Exhibiendo'), ('Vencido'), ('Vendido'), ('Pendiente'),
('Recibido'), ('Entregado'), ('Reservado'), ('En descuento'); 

--Departamentos
insert into Departamento(nombreDepartamento) values 
            ('Servicio Cliente'),
            ('Finanzas'),
            ('Planeacion');

--Puestos

insert into Puesto(nombrePuesto, idDepartamento, salario) values
                ('Facturador', 1,  1000),
                ('Admin', 2,  3500),
                ('Junior', 3,  1550);


--Empleado
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1, 1, 1, 18181818, 'SISTEMA', 'SISTEMA', 'SISTEMA', 'SISTEMA@gmail.com', '2020-12-15', '2002-12-15'),
(1,15,1,685837268,'Liam','Herbert','Herbert','Liam_Herbert8417@bretoux.com','6995-03-10 15:21:09Z','0065-08-16 21:37:41Z'),
(2,48,1,533363393,'Caitlyn','Robertson','Robertson','Caitlyn_Robertson2614@naiker.biz','9212-10-20 00:16:08Z','3075-03-30 12:19:16Z'),
(2,19,1,454393174,'Julia','Wooldridge','Wooldridge','Julia_Wooldridge516@twace.org','5400-12-05 02:55:01Z','5644-10-28 06:29:43Z'),
(1,12,1,707099824,'Fred','Pond','Pond','Fred_Pond4427@bungar.biz','9494-01-19 02:33:09Z','3920-12-13 03:02:52Z'),
(1,14,1,537764098,'Rose','Brett','Brett','Rose_Brett5233@joiniaa.com','1129-08-16 08:18:45Z','3568-12-23 17:45:24Z'),
(1,5,1,557365415,'Angela','Andrews','Andrews','Angela_Andrews8928@cispeto.com','0519-04-10 18:28:57Z','1480-12-24 22:53:08Z'),
(1,12,1,341976247,'Erick','Logan','Logan','Erick_Logan3738@acrit.org','6059-09-06 09:07:09Z','5926-01-28 08:46:44Z'),
(1,47,1,183339797,'Valerie','Ramsey','Ramsey','Valerie_Ramsey4691@yahoo.com','5628-06-18 05:02:26Z','9648-08-21 09:24:36Z'),
(2,27,1,224247276,'Daron','Tyrrell','Tyrrell','Daron_Tyrrell6@liret.org','3922-09-06 03:45:20Z','4593-03-12 09:40:13Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,48,1,727506124,'Violet','Marshall','Marshall','Violet_Marshall9096@jiman.org','2386-07-21 21:19:52Z','6411-01-15 00:42:32Z'),
(2,13,1,723156422,'Julian','Pickard','Pickard','Julian_Pickard5078@zorer.org','8066-06-16 12:41:40Z','1036-04-09 18:20:13Z'),
(1,23,1,647114749,'Logan','Nielson','Nielson','Logan_Nielson1186@guentu.biz','0699-08-07 22:39:19Z','7511-08-22 03:02:47Z'),
(2,22,1,447850070,'Rebecca','Uddin','Uddin','Rebecca_Uddin1310@bulaffy.com','0591-04-28 22:12:33Z','1351-04-13 03:58:39Z'),
(2,13,1,452317825,'Josh','Vinton','Vinton','Josh_Vinton6014@guentu.biz','6555-03-30 01:49:31Z','0555-10-27 09:38:52Z'),
(1,45,1,353031949,'Sebastian','Thomson','Thomson','Sebastian_Thomson8519@sheye.org','7547-03-10 00:53:18Z','9348-04-26 19:39:39Z'),
(2,39,1,815661857,'Denis','Morris','Morris','Denis_Morris8996@grannar.com','5623-12-31 19:16:21Z','0036-07-03 13:32:40Z'),
(1,4,1,558940543,'Daron','Kennedy','Kennedy','Daron_Kennedy7076@nickia.com','1314-11-28 06:40:33Z','7206-12-04 05:09:51Z'),
(2,43,1,799188331,'Megan','Oakley','Oakley','Megan_Oakley8247@sheye.org','6817-03-30 15:33:23Z','7511-09-08 09:21:37Z'),
(2,30,1,329998152,'John','Hardwick','Hardwick','John_Hardwick5349@liret.org','7113-09-02 20:12:57Z','8417-01-26 14:07:29Z'),
(2,34,1,493994689,'Harvey','Hunt','Hunt','Harvey_Hunt1203@typill.biz','6255-06-21 01:08:15Z','3803-03-23 19:19:55Z'),
(1,28,1,825453066,'Jazmin','Allwood','Allwood','Jazmin_Allwood1125@muall.tech','5278-06-25 19:36:46Z','8400-03-04 00:26:53Z'),
(2,33,1,160682548,'Doug','Cattell','Cattell','Doug_Cattell5988@corti.com','6524-10-15 22:23:57Z','3311-06-13 01:51:02Z'),
(1,28,1,821936270,'Elijah','Ballard','Ballard','Elijah_Ballard9221@qater.org','2851-10-26 10:29:00Z','7855-04-18 00:41:20Z'),
(1,33,1,161171878,'Claire','Vinton','Vinton','Claire_Vinton5582@elnee.tech','8965-11-10 19:42:39Z','1968-01-15 18:43:44Z'),
(2,44,1,131589191,'Juliette','Clark','Clark','Juliette_Clark6788@liret.org','6830-03-23 19:05:27Z','8669-06-30 21:40:36Z'),
(2,11,1,590326769,'Cadence','Squire','Squire','Cadence_Squire7767@irrepsy.com','3071-02-21 00:11:09Z','0884-10-12 14:45:15Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,40,1,419093531,'Olivia','Reid','Reid','Olivia_Reid6545@qater.org','8012-07-10 09:27:55Z','0297-05-14 20:01:03Z'),
(2,26,1,530175635,'Ethan','Bradley','Bradley','Ethan_Bradley8011@gompie.com','1582-05-23 17:28:03Z','5946-06-12 04:19:12Z'),
(2,43,1,495085935,'Cara','Janes','Janes','Cara_Janes535@sheye.org','8887-07-06 19:18:31Z','2774-10-11 02:10:06Z'),
(2,13,1,177728397,'Kieth','Boden','Boden','Kieth_Boden9680@hourpy.biz','5541-01-11 02:10:46Z','2067-01-30 04:08:43Z'),
(1,8,1,748113312,'Hailey','Eastwood','Eastwood','Hailey_Eastwood9912@sheye.org','2861-07-18 16:28:01Z','8807-08-13 14:18:55Z'),
(2,4,1,207916503,'Courtney','Funnell','Funnell','Courtney_Funnell8829@muall.tech','6027-11-02 05:51:57Z','6821-06-07 15:10:47Z'),
(2,1,1,879396963,'Leslie','Rivers','Rivers','Leslie_Rivers2209@ubusive.com','7083-06-15 11:28:47Z','6733-06-01 10:51:49Z'),
(2,4,1,630150193,'Karla','Ingham','Ingham','Karla_Ingham3228@atink.com','1901-10-29 20:06:46Z','6040-02-11 01:18:13Z'),
(2,15,1,768775802,'Phillip','Mitchell','Mitchell','Phillip_Mitchell7839@typill.biz','0692-11-17 03:23:49Z','9294-06-02 18:00:08Z'),
(2,6,1,753707392,'Owen','Donnelly','Donnelly','Owen_Donnelly5836@typill.biz','6964-09-04 03:06:31Z','1044-05-04 09:09:34Z'),
(2,29,1,548354453,'Agnes','Glass','Glass','Agnes_Glass9426@qater.org','2827-11-16 07:54:18Z','2607-05-29 02:06:38Z'),
(1,11,1,567034649,'Angela','Forester','Forester','Angela_Forester4569@fuliss.net','9536-05-30 19:39:16Z','9648-07-15 16:14:15Z'),
(1,21,1,680204420,'Stella','Yarlett','Yarlett','Stella_Yarlett1294@infotech44.tech','3630-05-28 04:39:30Z','4358-04-11 01:58:51Z'),
(1,47,1,650870394,'Erick','Samuel','Samuel','Erick_Samuel3436@grannar.com','0675-09-06 05:15:33Z','3179-05-03 13:39:02Z'),
(1,34,1,574414194,'Percy','Crawford','Crawford','Percy_Crawford293@vetan.org','6368-01-11 13:46:29Z','5179-02-20 17:40:24Z'),
(1,15,1,874772614,'Camden','Fisher','Fisher','Camden_Fisher9917@tonsy.org','8990-04-24 18:51:23Z','0452-01-26 13:58:27Z'),
(2,16,1,254442600,'Peyton','Matthews','Matthews','Peyton_Matthews3905@dionrab.com','1692-07-28 05:32:02Z','5496-07-16 10:34:09Z'),
(1,19,1,608117539,'Marina','Gregory','Gregory','Marina_Gregory3319@joiniaa.com','2154-08-18 08:09:13Z','5916-12-17 00:47:02Z'),
(2,19,1,888580996,'Chester','Buckley','Buckley','Chester_Buckley4569@guentu.biz','0254-07-07 08:25:08Z','3494-10-10 07:16:13Z'),
(1,31,1,257609050,'Bart','Bullock','Bullock','Bart_Bullock2146@naiker.biz','0153-09-05 08:13:49Z','5775-08-12 04:44:58Z'),
(2,11,1,222687625,'Tyler','Thomson','Thomson','Tyler_Thomson7373@brety.org','8854-10-21 16:52:15Z','8659-11-09 01:52:58Z'),
(2,10,1,490956827,'Abdul','Nobbs','Nobbs','Abdul_Nobbs6494@gembat.biz','1428-06-03 03:13:03Z','4478-11-25 03:40:08Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,4,1,702132904,'Mark','Gonzales','Gonzales','Mark_Gonzales5364@irrepsy.com','1600-11-16 11:19:30Z','1493-10-28 07:20:50Z'),
(2,28,1,400164545,'Irene','Milner','Milner','Irene_Milner6476@ovock.tech','9163-06-30 15:29:40Z','4376-11-27 12:11:07Z'),
(1,40,1,846370648,'Denny','Hill','Hill','Denny_Hill2284@yahoo.com','6048-11-08 14:19:40Z','9934-08-07 19:52:12Z'),
(2,6,1,188243895,'Raquel','Grant','Grant','Raquel_Grant2865@typill.biz','3814-01-08 02:01:46Z','7223-12-21 22:07:23Z'),
(2,26,1,867141110,'Maxwell','Redwood','Redwood','Maxwell_Redwood50@acrit.org','2954-10-21 10:18:15Z','9228-11-22 19:36:27Z'),
(2,5,1,316125473,'Mason','Potts','Potts','Mason_Potts7742@twace.org','9785-09-07 07:11:14Z','8824-11-18 14:12:17Z'),
(2,18,1,577614947,'Luke','Adams','Adams','Luke_Adams9081@sheye.org','4559-12-24 13:56:32Z','4585-02-14 05:24:18Z'),
(1,2,1,498942897,'Barry','Bailey','Bailey','Barry_Bailey130@hourpy.biz','2173-12-17 19:47:05Z','4129-12-02 18:06:56Z'),
(2,13,1,327736460,'Joy','Carpenter','Carpenter','Joy_Carpenter2987@cispeto.com','2125-05-01 05:47:34Z','5201-07-24 01:46:55Z'),
(2,9,1,680756105,'Matthew','Wright','Wright','Matthew_Wright4078@sheye.org','1952-09-08 02:05:39Z','0431-01-22 17:50:34Z'),
(1,8,1,544807628,'Caleb','Camden','Camden','Caleb_Camden8891@extex.org','0052-03-10 11:12:14Z','6972-05-25 18:01:09Z'),
(1,47,1,877850347,'Carissa','Cadman','Cadman','Carissa_Cadman6431@cispeto.com','3251-03-08 00:11:49Z','1695-04-09 10:56:00Z'),
(2,31,1,488629530,'Leilani','Lee','Lee','Leilani_Lee2170@brety.org','7425-12-06 03:12:30Z','4980-04-14 07:04:29Z'),
(2,45,1,730309790,'Quinn','Cameron','Cameron','Quinn_Cameron6148@yahoo.com','2011-12-15 21:40:08Z','8356-12-02 00:14:13Z'),
(1,20,1,808279956,'Cecilia','Shields','Shields','Cecilia_Shields6425@liret.org','3770-06-01 10:25:58Z','8270-11-24 15:07:20Z'),
(2,3,1,877616618,'Jasmine','Duvall','Duvall','Jasmine_Duvall649@kideod.biz','8740-02-01 07:30:34Z','9069-01-03 03:56:17Z'),
(1,34,1,729218758,'Peter','Booth','Booth','Peter_Booth753@grannar.com','8959-02-08 02:10:02Z','3741-01-21 05:33:47Z'),
(1,10,1,872224673,'Jules','Middleton','Middleton','Jules_Middleton4183@elnee.tech','2390-06-18 08:06:38Z','4701-05-29 06:28:41Z'),
(1,22,1,668837644,'Domenic','Ring','Ring','Domenic_Ring2159@elnee.tech','4950-08-01 22:52:23Z','5000-01-11 02:56:46Z'),
(2,38,1,576316793,'Peter','Jenkin','Jenkin','Peter_Jenkin5977@acrit.org','2395-04-06 20:56:53Z','4258-09-14 18:40:20Z'),
(2,7,1,601646389,'Joseph','Gray','Gray','Joseph_Gray7270@grannar.com','2377-11-20 08:31:02Z','7390-06-07 05:09:50Z'),
(1,36,1,636799650,'Kieth','Coleman','Coleman','Kieth_Coleman7318@gmail.com','1511-02-25 22:15:30Z','0692-11-17 03:11:03Z'),
(1,41,1,853382890,'Megan','Richards','Richards','Megan_Richards6203@famism.biz','2365-02-23 22:04:18Z','5004-10-30 14:46:02Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,48,1,449318431,'Mike','Gates','Gates','Mike_Gates7390@jiman.org','6081-02-23 09:27:01Z','1686-01-03 04:19:57Z'),
(2,17,1,867657880,'Gil','Devonport','Devonport','Gil_Devonport7340@vetan.org','7548-08-21 02:39:03Z','6506-04-27 07:27:28Z'),
(2,12,1,864525744,'Bob','Healy','Healy','Bob_Healy5776@nickia.com','6301-09-25 22:08:01Z','0680-02-20 17:43:19Z'),
(2,23,1,551951590,'Hope','Myatt','Myatt','Hope_Myatt2562@typill.biz','0298-09-26 21:04:12Z','9574-10-30 01:00:31Z'),
(2,5,1,412843798,'Nathan','Radley','Radley','Nathan_Radley9672@twipet.com','4315-05-01 08:34:34Z','6869-07-01 07:54:42Z'),
(2,1,1,883794793,'Hadley','Gardner','Gardner','Hadley_Gardner8089@twace.org','5087-04-11 19:29:27Z','6726-11-27 20:08:28Z'),
(1,32,1,710133020,'Daron','Clayton','Clayton','Daron_Clayton5264@twipet.com','0170-11-25 05:39:13Z','3429-03-27 14:08:28Z'),
(1,49,1,615272949,'Chadwick','Reading','Reading','Chadwick_Reading1086@eirey.tech','8797-09-06 16:27:48Z','7588-06-04 11:25:05Z'),
(1,14,1,687367826,'Bryon','Harrington','Harrington','Bryon_Harrington4621@nimogy.biz','1797-11-18 08:08:53Z','1659-01-15 05:20:58Z'),
(1,8,1,739995734,'Juliet','Eastwood','Eastwood','Juliet_Eastwood3006@cispeto.com','4259-07-28 04:03:27Z','2582-06-23 17:13:07Z'),
(2,43,1,681114327,'David','Thomas','Thomas','David_Thomas890@ovock.tech','1858-08-17 02:57:20Z','7139-08-24 10:06:49Z'),
(1,15,1,454270469,'Leroy','Farrow','Farrow','Leroy_Farrow169@liret.org','9099-10-22 21:23:13Z','9215-05-29 14:53:46Z'),
(2,24,1,488529569,'Nate','Attwood','Attwood','Nate_Attwood8499@qater.org','6668-11-07 01:19:09Z','7119-12-06 16:55:37Z'),
(2,47,1,625749565,'Zara','Holmes','Holmes','Zara_Holmes1494@cispeto.com','1934-03-09 21:40:42Z','2643-03-22 10:04:33Z'),
(2,32,1,148881212,'Danny','Jacobs','Jacobs','Danny_Jacobs3101@mafthy.com','5858-03-10 00:40:03Z','1980-11-18 05:26:34Z'),
(2,47,1,426886877,'Audrey','Clifton','Clifton','Audrey_Clifton6678@extex.org','1495-03-14 07:09:07Z','4026-08-20 14:15:35Z'),
(2,16,1,620246644,'Ramon','Sawyer','Sawyer','Ramon_Sawyer6591@dionrab.com','6685-02-12 16:27:26Z','9953-04-21 16:13:07Z'),
(1,7,1,291625187,'Quinn','Dallas','Dallas','Quinn_Dallas3460@dionrab.com','5569-07-04 15:08:26Z','1832-07-22 09:25:26Z'),
(1,8,1,547851738,'Maggie','Jacobs','Jacobs','Maggie_Jacobs1516@acrit.org','8060-10-14 22:12:31Z','1541-11-24 14:55:00Z'),
(1,7,1,759433895,'Johnathan','Villiger','Villiger','Johnathan_Villiger2776@gompie.com','4281-11-19 05:30:35Z','4853-07-25 07:01:58Z'),
(1,4,1,495448524,'Caleb','Farrow','Farrow','Caleb_Farrow6011@guentu.biz','4653-02-26 21:08:31Z','4028-08-11 01:12:26Z'),
(1,15,1,347913318,'Destiny','Gunn','Gunn','Destiny_Gunn6893@extex.org','5388-11-09 17:37:43Z','3208-03-23 15:10:32Z'),
(1,42,1,783334077,'Cameron','Utterson','Utterson','Cameron_Utterson2488@bungar.biz','2268-12-19 10:08:02Z','0254-04-11 04:17:09Z'),
(1,36,1,541003318,'Jackeline','Anderson','Anderson','Jackeline_Anderson4725@cispeto.com','9901-03-18 08:56:09Z','1445-12-07 05:56:58Z'),
(2,18,1,884422454,'Mason','Coates','Coates','Mason_Coates3571@supunk.biz','3417-12-01 06:32:56Z','5135-08-03 12:20:33Z'),
(2,23,1,693363959,'Sasha','Buckley','Buckley','Sasha_Buckley3699@acrit.org','6142-09-23 15:16:44Z','0824-01-14 05:10:03Z'),
(1,46,1,636064915,'Mina','Todd','Todd','Mina_Todd245@nanoff.biz','5485-12-06 00:54:32Z','4766-08-16 18:36:34Z'),
(2,25,1,394509949,'Ilona','Ingram','Ingram','Ilona_Ingram2406@iatim.tech','0539-02-27 14:04:36Z','2594-11-17 01:21:52Z'),
(1,21,1,100051407,'Zara','Benson','Benson','Zara_Benson1470@gompie.com','7143-03-18 11:26:46Z','1377-02-08 19:39:10Z'),
(2,34,1,537880027,'Benjamin','Corbett','Corbett','Benjamin_Corbett3057@yahoo.com','3240-10-02 18:56:32Z','2892-01-19 21:32:38Z'),
(2,11,1,479438295,'Summer','Palmer','Palmer','Summer_Palmer6650@naiker.biz','9373-09-26 07:46:49Z','9162-01-19 17:23:26Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,34,1,140537994,'Esmeralda','Holt','Holt','Esmeralda_Holt7232@infotech44.tech','9295-07-17 04:11:01Z','4252-02-28 12:52:07Z'),
(1,23,1,206921501,'Elisabeth','Butler','Butler','Elisabeth_Butler5754@bauros.biz','6884-06-14 18:30:11Z','4078-09-14 01:32:05Z'),
(1,43,1,762331915,'Kimberly','Rowan','Rowan','Kimberly_Rowan8381@cispeto.com','4307-06-28 07:27:45Z','5122-08-01 17:52:42Z'),
(1,46,1,514249806,'Rebecca','King','King','Rebecca_King815@twipet.com','9677-07-28 12:12:45Z','5217-11-03 02:37:55Z'),
(1,2,1,444897642,'Peter','Mcneill','Mcneill','Peter_Mcneill7705@iatim.tech','8165-04-20 20:06:58Z','1762-11-15 00:36:28Z'),
(2,31,1,195886144,'Rosemary','Stewart','Stewart','Rosemary_Stewart9209@womeona.net','8951-12-27 08:37:43Z','9089-08-24 04:49:48Z'),
(2,43,1,280830084,'Tom','Lindop','Lindop','Tom_Lindop730@guentu.biz','4026-04-16 14:57:18Z','7915-09-15 11:35:17Z'),
(1,1,1,634104513,'Norah','Wright','Wright','Norah_Wright2063@bulaffy.com','5820-11-24 04:08:52Z','9075-08-27 15:15:09Z'),
(1,37,1,519691125,'Tess','Crawley','Crawley','Tess_Crawley1763@liret.org','8620-09-14 16:55:12Z','1037-04-15 20:01:26Z'),
(2,41,1,145672338,'Maria','Crawford','Crawford','Maria_Crawford3810@ubusive.com','3611-12-13 04:54:00Z','4950-08-20 21:42:09Z'),
(1,42,1,297176628,'Enoch','Hall','Hall','Enoch_Hall5102@kideod.biz','9494-03-11 22:15:40Z','4784-08-11 06:06:26Z'),
(2,23,1,415514779,'Nick','Stark','Stark','Nick_Stark5088@tonsy.org','3404-01-21 01:14:12Z','3671-01-25 17:13:03Z'),
(2,10,1,813120089,'Tom','Gates','Gates','Tom_Gates6330@vetan.org','9230-02-01 04:06:38Z','8827-05-03 20:48:33Z'),
(2,13,1,856537602,'Johnathan','Adams','Adams','Johnathan_Adams8964@famism.biz','4321-01-25 16:15:13Z','5824-02-15 04:02:36Z'),
(2,46,1,802628196,'Payton','Goodman','Goodman','Payton_Goodman3811@sheye.org','5446-09-13 08:23:32Z','4576-09-18 03:25:38Z'),
(2,48,1,754321193,'Gabriel','Dallas','Dallas','Gabriel_Dallas1411@qater.org','5137-06-28 07:21:22Z','3406-12-20 00:04:01Z'),
(1,45,1,777633895,'Chuck','Tanner','Tanner','Chuck_Tanner7572@nanoff.biz','1464-12-30 21:29:29Z','9744-05-08 13:49:34Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,4,1,817547181,'George','Owen','Owen','George_Owen2634@yahoo.com','5034-06-01 02:00:23Z','2040-09-25 07:18:30Z'),
(2,26,1,735738902,'Kurt','Blythe','Blythe','Kurt_Blythe1718@muall.tech','8835-07-16 00:37:20Z','5393-02-19 16:31:47Z'),
(2,1,1,316761991,'Cristal','Warren','Warren','Cristal_Warren8993@typill.biz','4712-02-04 17:43:45Z','9424-04-06 13:11:57Z'),
(2,16,1,216784633,'Martin','Wilkinson','Wilkinson','Martin_Wilkinson5125@eirey.tech','6687-05-13 00:36:40Z','9641-04-10 08:28:34Z'),
(2,15,1,115022773,'Barney','Welsch','Welsch','Barney_Welsch5862@extex.org','3250-04-14 08:25:51Z','9411-04-12 09:26:22Z'),
(1,11,1,303196344,'Melania','Cox','Cox','Melania_Cox8343@yahoo.com','0872-06-22 20:16:07Z','5070-10-25 08:15:11Z'),
(2,44,1,632738485,'Adina','Phillips','Phillips','Adina_Phillips5060@nanoff.biz','3114-03-29 13:05:21Z','7276-02-01 13:10:17Z'),
(1,14,1,540017790,'Harvey','Rees','Rees','Harvey_Rees3422@extex.org','0063-09-22 16:18:50Z','8179-06-20 22:09:40Z'),
(2,27,1,250914446,'Nathan','Leigh','Leigh','Nathan_Leigh2119@deons.tech','6324-09-14 10:44:38Z','3596-05-22 07:05:49Z'),
(1,49,1,570704414,'Aileen','Funnell','Funnell','Aileen_Funnell4495@nickia.com','6240-11-15 21:11:18Z','4934-10-08 14:54:40Z'),
(2,32,1,836731876,'Chuck','Thorne','Thorne','Chuck_Thorne6511@irrepsy.com','1865-07-21 17:35:19Z','6467-05-03 09:13:01Z'),
(2,9,1,271470773,'Benjamin','Clayton','Clayton','Benjamin_Clayton1423@cispeto.com','7571-04-15 13:01:45Z','1390-12-08 19:48:57Z'),
(1,23,1,481247506,'Deborah','Newton','Newton','Deborah_Newton6793@twace.org','8059-05-18 20:50:19Z','9773-07-15 12:57:17Z'),
(2,37,1,668419150,'Noemi','Warden','Warden','Noemi_Warden5640@joiniaa.com','2175-08-02 03:37:40Z','0475-08-14 21:45:21Z'),
(1,38,1,855116058,'Irene','Holmes','Holmes','Irene_Holmes6734@deons.tech','8171-05-06 00:16:10Z','7797-09-30 00:03:28Z'),
(1,4,1,679350810,'Gabriel','Knight','Knight','Gabriel_Knight5627@dionrab.com','8352-04-18 02:02:26Z','7584-10-04 21:05:57Z'),
(1,10,1,203261366,'Abdul','Thatcher','Thatcher','Abdul_Thatcher6579@iatim.tech','5197-10-16 16:16:13Z','4377-11-01 02:34:12Z'),
(2,34,1,490237807,'Gabriel','Mcguire','Mcguire','Gabriel_Mcguire3277@zorer.org','0647-10-19 18:36:37Z','0587-08-03 01:11:11Z'),
(2,43,1,849567092,'Hazel','Kelly','Kelly','Hazel_Kelly9840@sveldo.biz','5036-01-26 22:16:49Z','3975-06-19 22:27:13Z'),
(1,20,1,322054720,'Julianna','Herbert','Herbert','Julianna_Herbert787@eirey.tech','6962-12-17 00:01:57Z','4611-03-16 14:04:01Z'),
(2,36,1,135577746,'Nicholas','Zaoui','Zaoui','Nicholas_Zaoui7350@supunk.biz','5257-09-22 01:02:01Z','6672-05-02 18:09:23Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,39,1,689455123,'Barney','Benfield','Benfield','Barney_Benfield9935@nimogy.biz','7312-07-18 04:56:07Z','0425-11-13 07:11:48Z'),
(1,37,1,686038755,'Leslie','Dobson','Dobson','Leslie_Dobson5224@guentu.biz','9323-07-21 01:02:13Z','0291-08-18 05:51:33Z'),
(2,15,1,649216727,'Audrey','Grady','Grady','Audrey_Grady1402@gmail.com','5830-10-17 06:46:15Z','4832-11-10 17:49:12Z'),
(1,21,1,539276420,'Thea','Tanner','Tanner','Thea_Tanner4208@qater.org','1608-09-27 15:56:26Z','7021-12-02 22:04:32Z'),
(2,45,1,330100222,'Tom','Riley','Riley','Tom_Riley9627@gmail.com','3046-07-06 15:43:36Z','4491-09-09 07:11:00Z'),
(2,23,1,604261513,'Bryce','Carter','Carter','Bryce_Carter6628@hourpy.biz','3128-03-05 06:10:53Z','8808-11-15 07:41:42Z'),
(1,46,1,424343010,'Chad','Turner','Turner','Chad_Turner3405@tonsy.org','6822-06-02 04:40:13Z','7117-01-18 08:44:25Z'),
(1,30,1,286193223,'Enoch','Osmond','Osmond','Enoch_Osmond700@kideod.biz','6339-05-30 10:46:27Z','4237-08-20 08:01:52Z'),
(1,14,1,844466195,'Nathan','Mitchell','Mitchell','Nathan_Mitchell9305@kideod.biz','1036-06-23 05:57:36Z','6011-02-15 21:24:27Z'),
(1,5,1,409939609,'Christine','Weatcroft','Weatcroft','Christine_Weatcroft4098@ovock.tech','8149-07-28 04:33:42Z','2585-10-14 18:38:19Z'),
(1,25,1,448454290,'Matthew','Neville','Neville','Matthew_Neville3428@naiker.biz','6761-07-13 05:05:49Z','0329-04-15 12:21:58Z'),
(1,46,1,453218702,'Julian','Locke','Locke','Julian_Locke1251@infotech44.tech','5675-09-30 14:21:42Z','8450-09-09 09:19:16Z'),
(2,46,1,163325621,'Ivette','Holt','Holt','Ivette_Holt1076@vetan.org','7213-11-19 05:18:07Z','7821-04-16 15:11:43Z'),
(2,35,1,452963749,'Caleb','Bristow','Bristow','Caleb_Bristow7784@irrepsy.com','1800-05-30 03:57:03Z','8310-11-03 18:44:32Z'),
(2,22,1,763859161,'Angelina','Welsch','Welsch','Angelina_Welsch3394@hourpy.biz','0085-06-13 13:47:50Z','7854-06-16 22:10:58Z'),
(2,31,1,321711872,'Cherish','Lee','Lee','Cherish_Lee7900@vetan.org','2524-12-15 03:07:32Z','8903-01-17 09:33:33Z'),
(2,38,1,515759514,'Cedrick','Spencer','Spencer','Cedrick_Spencer5421@vetan.org','5145-07-21 01:57:36Z','3945-12-14 04:47:03Z'),
(2,7,1,129877818,'Winnie','Shaw','Shaw','Winnie_Shaw6268@gembat.biz','4962-09-15 11:12:17Z','1182-05-28 03:14:16Z'),
(1,20,1,880664678,'Irene','Summers','Summers','Irene_Summers8615@nickia.com','6336-08-05 04:48:00Z','8579-01-02 21:19:28Z'),
(1,21,1,444218118,'Bernadette','Walker','Walker','Bernadette_Walker6932@bretoux.com','3951-01-03 13:19:18Z','3964-02-24 20:43:19Z'),
(1,20,1,387764765,'Charlotte','Baker','Baker','Charlotte_Baker2838@gmail.com','0799-04-08 22:47:12Z','6383-09-14 12:51:47Z'),
(2,40,1,810025404,'Roger','Mitchell','Mitchell','Roger_Mitchell9764@nickia.com','5067-05-20 21:30:21Z','2373-06-13 06:04:39Z'),
(2,46,1,256040538,'Bryon','Mitchell','Mitchell','Bryon_Mitchell1446@dionrab.com','0038-07-20 13:52:05Z','7567-04-22 01:27:30Z'),
(1,46,1,251358715,'Jolene','Saunders','Saunders','Jolene_Saunders4192@nimogy.biz','5904-12-14 15:44:00Z','8425-10-26 16:43:31Z'),
(2,46,1,394675943,'Alma','Mitchell','Mitchell','Alma_Mitchell7034@hourpy.biz','0850-09-07 05:05:33Z','7500-01-29 19:03:49Z'),
(1,8,1,573566203,'Ronald','Wheeler','Wheeler','Ronald_Wheeler6678@cispeto.com','7446-12-27 03:22:03Z','1612-09-24 19:08:33Z'),
(1,27,1,471690995,'Amy','Uddin','Uddin','Amy_Uddin7837@gmail.com','8467-04-17 07:19:07Z','8404-11-14 18:41:09Z'),
(2,28,1,312175998,'Andrea','Purvis','Purvis','Andrea_Purvis503@zorer.org','6550-10-15 19:18:45Z','9237-12-13 08:55:00Z'),
(1,26,1,851756863,'Dalia','Graves','Graves','Dalia_Graves3983@liret.org','1535-05-14 00:20:22Z','9042-02-11 07:40:52Z'),
(1,29,1,607446619,'Liam','Morrison','Morrison','Liam_Morrison7421@vetan.org','1173-04-01 01:27:35Z','9229-05-04 22:22:06Z'),
(1,10,1,498848159,'Sloane','Denton','Denton','Sloane_Denton9580@famism.biz','4453-11-09 12:41:28Z','7508-09-04 12:37:51Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,18,1,272916973,'Clint','James','James','Clint_James3119@ubusive.com','2120-01-16 03:55:36Z','2306-01-09 01:56:16Z'),
(2,25,1,279498244,'Nicole','Vangness','Vangness','Nicole_Vangness2455@mafthy.com','4289-01-09 09:02:07Z','3664-07-27 12:48:43Z'),
(2,2,1,719096498,'Carter','Olivier','Olivier','Carter_Olivier7948@atink.com','0836-04-12 03:01:24Z','2148-11-01 11:43:12Z'),
(2,8,1,881185455,'Hadley','Blythe','Blythe','Hadley_Blythe5613@iatim.tech','0818-02-11 03:16:12Z','8455-06-20 14:06:51Z'),
(1,47,1,212251464,'Doug','Gibbons','Gibbons','Doug_Gibbons9958@dionrab.com','8565-12-21 01:13:10Z','2141-03-10 21:17:54Z'),
(2,34,1,696472014,'Martin','Cartwright','Cartwright','Martin_Cartwright7416@atink.com','8420-08-15 11:30:55Z','2380-10-23 12:54:31Z'),
(1,40,1,657074641,'Ron','Palmer','Palmer','Ron_Palmer786@bulaffy.com','3409-08-29 00:20:26Z','8676-12-03 05:58:17Z'),
(2,21,1,710290700,'Christy','Yarlett','Yarlett','Christy_Yarlett2298@extex.org','1232-08-24 08:28:07Z','6186-02-28 12:17:37Z'),
(2,24,1,766714252,'Wade','Wilton','Wilton','Wade_Wilton5860@hourpy.biz','2936-10-10 19:23:41Z','9743-09-13 06:31:37Z'),
(2,24,1,854790642,'Johnathan','Whitmore','Whitmore','Johnathan_Whitmore39@deavo.com','5520-09-30 21:35:46Z','7223-06-30 11:02:48Z'),
(2,25,1,485922019,'Rowan','London','London','Rowan_London6303@bungar.biz','2896-09-01 03:48:16Z','1488-12-11 02:55:28Z'),
(2,41,1,551360257,'Jolene','Vane','Vane','Jolene_Vane6784@twace.org','6754-08-06 10:58:02Z','5713-04-12 08:21:52Z'),
(2,2,1,451845631,'Erin','Thomas','Thomas','Erin_Thomas6932@fuliss.net','4103-01-12 13:10:24Z','4032-10-19 19:38:18Z'),
(2,11,1,736632133,'Phillip','Slater','Slater','Phillip_Slater9410@acrit.org','8141-04-07 12:38:52Z','7183-05-24 18:27:23Z'),
(1,45,1,305249238,'Penny','Wheeler','Wheeler','Penny_Wheeler6158@grannar.com','5221-11-21 02:29:41Z','2722-10-19 14:19:43Z'),
(2,8,1,754869486,'Gabriel','Rees','Rees','Gabriel_Rees789@deons.tech','5316-02-19 20:02:07Z','6919-08-22 18:42:00Z'),
(1,37,1,715513260,'Chris','Yarwood','Yarwood','Chris_Yarwood8922@eirey.tech','1348-09-05 15:25:38Z','5419-06-22 20:18:08Z'),
(1,16,1,672676357,'Mina','Burnley','Burnley','Mina_Burnley3844@nanoff.biz','8106-07-30 10:33:24Z','8302-04-03 07:46:40Z'),
(1,30,1,720752275,'William','Nanton','Nanton','William_Nanton4833@gompie.com','8932-12-23 13:37:25Z','9896-08-29 22:43:58Z'),
(1,20,1,222354115,'Angelique','Hewitt','Hewitt','Angelique_Hewitt4574@mafthy.com','6749-10-11 09:19:48Z','3046-06-05 08:38:56Z'),
(2,36,1,417630986,'Daria','Shelton','Shelton','Daria_Shelton5447@atink.com','4850-12-02 02:43:43Z','8209-11-30 10:49:25Z'),
(2,20,1,300380822,'Laila','Leigh','Leigh','Laila_Leigh4409@nanoff.biz','3637-09-15 20:09:43Z','5887-07-22 05:58:28Z'),
(1,1,1,197532240,'Elisabeth','Judd','Judd','Elisabeth_Judd4424@fuliss.net','5570-06-05 21:42:50Z','8539-11-12 21:28:23Z'),
(2,13,1,810405319,'Claire','Nicholls','Nicholls','Claire_Nicholls8041@gembat.biz','8882-08-10 02:22:23Z','8963-05-14 20:44:15Z'),
(1,41,1,251471102,'Logan','Stevens','Stevens','Logan_Stevens2616@eirey.tech','6317-05-07 13:42:19Z','5097-11-04 22:39:20Z'),
(2,37,1,870540728,'Judith','Savage','Savage','Judith_Savage9380@bulaffy.com','3574-06-17 05:03:36Z','6607-01-22 01:56:35Z'),
(2,33,1,743183972,'Tom','Plant','Plant','Tom_Plant9925@muall.tech','8524-07-08 14:04:52Z','3785-10-06 03:42:02Z'),
(1,1,1,105292036,'Daron','Mitchell','Mitchell','Daron_Mitchell7507@twipet.com','2235-01-29 18:12:37Z','9710-04-16 11:45:42Z'),
(1,49,1,733132328,'Joseph','Rogers','Rogers','Joseph_Rogers2290@bretoux.com','9874-06-12 04:50:00Z','9788-09-09 01:19:33Z'),
(2,47,1,802052552,'Rowan','Burnley','Burnley','Rowan_Burnley9561@cispeto.com','7196-11-14 10:46:01Z','8814-03-25 02:18:09Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,36,1,507612421,'Leanne','Palmer','Palmer','Leanne_Palmer8124@nimogy.biz','3135-06-02 18:52:16Z','2446-05-21 16:51:03Z'),
(2,40,1,698391110,'Cadence','Jackson','Jackson','Cadence_Jackson6856@jiman.org','0314-06-27 01:26:17Z','1061-03-20 02:32:49Z'),
(1,31,1,780180292,'Jack','Partridge','Partridge','Jack_Partridge7402@tonsy.org','1748-11-07 20:03:14Z','4751-06-28 17:54:56Z'),
(1,25,1,103976693,'Adalind','Antcliff','Antcliff','Adalind_Antcliff7215@liret.org','4117-07-29 09:21:23Z','2075-03-15 15:20:25Z'),
(2,13,1,708847748,'Crystal','Keys','Keys','Crystal_Keys4349@gompie.com','5135-08-30 09:36:01Z','5562-12-30 07:30:20Z'),
(2,2,1,276749184,'Hailey','Ianson','Ianson','Hailey_Ianson4332@vetan.org','0195-05-19 00:21:46Z','9673-08-25 04:42:47Z'),
(1,33,1,507253115,'Monica','Yard','Yard','Monica_Yard5573@kideod.biz','7854-05-24 22:06:12Z','8554-07-30 02:50:02Z'),
(1,15,1,738175249,'Alex','Rodgers','Rodgers','Alex_Rodgers4794@atink.com','1819-04-11 07:03:45Z','5462-01-03 05:52:12Z'),
(1,42,1,361471721,'Karla','Vollans','Vollans','Karla_Vollans2922@sheye.org','0058-01-19 05:19:23Z','1640-10-20 21:30:44Z'),
(1,21,1,626977220,'Adalind','Wood','Wood','Adalind_Wood5577@gmail.com','0921-11-07 19:29:40Z','2393-05-22 16:12:58Z'),
(2,49,1,135756147,'Carina','Kaur','Kaur','Carina_Kaur2922@yahoo.com','8186-07-20 17:08:43Z','0179-06-21 08:32:00Z'),
(1,24,1,452874506,'Karen','Moss','Moss','Karen_Moss7535@infotech44.tech','2613-02-05 00:47:05Z','7664-08-30 11:07:24Z'),
(1,26,1,540905485,'Chad','Parker','Parker','Chad_Parker9325@iatim.tech','4813-08-03 19:24:36Z','0743-05-20 11:55:39Z'),
(2,36,1,351628365,'Ramon','Whinter','Whinter','Ramon_Whinter9781@dionrab.com','4414-04-13 09:29:54Z','0522-11-21 06:01:19Z'),
(1,2,1,419357134,'Martin','Roberts','Roberts','Martin_Roberts622@typill.biz','4232-07-03 08:20:20Z','1870-09-20 11:50:25Z'),
(2,20,1,175066067,'Moira','Roscoe','Roscoe','Moira_Roscoe418@irrepsy.com','0060-08-19 13:26:42Z','4291-09-14 13:22:17Z'),
(1,46,1,811790330,'William','Taylor','Taylor','William_Taylor9313@cispeto.com','5645-09-25 10:37:43Z','2544-07-25 20:37:28Z'),
(1,31,1,512518559,'Zara','Clarke','Clarke','Zara_Clarke9522@bungar.biz','6242-03-30 21:36:05Z','9940-10-19 17:56:03Z'),
(1,46,1,570216683,'Rocco','Lynch','Lynch','Rocco_Lynch4912@mafthy.com','4963-06-02 06:24:43Z','7516-01-27 15:47:13Z'),
(1,38,1,859293116,'Emma','Kelly','Kelly','Emma_Kelly7177@infotech44.tech','4061-04-04 07:18:25Z','5704-12-07 15:39:39Z'),
(2,35,1,889531469,'Christy','Ebbs','Ebbs','Christy_Ebbs4127@bungar.biz','7593-07-15 22:32:10Z','8726-03-04 05:48:50Z'),
(2,10,1,718487605,'Chelsea','Holt','Holt','Chelsea_Holt469@iatim.tech','4186-03-20 19:10:09Z','9258-06-25 13:43:03Z'),
(1,5,1,794010844,'Blake','Stevenson','Stevenson','Blake_Stevenson9743@fuliss.net','1631-09-26 14:10:45Z','5335-02-01 01:29:33Z'),
(1,24,1,707237062,'Elena','Wilton','Wilton','Elena_Wilton6759@gmail.com','1649-01-20 14:13:45Z','8335-01-20 08:47:07Z'),
(1,36,1,317710397,'Carolyn','Tyrrell','Tyrrell','Carolyn_Tyrrell6951@bauros.biz','2555-09-11 15:51:50Z','8851-02-16 18:40:34Z'),
(1,13,1,468303993,'Eileen','Vallory','Vallory','Eileen_Vallory8296@cispeto.com','4420-01-31 15:43:14Z','3296-09-05 05:21:38Z'),
(2,38,1,226928662,'Javier','Abbey','Abbey','Javier_Abbey3094@fuliss.net','8843-06-29 16:47:30Z','2797-12-04 19:32:10Z'),
(2,28,1,254238461,'Gwen','Raven','Raven','Gwen_Raven5232@sheye.org','5131-04-26 05:56:30Z','9259-01-04 10:30:11Z'),
(2,45,1,369105027,'Nicholas','Harrison','Harrison','Nicholas_Harrison7528@kideod.biz','0859-02-05 22:01:58Z','1623-02-27 19:11:03Z'),
(1,40,1,649988657,'Mandy','Gunn','Gunn','Mandy_Gunn6889@supunk.biz','6560-12-05 07:21:28Z','9584-06-25 06:17:19Z'),
(2,31,1,101652117,'Naomi','Norris','Norris','Naomi_Norris3036@brety.org','0893-02-01 00:29:45Z','3509-02-27 09:44:26Z'),
(1,35,1,353865437,'Charlize','Bryson','Bryson','Charlize_Bryson6916@ovock.tech','6588-11-05 08:23:57Z','1274-08-12 16:43:39Z'),
(2,29,1,891271670,'Boris','Miller','Miller','Boris_Miller2980@ovock.tech','6490-03-29 16:11:36Z','3052-10-10 20:35:01Z'),
(1,29,1,866056913,'Rocco','Reading','Reading','Rocco_Reading1094@famism.biz','9332-03-29 11:53:44Z','9618-06-22 07:44:06Z'),
(2,9,1,856519447,'Jacob','Oakley','Oakley','Jacob_Oakley2901@gmail.com','4864-02-17 09:29:19Z','3537-01-27 11:46:55Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,8,1,843806313,'William','Forth','Forth','William_Forth1488@bungar.biz','8042-10-18 10:23:11Z','6871-10-07 09:25:30Z'),
(1,21,1,162444698,'Mike','Ring','Ring','Mike_Ring4459@mafthy.com','3416-04-20 01:36:43Z','5796-03-02 22:06:48Z'),
(2,30,1,527010997,'Cassidy','Niles','Niles','Cassidy_Niles497@fuliss.net','5721-02-03 06:53:10Z','7992-05-12 22:03:48Z'),
(1,18,1,120490480,'Stephanie','Curtis','Curtis','Stephanie_Curtis4856@ubusive.com','6957-11-27 00:31:11Z','2247-08-19 10:16:22Z'),
(2,41,1,346338030,'Alexander','Keys','Keys','Alexander_Keys7807@dionrab.com','2103-03-21 12:32:24Z','5423-12-10 01:32:53Z'),
(2,37,1,766049297,'Chuck','Coates','Coates','Chuck_Coates6900@tonsy.org','8195-12-06 01:30:48Z','3474-06-18 18:37:47Z'),
(1,12,1,263227092,'Emery','Utterson','Utterson','Emery_Utterson3322@infotech44.tech','5653-10-06 18:55:54Z','1534-12-20 22:58:16Z'),
(2,26,1,897127283,'Hanna','Simpson','Simpson','Hanna_Simpson6441@sveldo.biz','0109-01-11 06:15:14Z','8628-10-03 16:54:36Z'),
(2,16,1,790867587,'Renee','Roscoe','Roscoe','Renee_Roscoe3726@zorer.org','4085-02-02 11:44:16Z','6661-12-19 02:30:31Z'),
(1,6,1,879069045,'Willow','Stevens','Stevens','Willow_Stevens8385@deons.tech','2937-05-03 16:03:42Z','7025-01-04 01:01:17Z'),
(1,34,1,334786091,'Bart','Whinter','Whinter','Bart_Whinter2962@twace.org','2994-05-28 01:52:48Z','3447-01-24 04:44:42Z'),
(2,40,1,578613156,'Macy','Scott','Scott','Macy_Scott5923@sheye.org','2665-02-17 00:18:09Z','7060-01-30 09:43:58Z'),
(2,42,1,817464980,'Ethan','Talbot','Talbot','Ethan_Talbot8337@qater.org','2945-01-29 14:55:15Z','9490-04-10 11:18:58Z'),
(2,11,1,886434217,'Kieth','Wren','Wren','Kieth_Wren2633@womeona.net','7776-05-31 17:58:57Z','5934-04-30 14:09:49Z'),
(1,45,1,720573355,'Dalia','Vaughan','Vaughan','Dalia_Vaughan6581@bauros.biz','8883-08-07 22:38:29Z','3174-11-10 11:58:09Z'),
(2,26,1,181448970,'Bethany','Lucas','Lucas','Bethany_Lucas4082@gmail.com','3945-12-22 12:49:51Z','7010-10-02 00:46:25Z'),
(1,20,1,303365393,'Alan','Heaton','Heaton','Alan_Heaton1432@liret.org','1094-11-07 01:36:01Z','4602-07-24 06:58:47Z'),
(2,32,1,226380410,'Lara','Robertson','Robertson','Lara_Robertson6426@joiniaa.com','9349-09-05 21:47:51Z','1873-11-06 22:51:04Z'),
(1,30,1,437478700,'Rick','Rigg','Rigg','Rick_Rigg443@zorer.org','8024-04-17 16:46:20Z','9343-06-01 05:50:04Z'),
(1,7,1,525008102,'Alexander','Adams','Adams','Alexander_Adams2959@qater.org','3032-01-23 17:19:21Z','9220-12-31 01:44:55Z'),
(1,20,1,496390816,'Rylee','Hunt','Hunt','Rylee_Hunt6081@twipet.com','5824-02-09 09:50:02Z','0007-04-07 16:56:46Z'),
(2,36,1,177537309,'Tyson','Talbot','Talbot','Tyson_Talbot9342@gompie.com','3154-04-10 00:42:29Z','8803-04-17 14:02:24Z'),
(1,23,1,330575879,'Henry','Palmer','Palmer','Henry_Palmer1648@eirey.tech','2550-01-22 19:26:47Z','3025-10-18 01:22:34Z'),
(1,1,1,688078711,'Willow','Allington','Allington','Willow_Allington6338@bungar.biz','8398-05-15 18:52:46Z','7020-10-24 18:47:37Z'),
(1,25,1,192300250,'Cynthia','Darcy','Darcy','Cynthia_Darcy1418@qater.org','1743-10-26 10:28:45Z','0129-06-23 21:19:54Z'),
(1,2,1,393773343,'Benjamin','Knott','Knott','Benjamin_Knott8803@gmail.com','2346-03-16 10:15:27Z','5529-03-31 01:37:10Z'),
(2,44,1,422497482,'Owen','Abbey','Abbey','Owen_Abbey4906@guentu.biz','4215-05-14 14:08:09Z','8269-11-23 19:33:50Z'),
(1,39,1,524875734,'Denis','Rogan','Rogan','Denis_Rogan3923@bauros.biz','4475-08-05 22:51:23Z','6214-07-28 09:50:34Z'),
(1,23,1,866958669,'Phillip','Stuart','Stuart','Phillip_Stuart2927@corti.com','2066-08-10 17:43:11Z','4076-04-22 13:41:35Z'),
(2,43,1,798483039,'Madison','Forester','Forester','Madison_Forester9112@muall.tech','1973-12-05 13:36:28Z','8000-10-16 04:17:33Z'),
(2,6,1,405226476,'Susan','Thorpe','Thorpe','Susan_Thorpe5554@famism.biz','6422-10-25 07:38:32Z','0400-04-15 09:09:46Z'),
(2,49,1,688437184,'Rick','Stewart','Stewart','Rick_Stewart7141@bretoux.com','4589-12-20 20:39:00Z','4065-10-25 12:25:37Z'),
(1,30,1,764892133,'Matthew','Nash','Nash','Matthew_Nash7690@hourpy.biz','1027-06-20 09:14:05Z','1574-08-22 03:26:40Z'),
(1,16,1,486220326,'Jackeline','Bright','Bright','Jackeline_Bright5145@dionrab.com','3746-11-14 09:51:02Z','2358-01-01 18:12:53Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,28,1,562124680,'Gloria','Richards','Richards','Gloria_Richards4992@bulaffy.com','5139-11-22 06:27:12Z','3016-05-01 16:13:18Z'),
(1,7,1,665179359,'Camden','Eastwood','Eastwood','Camden_Eastwood8610@bauros.biz','3654-05-25 03:52:46Z','8669-06-19 14:02:11Z'),
(2,44,1,750905844,'Mark','Chapman','Chapman','Mark_Chapman7993@gompie.com','3765-05-26 03:03:51Z','0731-07-17 15:38:43Z'),
(2,5,1,215367061,'Carl','Bentley','Bentley','Carl_Bentley5545@typill.biz','7231-03-05 06:36:07Z','6470-06-04 14:25:01Z'),
(2,17,1,261281408,'Kirsten','Vangness','Vangness','Kirsten_Vangness5377@twace.org','8174-06-11 00:47:52Z','2923-11-11 10:13:03Z'),
(1,47,1,229990252,'Boris','Osmond','Osmond','Boris_Osmond7228@extex.org','5706-05-26 13:11:26Z','7294-12-22 12:37:49Z'),
(2,16,1,115110126,'Sofia','Hooper','Hooper','Sofia_Hooper392@fuliss.net','3039-12-16 09:44:54Z','4308-04-26 19:22:03Z'),
(2,24,1,765902982,'Carl','Reid','Reid','Carl_Reid3086@gembat.biz','3111-05-12 15:20:39Z','0880-06-19 10:10:02Z'),
(2,46,1,602044941,'Josephine','Gilmour','Gilmour','Josephine_Gilmour5704@atink.com','4321-10-01 01:57:03Z','1399-01-31 17:47:22Z'),
(2,8,1,296652680,'Johnathan','Brown','Brown','Johnathan_Brown3929@typill.biz','4210-02-16 04:40:20Z','2160-06-27 21:33:51Z'),
(1,23,1,398405656,'Anais','Gray','Gray','Anais_Gray8410@nimogy.biz','6966-12-28 17:19:08Z','1713-04-10 20:31:16Z'),
(2,2,1,874643769,'Emma','Rixon','Rixon','Emma_Rixon9590@typill.biz','8656-01-14 21:51:47Z','2162-04-05 03:23:10Z'),
(2,18,1,384720221,'Harry','Lucas','Lucas','Harry_Lucas5919@gompie.com','0014-06-16 15:03:39Z','2497-11-08 06:08:03Z'),
(1,27,1,298679467,'Stacy','Parker','Parker','Stacy_Parker7551@grannar.com','4595-09-29 10:56:51Z','4805-09-25 14:54:56Z'),
(1,10,1,102518328,'Anthony','Rees','Rees','Anthony_Rees226@joiniaa.com','9233-05-15 18:53:08Z','6159-03-08 14:42:44Z'),
(2,42,1,639855184,'Lexi','Rycroft','Rycroft','Lexi_Rycroft9198@naiker.biz','1378-06-16 07:37:40Z','5208-09-21 01:07:42Z'),
(2,48,1,783019513,'Tyson','Thorpe','Thorpe','Tyson_Thorpe2429@qater.org','3691-02-20 04:50:24Z','8436-07-24 18:13:07Z'),
(2,4,1,558605649,'Carl','Allwood','Allwood','Carl_Allwood6897@gembat.biz','8135-11-13 21:23:42Z','4025-08-24 17:45:25Z'),
(2,38,1,504360665,'Florence','Lloyd','Lloyd','Florence_Lloyd6776@hourpy.biz','8729-09-30 04:03:23Z','2941-11-23 11:23:33Z'),
(1,3,1,442701887,'Remy','Murphy','Murphy','Remy_Murphy7548@muall.tech','6116-08-12 09:50:07Z','9665-06-28 09:04:57Z'),
(1,24,1,592676236,'Chris','Leigh','Leigh','Chris_Leigh3573@bauros.biz','2559-06-12 14:36:48Z','5194-12-22 09:58:08Z'),
(2,36,1,248694357,'Anthony','Cowan','Cowan','Anthony_Cowan5556@qater.org','7448-05-04 03:48:41Z','9064-04-02 17:57:24Z'),
(1,46,1,726946394,'Fred','Sinclair','Sinclair','Fred_Sinclair3215@nimogy.biz','5244-02-12 11:07:49Z','0922-08-23 22:50:57Z'),
(2,18,1,134821978,'Tony','Wild','Wild','Tony_Wild2529@sheye.org','7399-06-05 08:31:01Z','3495-03-12 20:38:23Z'),
(2,4,1,275434869,'Melanie','Watson','Watson','Melanie_Watson4329@corti.com','4259-07-17 02:25:01Z','6526-09-13 03:57:43Z'),
(2,31,1,116956714,'Mark','Hewitt','Hewitt','Mark_Hewitt5073@yahoo.com','9788-11-22 03:46:38Z','1749-12-03 14:28:25Z'),
(1,39,1,695420620,'Zoe','Morris','Morris','Zoe_Morris7888@grannar.com','7071-05-14 17:48:43Z','0873-09-23 04:33:17Z'),
(2,2,1,446824098,'Ron','Grant','Grant','Ron_Grant8814@tonsy.org','8583-05-08 01:37:49Z','2510-08-14 10:55:34Z'),
(1,9,1,258856614,'Candace','Dillon','Dillon','Candace_Dillon4028@irrepsy.com','5900-10-10 06:40:16Z','8916-03-02 21:13:21Z'),
(2,23,1,263133677,'Nate','Dubois','Dubois','Nate_Dubois7042@grannar.com','1708-11-01 02:08:41Z','4561-09-30 07:52:09Z'),
(1,19,1,266429562,'Penelope','Purvis','Purvis','Penelope_Purvis8055@ovock.tech','0842-09-07 16:11:53Z','9667-03-08 03:24:28Z'),
(2,24,1,749016747,'Kurt','Gibson','Gibson','Kurt_Gibson4436@muall.tech','6966-03-15 08:15:45Z','1340-01-11 22:46:07Z'),
(2,42,1,548212026,'Destiny','Reyes','Reyes','Destiny_Reyes4217@eirey.tech','2614-02-28 01:29:37Z','2041-08-26 21:43:12Z'),
(2,20,1,308658013,'Katelyn','Saunders','Saunders','Katelyn_Saunders7067@grannar.com','4092-05-05 04:32:10Z','9502-08-29 17:24:46Z'),
(1,28,1,837935840,'Elijah','Shaw','Shaw','Elijah_Shaw9343@gompie.com','5354-01-20 07:55:00Z','4925-07-20 09:30:32Z'),
(1,20,1,546951878,'Benny','Gibbons','Gibbons','Benny_Gibbons5000@fuliss.net','1597-01-02 15:51:03Z','3111-07-04 07:05:49Z'),
(2,9,1,140812557,'Karla','Clarke','Clarke','Karla_Clarke8667@nimogy.biz','7429-02-14 15:45:31Z','9166-10-17 18:01:37Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,1,1,570810210,'Julian','Knight','Knight','Julian_Knight7783@bulaffy.com','0423-10-15 21:03:29Z','2243-07-22 00:49:10Z'),
(2,18,1,187571914,'Gina','Price','Price','Gina_Price4566@zorer.org','8260-08-07 04:43:27Z','2430-03-19 19:49:25Z'),
(2,4,1,474696222,'Eduardo','Dillon','Dillon','Eduardo_Dillon1609@twace.org','3095-08-04 20:47:11Z','5186-07-27 15:54:21Z'),
(1,33,1,644252213,'Brad','Hobbs','Hobbs','Brad_Hobbs88@brety.org','8989-04-22 11:02:27Z','7993-07-29 01:12:04Z'),
(1,38,1,873800659,'Erick','Umney','Umney','Erick_Umney4550@infotech44.tech','7535-03-04 15:38:39Z','3075-01-12 12:47:05Z'),
(2,9,1,772788691,'Julian','Turner','Turner','Julian_Turner3716@bauros.biz','0386-10-02 21:06:39Z','5102-01-07 19:34:07Z'),
(2,8,1,511039312,'Sasha','Moran','Moran','Sasha_Moran5584@deavo.com','5139-03-28 17:21:03Z','5915-04-13 21:13:21Z'),
(1,2,1,789592626,'Josephine','Harrington','Harrington','Josephine_Harrington4182@liret.org','7645-12-03 21:19:18Z','2434-02-26 19:03:32Z'),
(2,33,1,298477069,'Kaylee','Sanchez','Sanchez','Kaylee_Sanchez8599@twace.org','2124-05-04 20:00:40Z','4471-06-21 00:52:17Z'),
(2,28,1,862913057,'Freya','Farmer','Farmer','Freya_Farmer1640@twipet.com','4993-03-31 18:12:23Z','2706-01-31 20:17:29Z'),
(1,29,1,731476428,'Hanna','James','James','Hanna_James7932@brety.org','0721-07-19 04:23:31Z','3175-06-15 21:26:00Z'),
(1,25,1,530528269,'Jazmin','Irving','Irving','Jazmin_Irving3424@ovock.tech','0393-08-04 13:37:43Z','9418-04-04 00:42:10Z'),
(2,15,1,646692159,'Josh','Widdows','Widdows','Josh_Widdows6736@liret.org','2856-10-07 19:44:44Z','1818-10-18 19:45:22Z'),
(2,39,1,549220049,'Melinda','Morrison','Morrison','Melinda_Morrison5221@hourpy.biz','6686-01-06 00:09:57Z','1303-04-17 04:40:20Z'),
(2,8,1,169811068,'Melody','Robinson','Robinson','Melody_Robinson4099@bretoux.com','2657-05-07 17:34:12Z','8574-10-17 17:51:20Z'),
(1,46,1,728705088,'Nick','Yoman','Yoman','Nick_Yoman9141@qater.org','2185-06-26 21:30:14Z','1554-06-25 14:04:23Z'),
(2,30,1,430113816,'Sasha','Kelly','Kelly','Sasha_Kelly108@eirey.tech','2269-05-17 04:55:36Z','8111-03-23 06:16:36Z'),
(2,38,1,247351404,'Caleb','Tyler','Tyler','Caleb_Tyler6551@liret.org','1513-08-09 14:52:03Z','1103-11-15 03:29:47Z'),
(2,13,1,123417197,'Carl','Bayliss','Bayliss','Carl_Bayliss7523@womeona.net','2371-10-14 03:57:13Z','4074-04-06 15:14:36Z'),
(2,16,1,122030171,'Nate','Clark','Clark','Nate_Clark1649@nanoff.biz','1108-02-13 13:07:11Z','1166-07-04 00:25:48Z'),
(1,1,1,627245287,'Julius','Power','Power','Julius_Power8367@muall.tech','2922-05-01 15:40:00Z','7439-05-05 21:38:25Z'),
(1,10,1,594560420,'Bob','Stuart','Stuart','Bob_Stuart3691@qater.org','0140-05-29 02:37:19Z','1206-04-13 02:31:24Z'),
(1,12,1,746382952,'Chester','Brennan','Brennan','Chester_Brennan9742@gmail.com','0483-10-19 03:28:10Z','3668-10-10 14:28:45Z'),
(2,13,1,537731619,'Marigold','Lloyd','Lloyd','Marigold_Lloyd7218@typill.biz','6664-05-12 22:12:18Z','1717-01-19 12:08:35Z'),
(2,21,1,768227139,'Chester','Brooks','Brooks','Chester_Brooks197@eirey.tech','4850-02-07 07:52:40Z','6471-08-19 10:09:33Z'),
(1,15,1,655870051,'Tyson','Cork','Cork','Tyson_Cork8132@fuliss.net','4874-02-04 06:45:03Z','8766-10-01 13:20:33Z'),
(2,4,1,610412477,'Ryan','Anderson','Anderson','Ryan_Anderson8057@bretoux.com','3725-02-05 04:49:07Z','0193-09-24 12:03:44Z'),
(1,42,1,745654931,'Leroy','Thompson','Thompson','Leroy_Thompson814@hourpy.biz','6677-11-30 14:14:10Z','6083-05-10 17:31:06Z'),
(1,5,1,107379902,'Erick','Mackenzie','Mackenzie','Erick_Mackenzie7769@supunk.biz','0506-06-24 10:57:51Z','4681-05-14 17:42:17Z'),
(1,25,1,146271518,'Mya','Yoman','Yoman','Mya_Yoman7921@typill.biz','9095-09-23 15:32:06Z','7641-09-27 10:17:01Z'),
(1,48,1,512125396,'Melody','Jones','Jones','Melody_Jones2382@joiniaa.com','2007-07-23 05:06:56Z','1997-07-20 19:31:52Z'),
(1,3,1,679504345,'Dakota','Yates','Yates','Dakota_Yates9000@gembat.biz','8925-06-26 06:13:16Z','2864-09-26 22:40:50Z'),
(2,37,1,769699292,'Regina','Parker','Parker','Regina_Parker3199@muall.tech','5238-06-29 01:40:49Z','7099-03-07 18:01:13Z'),
(1,13,1,510139839,'Nicholas','Craig','Craig','Nicholas_Craig1603@bretoux.com','4752-07-02 13:00:08Z','9142-10-26 05:24:06Z'),
(1,39,1,435113198,'John','Woods','Woods','John_Woods2280@deons.tech','2190-04-08 15:12:21Z','1827-04-23 10:11:02Z'),
(2,22,1,674682667,'Alma','Lloyd','Lloyd','Alma_Lloyd835@womeona.net','5747-02-09 00:17:29Z','6095-09-03 18:15:42Z'),
(2,12,1,171394656,'Liam','Savage','Savage','Liam_Savage2464@elnee.tech','0948-02-26 12:55:55Z','2926-03-13 02:47:06Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,49,1,300234767,'Sydney','Farrant','Farrant','Sydney_Farrant5549@guentu.biz','7003-01-12 08:54:34Z','6094-08-04 19:55:37Z'),
(2,48,1,651219382,'Chuck','Cowan','Cowan','Chuck_Cowan1286@twipet.com','3044-08-31 00:08:34Z','2821-11-30 21:28:23Z'),
(1,14,1,492758961,'Bethany','Harris','Harris','Bethany_Harris424@tonsy.org','1733-06-02 10:19:49Z','4853-07-23 15:00:17Z'),
(1,42,1,457585187,'Ivette','Lindop','Lindop','Ivette_Lindop6106@infotech44.tech','4495-02-02 05:24:17Z','4182-02-12 10:25:11Z'),
(1,33,1,860366342,'Emmanuelle','Wilkinson','Wilkinson','Emmanuelle_Wilkinson3973@corti.com','8023-12-27 03:47:26Z','8191-02-07 07:07:16Z'),
(2,32,1,121232996,'Aleksandra','Rowan','Rowan','Aleksandra_Rowan3749@womeona.net','4617-06-20 17:36:52Z','7551-04-20 22:52:38Z'),
(1,17,1,820547425,'Lucas','Clayton','Clayton','Lucas_Clayton2695@ovock.tech','6304-09-03 04:47:30Z','6303-12-27 20:16:00Z'),
(2,39,1,187484967,'Chad','Forester','Forester','Chad_Forester2817@elnee.tech','4354-06-17 04:45:35Z','0473-09-08 03:54:46Z'),
(1,40,1,524234441,'Alan','Alexander','Alexander','Alan_Alexander4548@dionrab.com','3531-07-02 15:33:00Z','8313-06-26 20:19:51Z'),
(1,5,1,292040671,'Harvey','Rosenbloom','Rosenbloom','Harvey_Rosenbloom3607@irrepsy.com','9671-04-19 16:29:21Z','5831-12-26 00:52:42Z'),
(2,24,1,465506597,'Ryan','Watson','Watson','Ryan_Watson147@yahoo.com','0927-01-26 01:41:24Z','6040-12-21 06:25:42Z'),
(2,41,1,283707646,'Sonya','Victor','Victor','Sonya_Victor2847@famism.biz','2654-12-16 00:56:41Z','7699-07-07 14:40:16Z'),
(1,43,1,348836678,'Teagan','Verdon','Verdon','Teagan_Verdon1667@gembat.biz','7254-01-14 11:38:04Z','3631-04-29 09:03:38Z'),
(1,4,1,844833167,'Benjamin','Rees','Rees','Benjamin_Rees855@joiniaa.com','3129-01-16 00:03:19Z','3227-07-22 09:01:07Z'),
(1,29,1,874638911,'Paige','Matthews','Matthews','Paige_Matthews4452@yahoo.com','5079-05-29 17:37:57Z','9023-08-19 14:53:03Z'),
(2,30,1,691691203,'Nathan','Myatt','Myatt','Nathan_Myatt4238@bulaffy.com','2963-11-28 00:06:51Z','4027-06-26 01:36:55Z'),
(1,24,1,368410853,'Johnathan','Mills','Mills','Johnathan_Mills6675@bulaffy.com','1181-12-03 11:26:25Z','4105-05-30 09:09:15Z'),
(2,21,1,255030674,'Piper','Adams','Adams','Piper_Adams7821@dionrab.com','0751-03-30 16:19:09Z','1052-12-03 15:00:01Z'),
(1,21,1,204482121,'Vicky','Mills','Mills','Vicky_Mills5067@hourpy.biz','2675-02-23 02:57:28Z','8858-06-30 14:56:35Z'),
(1,10,1,288702487,'Barry','Kent','Kent','Barry_Kent6580@jiman.org','6161-01-02 13:19:43Z','0130-01-01 18:25:23Z'),
(2,37,1,680775153,'Louise','Farrow','Farrow','Louise_Farrow4417@acrit.org','6391-03-14 19:47:34Z','1892-09-28 02:22:33Z'),
(1,40,1,289447001,'Rosemary','Warren','Warren','Rosemary_Warren9633@qater.org','2778-06-20 16:10:05Z','2546-02-23 07:31:05Z'),
(2,11,1,756118389,'Brad','Glynn','Glynn','Brad_Glynn5569@zorer.org','5790-10-06 15:50:40Z','4269-04-07 10:56:10Z'),
(1,31,1,660789207,'Carla','Thomson','Thomson','Carla_Thomson6846@zorer.org','6734-04-11 08:15:15Z','3846-01-20 11:15:29Z'),
(1,8,1,691150327,'Wade','Parker','Parker','Wade_Parker4781@acrit.org','6871-07-25 04:06:10Z','8509-03-15 06:12:53Z'),
(1,46,1,297645272,'William','Gray','Gray','William_Gray2666@ovock.tech','5874-02-08 16:16:36Z','1945-09-18 04:34:11Z'),
(1,40,1,671901938,'Roger','Hilton','Hilton','Roger_Hilton8778@acrit.org','9738-04-12 14:33:41Z','8225-01-26 02:03:20Z'),
(1,17,1,895274717,'Nathan','Lucas','Lucas','Nathan_Lucas3427@naiker.biz','6351-10-30 00:11:43Z','4926-11-07 00:31:57Z'),
(1,21,1,168677876,'Eduardo','Pickard','Pickard','Eduardo_Pickard8544@bulaffy.com','0586-06-25 17:41:15Z','7649-01-12 14:13:16Z'),
(2,12,1,253300591,'Ilona','Moore','Moore','Ilona_Moore2292@bungar.biz','4537-05-08 20:40:35Z','4812-06-05 13:02:42Z'),
(2,32,1,498377242,'Scarlett','Richardson','Richardson','Scarlett_Richardson9079@deons.tech','3293-07-01 00:38:31Z','8702-10-18 09:56:27Z'),
(1,15,1,478848331,'Harry','Addley','Addley','Harry_Addley1134@atink.com','4776-01-11 03:09:17Z','5774-01-20 03:38:31Z'),
(2,30,1,190160249,'Marvin','Dixon','Dixon','Marvin_Dixon5233@sveldo.biz','3200-12-30 22:34:23Z','5834-07-23 10:43:08Z'),
(1,37,1,646994268,'Alessandra','Willson','Willson','Alessandra_Willson8895@acrit.org','0755-09-18 03:43:46Z','7519-06-13 20:58:58Z'),
(2,18,1,715409710,'Maxwell','Judd','Judd','Maxwell_Judd213@gmail.com','2712-11-17 09:31:44Z','8941-06-21 16:25:09Z'),
(2,45,1,839066999,'Ruby','Fields','Fields','Ruby_Fields3811@sheye.org','0677-08-05 17:46:18Z','5681-07-20 02:34:23Z'),
(2,19,1,763973062,'Gil','Gray','Gray','Gil_Gray1561@bretoux.com','9971-10-19 18:21:34Z','1814-03-30 10:18:37Z'),
(2,4,1,371084882,'Natalie','Windsor','Windsor','Natalie_Windsor8117@extex.org','1250-05-22 13:14:03Z','7031-04-29 06:55:21Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,3,1,218534662,'Belinda','Oswald','Oswald','Belinda_Oswald1995@vetan.org','4840-07-03 12:01:11Z','8863-05-09 07:28:39Z'),
(1,26,1,885494409,'Chloe','Brown','Brown','Chloe_Brown1381@hourpy.biz','9429-03-06 17:54:14Z','2941-06-22 11:24:12Z'),
(2,13,1,600493409,'Chester','Oswald','Oswald','Chester_Oswald4436@brety.org','6952-05-26 10:46:47Z','2387-01-14 06:45:23Z'),
(1,21,1,573235519,'Jayden','Lane','Lane','Jayden_Lane660@bretoux.com','8824-07-19 17:16:21Z','1900-01-12 00:35:57Z'),
(2,12,1,234968117,'Maggie','Asher','Asher','Maggie_Asher3115@eirey.tech','9252-07-03 21:20:01Z','7043-02-22 11:09:49Z'),
(1,49,1,113108235,'Leroy','Bailey','Bailey','Leroy_Bailey3704@bretoux.com','2758-09-17 17:09:21Z','5053-05-15 09:10:49Z'),
(1,27,1,692052550,'Elijah','Thomas','Thomas','Elijah_Thomas2953@ubusive.com','3579-08-19 16:42:17Z','1782-05-29 05:07:31Z'),
(2,31,1,309607162,'Caleb','Wright','Wright','Caleb_Wright8588@qater.org','6927-03-06 04:08:53Z','4200-02-20 11:09:11Z'),
(1,31,1,616188205,'Tony','Butler','Butler','Tony_Butler3160@nimogy.biz','9009-10-25 19:38:01Z','0977-04-21 12:01:49Z'),
(2,28,1,658579363,'Tom','Clayton','Clayton','Tom_Clayton3126@guentu.biz','5149-09-28 05:08:25Z','9379-06-28 04:32:05Z'),
(1,26,1,227508734,'Angelica','Rivers','Rivers','Angelica_Rivers460@mafthy.com','6279-07-24 18:12:49Z','5950-11-16 15:07:03Z'),
(2,30,1,136661925,'Bernadette','Clifton','Clifton','Bernadette_Clifton3592@sheye.org','6201-02-20 06:10:14Z','9630-04-28 14:05:54Z'),
(1,26,1,533024224,'Maxwell','Roberts','Roberts','Maxwell_Roberts4241@sveldo.biz','3213-12-31 02:06:02Z','9198-11-13 13:01:21Z'),
(1,47,1,410623534,'Rachael','Rigg','Rigg','Rachael_Rigg4945@supunk.biz','9274-04-30 18:51:19Z','6649-03-27 03:06:53Z'),
(1,30,1,242407480,'Naomi','Corbett','Corbett','Naomi_Corbett3008@bungar.biz','7627-06-06 14:14:42Z','7002-04-10 15:08:51Z'),
(1,8,1,320203149,'Ethan','Bailey','Bailey','Ethan_Bailey4830@atink.com','2634-11-15 15:32:46Z','6564-10-05 22:00:08Z'),
(1,21,1,132515136,'Alexander','Egerton','Egerton','Alexander_Egerton674@kideod.biz','3702-12-06 04:14:39Z','2273-01-22 02:42:27Z'),
(2,48,1,625007609,'Ethan','Needham','Needham','Ethan_Needham6071@yahoo.com','3282-05-09 09:44:08Z','1063-09-02 15:14:34Z'),
(1,36,1,662985226,'Tania','Squire','Squire','Tania_Squire4933@typill.biz','8075-05-22 12:14:27Z','0362-10-24 12:48:18Z'),
(1,3,1,365684565,'Moira','Buckley','Buckley','Moira_Buckley6714@fuliss.net','5048-07-06 10:18:18Z','2640-04-06 12:58:05Z'),
(2,1,1,273426432,'Meredith','Lane','Lane','Meredith_Lane8536@qater.org','3709-10-08 08:21:33Z','2920-07-18 19:54:48Z'),
(2,11,1,403780919,'Nina','Hall','Hall','Nina_Hall9256@nimogy.biz','8837-02-16 19:10:29Z','5436-02-17 00:14:22Z'),
(2,41,1,515315428,'Aiden','Gavin','Gavin','Aiden_Gavin9364@corti.com','6882-07-31 04:17:26Z','2128-12-20 13:22:28Z'),
(2,39,1,208536623,'Sloane','Shaw','Shaw','Sloane_Shaw9380@womeona.net','6516-08-01 18:39:19Z','8273-08-22 07:07:11Z'),
(2,6,1,780964584,'Britney','Abbot','Abbot','Britney_Abbot8545@guentu.biz','6958-09-10 00:36:14Z','6709-03-01 06:46:01Z'),
(1,23,1,408093480,'Logan','Grant','Grant','Logan_Grant5175@extex.org','8472-11-20 12:15:09Z','8608-12-09 19:10:14Z'),
(2,14,1,133917466,'Enoch','Ward','Ward','Enoch_Ward4497@eirey.tech','6006-05-14 18:18:15Z','9807-06-04 12:52:18Z'),
(1,33,1,408863298,'Lara','Wright','Wright','Lara_Wright8555@qater.org','2774-01-27 06:35:43Z','8349-10-02 03:25:58Z'),
(2,26,1,586054198,'Bryon','Owen','Owen','Bryon_Owen6188@twace.org','9853-12-22 04:11:42Z','8665-06-20 00:22:49Z'),
(2,26,1,144434444,'Wade','Khan','Khan','Wade_Khan2535@tonsy.org','4980-03-05 15:50:30Z','7656-08-11 14:51:16Z'),
(2,19,1,555851534,'Hannah','Mcnally','Mcnally','Hannah_Mcnally5033@eirey.tech','4001-06-12 20:38:07Z','4108-08-09 06:12:52Z'),
(2,45,1,238974454,'Mona','Janes','Janes','Mona_Janes6594@joiniaa.com','8403-11-05 18:45:36Z','2198-05-12 12:18:26Z'),
(1,1,1,190946810,'Dakota','Gilmore','Gilmore','Dakota_Gilmore6279@typill.biz','8262-11-10 05:35:03Z','0872-07-28 09:37:36Z'),
(1,48,1,562208812,'Julianna','Leslie','Leslie','Julianna_Leslie7414@atink.com','0436-03-09 08:43:36Z','1804-02-01 08:19:39Z'),
(1,11,1,130221903,'Bryce','Abbey','Abbey','Bryce_Abbey2382@gmail.com','6050-03-17 02:03:20Z','7532-04-09 09:07:58Z'),
(1,18,1,529834632,'Mason','Windsor','Windsor','Mason_Windsor6990@infotech44.tech','6994-07-05 00:52:10Z','6459-10-10 20:15:23Z'),
(1,21,1,561119728,'Ada','Addley','Addley','Ada_Addley1683@gembat.biz','8538-06-16 21:40:46Z','2903-12-01 22:36:36Z'),
(2,48,1,706763065,'Jamie','Boden','Boden','Jamie_Boden7513@dionrab.com','0879-04-04 12:20:10Z','9590-06-07 04:47:56Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,35,1,123345109,'David','Wilkinson','Wilkinson','David_Wilkinson8803@ubusive.com','8064-01-06 01:01:09Z','4091-08-06 00:16:32Z'),
(2,15,1,126372129,'Bryce','Patel','Patel','Bryce_Patel4218@cispeto.com','2437-10-14 19:48:01Z','8948-01-09 16:52:49Z'),
(2,45,1,536451218,'Rocco','Utterson','Utterson','Rocco_Utterson7413@elnee.tech','6794-05-29 03:43:53Z','6787-08-29 11:04:37Z'),
(1,26,1,843054678,'Bryon','Mccormick','Mccormick','Bryon_Mccormick4040@womeona.net','8567-01-02 02:03:17Z','9115-12-30 07:07:19Z'),
(1,19,1,520506192,'Chester','Pope','Pope','Chester_Pope298@vetan.org','1083-09-15 01:40:34Z','5650-02-16 07:44:23Z'),
(2,19,1,419774894,'Rufus','Addley','Addley','Rufus_Addley3968@fuliss.net','9671-12-05 20:40:07Z','7678-05-31 19:35:34Z'),
(1,35,1,389767645,'Deborah','Collis','Collis','Deborah_Collis1613@ubusive.com','2246-02-26 10:42:55Z','2917-11-17 18:18:53Z'),
(2,38,1,644675991,'Johnathan','Howard','Howard','Johnathan_Howard3572@cispeto.com','1885-07-26 08:20:27Z','3405-04-17 04:05:00Z'),
(1,3,1,615792039,'Peter','Herbert','Herbert','Peter_Herbert4819@dionrab.com','2807-10-13 21:40:04Z','6755-01-20 02:21:13Z'),
(1,41,1,833860164,'Rick','Parker','Parker','Rick_Parker5191@qater.org','8633-10-31 20:47:50Z','8840-11-11 05:36:54Z'),
(2,14,1,307920624,'Nicholas','Chapman','Chapman','Nicholas_Chapman2068@vetan.org','4188-08-31 00:39:25Z','5130-07-08 06:58:14Z'),
(1,13,1,139579074,'Jasmine','Hope','Hope','Jasmine_Hope9998@naiker.biz','6160-03-11 05:39:12Z','3966-12-01 15:03:09Z'),
(1,5,1,582621294,'Samantha','Clifford','Clifford','Samantha_Clifford6816@bretoux.com','1958-04-23 16:49:25Z','3504-04-27 14:48:36Z'),
(1,18,1,320355237,'Lucas','Downing','Downing','Lucas_Downing3857@irrepsy.com','6997-03-25 08:31:23Z','0222-10-02 07:36:15Z'),
(2,44,1,799207252,'Russel','Wren','Wren','Russel_Wren4441@bauros.biz','1952-04-06 14:09:21Z','2656-11-16 14:49:35Z'),
(2,34,1,160088627,'Noah','Tailor','Tailor','Noah_Tailor4557@twace.org','0204-07-15 18:08:53Z','1736-07-23 08:13:09Z'),
(2,46,1,526224081,'Rick','Holt','Holt','Rick_Holt3521@womeona.net','2080-06-27 07:13:06Z','4341-05-10 17:40:47Z'),
(2,46,1,169869742,'Deborah','Dale','Dale','Deborah_Dale9442@brety.org','4369-12-22 05:17:48Z','0216-09-15 06:54:12Z'),
(2,45,1,465649588,'Marie','Martin','Martin','Marie_Martin105@grannar.com','6964-05-14 18:13:01Z','5863-03-07 01:26:06Z'),
(2,15,1,180465304,'Oliver','Swift','Swift','Oliver_Swift2737@naiker.biz','1766-04-16 01:03:41Z','1864-10-14 01:17:53Z'),
(2,38,1,560218565,'Winnie','Andersson','Andersson','Winnie_Andersson8954@grannar.com','3557-08-15 21:42:41Z','8506-10-18 04:49:42Z'),
(2,31,1,881690958,'Chadwick','Selby','Selby','Chadwick_Selby1024@nickia.com','8302-03-04 07:56:49Z','5100-08-01 16:54:07Z'),
(1,34,1,552771725,'Daniel','Stewart','Stewart','Daniel_Stewart3565@grannar.com','2507-11-27 05:32:04Z','3259-06-30 20:12:57Z'),
(1,34,1,403415946,'Lucas','Quinnell','Quinnell','Lucas_Quinnell3245@bulaffy.com','8841-11-14 04:55:41Z','8457-01-13 04:46:34Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,8,1,351496044,'Danny','Gibbons','Gibbons','Danny_Gibbons5974@elnee.tech','1183-06-18 11:32:34Z','5043-09-04 10:43:50Z'),
(1,13,1,780498465,'Liam','Griffiths','Griffiths','Liam_Griffiths3565@muall.tech','0358-02-11 12:24:49Z','4050-11-13 00:45:29Z'),
(2,3,1,893353928,'Boris','Moore','Moore','Boris_Moore3473@ovock.tech','2898-09-25 12:45:19Z','3799-03-13 17:11:50Z'),
(2,27,1,716118744,'Gabriel','Sinclair','Sinclair','Gabriel_Sinclair6850@muall.tech','6742-09-11 07:10:34Z','7132-08-05 11:46:04Z'),
(1,35,1,269803521,'Renee','Hogg','Hogg','Renee_Hogg8382@guentu.biz','5854-08-13 02:34:19Z','6558-11-30 17:13:58Z'),
(1,11,1,847969786,'Tom','Leigh','Leigh','Tom_Leigh2543@ubusive.com','0567-02-06 11:09:22Z','5766-02-21 00:58:14Z'),
(1,25,1,443589599,'Chadwick','Campbell','Campbell','Chadwick_Campbell5562@zorer.org','4414-03-25 09:06:19Z','0184-10-12 12:56:34Z'),
(1,28,1,791396000,'Caleb','Ralph','Ralph','Caleb_Ralph6629@guentu.biz','5053-06-30 21:39:30Z','0089-06-22 02:34:04Z'),
(1,36,1,367039089,'Mya','Rodwell','Rodwell','Mya_Rodwell5511@famism.biz','5064-08-23 03:08:58Z','0383-04-27 22:12:46Z'),
(2,22,1,673124337,'Enoch','Russel','Russel','Enoch_Russel2719@grannar.com','8564-12-22 03:52:21Z','4325-10-04 07:30:15Z'),
(1,12,1,592916714,'Julius','Murphy','Murphy','Julius_Murphy4210@typill.biz','0181-12-20 00:30:52Z','4671-03-06 22:27:42Z'),
(1,8,1,387040923,'Fred','Chappell','Chappell','Fred_Chappell7867@naiker.biz','8687-02-16 22:39:41Z','0739-11-21 18:36:43Z'),
(2,49,1,108384960,'Jade','Mitchell','Mitchell','Jade_Mitchell8561@bulaffy.com','7534-09-08 06:44:39Z','3894-10-19 04:25:37Z'),
(2,19,1,567497667,'Noemi','Thomson','Thomson','Noemi_Thomson7382@hourpy.biz','8189-08-29 10:44:06Z','9442-01-30 04:52:08Z'),
(1,24,1,397391973,'Angelica','Saunders','Saunders','Angelica_Saunders9422@kideod.biz','9597-02-06 02:01:06Z','4793-05-01 17:14:03Z'),
(2,13,1,508552280,'Logan','Briggs','Briggs','Logan_Briggs5323@nanoff.biz','1078-04-14 11:05:47Z','8092-08-07 02:51:30Z'),
(1,47,1,642846186,'Adela','Jennson','Jennson','Adela_Jennson5171@twace.org','3746-04-30 17:41:42Z','3397-05-01 16:30:03Z'),
(1,31,1,789049326,'Nick','White','White','Nick_White9162@tonsy.org','4406-09-23 14:49:37Z','1505-07-03 22:09:34Z'),
(2,15,1,376032523,'Johnathan','Vaughn','Vaughn','Johnathan_Vaughn7632@gmail.com','2108-07-12 08:48:27Z','7680-12-13 18:34:44Z'),
(2,12,1,224884150,'Mason','Baker','Baker','Mason_Baker2769@corti.com','8480-05-15 13:39:29Z','2241-10-30 17:32:07Z'),
(1,11,1,560450888,'Kaylee','Roman','Roman','Kaylee_Roman984@corti.com','2579-07-24 21:05:43Z','6725-10-11 18:15:52Z'),
(1,46,1,344607131,'Ramon','Shields','Shields','Ramon_Shields5856@qater.org','8448-08-20 10:05:52Z','9866-09-12 14:16:20Z'),
(2,18,1,350458574,'Mara','Wellington','Wellington','Mara_Wellington5653@nickia.com','4058-01-07 15:10:44Z','1755-08-06 17:24:35Z'),
(2,31,1,557635275,'Henry','Norburn','Norburn','Henry_Norburn6033@deavo.com','6951-01-14 02:00:35Z','2712-11-11 07:48:22Z'),
(1,44,1,859004005,'Rocco','Adams','Adams','Rocco_Adams3626@iatim.tech','5745-07-24 00:23:06Z','6694-01-15 16:39:16Z'),
(1,32,1,354579978,'Julius','Booth','Booth','Julius_Booth9595@mafthy.com','6202-05-22 12:32:03Z','1346-02-27 07:21:21Z'),
(2,27,1,110817641,'Courtney','Janes','Janes','Courtney_Janes8322@bungar.biz','5010-12-14 11:11:36Z','0257-12-30 09:20:19Z'),
(1,9,1,471240598,'Chadwick','Verdon','Verdon','Chadwick_Verdon3693@acrit.org','2094-02-03 17:47:33Z','4400-05-27 16:01:43Z'),
(1,7,1,108695555,'Mackenzie','Rothwell','Rothwell','Mackenzie_Rothwell3139@supunk.biz','1872-09-13 07:44:58Z','5945-05-23 02:12:43Z'),
(1,10,1,843320521,'Nate','Weasley','Weasley','Nate_Weasley9021@nickia.com','5689-04-01 13:01:21Z','0611-07-20 18:09:51Z'),
(1,11,1,288761766,'Bart','Radcliffe','Radcliffe','Bart_Radcliffe9275@deons.tech','1781-09-18 16:36:21Z','6148-09-14 14:35:49Z'),
(2,41,1,377615215,'Evelynn','Edley','Edley','Evelynn_Edley1070@acrit.org','6798-10-29 15:17:01Z','1262-02-25 12:34:06Z'),
(2,49,1,621404327,'Ronald','Morley','Morley','Ronald_Morley1999@qater.org','1627-03-21 17:17:17Z','9540-07-19 22:25:30Z'),
(1,17,1,422010775,'Joseph','Robinson','Robinson','Joseph_Robinson2090@guentu.biz','3624-02-11 03:37:03Z','0520-07-24 03:01:15Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,30,1,820417072,'Phillip','Knight','Knight','Phillip_Knight4065@corti.com','4974-08-31 20:48:03Z','7258-04-12 16:50:29Z'),
(1,13,1,453961946,'Adalie','Ellwood','Ellwood','Adalie_Ellwood2127@sheye.org','6400-10-18 03:33:46Z','1107-08-30 13:15:01Z'),
(1,41,1,586610201,'Chris','Broomfield','Broomfield','Chris_Broomfield8664@bulaffy.com','2567-09-23 15:23:49Z','6365-11-01 10:45:33Z'),
(2,38,1,361930906,'Thea','Ralph','Ralph','Thea_Ralph2020@twace.org','0130-03-29 07:49:41Z','3868-01-04 06:32:01Z'),
(2,2,1,107264871,'Daniel','Wood','Wood','Daniel_Wood9644@womeona.net','6881-05-27 17:48:55Z','0035-12-19 16:46:13Z'),
(2,25,1,785416299,'Alison','Adler','Adler','Alison_Adler9076@irrepsy.com','4742-04-12 11:01:11Z','8699-09-19 09:49:47Z'),
(2,36,1,440429103,'Felicity','Judd','Judd','Felicity_Judd4683@naiker.biz','3002-08-06 09:22:11Z','0095-04-10 14:03:28Z'),
(1,3,1,647876958,'Miriam','Franks','Franks','Miriam_Franks4800@womeona.net','4438-11-28 20:55:20Z','8181-09-08 08:57:07Z'),
(2,3,1,300418356,'Ronald','Alldridge','Alldridge','Ronald_Alldridge1285@dionrab.com','7528-12-15 05:31:15Z','4648-01-02 20:56:42Z'),
(2,39,1,428067404,'Kenzie','Murray','Murray','Kenzie_Murray6931@guentu.biz','3991-10-20 11:31:26Z','4820-11-27 01:23:04Z'),
(2,1,1,468125825,'Jack','Walker','Walker','Jack_Walker3005@vetan.org','8714-11-26 02:56:15Z','9790-11-26 22:57:37Z'),
(1,10,1,498785694,'Samara','Ramsey','Ramsey','Samara_Ramsey3620@gmail.com','6011-08-30 14:35:36Z','2709-01-18 04:07:11Z'),
(1,48,1,659297031,'Bob','Tanner','Tanner','Bob_Tanner760@naiker.biz','2801-04-15 05:43:36Z','4200-11-23 11:32:48Z'),
(2,11,1,581903833,'Cedrick','Dyson','Dyson','Cedrick_Dyson637@deons.tech','8323-02-07 06:41:58Z','6006-11-08 21:49:04Z'),
(2,1,1,867800550,'Ema','White','White','Ema_White6755@deavo.com','5050-03-26 10:36:43Z','1811-10-09 02:03:47Z'),
(2,45,1,709204126,'Bryon','Adler','Adler','Bryon_Adler2243@vetan.org','7035-03-20 12:22:47Z','6794-06-07 07:53:32Z'),
(2,27,1,790733035,'Harvey','Vollans','Vollans','Harvey_Vollans6465@guentu.biz','3875-04-17 19:26:21Z','6512-05-02 04:38:10Z'),
(1,46,1,782958685,'Francesca','Gilmore','Gilmore','Francesca_Gilmore1183@acrit.org','1458-01-22 18:17:53Z','8255-10-20 03:42:10Z'),
(1,26,1,567398799,'Winnie','Murray','Murray','Winnie_Murray2280@zorer.org','9489-03-26 18:46:14Z','0523-11-18 08:43:36Z'),
(2,49,1,860903563,'Denny','Poulton','Poulton','Denny_Poulton3530@cispeto.com','6729-10-19 01:20:58Z','5619-06-28 15:42:10Z'),
(2,7,1,554985762,'Angel','Reyes','Reyes','Angel_Reyes9662@extex.org','4619-01-31 12:19:07Z','0935-03-07 09:33:17Z'),
(1,36,1,440110054,'Angela','Russel','Russel','Angela_Russel9853@deons.tech','0411-09-08 21:51:51Z','3870-09-30 03:03:03Z'),
(2,30,1,866158553,'Fiona','Forth','Forth','Fiona_Forth3938@infotech44.tech','8932-07-15 15:01:22Z','5795-08-15 15:46:41Z'),
(1,49,1,779835108,'Rocco','Neville','Neville','Rocco_Neville8594@corti.com','6371-08-29 21:05:06Z','0749-05-04 08:16:03Z'),
(2,47,1,373147241,'Kate','Chapman','Chapman','Kate_Chapman4294@irrepsy.com','1056-04-19 15:57:41Z','4616-01-24 06:05:09Z'),
(2,4,1,842054319,'Danny','Allwood','Allwood','Danny_Allwood9120@irrepsy.com','5974-10-27 03:18:49Z','8184-03-13 06:43:19Z'),
(2,41,1,837071062,'Lucas','Thornton','Thornton','Lucas_Thornton9245@supunk.biz','7239-12-09 02:52:46Z','1756-08-05 14:58:55Z'),
(2,11,1,410797982,'Gwen','Tailor','Tailor','Gwen_Tailor6044@zorer.org','4189-08-02 10:07:36Z','2872-02-05 09:13:21Z'),
(2,13,1,262321190,'Dalia','Haines','Haines','Dalia_Haines7835@grannar.com','9857-06-27 16:01:39Z','4219-03-25 11:18:52Z'),
(2,26,1,799965695,'Oliver','Rixon','Rixon','Oliver_Rixon5826@famism.biz','9852-01-30 20:47:45Z','4368-11-04 16:39:24Z'),
(1,36,1,698159460,'Ciara','Mccormick','Mccormick','Ciara_Mccormick5656@qater.org','1878-04-28 09:34:11Z','9970-05-12 22:47:42Z'),
(2,35,1,358512624,'Marina','Stark','Stark','Marina_Stark3984@atink.com','3435-10-30 18:57:45Z','5489-08-24 00:20:14Z'),
(1,29,1,196081387,'Johnny','Stevens','Stevens','Johnny_Stevens4117@yahoo.com','4165-07-01 06:58:50Z','9881-09-20 21:58:02Z'),
(2,48,1,623470587,'Alexa','Redwood','Redwood','Alexa_Redwood5693@mafthy.com','9706-08-11 15:34:04Z','6388-09-04 09:13:55Z'),
(2,12,1,339388476,'Victoria','Spencer','Spencer','Victoria_Spencer9801@twipet.com','4928-08-06 07:23:17Z','3554-02-08 20:58:43Z'),
(1,19,1,732038043,'Gwenyth','Lynn','Lynn','Gwenyth_Lynn3583@womeona.net','3496-04-25 07:48:56Z','7776-10-26 19:45:53Z'),
(1,38,1,674603991,'Ruby','Rothwell','Rothwell','Ruby_Rothwell511@acrit.org','7283-09-07 19:09:17Z','6153-07-04 18:34:20Z'),
(1,42,1,710082012,'Lucas','Kidd','Kidd','Lucas_Kidd4374@sheye.org','1014-10-23 07:08:20Z','7151-10-11 10:37:22Z'),
(2,12,1,750539115,'Andrea','Niles','Niles','Andrea_Niles1711@elnee.tech','4373-01-10 13:11:13Z','7342-10-23 12:13:36Z'),
(2,45,1,638334602,'Louise','Shea','Shea','Louise_Shea8106@ovock.tech','3783-11-30 22:53:01Z','0132-11-28 08:31:53Z'),
(1,18,1,335383007,'Madison','Bell','Bell','Madison_Bell5487@ubusive.com','9673-01-15 05:14:31Z','3671-12-30 17:54:43Z'),
(2,36,1,297525657,'Logan','Coates','Coates','Logan_Coates6707@zorer.org','2194-11-14 02:16:24Z','4241-02-12 04:38:19Z'),
(1,43,1,400822811,'Cristal','Murphy','Murphy','Cristal_Murphy6428@acrit.org','9853-03-01 16:33:23Z','0112-12-02 04:57:16Z'),
(1,41,1,458863745,'Mason','Rivers','Rivers','Mason_Rivers1915@elnee.tech','5255-11-10 15:16:54Z','5432-12-04 01:35:12Z'),
(1,3,1,635090666,'Elijah','Styles','Styles','Elijah_Styles5543@bulaffy.com','6000-04-11 13:06:27Z','2082-12-13 21:17:07Z'),
(2,41,1,572150488,'Margaret','Wise','Wise','Margaret_Wise5563@ovock.tech','2301-11-03 11:21:25Z','4421-03-28 14:57:11Z'),
(2,47,1,339549645,'Barry','Hudson','Hudson','Barry_Hudson1532@grannar.com','0646-04-01 11:04:56Z','3173-11-28 17:58:46Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,38,1,690544256,'Alexander','Parr','Parr','Alexander_Parr4268@deavo.com','9784-02-12 01:11:28Z','1580-01-15 21:08:15Z'),
(1,18,1,225053389,'Michael','Price','Price','Michael_Price4670@famism.biz','5752-12-06 06:27:58Z','9127-12-06 17:22:37Z'),
(1,11,1,855715372,'Vicky','Harrison','Harrison','Vicky_Harrison8759@mafthy.com','2359-12-14 04:56:03Z','9066-03-17 13:55:40Z'),
(2,32,1,844941145,'Sydney','Furnell','Furnell','Sydney_Furnell1254@nimogy.biz','2558-01-05 22:56:43Z','0657-03-11 07:47:50Z'),
(2,46,1,564597740,'Mark','Funnell','Funnell','Mark_Funnell9485@gompie.com','3091-02-02 09:29:58Z','6686-09-21 16:31:17Z'),
(1,37,1,438718689,'Harry','Yarlett','Yarlett','Harry_Yarlett4743@eirey.tech','6382-06-15 16:54:50Z','1703-10-06 19:09:12Z'),
(1,1,1,268947185,'Leroy','Saunders','Saunders','Leroy_Saunders167@acrit.org','4450-05-22 17:36:41Z','5871-04-16 06:25:25Z'),
(1,4,1,403957180,'Doug','Clayton','Clayton','Doug_Clayton1969@ubusive.com','6588-10-04 21:01:42Z','1388-04-30 12:20:45Z'),
(2,26,1,827735239,'Anthony','Oakley','Oakley','Anthony_Oakley6519@dionrab.com','1539-04-10 06:50:32Z','0512-03-01 10:29:24Z'),
(2,5,1,678656099,'Tyler','Carpenter','Carpenter','Tyler_Carpenter8239@guentu.biz','5926-05-08 01:58:36Z','3063-01-23 05:16:55Z'),
(2,45,1,128082691,'Chester','Ellis','Ellis','Chester_Ellis5268@bretoux.com','8135-10-04 14:20:46Z','6077-08-06 10:31:18Z'),
(2,13,1,773641980,'Tiffany','Ashwell','Ashwell','Tiffany_Ashwell4494@yahoo.com','3630-08-28 15:39:26Z','8476-03-17 00:33:36Z'),
(2,29,1,252333843,'Oliver','Fowler','Fowler','Oliver_Fowler5086@joiniaa.com','2425-12-09 11:28:06Z','9848-10-01 14:27:18Z'),
(1,2,1,243730038,'Eileen','Lomax','Lomax','Eileen_Lomax7150@fuliss.net','7900-07-01 14:51:51Z','9659-07-18 13:45:09Z'),
(2,47,1,678246969,'Shay','Gaynor','Gaynor','Shay_Gaynor2269@elnee.tech','3749-10-10 20:57:54Z','3781-11-26 01:11:07Z'),
(2,27,1,779795091,'Celia','Nicolas','Nicolas','Celia_Nicolas5301@tonsy.org','8139-01-09 03:37:31Z','2766-05-24 20:41:55Z'),
(1,26,1,636161509,'Jayden','Cameron','Cameron','Jayden_Cameron9724@bauros.biz','5963-07-02 14:43:05Z','4119-08-05 12:39:43Z'),
(1,12,1,682856183,'Catherine','Addis','Addis','Catherine_Addis5430@grannar.com','3617-08-07 07:34:52Z','0984-05-20 00:15:58Z'),
(2,34,1,727514618,'Josephine','Vallins','Vallins','Josephine_Vallins4405@sveldo.biz','3178-10-28 10:46:05Z','4020-06-07 14:57:47Z'),
(2,24,1,642391391,'Tyson','Weston','Weston','Tyson_Weston6922@twace.org','9198-09-27 05:22:50Z','4980-02-12 13:28:06Z'),
(2,49,1,681570213,'Joseph','Snow','Snow','Joseph_Snow3137@iatim.tech','3259-12-05 09:44:26Z','9597-03-02 16:35:05Z'),
(1,39,1,334863636,'Madelyn','Wade','Wade','Madelyn_Wade2051@muall.tech','3670-04-24 17:03:14Z','8198-09-14 20:18:58Z'),
(1,49,1,130598423,'Barney','Ebden','Ebden','Barney_Ebden8688@famism.biz','0966-07-20 05:55:40Z','9601-07-28 12:46:45Z'),
(1,34,1,217401721,'Chuck','Alcroft','Alcroft','Chuck_Alcroft6352@dionrab.com','3841-11-09 10:15:22Z','5061-03-23 12:26:27Z'),
(2,31,1,335911408,'Bernadette','Oswald','Oswald','Bernadette_Oswald9332@eirey.tech','4807-04-11 17:15:57Z','4068-09-27 04:15:27Z'),
(1,31,1,751919620,'Miley','Upton','Upton','Miley_Upton3276@infotech44.tech','7091-02-17 17:35:39Z','5905-04-30 16:28:13Z'),
(2,9,1,795947867,'Nicholas','Burge','Burge','Nicholas_Burge3673@bulaffy.com','4953-11-27 04:21:05Z','9773-02-10 06:58:54Z'),
(1,41,1,246529189,'Eden','Walker','Walker','Eden_Walker7954@ubusive.com','3772-06-06 17:19:34Z','8901-12-13 00:46:44Z'),
(1,5,1,728074870,'Chester','Gaynor','Gaynor','Chester_Gaynor3228@bulaffy.com','5851-02-04 19:56:51Z','7318-01-06 11:36:43Z'),
(2,33,1,723144555,'Ada','Rogers','Rogers','Ada_Rogers8551@grannar.com','9422-01-31 08:02:19Z','6051-12-15 03:34:20Z'),
(2,45,1,152760740,'Vicky','Janes','Janes','Vicky_Janes4447@jiman.org','9784-05-10 17:49:26Z','6454-06-01 05:42:49Z'),
(1,6,1,632633532,'Priscilla','Moreno','Moreno','Priscilla_Moreno9608@eirey.tech','2123-11-05 02:16:34Z','9799-02-19 15:22:31Z'),
(2,35,1,638796929,'Hayden','Richardson','Richardson','Hayden_Richardson103@cispeto.com','3555-02-24 19:01:05Z','2968-09-01 03:19:28Z'),
(2,24,1,793435715,'Cassandra','Evans','Evans','Cassandra_Evans1434@hourpy.biz','6816-05-04 06:09:40Z','9985-03-21 01:26:54Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,1,1,481792599,'Benny','Casey','Casey','Benny_Casey2879@atink.com','6266-11-22 15:55:09Z','9155-03-06 22:56:06Z'),
(2,45,1,365914788,'Oliver','Anderson','Anderson','Oliver_Anderson4944@qater.org','1072-01-25 01:50:48Z','3569-12-05 17:33:09Z'),
(1,16,1,881742790,'Sonya','Aldridge','Aldridge','Sonya_Aldridge7562@deavo.com','3367-10-14 16:12:39Z','7661-03-01 07:12:33Z'),
(1,27,1,191059581,'Aurelia','Cork','Cork','Aurelia_Cork7065@iatim.tech','4602-10-13 17:25:19Z','2697-12-18 20:22:58Z'),
(2,32,1,538651248,'Owen','Crawley','Crawley','Owen_Crawley7291@iatim.tech','2673-05-10 13:17:10Z','3410-11-25 17:37:14Z'),
(2,1,1,689403203,'Chadwick','Olivier','Olivier','Chadwick_Olivier5756@acrit.org','7716-10-28 20:18:22Z','0670-10-28 18:48:39Z'),
(2,28,1,839772237,'Michael','Ellis','Ellis','Michael_Ellis7115@corti.com','8137-09-11 01:24:26Z','1192-11-18 00:47:04Z'),
(1,18,1,362541355,'Marvin','Harris','Harris','Marvin_Harris2485@tonsy.org','8760-01-20 07:24:14Z','2003-07-14 18:27:30Z'),
(2,4,1,867346966,'Ember','Graham','Graham','Ember_Graham77@eirey.tech','5516-01-25 12:09:53Z','6524-12-11 20:30:17Z'),
(1,23,1,398388612,'Owen','Radley','Radley','Owen_Radley5027@brety.org','6690-11-23 22:17:14Z','6135-03-01 06:56:54Z'),
(1,36,1,441312539,'Mara','Greenwood','Greenwood','Mara_Greenwood2694@deons.tech','5948-08-08 10:05:17Z','2236-02-10 09:52:56Z'),
(1,49,1,313500614,'Emery','Donnelly','Donnelly','Emery_Donnelly9963@liret.org','3563-09-20 16:41:00Z','9380-11-25 05:12:57Z'),
(2,40,1,303619016,'Kenzie','Potts','Potts','Kenzie_Potts1238@twipet.com','0517-09-29 02:24:25Z','4455-10-14 12:23:17Z'),
(2,47,1,269970159,'Raquel','Clifford','Clifford','Raquel_Clifford5863@tonsy.org','9584-09-29 21:33:04Z','6567-09-13 04:52:18Z'),
(2,5,1,311668057,'Gwen','Mason','Mason','Gwen_Mason9964@infotech44.tech','2541-02-09 09:34:46Z','9107-12-08 03:17:42Z'),
(1,13,1,868526864,'Barney','Varley','Varley','Barney_Varley1249@dionrab.com','1937-07-11 20:33:12Z','3950-01-17 20:31:07Z'),
(2,16,1,763827003,'Bryce','Rehman','Rehman','Bryce_Rehman8126@liret.org','4971-10-04 17:00:23Z','0477-10-24 17:15:21Z'),
(2,32,1,171802642,'Rowan','Vaughan','Vaughan','Rowan_Vaughan1177@gembat.biz','9817-08-25 07:25:44Z','8591-01-23 12:03:39Z'),
(1,49,1,111145148,'Emely','John','John','Emely_John3558@brety.org','5971-10-04 18:07:39Z','1460-09-16 02:18:50Z'),
(2,44,1,344286399,'Chris','Harper','Harper','Chris_Harper9281@iatim.tech','8056-03-17 10:22:28Z','6380-09-11 05:56:42Z'),
(2,14,1,739271164,'Lorraine','Silva','Silva','Lorraine_Silva7886@gmail.com','8906-12-08 15:58:31Z','8357-12-09 04:07:53Z'),
(2,8,1,268252000,'Samantha','Khan','Khan','Samantha_Khan7419@supunk.biz','7013-06-11 00:57:14Z','9591-01-23 13:10:55Z'),
(2,2,1,726267672,'Rae','Benfield','Benfield','Rae_Benfield1899@bungar.biz','5916-08-19 03:54:04Z','9698-04-08 05:14:33Z'),
(2,39,1,357358567,'Denis','Lewis','Lewis','Denis_Lewis9483@joiniaa.com','6998-11-09 03:47:07Z','9315-11-16 02:48:35Z'),
(2,5,1,495467371,'Tom','Shields','Shields','Tom_Shields5048@jiman.org','1279-10-24 00:47:17Z','7315-03-04 17:42:39Z'),
(2,19,1,333819186,'Olivia','Widdows','Widdows','Olivia_Widdows2153@gmail.com','8873-12-13 13:22:48Z','6600-10-04 01:06:28Z'),
(2,9,1,793224170,'Abdul','Fields','Fields','Abdul_Fields5247@famism.biz','7128-06-02 02:08:06Z','9683-09-07 09:05:26Z'),
(1,23,1,843625063,'Iris','Rainford','Rainford','Iris_Rainford5273@twace.org','0615-08-06 19:07:26Z','4679-01-21 21:41:48Z'),
(1,28,1,685366017,'Roger','Jacobs','Jacobs','Roger_Jacobs3836@eirey.tech','9987-04-13 19:04:15Z','9190-04-07 04:16:22Z'),
(2,33,1,754789941,'Ron','Wade','Wade','Ron_Wade3002@bauros.biz','7067-11-11 11:23:35Z','2450-05-12 03:25:16Z'),
(1,27,1,581308212,'Chester','Hogg','Hogg','Chester_Hogg3115@nimogy.biz','9372-05-08 06:26:50Z','1425-05-01 15:49:04Z'),
(1,3,1,231987299,'Nick','Summers','Summers','Nick_Summers5486@extex.org','3795-10-17 11:58:37Z','7537-12-02 16:38:58Z'),
(2,37,1,680050910,'Ivy','Mullins','Mullins','Ivy_Mullins4734@twace.org','7395-10-23 16:50:52Z','5643-07-14 19:32:30Z'),
(1,19,1,755927821,'Mike','Walsh','Walsh','Mike_Walsh455@vetan.org','7734-01-08 21:19:02Z','1835-06-08 13:47:51Z'),
(2,5,1,432871868,'Chad','Coll','Coll','Chad_Coll5659@yahoo.com','7250-04-02 18:41:05Z','8152-04-05 14:25:07Z'),
(2,13,1,191371775,'Marvin','Dale','Dale','Marvin_Dale7370@sveldo.biz','8986-06-26 06:08:05Z','5561-05-18 03:02:00Z'),
(1,24,1,650173869,'Keira','Ryan','Ryan','Keira_Ryan6763@naiker.biz','0634-03-16 04:20:30Z','9581-10-05 07:52:54Z'),
(2,27,1,175286317,'Keira','Turner','Turner','Keira_Turner5554@bretoux.com','5503-09-05 13:24:55Z','1689-11-16 14:38:04Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,47,1,869794304,'Carissa','Harris','Harris','Carissa_Harris657@ubusive.com','0839-12-06 12:23:35Z','9404-09-22 21:14:09Z'),
(1,25,1,309503315,'Benny','Johnson','Johnson','Benny_Johnson6759@supunk.biz','0222-10-08 22:15:49Z','8944-04-29 12:40:25Z'),
(2,47,1,557006826,'Mavis','Allwood','Allwood','Mavis_Allwood641@sheye.org','4899-08-22 17:09:41Z','6098-12-12 14:09:46Z'),
(1,8,1,257873087,'Daniel','Shaw','Shaw','Daniel_Shaw2118@gompie.com','0954-03-24 17:47:28Z','1895-08-08 22:41:09Z'),
(1,16,1,461066719,'Aiden','Cork','Cork','Aiden_Cork8226@corti.com','0790-04-14 08:30:39Z','4123-10-26 07:05:02Z'),
(1,27,1,341287977,'Carter','Herbert','Herbert','Carter_Herbert8261@extex.org','6754-11-16 01:15:16Z','3005-01-16 18:27:32Z'),
(2,42,1,655983290,'Josh','Farrell','Farrell','Josh_Farrell3732@deavo.com','8367-06-18 10:41:53Z','6830-05-29 09:42:26Z'),
(2,8,1,211924320,'Hank','Poulton','Poulton','Hank_Poulton2962@kideod.biz','8207-10-10 14:33:13Z','7785-03-28 13:02:07Z'),
(2,12,1,142504536,'Daron','Niles','Niles','Daron_Niles8631@vetan.org','0845-01-15 15:07:04Z','9924-06-19 15:32:49Z'),
(2,16,1,122748153,'Ada','Trent','Trent','Ada_Trent3693@liret.org','0598-07-01 19:47:28Z','0583-03-22 20:38:46Z'),
(2,24,1,410590772,'Evie','Glass','Glass','Evie_Glass635@womeona.net','1024-11-10 11:10:22Z','8283-04-23 21:01:22Z'),
(2,36,1,272437767,'Shannon','Abbey','Abbey','Shannon_Abbey147@typill.biz','2410-01-10 05:03:07Z','0262-10-28 18:27:17Z'),
(1,4,1,476661332,'Julianna','Parr','Parr','Julianna_Parr5562@corti.com','2293-09-25 03:11:50Z','2315-03-11 20:46:05Z'),
(1,46,1,278783631,'Aurelia','Daniells','Daniells','Aurelia_Daniells428@gompie.com','2716-10-27 19:00:24Z','0763-01-15 15:41:04Z'),
(2,47,1,458887995,'Kenzie','Osmond','Osmond','Kenzie_Osmond9502@brety.org','2659-02-21 09:48:56Z','0095-11-02 08:15:01Z'),
(2,27,1,363951549,'Ronald','Burge','Burge','Ronald_Burge7326@bulaffy.com','1867-07-26 09:32:04Z','1531-09-12 10:29:46Z'),
(1,41,1,652145039,'Rita','Yang','Yang','Rita_Yang3238@corti.com','8169-02-21 12:13:36Z','2621-12-25 11:43:22Z'),
(1,9,1,855964260,'Hayden','Potts','Potts','Hayden_Potts8804@grannar.com','9639-08-21 01:23:38Z','1128-06-13 21:19:10Z'),
(1,22,1,257769676,'Lana','Rivers','Rivers','Lana_Rivers7057@hourpy.biz','1862-07-18 14:29:17Z','9245-08-01 21:47:40Z'),
(1,16,1,109273440,'Chester','Moore','Moore','Chester_Moore5967@atink.com','1463-01-28 08:54:49Z','7041-09-11 13:53:26Z'),
(1,15,1,893284781,'Danny','Drake','Drake','Danny_Drake3365@sveldo.biz','6793-04-28 04:22:15Z','0395-01-21 03:34:57Z'),
(2,1,1,133076632,'Ethan','Bright','Bright','Ethan_Bright9567@famism.biz','2916-03-01 15:46:58Z','4820-11-05 00:35:50Z'),
(2,26,1,878128528,'Chloe','Kelly','Kelly','Chloe_Kelly4088@guentu.biz','4766-07-04 19:13:52Z','1069-01-07 05:19:51Z'),
(1,45,1,234272732,'Aleksandra','Addis','Addis','Aleksandra_Addis8767@bungar.biz','4178-02-14 09:32:07Z','1973-06-24 03:45:24Z'),
(1,4,1,240662863,'Chuck','Whitmore','Whitmore','Chuck_Whitmore166@atink.com','6943-12-23 13:43:10Z','1848-02-23 09:26:07Z'),
(1,35,1,538018631,'Kurt','Davies','Davies','Kurt_Davies9733@yahoo.com','2007-12-18 19:50:45Z','2794-01-11 15:26:27Z'),
(2,13,1,403857767,'Bart','Allen','Allen','Bart_Allen9988@yahoo.com','2911-07-05 06:08:45Z','2330-12-24 22:05:58Z'),
(1,4,1,721217502,'Carrie','Tate','Tate','Carrie_Tate1479@twace.org','7713-01-30 21:09:21Z','4150-12-13 20:16:41Z'),
(2,10,1,537247850,'Doug','Rosenbloom','Rosenbloom','Doug_Rosenbloom8335@womeona.net','4990-11-15 08:49:16Z','9676-12-25 19:44:45Z'),
(2,19,1,104996396,'Bryon','Walton','Walton','Bryon_Walton6008@eirey.tech','2699-09-07 04:49:39Z','8760-07-23 08:50:03Z'),
(1,45,1,679460501,'Shay','Moreno','Moreno','Shay_Moreno7447@eirey.tech','0671-09-15 01:18:51Z','8036-02-05 01:23:34Z'),
(1,45,1,416576044,'Maxwell','Gilmore','Gilmore','Maxwell_Gilmore7713@bretoux.com','6999-07-31 08:58:50Z','6230-04-26 00:57:12Z'),
(1,42,1,327295740,'Summer','Ulyatt','Ulyatt','Summer_Ulyatt1490@bauros.biz','2690-11-23 18:16:21Z','4663-08-02 02:25:04Z'),
(2,47,1,448268362,'Leroy','Cameron','Cameron','Leroy_Cameron8557@joiniaa.com','4757-11-08 03:44:23Z','4441-05-22 00:20:39Z'),
(2,28,1,197977162,'Matt','Gates','Gates','Matt_Gates6568@muall.tech','9233-05-01 12:28:55Z','2336-12-30 06:33:45Z'),
(1,1,1,661043474,'Marilyn','Wigley','Wigley','Marilyn_Wigley2960@zorer.org','8839-03-29 16:23:20Z','8249-07-03 17:55:41Z'),
(1,44,1,377584658,'Priscilla','Jefferson','Jefferson','Priscilla_Jefferson6025@naiker.biz','3282-04-11 22:21:28Z','2421-11-09 19:11:36Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,16,1,872516772,'Cassidy','Oldfield','Oldfield','Cassidy_Oldfield1360@eirey.tech','1295-09-05 07:15:17Z','0984-10-30 18:32:13Z'),
(2,34,1,745248555,'Zoe','Wright','Wright','Zoe_Wright3441@bulaffy.com','8318-02-16 07:54:22Z','6418-05-20 19:12:43Z'),
(2,31,1,766967076,'Celia','Kelly','Kelly','Celia_Kelly5111@deons.tech','8529-03-18 13:20:29Z','2298-06-13 04:48:15Z'),
(1,25,1,487184945,'Kieth','Durrant','Durrant','Kieth_Durrant3716@famism.biz','6837-02-11 21:12:51Z','4877-04-18 10:02:32Z'),
(1,46,1,580447392,'Carter','Mccall','Mccall','Carter_Mccall6210@deavo.com','1752-12-24 11:58:24Z','6020-09-05 02:06:07Z'),
(2,35,1,140327923,'Jenna','Gibson','Gibson','Jenna_Gibson6216@sheye.org','2306-01-06 15:17:12Z','3652-11-30 03:17:55Z'),
(1,44,1,265826081,'David','Thomas','Thomas','David_Thomas8638@sheye.org','8246-01-06 16:21:38Z','0817-06-09 19:05:44Z'),
(2,18,1,510873411,'Erin','Randall','Randall','Erin_Randall6108@hourpy.biz','6928-09-12 08:18:29Z','8100-01-24 07:41:27Z'),
(1,11,1,601342441,'Samantha','Collis','Collis','Samantha_Collis3885@twipet.com','9037-08-31 15:14:07Z','1489-07-29 19:11:27Z'),
(2,47,1,221739528,'Emerald','Stone ','Stone ','Emerald_Stone 4135@supunk.biz','4157-12-29 01:32:15Z','0146-12-14 08:39:10Z'),
(2,44,1,121631782,'Cedrick','Uttley','Uttley','Cedrick_Uttley9115@liret.org','4437-09-30 19:21:40Z','5440-02-15 12:06:01Z'),
(2,37,1,727270004,'Maia','Vollans','Vollans','Maia_Vollans6885@eirey.tech','3054-11-04 03:49:00Z','8891-09-18 07:34:55Z'),
(1,16,1,647576469,'Owen','Broomfield','Broomfield','Owen_Broomfield7367@bungar.biz','3206-12-28 11:03:41Z','8717-11-15 12:25:14Z'),
(2,45,1,389042000,'Madelyn','Grant','Grant','Madelyn_Grant9553@naiker.biz','5896-03-13 21:04:12Z','5546-01-13 12:46:43Z'),
(2,39,1,431205261,'Marvin','Cartwright','Cartwright','Marvin_Cartwright760@zorer.org','9225-06-08 08:37:32Z','4336-12-21 14:24:45Z'),
(2,33,1,613743956,'Victoria','Quinn','Quinn','Victoria_Quinn8723@guentu.biz','0591-08-31 20:39:41Z','7660-12-15 21:15:56Z'),
(1,32,1,501690161,'Hazel','Jacobs','Jacobs','Hazel_Jacobs2958@corti.com','6557-02-06 14:18:14Z','1560-03-24 07:38:26Z'),
(2,6,1,818643482,'Tyler','John','John','Tyler_John3254@cispeto.com','0902-02-11 22:24:09Z','1565-06-25 10:21:34Z'),
(2,38,1,476742826,'Daron','Wellington','Wellington','Daron_Wellington2808@atink.com','7931-04-03 15:32:38Z','9031-06-09 13:00:14Z'),
(1,8,1,446388488,'Kieth','Yard','Yard','Kieth_Yard7215@extex.org','3377-07-04 00:52:19Z','4992-08-14 04:56:38Z'),
(2,44,1,188471163,'Joy','Ripley','Ripley','Joy_Ripley8832@bauros.biz','2598-02-01 17:45:50Z','1870-09-04 09:23:53Z'),
(1,11,1,635491937,'Keira','Cowan','Cowan','Keira_Cowan9979@corti.com','9632-12-26 14:23:47Z','2939-08-20 11:35:00Z'),
(2,7,1,159172663,'Oliver','Groves','Groves','Oliver_Groves9080@nickia.com','7355-04-10 08:56:07Z','1507-11-02 14:29:24Z'),
(2,37,1,407378279,'Ethan','Marshall','Marshall','Ethan_Marshall7354@iatim.tech','5574-08-16 19:28:55Z','9658-06-15 06:10:50Z'),
(2,14,1,818354491,'Anne','Butler','Butler','Anne_Butler8900@extex.org','8382-07-24 05:02:20Z','8126-02-26 00:53:22Z'),
(2,43,1,472258726,'Mason','Norris','Norris','Mason_Norris7786@kideod.biz','0427-04-04 19:24:43Z','7696-10-25 02:45:16Z'),
(1,12,1,603487994,'Cara','Patel','Patel','Cara_Patel9622@supunk.biz','3377-03-17 00:40:16Z','7448-06-20 18:34:32Z'),
(2,16,1,797693177,'Jackeline','Hill','Hill','Jackeline_Hill6216@kideod.biz','6737-11-21 15:27:15Z','0686-09-29 02:15:04Z'),
(2,34,1,209783591,'Elise','Appleton','Appleton','Elise_Appleton1929@dionrab.com','3297-10-26 18:05:10Z','2978-10-14 00:48:10Z'),
(1,24,1,852913614,'Abbey','Allwood','Allwood','Abbey_Allwood3987@nanoff.biz','4826-10-09 11:28:08Z','2691-06-20 21:24:11Z'),
(2,45,1,149618453,'Ethan','Griffiths','Griffiths','Ethan_Griffiths5009@typill.biz','5607-12-27 13:31:16Z','3760-02-08 15:37:04Z'),
(2,40,1,146556988,'Hayden','Norris','Norris','Hayden_Norris9684@ovock.tech','9904-09-06 03:41:55Z','0607-05-11 20:39:57Z'),
(1,45,1,506706569,'Monica','Sloan','Sloan','Monica_Sloan865@atink.com','6076-11-08 05:51:53Z','1067-09-01 19:49:03Z'),
(1,31,1,649829475,'Rhea','Mccall','Mccall','Rhea_Mccall2218@sveldo.biz','1873-02-25 11:47:51Z','5001-08-20 15:50:17Z'),
(2,36,1,891833304,'Lucas','Cobb','Cobb','Lucas_Cobb3988@bulaffy.com','1808-11-21 14:05:03Z','8838-01-05 07:50:51Z'),
(2,3,1,792030779,'Roger','Gibbons','Gibbons','Roger_Gibbons7635@joiniaa.com','0858-11-30 07:17:16Z','1076-03-23 12:00:35Z'),
(1,6,1,724885623,'Alexander','Turner','Turner','Alexander_Turner3161@sheye.org','8954-06-04 09:07:02Z','3035-02-21 03:55:58Z'),
(1,40,1,866867328,'Ivette','Addis','Addis','Ivette_Addis3323@mafthy.com','3173-03-15 14:06:37Z','0733-08-31 02:05:26Z'),
(2,37,1,506908668,'Rocco','Goodman','Goodman','Rocco_Goodman9431@deons.tech','1853-03-09 10:37:21Z','7823-10-11 04:20:17Z'),
(1,11,1,359576437,'Jackeline','Edler','Edler','Jackeline_Edler6272@tonsy.org','5200-04-19 00:12:07Z','8221-10-05 07:02:34Z'),
(1,10,1,661387687,'Barry','Martin','Martin','Barry_Martin991@zorer.org','2483-08-22 09:40:13Z','5349-06-05 10:45:20Z'),
(2,43,1,321011548,'Aeris','Edwards','Edwards','Aeris_Edwards2926@bretoux.com','3015-08-04 09:43:57Z','3631-06-05 02:35:45Z'),
(1,8,1,256342428,'Josephine','Abbot','Abbot','Josephine_Abbot4596@irrepsy.com','6407-03-10 18:55:57Z','9850-11-15 12:26:45Z'),
(2,9,1,441155919,'Gil','Oliver','Oliver','Gil_Oliver7736@supunk.biz','9115-11-14 22:21:52Z','8852-03-18 07:05:27Z'),
(1,31,1,884546407,'Jaylene','Murray','Murray','Jaylene_Murray4363@typill.biz','4673-06-10 15:21:20Z','3164-09-19 19:17:11Z'),
(1,22,1,622561212,'Nicole','Hammond','Hammond','Nicole_Hammond4486@typill.biz','3732-04-29 19:05:33Z','7554-12-22 11:50:29Z'),
(1,41,1,632291348,'Lucas','Ross','Ross','Lucas_Ross2608@vetan.org','5952-02-15 01:24:02Z','5952-02-25 03:03:41Z'),
(2,32,1,741638539,'Clint','Larsen','Larsen','Clint_Larsen6829@nanoff.biz','9444-05-18 04:19:14Z','7118-06-20 03:29:49Z'),
(2,24,1,141333957,'Kieth','Dyson','Dyson','Kieth_Dyson8057@famism.biz','3461-04-28 08:01:44Z','7780-03-04 15:01:51Z'),
(2,10,1,682230301,'Oliver','Kelly','Kelly','Oliver_Kelly9582@corti.com','4579-05-13 21:54:21Z','8833-08-27 20:53:12Z'),
(1,30,1,193208664,'Carter','Isaac','Isaac','Carter_Isaac5917@sheye.org','1641-07-06 18:38:24Z','1665-03-16 11:18:22Z'),
(2,15,1,147023531,'Percy','Harvey','Harvey','Percy_Harvey5954@gompie.com','5359-10-22 08:52:40Z','4627-09-01 10:07:32Z'),
(1,22,1,476627021,'Ron','Rowe','Rowe','Ron_Rowe5144@infotech44.tech','4369-07-13 18:18:04Z','2915-02-28 09:36:57Z'),
(1,30,1,699862351,'Carmen','Dixon','Dixon','Carmen_Dixon5502@grannar.com','3869-06-15 22:41:04Z','7013-11-05 08:31:50Z'),
(1,43,1,622991523,'Jackeline','Weatcroft','Weatcroft','Jackeline_Weatcroft2198@deons.tech','6820-09-20 01:17:28Z','2445-08-24 21:15:41Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,26,1,275648009,'Daniel','Harrison','Harrison','Daniel_Harrison1707@bulaffy.com','2836-01-19 20:47:52Z','7355-09-07 10:45:13Z'),
(1,37,1,184073093,'Victoria','Morris','Morris','Victoria_Morris2502@muall.tech','6405-03-18 16:15:04Z','1424-10-22 00:26:22Z'),
(1,2,1,881991295,'Melody','Smith','Smith','Melody_Smith4905@brety.org','6067-03-28 12:24:12Z','9465-01-14 13:30:15Z'),
(2,26,1,579032632,'Georgia','Jenkin','Jenkin','Georgia_Jenkin8367@gompie.com','2734-01-06 22:53:49Z','1412-03-30 19:21:29Z'),
(1,37,1,193525474,'Lily','Norton','Norton','Lily_Norton8289@gmail.com','8423-04-26 13:49:26Z','6940-03-04 02:43:47Z'),
(1,46,1,418945388,'Meredith','Bristow','Bristow','Meredith_Bristow9320@joiniaa.com','0962-07-15 03:34:52Z','4655-12-31 16:02:41Z'),
(1,38,1,126548986,'Gil','Dobson','Dobson','Gil_Dobson5499@liret.org','8413-04-16 17:00:06Z','5793-11-03 20:09:01Z'),
(2,22,1,371510134,'Johnathan','Price','Price','Johnathan_Price5206@deavo.com','6657-10-03 09:14:27Z','3768-04-27 20:46:44Z'),
(2,49,1,867292546,'Tony','Mcgee','Mcgee','Tony_Mcgee4537@nanoff.biz','6942-10-23 21:54:18Z','5168-09-11 06:24:51Z'),
(1,30,1,795233163,'Caydence','Stewart','Stewart','Caydence_Stewart2878@ubusive.com','3967-06-02 12:17:44Z','4645-12-21 19:12:20Z'),
(1,9,1,251776509,'Kaylee','Partridge','Partridge','Kaylee_Partridge463@nanoff.biz','0015-01-27 03:34:23Z','1490-01-23 02:49:35Z'),
(2,9,1,593212874,'Gil','Wigley','Wigley','Gil_Wigley7151@iatim.tech','7348-10-31 10:08:23Z','2297-11-03 01:42:56Z'),
(1,12,1,201591377,'Chris','Johnson','Johnson','Chris_Johnson1550@nimogy.biz','6673-03-05 11:41:55Z','2478-05-09 09:27:09Z'),
(2,2,1,481814671,'Roger','Eyres','Eyres','Roger_Eyres3127@gompie.com','8043-10-04 00:52:45Z','7717-03-25 02:51:25Z'),
(1,30,1,846456526,'Jacob','Nurton','Nurton','Jacob_Nurton3962@bungar.biz','4020-06-18 17:00:40Z','4871-06-24 00:40:14Z'),
(1,34,1,856614644,'William','Stewart','Stewart','William_Stewart5249@gompie.com','6850-02-23 02:15:54Z','8955-12-12 09:48:29Z'),
(1,43,1,477130334,'Oliver','Grady','Grady','Oliver_Grady4074@grannar.com','6864-03-24 02:17:51Z','3173-04-12 22:12:30Z'),
(1,9,1,724092936,'Chuck','Rees','Rees','Chuck_Rees2420@gmail.com','6948-01-20 21:08:58Z','5064-07-07 08:10:10Z'),
(2,40,1,383048476,'Nick','Rose','Rose','Nick_Rose7433@supunk.biz','3452-08-29 05:13:40Z','3677-11-13 03:02:23Z'),
(1,32,1,693407550,'Tyson','Noon','Noon','Tyson_Noon1489@sveldo.biz','9118-12-10 01:16:33Z','1800-09-18 17:06:41Z'),
(1,21,1,574132842,'Scarlett','Connell','Connell','Scarlett_Connell5424@supunk.biz','6300-11-09 22:00:40Z','3271-03-08 17:05:34Z'),
(2,27,1,278769295,'Crystal','Eastwood','Eastwood','Crystal_Eastwood7065@eirey.tech','5580-04-01 14:27:48Z','1652-12-12 11:06:58Z'),
(2,32,1,385153188,'Ema','Furnell','Furnell','Ema_Furnell6763@acrit.org','7978-01-25 14:07:24Z','5848-10-03 06:10:57Z'),
(2,29,1,202861551,'Chester','Crawley','Crawley','Chester_Crawley9607@acrit.org','9944-08-06 19:04:33Z','4648-11-28 11:52:41Z'),
(2,23,1,260682603,'Aeris','Jarvis','Jarvis','Aeris_Jarvis2846@zorer.org','4054-07-09 12:33:49Z','9731-06-29 07:17:50Z'),
(2,27,1,809686612,'Martin','James','James','Martin_James7755@fuliss.net','8535-08-01 07:35:46Z','3330-02-28 03:14:42Z'),
(1,36,1,437472973,'Kamila','Donovan','Donovan','Kamila_Donovan4532@eirey.tech','7449-06-18 16:22:29Z','0214-02-09 11:46:42Z'),
(2,18,1,439406071,'Denny','Power','Power','Denny_Power776@tonsy.org','2525-06-26 00:40:05Z','0725-05-13 08:19:06Z'),
(1,28,1,196540483,'Marie','Curtis','Curtis','Marie_Curtis7951@iatim.tech','8905-08-11 15:22:30Z','8322-06-24 18:48:04Z'),
(1,44,1,779368580,'Adalie','Jackson','Jackson','Adalie_Jackson425@liret.org','4386-09-18 04:45:09Z','6725-02-06 07:03:23Z'),
(1,11,1,741315900,'Kurt','Upton','Upton','Kurt_Upton6548@naiker.biz','4658-09-20 08:40:39Z','4203-01-03 04:50:00Z'),
(1,22,1,780373903,'Roger','Clayton','Clayton','Roger_Clayton6903@guentu.biz','5694-06-20 03:01:27Z','2181-07-05 08:19:06Z'),
(1,30,1,587187182,'Jazmin','Yarwood','Yarwood','Jazmin_Yarwood6141@famism.biz','4799-07-06 06:20:33Z','0184-09-15 22:54:09Z'),
(1,30,1,476933738,'Lara','Curtis','Curtis','Lara_Curtis2890@bulaffy.com','2219-09-30 20:37:19Z','2478-03-17 00:21:32Z'),
(2,13,1,142264414,'Aiden','Mason','Mason','Aiden_Mason2323@naiker.biz','6089-05-07 13:20:19Z','5510-10-06 03:05:18Z'),
(1,36,1,131543335,'Anthony','Coates','Coates','Anthony_Coates8050@nimogy.biz','3290-04-10 22:57:42Z','2322-04-21 06:58:00Z'),
(1,33,1,866265834,'Mike','Taylor','Taylor','Mike_Taylor3120@nickia.com','7771-11-20 16:56:35Z','6708-12-26 16:31:01Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,32,1,796173671,'Noah','Exton','Exton','Noah_Exton1142@gmail.com','1658-10-24 14:14:04Z','3768-01-19 07:20:18Z'),
(1,22,1,299662181,'Mark','Ramsey','Ramsey','Mark_Ramsey2620@gmail.com','1816-02-21 12:50:05Z','6581-04-16 05:26:41Z'),
(1,17,1,290807427,'Crystal','Graham','Graham','Crystal_Graham1219@mafthy.com','6183-06-10 09:03:35Z','4004-11-02 08:35:16Z'),
(2,6,1,732606356,'Owen','Emmett','Emmett','Owen_Emmett7213@cispeto.com','7260-08-08 09:15:15Z','5077-07-09 08:47:21Z'),
(1,1,1,263036440,'Manuel','Eddison','Eddison','Manuel_Eddison9492@muall.tech','6759-10-17 06:11:44Z','7811-04-20 04:15:48Z'),
(2,17,1,420847764,'Ron','Antcliff','Antcliff','Ron_Antcliff2985@brety.org','4749-01-11 06:50:19Z','1106-12-04 00:15:14Z'),
(1,29,1,119812008,'Norah','Franks','Franks','Norah_Franks28@twace.org','9727-11-07 14:30:44Z','9449-04-22 05:00:26Z'),
(2,23,1,727092204,'Jennifer','Cadman','Cadman','Jennifer_Cadman16@irrepsy.com','3807-09-15 09:05:18Z','5653-11-14 06:55:30Z'),
(2,33,1,423815578,'Abdul','Alcroft','Alcroft','Abdul_Alcroft7475@jiman.org','7032-01-23 17:45:57Z','5299-09-20 01:50:52Z'),
(1,39,1,445306957,'Sabrina','Simpson','Simpson','Sabrina_Simpson9725@grannar.com','4317-04-03 21:54:48Z','4074-12-24 08:33:14Z'),
(1,17,1,638719012,'Angelique','Owen','Owen','Angelique_Owen8678@womeona.net','6339-03-23 19:13:29Z','8507-12-26 08:13:25Z'),
(1,8,1,207180254,'Remy','Wright','Wright','Remy_Wright8757@qater.org','3306-04-21 00:49:26Z','2958-01-30 09:12:43Z'),
(2,26,1,387228929,'Daphne','Smith','Smith','Daphne_Smith7589@bulaffy.com','3976-03-26 03:44:03Z','5809-04-08 13:40:22Z'),
(1,21,1,296272649,'Goldie','Funnell','Funnell','Goldie_Funnell7171@hourpy.biz','7140-03-22 11:02:04Z','3382-02-21 10:00:44Z'),
(2,35,1,239098028,'Daniel','Carson','Carson','Daniel_Carson1255@liret.org','3828-07-20 12:07:47Z','7497-01-12 09:08:03Z'),
(1,39,1,824214512,'Gabriel','Jones','Jones','Gabriel_Jones5800@womeona.net','4488-08-01 18:42:49Z','0595-02-03 15:43:17Z'),
(2,49,1,660526034,'Denny','Radley','Radley','Denny_Radley2323@yahoo.com','2503-09-14 02:34:01Z','9643-03-10 01:52:00Z'),
(1,12,1,735925072,'Carmella','Sloan','Sloan','Carmella_Sloan5533@iatim.tech','4703-05-21 01:23:22Z','3234-06-17 19:23:29Z'),
(2,8,1,676440001,'Mike','Farrant','Farrant','Mike_Farrant1448@guentu.biz','7765-04-05 17:58:30Z','4845-05-25 16:48:48Z'),
(1,26,1,168643259,'Alan','Yard','Yard','Alan_Yard6986@dionrab.com','8815-04-18 11:48:37Z','9269-03-29 05:11:30Z'),
(2,37,1,257112389,'Jacqueline','Collins','Collins','Jacqueline_Collins2393@bulaffy.com','8900-03-09 01:33:07Z','9857-12-25 07:34:32Z'),
(2,44,1,726531013,'Brad','Simpson','Simpson','Brad_Simpson1107@muall.tech','8995-08-08 16:18:14Z','8496-01-07 12:46:58Z'),
(1,4,1,856867266,'Alexander','Sinclair','Sinclair','Alexander_Sinclair6711@nanoff.biz','3492-10-20 02:07:55Z','8957-04-24 04:14:04Z'),
(2,16,1,349746935,'Mark','Potter','Potter','Mark_Potter916@grannar.com','6348-03-12 06:54:39Z','0405-03-03 12:45:07Z'),
(1,25,1,287855729,'Caydence','Jones','Jones','Caydence_Jones9208@vetan.org','9189-01-17 20:57:41Z','0039-04-17 12:03:09Z'),
(2,23,1,161565676,'Liam','Bolton','Bolton','Liam_Bolton5323@joiniaa.com','1981-05-04 05:44:29Z','3088-08-19 13:20:48Z'),
(1,37,1,508954774,'Gina','Adams','Adams','Gina_Adams76@deavo.com','3782-04-24 20:06:49Z','6309-11-27 16:50:29Z'),
(2,16,1,515759295,'Rosemary','Pitt','Pitt','Rosemary_Pitt4020@hourpy.biz','4711-06-27 02:10:06Z','6101-05-31 06:36:52Z'),
(1,16,1,573904159,'Matthew','Flanders','Flanders','Matthew_Flanders589@gmail.com','4965-01-29 09:24:33Z','5671-06-08 11:52:00Z'),
(2,3,1,723492369,'Samara','Butler','Butler','Samara_Butler7429@nimogy.biz','5906-09-20 19:49:35Z','7680-11-23 13:29:55Z'),
(1,27,1,375573571,'Chuck','Potts','Potts','Chuck_Potts9992@atink.com','7707-11-05 18:58:15Z','9040-01-19 13:16:05Z'),
(1,29,1,840319550,'Chanelle','Neville','Neville','Chanelle_Neville2770@bulaffy.com','1533-10-20 14:13:45Z','7284-03-06 18:54:37Z'),
(1,18,1,121984098,'Cedrick','Farrant','Farrant','Cedrick_Farrant7632@iatim.tech','0136-08-27 16:44:25Z','6866-08-31 06:32:29Z'),
(1,45,1,100631245,'George','Baldwin','Baldwin','George_Baldwin2053@elnee.tech','8193-01-21 03:45:21Z','0424-08-31 22:03:37Z'),
(1,46,1,268540158,'Bob','Isaac','Isaac','Bob_Isaac3624@twipet.com','6831-04-19 01:30:28Z','4667-02-19 08:39:16Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,1,1,612098068,'Olivia','Reid','Reid','Olivia_Reid3159@mafthy.com','0753-08-27 01:58:15Z','9711-12-27 17:41:46Z'),
(2,31,1,355388964,'Owen','Andrews','Andrews','Owen_Andrews4554@deavo.com','8727-03-17 15:40:55Z','3526-12-05 17:06:05Z'),
(1,3,1,598368972,'Rick','Rothwell','Rothwell','Rick_Rothwell2629@vetan.org','4553-08-09 06:22:01Z','7119-04-24 07:48:40Z'),
(1,2,1,803394585,'Ramon','Wills','Wills','Ramon_Wills3561@bungar.biz','8381-06-05 21:37:38Z','7226-09-23 07:52:10Z'),
(1,32,1,740472275,'Johnny','Turner','Turner','Johnny_Turner6571@deavo.com','1910-04-16 06:04:40Z','1608-11-24 08:51:15Z'),
(1,4,1,871718501,'Nathan','Baker','Baker','Nathan_Baker4599@nimogy.biz','7738-06-22 08:37:57Z','7326-11-17 22:28:50Z'),
(2,9,1,294014525,'Carl','Connor','Connor','Carl_Connor6995@nanoff.biz','7914-02-24 03:16:14Z','6773-07-13 12:44:23Z'),
(2,41,1,230125084,'Rosalee','Quinton','Quinton','Rosalee_Quinton5201@sveldo.biz','5542-03-31 22:01:43Z','4583-05-30 07:34:48Z'),
(1,35,1,153600806,'Hadley','Gilmore','Gilmore','Hadley_Gilmore369@naiker.biz','5910-10-03 10:10:26Z','0965-12-11 18:51:33Z'),
(2,33,1,437553050,'Iris','King','King','Iris_King1905@twace.org','5673-04-23 17:39:26Z','3331-09-28 18:40:24Z'),
(1,4,1,376899910,'Kurt','Stuart','Stuart','Kurt_Stuart3978@gmail.com','4047-01-25 13:19:39Z','4577-04-20 03:08:09Z'),
(1,46,1,223413452,'Michelle','Robinson','Robinson','Michelle_Robinson3542@bungar.biz','6290-01-29 14:21:20Z','2580-01-06 15:29:01Z'),
(2,40,1,878728254,'Doris','Bennett','Bennett','Doris_Bennett233@famism.biz','5330-12-25 12:50:27Z','1097-01-04 13:31:16Z'),
(1,38,1,857476592,'Tiffany','Edwards','Edwards','Tiffany_Edwards4939@joiniaa.com','1668-09-04 19:02:01Z','1468-01-21 21:49:37Z'),
(1,17,1,232272988,'Elijah','Maxwell','Maxwell','Elijah_Maxwell3821@sveldo.biz','9701-12-13 00:29:27Z','5194-01-26 00:49:03Z'),
(1,37,1,138836624,'Henry','Hamilton','Hamilton','Henry_Hamilton2334@gompie.com','0044-07-23 07:58:01Z','3863-12-05 14:01:48Z'),
(1,10,1,123211538,'Wade','Yarlett','Yarlett','Wade_Yarlett6342@qater.org','6459-01-23 10:58:56Z','6474-08-09 19:11:56Z'),
(2,5,1,430990866,'Lucas','Baker','Baker','Lucas_Baker1982@vetan.org','1984-07-04 08:23:05Z','5839-01-10 09:28:37Z'),
(2,32,1,127645659,'Marie','Connor','Connor','Marie_Connor3716@gembat.biz','4247-05-12 19:14:35Z','3569-12-14 11:46:03Z'),
(2,46,1,286871159,'Fred','Miller','Miller','Fred_Miller6534@elnee.tech','0271-08-22 15:14:44Z','0621-01-15 01:30:18Z'),
(2,28,1,138873275,'Angel','Franks','Franks','Angel_Franks2645@gembat.biz','9770-04-30 03:56:58Z','8414-07-22 19:36:01Z'),
(1,27,1,610754038,'Elijah','John','John','Elijah_John5579@vetan.org','9808-04-06 01:07:26Z','3627-04-28 18:42:17Z'),
(2,12,1,303672825,'Brad','Nash','Nash','Brad_Nash9273@yahoo.com','7342-09-03 00:40:25Z','1857-01-31 18:36:42Z'),
(2,48,1,209561067,'Fred','Niles','Niles','Fred_Niles1960@elnee.tech','6970-08-08 07:07:44Z','6144-01-04 07:14:41Z'),
(1,19,1,120869717,'Rihanna','Parker','Parker','Rihanna_Parker5154@vetan.org','4668-12-28 10:51:10Z','7952-03-07 05:30:43Z'),
(1,37,1,455668492,'Liam','Armstrong','Armstrong','Liam_Armstrong1039@typill.biz','5643-07-07 05:46:16Z','1199-09-01 16:26:42Z'),
(2,12,1,704195871,'Jacob','Collins','Collins','Jacob_Collins3573@womeona.net','2504-09-10 14:19:15Z','9018-06-04 01:36:00Z'),
(1,25,1,752253690,'Tania','Crawley','Crawley','Tania_Crawley6300@gembat.biz','6409-11-09 17:42:19Z','3470-04-30 17:24:26Z'),
(2,14,1,760873187,'Manuel','Bingham','Bingham','Manuel_Bingham638@bulaffy.com','6286-10-02 11:45:33Z','6625-02-03 03:10:15Z'),
(2,47,1,188325587,'Marvin','Vallins','Vallins','Marvin_Vallins3544@grannar.com','7376-01-24 05:37:11Z','9034-05-14 20:54:47Z'),
(1,18,1,265547549,'Megan','Osman','Osman','Megan_Osman2171@guentu.biz','7591-07-07 16:50:38Z','9784-10-06 13:32:03Z'),
(1,23,1,707253177,'Logan','Wright','Wright','Logan_Wright3985@twipet.com','1181-02-09 11:25:42Z','7252-05-21 14:50:45Z'),
(2,41,1,803934502,'Sabina','Bennett','Bennett','Sabina_Bennett2281@gembat.biz','3810-08-29 06:29:53Z','7591-04-19 14:05:07Z'),
(2,23,1,318634024,'Joseph','Pierce','Pierce','Joseph_Pierce8599@bungar.biz','1204-07-08 05:46:10Z','0340-02-16 02:00:52Z'),
(2,36,1,404157334,'Enoch','Brennan','Brennan','Enoch_Brennan7834@grannar.com','2072-12-20 00:53:22Z','3589-10-23 20:19:34Z'),
(2,20,1,385459054,'Tyler','Alexander','Alexander','Tyler_Alexander1491@ovock.tech','2461-10-01 22:25:02Z','3471-07-15 03:29:00Z'),
(2,19,1,310492295,'Maggie','Patel','Patel','Maggie_Patel32@brety.org','5487-03-12 01:56:32Z','7614-09-15 07:27:34Z'),
(1,30,1,893227431,'Dakota','Williams','Williams','Dakota_Williams9049@elnee.tech','5308-03-18 06:20:30Z','8601-06-09 19:24:21Z'),
(1,47,1,755027116,'Daniel','Harrison','Harrison','Daniel_Harrison9739@iatim.tech','5050-09-14 15:11:24Z','4847-01-16 14:57:26Z'),
(2,44,1,435370657,'Bernadette','Wilton','Wilton','Bernadette_Wilton1736@hourpy.biz','4359-02-12 20:38:12Z','6885-10-03 04:32:10Z'),
(1,25,1,206586159,'Mara','Sanchez','Sanchez','Mara_Sanchez9324@gmail.com','2383-08-07 06:42:01Z','0462-03-02 15:21:03Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,26,1,523164814,'Ramon','Mcneill','Mcneill','Ramon_Mcneill3367@extex.org','4769-09-22 06:18:24Z','8164-12-11 10:37:13Z'),
(1,24,1,309471015,'Teagan','Farrell','Farrell','Teagan_Farrell1760@famism.biz','8460-11-11 02:27:48Z','3897-12-12 05:16:09Z'),
(1,1,1,327457136,'Mark','Sawyer','Sawyer','Mark_Sawyer7397@atink.com','8400-01-30 03:36:56Z','4218-08-26 19:04:46Z'),
(1,44,1,262575537,'Jaylene','Michael','Michael','Jaylene_Michael822@irrepsy.com','1354-05-31 10:51:09Z','0872-10-10 00:01:14Z'),
(1,31,1,409643174,'Gina','Randall','Randall','Gina_Randall6338@sveldo.biz','7687-12-11 07:33:06Z','4243-03-20 06:22:01Z'),
(2,20,1,116213579,'Stella','Shea','Shea','Stella_Shea8383@typill.biz','1569-01-13 10:50:58Z','7528-04-21 02:34:41Z'),
(2,22,1,890153526,'Sebastian','Thornton','Thornton','Sebastian_Thornton517@deons.tech','5512-01-22 17:30:21Z','7111-03-14 04:28:08Z'),
(1,32,1,558178251,'Jocelyn','Trent','Trent','Jocelyn_Trent4699@gompie.com','9063-11-08 01:45:07Z','0160-08-22 05:57:24Z'),
(2,47,1,121836826,'Tess','Pickard','Pickard','Tess_Pickard4213@bungar.biz','4134-01-04 04:18:26Z','4457-11-02 06:22:49Z'),
(1,47,1,304875708,'Jack','Rehman','Rehman','Jack_Rehman119@joiniaa.com','3366-12-06 06:16:56Z','5352-05-31 11:31:56Z'),
(2,27,1,135921840,'Molly','Neal','Neal','Molly_Neal3589@muall.tech','8029-04-22 10:08:07Z','4607-01-07 17:23:16Z'),
(1,2,1,371481393,'Macy','Varndell','Varndell','Macy_Varndell5327@vetan.org','3626-01-10 16:08:56Z','8781-08-05 16:45:29Z'),
(2,41,1,608564047,'Rose','Pratt','Pratt','Rose_Pratt5570@vetan.org','6322-01-05 07:50:17Z','8759-11-30 11:52:40Z'),
(1,25,1,721034159,'Christine','Ashley','Ashley','Christine_Ashley624@elnee.tech','0310-04-03 20:12:40Z','9247-09-18 17:22:37Z'),
(1,28,1,659722560,'Blake','Vallory','Vallory','Blake_Vallory9381@brety.org','5489-07-01 19:39:19Z','4866-02-10 05:15:16Z'),
(1,14,1,543032946,'Joyce','Yang','Yang','Joyce_Yang1874@gembat.biz','5832-06-25 10:20:54Z','7074-04-18 12:28:38Z'),
(1,16,1,500146892,'Julius','Gallacher','Gallacher','Julius_Gallacher5188@famism.biz','8492-02-15 11:22:06Z','5444-02-20 14:56:23Z'),
(1,6,1,561418160,'Enoch','Blythe','Blythe','Enoch_Blythe8450@corti.com','0221-07-12 05:35:46Z','8415-03-15 07:11:39Z'),
(2,47,1,242501357,'Fred','Gaynor','Gaynor','Fred_Gaynor5206@cispeto.com','4539-09-10 21:47:05Z','0389-05-07 18:22:31Z'),
(1,19,1,234913856,'Phillip','Bennett','Bennett','Phillip_Bennett8050@fuliss.net','6665-01-03 12:54:14Z','0077-12-03 04:11:25Z'),
(2,1,1,154661497,'Owen','Olivier','Olivier','Owen_Olivier685@dionrab.com','3228-12-01 03:02:23Z','9832-03-07 09:13:15Z'),
(1,40,1,558002138,'Carl','Baldwin','Baldwin','Carl_Baldwin8255@nanoff.biz','0488-01-16 21:35:14Z','4462-10-08 17:35:38Z'),
(2,18,1,414095958,'Jacqueline','Alexander','Alexander','Jacqueline_Alexander23@deons.tech','3358-05-15 00:44:35Z','6832-10-29 02:41:58Z'),
(1,19,1,284576354,'Boris','Morrow','Morrow','Boris_Morrow9433@guentu.biz','5983-05-11 16:27:48Z','8766-02-23 09:26:43Z'),
(1,43,1,890350127,'Oliver','Michael','Michael','Oliver_Michael5929@irrepsy.com','7920-02-02 16:03:33Z','3655-03-19 18:53:15Z'),
(2,11,1,103915890,'Sharon','Rivers','Rivers','Sharon_Rivers8185@corti.com','9352-09-15 00:31:16Z','4592-03-21 13:18:51Z'),
(2,41,1,611358191,'Victoria','Anderson','Anderson','Victoria_Anderson2514@bauros.biz','9436-03-01 13:51:19Z','2329-02-22 21:33:32Z'),
(2,12,1,694164958,'Quinn','Dubois','Dubois','Quinn_Dubois6846@corti.com','6700-05-31 00:03:11Z','3328-11-13 02:44:40Z'),
(1,4,1,243910704,'Sebastian','Douglas','Douglas','Sebastian_Douglas5635@eirey.tech','2691-10-13 11:55:09Z','7024-07-25 02:57:42Z'),
(2,4,1,254355048,'Chadwick','Richardson','Richardson','Chadwick_Richardson7989@atink.com','7791-11-15 06:11:32Z','6108-04-19 10:07:37Z'),
(2,25,1,802102364,'Chris','Morley','Morley','Chris_Morley3577@corti.com','0019-11-19 06:43:19Z','9675-11-06 21:05:27Z'),
(1,34,1,289491267,'Bryce','Raven','Raven','Bryce_Raven9831@yahoo.com','4652-07-01 14:21:40Z','6583-06-25 01:48:30Z'),
(1,24,1,519218967,'Lara','Kennedy','Kennedy','Lara_Kennedy5937@nimogy.biz','3667-07-28 18:03:48Z','8116-01-10 08:06:05Z'),
(1,22,1,552932502,'Priscilla','Whitehouse','Whitehouse','Priscilla_Whitehouse7874@qater.org','0219-02-15 16:58:47Z','3436-05-26 05:54:47Z'),
(2,31,1,425715708,'Manuel','Sawyer','Sawyer','Manuel_Sawyer1456@womeona.net','4191-11-04 05:54:12Z','6536-06-21 06:15:35Z'),
(2,19,1,366585057,'Summer','Simpson','Simpson','Summer_Simpson1668@nickia.com','3635-03-24 00:35:53Z','0232-03-04 12:08:01Z'),
(2,24,1,317982326,'Jacob','Robertson','Robertson','Jacob_Robertson7559@yahoo.com','5620-01-27 05:50:37Z','3682-08-26 10:42:11Z'),
(1,27,1,687962698,'Wade','Collins','Collins','Wade_Collins3513@brety.org','4869-05-04 21:31:37Z','3960-09-02 15:46:10Z'),
(2,39,1,664970928,'Alice','Lane','Lane','Alice_Lane8670@bretoux.com','7985-09-24 16:18:02Z','9952-07-28 12:52:41Z'),
(1,30,1,106756506,'Meredith','Harvey','Harvey','Meredith_Harvey2157@grannar.com','8869-03-23 13:12:23Z','1660-05-26 13:04:26Z'),
(2,47,1,626935327,'Iris','Atkinson','Atkinson','Iris_Atkinson3102@elnee.tech','4286-09-23 21:02:40Z','4916-10-07 08:38:55Z'),
(1,10,1,821414308,'Cassandra','Morris','Morris','Cassandra_Morris8242@nanoff.biz','5674-02-25 06:38:53Z','6326-05-02 02:13:34Z'),
(2,47,1,899654013,'Megan','Stubbs','Stubbs','Megan_Stubbs5354@gompie.com','1078-04-17 21:10:50Z','3953-06-18 04:33:27Z'),
(1,44,1,544976461,'Kieth','Cooper','Cooper','Kieth_Cooper3295@corti.com','3687-08-07 08:38:30Z','7960-05-25 18:47:06Z'),
(2,35,1,690561908,'Daria','Reynolds','Reynolds','Daria_Reynolds8038@ubusive.com','8560-06-23 22:38:18Z','1721-09-10 02:05:26Z'),
(1,18,1,884838276,'Oliver','Wilson','Wilson','Oliver_Wilson2220@cispeto.com','8696-10-14 13:51:03Z','3117-11-24 03:21:44Z'),
(1,42,1,651987573,'Manuel','Sherry','Sherry','Manuel_Sherry3100@liret.org','1397-12-31 00:39:10Z','1966-11-28 06:33:03Z'),
(2,23,1,878647587,'Abbey','Rehman','Rehman','Abbey_Rehman1587@liret.org','3815-04-06 15:54:15Z','5443-08-02 19:17:33Z'),
(2,12,1,511539986,'Abbey','Heaton','Heaton','Abbey_Heaton1624@bauros.biz','4615-05-22 21:32:18Z','6730-11-18 07:17:58Z'),
(1,45,1,474094990,'John','Niles','Niles','John_Niles9197@kideod.biz','4729-02-24 22:22:57Z','5954-06-02 03:22:36Z'),
(2,17,1,161747813,'Harry','Selby','Selby','Harry_Selby4689@liret.org','7070-08-30 19:36:54Z','7084-05-18 08:36:16Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,20,1,310831590,'Jacob','Murphy','Murphy','Jacob_Murphy4547@famism.biz','6959-02-05 17:46:46Z','8660-12-20 17:09:40Z'),
(2,48,1,614340863,'Kurt','Morris','Morris','Kurt_Morris6493@eirey.tech','5669-06-11 05:18:31Z','7644-10-08 13:44:40Z'),
(2,49,1,261530162,'Daria','Nicholls','Nicholls','Daria_Nicholls2363@fuliss.net','8969-03-17 22:40:26Z','8409-09-10 02:26:13Z'),
(2,33,1,245020687,'Phillip','Graves','Graves','Phillip_Graves7925@yahoo.com','8050-05-12 21:08:30Z','9314-04-30 03:01:05Z'),
(1,10,1,104552398,'Ivette','Stone','Stone','Ivette_Stone658@iatim.tech','8998-01-14 04:56:47Z','7259-10-02 03:50:18Z'),
(2,5,1,571938663,'Tyler','Davies','Davies','Tyler_Davies3908@tonsy.org','4474-05-09 06:05:29Z','9654-11-17 18:39:20Z'),
(1,13,1,496091943,'Alan','Reyes','Reyes','Alan_Reyes9043@grannar.com','7594-07-25 01:49:12Z','0791-08-12 17:16:11Z'),
(1,46,1,503968954,'Kieth','Murphy','Murphy','Kieth_Murphy1186@hourpy.biz','9871-02-23 11:57:07Z','9343-02-27 08:17:26Z'),
(1,30,1,714826540,'Adelaide','Goldsmith','Goldsmith','Adelaide_Goldsmith8190@yahoo.com','2918-06-23 15:33:56Z','3683-09-29 11:47:17Z'),
(2,36,1,292886082,'Angelique','Calderwood','Calderwood','Angelique_Calderwood5948@nickia.com','2495-02-26 08:54:25Z','8251-05-29 15:31:45Z'),
(2,34,1,819395703,'Amelia','Thompson','Thompson','Amelia_Thompson5461@irrepsy.com','7051-10-23 17:32:50Z','6188-05-26 22:10:48Z'),
(2,28,1,691017096,'Gina','Lucas','Lucas','Gina_Lucas87@deons.tech','4469-04-07 18:52:35Z','4667-01-26 22:01:11Z'),
(2,7,1,418769741,'Henry','Grant','Grant','Henry_Grant4409@sheye.org','3384-10-27 01:02:47Z','6306-10-03 08:44:35Z'),
(2,48,1,388334806,'Oliver','Vincent','Vincent','Oliver_Vincent5896@typill.biz','0795-11-12 20:38:51Z','2385-09-27 17:31:39Z'),
(1,3,1,290512221,'Julius','Robinson','Robinson','Julius_Robinson218@infotech44.tech','7237-04-01 16:57:16Z','8162-07-06 09:07:58Z'),
(1,3,1,826962382,'Fiona','Boden','Boden','Fiona_Boden1102@mafthy.com','9946-04-11 02:46:52Z','1000-01-31 07:29:08Z'),
(1,35,1,860304264,'Leroy','Woodley','Woodley','Leroy_Woodley2836@supunk.biz','8785-08-22 04:36:30Z','2633-05-09 10:30:51Z'),
(2,24,1,452782108,'Carter','Gordon','Gordon','Carter_Gordon164@muall.tech','6896-05-29 10:13:04Z','6238-03-03 08:27:08Z'),
(1,21,1,362202190,'Harriet','Edley','Edley','Harriet_Edley6067@cispeto.com','3573-03-12 00:29:04Z','7313-12-04 14:15:01Z'),
(2,2,1,771984117,'Adalind','Eyres','Eyres','Adalind_Eyres4628@bretoux.com','5631-12-05 21:02:18Z','2548-06-22 18:08:22Z'),
(1,5,1,606089585,'Josh','Harper','Harper','Josh_Harper1668@bungar.biz','5683-10-28 18:30:33Z','9582-06-27 19:57:02Z'),
(2,22,1,656235924,'Noah','Ryan','Ryan','Noah_Ryan526@fuliss.net','2440-06-24 16:32:11Z','1025-09-21 04:20:41Z'),
(1,9,1,505553241,'Joseph','Goldsmith','Goldsmith','Joseph_Goldsmith2069@bulaffy.com','7316-07-20 01:55:44Z','6049-06-10 02:04:15Z'),
(1,35,1,126153196,'Tara','James','James','Tara_James3084@vetan.org','6379-10-28 02:35:42Z','4659-02-08 13:10:50Z'),
(1,40,1,881827218,'Elle','Taylor','Taylor','Elle_Taylor5580@sheye.org','1745-04-10 10:06:16Z','6391-01-14 13:28:54Z'),
(1,32,1,876550170,'Thea','Gosling','Gosling','Thea_Gosling3519@guentu.biz','1189-03-21 02:35:11Z','2658-06-12 10:45:52Z'),
(2,14,1,734610670,'Aeris','Edmonds','Edmonds','Aeris_Edmonds546@eirey.tech','1899-01-01 02:11:20Z','9988-10-13 11:07:46Z'),
(1,27,1,887341982,'Emely','Poulton','Poulton','Emely_Poulton381@deons.tech','8611-11-13 03:56:34Z','9086-10-29 22:20:22Z'),
(2,11,1,530937222,'Ronald','Swift','Swift','Ronald_Swift357@deavo.com','7965-03-28 12:09:32Z','1200-06-07 13:27:23Z'),
(2,12,1,632689621,'Penelope','Flack','Flack','Penelope_Flack8408@deavo.com','2453-04-29 07:05:39Z','2812-03-04 02:49:56Z'),
(2,46,1,576200608,'Chris','Cox','Cox','Chris_Cox7323@jiman.org','7091-04-10 15:52:31Z','7412-06-08 13:28:11Z'),
(1,6,1,358532936,'Mabel','Huggins','Huggins','Mabel_Huggins2102@hourpy.biz','7614-05-05 19:55:02Z','5154-01-25 09:18:34Z'),
(1,28,1,529278372,'Martha','Boyle','Boyle','Martha_Boyle3886@supunk.biz','3942-11-19 10:56:10Z','5040-11-22 17:35:28Z'),
(1,36,1,649347180,'Rick','Moore','Moore','Rick_Moore5331@sheye.org','7229-08-05 11:46:12Z','1938-03-18 05:33:55Z'),
(1,46,1,292181614,'Emely','Little','Little','Emely_Little8727@bungar.biz','5009-10-23 15:14:38Z','2574-06-14 02:19:33Z'),
(1,29,1,438736929,'Sadie','Kennedy','Kennedy','Sadie_Kennedy1218@sheye.org','7765-01-22 08:35:10Z','2005-09-03 05:22:13Z'),
(1,34,1,311274655,'Rae','Patel','Patel','Rae_Patel8252@sheye.org','1129-07-27 03:16:06Z','4656-02-23 09:27:38Z'),
(2,49,1,266152972,'William','Larsen','Larsen','William_Larsen4110@irrepsy.com','7296-08-07 19:16:44Z','3005-02-19 10:51:24Z'),
(2,33,1,697555541,'Joseph','Flack','Flack','Joseph_Flack685@nickia.com','3468-10-15 13:49:38Z','3109-12-02 22:07:31Z'),
(1,20,1,632188800,'Peyton','Osmond','Osmond','Peyton_Osmond5370@naiker.biz','8576-05-26 14:32:00Z','8124-06-06 15:24:41Z'),
(2,40,1,448606461,'Tony','Oatway','Oatway','Tony_Oatway9785@grannar.com','6854-03-30 13:33:47Z','4187-09-08 20:08:13Z'),
(1,24,1,675366094,'Rick','Lowe','Lowe','Rick_Lowe822@ovock.tech','8925-03-04 10:30:38Z','5344-05-10 20:24:56Z'),
(1,17,1,565621364,'Elijah','Giles','Giles','Elijah_Giles2104@sveldo.biz','5437-09-23 20:56:57Z','4389-09-18 16:24:46Z'),
(2,47,1,389527779,'Eduardo','Welsch','Welsch','Eduardo_Welsch9512@corti.com','2420-09-27 09:27:53Z','1510-11-21 16:08:50Z'),
(1,40,1,660505730,'Daniel','Cassidy','Cassidy','Daniel_Cassidy172@mafthy.com','0706-02-27 06:06:57Z','4536-06-16 17:06:50Z'),
(1,24,1,794316535,'Aiden','Rose','Rose','Aiden_Rose5408@deons.tech','9585-11-13 01:44:13Z','3927-11-04 04:48:07Z'),
(1,30,1,763306676,'Carmella','Beal','Beal','Carmella_Beal4520@sheye.org','8658-12-11 07:49:30Z','7884-04-12 15:20:02Z'),
(1,33,1,356807598,'Doug','Terry','Terry','Doug_Terry1881@vetan.org','9543-01-30 20:15:22Z','6778-04-25 02:17:49Z'),
(1,26,1,240392179,'Phillip','Moreno','Moreno','Phillip_Moreno393@sveldo.biz','6285-06-13 08:41:34Z','1702-08-04 09:23:10Z'),
(2,8,1,843200471,'Nicholas','Edwards','Edwards','Nicholas_Edwards8765@liret.org','7142-01-23 01:10:22Z','1881-08-18 04:31:39Z'),
(1,41,1,876711983,'Julian','Silva','Silva','Julian_Silva3211@gembat.biz','3331-11-24 16:28:00Z','7841-06-29 11:50:12Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,8,1,319664448,'Marilyn','Rust','Rust','Marilyn_Rust9119@ovock.tech','9371-09-01 10:50:42Z','4404-10-27 03:10:53Z'),
(1,29,1,320362465,'Henry','Saunders','Saunders','Henry_Saunders4490@deavo.com','9795-10-31 17:23:12Z','9300-07-27 12:19:10Z'),
(2,19,1,348196193,'Rosalie','Pond','Pond','Rosalie_Pond3448@yahoo.com','7902-06-26 16:27:29Z','8927-01-28 13:18:06Z'),
(1,15,1,224802452,'Maia','Mcnally','Mcnally','Maia_Mcnally6201@gompie.com','1804-06-23 06:30:43Z','0072-02-06 20:31:32Z'),
(1,39,1,320083831,'Chester','Rehman','Rehman','Chester_Rehman5732@eirey.tech','2839-02-14 06:57:13Z','0869-10-04 04:04:06Z'),
(1,2,1,580498035,'Selena','Durrant','Durrant','Selena_Durrant9843@bauros.biz','8610-08-13 12:48:16Z','7831-05-21 19:55:55Z'),
(1,26,1,838938254,'Marvin','Freeburn','Freeburn','Marvin_Freeburn7129@bulaffy.com','9598-01-23 20:37:20Z','0935-09-19 02:25:37Z'),
(2,25,1,166542398,'Mary','Fox','Fox','Mary_Fox3225@womeona.net','2962-10-25 05:44:57Z','5007-09-28 09:02:16Z'),
(2,28,1,746079569,'Cecilia','Kent','Kent','Cecilia_Kent1792@nimogy.biz','6872-10-29 07:20:24Z','7675-11-24 10:23:38Z'),
(1,22,1,200574652,'Mason','Adams','Adams','Mason_Adams4754@supunk.biz','8503-06-05 06:57:55Z','4591-04-28 10:35:03Z'),
(1,44,1,474591067,'Emely','Cobb','Cobb','Emely_Cobb4735@supunk.biz','9419-11-18 05:57:06Z','5286-12-01 18:20:18Z'),
(1,30,1,701815906,'Megan','Bradley','Bradley','Megan_Bradley8319@joiniaa.com','2632-09-19 05:12:44Z','2282-07-05 19:44:20Z'),
(1,25,1,131231574,'Anne','Griffiths','Griffiths','Anne_Griffiths8209@bauros.biz','7188-02-02 16:29:16Z','3217-07-05 10:36:36Z'),
(1,1,1,470578297,'Anthony','Stevenson','Stevenson','Anthony_Stevenson4925@famism.biz','2417-12-15 16:15:36Z','7138-05-17 09:13:45Z'),
(2,42,1,863525017,'Claire','Dwyer','Dwyer','Claire_Dwyer1589@fuliss.net','5180-09-29 20:19:07Z','9415-03-18 18:35:08Z'),
(2,37,1,171080736,'Mark','Boden','Boden','Mark_Boden8354@extex.org','4761-01-05 17:33:06Z','0050-09-18 06:15:30Z'),
(2,38,1,508980863,'Kurt','Reyes','Reyes','Kurt_Reyes9256@kideod.biz','4354-07-09 09:09:54Z','3002-09-30 21:39:28Z'),
(2,24,1,810175898,'Rosemary','Scott','Scott','Rosemary_Scott1518@infotech44.tech','0077-08-13 08:35:52Z','5131-01-12 13:03:36Z'),
(2,41,1,301052071,'Mavis','Yarwood','Yarwood','Mavis_Yarwood3357@iatim.tech','8592-03-20 18:39:02Z','1759-04-09 19:52:37Z'),
(1,39,1,465913815,'Vivian','Armstrong','Armstrong','Vivian_Armstrong4806@womeona.net','7844-11-09 12:19:32Z','9223-06-28 18:05:18Z'),
(1,41,1,659961981,'Henry','Jeffery','Jeffery','Henry_Jeffery1719@eirey.tech','4062-01-30 18:28:54Z','8318-05-07 12:41:15Z'),
(1,14,1,211208538,'Daria','Phillips','Phillips','Daria_Phillips297@deavo.com','9866-06-24 07:00:04Z','9368-09-23 22:34:43Z'),
(2,4,1,383001500,'Paige','Hepburn','Hepburn','Paige_Hepburn8342@gembat.biz','2299-06-09 07:00:36Z','9526-07-06 00:36:17Z'),
(2,40,1,551832670,'Mike','Armstrong','Armstrong','Mike_Armstrong9405@extex.org','0906-05-01 06:09:09Z','4693-05-09 18:52:11Z'),
(2,32,1,184478436,'Lily','Robertson','Robertson','Lily_Robertson7720@bungar.biz','0234-01-01 07:01:06Z','0340-12-21 07:22:46Z'),
(1,38,1,825801708,'Marie','Santos','Santos','Marie_Santos7253@gmail.com','2826-06-04 19:39:02Z','7606-01-31 12:06:24Z'),
(1,49,1,385914494,'Jade','Button','Button','Jade_Button9406@iatim.tech','7624-07-16 18:54:52Z','0566-05-12 22:45:22Z'),
(1,6,1,462018147,'Jenna','Notman','Notman','Jenna_Notman8676@brety.org','4786-10-27 06:05:52Z','2627-12-02 18:53:40Z'),
(1,20,1,193185963,'Nathan','Coleman','Coleman','Nathan_Coleman753@jiman.org','2435-07-15 02:47:28Z','2261-01-24 20:52:38Z'),
(1,49,1,212279047,'Bob','Coates','Coates','Bob_Coates8354@vetan.org','4463-02-05 09:49:43Z','4997-08-16 22:00:11Z'),
(2,19,1,803139332,'Cecilia','Upton','Upton','Cecilia_Upton1057@nanoff.biz','4862-08-31 13:03:14Z','2526-10-04 09:12:13Z'),
(2,45,1,340624038,'Joy','Farrow','Farrow','Joy_Farrow2471@corti.com','9391-12-24 15:13:31Z','7437-11-29 03:47:17Z'),
(2,25,1,809002933,'Lindsay','Morrison','Morrison','Lindsay_Morrison1278@infotech44.tech','0511-01-26 15:45:21Z','1937-05-05 22:37:29Z'),
(1,5,1,351706144,'Lucas','Wright','Wright','Lucas_Wright520@supunk.biz','1743-07-23 07:51:38Z','7424-10-03 10:15:56Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,35,1,589029116,'Hayden','Miller','Miller','Hayden_Miller3271@ubusive.com','4687-06-11 09:27:07Z','7455-08-22 16:35:01Z'),
(2,35,1,336786876,'Michael','Tennant','Tennant','Michael_Tennant3071@cispeto.com','7443-04-24 14:15:18Z','3086-04-24 05:30:23Z'),
(2,46,1,412708757,'Penny','Rainford','Rainford','Penny_Rainford4124@infotech44.tech','9342-09-02 19:34:14Z','4287-12-02 14:15:36Z'),
(2,27,1,376800846,'Daniel','Ripley','Ripley','Daniel_Ripley5670@sveldo.biz','1193-12-26 07:04:01Z','1602-02-17 04:56:42Z'),
(1,33,1,380565687,'Naomi','Fox','Fox','Naomi_Fox1383@ubusive.com','6099-12-27 08:42:14Z','3156-05-24 22:58:40Z'),
(2,48,1,264534216,'Oliver','Thompson','Thompson','Oliver_Thompson673@twipet.com','2206-10-04 18:20:56Z','7741-07-16 15:37:31Z'),
(1,30,1,620119736,'Jade','Jobson','Jobson','Jade_Jobson2732@yahoo.com','3092-03-18 02:49:50Z','8037-08-04 07:04:19Z'),
(1,48,1,890561414,'Eden','Moss','Moss','Eden_Moss3222@dionrab.com','3726-03-04 17:46:21Z','8358-06-13 16:05:42Z'),
(2,20,1,626044472,'Kurt','Collins','Collins','Kurt_Collins7199@tonsy.org','2987-11-26 08:13:25Z','4169-02-28 11:15:36Z'),
(1,32,1,297330633,'Cedrick','Martin','Martin','Cedrick_Martin9109@mafthy.com','5539-03-25 05:28:38Z','4733-10-07 08:43:07Z'),
(2,34,1,255894584,'Ron','Powell','Powell','Ron_Powell117@typill.biz','2666-03-27 19:05:37Z','9557-01-03 05:31:44Z'),
(2,22,1,767234014,'Mary','Harris','Harris','Mary_Harris5484@dionrab.com','2383-09-13 17:14:30Z','8254-02-19 22:28:17Z'),
(2,29,1,681471506,'Jacqueline','Wilde','Wilde','Jacqueline_Wilde7842@elnee.tech','6324-12-18 12:48:55Z','5982-03-21 22:55:53Z'),
(2,15,1,811193008,'Doris','Button','Button','Doris_Button3230@twace.org','4341-01-29 05:45:16Z','4412-02-05 19:36:20Z'),
(2,48,1,249825089,'Doug','Dubois','Dubois','Doug_Dubois1437@supunk.biz','9960-07-08 10:43:07Z','6401-06-24 17:17:36Z'),
(1,9,1,743866333,'Caleb','Hood','Hood','Caleb_Hood4266@vetan.org','0993-01-19 09:00:09Z','1913-11-13 15:11:35Z'),
(1,49,1,397537342,'Bethany','Addison','Addison','Bethany_Addison601@corti.com','1753-08-01 04:34:58Z','7939-08-08 10:27:39Z'),
(2,22,1,465631454,'Lynn','Latham','Latham','Lynn_Latham5710@mafthy.com','8700-05-07 08:07:14Z','8047-08-26 17:31:31Z'),
(1,16,1,815417256,'Maxwell','Aldridge','Aldridge','Maxwell_Aldridge324@bretoux.com','3503-10-09 15:49:36Z','3053-06-15 22:32:28Z'),
(2,38,1,803416117,'Chelsea','Tutton','Tutton','Chelsea_Tutton3411@naiker.biz','0421-08-12 03:54:14Z','3705-12-06 10:03:27Z'),
(1,8,1,324551140,'Renee','Whitmore','Whitmore','Renee_Whitmore2179@atink.com','6733-01-22 09:43:56Z','5647-11-23 08:34:44Z'),
(2,38,1,439625890,'Noah','York','York','Noah_York3594@sveldo.biz','1494-12-01 11:05:03Z','9797-11-01 05:46:09Z'),
(2,20,1,688525035,'Melody','Vallins','Vallins','Melody_Vallins1331@brety.org','7451-05-05 11:35:48Z','4773-09-19 17:20:28Z'),
(2,15,1,152483539,'Sebastian','Bowen','Bowen','Sebastian_Bowen6126@nanoff.biz','4130-07-14 06:06:05Z','6935-03-22 03:56:47Z'),
(2,10,1,142195276,'Peter','Rehman','Rehman','Peter_Rehman451@nimogy.biz','1583-05-20 20:44:16Z','6721-03-14 16:44:33Z'),
(2,25,1,699627764,'Keira','Stanley','Stanley','Keira_Stanley8955@grannar.com','9563-11-18 16:00:38Z','0517-02-14 08:38:01Z'),
(1,8,1,523508501,'Percy','Lomax','Lomax','Percy_Lomax2377@gmail.com','0854-12-22 19:50:53Z','7409-05-03 12:21:30Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(2,23,1,100057622,'Liv','Khan','Khan','Liv_Khan3581@corti.com','5210-02-26 00:01:02Z','1067-04-06 11:05:15Z'),
(2,29,1,794613099,'Bob','Mcgee','Mcgee','Bob_Mcgee6349@gmail.com','4857-03-25 17:02:38Z','2155-07-19 04:38:07Z'),
(2,10,1,682112569,'Camden','Gardner','Gardner','Camden_Gardner8769@yahoo.com','5933-05-24 10:12:19Z','9787-09-18 07:45:37Z'),
(1,39,1,442058479,'Elle','Reading','Reading','Elle_Reading3012@iatim.tech','5190-05-11 17:19:49Z','3055-08-12 19:22:53Z'),
(2,44,1,273386894,'Noemi','Beal','Beal','Noemi_Beal4593@hourpy.biz','9379-01-23 11:25:02Z','5069-07-08 10:15:00Z'),
(1,43,1,362563692,'Maria','Eddison','Eddison','Maria_Eddison7800@sveldo.biz','6745-04-28 19:32:11Z','2878-10-12 14:48:25Z'),
(2,43,1,563839720,'Ron','Clarke','Clarke','Ron_Clarke7177@mafthy.com','0417-01-29 22:51:34Z','0121-11-04 07:03:48Z'),
(2,25,1,118123451,'Kurt','Smith','Smith','Kurt_Smith3975@sveldo.biz','6605-12-21 02:53:37Z','6501-04-13 20:35:36Z'),
(2,20,1,771314457,'Camila','Milner','Milner','Camila_Milner2398@brety.org','8321-10-13 17:53:30Z','6624-06-25 12:29:22Z'),
(2,16,1,584204858,'Josh','Bayliss','Bayliss','Josh_Bayliss666@irrepsy.com','0175-01-28 16:47:56Z','3915-10-19 01:16:56Z'),
(2,32,1,137924676,'Alexia','Clarkson','Clarkson','Alexia_Clarkson7101@twipet.com','9606-07-22 09:29:35Z','9981-06-28 13:23:15Z'),
(2,14,1,318988739,'Liam','Haines','Haines','Liam_Haines4847@gmail.com','4785-07-15 08:25:45Z','4406-12-26 15:37:32Z'),
(2,42,1,383081719,'Matthew','Thomas','Thomas','Matthew_Thomas7642@bretoux.com','9240-07-30 06:33:51Z','0193-08-02 02:24:41Z'),
(1,49,1,787485942,'Julius','Widdows','Widdows','Julius_Widdows7856@nickia.com','7081-03-02 01:16:30Z','5200-07-28 16:50:02Z'),
(2,28,1,815986492,'Barry','Bentley','Bentley','Barry_Bentley3791@ovock.tech','9519-11-26 09:53:29Z','4592-12-13 05:01:04Z'),
(2,31,1,635970814,'Darlene','Mann','Mann','Darlene_Mann3197@nimogy.biz','0379-03-07 18:28:47Z','4041-01-02 12:41:49Z'),
(2,42,1,298160269,'Vicky','Evans','Evans','Vicky_Evans4420@bulaffy.com','7323-08-17 12:51:10Z','2489-03-19 19:15:25Z'),
(1,12,1,739091432,'Mark','Griffiths','Griffiths','Mark_Griffiths8347@gembat.biz','1785-04-15 13:52:09Z','5479-11-23 19:11:39Z'),
(2,8,1,140207007,'Cadence','London','London','Cadence_London2920@sheye.org','5625-03-27 08:26:30Z','7889-12-17 21:12:21Z'),
(1,24,1,701254619,'Maia','Jennson','Jennson','Maia_Jennson7087@yahoo.com','7135-11-03 22:32:44Z','1844-09-24 15:39:29Z'),
(1,5,1,237433082,'Alessia','Patel','Patel','Alessia_Patel135@yahoo.com','7328-03-05 05:23:41Z','3895-04-30 14:40:46Z'),
(1,36,1,225792290,'Victoria','Miller','Miller','Victoria_Miller8251@fuliss.net','9756-11-13 00:44:01Z','3781-07-04 16:45:00Z'),
(2,6,1,108159689,'Eileen','Skinner','Skinner','Eileen_Skinner5126@brety.org','5118-11-10 22:18:19Z','3241-07-06 07:50:56Z'),
(1,47,1,246237965,'Chanelle','Hepburn','Hepburn','Chanelle_Hepburn760@atink.com','4757-11-06 03:15:00Z','3547-09-03 12:36:41Z'),
(2,28,1,384602957,'Rosalyn','Clarkson','Clarkson','Rosalyn_Clarkson6324@elnee.tech','9385-11-01 22:29:40Z','6516-05-10 15:52:03Z'),
(1,40,1,312911886,'Aeris','Roth','Roth','Aeris_Roth3915@qater.org','4954-01-18 02:14:41Z','1572-03-09 09:41:37Z'),
(2,15,1,470147559,'Emerald','Rogers','Rogers','Emerald_Rogers7220@bauros.biz','7599-05-30 03:33:27Z','8241-06-28 10:22:56Z'),
(1,40,1,639515494,'Mandy','Rossi','Rossi','Mandy_Rossi9252@corti.com','9692-05-17 07:22:43Z','7814-08-26 12:47:03Z'),
(1,29,1,177572669,'Sofia','Rothwell','Rothwell','Sofia_Rothwell9327@womeona.net','3465-07-15 18:48:23Z','6712-07-24 14:50:44Z'),
(1,44,1,667324091,'Lily','Ramsey','Ramsey','Lily_Ramsey7224@infotech44.tech','7941-03-24 04:19:00Z','9784-10-03 13:44:23Z'),
(1,40,1,658469057,'Emery','Allen','Allen','Emery_Allen1086@atink.com','3917-08-10 18:06:06Z','2980-10-26 15:30:57Z');
insert into Empleado(idPuesto, idSucursal, idEstado, cedula, nombreEmpleado, apellido1, 
                    apellido2, correo, fechaContratacion, fechaNacimiento) values
(1,46,1,547117044,'Mona','Sheldon','Sheldon','Mona_Sheldon6833@twace.org','9381-09-23 02:35:29Z','3680-10-10 04:03:58Z'),
(1,4,1,631196675,'Bernadette','Ashley','Ashley','Bernadette_Ashley4809@grannar.com','3704-12-20 20:36:50Z','4961-05-29 11:48:02Z'),
(1,41,1,897746944,'Paula','Tutton','Tutton','Paula_Tutton8696@gompie.com','3662-09-24 09:30:38Z','0237-10-30 13:02:07Z'),
(1,23,1,704292146,'Dasha','Pearce','Pearce','Dasha_Pearce9889@fuliss.net','0603-09-14 22:03:16Z','4421-04-28 14:46:27Z');

update Empleado set idEstado = 2;
DECLARE @cnt INT = 1;
WHILE @cnt <= (select count(idEmpleado) from Empleado)
BEGIN

	UPDATE Empleado
	SET fechaNacimiento = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 3650), '1980-01-01')
	
	UPDATE Empleado
	SET fechaContratacion = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 2920), '2014-01-01')
   
   SET @cnt = @cnt + 1;
END;
GO

--UsuarioEmpleados
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(1, 'pato123'), 
(1,'R9zo6w5vOH'),(2,'Z0sE6EwOxO'),(3,'bVmCt0opYx'),(4,'t0p1bi5X6J'),(5,'PT11S8Lk2K'),
(6,'0yCgE6Xx5F'),(7,'HQXaXjL0mY'),(8,'IYRn9Idutu'),(9,'pDxO75xIwf'),(10,'KIb1B95adt'),
(11,'wU8eBbhZg6'),(12,'cmEKZDdJdc'),(13,'wCEHNA6Zl9'),(14,'MDQ98VFSMf'),(15,'YYm0CiDQb8'),
(16,'gw6B7uP0RB'),(17,'eHxgtZVEME'),(18,'7K68EXaOEo'),(19,'6q7ndaGPCN'),(20,'FOBLAQkFGn'),
(21,'N9EXAWz87j'),(22,'UBwmEyJKDT'),(23,'SFB88sIv7x'),(24,'xVIab7lknH'),(25,'kISd3DcYGM'),
(26,'HZBwUH7FYR'),(27,'NEAJv93WLH'),(28,'Mjh6tKxiE4'),(29,'QupvpXTVFT'),(30,'9gLV4fHIr4'),
(31,'KFM99i2FCK'),(32,'UZAdAdZPdX'),(33,'phQ1IqXLCO'),(34,'Co0KuKhqvH'),(35,'fNT59jfrVa');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(36,'G2pTPnzV0T'),(37,'KrDyHpj0tz'),(38,'6tdV2bOU2i'),(39,'KqzlHK9g5H'),(40,'VMzc7yKeyT'),
(41,'Ap7feWZTbx'),(42,'YecSId1cq7'),(43,'qC5meu4AYE'),(44,'RtgiiesUGv'),(45,'upFHs0tgTd'),
(46,'6ry0n8uVBu'),(47,'cY5Wfp84uo'),(48,'vhV5MB7x4n'),(49,'AXq4Hj5p5k'),(50,'uXSWSVusmD'),
(51,'2ywpsZW2ol'),(52,'A6aYtFsAP6'),(53,'tS9K3XP8n0'),(54,'QOL0vLkAMr'),(55,'NCBTjx63nM'),
(56,'ntdqTjzmwU'),(57,'KXPxVwvjnh'),(58,'fryhtqQplG'),(59,'bVVaNhvfhL'),(60,'V7O2hzxN8w');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(61,'BWQFr5556m'),(62,'SKBq3zCyky'),(63,'AQCbLhd693'),(64,'3DryEEEPtR'),(65,'lzi42L6i8s'),
(66,'w8nKvvTy3J'),(67,'c95DtPcNly'),(68,'uwFTMLrIj9'),(69,'l57RH5ZhCS'),(70,'uPVjzm3fLm'),
(71,'st6K7A3U7k'),(72,'DLP3hgCo5y'),(73,'z5KSDeafdk'),(74,'RM66R28wUH'),(75,'CFjcPjAbBS'),
(76,'jPjXxxinHc'),(77,'jX0XT0PTmp'),(78,'iPUywuWsDe'),(79,'e8dLABnjJd'),(80,'TUo1hoPMIY');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(81,'TrzWuU5ukD'),(82,'b0kn8l3pWR'),(83,'NpJJVNkcRH'),(84,'eJjpKxJHaq'),(85,'G28GCduB36'),
(86,'vkz1KnhpBh'),(87,'tcddiRR4cK'),(88,'bwOqLVrDG2'),(89,'cijVW4Usfg'),(90,'QdF37nYeiu'),
(91,'L0jse8WJpy'),(92,'6djIEK2IGn'),(93,'7jZ647qUsh'),(94,'6MfVqm910Y'),(95,'iKCqkw46zw'),
(96,'vQY4xmamxg'),(97,'RBaH1u8Ncc'),(98,'KBSsFxgsWI'),(99,'Due5wqyliD'),(100,'LWDTGgt5zz'),
(101,'xreXmt8pyA'),(102,'GsQpdhheUK'),(103,'5XoYQx78mj'),(104,'Dl3gUWPHTD'),(105,'sJwi7dGX0j'),
(106,'9Pko4ZCFGy'),(107,'w9CP6eyuUG'),(108,'RZLRcwlGbx'),(109,'rkHDjyBPm4'),(110,'UKAeQtGglc');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(111,'oVCuRjDSMH'),(112,'y6nTHM19pI'),(113,'diIawHYqAs'),(114,'qEe8IWhXvA'),(115,'usDeGXgrXE'),
(116,'1G0d8GMm7K'),(117,'KWSdbtcoKv'),(118,'oeNpXvfoTY'),(119,'krT51jOAAC'),(120,'J4ZlzXakDW'),
(121,'52glaX2LFN'),(122,'kiTjjdDWl1'),(123,'fboIluEmz9'),(124,'U5k6csKrfe'),(125,'qC4wbll0BW'),
(126,'UE8L1eNYAp'),(127,'SQWG2p7WH1'),(128,'TV0HKdh2qA'),(129,'IOkcpQ6ZF8'),(130,'ewrzLaqy3w'),
(131,'nPsJD9N1BY'),(132,'7VrAhEp3am'),(133,'siQJXgnA5u'),(134,'xs94W3fbZq'),(135,'DEXrAJFrSG'),
(136,'uwXQDF8jwg'),(137,'VM6QlOWxnn'),(138,'jOeujnKjIN'),(139,'b5rz9AUs0R'),(140,'55o2U0IGGw'),
(141,'xRDpgfSnrZ'),(142,'4ZbiEZeGRk'),(143,'4n6Wsoklat'),(144,'fDcWaJ2CSd'),(145,'srAaWgeFx4'),
(146,'VBzf1JVr72'),(147,'5qN8406FI5'),(148,'hcyx1Mng9L'),(149,'KeyfXdO6eQ'),(150,'yKFZiCeBfg'),
(151,'jZ72X3NCop'),(152,'gzrvsb1rlb'),(153,'m9k1GWWYPz'),(154,'slAdlvh6Ie'),(155,'QMSzu9cUrG'),
(156,'KwaE3kyFvA'),(157,'gywy64zOJ7'),(158,'45jGKaqvHH'),(159,'3CrIp6K5jB'),(160,'6bKI8bZe20'),
(161,'KOKtMOMU3d'),(162,'4C8nGdGnJ9'),(163,'t3oHAcvbIs'),(164,'AM2Q7p286a'),(165,'u0BGH3dgCf');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(166,'VwU2HQkCtt'),(167,'dvMLcrJrqa'),(168,'lIrtP22hAG'),(169,'9OZmXO1AJr'),(170,'EzPM68o0nZ'),
(171,'uv0l4NElmO'),(172,'XDCmuPWjxO'),(173,'0Ji9Wv3ewR'),(174,'OC3lWNYysK'),(175,'JPX5TBxmcr'),
(176,'mFCZikN1OI'),(177,'TkzVAVJaPg'),(178,'0h0nEkwmpV'),(179,'8QCFoJ9eCw'),(180,'Agjk0jaB58'),
(181,'1WW50EOYV7'),(182,'xkL3JDhtr1'),(183,'VpYdfT8Pxf'),(184,'Kvrrdm3GOj'),(185,'4lIE8ZVqbx'),
(186,'BqTEmM73Zg'),(187,'G8l0xC3eZg'),(188,'JbfI6ugTfG'),(189,'8Ry9ddbnFQ'),(190,'pAqrc59SQ5'),
(191,'g1Q4nkLLH1'),(192,'qnXTizKlWU'),(193,'kPYJ1IuxpA'),(194,'vNDkjHB3W3'),(195,'RPfNkBnXJn');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(196,'vX65URcHDf'),(197,'zYgGGckxub'),(198,'xQPdCVtLiz'),(199,'fXnBPXRHPS'),(200,'o4z1E3tZGI'),
(201,'a0ms0eId39'),(202,'hRiN9bue0t'),(203,'Ldhcw3bYYJ'),(204,'lUEaYpu4Lv'),(205,'PyOQuXVm1m'),
(206,'JOiX77SK66'),(207,'DtEtXMMIyU'),(208,'qzTFdXOQrY'),(209,'izgwAWwrcb'),(210,'Wk8Psfte2i'),
(211,'LMxh5T5d3k'),(212,'tCdhYNMRtB'),(213,'aeqX8G0EW8'),(214,'nuYJNWB90q'),(215,'bSx2sUHb0e'),
(216,'Tbu1HqgZjz'),(217,'c1G568nUUC'),(218,'MMbDjHqxpn'),(219,'9ZN1pLAhBg'),(220,'zmaBNjM26t'),
(221,'qwHySGAqR9'),(222,'Atu5zDnOQv'),(223,'8GSxMjwZ09'),(224,'5y067MSYji'),(225,'KTPBgG2fLK'),
(226,'67mKvkeTms'),(227,'Tk0REM2x8n'),(228,'uPprkp0QRF'),(229,'rRNqD7MqKW'),(230,'r8w0Ojc87U');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(231,'OEgiZqR4kG'),(232,'tOCgACXKNG'),(233,'9Mml5wcycA'),(234,'M2T71nupQW'),(235,'pRFEnd6PzM'),
(236,'MSu0UCb5nm'),(237,'Odcj304FpX'),(238,'Sr30asGi7b'),(239,'zN9Qy4Idmy'),(240,'MyCnIMzfLw'),
(241,'j0jc3fY3Zl'),(242,'537LxAeLv9'),(243,'sbc1KdpPrO'),(244,'3kWL29ngXS'),(245,'fODB2T100H'),
(246,'snuLEHYsSZ'),(247,'zJLLsVgwSy'),(248,'X7ycedXb81'),(249,'myYkfP0LGv'),(250,'k4N7dWD2Sh'),
(251,'xFiCuvzRrl'),(252,'t7ubxBulpc'),(253,'fVphNdt09I'),(254,'ZfIbDgQVzu'),(255,'aieeBmJwKb'),
(256,'lbM0CcZAzR'),(257,'B8SiLOzTXQ'),(258,'uYv5C61Kgk'),(259,'T7qhg7SRYl'),(260,'HQgitbQ5Tw');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(261,'x0Z3qMqRxF'),(262,'kOdO8ERuBN'),(263,'6h4vJe2NMk'),(264,'q51uxchx0U'),(265,'RBeTA2wRko'),
(266,'Kf3F0P5nuM'),(267,'UcEMZpXtaf'),(268,'ge4r54DluQ'),(269,'sknhaLCv3h'),(270,'g4Co9z6R4V'),
(271,'fC0EIplLJ5'),(272,'MU2dduygwN'),(273,'mlz38mbPsG'),(274,'7vrZvptjZu'),(275,'k0m8VMBjKP'),
(276,'Aaeqs3M7Ff'),(277,'OVdD7bndsx'),(278,'APHCnv91iw'),(279,'l2FcGhQAq1'),(280,'dvd3gPXjA3'),
(281,'jh1WOuScC7'),(282,'4UZT4VPA6a'),(283,'Kmx0UPwNgY'),(284,'Ya1oNEBsOV'),(285,'Oy8t7IWK9K'),
(286,'9Xmkt6tAC9'),(287,'8F5niedvF0'),(288,'UhwlLVoE3M'),(289,'2mOWZBxR4Q'),(290,'UAqOXJ3UKc');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(291,'olEJzbkAYY'),(292,'SpHzGV1jOh'),(293,'qM0zgT0hNC'),(294,'cU3aiRiFg7'),(295,'ax2g8o30HB'),
(296,'RTFmvbuOmf'),(297,'kCwW68wqRz'),(298,'xwCQG3UU02'),(299,'a9aMuIOQpG'),(300,'gTcAWXAgk9'),
(301,'2MjSOfRyf2'),(302,'HaYuElmklx'),(303,'ufBLSdUC4t'),(304,'3yt0AOaI7P'),(305,'1Zuw8G5r5v');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(306,'vZ4wPWKYAu'),(307,'LP4w9Tqhu0'),(308,'KenW6UuOML'),(309,'imGI7d37ln'),(310,'DCHMDlf7xp'),
(311,'ZY6FkRwhz5'),(312,'l6LyMiIvzf'),(313,'Zt6HwIWaSU'),(314,'zwbhwJpAiq'),(315,'rWHpBH1T9f');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(316,'cuIRPpczSc'),(317,'4VPeGyfnBD'),(318,'2INJyDmQFp'),(319,'RCbx1FoJRG'),(320,'r0sFvVGmjM'),
(321,'mNR6mUg8dM'),(322,'DMtmL24cmA'),(323,'KVV5VCZHYc'),(324,'69q3DDveLh'),(325,'ippFCfGF42'),
(326,'bo9iCQ1Wkj'),(327,'5ZkAPDf0jH'),(328,'GZQFceqQ20'),(329,'6UNfBS9I0x'),(330,'MY3llJFoz8'),
(331,'9PgwvBX3Fi'),(332,'jkdumlLF97'),(333,'EXAv4sfpeT'),(334,'ZBb30rxat9'),(335,'4FCSNl5J9A'),
(336,'7Ap14mPu1D'),(337,'gsZwIiJk35'),(338,'xuV9D8VriS'),(339,'wWpdVYWj8N'),(340,'cCjpdLqPJp'),
(341,'cVQDMNopx6'),(342,'RhMiRJC6bu'),(343,'MjlpduLpg2'),(344,'SFi30bGmQI'),(345,'tqvC640AYT');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(346,'ItyZc3tkjb'),(347,'B9I5oM9Tsz'),(348,'DapSAfxjti'),(349,'4LRMtiRIa7'),(350,'rfCyGuh0Xu'),
(351,'5gRjPsEfZ7'),(352,'FK0Bh0r6MG'),(353,'503vHiX0MP'),(354,'77L9nY3s6B'),(355,'dvtc1goBRP'),
(356,'ClnRzFngbr'),(357,'UNTJAH91YI'),(358,'799KmJGa3l'),(359,'3Wi6MVT4Ki'),(360,'uWQPqQcjcu'),
(361,'hwnJSCmdop'),(362,'8Mn0y8oW6o'),(363,'xErzXksudW'),(364,'rh7IDGtZnJ'),(365,'s0Pekhtaas');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(366,'lFmy6cFxvs'),(367,'U29S7bPews'),(368,'OOtx57zMPz'),(369,'1RTvum4JMk'),(370,'A5o5z017hI'),
(371,'SOosdWWz29'),(372,'n2h50CiOhU'),(373,'hFSLrTkx7F'),(374,'F1pGhmnlRY'),(375,'QEQM7IYsEx'),
(376,'RnaMlM6cBK'),(377,'wi2x3wNaYO'),(378,'Y77JEcyFOi'),(379,'51sKxcbdfU'),(380,'qKkGlrMdTL');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(381,'57U0YUqQHJ'),(382,'Y0OcP40s9a'),(383,'Uu5EhNX0hW'),(384,'QVwDn7h2vd'),(385,'wKVV6z6H0r'),
(386,'1dd20LBQSK'),(387,'6zsv2CELyS'),(388,'X87goJYjIs'),(389,'RPA0fw13Mc'),(390,'5Qjkg7cjd3'),
(391,'vuSiT3g7Nq'),(392,'wcHk3qy2QF'),(393,'LK8WWGYW9q'),(394,'rzGP6h6bhm'),(395,'P4pfpdJ9r0');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(396,'IjTXrlv6LM'),(397,'eK7h87W2nW'),(398,'tWUnzQecq3'),(399,'7ZpJiHfshV'),(400,'vAQUHF7Ihs'),
(401,'GQVUGvPphb'),(402,'GSPSOFex90'),(403,'bnVRktG9gu'),(404,'TV57wrDUDw'),(405,'2zKGPcu7GC'),
(406,'lJJqRc5EtW'),(407,'pPJxHvXSgh'),(408,'BJuM8ldPCI'),(409,'8J3eIJLPqT'),(410,'w8kqGnqW8d'),
(411,'FcbjAbZ6sp'),(412,'9pBlYfWpp8'),(413,'jHlMuCiDGU'),(414,'5GQiDgsUdq'),(415,'tPhATG79Sk'),
(416,'RBrA471Oy7'),(417,'3W0Xu2Zch2'),(418,'xBL8OUkk3o'),(419,'FivfD3YQoF'),(420,'pdggxXYKQa'),
(421,'rebaxPztvk'),(422,'XQVJ1UlVT0'),(423,'eIycNTfpK0'),(424,'5ZUc7lHUsy'),(425,'EpeDsYIWod');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(426,'wD1Z6ip9Nd'),(427,'tJi5o753MQ'),(428,'NQmewynvuy'),(429,'LIBrD2i5fY'),(430,'5HHPE4GjYu'),
(431,'dPJXPgaWnH'),(432,'44PZRkI01w'),(433,'Z9XyUFIXZ1'),(434,'sEW9U58nbh'),(435,'cLSXdB2s7e'),
(436,'vPslVd2VCK'),(437,'XC7vZ0hPEW'),(438,'lfZTUNr9UT'),(439,'Naa5GcVuo0'),(440,'DnkRKZOg8m'),
(441,'emnk2Q0YRH'),(442,'v2At76lBo6'),(443,'ewkOS84HJ4'),(444,'8KBrykxzD0'),(445,'m7dgELm0TN'),
(446,'xN2CIrBZR3'),(447,'VsOWJk1S4W'),(448,'Jv8yUhSEJH'),(449,'VEy6HvS8jG'),(450,'iYiJe3sHXd'),
(451,'TU57ECODrl'),(452,'Y7PKhR4SPX'),(453,'R2tyxvNyTb'),(454,'yLqpxBI02F'),(455,'gPR8rlIYlN');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(456,'8a19LbkHJS'),(457,'yatQwNRkWg'),(458,'IDaK1CluGM'),(459,'mzMFcYUqdW'),(460,'aArjQGgALe'),
(461,'UiBFF49rIJ'),(462,'00B6q8NnyX'),(463,'3kG9FHW03v'),(464,'gkil2ExHAh'),(465,'YmiUgk8u3R'),
(466,'22MxltbCA7'),(467,'iJyWnPRaEl'),(468,'KGmQ9QCwdf'),(469,'Il7l2nXu9I'),(470,'mvHD8PyLqQ'),
(471,'SiqRGwP6yV'),(472,'rpiey7LMd9'),(473,'1gb58Z8jRt'),(474,'c0FNMk4peG'),(475,'Yb5ob7NmPB'),
(476,'DlsrYwHvSr'),(477,'ypoF21jVSN'),(478,'DfsXkZkwdB'),(479,'LWUQp1IXya'),(480,'cJXwSsx0vk'),
(481,'X1TB7h3UH8'),(482,'LURRfbVYZB'),(483,'tMh2u3I5F1'),(484,'muB3nUCTSH'),(485,'7xQzOI1GQ0');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(486,'XZbt1LUbQE'),(487,'Z7PPVbTYnL'),(488,'ZCFRD55rnm'),(489,'BCoPeNSRBc'),(490,'9lDOs9iBdx'),
(491,'zdcEaVTJq5'),(492,'QnxnCXTAvI'),(493,'ICWLMy91jE'),(494,'X3N0xijjyI'),(495,'4JlFLWxZMV'),
(496,'qhQVpxGR2m'),(497,'WckmiWZ60d'),(498,'xtLmO8aR9z'),(499,'AjoNXzn2LA'),(500,'bSqMwbi9hz'),
(501,'71jsi6WoHq'),(502,'WzRDlwxWOs'),(503,'shvzCfC9zw'),(504,'abtJ2JA6pa'),(505,'d9vfolAnk9'),
(506,'oLuzGaFtqC'),(507,'4WyUP4GIKc'),(508,'w0ryOtvPLb'),(509,'eYZzHOq4Dc'),(510,'DQQmgHKaPt');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(511,'f2dHNxe6kX'),(512,'oziOif69NB'),(513,'NMFrZfkFRH'),(514,'iVAb6m5SlU'),(515,'tuTpyNrBEA'),
(516,'KLNNfSxvrr'),(517,'MZodyTzHS5'),(518,'koX2Rd2Z3L'),(519,'xjAR6XHx5n'),(520,'zJk3HUFz1f'),
(521,'YksIafxU5C'),(522,'aX2f4nYXga'),(523,'LCLpGaEdv7'),(524,'XDiYxM110a'),(525,'kx13MbRE9d'),
(526,'5sSaTWZCC9'),(527,'bTi8oXzdsr'),(528,'whgG0YKSco'),(529,'J9dSBouHEb'),(530,'xyy18QO3Oz'),
(531,'mxWSrYMMk5'),(532,'LHjY0c0Q69'),(533,'mrYQ37spHj'),(534,'JRDnCVnLkm'),(535,'chhJQpPaAg');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(536,'a76OM4ZFYt'),(537,'qgFAv3D6Vf'),(538,'zopThFJP9N'),(539,'sRpkJLUzaI'),(540,'6hw165chYW'),
(541,'mTFervSnrH'),(542,'uJFLBY1e1j'),(543,'iOfNjR2yXl'),(544,'mm0nlZMK3X'),(545,'3rISXwblzh'),
(546,'E8qzxYx14Z'),(547,'2dQFfITcjm'),(548,'Mrkdp1FMzx'),(549,'0R8zhn6BzN'),(550,'lUPeeZbCxP'),
(551,'c8BNUWXMJ6'),(552,'SkBHilfai1'),(553,'LRnVA1bG8P'),(554,'ZCZkU1PveK'),(555,'Qt224BTI53'),
(556,'4Be6DLVpMd'),(557,'4RO3gQLbwq'),(558,'Vt5XlcZub9'),(559,'iTLEUYidhI'),(560,'gkiBP8e8Wo');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(561,'02VOiLFGUk'),(562,'wkON5lFJiI'),(563,'sr3oKvL4Im'),(564,'7aYwIq87gJ'),(565,'SbI6W6VUGo'),
(566,'2VZN6I8rEx'),(567,'AL8snWLbEO'),(568,'mInZzQj7RN'),(569,'Z0xdtmAK0A'),(570,'rR3tJGcaT9'),
(571,'u3P1CurAYp'),(572,'jBZ0XJXf8A'),(573,'VBlEgVP4Ps'),(574,'yInRdfk6b9'),(575,'49wKbq2CV9'),
(576,'t7bTntSLUq'),(577,'exvp1aXHW1'),(578,'jbE8FWPan0'),(579,'cMiQ90rUou'),(580,'NYlueGOGTA');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(581,'SuqdaR3dNR'),(582,'e2ieOSPfqA'),(583,'tDdmoK0Te8'),(584,'IIGmhrgEzs'),(585,'7NHWQU0GgM'),
(586,'1taSRPRDzP'),(587,'bj8OJVv57g'),(588,'wKp8Df6GWT'),(589,'TtxSHYsxUR'),(590,'adPkRXP2M4'),
(591,'j5JAarDcPw'),(592,'TKqf6rwqHu'),(593,'m7kpFS4Fqp'),(594,'QD3buXkw1Z'),(595,'VQii8Pwunj'),
(596,'livcRlUd4H'),(597,'w8vkgQQOui'),(598,'H9yrZWZCr0'),(599,'gKbHDrRbKJ'),(600,'DG2umWf7Cs'),
(601,'8h9FcltDC5'),(602,'MSwEkmgngy'),(603,'8yElfBHDED'),(604,'1bA918KWpc'),(605,'7OZO6uUxKA');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(606,'z1bNuJdYkb'),(607,'ep89DuSwNl'),(608,'bK8E0tZzou'),(609,'qT3ENAAwPr'),(610,'fwvO7SPaLM'),
(611,'chkiio2WWA'),(612,'untzuLv4vD'),(613,'tfhfGpZuGi'),(614,'d9ocSJsVfj'),(615,'HnaO72C5dw'),
(616,'gVoHd69Fc2'),(617,'PHPxgu9Rhk'),(618,'caYM6FESiO'),(619,'ndQUCIVh8V'),(620,'Kn3nTAYnsM'),
(621,'3uY3TF7bLX'),(622,'1qgOPv05uY'),(623,'ZbSLayhv25'),(624,'rbkVU2EXA7'),(625,'L3WlddHpXh');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(626,'Kc2UwbcMdf'),(627,'iLjPqaGL3W'),(628,'rc4xMgFrs6'),(629,'r1XUvOjQi3'),(630,'a24fY9UG5D'),
(631,'X5wA0rhFHQ'),(632,'WuegxqxOeb'),(633,'1zm96yiZYN'),(634,'M8wojvFXeE'),(635,'qdIShpXXrs'),
(636,'LFmdMhTwEB'),(637,'IIq4EX8z6C'),(638,'lauZuXrUcQ'),(639,'bLsqBGVScC'),(640,'cSSc6iwONJ'),
(641,'riapGvVMty'),(642,'z9Uxk6ZA27'),(643,'BqW3jSHSdM'),(644,'kcGSj2uDjQ'),(645,'uIjoMd8f19'),
(646,'IwWPHALhFy'),(647,'nDtgNX2BOs'),(648,'MWamN3HsqG'),(649,'TmaeDyG0Ki'),(650,'qN7vnrZCaz');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(651,'k6QJwvVtCO'),(652,'3d08eBmOcZ'),(653,'RB1pB8Yp9f'),(654,'dFR1gXVRrS'),(655,'dWx6pNX9Ql'),
(656,'EKjBiiFkIx'),(657,'WpuguxL8cH'),(658,'pUhK64N4Ax'),(659,'lZYXbTgQS7'),(660,'RuJ35xlRL1'),
(661,'BYgJ6tnYFn'),(662,'UKkUM6QXFb'),(663,'R4pez4LnPI'),(664,'S6sIvN3Par'),(665,'pHLpmGKyr8'),
(666,'gNLukGsBTC'),(667,'i9I6VYbci8'),(668,'DB7XvKtA2s'),(669,'uW6RlEu8io'),(670,'f15YJp8PTO');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(671,'orPt4fQx8a'),(672,'XrJkRLD1UQ'),(673,'nd44dMFiOF'),(674,'LeqnDCGMWG'),(675,'y7AIRxrUG7'),
(676,'mG4DlLxVQs'),(677,'Zrj2O3AfgO'),(678,'F0fOcqcwmp'),(679,'eucRdEjnC2'),(680,'Pu6orGYH3X'),
(681,'wMy22vlql5'),(682,'sAskNoPRYJ'),(683,'TXdo8U31gV'),(684,'SV2P2S6kYs'),(685,'d3BHJPBWaC'),
(686,'0GstDZtJ3i'),(687,'1tJPmXHdr5'),(688,'rp3qpaVVft'),(689,'ShbefLmILd'),(690,'ixq00uuwev'),
(691,'HioeVKNCEn'),(692,'DXoJPUSpub'),(693,'v8ROX48C05'),(694,'qj0tmu27IU'),(695,'8kEiZKJhkg');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(696,'cECDAIQZHb'),(697,'LKMI6dg4hf'),(698,'bVgZcK3szM'),(699,'ubbTdlhxsd'),(700,'ddzrJxY6l5'),
(701,'nOAFFGinl0'),(702,'Ohk5qut2oV'),(703,'6tMDC8fyPo'),(704,'w7H3igbWOW'),(705,'D4L2P524BY'),
(706,'EfRQ94C6DH'),(707,'luX6DRaqWK'),(708,'TWnSSBhTyG'),(709,'Fkw0jQp04o'),(710,'deTHvThPy8'),
(711,'eLi1Fr1987'),(712,'WsI6BB7gWx'),(713,'lkwsqzDgg9'),(714,'eSe0l3C5v2'),(715,'Yq27RvVWFt');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(716,'VA2BW4ZzLQ'),(717,'nVc8cDNRUI'),(718,'8BveY4rzb4'),(719,'drawneacdr'),(720,'eMueODN3eN'),
(721,'hDB7uTPXnc'),(722,'MjYQx64pV8'),(723,'nuynnwRQQV'),(724,'ryUNXZqdBT'),(725,'OCzBe4ydrR'),
(726,'IhigkwPYT8'),(727,'B8GSuYPK3Y'),(728,'QbnBtk5xIt'),(729,'7yj8NJPynk'),(730,'JRJCRP6hQG'),
(731,'pnjSBq3gw9'),(732,'1cPkBNZHEl'),(733,'IahTO8Rktd'),(734,'oYgCETOQ7g'),(735,'PtBntrCjBE'),
(736,'0ycp7OFQED'),(737,'YSwTVd6Mgr'),(738,'9IKiVZY4kg'),(739,'6sjpn050Fz'),(740,'N7L4H66sSP');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(741,'vzDTErn3Uh'),(742,'zLqiHqtGqe'),(743,'hFHqeB7QbY'),(744,'dqlUvGpQk5'),(745,'MCgi9CQnxa'),
(746,'NzCxsqsWzD'),(747,'uXc5DJkWwA'),(748,'BdfuSfijrb'),(749,'uTdAKooxlF'),(750,'YSahKyjkez'),
(751,'c40wZuTReN'),(752,'HIoXSb4bvZ'),(753,'fwurlsC8ke'),(754,'58F190cqka'),(755,'UWSY7PoDPt'),
(756,'4IzEUpJIKr'),(757,'sVrARJDwXb'),(758,'8N1VFIdWuW'),(759,'E9s1jxIBhT'),(760,'qTf3s9pSGy'),
(761,'M1pxurRe8M'),(762,'MxYynsm0be'),(763,'ACPDupr7nF'),(764,'cLP5JMU5G2'),(765,'goCVH34rQ9');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(766,'Wz0myKmlCF'),(767,'9T12tBidoa'),(768,'Yrtj7V9361'),(769,'uArnsmUmH9'),(770,'js2A2MxJlF'),
(771,'VbCzkpGRoc'),(772,'KspLV9lNJG'),(773,'r5Vp1qytqu'),(774,'i0S0fS82DD'),(775,'gC7oz1Drp3'),
(776,'kj9eYZFW84'),(777,'1Xk33TaypC'),(778,'BtKGko8rz9'),(779,'mHDxK80xbG'),(780,'Nl4IMJbDuf'),
(781,'aOBm21Z34t'),(782,'aYh8RtTxt5'),(783,'dnWjzZzB4a'),(784,'N46TjXGb5S'),(785,'i72rpyE50c'),
(786,'0oTzCx2cxc'),(787,'BY8eggcNZ4'),(788,'n11bWguo3A'),(789,'V3KbkjlGRv'),(790,'fnndQJ8YLJ');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(791,'W0g6z8w2cf'),(792,'CNixHIOg37'),(793,'5V5nY9NYKN'),(794,'hWduneWNml'),(795,'wsovtSE0WI'),
(796,'5beNOB53hz'),(797,'uXrP7ptyJm'),(798,'vA4SKMrJ3G'),(799,'4WCCRG2Pfm'),(800,'jdqw0YAYyD'),
(801,'iPrtW5hMDC'),(802,'Tv9a5XVp81'),(803,'xdTgDSUHbw'),(804,'LSVzhopTpW'),(805,'ipMdSydP1d'),
(806,'DVa6QF6KqE'),(807,'kZuQ0BZK2Q'),(808,'sC9lSHQzNO'),(809,'zFP8sz1Yjc'),(810,'semlvI45mR');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(811,'YTWluAWzoI'),(812,'yG6bPfKwiA'),(813,'JBkahNZX0J'),(814,'NVN60fsoNr'),(815,'dCuboliKWP'),
(816,'8IXlHXs6Dh'),(817,'l88e5d3Akt'),(818,'xfj0hHQIv6'),(819,'oOAkKE7lyd'),(820,'wwkpGeDQgL'),
(821,'siknccjhEA'),(822,'GkLH2W8YT0'),(823,'fRLH6B43tC'),(824,'DAmjNGoWHr'),(825,'fahxWMldxu'),
(826,'gp6qqaWdrb'),(827,'hqxB7G7l3w'),(828,'rlRlVEuYut'),(829,'ZbG9gYD63x'),(830,'uLppKzmfzQ');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(831,'O9jBD5YUUl'),(832,'p8t8BGkyfj'),(833,'DBrGBf5lbg'),(834,'bOidea2E6l'),(835,'9slSHwcrnD'),
(836,'OyAQNNSc9h'),(837,'9w3yJbZPdl'),(838,'Of23jUaZ9P'),(839,'DO7XRnORQR'),(840,'HZFYlNzwJq'),
(841,'WNNCzt6Gq3'),(842,'w3ctduyfhf'),(843,'MI8MdyZdRW'),(844,'enQT30B5ih'),(845,'rHkXeO6W51'),
(846,'YUOndOOBiA'),(847,'UczUYInJ0n'),(848,'t37AyFhlrO'),(849,'2Dia7KZm0p'),(850,'l9WhNOSQ9V'),
(851,'lxgRHeXOyX'),(852,'rnTTIQ4YWN'),(853,'tASKBtgZwj'),(854,'xQmVmEhQSd'),(855,'xKyc88qDY6');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(856,'U33vmleVPY'),(857,'87cOjaB7qE'),(858,'tnF3ajL0MD'),(859,'CdB0P3X1tB'),(860,'kMA4ezsj2h'),
(861,'7tWUMqyAUC'),(862,'ZoIMVe6l9p'),(863,'CJNpdhmKYk'),(864,'1m7oFTHqni'),(865,'FXgrl6Dxj9'),
(866,'3GkNexfq0p'),(867,'EnltLxrdHB'),(868,'XP8akpngEh'),(869,'dykZrvCuKS'),(870,'yaz8ecwxgy'),
(871,'PkqilnIJnz'),(872,'K8mTLPCMCZ'),(873,'v7TzM7a96H'),(874,'3zAPS2ICxD'),(875,'n2HUHzxgxP'),
(876,'ZjuGCSR1Vo'),(877,'NINf5U8WBS'),(878,'GAY9w208rX'),(879,'K3MqsTF4MA'),(880,'lQqIzeolZw'),
(881,'1afeIZLvTK'),(882,'bTK8eU6gwl'),(883,'PDKAr0TPKS'),(884,'NOi5ftYriS'),(885,'IUkCiSGrof');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(886,'iIyxhyQexR'),(887,'F5kB6NuPdu'),(888,'5O8dd5cHcZ'),(889,'ulkpuFZvYr'),(890,'d44QNNtjGU'),
(891,'h0O4jTJUUl'),(892,'VIBXhdU5R0'),(893,'y81wRATsQP'),(894,'L3BH13XqFa'),(895,'6EawWU2gst'),
(896,'3yRPfi9cni'),(897,'9aEEZbH4gn'),(898,'Gnz04uhEa6'),(899,'Iw9gWXmvlS'),(900,'35Dgaf9WW4'),
(901,'M8AEnP8aVv'),(902,'B5BqaMahsB'),(903,'zWSOuLkSaY'),(904,'uLrfuKw53G'),(905,'ZLZ0R83WGN'),
(906,'EbnVF0pwUc'),(907,'ppA7BzNg6Q'),(908,'afollo6c6v'),(909,'RNMMTSiWZ3'),(910,'eAkabuKcyc');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(911,'vWa0xjxBtb'),(912,'3NziKbcxns'),(913,'R0GCvZ5NK1'),(914,'ddneA4xVZu'),(915,'fgn8AQLBQA'),
(916,'RWzGK4QYEX'),(917,'nj118ZkUiP'),(918,'nGY2NuMICf'),(919,'O37JjGohTF'),(920,'oZRBG5pwAk'),
(921,'p1dAWK862a'),(922,'sIWjJulrS1'),(923,'vDAclOzWvR'),(924,'FaHbzWa7xY'),(925,'Iro3XfDs2W'),
(926,'U7dJym0AYI'),(927,'VlLkURA4tw'),(928,'Un43sDYHFF'),(929,'LHeZ7H68mM'),(930,'gZipDhgDiF'),
(931,'fI8FCqDkau'),(932,'Ot5T6OGwnN'),(933,'VBRgQ5FPzL'),(934,'hUiAkCIZWQ'),(935,'EVi17wdPsy'),
(936,'auZVtd1byH'),(937,'lyuPN4L5t4'),(938,'GrZXI9dZje'),(939,'bzgAux4NQG'),(940,'KqkPoQkSoD'),
(941,'ligystVCMu'),(942,'9b2UpvRtfa'),(943,'97pmtZGJs2'),(944,'YLvf23TsSA'),(945,'c1AfHsxQk3');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(946,'80xOEn23ES'),(947,'nLUUVyqXbw'),(948,'cibe8H7JfA'),(949,'m0jz3hXgaP'),(950,'AZo9WQhqKS'),
(951,'CZyyaaZTQ6'),(952,'qtYEqxmfax'),(953,'bK6MvC4cHr'),(954,'kQ9M8MCvYd'),(955,'IEQeiRAjSj'),
(956,'oCPW11dlCX'),(957,'f6LiWZuMFe'),(958,'v1G7pW3coe'),(959,'BUJiDhBmUG'),(960,'sasA7L2sIJ'),
(961,'gydxyx6Rqe'),(962,'8A7hVKwney'),(963,'XH19vUIF9d'),(964,'eLUe7N0WuQ'),(965,'lt50IsdLpx'),
(966,'YPNTvZ7eCd'),(967,'o0RNAxqcjI'),(968,'Ta2OMnLA1D'),(969,'07aMEO7Asi'),(970,'PWUQlucszU'),
(971,'BAlgd8W9GI'),(972,'N6n8mraFIw'),(973,'zptB37Gmmb'),(974,'LdLgBzW3tG'),(975,'173kUSsVn4');
INSERT INTO UsuarioEmpleado (idEmpleado, contrasenna) VALUES
(976,'UXkDeVRjng'),(977,'1uXp6uvH6w'),(978,'VgVB42wJqk'),(979,'Ov8sHy2HBp'),(980,'iwQMPGkOnk'),
(981,'hlY1ixBiIm'),(982,'jH3DRGvphI'),(983,'1nFRNjQJwx'),(984,'RhfGCmWHJT'),(985,'xU9YGb2N4I'),
(986,'V5qfs4fHn9'),(987,'h2vUVBmxAp'),(988,'unfNVhorKw'),(989,'qCOocW19XI'),(990,'GPeJw4ioDE'),
(991,'yENPYrZdKL'),(992,'Qy60SeoH19'),(993,'Kma1ieJWaa'),(994,'89oG8lz8Pv'),(995,'6YzM2SSo1S'),
(996,'QbxD3LoVr3'),(997,'hDCuNQKz2q'),(998,'op1GCwxN9P'),(999,'MfeIJgMkNw'),(1000,'6eQWN3VE9l');

--Clientes
INSERT INTO Cliente (idEstado, cedula, correo, nombre, apellido1, apellido2, celular, fechaNacimiento) VALUES
(2,1428482906,'Eryn_Eagle265@yahoo.com','Eryn','Eagle','Eagle','3-418-576-4504','8972-09-11 07:17:16Z'),
(2,1609406699,'Abdul_Johnson9123@extex.org','Abdul','Johnson','Johnson','8-320-646-8471','6248-04-03 12:25:29Z'),
(2,2064506286,'Doug_Brett5887@jiman.org','Doug','Brett','Brett','8-687-546-5471','4348-09-14 12:42:34Z'),
(2,352860559,'Lauren_Bayliss5642@nimogy.biz','Lauren','Bayliss','Bayliss','6-667-272-7273','7205-09-14 11:35:04Z'),
(2,584201464,'Barry_Douglas3860@acrit.org','Barry','Douglas','Douglas','4-077-487-7286','2758-06-13 22:18:02Z'),
(2,2044382552,'Paige_Wright5691@eirey.tech','Paige','Wright','Wright','0-728-412-4462','3953-02-20 04:39:57Z'),
(2,760134173,'Bethany_Bradshaw5567@cispeto.com','Bethany','Bradshaw','Bradshaw','0-156-708-2466','2559-01-16 01:01:32Z'),
(2,1592770813,'Kaylee_Lambert4072@yahoo.com','Kaylee','Lambert','Lambert','8-513-775-0616','5156-05-29 18:02:20Z'),
(2,336539048,'Peter_Ventura1454@gompie.com','Peter','Ventura','Ventura','5-858-768-1860','9920-03-06 05:03:37Z'),
(2,315630989,'Harry_Mccormick90@muall.tech','Harry','Mccormick','Mccormick','5-414-164-3317','4099-03-07 21:12:46Z'),
(2,1936518271,'Leilani_Mcneill2074@extex.org','Leilani','Mcneill','Mcneill','3-772-067-2554','9678-12-26 08:02:43Z'),
(2,561725344,'Chanelle_Norburn3411@bungar.biz','Chanelle','Norburn','Norburn','0-713-631-6344','5790-10-01 03:22:41Z'),
(2,1532728689,'Rufus_Quinton5580@eirey.tech','Rufus','Quinton','Quinton','7-876-152-7765','4857-09-15 16:58:09Z'),
(2,991559896,'Bridget_Uddin2082@sveldo.biz','Bridget','Uddin','Uddin','4-783-565-8023','8632-03-08 22:07:34Z'),
(2,1272147754,'Jacob_Gosling5833@sheye.org','Jacob','Gosling','Gosling','8-566-686-0850','7509-06-22 10:04:49Z'),
(2,1414453665,'Cherish_Chapman6572@acrit.org','Cherish','Chapman','Chapman','1-700-001-4454','7522-08-28 19:14:40Z'),
(2,1563872017,'Daron_Howard3959@brety.org','Daron','Howard','Howard','7-164-145-6461','5935-05-12 12:48:41Z'),
(2,1347514676,'Hayden_Stone 792@kideod.biz','Hayden','Stone ','Stone ','2-625-086-3568','3871-05-18 00:47:21Z'),
(2,1465492641,'Josh_Walton1217@typill.biz','Josh','Walton','Walton','5-267-217-6005','3811-05-24 22:56:16Z'),
(2,1468155144,'Aleksandra_Hardwick1304@elnee.tech','Aleksandra','Hardwick','Hardwick','5-177-326-1422','4095-05-07 01:57:52Z'),
(2,1093053527,'George_Underhill5804@bulaffy.com','George','Underhill','Underhill','6-573-232-1706','2142-11-08 13:32:05Z'),
(2,1244704437,'Carolyn_Preston5854@joiniaa.com','Carolyn','Preston','Preston','0-582-518-4427','7434-12-09 09:08:03Z'),
(2,811765554,'Marina_Torres3867@eirey.tech','Marina','Torres','Torres','6-733-135-8852','3194-10-07 13:14:29Z'),
(2,205348355,'Zara_Lindop5788@kideod.biz','Zara','Lindop','Lindop','3-718-285-5020','8068-07-10 19:02:55Z'),
(2,1232965494,'Denis_Kent3025@tonsy.org','Denis','Kent','Kent','3-047-406-7006','2707-11-07 11:30:12Z'),
(2,1538036957,'Alma_Jarvis6503@extex.org','Alma','Jarvis','Jarvis','2-734-030-6401','1834-10-20 09:01:23Z'),
(2,1170137555,'Emmanuelle_Norman3273@fuliss.net','Emmanuelle','Norman','Norman','1-543-074-1184','4397-09-01 18:45:24Z'),
(2,613333167,'Lily_Anderson4761@vetan.org','Lily','Anderson','Anderson','1-201-752-7445','2762-08-03 14:47:53Z'),
(2,437382139,'Celina_Hill9366@gembat.biz','Celina','Hill','Hill','5-825-044-5304','5218-12-04 10:14:20Z'),
(2,1917059252,'Kirsten_Wilson4819@deons.tech','Kirsten','Wilson','Wilson','7-415-038-5106','9193-10-31 15:04:56Z'),
(2,1646907756,'Joyce_Harvey202@muall.tech','Joyce','Harvey','Harvey','6-135-231-2466','5685-09-21 04:40:29Z'),
(2,371821474,'Margaret_Boyle8801@irrepsy.com','Margaret','Boyle','Boyle','7-452-873-1850','1277-12-26 18:58:15Z'),
(2,1204501177,'Phoebe_Ingram5401@fuliss.net','Phoebe','Ingram','Ingram','1-072-503-1116','2639-03-17 06:47:03Z'),
(2,589738237,'Tom_Drew7111@deons.tech','Tom','Drew','Drew','4-084-180-0408','8403-03-31 07:30:23Z'),
(2,569386074,'Matthew_Ingram4242@bulaffy.com','Matthew','Ingram','Ingram','3-464-310-1712','1087-11-18 13:45:21Z'),
(2,887017486,'Aurelia_Lyon6779@brety.org','Aurelia','Lyon','Lyon','2-344-570-6675','5937-10-28 16:21:47Z'),
(2,1963546255,'Kieth_Denton1658@typill.biz','Kieth','Denton','Denton','4-285-203-2622','6347-02-08 04:16:57Z'),
(2,574326104,'Henry_Bennett4564@joiniaa.com','Henry','Bennett','Bennett','3-808-317-1135','5268-04-25 20:13:35Z'),
(2,2147415087,'Dani_Tobin1326@gmail.com','Dani','Tobin','Tobin','3-014-663-6283','1346-04-23 18:56:34Z'),
(2,498822980,'Camila_Bailey1624@guentu.biz','Camila','Bailey','Bailey','0-636-256-0812','0742-05-02 14:56:48Z'),
(2,219591731,'Sienna_Addley822@mafthy.com','Sienna','Addley','Addley','1-635-312-0741','4639-03-20 00:29:08Z'),
(2,1638123807,'Ramon_Mason712@liret.org','Ramon','Mason','Mason','7-625-477-3667','4869-11-08 11:36:18Z'),
(2,1146180134,'Enoch_Samuel2715@brety.org','Enoch','Samuel','Samuel','7-182-635-0384','9457-04-30 20:42:18Z'),
(2,915183822,'Rebecca_Bradshaw7799@kideod.biz','Rebecca','Bradshaw','Bradshaw','5-404-674-4328','1271-11-12 19:09:40Z'),
(2,1099836877,'Enoch_Thompson3447@bulaffy.com','Enoch','Thompson','Thompson','8-465-247-3578','4210-07-11 11:23:19Z'),
(2,1573311128,'Michelle_Beal4873@jiman.org','Michelle','Beal','Beal','8-671-052-6600','7369-11-01 12:26:47Z'),
(2,169318790,'Marla_Mccall6585@twace.org','Marla','Mccall','Mccall','1-352-787-0233','7015-03-06 12:55:41Z'),
(2,384289842,'David_Underhill1511@guentu.biz','David','Underhill','Underhill','2-677-341-3235','8451-12-10 13:26:28Z'),
(2,542716750,'Clarissa_Scott8321@brety.org','Clarissa','Scott','Scott','2-787-346-4868','2864-01-12 02:52:26Z'),
(2,816362539,'Noah_Rigg694@extex.org','Noah','Rigg','Rigg','0-632-553-7040','5955-04-04 10:57:57Z'),
(2,1485144897,'Joseph_Locke4833@hourpy.biz','Joseph','Locke','Locke','7-235-275-4605','3132-06-30 17:10:30Z');

--UsuarioClientes
INSERT INTO UsuarioCliente (idCliente, contrasenna) VALUES
(1, 'pato123'), (2,'f5PCc4grAs'),(3,'zf0424mv2O'),(4,'MGgKtRu1Bz'),(5,'A3wcHpcxLE'),(6,'zu1Gd8pgC5'),
(7,'IK5yrYZESK'),(8,'KppKr5sXxN'),(9,'bykxYcParv'),(10,'mOyGr088us'),(11,'QXfA4JFrYh'),
(12,'PRszdTjIZP'),(13,'J8Whi51ic1'),(14,'7umE6ETj2P'),(15,'WiBJfUf9nY'),(16,'QzifjSA8c8'),
(17,'SgOhkfpo2Z'),(18,'9APK2l7NBN'),(19,'a15DkHLHeo'),(20,'DVG360Tej9'),(21,'p1GNYQkYm8'),
(22,'Vx6PibkL6d'),(23,'TiJOWo3WNC'),(24,'ScnBhiusoU'),(25,'gxegTPZ1Vf'),(26,'PHhFpHr11u'),
(27,'WOKjp2J4r9'),(28,'q2gm6gDm5G'),(29,'PCBsxK5iWa'),(30,'13048Sm51a'),(31,'GeJVzWl5IJ'),
(32,'DF6vfTMcvf'),(33,'7liQIxCmnn'),(34,'3IveAu3p3b'),(35,'j9ZMWv6FYp'),(36,'GKJVde52MC'),
(37,'U8RfP5Tcuv'),(38,'ZhiU67LV4W'),(39,'06N8hs8ZAf'),(40,'yAc1Hks47a'),(41,'beUnPimyZg'),
(42,'Tk80LXuT7g'),(43,'64bP6YErNV'),(44,'ORYd4Wmkt8'),(45,'GKAdMOCmpu'),(46,'zZ6adhCEr0'),
(47,'e4lDRBLe5z'),(48,'uKk8aw47Ds'),(49,'WbCdgzU89W'),(50,'Th32dMj6MK'),(51,'Chr09oz79r');

--Categorias

insert into Categoria(nombre, descripcion) values
('Frutas y verduras', 'Siempre frescos' ),
('Bebida', 'Producto para refrescarte'),
('Snacks', 'Date un gusto'),
('Carnes y pescados', 'Ideales para tus almuerzos de la semana' ),
('Farmacia', 'Siempre ayud�ndote a sentirte mejor');

--Productos
insert into Producto(idCategoria, nombre, descripcion, precio) values
(1,'Pera', 'tipicas y deliciosas', 0.5),(1,'Melon', 'cultivado por nuestra gente', 1),(1,'Guayaba', 'la fruta de temporada', 0.5),
(2,'Jet', 'bebida energetica', 2),(2,'Arizona', 'te asiatico', 2),(2,'Leche', 'proteina anhadida', 2),
(3,'Platanitos', 'marca Pro', 2),(3,'Yuquitas', 'marca Pro', 2),(3,'Meneitos', 'marca Jacks', 2),
(4,'Higado', 'perfecto para comer con cebolla', 2),(4,'Salmon', 'desde los Alpes', 2),(4,'Pulpo', 'diferente y sabroso', 2),
(5,'Aspirina', 'ayuda a combatir molestias', 2),(5,'Enterogermina', 'restaura la flora estomacal', 2),(5,'Rupax', 'Combate alergias', 2);


--Inventario
insert into Inventario(idProducto,idSucursal,cantidad, minimo, maximo) values
(1,28,30,5,30),(3,28,30,5,30),(1,37,30,5,30),(5,7,30,5,30),
(2,15,30,5,30),(7,10,30,5,30),(2,31,30,5,30),(12,12,30,5,30),
(2,47,30,5,30),(11,39,30,5,30),(11,33,30,5,30),(11,20,30,5,30),
(1,43,30,5,30),(7,14,30,5,30),(1,13,30,5,30),(3,22,30,5,30),
(10,28,30,5,30),(7,9,30,5,30),(6,17,30,5,30),(4,49,30,5,30),
(7,22,30,5,30),(8,36,30,5,30),(4,16,30,5,30),(7,33,30,5,30),
(4,21,30,5,30),(11,36,30,5,30),(3,32,30,5,30),(3,40,30,5,30),
(11,12,30,5,30),(2,15,30,5,30),(8,27,30,5,30),(1,49,30,5,30),
(11,43,30,5,30),(10,46,30,5,30),(9,15,30,5,30),(1,3,30,5,30),
(6,25,30,5,30),(10,31,30,5,30),(4,40,30,5,30),(13,28,30,5,30),
(2,25,30,5,30),(4,16,30,5,30),(14,46,30,5,30),(5,46,30,5,30),
(1,21,30,5,30),(12,27,30,5,30),(7,15,30,5,30),(13,45,30,5,30),
(6,34,30,5,30),(5,35,30,5,30);


--Pedidos
insert into Pedido(idSucursal,idProveedor,idEstado,idProducto,fechaSolicitud,fechaRecibido,cantidad) values 
/*Pediente 6 y recibido 7*/
(17,48,6,8,'2021-02-02 08:18:17','2024-04-28 21:56:37',23),(27,45,6,9,'2021-11-25 15:10:29','2026-12-25 01:04:25',29),
(32,39,6,12,'2021-08-04 00:02:36','2025-09-15 09:40:54',29),(24,40,6,14,'2021-01-08 03:33:10','2027-07-15 02:04:21',11),
(22,47,6,8,'2021-10-24 03:07:40','2026-09-16 12:38:17',42),(47,30,6,2,'2021-06-03 01:40:27','2024-08-25 08:26:47',16),
(46,43,6,11,'2021-07-23 13:27:00','2026-03-05 02:15:53',28),(28,40,6,11,'2021-03-07 08:40:51','2024-09-01 22:38:48',10),
(1,34,6,4,'2021-06-24 20:44:56','2024-09-19 05:20:57',15),(5,42,6,6,'2021-05-30 05:10:01','2025-12-05 20:37:24',22),
(4,7,6,11,'2021-10-28 15:53:02','2026-02-11 18:47:20',29),(18,8,6,5,'2021-06-17 11:47:23','2025-01-22 19:37:48',28),
(20,32,6,7,'2021-09-12 12:48:28','2027-03-06 14:53:29',26),(34,4,6,8,'2020-12-13 09:01:58','2027-06-13 00:29:10',26),
(8,31,6,11,'2021-03-08 09:52:26','2024-12-11 06:27:04',16),(13,26,6,8,'2021-06-10 14:50:12','2027-02-04 16:33:45',13),
(11,39,6,8,'2021-07-13 01:18:27','2025-06-21 04:46:03',26),(24,30,6,6,'2021-09-17 08:26:03','2024-08-04 11:56:21',28),
(43,16,6,5,'2021-10-15 03:58:29','2024-09-13 02:58:44',21),(19,37,6,12,'2021-03-20 05:28:11','2024-06-16 05:20:23',15),
(9,16,6,1,'2021-03-07 11:08:08','2024-09-27 22:20:02',26),(32,3,6,4,'2021-05-29 20:38:09','2023-11-20 16:30:19',24),
(35,44,6,11,'2020-12-22 17:56:55','2027-09-05 15:45:10',14),(24,30,6,3,'2021-08-30 04:47:58','2026-04-05 09:20:51',12),
(22,38,6,3,'2021-07-11 04:40:05','2027-01-28 06:50:29',15),(29,5,6,10,'2021-04-13 01:05:40','2025-07-07 00:39:50',16),
(17,27,6,2,'2021-05-10 21:49:19','2025-02-26 04:10:45',21),(28,24,6,10,'2021-03-30 14:38:49','2026-04-23 16:35:53',21),
(14,39,6,1,'2021-08-18 02:19:39','2027-05-02 03:52:40',14),(46,33,6,4,'2021-10-23 04:54:19','2025-11-26 13:56:43',12),
(2,10,6,11,'2021-09-30 13:12:23','2026-07-13 01:16:16',28),(4,23,6,10,'2021-03-25 19:58:30','2026-09-29 22:14:21',13),
(20,48,6,11,'2021-01-29 02:17:01','2024-02-25 02:32:08',26),(15,24,6,4,'2021-07-06 06:57:25','2024-05-29 10:55:47',25),
(5,37,6,5,'2021-02-06 19:21:02','2024-08-19 05:40:53',14),(9,49,6,14,'2021-03-23 19:33:00','2026-02-12 11:06:27',27),
(47,20,6,4,'2021-05-28 17:56:53','2023-11-17 12:51:44',15),(34,38,6,2,'2021-02-20 16:20:43','2024-05-22 22:58:08',23),
(6,13,6,8,'2021-02-20 01:49:48','2027-07-09 22:39:54',12),(45,47,6,3,'2021-05-03 13:14:23','2024-06-01 18:43:27',25),
(20,6,6,12,'2021-04-23 08:07:20','2026-06-26 16:37:27',25),(40,45,6,11,'2021-09-12 14:10:29','2027-02-02 09:45:56',29),
(21,44,6,14,'2021-05-11 12:04:57','2026-07-07 16:09:05',10),(14,40,6,4,'2021-02-19 07:41:07','2026-11-27 07:17:21',21),
(6,15,6,9,'2021-08-14 20:50:50','2027-10-09 05:35:39',25),(6,20,6,3,'2021-01-29 21:40:12','2025-03-31 08:06:31',23),
(22,13,6,10,'2021-06-24 10:36:26','2025-07-26 17:12:04',21),(14,12,6,5,'2021-06-22 18:34:58','2024-10-10 07:46:35',23),
(18,34,6,11,'2021-11-02 14:02:32','2025-09-11 13:25:18',11),(8,3,6,10,'2021-07-09 02:04:09','2026-07-22 10:29:02',13),
(1,1,6,1,'2021-12-23 08:36:20','2039-01-26 15:02:10',10000);

DECLARE @cnt INT = 1;
DECLARE @idProducto int = 1;
WHILE @cnt < (select count(idPedido) from Pedido)
BEGIN
	if (select count(idPedido) from Pedido where idPedido = @cnt) > 0 and
	(select count(idInventario) from Inventario where idInventario = @cnt) > 0 and
	(select count(idProducto) from Producto where idProducto = @idProducto) > 0 and
	(select count(idSucursal) from Sucursal where idSucursal = @cnt) > 0 
	begin
		UPDATE Pedido SET idProducto = @idProducto where idPedido = @cnt;
		UPDATE Pedido SET idSucursal = @cnt where idPedido = @cnt;
		UPDATE Inventario SET idProducto = @idProducto where idInventario = @cnt;
		UPDATE Inventario SET idSucursal = @cnt where idInventario = @cnt; 
	end
   
   SET @idProducto = @idProducto + 1;
   SET @cnt = @cnt + 1;
   if @idProducto = 16 begin set @idProducto = 1; end
END;
GO

--Lotes de productos
insert into LoteProducto(idPedido, fechaProduccion,fechaExpiracion,cantidad,
                        costoLote,porcentajeGanancia) values
(1,'2021-05-13 15:03:39','2022-11-15 00:49:42',30,20.72,0.7),(2,'2021-01-16 17:15:16','2022-11-15 20:33:10',30,32.47,0.56),
(3,'2021-02-27 22:49:05','2022-11-15 04:54:05',30,23.17,0.07),(4,'2021-02-10 14:53:52','2022-11-16 10:36:22',30,33.81,0.92),
(5,'2021-04-05 10:12:02','2022-11-16 20:27:21',30,32.84,0.88),(6,'2021-01-28 02:06:08','2022-11-16 22:56:38',30,31.19,0.35),
(7,'2021-10-02 03:16:12','2022-11-23 14:43:08',30,22.34,0.14),(8,'2021-05-04 06:03:01','2022-11-23 12:12:00',30,33.16,0.33),
(9,'2021-09-02 14:49:21','2022-11-21 13:30:02',30,32.19,0.31),(10,'2021-01-15 22:47:37','2022-11-21 02:13:24',30,23.53,0.66),
(11,'2021-07-05 14:02:20','2025-01-23 00:22:19',30,39.66,0.32),(12,'2021-11-04 09:49:19','2022-11-22 03:51:33',30,30.13,0.48),
(13,'2021-01-02 15:49:43','2027-08-07 16:25:42',30,36.95,0.66),(14,'2021-08-13 19:57:16','2027-01-09 19:28:05',30,24.54,0.96),
(15,'2021-09-07 11:13:04','2026-02-09 00:12:35',30,38.61,0.96),(16,'2021-10-04 00:22:57','2025-12-03 01:50:00',30,36.43,0.86),
(17,'2021-04-02 14:11:25','2026-10-24 09:56:03',30,37.72,0.6),(18,'2021-08-13 01:39:09','2027-05-07 06:14:19',30,31.98,0.17),
(19,'2021-11-13 08:38:53','2024-07-16 04:14:29',30,23.89,0.25),(20,'2021-04-16 11:15:52','2025-09-05 17:17:30',30,25.78,0.77),
(21,'2021-09-22 14:27:48','2024-10-13 04:06:13',30,36.45,0.86),(22,'2021-03-21 11:16:18','2023-12-24 10:55:17',30,21.45,0.48),
(23,'2021-02-10 08:07:34','2025-07-29 05:40:05',30,21.32,0.68),(24,'2021-03-13 10:25:03','2027-06-18 01:11:39',30,29.56,0.09),
(25,'2021-03-22 08:22:47','2026-09-10 15:01:49',30,37.97,0.53),(26,'2021-09-12 04:58:56','2026-12-30 17:00:50',30,27.52,0.25),
(27,'2021-04-14 15:01:06','2024-05-25 03:45:20',30,30.36,0.14),(28,'2021-09-07 12:04:15','2026-02-02 22:51:46',30,31.53,0.51),
(29,'2021-08-18 22:17:18','2025-07-15 10:27:00',30,37.5,0.45),(30,'2021-06-07 10:35:45','2026-06-09 12:04:05',30,25.84,0.66),
(31,'2021-01-31 09:34:48','2026-07-12 07:36:41',30,20.6,1.0),(32,'2021-08-18 05:45:11','2025-12-16 09:14:58',30,35.67,0.38),
(33,'2021-07-25 00:28:08','2027-02-11 19:48:24',30,33.69,0.83),(34,'2021-02-24 12:10:57','2026-02-02 07:21:05',30,32.75,0.35),
(35,'2021-05-04 18:09:41','2027-08-03 22:02:11',30,29.85,0.94),(36,'2021-11-12 02:29:22','2026-04-10 09:44:26',30,33.4,0.27),
(37,'2021-06-10 19:23:34','2025-11-25 14:57:26',30,39.21,0.77),(38,'2021-11-20 16:07:24','2025-05-22 01:08:23',30,27.63,0.44),
(39,'2021-02-16 10:18:50','2026-09-25 11:38:43',30,25.63,0.34),(40,'2021-06-23 12:10:44','2026-07-07 15:27:51',30,39.69,0.42),
(41,'2021-08-13 00:55:34','2024-08-28 22:13:02',30,26.13,0.4),(42,'2021-07-25 19:46:04','2026-09-27 14:49:35',30,37.25,0.51),
(43,'2021-10-27 07:10:29','2024-02-08 12:01:02',30,20.1,0.28),(44,'2021-10-09 19:37:22','2025-01-09 05:12:41',30,32.5,0.29),
(45,'2021-10-01 01:19:26','2025-10-04 19:08:19',30,32.23,0.21),(46,'2021-06-07 17:58:21','2025-04-23 07:43:20',30,37.46,0.14),
(47,'2021-01-11 13:00:16','2024-10-19 21:11:14',30,33.88,0.39),(48,'2021-07-31 00:08:24','2023-12-09 13:10:26',30,22.42,0.36),
(49,'2021-09-26 10:58:11','2026-09-27 21:12:34',30,38.64,0.42),(50,'2020-12-09 07:29:55','2027-07-26 05:39:14',30,20.26,0.03),
(51,'2021-12-23 08:36:20','2039-01-26 15:02:10',10000,10000,0.5);

--Unidades
insert into Unidad(idLote, idEstado) values
(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),(1,3),
(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),(2,3),
(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3),(3,3);
insert into Unidad(idLote, idEstado) values
(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),(4,3),
(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3),(5,3);
insert into Unidad(idLote, idEstado) values
(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),(6,3),
(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3),(7,3);
insert into Unidad(idLote, idEstado) values
(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),(8,3),
(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3),(9,3);
insert into Unidad(idLote, idEstado) values
(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),(10,3),
(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),(11,3),
(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3),(12,3);
insert into Unidad(idLote, idEstado) values
(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),(13,3),
(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),(14,3),
(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3),(15,3);
insert into Unidad(idLote, idEstado) values
(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),(16,3),
(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),(17,3),
(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3),(18,3);
insert into Unidad(idLote, idEstado) values
(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),(19,3),
(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3),(20,3);
insert into Unidad(idLote, idEstado) values
(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),(21,3),
(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3),(22,3);
insert into Unidad(idLote, idEstado) values
(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),(23,3),
(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3),(24,3);
insert into Unidad(idLote, idEstado) values
(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),(25,3),
(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),(26,3),
(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3),(27,3);
insert into Unidad(idLote, idEstado) values
(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),(28,3),
(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),(29,3),
(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3),(30,3);
insert into Unidad(idLote, idEstado) values
(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3),(31,3);
insert into Unidad(idLote, idEstado) values
(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),(32,3),
(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),(33,3),
(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3),(34,3);
insert into Unidad(idLote, idEstado) values
(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),(35,3),
(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),(36,3),
(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),(37,3),
(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3),(38,3);
insert into Unidad(idLote, idEstado) values
(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),(39,3),
(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3),(40,3);
insert into Unidad(idLote, idEstado) values
(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),(41,3),
(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),(42,3),
(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3),(43,3);
insert into Unidad(idLote, idEstado) values
(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),(44,3),
(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3),(45,3);
insert into Unidad(idLote, idEstado) values
(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),(46,3),
(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3),(47,3);
insert into Unidad(idLote, idEstado) values
(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),(48,3),
(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3),(49,3);
insert into Unidad(idLote, idEstado) values
(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3),(50,3);

DECLARE @cnt INT = 0;
WHILE @cnt < 10000
BEGIN
   insert into Unidad(idLote, idEstado) values (51,5);
   SET @cnt = @cnt + 1;
END;
GO

--Impuestos
insert into Impuesto(porcentaje) values
(0.1),(0.2),(0.3),(0.4),(0.04),(0.05),(0.06),(0.07),(0.08),(0.09);

--Descuentos
--insert into Descuento(idLote, porcentaje) values
-- queda vac�o para insertar por proc


--Impuestos por productos
insert into ProductoXImpuesto(idProducto,idImpuesto) values
(12,1),(2,5),(1,7),(5,3),(13,4),(2,6),(3,4),(11,2),
(6,7),(9,9),(5,3),(3,1),(4,3),(9,1),(7,1);

--Fotos
insert into fotos(idProducto) values
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15);
	
--Facturas
--insert into Factura(idSucursal, idCliente, idEmpleado, idMetodoPago, total, fechaFactura) values
--(1, 1, 1, 1, 0, '2022-12-15'),(1, 2, 4, 3, 0, '2022-12-15'),(2, 1, 1, 1, 0, '2022-12-15'),
--(2, 3, 4, 3, 0, '2022-12-15'),(3, 4, 1, 1, 0, '2022-12-15'),(3, 5, 4, 3, 0, '2022-12-15');
DECLARE @cnt INT = 1;
DECLARE @idSucursal INT = 0;
DECLARE @idCliente INT = 0;
DECLARE @idEmpleado INT = 0;
WHILE @cnt < 10001
BEGIN
	SET @idSucursal = (SELECT FLOOR(RAND()*(50-1+1)+1));
	SET @idCliente = (SELECT FLOOR(RAND()*(50-1+1)+1));
	SET @idEmpleado = (SELECT FLOOR(RAND()*(50-1+1)+1));
   insert into Factura(idSucursal, idCliente, idEmpleado, idMetodoPago, total, fechaFactura) values
   (@idSucursal, @idCliente, @idEmpleado, 1, 0.53, GETDATE());
   SET @cnt = @cnt + 1;
END;
GO

--Detalles
--insert into Detalle(idUnidad, idFactura, subTotal) values
--(4, 1, 2),(5, 1, 3),(6, 1, 2),(7, 2, 2),(8, 2, 3),
--(9, 3, 2),(21, 3, 2),(22, 3, 2),(23, 4, 2),(24, 4, 2),
--(25, 5, 2),(26, 5, 2),(27, 5, 2),(28, 6, 2),(29, 6, 2);

DECLARE @cnt INT = 1;
WHILE @cnt < 10001
BEGIN
   insert into Detalle(idUnidad, idFactura, subTotal) values (@cnt+1500,@cnt,0.53);
   SET @cnt = @cnt + 1;
END;
GO

--Bonos 
--insert into Bono(idEmpleado, cantidadBono, fechaBono) values
-- queda vac�o para insertar por proc

--Envios 
insert into Envio(idFactura, idEstado, costoEnvio, fechaEnvio) values
                (3, 8, 10, '2022-12-15'),
                (2, 6, 10, '2022-10-30');

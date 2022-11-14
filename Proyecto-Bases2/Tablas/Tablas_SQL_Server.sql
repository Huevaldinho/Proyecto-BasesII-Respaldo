create table Estado(
	idEstado int not null identity(1,1) primary key (idEstado),
	nombre varchar(50) not null
);
CREATE TABLE Departamento(
	idDepartamento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombreDepartamento VARCHAR(25) NOT NULL
);
CREATE TABLE Moneda(
	idMoneda INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombreDivisa VARCHAR(100) NOT NULL,
	cambioDolar MONEY NOT NULL CHECK(cambioDolar>=0)--en el caso del dolar el cambio es 0
);

CREATE TABLE Pais(
	idPais INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idMoneda INT FOREIGN KEY REFERENCES Moneda(idMoneda) NOT NULL,
	nombrePais VARCHAR(100) NOT NULL
);
CREATE TABLE Provincia(
	idProvincia INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idPais INT FOREIGN KEY REFERENCES Pais(idPais) NOT NULL,
	nombreProvincia VARCHAR(100) NOT NULL
);
CREATE TABLE Canton(
	idCanton INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idProvincia INT FOREIGN KEY REFERENCES Provincia(idProvincia) NOT NULL,
	nombreCanton VARCHAR(100) NOT null
);
CREATE TABLE Distrito(
	idDistrito INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idCanton INT FOREIGN KEY REFERENCES Canton(idCanton) NOT NULL,
	nombreDistrito VARCHAR(100) NOT null
);
CREATE TABLE Ubicacion(
	idUbicacion INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idDistrito INT FOREIGN KEY REFERENCES Distrito(idDistrito) NOT NULL,
	descripcion VARCHAR(250) NOT NULL
);

CREATE TABLE Puesto(
	idPuesto INT IDENTITY(1,1) PRIMARY KEY  NOT NULL,
	idDepartamento INT FOREIGN KEY REFERENCES dbo.Departamento(idDepartamento) NOT NULL,
	nombrePuesto VARCHAR(100) NOT NULL,
	salario MONEY NOT NULL CHECK(salario>=0)
);

/*idAdmin revisar foreign key*/
create table Sucursal(
	idSucursal int not null identity(1,1) primary key(idSucursal),
	idUbicacion int not null foreign key references Ubicacion(idUbicacion), 
	idAdministrador int,
	nombreSucursal varchar(50) not null,
	ubicacionG geography
);

CREATE TABLE MetodoPago(
	idMetodoPago INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombreMetodoPago VARCHAR(100) NOT null
);
CREATE TABLE Empleado(
	idEmpleado INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idPuesto INT FOREIGN KEY REFERENCES Puesto(idPuesto) NOT NULL,
	idSucursal INT FOREIGN KEY REFERENCES Sucursal(idSucursal) NOT NULL,
	idEstado INT FOREIGN KEY REFERENCES Estado(idEstado) NOT NULL,
	cedula bigint not null,
	nombreEmpleado VARCHAR(100) NOT NULL,
	apellido1 VARCHAR(100) NOT NULL,
	apellido2 VARCHAR(100) NOT NULL,
	fechaContratacion DATE NOT NULL,
	fechaNacimiento DATE NOT NULL,
	correo VARCHAR(50) NOT NULL,
	foto varbinary(max) --por ahora puede ser null hasta que veamos como agregar la imagen.
	--https://www.sqlshack.com/upload-multiple-images-sql-server/
);
CREATE TABLE Bono(
	idBono INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	idEmpleado INT FOREIGN KEY REFERENCES Empleado(idEmpleado) NOT NULL,
	cantidadBono MONEY NOT NULL CHECK(cantidadBono>=0),
	fechaBono SMALLDATETIME NOT null
);
create table Horario(
	idHorario int not null identity(1,1) primary key(idHorario), 
	horaApertura time not null,
	horaCierre time not null,
	dia varchar(1) not null
);
create table HorarioXSucursal(
	idHorarioXSucursal int not null identity(1,1) primary key(idHorarioXSucursal),
	idHorario int not null foreign key(idHorario) references Horario(idHorario),
	idSucursal int not null foreign key(idSucursal) references Sucursal(idSucursal)
);
create table Cliente(
	idCliente int not null identity(1,1) primary key(idCliente),
	idEstado int not null foreign key(idEstado) references Estado(idEstado),
	cedula bigint not null,
	nombre varchar(50) not null,
	apellido1 varchar(50) not null,
	apellido2 varchar(50) not null,
	fechaNacimiento date not null,
	correo varchar(50) not null,
	celular varchar(20) not null
);
create table Categoria(
	idCategoria int not null identity(1,1) primary key (idCategoria),
	nombre varchar(50) not null,
	descripcion varchar(150) not null
);
create table Impuesto(
	idImpuesto int not null identity(1,1) primary key(idImpuesto), 
	porcentaje float not null check(porcentaje>=0)
);
/*A producto hay que ponerle el array en las fotos*/
create table Producto(
	idProducto int not null identity(1,1) primary key(idProducto),
	idCategoria int not null foreign key(idCategoria) references Categoria(idCategoria),
	nombre varchar(50) not null,  
	descripcion varchar(150) not null,
	precio money not null check(precio>=0)
);

create table Fotos(
	idFoto int not null identity(1,1) primary key(idFoto),
	idProducto int not null foreign key(idProducto) references Producto(idProducto),
	foto varbinary(max)
);

create table ProductoXImpuesto(
	idProductoXImpuesto int not null identity(1,1) primary key(idProductoXImpuesto),
	idProducto int not null foreign key(idProducto) references Producto(idProducto),
	idImpuesto int not null foreign key(idImpuesto) references Impuesto(idImpuesto)
);

create table Pedido(
	idPedido    int primary key not null identity(1,1),
	idSucursal  int foreign key references Sucursal(idSucursal) not null,
	idProveedor int ,--agregar check para validar que existe proveedor en postgresql
	idEstado    int foreign key references Estado(idEstado) not null,
	idProducto  int foreign key references Producto(idProducto) not null,
	fechaSolicitud datetime not null,
	fechaRecibido datetime, 
	cantidad int not null check(cantidad>=0) --Del producto
);

create table LoteProducto(
	idLote int not null identity(1,1) primary key(idLote),
	idPedido int not null foreign key(idPedido) references Pedido(idPedido),
	fechaProduccion date not null,
	fechaExpiracion date not null,
	cantidad int not null check(cantidad>=0),
	costoLote money not null check(costoLote>=0),
	porcentajeGanancia float check(porcentajeGanancia>=0)
);
create table Unidad(
	idUnidad int not null identity(1,1) primary key(idUnidad),
	idLote int not null foreign key(idLote) references LoteProducto(idLote),
	idEstado int not null foreign key(idEstado) references Estado(idEstado)
);
create table Inventario(
	idInventario int not null identity(1,1) primary key(idInventario),
	idProducto int not null foreign key (idProducto) references Producto(idProducto),
	idSucursal int not null foreign key (idSucursal) references Sucursal(idSucursal),
	cantidad int not null check(cantidad>=0),
	minimo int not null check(minimo>=0),  
	maximo int not null check(maximo>=0)
);
create table Descuento(
	idDescuento int not null identity(1,1) primary key(idDescuento),
	idLote int not null foreign key(idLote) references LoteProducto(idLote),
	porcentaje float not null check(porcentaje>=0)
);

create table Factura(
	idFactura int primary key not null identity(1,1),
	idSucursal int foreign key references Sucursal(idSucursal) not null,
	idCliente  int foreign key references Cliente(idCliente) not null,
	idEmpleado int foreign key references Empleado(idEmpleado) not null, 
	idMetodoPago int foreign key references MetodoPago(idMetodoPago) not null,
	total money not null, 
	fechaFactura datetime not null
);
create table Envio(
	idEnvio int not null identity(1,1) primary key(idEnvio),
	idFactura int not null foreign key(idFactura) references Factura(idFactura),
	idEstado int not null foreign key (idEstado) references Estado(idEstado),
	costoEnvio money not null check(costoEnvio>=0), 
	fechaEnvio date,
	ubicacionG geography
);
create table Detalle(
	idDetalle int primary key not null identity(1,1),
	idUnidad int foreign key references Unidad(idUnidad) not null,
	idFactura int foreign key references Factura(idFactura) not null,
	subTotal money not null check(subTotal>=0.0), 
);	
                                                
create table UsuarioEmpleado(idUsuarioEmpleado int primary key not null identity(1,1),
idEmpleado int foreign key references Empleado(idEmpleado)not null,
contrasenna varchar(30) not null );

create table UsuarioCliente(idUsuarioCliente int primary key not null identity(1,1),
idCliente int foreign key references Cliente(idCliente)not null,
contrasenna varchar(30) not null );




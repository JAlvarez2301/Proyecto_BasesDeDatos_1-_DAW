CREATE DATABASE ProyectoFinalJavierAlvarez;

USE ProyectoFinalJavierAlvarez;

/* Creamos las tablas de la base de datos */

CREATE TABLE Empleados (
    IDEmpleado int NOT NULL PRIMARY KEY,
    NumeroDeVentas int,
    Nombre varchar(255),
    Apellidos varchar(255),
    Telefono varchar(255),
    DNI varchar(255),
    Nacionalidad varchar(255),
    HorasTrabajadas int,
    SueldoMensual int,
    SueldoAnual int,
    FechaNacimiento date
);

CREATE TABLE Productos(
IDProducto int NOT NULL PRIMARY KEY,
CodigoBarras int NOT NULL,
TipoProducto varchar(255),
ColorProducto varchar(255),
TamañoProducto varchar(255),
Forma varchar(255),
Distribuidor varchar(255),
UnidadesVenidas int,
NacionalidadOrigen varchar(255),
IDPedido int
);


CREATE TABLE Pedidos (
IDPedido int NOT NULL PRIMARY KEY,
Distribuidor varchar(255),
LugarOrigen  varchar(255),
Peso double,
Tamaño varchar(255),
MaterialCaja varchar(255),
PrecioPedido double,
TipoEnvio varchar(255),
IDEmpleado int
);


CREATE TABLE Clientes (
IDCliente int NOT NULL PRIMARY KEY,
Nombre varchar(255),
Apellidos varchar(255),
Telefono varchar(255),
DNI varchar(255),
ProductoFavorito varchar(255),
EmpleadoFavorito varchar(255),
NumeroDePedidos int,
FechaDeNacimiento date,
Nacionalidad  varchar(255),
DineroGastado int,
IDEmpleado int
);


CREATE TABLE Direcciones(
Calle  varchar(255),
Numero int,
CodigoPostal int,
Ciudad varchar(255),
Provincia varchar(255),
IDCliente int
);


CREATE TABLE Stock(
Stock int,
IDPedido int,
IDProducto int
);

/* Ahora vamos a establecer las FOREIGN KEYS */

ALTER TABLE Stock
ADD FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido);

ALTER TABLE Stock
ADD FOREIGN KEY (IDProducto) REFERENCES Productos(IDProducto);

ALTER TABLE Clientes
ADD FOREIGN KEY (IDEmpleado) REFERENCES Empleados(IDEmpleado);

ALTER TABLE Pedidos
ADD FOREIGN KEY (IDEmpleado) REFERENCES Empleados(IDEmpleado);

ALTER TABLE Productos 
ADD FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido);

ALTER TABLE Direcciones
ADD FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente);


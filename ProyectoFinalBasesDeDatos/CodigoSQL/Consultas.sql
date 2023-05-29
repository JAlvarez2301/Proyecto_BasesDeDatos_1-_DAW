-- Te devuelve los 5 Clientes y Empleados más jóvenes

SELECT Clientes.Nombre AS NombreCliente, Clientes.Apellidos AS ApellidosCliente, Clientes.FechaDeNacimiento AS FechaNacimientoCliente,
Empleados.Nombre AS NombreEmpleado, Empleados.Apellidos AS ApellidosEmpleado, Empleados.FechaNacimiento AS FechaNacimientoEmpleado
FROM CLIENTES
INNER JOIN Empleados ON Clientes.IDEmpleado = Empleados.IDEmpleado
ORDER BY FechaNacimientoCliente, FechaNacimientoEmpleado DESC
LIMIT 5;

-- Consulta los tres empleados que más han trabajado

Select *
From Empleados
ORDER BY HorasTrabajadas DESC
LIMIT 3;



-- Muestra cuantos envíos de cada tipo se han realizado

SELECT Count(Pedidos.TipoEnvio) as NumeroDeEnvios,Pedidos.TipoEnvio
FROM Pedidos
INNER JOIN Productos
ON Pedidos.IDPedido = Productos.IDPedido
GROUP BY Pedidos.TipoEnvio;

-- Mostará el número de ventas de cada empleado, el nombre y el distribuidor

SELECT  Empleados.NumeroDeVentas, Empleados.Nombre, Productos.Distribuidor
FROM Empleados INNER JOIN Pedidos
ON Empleados.IDEmpleado = Pedidos.IDEmpleado
INNER JOIN Productos
ON Pedidos.IDPedido = Productos.IDPedido
GROUP BY  Empleados.NumeroDeVentas, Empleados.Nombre, Productos.Distribuidor
ORDER BY Productos.Distribuidor ASC;


-- Consulta los tres empleados con más sueldo anual

Select *
From Empleados
ORDER BY SueldoAnual DESC
LIMIT 3;

-- Te devuelve las direcciones de cada cliente
-- Usamos producto cartesiano

SELECT Clientes.Nombre, Clientes.Apellidos,  Direcciones.Calle, Direcciones.Numero, Direcciones.CodigoPostal, Direcciones.Ciudad
FROM Clientes, Direcciones
WHERE Clientes.IDCliente = Direcciones.IDCliente;

-- TOP Clientes que más dinero se han gastado

SELECT *
FROM Clientes
ORDER BY DineroGastado
LIMIT 3;

-- Tipo de Envío realizado por cada empleado por orden alfabético

SELECT Pedidos.TipoEnvio, Empleados.Nombre
FROM Empleados INNER JOIN Pedidos
ON Empleados.IDEmpleado = Pedidos.IDEmpleado
INNER JOIN Productos
ON Pedidos.IDPedido = Productos.IDPedido
ORDER BY Empleados.Nombre;

-- Selecciona los tres productos con más stock
Select *
From Stock
order by stock DESC
LIMIT 3;



-- Los tres productos más vendidos
SELECT  Productos.TipoProducto, Productos.UnidadesVenidas
FROM Pedidos
INNER JOIN Productos ON Pedidos.IDPedido = Productos.IDPedido
GROUP BY Productos.TipoProducto, Productos.UnidadesVenidas
ORDER BY Productos.UnidadesVenidas DESC
LIMIT 3;

-- Consulta todas las horas trabajadas por los empleados
SELECT Sum(HorasTrabajadas)
FROM Empleados;

-- Cantidad total de productos vendidos, Peso total de los paquetes enviados y número de empleados de la empresa
SELECT sum(Productos.UnidadesVenidas) as NdeVentas, sum(Pedidos.Peso) as PesoTotal, count(Empleados.IDEmpleado) as TotalEmpelados
FROM Empleados
INNER JOIN Pedidos
ON Empleados.IDEmpleado = Pedidos.IDEmpleado
INNER JOIN Productos
ON Pedidos.IDPedido = Productos.IDPedido;

-- TOP 5 Clientes que más media de gasto tienen, ventas medias por empleado y ventas medias entre todos los empleados y nacionalidad de origen de los productos
SELECT AVG(Clientes.DineroGastado) as MediaGastoClientes, AVG(Empleados.NumeroDeVentas) as MediaVentasEmpleados, Productos.NacionalidadOrigen
FROM Clientes
INNER JOIN Empleados
ON Clientes.IDEmpleado = Empleados.IDEmpleado
INNER JOIN Pedidos
ON Empleados.IDEmpleado = Pedidos.IDEmpleado
INNER JOIN Productos
ON Pedidos.IDPedido = Productos.IDPedido
GROUP BY Productos.NacionalidadOrigen
ORDER BY MediaGastoClientes DESC
LIMIT 5;













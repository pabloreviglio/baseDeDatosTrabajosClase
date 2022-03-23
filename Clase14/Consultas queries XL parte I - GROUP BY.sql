SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- Consignas
-- Clientes
-- 1) ¿Cuántos clientes existen?
SELECT count(ClienteID) From clientes;
-- 2) ¿Cuántos clientes hay por ciudad?
SELECT Ciudad, count(ClienteID) From clientes GROUP BY Ciudad; 
-- Facturas
-- 1) ¿Cuál es el total de transporte?
SELECT SUM(Transporte) FROM facturas;
-- 2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT NombreEnvio, SUM(Transporte) FROM facturas GROUP BY EnvioVia;
-- 3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
-- cantidad de facturas.
SELECT Compania, count(FacturaID) FROM facturas f JOIN clientes c ON f.ClienteID = c.ClienteID   GROUP BY f.ClienteID ORDER BY count(FacturaID) DESC;
-- 4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
SELECT  Compania, count(FacturaID) FROM facturas f JOIN clientes c ON f.ClienteID = c.ClienteID   GROUP BY f.ClienteID ORDER BY count(FacturaID) DESC limit 5;
-- 5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
SELECT count(ClienteID), PaisEnvio FROM facturas GROUP by PaisEnvio ORDER BY COUNT(ClienteID) ASC ;
-- 6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
-- realizó más operaciones de ventas 
SELECT EmpleadoID, Count(EmpleadoID) FROM facturas GROUP BY EmpleadoID  ORDER BY COUNT(EmpleadoID) DESC LIMIT 1 ;
-- Factura detalle
-- 1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
SELECT count(f.ProductoID), ProductoNombre FROM productos p JOIN facturadetalle f on f.ProductoID = p.ProductoID group by f.ProductoID order by count(f.ProductoID) desc limit 1;
-- 2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
-- cantidad por precio unitario.
SELECT sum(Cantidad * PrecioUnitario) totalFacturado FROM facturadetalle ;
-- 3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?
SELECT sum(Cantidad * PrecioUnitario) totalFacturado FROM facturadetalle WHERE ProductoID BETWEEN 30 AND 50;
-- 4) ¿Cuál es el precio unitario promedio de cada producto?
SELECT ProductoID, AVG(PrecioUnitario) FROM facturadetalle GROUP BY ProductoID ORDER BY ProductoID;
-- 5) ¿Cuál es el precio unitario máximo?
SELECT MAX(PrecioUnitario)FROM facturadetalle  ORDER BY PrecioUnitario DESC;
-- Consultas queries XL parte II - JOIN
-- En esta segunda parte vamos a intensificar la práctica de consultas con JOIN.
-- 1) Generar un listado de todas las facturas del empleado 'Buchanan'.

-- 2) Generar un listado con todos los campos de las facturas del correo 'Speedy
-- Express'.

-- 3) Generar un listado de todas las facturas con el nombre y apellido de los
-- empleados.

-- 4) Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío
-- “USA”.

-- 5) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
-- “Leverling” o que incluyan el producto id = “42”.

-- 6) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
-- “Leverling” y que incluya los producto id = “80” o ”42”.

-- 7) Generar un listado con los cinco mejores clientes, según sus importes de
-- compras total (PrecioUnitario * Cantidad) 

-- 8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente,
-- fecha de factura, país de envío, Total, ordenado de manera descendente por
-- fecha de factura y limitado a 10 filas.

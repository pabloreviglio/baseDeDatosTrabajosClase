-- 1) Queremos tener un listado de todas las categorías.
select CategoriaNombre from categorias;
-- 2) Cómo las categorías no tienen imágenes, Solamente interesa obtener un
-- listado de CategoriaNombre y Descripcion.
select CategoriaID,Descripcion from categorias;
-- 3) Obtener un listado de los productos.
select ProductoNombre from productos;
-- 4) ¿Existen productos discontinuados? (Discontinuado = 1).
select ProductoNombre from productos where Discontinuado = 1;
-- 5) Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son
-- los que nos provee?
select ProductoNombre from productos where ProveedorID =8;
-- 6) Queremos conocer todos los productos cuyo precio unitario se encuentre
-- entre 10 y 22.
select ProductoNombre from productos where PrecioUnitario between 10 and 22;
-- 7) Se define que un producto hay que solicitarlo al proveedor si sus
-- Unidades en stock son menores al Nivel de Reorden. ¿Hay productos por
-- solicitar?
select ProductoNombre from productos where UnidadesStock < NivelReorden;
-- 8) Se quiere conocer todos los productos del listado anterior pero que
-- Unidades pedidas sea igual a cero.
select ProductoNombre from productos where UnidadesStock < NivelReorden and UnidadesPedidas = 0;
-- Clientes
-- 1) Obtener un listado de todos los clientes con Contacto, Compania, Título,
-- País. Ordenar el listado por País.
select Contacto, Compania, Titulo, Pais  from clientes;
-- 2) Queremos conocer a todos los clientes que tengan un título “Owner”.
select Compania from clientes where Titulo = 'Owner';
-- 3) El operador telefónico que atendió a un cliente, no recuerda su nombre.
-- Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
-- todos los contactos que inician con C?
select Contacto from clientes where Contacto like 'c%';
-- Facturas
-- 1) Obtener un listado de todas las facturas, ordenado por fecha de factura
-- ascendente.
select FacturaID from  facturas order by FechaFactura desc;
-- 2) Ahora se requiere un listado de las facturas con el país de envío “USA” y
-- que su correo (EnvioVia) sea distinto de 3.
select FacturaID from facturas where PaisEnvio = "USA" and EnvioVia != 3; 
-- 3) ¿El cliente 'GOURL' realizó algún pedido?
select FacturaID from facturas where NombreEnvio = 'GOURL';
-- 4) Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
select FacturaID from facturas where EmpleadoID in (2, 3, 5, 8, 9);
-- Consultas Queries ML Parte II
-- En esta segunda parte vamos a intensificar la práctica de consultas SELECT,
-- añadiendo ALIAS, LIMIT, y OFFSET.
-- Productos
-- 1) Obtener el listado de todos los productos ordenados descendentemente
-- por Precio Unitario.
select ProductoNombre from productos order by PrecioUnitario desc;
-- 2) Obtener el listado de TOP 5 de Productos cuyo Precio Unitario es el más
-- “Caro”.
select ProductoNombre from productos  order by PrecioUnitario limit 5;
-- 3) Obtener un top 10 de los productos con más unidades en Stock.
select ProductoNombre from productos  order by UnidadesStock limit 10;
-- FacturaDetalle
-- 1) Obtener un listado de FacturaID, Producto, Cantidad.
select FacturaID, ProductoID, Cantidad from facturadetalle; 
-- 2) Ordenar el listado anterior por Cantidad descendentemente.
select FacturaID, ProductoID, Cantidad from facturadetalle order by Cantidad desc;
-- 3) Filtrar el listado solo para aquellos productos donde la cantidad se
-- encuentre entre 50 y 100.
select FacturaID, ProductoID, Cantidad from facturadetalle where Cantidad between 50 and 100 order by Cantidad desc;
-- 4) En otro listado nuevo, obtener un listado con los siguientes nombres de
-- columnas: NroFactura (FacturaID), Producto (ProductoID), Total
-- (PrecioUnitario*Cantidad)
select FacturaID, ProductoID, PrecioUnitario*Cantidad from facturadetalle;
-- ¡Extras!
-- ¿Te sobró tiempo? ¿Querés seguir practicando?
-- Te dejamos unos ejercicios extras a partir de la misma base:
-- 1) Obtener un listado de todos los clientes que viven en “Brazil" o “Mexico” o
-- que tengan un título que empiece con “Sales”.
select Compania from clientes where Pais = 'Brazil' or 'Mexico' and Titulo like 'sales%' ;
-- 2) Obtener un listado de todos los clientes que pertenecen a una compañía
-- que empiece "A".
select Compania from clientes where Compania like 'A%' ;
-- 3) Obtener un listado con los datos: Ciudad,Contacto y renombrarlo como
-- Apellido y Nombre, Titulo y renombrarlo como Puesto, de todos los
-- clientes que sean de la ciudad "Madrid".
select Ciudad as Apellido , Contacto as Nombre, Titulo as Puesto from clientes where Ciudad = 'Madrid';
-- 4) Obtener un listado de todas las facturas con ID entre 10000 y 10500
select FacturaID from facturas where FacturaID between 10000 and 10500;
-- 5) Obtener un listado de todas las facturas con ID entre 10000 y 10500 o de
-- los clientes con ID que empiecen con “B”.
select FacturaID from facturas where FacturaID between 10000 and 10500 or ClienteID like'B%';
-- 6) ¿Existen Facturas que la ciudad de envío “Vancouver” o que utilicen el
-- correo 3?
select FacturaID from facturas where CiudadEnvio = 'Vancouver'or EnvioVia = 3;
-- 7) ¿Cuál es el id de empleado de “Buchanan”?
select EmpleadoID from empleados where Apellido ='Buchanan';
-- 8) ¿Existen Facturas con EmpleadoID del empleado del ejercicio anterior?
-- (No relacionar sino verificar que existan facturas)
select FacturaID from facturas where EmpleadoID = 5;

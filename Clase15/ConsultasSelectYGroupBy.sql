SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- Consultas SELECT y GROUP BY
-- Realizar los siguientes informes:
-- 1. Listar las canciones cuya duración sea mayor a 2 minutos.
SELECT * FROM canciones WHERE milisegundos > 120000;
-- 2. Listar las canciones cuyo nombre comience con una vocal.
SELECT nombre FROM canciones WHERE nombre LIKE "a%" or nombre LIKE "e%" or nombre LIKE "i%" or nombre LIKE "o%" or nombre LIKE "U%";
-- 3. Listar las canciones ordenadas por compositor en forma descendente.
-- Luego, por nombre en forma ascendente. Incluir únicamente aquellas
-- canciones que tengan compositor.
SELECT compositor, nombre FROM canciones ORDER BY compositor DESC;
SELECT compositor, nombre FROM canciones WHERE compositor != "" ORDER BY nombre ASC ;
-- 4. a) Listar la cantidad de canciones de cada compositor.
SELECT compositor, COUNT(id) cantidadDeCanciones FROM canciones GROUP BY compositor;
-- b) Modificar la consulta para incluir únicamente los compositores que
-- tengan más de 10 canciones.
SELECT compositor, COUNT(id) cantidadDeCanciones FROM canciones GROUP BY compositor HAVING COUNT(id)>10;
-- 5. a) Listar el total facturado agrupado por ciudad.
SELECT ciudad_de_facturacion, SUM(total) FROM facturas GROUP BY ciudad_de_facturacion;
-- b) Modificar el listado del punto (a) mostrando únicamente las ciudades
-- de Canadá.
SELECT ciudad_de_facturacion, SUM(total) FROM facturas WHERE pais_de_facturacion = "Canada" GROUP BY ciudad_de_facturacion ;
-- c) Modificar el listado del punto (a) mostrando únicamente las ciudades
-- con una facturación mayor a 38.
SELECT ciudad_de_facturacion, SUM(total) FROM facturas GROUP BY ciudad_de_facturacion HAVING SUM(total)>38;
-- d) Modificar el listado del punto (a) agrupando la facturación por país, y
-- luego por ciudad.
SELECT pais_de_facturacion, ciudad_de_facturacion, SUM(total) FROM facturas GROUP BY pais_de_facturacion, ciudad_de_facturacion;
-- 6. a) Listar la duración mínima, máxima y promedio de las canciones.;
SELECT MIN(milisegundos), MAX(milisegundos), AVG(milisegundos) FROM canciones;
-- b) Modificar el punto (a) mostrando la información agrupada por género.
SELECT MIN(milisegundos), MAX(milisegundos), AVG(milisegundos) FROM canciones GROUP BY id_genero;


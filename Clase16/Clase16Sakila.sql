-- Reportes parte 1:
-- 1. Obtener el nombre y apellido de los primeros 5 actores disponibles. Utilizar
-- alias para mostrar los nombres de las columnas en español.

SELECT first_name nombre, last_name apellido FROM actor LIMIT 5;

-- 2. Obtener un listado que incluya nombre, apellido y correo electrónico de los
-- clientes (customers) inactivos. Utilizar alias para mostrar los nombres de las
-- columnas en español.

SELECT first_name,last_name,email FROM customer WHERE active=0; 

-- 3. Obtener un listado de films incluyendo título, año y descripción de los films
-- que tienen un rental_duration mayor a cinco. Ordenar por rental_duration de
-- mayor a menor. Utilizar alias para mostrar los nombres de las columnas en
-- español.

SELECT title titulo,release_year anioDeEstreno,description descripcion FROM film WHERE rental_duration > 5 ORDER BY rental_duration DESC;

-- 4. Obtener un listado de alquileres (rentals) que se hicieron durante el mes de
-- mayo de 2005, incluir en el resultado todas las columnas disponibles

SELECT *  FROM rental WHERE rental_date  BETWEEN "2005-05-01 00:00:00" AND "2005-05-31 23:59:59";

-- Reportes parte 2: Sumemos complejidad
-- 1. Obtener la cantidad TOTAL de alquileres (rentals). Utilizar un alias para
-- mostrarlo en una columna llamada “cantidad”.

SELECT COUNT(rental_id) 'cantidad total de alquileres'  FROM rental;

-- 2. Obtener la suma TOTAL de todos los pagos (payments). Utilizar un alias para
-- mostrarlo en una columna llamada “total”, junto a una columna con la
-- cantidad de alquileres con el alias “Cantidad” y una columna que indique el
-- “Importe promedio” por alquiler.

SELECT SUM(amount) total, Count(rental_id) Cantidad, AVG(amount) 'Importe promedio' FROM payment;

-- 3. Generar un reporte que responda la pregunta: ¿cuáles son los diez clientes
-- que más dinero gastan y en cuántos alquileres lo hacen?

SELECT cl.first_name, cl.last_name, SUM(pay.amount), COUNT(r.rental_id)       
FROM customer cl 
JOIN payment pay ON pay.customer_id=cl.customer_id 
JOIN rental r ON r.customer_id=pay.customer_id
GROUP BY cl.customer_id LIMIT 10;

-- 4. Generar un reporte que indique: ID de cliente, cantidad de alquileres y monto
-- total para todos los clientes que hayan gastado más de 150 dólares en
-- alquileres.

SELECT cl.customer_id, COUNT(r.rental_id) , SUM(pay.amount)
FROM customer cl 
JOIN payment pay ON pay.customer_id=cl.customer_id 
JOIN rental r ON r.customer_id=pay.customer_id
GROUP BY cl.customer_id HAVING SUM(pay.amount) > 150;


-- 5. Generar un reporte que muestre por mes de alquiler (rental_date de tabla
-- rental), la cantidad de alquileres y la suma total pagada (amount de tabla
-- payment) para el año de alquiler 2005 (rental_date de tabla rental).

SELECT COUNT(r.rental_id) , SUM(pay.amount), month(r.rental_date), year(r.rental_date)
FROM payment pay 
JOIN rental r ON r.rental_id=pay.rental_id
WHERE YEAR(r.rental_date) = '2005'
GROUP BY  MONTH(r. rental_date) ;--  HAVING YEAR(r.rental_date) = '2005';

-- 6. Generar un reporte que responda a la pregunta: ¿cuáles son los 5
-- inventarios más alquilados? (columna inventory_id en la tabla rental). Para
-- cada una de ellas indicar la cantidad de alquileres.

SELECT inventory_id, COUNT(rental_id) 'Cantidad de alquileres'
FROM rental
GROUP BY inventory_id
ORDER BY COUNT(rental_id) DESC LIMIT 5;


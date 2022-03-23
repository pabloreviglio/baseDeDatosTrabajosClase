SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- 1. Utilizando la base de datos de movies, queremos conocer, por un lado, los
-- títulos y el nombre del género de todas las series de la base de datos.
SELECT series.title, genres.name FROM genres,series;
-- 2. Por otro, necesitamos listar los títulos de los episodios junto con el nombre y
-- apellido de los actores que trabajan en cada uno de ellos.
SELECT series.title, episodes.title, actors.first_name, actors.first_name FROM episodes, actors, series ORDER BY series.title;
-- 3. Para nuestro próximo desafío, necesitamos obtener a todos los actores o
-- actrices (mostrar nombre y apellido) que han trabajado en cualquier película
-- de la saga de La Guerra de las galaxias.
SELECT   actors.first_name, actors.last_name FROM  actors ,movies WHERE  movies.title like 'La Guerra de las galaxias%';
-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por nombre de género
SELECT  genres.name, count(movies.id)  FROM movies, genres GROUP BY genres.name;

-- Consultas
-- Funciones de agregación, GROUP BY y HAVING
-- 1. ¿Cuántas películas hay?
SELECT SUM(id) FROM movies;
-- 2. ¿Cuántas películas tienen entre 3 y 7 premios?
SELECT title, awards FROM movies GROUP BY awards HAVING awards BETWEEN 3 AND 7;
-- 3. ¿Cuántas películas tienen entre 3 y 7 premios y un rating mayor a 7?
SELECT title, awards FROM movies WHERE rating >7 GROUP BY awards HAVING awards BETWEEN 3 AND 7;
-- 4. Crear un listado a partir de la tabla de películas, mostrar un reporte de la
-- cantidad de películas por id. de género.
SELECT  genres.id, count(movies.id)  FROM movies INNER JOIN  genres GROUP BY genres.id order by genres.id;
-- 5. De la consulta anterior, listar sólo aquellos géneros que tengan como suma
-- de premios un número mayor a 5.
SELECT  genres.id, count(movies.id)  FROM movies, genres WHERE awards >5 GROUP BY genres.id order by genres.id;




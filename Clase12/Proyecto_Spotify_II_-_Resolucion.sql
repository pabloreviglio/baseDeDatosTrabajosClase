-- CASO DE ESTUDIO: PROYECTO SPOTIFY II
-- Base de datos: proyecto_spotify

-- Línea de código para ejecutar cada vez que se agrega una nueva BD:
SET SQL_SAFE_UPDATES = 0; -- Esto permitirá realizar múltiples actualizaciones y eliminaciones sobre las tablas.


-- 1. Listar las canciones que poseen la letra Z en su título.
SELECT idCancion AS ID, titulo AS Cancion FROM cancion 
WHERE titulo LIKE '%z%';

-- 2. Listar las canciones que poseen como segundo caracter la letra ‘a’ y como último, la letra ‘s’.
SELECT idCancion AS ID, titulo FROM cancion 
WHERE titulo LIKE '_A%S';

-- 3. Mostrar la playlist que tiene más canciones, renombrando las columnas poniendo mayúsculas en la primera letra, los tildes correspondientes y agregar los espacios entre palabras.
SELECT idPlaylist AS 'ID Playlist', titulo AS 'Título', cantcanciones AS 'Cantidad De Canciones' FROM playlist 
ORDER BY cantcanciones DESC LIMIT 1;

-- 4. Listar los 10 usuarios más jóvenes (saltar los primeros 5 filas).
SELECT idUsuario AS 'ID Usuario', nombreusuario AS Usuario, fecha_nac AS 'Fecha de nacimiento' FROM usuario 
ORDER BY fecha_nac DESC LIMIT 10 OFFSET 5;

-- 5. Listar descendentemente las 5 canciones con más reproducciones.
SELECT idCancion AS 'ID Canción', titulo AS Canción, cantreproduccion AS 'Cantidad De reproducciones' FROM cancion 
ORDER BY cantreproduccion DESC LIMIT 5;

-- 6. Generar un reporte de todos los albumes ordenados alfabéticamente.
SELECT titulo FROM album 
ORDER BY titulo;

-- 7. Listar alfabéticamente todos los albumes que no tengan una imagen.
SELECT idAlbum AS 'ID Album', titulo AS Título, imagenportada AS 'Imagen de la portada' FROM album 
WHERE imagenportada IS NULL 
ORDER BY TITULO;

-- 8. Insertar un usuario nuevo, con los siguientes datos, tener en cuenta las relaciones:
	-- a.	nombreusuario: nuevousuariodespotify@gmail.com
	-- b.	Nombre y apellido: Elmer Gomez 
	-- c.	password: S4321m
	-- d.	Fecha de nacimiento: 15/11/1991
	-- e.	Sexo: Masculino
	-- f.	Código Postal: B4129ATF
	-- g.	País: Colombia 
INSERT INTO usuario VALUES
(20, 'nuevousuariodespotify@gmail.com', 'Elmer Gomez', '1991/11/15', 'M', 'B4129ATF', 'S4321m', '2', '1');

-- 9. Eliminar el género "pop" de aquellas canciones que lo contengan.
DELETE FROM generoxcancion WHERE IdGenero = 9;

-- 10. Editar todos los artistas que no tengan una imagen cargada y, asignar el texto "Imagen faltante" en la correspondiente columna.
UPDATE artista
SET imagen = 'IMAGEN FALTANTE'
WHERE imagen IS NULL;

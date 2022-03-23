SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- 1. Listar las canciones que poseen la letra “z” en su título.
select * from cancion where titulo like '%z%';
-- 2. Listar las canciones que poseen como segundo carácter la letra “a” y como último, la letra “s”.
select * from cancion where titulo like'_a%s';
-- 3. Mostrar la playlist que tiene más canciones, renombrando las columnas poniendo mayúsculas en la primera letra, los tildes correspondientes y agregar los espacios entre palabras.
select idPlaylist as 'Id Playlist'  , idusuario as 'Id Usuario',titulo as Titulo, cantcanciones as 'Cant Canciones', idestado as'Id Estado', Fechacreacion as 'Fecha creación', Fechaeliminada as 'Fecha eliminada' 
from playlist order by cantcanciones desc limit 1;
-- 4. En otro momento se obtuvo un listado con los 5 usuarios más jóvenes, obtener un listado de los 10 siguientes.
select * from usuario order by fecha_nac desc limit 5 OFFSET 10;
-- 5. Lisgeneroxcanciontar las 5 canciones con más reproducciones, ordenadas descendentemente.
select * from cancion order by cantreproduccion desc limit 5;
-- 6. Generar un reporte de todos los álbumes ordenados alfabéticamente.
select * from album order by titulo;
-- 7. Listar todos los álbumes que no tengan imagen, ordenados alfabéticamente.
select * from album where imagenportada = null order by titulo;
-- 8. Insertar un usuario nuevo con los siguientes datos (tener en cuenta las relaciones):
-- a. nombreusuario: nuevousuariodespotify@gmail.com
-- b. Nombre y apellido: Elmer Gomez
-- c. password: S4321m
-- d. Fecha de nacimiento: 15/11/1991
-- e. Sexo: Masculino
-- f. Código Postal: B4129ATF
-- g. País: Colombia
insert into usuario (idUsuario, nombreusuario, nyap, fecha_nac, sexo, CP, password, Pais_idPais, IdTipoUsuario) 
values (20, 'nuevousuariodespotify@gmail.com', 'Elmer Gomez', '1991-11-15', 'M', 'B4129ATF', 'S4321m', 2, 3);
-- 9. Eliminar todas las canciones de género “pop”.
delete from generoxcancion 
where IdGenero = 9;
-- 10. Editar todos los artistas que no tengan una imagen cargada y cargarles el texto “Imagen faltante” en la columna de imagen;
update artista  
set imagen = 'Imagen faltante' 
where imagen is null;





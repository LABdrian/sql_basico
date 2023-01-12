 SELECT li.titulo,
     CONCAT(au.nombre, ' ' , au.apellido )AS nombre_autor,
     li.fecha_creacion,
     li.autor_id
     FROM libros AS li
     INNER JOIN autores AS au ON li.autor_id = au.autor_id;


/*
LEFT JOIN toma como datos principales los de la tabla de la izquierda 
y la interseccion entre la tabla de la derecha y la de la izquierda
RIGHT JOIN es lo mismo pero con la tabla de la derecha 
*/
--caso 1 #
-- usuarios es la tabla 'a'
-- libros_usuarios es la tabla 'b'
 SELECT
    CONCAT(nombre, ' ', apellidos),
    libros_usuarios.libro_id
    FROM usuarios
    LEFT JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
    WHERE libros_usuarios.libro_id IS NOT NULL;

/*caso #2
usuarios es la tabla 'b'
libros usuarios es la tabla 'a'
*/
SELECT
    CONCAT(nombre, ' ', apellidos),
    libros_usuarios.libro_id
    FROM libros_usuarios
    RIGHT JOIN usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
    WHERE libros_usuarios.libro_id ;


/*
usuarios
libros_usuarios
libros
autores
*/

SELECT DISTINCT
CONCAT(usuarios.nombre, ' ', usuarios.apellidos )AS nomnbre_usuarios
FROM usuarios
INNER JOIN libros_usuarios ON usuarios.usuario_id = libros_usuarios.usuario_id
    AND DATE(libros_usuarios.fecha_creacion)= CURDATE()
INNER JOIN libros ON libros_usuarios.libro_id = libros.libro_id
INNER JOIN autores ON autores.autor_id = libros.autor_id; 

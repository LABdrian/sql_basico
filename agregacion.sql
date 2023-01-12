 SELECT CONCAT(nombre, " ", apellido)AS nombre_completo, " " AS email FROM autores
     UNION
 SELECT CONCAT(nombre, " ", apellidos)AS nombre_completo, email AS email FROM usuarios;

--consultas anidadas\subconsultas
SELECT CONCAT(nombre, ' ', apellido)AS nombre_completo
FROM autores
WHERE autor_id IN(
 SELECT
 autor_id
 FROM libros
 GROUP BY autor_id
 HAVING SUM(ventas)<(SELECT AVG(ventas)FROM libros));


 SELECT IF
 (
    EXISTS(SELECT libro_id FROM libros WHERE titulo = 'El hobbit'),
    'Disponible',
    'No disponible'
 ) AS mensaje;

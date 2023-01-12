DELIMITER //

CREATE PROCEDURE prestamos(usuario_id INT, libro_id INT, OUT cantidad INT)
BEGIN

SET cantidad = (SELECT stock FROM libros WHERE libros.libro_id = libro_id);

IF cantidad > 0 THEN

INSERT INTO libros_usuarios(libro_id,usuario_id)VALUES(libro_id,usuario_id);
UPDATE libros SET stock = stock - 1 WHERE libros.libro_id = libro_id;

SET cantidad = cantidad -1;

ELSE 

SELECT "No es posible realizar el prestamo" AS mensaje_error;

END IF;

END//

DELIMITER ;

/*
para llamar un procedure en el cliente de mysql se usa la siguiente sentencia
SELECT name FROM mysql.proc WHERE db = DATABASE() AND type = "PROCEDURE";
*/


-- para hacer un llamado a procedure < CALL (nombre del procedure) luego entre parentesis los argumentos();


-- PRCEDURE #2 CASE

DELIMITER //

CREATE PROCEDURE tipo_lector(usuario_id INT)
BEGIN

SET @cantidad = (SELECT COUNT(*) FROM libros_usuarios 
                WHERE libros_usuarios.usuario_id = usuario_id);

CASE
WHEN @cantidad > 20 THEN 
    SELECT "FANATICOX" AS mensaje;
WHEN @cantidad > 10 AND @cantidad < 20 THEN 
    SELECT "AFICIONADOX"AS mensaje;
WHEN @cantidad >5 AND @cantidad <10 THEN
    SELECT "PROMEDIOX" AS mensaje;
ELSE    
    SELECT "NUEVOX" AS mensaje;     
END CASE;

END //

DELIMITER ;

-- PRCEDURE #3 WHILE

DELIMITER //

CREATE PROCEDURE libros_azar()
BEGIN
SET @iteracion = 0;
WHILE @iteracion < 5 DO

SELECT libro_id, titulo FROM libros ORDER BY RAND() LIMIT 1;
SET @iteracion = @iteracion + 1;

END WHILE;

END //
DELIMITER ;

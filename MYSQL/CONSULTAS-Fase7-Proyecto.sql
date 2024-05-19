USE proyecto_peliculas; 


-- 1. **¿Qué géneros han recibido más premios Óscar?**

SELECT p.Genero, COUNT(*) AS premios
FROM peliculas AS p
INNER JOIN peliculas_generos pg ON p.pelicula_id = pg.pelicula_id
INNER JOIN generos AS g ON pg.genero_id= g.genero_id
INNER JOIN premios_oscar po ON p.Titulo = po.mejor_pelicula
GROUP BY p.Genero
ORDER BY premios DESC;   

-- otra prueba 
SELECT g.nombre_genero, COUNT(*) AS total_premios
FROM premios_oscar po
JOIN peliculas p ON po.mejor_pelicula = p.Titulo
JOIN peliculas_generos pg ON p.pelicula_id = pg.pelicula_id
JOIN generos g ON pg.genero_id = g.genero_id
GROUP BY g.nombre_genero
ORDER BY total_premios DESC;



-- 2. **¿Qué género es el mejor valorado en IMDB?**

SELECT g.nombre_genero, AVG(dp.puntuacion_IMDB) AS promedio_puntuacion
FROM detalles_peliculas dp
JOIN peliculas p ON dp.ID_IMDB = p.ID_IMDB
JOIN peliculas_generos pg ON p.pelicula_id = pg.pelicula_id
JOIN generos g ON pg.genero_id = g.genero_id
GROUP BY g.nombre_genero
ORDER BY promedio_puntuacion DESC
LIMIT 1; 



-- 3. **¿En qué año se estrenaron más películas?**

SELECT Anio, COUNT(*) AS total_peliculas
FROM peliculas
WHERE Tipo = 'Película'
GROUP BY Anio
ORDER BY total_peliculas DESC
LIMIT 1; 


-- 4. ### ¿En qué año se estrenaron más cortos?

SELECT Anio, COUNT(*) AS total_cortos
FROM peliculas
WHERE Tipo = 'Corto'
GROUP BY Anio
ORDER BY total_cortos DESC
LIMIT 1;


-- 5. ### ¿Cuál es la mejor serie valorada en IMDB?

SELECT p.Titulo, dp.Puntuacion_IMDb
FROM detalles_peliculas dp
JOIN peliculas p ON dp.ID_IMDB = p.ID_IMDB
WHERE p.Tipo = 'Serie'
ORDER BY CAST(dp.Puntuacion_IMDb AS DECIMAL(3, 1)) DESC
LIMIT 1;

-- 6. ### ¿Cuál es la película mejor valorada en IMDB?

SELECT Nombre, MAX(round( puntuacion_IMDB))
FROM detalles_peliculas
WHERE puntuacion_IMDB not like 'No encontrado'
ORDER BY puntuacion_IMDB DESC
LIMIT 1;

-- 7- ### ¿Qué actor/actriz ha recibido más premios?

-- Subconsulta para obtener el número máximo de premios recibidos
WITH max_premios AS (
    SELECT 
        MAX(total_premios) AS max_total_premios
    FROM (
        SELECT 
            nombre_actor, 
            COUNT(*) AS total_premios
        FROM (
            SELECT mejor_actor AS nombre_actor FROM proyecto_peliculas.premios_oscar
            UNION ALL
            SELECT mejor_actriz FROM proyecto_peliculas.premios_oscar
        ) AS actores_premiados
        GROUP BY nombre_actor
    ) AS premios_contados
)

-- Consulta principal para obtener los actores o actrices con el número máximo de premios
SELECT 
    nombre_actor, 
    total_premios
FROM (
    SELECT 
        nombre_actor, 
        COUNT(*) AS total_premios
    FROM (
        SELECT mejor_actor AS nombre_actor FROM proyecto_peliculas.premios_oscar
        UNION ALL
        SELECT mejor_actriz FROM proyecto_peliculas.premios_oscar
    ) AS actores_premiados
    GROUP BY nombre_actor
) AS premios_contados
WHERE total_premios = (SELECT max_total_premios FROM max_premios);



-- 8- ### ¿Hay algún actor/actriz que haya recibido más de un premio Óscar?

SELECT ganador, COUNT(*) AS total_premios
FROM (
    SELECT mejor_actor AS ganador FROM premios_oscar
    UNION ALL
    SELECT mejor_actriz AS ganador FROM premios_oscar
) AS premios
GROUP BY ganador
HAVING total_premios > 1;

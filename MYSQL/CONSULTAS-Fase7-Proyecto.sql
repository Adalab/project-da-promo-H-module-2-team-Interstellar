USE proyecto_peliculas; 



-- 1. **¿Qué géneros han recibido más premios Óscar?**

-- 2. **¿Qué género es el mejor valorado en IMDB?** 

-- 3. **¿En qué año se estrenaron más películas?** 

-- 4. **¿En qué año se estrenaron más cortos? **

-- 5. ** ¿Cuál es la película mejor valorada en IMDB? ** 

-- 6. ** ¿Qué actor/actriz ha recibido más premios? ** 

-- 7. ** ¿Hay algún actor/actriz que haya recibido más de un premio Óscar? **








-- 1. **¿Qué géneros han recibido más premios Óscar?**

-- Paso 1: Obtener todas las películas premiadas y contarlas
WITH peliculas_premiadas AS (
    SELECT mejor_pelicula AS titulo
    FROM proyecto_peliculas.premios_oscar
    UNION ALL
    SELECT mejor_director AS titulo
    FROM proyecto_peliculas.premios_oscar
    UNION ALL
    SELECT mejor_actor AS titulo
    FROM proyecto_peliculas.premios_oscar
    UNION ALL
    SELECT mejor_actriz AS titulo
    FROM proyecto_peliculas.premios_oscar
),

-- Paso 2: Contar los premios por película
premios_por_pelicula AS (
    SELECT 
        titulo,
        COUNT(*) AS total_premios
    FROM 
        peliculas_premiadas
    GROUP BY 
        titulo
)

-- Paso 3: Seleccionar las películas más premiadas
SELECT 
    titulo,
    total_premios
FROM 
    premios_por_pelicula
ORDER BY 
    total_premios DESC;
    
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 -- De las consultas anterior sacamos la tupla con la que saber qué películas han sido premiadas y a qué género pertenecen 

SELECT Titulo, Genero
FROM proyecto_peliculas.peliculas
WHERE Titulo IN (
    'A. Cuarón',
    'A. Lee',
    'S. Penn',
    'D. Day-Lewis',
    'H. Swank',
    'E. Stone',
    'F. McDormand',
    'Million Dollar Baby',
    'Crash',
    'The Departed',
    'No Country for Old Men',
    'Slumdog Millionaire',
    'The Hurt Locker',
    'The King''s Speech',
    'The Artist',
    'Argo',
    '12 Years a Slave',
    'Birdman or',
    'Spotlight',
    'Moonlight',
    'The Shape of Water',
    'Green Book',
    'Parasite',
    'Nomadland',
    'CODA',
    'Everything Everywhere All at Once',
    'Oppenheimer',
    'S. Mendes',
    'S. Soderbergh',
    'R. Howard',
    'R. Polanski',
    'P. Jackson',
    'C. Eastwood',
    'M. Scorsese',
    'J. Coen E. Coen',
    'D. Boyle',
    'K. Bigelow',
    'T. Hooper',
    'M. Hazanavicius',
    'A. G. Iñárritu',
    'D. Chazelle',
    'G. del Toro',
    'Bong J.',
    'C. Zhao',
    'J. Campion',
    'D. Kwan D. Scheinert',
    'C. Nolan',
    'K. Spacey',
    'R. Crowe',
    'D. Washington',
    'A. Brody',
    'American Beauty',
    'J. Foxx',
    'P. S. Hoffman',
    'F. Whitaker',
    'Gladiator',
    'J. Bridges',
    'C. Firth',
    'J. Dujardin',
    'M. McConaughey',
    'E. Redmayne',
    'L. DiCaprio',
    'C. Affleck',
    'G. Oldman',
    'R. Malek',
    'J. Phoenix',
    'A. Hopkins',
    'W. Smith',
    'B. Fraser',
    'C. Murphy',
    'A Beautiful Mind',
    'J. Roberts',
    'H. Berry',
    'N. Kidman',
    'C. Theron',
    'R. Witherspoon',
    'H. Mirren',
    'M. Cotillard',
    'K. Winslet',
    'S. Bullock',
    'N. Portman',
    'M. Streep',
    'J. Lawrence',
    'C. Blanchett',
    'J. Moore',
    'B. Larson',
    'Chicago',
    'The Lord of the Rings: The Return of the King',
    'O. Colman',
    'R. Zellweger',
    'J. Chastain',
    'M. Yeoh'
);




 


-- 2. **¿Qué género es el mejor valorado en IMDB?**  

-- Se ha calculado la media de las puntuaciones de las peliculas pertenecientes a cada genero

SELECT p.Genero, AVG(puntuacion_IMDB) AS promedio_puntuacion
FROM detalles_peliculas AS dp
INNER JOIN peliculas AS p ON p.ID_IMDB = dp.ID_IMDB
GROUP BY p.Genero;





-- 3. **¿En qué año se estrenaron más películas?**  

-- Agrupando por año, se ha calculado el nº de veces que aparece cada año en la lista total de peliculas

SELECT Anio, COUNT(Anio) AS total_peliculas
FROM peliculas 
WHERE Tipo = 'Movie'
GROUP BY Anio
ORDER BY total_peliculas DESC;




-- 4. ### ¿En qué año se estrenaron más cortos? 

-- Agrupando por año, se ha calculado el nº de veces que aparece cada año en la lista que hemos filtrado por tipo = "short"

SELECT Anio, COUNT(Anio) AS total_peliculas
FROM peliculas 
WHERE Tipo = 'Short'
GROUP BY Anio
ORDER BY total_peliculas DESC;





SELECT Nombre, MAX( round( puntuacion_IMDB))
FROM detalles_peliculas AS DP
INNER JOIN peliculas AS P
ON P.ID_IMDB = DP.ID_IMDB
WHERE puntuacion_IMDB not like 'No encontrado'
GROUP BY P.TIPO = 'MOVIE' 
ORDER BY puntuacion_IMDB DESC
LIMIT 1;

-- 5. ### ¿Cuál es la película mejor valorada en IMDB?    ----------------------------------

SELECT dp.ID_IMDB, dp.Nombre, dp.puntuacion_IMDB
FROM detalles_peliculas AS dp
INNER JOIN peliculas AS p ON p.ID_IMDB = dp.ID_IMDB
WHERE P.Tipo = "Movie" AND dp.puntuacion_IMDB not like 'No encontrado'
ORDER BY puntuacion_IMDB DESC
LIMIT 4;

/* CONCLUSION: Las primeras 3 peliculas constan como las mejor valoradas pero el numero de votos es muy bajo
Por lo que para ofrecer una respuesta mas realista hay que tener en cuenta la variable nº de votos, Por tanto:
la pelicula mejor valorada con una cantidad de votos significativa (mas de 2 mll.) sería "Origen"*/








-- 6. ### ¿Qué actor/actriz ha recibido más premios?   

-- Primero calculamos el nº maximo de premios que tienen los actores/actrices de la tabla 

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

-- Consulta principal ---> obtener los nombre de los actores o actrices con el número máximo de premios
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




-- 7. ### ¿Hay algún actor/actriz que haya recibido más de un premio Óscar? 

-- Contamos las veces que aparece cada ganador actor y actriz en la tabla correspondiente

SELECT ganador, COUNT(*) AS total_premios
FROM (
    SELECT mejor_actor AS ganador FROM premios_oscar
    UNION ALL
    SELECT mejor_actriz AS ganador FROM premios_oscar
) AS premios
GROUP BY ganador
HAVING total_premios > 1;


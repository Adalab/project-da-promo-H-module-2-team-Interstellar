## Fase 5: Creación de una Base de Datos

Para la Fase 5 del Proyecto CinemExtract, donde se necesita crear una base de datos SQL, la estructura debe ser capaz de almacenar y relacionar toda la información recopilada en las fases anteriores. Aquí te presento una posible estructura de la base de datos con las tablas y las relaciones necesarias:

### 1. Estructura de la Base de Datos

#### Tabla `Peliculas`
Almacena la información básica de cada película o corto.
- `id` (PK): Identificador único de la película.
- `nombre` (VARCHAR): Nombre de la película o corto.
- `año_estreno` (INT): Año de estreno.
- `mes_estreno` (INT): Mes de estreno.
- `tipo` (VARCHAR): Tipo (película o corto).

#### Tabla `Generos`
Almacena los géneros de las películas.
- `id` (PK): Identificador único del género.
- `nombre` (VARCHAR): Nombre del género.

#### Tabla `Peliculas_Generos`
Relación muchos a muchos entre películas y géneros.
- `pelicula_id` (FK): Referencia a la tabla `Peliculas`.
- `genero_id` (FK): Referencia a la tabla `Generos`.

#### Tabla `Detalles_Peliculas`
Almacena detalles adicionales de cada película.
- `pelicula_id` (PK, FK): Referencia a la tabla `Peliculas`.
- `puntuacion_imdb` (FLOAT): Puntuación en IMDB.
- `puntuacion_rt` (FLOAT): Puntuación en Rotten Tomatoes.
- `director` (VARCHAR): Director de la película.
- `guionistas` (VARCHAR): Guionistas de la película.
- `argumento` (TEXT): Resumen de la película.
- `duracion` (VARCHAR): Duración en minutos.

#### Tabla `Actores`
Almacena información de los actores.
- `id` (PK): Identificador único del actor.
- `nombre` (VARCHAR): Nombre del actor.
- `año_nacimiento` (INT): Año de nacimiento.
- `conocido_por` (TEXT): Películas o series conocidas.
- `ocupaciones` (TEXT): Ocupaciones del actor.
- `premios` (TEXT): Premios recibidos.

#### Tabla `Peliculas_Actores`
Relación muchos a muchos entre películas y actores.
- `pelicula_id` (FK): Referencia a la tabla `Peliculas`.
- `actor_id` (FK): Referencia a la tabla `Actores`.

#### Tabla `Premios_Oscar`
Almacena información de los premios Oscar.
- `año` (INT, PK): Año de la ceremonia.
- `fecha_ceremonia` (DATE): Fecha de la ceremonia.
- `mejor_pelicula` (VARCHAR): Mejor película.
- `mejor_director` (VARCHAR): Mejor director.
- `mejor_actor` (VARCHAR): Mejor actor.
- `mejor_actriz` (VARCHAR): Mejor actriz.

### 2. Inserción de Datos desde CSV

Para insertar los datos desde CSV a las tablas de la base de datos, primero debes asegurarte de que los CSV tengan el formato adecuado correspondiente a la estructura de las tablas. Aquí hay un ejemplo de cómo cargar datos desde CSV usando SQL:

#### Ejemplo de Código SQL para Cargar Datos

```sql
-- Crear las tablas

CREATE TABLE Peliculas (
    id VARCHAR(255) PRIMARY KEY,
    nombre VARCHAR(255),
    año_estreno INT,
    mes_estreno INT,
    tipo VARCHAR(50)
);

CREATE TABLE Generos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE Peliculas_Generos (
    pelicula_id VARCHAR(255),
    genero_id INT,
    FOREIGN KEY (pelicula_id) REFERENCES Peliculas(id),
    FOREIGN KEY (genero_id) REFERENCES Generos(id)
);

CREATE TABLE Detalles_Peliculas (
    pelicula_id VARCHAR(255) PRIMARY KEY,
    puntuacion_imdb FLOAT,
    puntuacion_rt FLOAT,
    director VARCHAR(255),
    guionistas TEXT,
    argumento TEXT,
    duracion VARCHAR(50),
    FOREIGN KEY (pelicula_id) REFERENCES Peliculas(id)
);

CREATE TABLE Actores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    año_nacimiento INT,
    conocido_por TEXT,
    ocupaciones TEXT,
    premios TEXT
);

CREATE TABLE Peliculas_Actores (
    pelicula_id VARCHAR(255),
    actor_id INT,
    FOREIGN KEY (pelicula_id) REFERENCES Peliculas(id),
    FOREIGN KEY (actor_id) REFERENCES Actores(id)
);

CREATE TABLE Premios_Oscar (
    año INT PRIMARY KEY,
    fecha_ceremonia DATE,
    mejor_pelicula VARCHAR(255),
    mejor_director VARCHAR(255),
    mejor_actor VARCHAR(255),
    mejor_actriz VARCHAR(255)
);

-- Cargar datos desde CSV

COPY Peliculas(id, nombre, año_estreno, mes_estreno, tipo)
FROM '/path/to/peliculas.csv'
DELIMITER ','
CSV HEADER;

COPY Generos(id, nombre)
FROM '/path/to/generos.csv'
DELIMITER ','
CSV HEADER;

COPY Peliculas_Generos(pelicula_id, genero_id)
FROM '/path/to/peliculas_generos.csv'
DELIMITER ','
CSV HEADER;

COPY Detalles_Peliculas(pelicula_id, puntuacion_imdb, puntuacion_rt, director, guionistas, argumento, duracion)
FROM '/path/to/detalles_peliculas.csv'
DELIMITER ','
CSV HEADER;

COPY Actores(id, nombre, año_nacimiento, conocido_por, ocupaciones, premios)
FROM '/path/to/actores.csv'
DELIMITER ','
CSV HEADER;

COPY Peliculas_Actores(pelicula_id, actor_id)
FROM '/path/to/peliculas_actores.csv'
DELIMITER ','
CSV HEADER;

COPY Premios_Oscar(año, fecha_ceremonia, mejor_pelicula, mejor_director, mejor_actor, mejor_actriz)
FROM '/path/to/premios_oscar.csv'
DELIMITER ','
CSV HEADER;
```

### 3. Realización de Consultas para Obtener Información (Fase 7)

Con los datos almacenados en la base de datos, puedes realizar consultas SQL para responder a las preguntas de la Fase 7. Aquí tienes algunos ejemplos:

#### Consultas Ejemplares

1. **¿Qué géneros han recibido más premios Óscar?**

```sql
SELECT g.nombre, COUNT(*) as premios
FROM Peliculas p
JOIN Peliculas_Generos pg ON p.id = pg.pelicula_id
JOIN Generos g ON pg.genero_id = g.id
JOIN Premios_Oscar po ON p.nombre = po.mejor_pelicula
GROUP BY g.nombre
ORDER BY premios DESC;
```

2. **¿Qué género es el mejor valorado en IMDB?**

```sql
SELECT g.nombre, AVG(dp.puntuacion_imdb) as promedio_imdb
FROM Peliculas p
JOIN Peliculas_Generos pg ON p.id = pg.pelicula_id
JOIN Generos g ON pg.genero_id = g.id
JOIN Detalles_Peliculas dp ON p.id = dp.pelicula_id
GROUP BY g.nombre
ORDER BY promedio_imdb DESC;
```

3. **¿En qué año se estrenaron más películas?**

```sql
SELECT año_estreno, COUNT(*) as cantidad
FROM Peliculas
WHERE tipo = 'Pelicula'
GROUP BY año_estreno
ORDER BY cantidad DESC;
```

4. **¿En qué año se estrenaron más cortos?**

```sql
SELECT año_estreno, COUNT(*) as cantidad
FROM Peliculas
WHERE tipo = 'Corto'
GROUP BY año_estreno
ORDER BY cantidad DESC;
```

5. **¿Cuál es la mejor serie valorada en IMDB?**

```sql
SELECT nombre, puntuacion_imdb
FROM Detalles_Peliculas dp
JOIN Peliculas p ON dp.pelicula_id = p.id
WHERE p.tipo = 'Serie'
ORDER BY puntuacion_imdb DESC
LIMIT 1;
```

6. **¿Cuál es la película mejor valorada en IMDB?**

```sql
SELECT nombre, puntuacion_imdb
FROM Detalles_Peliculas dp
JOIN Peliculas p ON dp.pelicula_id = p.id
WHERE p.tipo = 'Pelicula'
ORDER BY puntuacion_imdb DESC
LIMIT 1;
```

7. **¿Qué actor/actriz ha recibido más premios?**

```sql
SELECT nombre, COUNT(*) as cantidad_premios
FROM Actores
GROUP BY nombre
ORDER BY cantidad_premios DESC;
```

8. **¿Hay algún actor/actriz que haya recibido más de un premio Óscar?**

```sql
SELECT nombre, COUNT(*) as cantidad_premios
FROM Actores
WHERE premios LIKE '%Oscar%'
GROUP BY nombre
HAVING COUNT(*) > 1;
```



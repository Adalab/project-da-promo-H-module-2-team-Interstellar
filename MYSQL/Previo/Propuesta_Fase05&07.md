## Fase 5: Creación de una Base de Datos

Para la Fase 5 del Proyecto CinemExtract, donde se necesita crear una base de datos SQL, la estructura debe ser capaz de almacenar y relacionar toda la información recopilada en las fases anteriores. Aquí te presento una posible estructura de la base de datos con las tablas y las relaciones necesarias:

### 1. Estructura de la Base de Datos

#### Tabla `Peliculas`
Almacena la información básica de cada película o corto.
- `ID_Peliculas`: (PK): Identificador único de la película.
- `ID_IMDB` (VARCHAR): Identificador de las película en IMDB.
- `Tipo` (VARCHAR): Tipo (película o corto).
- `Titulo` (VARCHAR): Nombre de la película o corto.
- `Mes_estreno` (INT): Mes de estreno.
- `Año_estreno` (INT): Mes de estreno.


#### Tabla `Generos`
Almacena los géneros de las películas.
- `ID_Genero` (PK): Identificador único del género.
- `ID_Peliculas` (FK): Identificador único de la película.
- `Genero` (VARCHAR): Nombre del género.


#### Tabla `IMDB`
Almacena detalles adicionales de cada película.
- `ID_Peliculas` (PK FK): Referencia a la tabla `Peliculas`.
- `Puntuacion_IMDB` (FLOAT): Puntuación en IMDB.
- `Director` (VARCHAR): Director de la película.
- `Guionistas` (VARCHAR): Guionistas de la película.
- `Argumento` (TEXT): Resumen de la película.
- `Duracion` (VARCHAR): Duración en minutos.

### Tabla `Rotten_Tomatoes"
Almacena las puntuaciones de las películas.
- `ID_Tomato` (PK): Identificador único del género.
- `ID_Peliculas`(FK): Identificador único de películas.
- `Tomatometro`: Puntuación en Rotten Tomatoes.

#### Tabla `Actores`
Almacena información de los actores.
- `ID_Actor` (PK): Identificador único del actor.
- `Nombre` (VARCHAR): Nombre del actor.
- `Año_nacimiento` (INT): Año de nacimiento.
- `Conocido_por` (TEXT): Películas o series conocidas.
- `Ocupacion` (TEXT): Ocupaciones del actor.
- `Premios` (TEXT): Premios recibidos.

#### Tabla `Peliculas_Actores`
Relación muchos a muchos entre películas y actores.
- `ID_Peliculas` (FK): Referencia a la tabla `Peliculas`.
- `ID_Actor` (FK): Referencia a la tabla `Actores`.

#### Tabla `Premios_Oscar`
Almacena información de los premios Oscar.
- `Año` (INT, PK): Año de la ceremonia.
- `Fecha_ceremonia` (DATE): Fecha de la ceremonia.
- `Mejor_pelicula` (VARCHAR): Mejor película.
- `Mejor_director` (VARCHAR): Mejor director.
- `Mejor_actor` (VARCHAR): Mejor actor.
- `Mejor_actriz` (VARCHAR): Mejor actriz.

### 2. Inserción de Datos desde CSV

Para insertar los datos desde CSV a las tablas de la base de datos, primero debes asegurarte de que los CSV tengan el formato adecuado correspondiente a la estructura de las tablas. Aquí hay un ejemplo de cómo cargar datos desde CSV usando SQL:

Aquí tienes la corrección de la creación de tablas y los comandos de carga de datos desde CSV:

### 1. Estructura de la Base de Datos

#### Tabla `Peliculas`
```sql
CREATE TABLE Peliculas (
    ID_IMDB VARCHAR(255) PRIMARY KEY,
    Tipo VARCHAR(50),
    Titulo VARCHAR(255),
    Mes_estreno INT,
    Año_estreno INT
);
```

#### Tabla `Generos`
```sql
CREATE TABLE Generos (
    ID_Genero SERIAL PRIMARY KEY,
    Genero VARCHAR(50)
);
```

#### Tabla `Peliculas_Generos`
```sql
CREATE TABLE Peliculas_Generos (
    ID_IMDB VARCHAR(255),
    ID_Genero INT,
    FOREIGN KEY (ID_IMDB) REFERENCES Peliculas(ID_IMDB),
    FOREIGN KEY (ID_Genero) REFERENCES Generos(ID_Genero)
);
```

#### Tabla `IMDB`
```sql
CREATE TABLE IMDB (
    ID_IMDB VARCHAR(255) PRIMARY KEY,
    Puntuacion_IMDB FLOAT,
    Director VARCHAR(255),
    Guionistas TEXT,
    Argumento TEXT,
    Duracion VARCHAR(50),
    FOREIGN KEY (ID_IMDB) REFERENCES Peliculas(ID_IMDB)
);
```

#### Tabla `Rotten_Tomatoes`
```sql
CREATE TABLE Rotten_Tomatoes (
    ID_Tomato SERIAL PRIMARY KEY,
    Tomatometro FLOAT
);
```


#### Tabla `Actores`
```sql
CREATE TABLE Actores (
    ID_Actor SERIAL PRIMARY KEY,
    Nombre VARCHAR(255),
    Año_nacimiento INT,
    Conocido_por TEXT,
    Ocupacion TEXT,
    Premios TEXT
);
```

#### Tabla `Peliculas_Actores`
```sql
CREATE TABLE Peliculas_Actores (
    ID_IMDB VARCHAR(255),
    ID_Actor INT,
    FOREIGN KEY (ID_IMDB) REFERENCES Peliculas(ID_IMDB),
    FOREIGN KEY (ID_Actor) REFERENCES Actores(ID_Actor)
);
```

#### Tabla `Premios_Oscar`
```sql
CREATE TABLE Premios_Oscar (
    Año INT PRIMARY KEY,
    Fecha_ceremonia DATE,
    Mejor_pelicula VARCHAR(255),
    Mejor_director VARCHAR(255),
    Mejor_actor VARCHAR(255),
    Mejor_actriz VARCHAR(255)
);
```

### 2. Inserción de Datos desde CSV

Asegúrate de que los archivos CSV tengan el formato adecuado y que las columnas coincidan con las definidas en las tablas. Aquí están los comandos SQL corregidos para cargar datos desde CSV:

```sql
-- Cargar datos desde CSV

COPY Peliculas(ID_IMDB, Titulo, Tipo, Mes_estreno, Año_estreno)
FROM '/path/to/peliculas.csv'
DELIMITER ','
CSV HEADER;

COPY Generos(ID_Genero, Genero)
FROM '/path/to/generos.csv'
DELIMITER ','
CSV HEADER;


COPY Detalles_Peliculas(ID_IMDB, Puntuacion_IMDB, Puntuacion_Tomate, Director, Guionistas, Argumento, Duracion)
FROM '/path/to/detalles_peliculas.csv'
DELIMITER ','
CSV HEADER;

COPY Actores(ID_Actor, Nombre, Año_nacimiento, Conocido_por, Ocupacion, Premios)
FROM '/path/to/actores.csv'
DELIMITER ','
CSV HEADER;


COPY Premios_Oscar(Año, Fecha_ceremonia, Mejor_pelicula, Mejor_director, Mejor_actor, Mejor_actriz)
FROM '/path/to/premios_oscar.csv'
DELIMITER ','
CSV HEADER;
```

### 3. Realización de Consultas para Obtener Información (Fase 7)

#### Consultas Ejemplares

1. **¿Qué géneros han recibido más premios Óscar?**

```sql
SELECT g.Genero, COUNT(*) as premios
FROM Peliculas p
INNER JOIN Peliculas_Generos pg ON p.ID_IMDB = pg.ID_IMDB
INNER JOIN Generos g ON pg.ID_Genero = g.ID_Genero
INNER JOIN Premios_Oscar po ON p.Titulo = po.Mejor_pelicula
GROUP BY g.Genero
ORDER BY premios DESC;
```

2. **¿Qué género es el mejor valorado en IMDB?**

```sql
SELECT g.Genero, AVG(dp.Puntuacion_IMDB) as promedio_imdb
FROM Peliculas p
INNER JOIN Peliculas_Generos pg ON p.ID_IMDB = pg.ID_IMDB
INNER JOIN Generos g ON pg.ID_Genero = g.ID_Genero
INNER JOIN Detalles_Peliculas dp ON p.ID_IMDB = dp.ID_IMDB
GROUP BY g.Genero
ORDER BY promedio_imdb DESC;
```

3. **¿En qué año se estrenaron más películas?**

```sql
SELECT Año_estreno, COUNT(*) as cantidad
FROM Peliculas
WHERE Tipo = 'Pelicula'
GROUP BY Año_estreno
ORDER BY cantidad DESC;
```

4. **¿En qué año se estrenaron más cortos?**

```sql
SELECT Año_estreno, COUNT(*) as cantidad
FROM Peliculas
WHERE Tipo = 'Corto'
GROUP BY Año_estreno
ORDER BY cantidad DESC;
```

5. **¿Cuál es la mejor serie valorada en IMDB?**

```sql
SELECT p.Titulo, dp.Puntuacion_IMDB
FROM Detalles_Peliculas dp
INNER JOIN Peliculas p ON dp.ID_IMDB = p.ID_IMDB
WHERE p.Tipo = 'Serie'
ORDER BY dp.Puntuacion_IMDB DESC
LIMIT 1;
```

6. **¿Cuál es la película mejor valorada en IMDB?**

```sql
SELECT p.Titulo, dp.Puntuacion_IMDB
FROM Detalles_Peliculas dp
INNER JOIN Peliculas p ON dp.ID_IMDB = p.ID_IMDB
WHERE p.Tipo = 'Pelicula'
ORDER BY dp.Puntuacion_IMDB DESC
LIMIT 1;
```

7. **¿Qué actor/actriz ha recibido más premios?**

```sql
SELECT Nombre, COUNT(*) as cantidad_premios
FROM Actores
GROUP BY Nombre
ORDER BY cantidad_premios DESC;
```

8. **¿Hay algún actor/actriz que haya recibido más de un premio Óscar?**

```sql
SELECT Nombre, COUNT(*) as cantidad_premios
FROM Actores
WHERE Premios LIKE '%Oscar%'
GROUP BY Nombre
HAVING COUNT(*) > 1;
```


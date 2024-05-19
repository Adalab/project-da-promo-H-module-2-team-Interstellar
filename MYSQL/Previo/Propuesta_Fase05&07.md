### 1. Primera estructura de la Base de Datos (Que coincide con los CSVs)

#### Tabla `Peliculas`
```sql
CREATE TABLE Peliculas (
    Tipo VARCHAR(50),
    Genero VARCHAR(50),
    Titulo VARCHAR(255),
    Mes INT,
    Anio INT,
    ID_IMDB VARCHAR(255)
    PRIMARY KEY (Titulo, ID_IMDB)
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
    Titulo VARCHAR(255)
    Tomatometro FLOAT
    FOREIGN KEY (Titulo) REFERENCES Peliculas(Titulo)
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


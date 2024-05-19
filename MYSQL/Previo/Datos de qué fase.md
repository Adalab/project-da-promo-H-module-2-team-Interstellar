# **Extracción de Datos para CSV** 📂

Para crear y poblar la base de datos SQL, necesitamos extraer los datos de las diferentes fases del proyecto y guardarlos en archivos CSV. Aquí se detalla de qué fase se extraen los datos para cada tabla y cómo deben estar estructurados los CSV.

## **1. Tabla `Peliculas`**

**Datos extraídos de:** 
- **Fase 1: Extracción de Datos de API de MoviesDataset**

**Estructura del CSV:**
- `id`: Identificador único de la película.
- `nombre`: Nombre de la película o corto.
- `año_estreno`: Año de estreno.
- `mes_estreno`: Mes de estreno.
- `tipo`: Tipo (película o corto).

**Ejemplo de CSV:**
```csv
id,nombre,año_estreno,mes_estreno,tipo
abc123,Titanic,1997,12,Pelicula
abc456,Los Goonies,1985,6,Pelicula
```

## **2. Tabla `Generos`**

**Datos extraídos de:** 
- **Fase 1: Extracción de Datos de API de MoviesDataset**

**Estructura del CSV:**
- `id`: Identificador único del género.
- `nombre`: Nombre del género.

**Ejemplo de CSV:**
```csv
id,nombre
1,Drama
2,Comedy
3,Action
```

## **3. Tabla `Peliculas_Generos`**

**Datos extraídos de:** 
- **Fase 1: Extracción de Datos de API de MoviesDataset**

**Estructura del CSV:**
- `pelicula_id`: Referencia al identificador de la película.
- `genero_id`: Referencia al identificador del género.

**Ejemplo de CSV:**
```csv
pelicula_id,genero_id
abc123,1
abc123,2
abc456,1
```

## **4. Tabla `Detalles_Peliculas`**

**Datos extraídos de:** 
- **Fase 2: Extracción de Detalles de Películas con Selenium**

**Estructura del CSV:**
- `pelicula_id`: Referencia al identificador de la película.
- `puntuacion_imdb`: Puntuación en IMDB.
- `puntuacion_rt`: Puntuación en Rotten Tomatoes.
- `director`: Director de la película.
- `guionistas`: Guionistas de la película.
- `argumento`: Resumen de la película.
- `duracion`: Duración en minutos.

**Ejemplo de CSV:**
```csv
pelicula_id,puntuacion_imdb,puntuacion_rt,director,guionistas,argumento,duracion
abc123,7.8,89,James Cameron,"James Cameron","Un barco se hunde.",195
abc456,7.7,77,Richard Donner,"Chris Columbus, Steven Spielberg","Los Goonies buscan un tesoro.",114
```

## **5. Tabla `Actores`**

**Datos extraídos de:** 
- **Fase 3: Extracción de Detalles de Actores con Selenium**

**Estructura del CSV:**
- `id`: Identificador único del actor.
- `nombre`: Nombre del actor.
- `año_nacimiento`: Año de nacimiento.
- `conocido_por`: Películas o series conocidas.
- `ocupaciones`: Ocupaciones del actor.
- `premios`: Premios recibidos.

**Ejemplo de CSV:**
```csv
id,nombre,año_nacimiento,conocido_por,ocupaciones,premios
1,Adam Sandler,1966,"El aguador,Little Nicky,Un papá genial,El chico ideal","Reparto,Producción,Guion","American Comedy Awards, USA,Annie Awards"
2,Leonardo DiCaprio,1974,"Titanic,Inception,The Revenant","Reparto,Producción","Oscar,Golden Globe"
```

## **6. Tabla `Peliculas_Actores`**

**Datos extraídos de:** 
- **Fase 3: Extracción de Detalles de Actores con Selenium**

**Estructura del CSV:**
- `pelicula_id`: Referencia al identificador de la película.
- `actor_id`: Referencia al identificador del actor.

**Ejemplo de CSV:**
```csv
pelicula_id,actor_id
abc123,2
abc456,1
```

## **7. Tabla `Premios_Oscar`**

**Datos extraídos de:** 
- **Fase 4: Extracción de Tablas de los Premios Oscar con Beautiful Soup**

**Estructura del CSV:**
- `año`: Año de la ceremonia.
- `fecha_ceremonia`: Fecha de la ceremonia.
- `mejor_pelicula`: Mejor película.
- `mejor_director`: Mejor director.
- `mejor_actor`: Mejor actor.
- `mejor_actriz`: Mejor actriz.

**Ejemplo de CSV:**
```csv
año,fecha_ceremonia,mejor_pelicula,mejor_director,mejor_actor,mejor_actriz
1990,1990-03-26,Driving Miss Daisy,O. Stone,D. Day-Lewis,J. Tandy
1991,1991-03-25,Dances with Wolves,K. Costner,J. Irons,K. Bates

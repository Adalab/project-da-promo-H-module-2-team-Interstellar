# project-da-promo-H-module-2-team-Interstellar

**PROYECTO CINEMEXTRACT** :clapper:

**Explorando el Séptimo Arte a través de Datos y Tecnología**

**1. Resumen**
La plataforma de streaming BHO se encuentra en una búsqueda constante para mejorar la calidad de su contenido y la satisfacción de sus usuarios. Nuestro proyecto consiste en aplicar técnicas de análisis de datos para identificar cuáles son las películas y cortometrajes más populares y mejor valorados desde 2010 hasta la fecha. Esto ayudará a BHO a tomar decisiones informadas sobre qué contenido promocionar y destacar en su plataforma.

El objetivo es identificar las películas y cortos más populares en la plataforma BHO, basándonos en criterios como las calificaciones, el número de visualizaciones, y las reseñas de los usuarios. Analizar la evolución de las preferencias de los usuarios a lo largo de los años y determinar las tendencias en la industria cinematográfica. Proporcionar recomendaciones específicas para la promoción de contenido en las diferentes secciones de la plataforma

**Fase 1: Extracción de Datos de API de MoviesDataset**

En esta fase, usaremos la API de MoviesDataset, que contiene una gran cantidad de información sobre películas, incluyendo detalles como títulos, géneros, años de lanzamiento y más. Vuestra tarea será hacer solicitudes a esta API y extraer información relevante sobre las películas. En concreto tendreis que sacar la siguiente información:

- Películas desde el 2010 hasta la actualidad.

- Películas que pertenezcan a los siguientes géneros: Drama, Comedy, Action.

- De cada una de las películas tendreis que sacar la siguiente información:

- Tipo (si es corto o película).

- Nombre de la película o el corto.

- Año de estreno de la película o corto.

- Mes de estreno de la película o corto.

- Id de la película.

- La documentación a la API la encontrarás aquí.

NOTA: La información de la API deberá ser almacenada en una lista de tuplas. Cada tupla corresponderá a una película. Siguiendo el siguiente ejemplo:
```
Copy
[("Pelicula", "Titanic", 1997, 12, "abc123"), ("Pelicula", "Los Gonnies", 1985, 6, "abc456"), ...]
```
**Fase 2: Extracción de Detalles de Películas con Selenium**

Una vez que tengan una lista de películas de la API, el siguiente paso es obtener información más detallada sobre ellas. Utilizaras la herramienta de automatización web Selenium para navegar a sitios web de reseñas de películas (IMDB y Rotten Tomatoes) y extraer detalles como calificaciones, actores y directores. En concreto deberás extraer información sobre:

- Puntuacion de IMDB (en caso de que la tenga).

- Puntuación de Rotten Tomatoes (Tomatometer).

- Dirección (director/a o directore/as de cada película).

- Gionistas (de cada película).

- Argumento.

- Duración (en minutos).

- Nombre de la película

NOTA: La información de la API deberá ser almacenada en una lista de tuplas. Cada tupla corresponderá a una película. Siguiendo el siguiente ejemplo:


Copy
[(7.7, 77,  "Richard Donner", ["Chris ColumbusSteven", "Spielberg"], "Los Goonies son un grupo de amigos que viven en Goon Docks, Astoria, pero sus casas han sido compradas y van a ser demolidas. Sin embargo, vivirán su última aventura en busca de un tesoro que pueda salvar el barrio.", "Aventura", "1h 54min", "Los Gonnies"),  ...]


**Fase 3: Extracción de Detalles de Actores con Selenium**


El siguiente paso es extraer información detallada de los 10 principales actores de cada una de las películas extraidas en la fase 1 utilizando Selenium (desde la página e IMDB). Debereis solo tener en cuenta los 10 primeros actores de cada película o corto (en caso de que los haya)La información que deberás extraer es:

- Nombre.

- Año nacimiento.

- ¿Por qué es conocido?

- ¿Qué hace?

- Premios.

NOTA: La información de la API deberá ser almacenada en una lista de tuplas. Cada tupla corresponderá a una película. Siguiendo el siguiente ejemplo:


Copy
[("Adam Sadler", 1966, ["El aguador", "Little Nicky", "Un papá genial", "El chico ideal" ], ["Reparto", "Producción", "Guion"] , ["American Comedy Awards, USA", "Annie Awards"],   ),  
...]


**Fase 4: Extracción de Tablas de los Premios Oscar con Beautiful Soup**


En esta fase, trabajarán con la biblioteca Beautiful Soup para extraer información relevante de las tablas de los premios Oscar desde 2000. La tabla la encontrarás en el este link. La información que deberás sacar es:

- Fecha de la ceremonia.

- Mejor película.

- Mejor director.

- Mejor actor.

- Mejor actriz.

NOTA: La información de la API deberá ser almacenada en una lista de tuplas. Cada tupla corresponderá a una película. Siguiendo el siguiente ejemplo:


Copy
  [(1990, 'Driving Miss Daisy', 'O. Stone', "D. Day-Lewis",' J. Tandy' ),  ...]

  
**Fase 5: Creación de una Base de Datos**


Una vez que hayas reunido toda la información necesaria, es hora de pensar en la organización. Usando SQL debes pensar en la estructura que debe tener la BBDD para almacenar toda la información recopilada y crear todas las tablas y conexiones entre ellas.



**Fase 6: Inserción de Datos en la Base de Datos**


Una vez que tengas la estructura de la base de datos lista, debes insertar todos los datos en la BBDD diseñada en el paso anterior.



**Fase 7: Realización de Consultas para Obtener Información**


Con los datos almacenados en la base de datos, debes realizar consultas SQL para recuperar información específica. Las preguntas que deberás contestar son: podrán hacer consultas para encontrar películas con ciertas calificaciones, encontrar películas dirigidas por un director en particular o incluso obtener una lista de películas ganadoras de un premio Oscar en una categoría específica.

- ¿Qué géneros han recibido más premios Óscar?

- ¿Qué género es el mejor valorado en IMDB?

- ¿En que año se estrenaron más películas?

- ¿En que año se estrenaron mas cortos?

- ¿Cuál es la mejor serie valorada en IMDB?

- ¿Cuál es la película mejor valorada en IMDB?

- ¿Qué actor/actriz ha recibido más premios?

- ¿Hay algun actor/actriz que haya recibido más de un premio Óscar?

**2. Objetivos**

- Consolidar los conocimientos de Python y SQL.

- Utilizar control de versiones en equipo para aprender las ventajas y conflictos que genera.

- Implementar Scrum como marco de referencia para el desarrollo del producto, basándonos siempre en los valores de Agile como puntos clave del trabajo en equipo y la mejora continua.

- Mejorar la comunicación entre los miembros del equipo.

- Mejorar vuestras habilidades de comunicación en público al exponer el proyecto en la sesión final.

**3. Planificación del proyecto**

**3.1. sprints**

Para la realización de este proyecto trabajaremos en 2 sprints (2 iteraciones). Siguiendo los principios ágiles, estableceremos pequeños ciclos iterativos de forma que al final de cada uno generemos valor perceptible por nuestros usuarios. Dedicaremos el primer día a la planificación del sprint (sprint planning) y el resto a trabajar en el desarrollo del proyecto. Al final de cada sprint haremos un Sprint Review del proyecto para presentar los resultados conseguidos y recoger feedback.

También haremos una retro corta revisando los working agreements que hemos acordado al inicio del proyecto y añadiendo cualquier otro feedback que nos permita mejorar el proyecto.

Al final del segundo sprint (que coincidirá con el final del proyecto y del módulo), haremos una sesión de presentación más completa, más allá de lo que sería un Sprint Review

**3.2. Criterios de aceptación**

- Crear la infraestructura necesaria: repositorio en GitHub y con acceso para todos los miembros del equipo.

- Extraer datos de distintas fuentes de datos y creación de una Base de Datos.

- Tener la extracción de datos, creación de la Base de Datos e insercción de datos automatizada en funciones(obligatorio) y clases(optativo)

- Tener en el repositorio de GitHub todo el código del desarrollo del proyecto.

**3.3. Historias de usuario**

Para la gestión del proyecto, usaremos historias de usuario. Las historias de usuario son descripciones breves y concretas de las funcionalidades o características que un usuario espera encontrar en un producto o sistema. Recordemos que, las historias de usuario son una herramienta importante para asegurarse de que el equipo de desarrollo (es decir, nosotras) entienda las necesidades de los usuarios y construya el producto de manera efectiva.

Si bien estas historias de usuario puede resultar un poco complejas para el tema que nos ocupa, podemos definir unas historias de usuario más claras para este proyecto, estas pueden ser:

- Seleccionar las herramientas con las que vamos a sacar los datos.

- Decidir la estructura de la base de datos.

- Insercción de los datos en la base de datos.

- Realización de queries para contestar a las preguntas planteadas.

**4. Entrega**

El formato de entrega de este proyecto será mediante la subida de este a la plataforma de GitHub. Se creará un repositorio. El nombre del repositorio deberá estar compuesto de las siguientes partes, todo ello separado por guiones:

- La palabra: proyecto-da.

- Letra de la promoción: promo-G.

- Número del módulo: modulo-2.

- Número del equipo: team-X.

Por ejemplo:

- project-da-promo-G-module-2-team-1

- project-da-promo-G-module-2-team-3

En lo relacionado en las fechas de los sprints:

- Entrega del primer sprint (sprint review ): 30 Abril.

- Entrega del segundo sprint (sprint review): 13 Mayo.

- Demo del proyecto (presentación final y retro): 20 Mayo.

En las sprint review se revisará que se hayan solucionado todas las tareas técnicas asociadas a la entrega de esos sprints, si algo quedara pendiente se arrastraría al siguiente sprint.

**5. Presentación**

El último día del módulo presentaréis la versión final de este proyecto a vuestras compañeras y al equipo de Adalab. Cada equipo realizará una presentación de 5 minutos y posteriormente habrá 5 minutos de feedback por parte del público. En este caso, la audiencia podría ser más variada pues no sólo estarán los profesores.

El objetivo es que practiquéis la realización de las demos de los proyectos que habéis desarrollado, explicándolo desde un punto de vista técnico y también desde la perspectiva de producto, mejorando además vuestras habilidades de exposición, objetivo de desarrollo profesional del curso.

Para que la presentación salga bien es imprescindible una buena preparación. Por ello, durante el segundo sprint del módulo tendréis que asignar responsabilidades dentro del equipo relacionadas con la preparación de ésta. Algunos tips para preparaos este demo son:

- Todas las participantes del equipo deben hablar en la presentación (sin práctica no hay mejora).

- Identificar los objetivos de la presentación: Debemos tener claro qué es lo que queremos lograr con la presentación. ¿Queremos demostrar la funcionalidad de un producto? ¿Queremos mostrar los resultados de un experimento? ¿Queremos atraer inversores? Dependiendo del objetivo, deberemos enfocar la presentación de manera distinta.

- Conoce a tu audiencia: La presentación debe estar adaptada al tipo de audiencia que se espera. Si se presentaráis ante posibles inversores, la presentación debe estar enfocada en los beneficios y la rentabilidad del producto. Si es una presentación para usuarios, deberá enfocarse en la usabilidad y la facilidad de uso.

- Debéis ser claras y concisas: La presentación debe ser fácil de entender y no debe ser demasiado larga. Es importante presentar la información de manera clara y concisa. Debemos tener en cuenta que los detalles técnicos pueden ser interesantes, pero no deberían opacar la idea principal.

- Demostrad la funcionalidad del producto: Si la presentación es para demostrar un producto, es importante que demostremos su funcionalidad. Podemos hacerlo mediante un video o demostrando el producto en vivo. Es importante asegurarse de que el producto funciona correctamente antes de la presentación.

- Resaltad los aspectos más importantes: En cualquier presentación, hay aspectos que son más importantes que otros. Debéis resaltar los aspectos que sean más relevantes para su objetivo. Por ejemplo, si queréis atraer inversores, deberéis resaltar los beneficios y la rentabilidad del producto.

- Practicad la presentación: Es importante que practiquéis la presentación varias veces antes del evento. Debéis aseguraos de que la presentación esté bien estructurada y que os sentís cómodas hablando frente a la audiencia.

- Preparad respuestas a preguntas frecuentes: Es probable que la audiencia tenga preguntas después de la presentación. Debéis preparaos para responder preguntas frecuentes y tener la información necesaria a mano.

- Además de esto, para mejorar vuestras habilidades de exposición en público y hacer la presentación más rica, podréis incorporar otros elementos adicionales (son solo ideas, sentíos libres de innovar y ser creativas):

- Dejar muy claro quién ha sido vuestro cliente y qué fue lo que os pidió.

- Explicar qué necesidades cubre o qué problemas soluciona el producto, cuál es el beneficio principal que aporta y qué lo hace único comparado con otros productos parecidos del mercado.

- Aportaciones "únicas y diferenciadoras" de cada equipo al proyecto.

- Cómo ha sido la organización del equipo, el reparto de tareas y la coordinación a la hora de trabajar todas en el mismo código.

- Cuál de las tareas o los puntos ha sido el que más esfuerzo ha requerido.

- Cuál de las tareas o partes del producto es la que hace que el equipo esté más orgulloso.

- Las tecnologías qué habéis utilizado y para qué sirven, y algunas partes del código que habéis desarrollado que merezca la pena resaltar.

- La presentación debe tener un "buen inicio y un buen cierre" que nos haga a todos estar atentos y aplaudir... ahí os dejamos que echéis a volar vuestra imaginación.

- No habléis en primera persona de lo que habéis hecho, hablad del equipo.

- No mencionéis problemas, sino "retos" que os han hecho aprender y crecer.

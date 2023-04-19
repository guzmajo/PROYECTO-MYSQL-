# PROYECTO-MYSQL-
Proyecto de analisis de datos en MYSQL

# Estudio de la empresa de ecommerce "OsitoFeliz" 🧸

![Image](https://user-images.githubusercontent.com/106395421/230603386-18f12bbd-bab6-4483-bc20-0157b5ed9c2b.jpg)

## Índice
- [Introducción](#introducción)
- [Objetivos](#objetivos)
- [Equipo](#equipo)
- [Ejecución](#ejecución)
- [Análisis de ventas](#análisis-de-ventas)
- [Análisis de trafico web](#análisis-de-tráfico-web)
- [Conclusiones y recomendaciones](#Conclusiones-y-recomendaciones)


## Introducción
En este proyecto vamos a realizar un estudio de la empresa de ecommerce "OsitoFeliz", que se dedica a vender ositos de peluche super atractivos. Actualmente cuenta con 4 modelos de peluches que ofrecen a sus clientes.

## Objetivos
Nuestro objetivo es analizar la situación actual de la empresa, medir la conversión de la web y usar datos para entender las ventas e impacto de los productos.

## Equipo
Para ello, trabajaremos con el CEO, el director de marketing y el Gerente de la web, que nos proporcionarán los datos necesarios y nos orientarán sobre las preguntas clave que queremos responder. Esperamos que este proyecto nos ayude a identificar las fortalezas y debilidades de la empresa, así como las oportunidades y amenazas del mercado, y a proponer acciones de mejora basadas en evidencia.

## Ejecución

El siguiente es el diagrama de las tablas que componen el caso de estudio en el cual se pueden identificar las llaves primarias (PRIMARY KEY) y como se relacionan los datos en cada una de las tablas.

![Image](https://github.com/guzmajo/PROYECTO-MYSQL-/blob/main/osito%20feliz%20diagrama.png)

### Análisis de ventas
1. Queremos saber cuales son las ventas por año y por mes en términos brutos y luego el margen absoluto.
2. ¿Cuales son las ventas brutas medias de cada mes y año, devuelve los TOP 10? ¿Que puedes observar?
3. ¿Cuál es el producto que mas vende en términos monetarios (Ventas brutas)?
4. ¿Cuál es el producto que deja más margen?
5. ¿Podemos saber cúal es la fecha de lanzamiento de cada producto?
6. Calcula las ventas brutas por año asi como el margen numérico y porcentual de cada producto y ordénalo por producto.
7. ¿Cuáles son los meses con mayor venta bruta, devuelve los TOP 3?

### Análisis de trafico web
1. ¿Cuales son los ads(anuncios) o contenidos que han atraído más sesiones?
2. Es lo mismo sesiones que usuarios?¿Cuál es la cantidad de usuarios individuales?
3. ¿Y por source o fuente? Cantidad de usuarios y sesiones?
4. ¿Cúales son las sources o fuentes que han dado más ventas?
5. ¿Cúales son los meses que han atraido más tráfico?
6. Ya que vimos el mes que ha tenido más trafico, podrías ver de ese mes la cantidad de sesiones que han venido por movil y la cantidad que han venido por ordenador?
7. ¿Qué campañas son las que han dado más margen por productos?

Para ver el archivo se MYSQL generado dando respuesta a las preguntas del caso de estudio puede dar click en el siguiente link:

https://github.com/guzmajo/PROYECTO-MYSQL-/blob/main/proyecto%20sql.sql

En el siguiente enlace se encuentran las bases de datos necesarias para la ejecucion del caso de estudio: 

https://github.com/guzmajo/PROYECTO-MYSQL-

## Conclusiones y recomendaciones

En este informe se presenta un análisis de las ventas y el tráfico web de la empresa durante el año 2012 y 2013 así como algunas recomendaciones para mejorar el rendimiento de las mismas. 

El análisis de ventas muestra que la empresa ha tenido un crecimiento sostenido mes a mes en el 2012, siendo los últimos tres meses los de mayor venta bruta. El producto que más ingresos ha generado es el "Osito Cariñoso", seguido por el "Osito Amor Por Siempre", que además tiene el mayor margen de utilidad con un 37%. Estos productos son los que más demanda tienen entre los clientes.

El análisis de tráfico web revela que la empresa recibe más visitas desde Google que desde Bing, y que estas visitas se traducen en cinco veces más ventas. Los meses de diciembre y noviembre son los de mayor tráfico, coincidiendo con las fechas festivas. La mayoría de los usuarios acceden a la página de la empresa desde dispositivos móviles, lo que indica que la empresa tiene una buena adaptación al mercado digital. Las campañas que han tenido más éxito son las que se han realizado en redes sociales a través de influencers, ya que han logrado captar mas la atención de los consumidores.

A partir de estos resultados, se recomienda a la empresa impulsar la estrategia de marketing para consolidar los productos que más margen de utilidad han generado, así como para diversificar la oferta y atraer a nuevos clientes. Se sugiere realizar campañas en redes sociales a través de influencers para incrementar la compra de productos en aquellos meses en que el tráfico web ha sido menor, aprovechando las ventajas que ofrece este canal. Asimismo, se propone realizar campañas en determinados momentos del año, teniendo en cuenta las características de los productos y las preferencias de los clientes, para aprovechar las oportunidades que brindan las compras estacionales (navidad, san valentín, etc.).


-- Análisis Previo

-- Antes de comenzar a responder a las preguntas de negocio que se nos solicita debemos entender las tablas, como están compuestas y como se relacionan.

-- Puntos detectados:

-- Rango de tiempo de la tabla de pedidos.

select 
min(monthcreated_at) as FECHA_INICIAL,
max(created_at) as FECHA_FINAL
FROM orders;


-- Si cada pedido de la tabla de pedidos tiene más de 1 elemento por eso se relaciona con la tabla de order_item. Entendemos se relaciona con la tabla items_purchase.

# Ejecución

# Análisis de ventas

-- 1. Queremos saber cuales son las ventas por año y por mes en términos brutos y luego el margen absoluto.

SELECT 
MONTH (created_at) as MES, 
year(created_at) as YEAR,
FORMAT(SUM(price_usd*items_purchased),2,'es_ESP') as 'Ventas brutas',
FORMAT(SUM(items_purchased*(price_usd - cogs_usd)),2,'es_ESP') as margen_bruto
FROM orders
group by MONTH (created_at), YEAR
order by YEAR, MES ASC;

-- 2. ¿Cuales son las ventas brutas medias de cada mes y año, devuelve los TOP 10? ¿Que puedes observar?

SELECT 
YEAR(created_at) AS año,
MONTH(created_at) AS mes,
FORMAT(SUM(price_usd*items_purchased),2,'es_ESP') as 'Ventas brutas',
FORMAT(avg(price_usd*items_purchased),2,'es_ESP') AS 'ventas brutas medias'
FROM orders
GROUP BY YEAR(created_at), MONTH(created_at)
ORDER BY 'ventas brutas medias' DESC
LIMIT 10;


-- 3. ¿Cuál es el producto que mas vende en términos monetarios (Ventas brutas)?

SELECT 
    p.product_name,
    SUM(o.price_usd * items_purchased) AS ventas_brutas
FROM
    orders o
	LEFT JOIN
    order_items oi ON o.order_id = oi.order_id
    LEFT JOIN
    products p ON p.product_id = oi.product_id
GROUP BY p.product_name
	ORDER BY ventas_brutas DESC
	LIMIT 1;

-- 4. ¿Cuál es el producto que deja más margen?

SELECT 
P.product_name,
SUM(o.price_usd - o.cogs_usd) / SUM(o.items_purchased) AS margen
FROM
    orders o
	LEFT JOIN    order_items oi ON o.order_id = oi.order_id
    LEFT JOIN    products p ON p.product_id = oi.product_id
GROUP BY p.product_name
	ORDER BY margen DESC
	LIMIT 1;

-- 5. ¿Podemos saber cúal es la fecha de lanzamiento de cada producto?

SELECT 
P.product_name,
MIN(o.created_at) as fecha_venta
FROM orders o
	LEFT JOIN order_items oi ON o.order_id = oi.order_id
    LEFT JOIN products p ON p.product_id = oi.product_id
GROUP BY p.product_name;

-- 6. Calcula las ventas brutas por año asi como el margen numérico y porcentual de cada producto y ordénalo por producto.

SELECT 
    YEAR(o.created_at) AS year,
    P.product_name,
    FORMAT(SUM(o.price_usd),2,'es_ESP') AS gross_sales,
    FORMAT(SUM(o.price_usd - o.cogs_usd),2,'es_ESP') AS net_margin,
    FORMAT((SUM(o.price_usd - o.cogs_usd) / SUM(o.price_usd)),2,'es_ESP') * 100 AS net_margin_percentage
FROM orders o 
LEFT JOIN order_items oi ON o.order_id = oi.order_id
    LEFT JOIN products p ON p.product_id = oi.product_id
GROUP BY YEAR(created_at), product_name
ORDER BY net_margin_percentage DESC;


-- 7. ¿Cuáles son los meses con mayor venta bruta, devuelve los TOP 3? 

SELECT 
    YEAR(created_at) AS year,
    MONTH(created_at) AS month,
    SUM(price_usd) AS gross_sales
FROM orders
GROUP BY YEAR(created_at), MONTH(created_at)
ORDER BY gross_sales DESC
LIMIT 3;    

-- 8. ¿Cuales son los ads(anuncios) o contenidos que han atraído más sesiones?


SELECT utm_content, COUNT(*) as session_count
FROM ositofeliz.website_sessions
GROUP BY utm_content
ORDER BY session_count DESC;


-- 9. Es lo mismo sesiones que usuarios?¿Cuál es la cantidad de usuarios individuales?

-- No, las sesiones y los usuarios no son lo mismo. Una sesión representa una sola visita a un sitio web por parte de un usuario, mientras que un usuario puede tener varias sesiones. El número de usuarios se refiere al número de individuos únicos que han visitado el sitio web.

SELECT COUNT(DISTINCT user_id) as unique_users
FROM ositofeliz.website_sessions;

-- 10. ¿Y por source o fuente? Cantidad de usuarios y sesiones?

SELECT utm_source,
       COUNT(DISTINCT user_id) as unique_users,
       COUNT(*) as session_count
FROM ositofeliz.website_sessions
GROUP BY utm_source;

-- 11. ¿Cúales son las sources o fuentes que han dado más ventas?

SELECT s.utm_source, COUNT(DISTINCT o.order_id) as sales_count
FROM orders as o
JOIN website_sessions as s
ON o.website_session_id = s.website_session_id
GROUP BY s.utm_source
ORDER BY sales_count DESC;

-- 12. ¿Cúales son los meses que han atraido más tráfico?

SELECT MONTHNAME(w.created_at) AS MONTH, COUNT(*) as Traffic
FROM website_sessions as w
group by MONTH
ORDER BY Traffic DESC;

-- 13. Ya que vimos el mes que ha tenido más trafico, podrías ver de ese mes la cantidad de sesiones que han venido por movil y la cantidad que han venido por ordenador?

SELECT device_type, COUNT(*) AS sessions
FROM website_sessions
WHERE MONTHNAME(created_at) = (
    SELECT MONTHNAME(created_at)
    FROM website_sessions
    GROUP BY MONTHNAME(created_at)
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
GROUP BY device_type;

-- 14. ¿Qué campañas son las que han dado más margen por productos? 

SELECT utm_campaign, SUM(price_usd - cogs_usd) / SUM(items_purchased) AS margin_per_product
FROM orders
JOIN website_sessions
ON orders.website_session_id = website_sessions.website_session_id
GROUP BY utm_campaign
ORDER BY margin_per_product DESC;

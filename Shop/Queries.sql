#Query 1
SELECT nombre 
AS 'Products name'
FROM tienda.producto;

#Query 2
SELECT nombre AS 'Product name', precio AS 'Price'
FROM tienda.producto;

#Query 3
SELECT * FROM tienda.producto;

#Query 4
SELECT CONCAT(precio, '€') AS 'Price euros', CONCAT(ROUND(precio*1.08, 2), 'USD') AS 'Price USD'
FROM tienda.producto;

#Query 5
SELECT 
nombre AS 'Product name',
 CONCAT(precio, '€') AS 'Euros', 
 CONCAT(precio*1.08, 'USD') AS 'Dollards'
FROM tienda.producto;

#Query 6
SELECT UPPER(nombre) AS 'Product name', precio AS 'Price'
FROM tienda.producto;

#Query 7
SELECT LOWER(nombre) AS 'Product name', precio AS 'Price'
FROM tienda.producto;

#Query 8
SELECT nombre AS 'Manufacturers', UPPER(SUBSTRING(nombre, 1, 2)) AS 'First 2 chars'
FROM tienda.fabricante;

#Query 9
SELECT nombre AS 'Product name', ROUND(precio, 0) AS 'Rounded Price'
FROM tienda.producto;

# Query 10
SELECT nombre AS 'Product name', TRUNCATE(precio, 0) AS 'Truncated Price'
FROM tienda.producto;

#Query 11
SELECT fabricante.codigo
FROM tienda.fabricante
INNER JOIN tienda.producto
ON fabricante.codigo = producto.codigo_fabricante;

#Query 12
SELECT DISTINCT fabricante.codigo
FROM tienda.fabricante
INNER JOIN tienda.producto
ON fabricante.codigo = producto.codigo_fabricante;

#Query 13
SELECT nombre AS 'Manufacturers ascendent'
FROM tienda.fabricante
ORDER BY nombre;

#Query 14
SELECT nombre AS 'Manufacturers descendent'
FROM tienda.fabricante
ORDER BY nombre DESC;

#Query 15
SELECT nombre AS 'Products ascendent', precio AS 'Price descendent'
FROM tienda.producto
ORDER BY nombre ASC, precio DESC;

#Query 16
SELECT *
FROM tienda.fabricante
LIMIT 5;

#Query 17
WITH _fabricante AS (
SELECT *,
row_number() OVER(ORDER BY codigo) AS row_num
FROM fabricante
)
SELECT codigo, nombre
FROM _fabricante
WHERE row_num BETWEEN 4 AND 5;

#Query 18
SELECT nombre, precio
FROM producto
ORDER BY precio
LIMIT 1;

#Query 19
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1;

#Query 20
SELECT nombre
FROM producto
WHERE codigo_fabricante = 2;

#Query 21
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo;

#Query 22
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre;

#Query 23
SELECT 
p.codigo AS 'Product code',
p.nombre AS 'Product', 
f.codigo AS 'Manufacturer code',
f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo;

#Query 24
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY precio
LIMIT 1;

#Query 25
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
ORDER BY precio DESC
LIMIT 1;

#Query 26
SELECT p.nombre AS 'Product', p.precio
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE UPPER(f.nombre) = 'LENOVO';

#Query 27
SELECT p.nombre AS 'Product', p.precio
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE UPPER(f.nombre) = 'CRUCIAL'
AND precio > 200;

#Query 28
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE 
UPPER(f.nombre) = 'ASUS'
OR UPPER(f.nombre) = 'HEWLETT-PACKARD'
OR UPPER(f.nombre) = 'SEAGATE';

#Query 29
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE UPPER(f.nombre) IN ('ASUS', 'HEWLETT-PACKARD', 'SEAGATE');

#Query 30
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre like '%e';

#Query 31
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE f.nombre like '%w%';

#Query 32
SELECT p.nombre AS 'Product', p.precio, f.nombre AS 'Manufacturer'
FROM producto p
INNER JOIN fabricante f
ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

#Query 33
SELECT DISTINCT f.codigo, f.nombre
FROM fabricante f
INNER JOIN producto p
ON f.codigo = p.codigo_fabricante;

#Query 34
SELECT f.nombre AS 'Manufacturer', p.nombre AS'Product'
FROM fabricante f
LEFT JOIN producto p
ON f.codigo = p.codigo_fabricante;

#Query 35
SELECT f.nombre AS 'Manufacturer'
FROM fabricante f
LEFT JOIN producto p
ON f.codigo = p.codigo_fabricante
WHERE p.codigo_fabricante IS NULL;

#Query 36
SELECT nombre AS 'Product', precio
FROM producto
WHERE codigo_fabricante = (
SELECT codigo
FROM fabricante
WHERE UPPER(nombre) = 'LENOVO'
);

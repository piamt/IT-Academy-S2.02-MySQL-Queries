#Query 1
SELECT COUNT(id) AS 'Number of students'
FROM persona
WHERE tipo = 'alumno';

#Query 2
SELECT COUNT(id) AS 'Students born in 1999'
FROM persona
WHERE YEAR(fecha_nacimiento) = 1999;

#Query 3
SELECT d.nombre AS 'Departamento', COUNT(profesor.id_profesor) AS 'Number teachers'
FROM departamento d
INNER JOIN profesor
ON d.id = profesor.id_departamento
GROUP BY d.id
ORDER BY COUNT(profesor.id_profesor); 

#Query 4
SELECT d.nombre AS 'Departamento', COUNT(profesor.id_profesor) AS 'Number teachers'
FROM departamento d
LEFT JOIN profesor
ON d.id = profesor.id_departamento
GROUP BY d.id
ORDER BY COUNT(profesor.id_profesor); 

#Query 5
SELECT g.nombre AS 'Grado', COUNT(a.id) AS 'Number of subjects'
FROM grado g
LEFT JOIN asignatura a
ON g.id = a.id_grado
GROUP BY g.id
ORDER BY COUNT(a.id) DESC;

#Query 6
SELECT g.nombre AS 'Grado', COUNT(a.id) AS 'Number of subjects'
FROM grado g
JOIN asignatura a
ON g.id = a.id_grado
GROUP BY g.id
HAVING COUNT(a.id) > 40
ORDER BY COUNT(a.id) DESC;

#Query 7
SELECT g.nombre AS 'Grado', a.tipo AS 'Type', SUM(a.creditos) AS 'Total credits'
FROM asignatura a
INNER JOIN grado g
ON a.id_grado = g.id
GROUP BY g.id, a.tipo;

#Query 8
SELECT c.anyo_inicio, COUNT(DISTINCT a.id_alumno) AS 'Number students'
FROM curso_escolar c
LEFT JOIN alumno_se_matricula_asignatura a
ON c.id = a.id_curso_escolar
GROUP BY c.anyo_inicio;

#Query 9
SELECT DISTINCT 
p.id, 
p.nombre AS 'Name', 
p.apellido1 AS 'First', 
p.apellido2 AS 'Second',
COUNT(a.id) AS 'Number of subjects'
FROM persona p
LEFT JOIN asignatura a
ON p.id = a.id_profesor
WHERE p.tipo = 'profesor'
GROUP BY p.id
ORDER BY COUNT(a.id) DESC;

#Query 10
WITH _persona AS (
	SELECT *,
	row_number() OVER (ORDER BY fecha_nacimiento DESC) as row_num
	FROM persona
    WHERE tipo = "alumno"
)
SELECT *
FROM _persona
WHERE row_num = 1;

#Query 10 second option, but it appears 1 null row
SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

#Query 11
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, profesor.id_departamento
FROM profesor
INNER JOIN persona
ON profesor.id_profesor = persona.id
LEFT JOIN asignatura
ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL;
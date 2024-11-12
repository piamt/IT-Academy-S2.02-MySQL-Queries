USE universidad;

#Query 1
SELECT 
departamento.nombre AS 'Department',
persona.apellido1 AS 'First',
persona.apellido2 AS 'Last',
persona.nombre AS 'Name'
FROM persona
INNER JOIN profesor
ON profesor.id_profesor = persona.id
LEFT JOIN departamento
ON profesor.id_departamento = departamento.id
ORDER BY departamento.nombre DESC, persona.apellido1 DESC, persona.apellido2 DESC, persona.nombre DESC;


#Query 2
SELECT departamento.nombre AS 'Department', persona.apellido1 AS 'First', persona.apellido2 AS 'Last', persona.nombre AS 'Name'
FROM persona
INNER JOIN profesor
ON profesor.id_profesor = persona.id
LEFT JOIN departamento
ON profesor.id_departamento = departamento.id
WHERE profesor.id_departamento IS NULL;

#Query 3
SELECT nombre AS 'Department'
FROM departamento
LEFT JOIN profesor
ON departamento.id = profesor.id_departamento
WHERE profesor.id_departamento IS NULL;

#Query 4
SELECT CONCAT(persona.nombre, ' ', persona.apellido1, ' ', persona.apellido2) AS 'Teacher'
FROM persona
RIGHT JOIN profesor
ON persona.id = profesor.id_profesor
LEFT JOIN asignatura
ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL;

#Query 5
SELECT asignatura.nombre
FROM asignatura
LEFT JOIN profesor
ON asignatura.id_profesor = profesor.id_profesor
WHERE profesor.id_profesor IS NULL;

#Query 6
SELECT DISTINCT d.nombre
FROM departamento d
LEFT JOIN profesor
ON d.id = profesor.id_departamento
LEFT JOIN asignatura a
ON profesor.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;
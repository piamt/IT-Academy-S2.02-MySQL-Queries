#Query 1
SELECT CONCAT(apellido1, ' ', apellido2, ' ', nombre) AS 'Alumnos'
FROM persona
WHERE tipo = 'alumno';

#Query 2
SELECT CONCAT(apellido1, ' ', apellido2, ' ', nombre) AS 'Alumnos'
FROM persona
WHERE tipo = 'alumno'
AND telefono IS NULL;

#Query 3
SELECT CONCAT(apellido1, ' ', apellido2, ' ', nombre) AS 'Alumnos'
FROM persona
WHERE tipo = 'alumno'
AND YEAR(fecha_nacimiento) = 1999;

#Query 4
SELECT CONCAT(apellido1, ' ', apellido2, ' ', nombre) AS 'Alumnos', nif
FROM persona
WHERE tipo = 'profesor'
AND telefono IS NULL
AND RIGHT(nif, 1) = 'K';

#Query 5
SELECT nombre
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3
AND id_grado = 7;

#Query 6
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS 'Departamento'
FROM persona
INNER JOIN profesor
ON profesor.id_profesor = persona.id
INNER JOIN departamento
ON profesor.id_departamento = departamento.id
ORDER BY persona.apellido1, persona.apellido2, persona.nombre; 

#Query 7
SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin
FROM asignatura
INNER JOIN alumno_se_matricula_asignatura
ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
INNER JOIN curso_escolar
ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
INNER JOIN persona
ON persona.id = alumno_se_matricula_asignatura.id_alumno
WHERE persona.nif = '26902806M';

#Query 8
SELECT DISTINCT departamento.nombre
FROM departamento
INNER JOIN profesor
ON departamento.id = profesor.id_departamento
INNER JOIN grado
ON grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
INNER JOIN asignatura
ON asignatura.id_grado = grado.id;

#Query 9
SELECT CONCAT(nombre, ' ', apellido1, ' ',apellido2) AS 'Stydents course 2018/2019'
FROM persona
INNER JOIN alumno_se_matricula_asignatura
ON alumno_se_matricula_asignatura.id_alumno = persona.id
INNER JOIN curso_escolar
ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
WHERE curso_escolar.anyo_inicio = 2018
SELECT
    s.name AS escala,
    SUM(t.veces_practicada) AS veces_practicada
FROM TopEscalasDiarias t
JOIN Scale s ON t.id_scale = s.id
WHERE 
    t.id_student = 'pedro1'      
    AND t.anio = 2025      
    AND t.semana = 40      
GROUP BY s.name
ORDER BY veces_practicada DESC;

SELECT
    s.name AS escala,
    SUM(t.tiempo_total) AS tiempo_total_segundos,
    SUM(t.tiempo_mala_postura) AS tiempo_mala_postura_segundos,
    SUM(t.tiempo_buena_postura) AS tiempo_buena_postura_segundos
FROM TiempoPosturasDiarias t
JOIN Scale s ON t.id_scale = s.id
WHERE 
    t.id_student = 'pedro1'      
    AND t.anio = 2025      
    AND t.semana = 40      
GROUP BY s.name
ORDER BY tiempo_total_segundos DESC;

SELECT
    s.name AS escala,
    SUM(t.notas_correctas) AS notas_correctas,
    SUM(t.notas_incorrectas) AS notas_incorrectas
FROM NotasResumenDiarias t
JOIN Scale s ON t.id_scale = s.id
WHERE 
    t.id_student = 'pedro1'      
    AND t.anio = 2025      
    AND t.semana = 40      
GROUP BY s.name
ORDER BY notas_incorrectas DESC;

SELECT
    s.name AS escala,
    SUM(p.cantidad_errores) AS total_errores_posturales
FROM ProgresoErroresPosturales p
JOIN Scale s ON p.id_scale = s.id
WHERE 
    p.id_student = 'pedro1'      
    AND p.anio = 2025      
    AND p.semana = 40      
GROUP BY s.name;

SELECT
    s.name AS escala,
    SUM(p.cantidad_errores) AS total_errores_musicales
FROM ProgresoErroresMusicales p
JOIN Scale s ON p.id_scale = s.id
WHERE 
    p.id_student = 'pedro1'      
    AND p.anio = 2025      
    AND p.semana = 40      
GROUP BY s.name;

-- --------resultados semana 41-------------


SELECT
    s.name AS escala,
    SUM(t.veces_practicada) AS veces_practicada
FROM TopEscalasDiarias t
JOIN Scale s ON t.id_scale = s.id
WHERE 
    t.id_student = 'pedro1'      
    AND t.anio = 2025      
    AND t.semana = 41      
GROUP BY s.name
ORDER BY veces_practicada DESC;

SELECT
    s.name AS escala,
    SUM(t.tiempo_total) AS tiempo_total_segundos,
    SUM(t.tiempo_mala_postura) AS tiempo_mala_postura_segundos,
    SUM(t.tiempo_buena_postura) AS tiempo_buena_postura_segundos
FROM TiempoPosturasDiarias t
JOIN Scale s ON t.id_scale = s.id
WHERE 
    t.id_student = 'pedro1'      
    AND t.anio = 2025      
    AND t.semana = 41      
GROUP BY s.name
ORDER BY tiempo_total_segundos DESC;


SELECT
    s.name AS escala,
    SUM(t.notas_correctas) AS notas_correctas,
    SUM(t.notas_incorrectas) AS notas_incorrectas
FROM NotasResumenDiarias t
JOIN Scale s ON t.id_scale = s.id
WHERE 
    t.id_student = 'pedro1'      
    AND t.anio = 2025      
    AND t.semana = 41      
GROUP BY s.name
ORDER BY notas_incorrectas DESC;

SELECT
    s.name AS escala,
    SUM(p.cantidad_errores) AS total_errores_posturales
FROM ProgresoErroresPosturales p
JOIN Scale s ON p.id_scale = s.id
WHERE 
    p.id_student = 'pedro1'      
    AND p.anio = 2025      
    AND p.semana = 41      
GROUP BY s.name;

SELECT
    s.name AS escala,
    SUM(p.cantidad_errores) AS total_errores_musicales
FROM ProgresoErroresMusicales p
JOIN Scale s ON p.id_scale = s.id
WHERE 
    p.id_student = 'pedro1'      
    AND p.anio = 2025      
    AND p.semana = 41      
GROUP BY s.name;
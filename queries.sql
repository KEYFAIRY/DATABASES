SELECT yearweek(Practice.date, 1) as week, 
		Scale.name, 
        Scale.scale_type,
        count(Practice.id_scale) as NumPractice
FROM Practice
INNER JOIN Scale
ON Practice.id_scale = Scale.id
WHERE Practice.id_student = "1"
GROUP BY semana, Scale.name, Scale.scale_type
ORDER BY count(Practice.id_scale) DESC;


SELECT yearweek(Practice.date, 1) as week,
	   Scale.name,
       Scale.scale_type,
       sum(Practice.num_postural_errors) as timeBadPosition,
       sum(Practice.duration) as totalDuration
FROM Practice
INNER JOIN Scale
ON Practice.id_scale = Scale.id
WHERE Practice.id_student = "2"
GROUP BY week, Scale.name, Scale.scale_type
ORDER BY week;


SELECT yearweek(Practice.date, 1) as week,
	   Scale.name,
       Scale.scale_type,
       sum(Practice.num_musical_errors) as timeWrongNotes,
       sum(Practice.duration) as totalDuration
FROM Practice
INNER JOIN Scale
ON Practice.id_scale = Scale.id
WHERE Practice.id_student = "1"
GROUP BY week, Scale.name, Scale.scale_type
ORDER BY week;


SELECT yearweek(Practice.date, 1) as week,
       Scale.name,
	   Scale.scale_type
FROM Practice
INNER JOIN Scale
ON Practice.id_scale = Scale.id
WHERE Practice.id_student = "1"
GROUP BY week, Scale.name, Scale.scale_type;


SELECT yearweek(Practice.date, 1) as week,
       Practice.date,
	   Scale.name,
       Scale.scale_type,
       sum(Practice.num_postural_errors) as totalPosturalErrors
FROM Practice
INNER JOIN Scale
ON Practice.id_scale = Scale.id
WHERE Practice.id_student = "1" 
	  AND Scale.name = "C" 
      AND Scale.scale_type = "Major"
GROUP BY Practice.date ,Scale.name, Scale.scale_type
ORDER BY week;


SELECT yearweek(Practice.date, 1) as week,
       Practice.date,
	   Scale.name,
       Scale.scale_type,
       sum(Practice.num_musical_errors) as totalMusicalErrors
FROM Practice
INNER JOIN Scale
ON Practice.id_scale = Scale.id
WHERE Practice.id_student = "1" 
	  AND Scale.name = "C" 
      AND Scale.scale_type = "Major"
GROUP BY Practice.date ,Scale.name, Scale.scale_type
ORDER BY week;
CREATE DATABASE IF NOT EXISTS piano_db;
USE piano_db;

CREATE TABLE Student (
    uid VARCHAR(128) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    piano_level VARCHAR(50) NOT NULL
);

CREATE TABLE Scale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    scale_type VARCHAR(50) NOT NULL,
    CONSTRAINT uq_scale UNIQUE (name, scale_type)
);

CREATE TABLE Practice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    practice_datetime DATETIME NOT NULL,
    num_postural_errors NUMERIC,
    num_musical_errors NUMERIC,
    duration NUMERIC NOT NULL,
    bpm NUMERIC NOT NULL,
    total_notes_played INT NOT NULL,
    id_student VARCHAR(128) NOT NULL,
    id_scale INT NOT NULL,
    FOREIGN KEY (id_student) REFERENCES Student(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_scale) REFERENCES Scale(id) ON DELETE CASCADE
);

CREATE TABLE PosturalError (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_sec_init VARCHAR(50) NOT NULL,
    min_sec_end VARCHAR(50) NOT NULL,
    explication VARCHAR(500),
    id_practice INT NOT NULL,
    FOREIGN KEY (id_practice) REFERENCES Practice(id) ON DELETE CASCADE
);

CREATE TABLE MusicalError (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_sec VARCHAR(50) NOT NULL,
    note_played VARCHAR(10),
    note_correct VARCHAR(10),
    id_practice INT NOT NULL,
    FOREIGN KEY (id_practice) REFERENCES Practice(id) ON DELETE CASCADE
);


CREATE TABLE TopEscalasDiarias (
    id_student VARCHAR(128),
    id_scale INT,
    fecha DATE,
    anio YEAR NOT NULL,
    semana INT NOT NULL,
    mes INT NOT NULL,
    veces_practicada INT DEFAULT 0,
    PRIMARY KEY (id_student, id_scale, fecha)
);

CREATE TABLE TiempoPosturasDiarias (
    id_student VARCHAR(128),
    id_scale INT,
    fecha DATE,
    anio YEAR NOT NULL,
    semana INT NOT NULL,
    mes INT NOT NULL,
    tiempo_total NUMERIC DEFAULT 0,
    tiempo_mala_postura NUMERIC DEFAULT 0,
    tiempo_buena_postura NUMERIC DEFAULT 0,
    PRIMARY KEY (id_student, id_scale, fecha)
);

CREATE TABLE NotasResumenDiarias (
    id_student VARCHAR(128),
    id_scale INT,
    fecha DATE,
    anio YEAR NOT NULL,
    semana INT NOT NULL,
    mes INT NOT NULL,
    notas_correctas INT DEFAULT 0,
    notas_incorrectas INT DEFAULT 0,
    PRIMARY KEY (id_student, id_scale, fecha)
);

CREATE TABLE ProgresoErroresPosturales (
    id_student VARCHAR(128),
    id_scale INT,
    fecha DATE,
    anio YEAR NOT NULL,
    semana INT NOT NULL,
    mes INT NOT NULL,
    cantidad_errores INT DEFAULT 0,
    PRIMARY KEY (id_student, id_scale, fecha)
);

CREATE TABLE ProgresoErroresMusicales (
    id_student VARCHAR(128),
    id_scale INT,
    fecha DATE,
    anio YEAR NOT NULL,
    semana INT NOT NULL,
    mes INT NOT NULL,
    cantidad_errores INT DEFAULT 0,
    PRIMARY KEY (id_student, id_scale, fecha)
);

DELIMITER $$


DROP TRIGGER IF EXISTS trg_insert_practice;


CREATE TRIGGER trg_insert_practice
AFTER INSERT ON Practice
FOR EACH ROW
BEGIN
    
    DECLARE v_current_date DATE;  
    
    
    SET v_current_date = DATE(NEW.practice_datetime); 
    
    INSERT INTO TopEscalasDiarias (
        id_student, 
        id_scale, 
        fecha, 
        anio, 
        semana, 
        mes, 
        veces_practicada
    )
    VALUES (
        NEW.id_student, 
        NEW.id_scale, 
        v_current_date,  
        YEAR(NEW.practice_datetime), 
        WEEK(NEW.practice_datetime, 3), 
        MONTH(NEW.practice_datetime), 
        1
    )
    ON DUPLICATE KEY UPDATE
        veces_practicada = veces_practicada + 1;
END$$

DELIMITER ;

DELIMITER $$


DROP TRIGGER IF EXISTS trg_acumular_tiempo_total_diario;


CREATE TRIGGER trg_acumular_tiempo_total_diario
AFTER INSERT ON Practice
FOR EACH ROW
BEGIN
    DECLARE v_current_date DATE;  
    
    SET v_current_date = DATE(NEW.practice_datetime);

    INSERT INTO TiempoPosturasDiarias (
        id_student, 
        id_scale, 
        fecha, 
        anio, 
        semana, 
        mes, 
        tiempo_total, 
        tiempo_mala_postura, 
        tiempo_buena_postura
    )
    VALUES (
        NEW.id_student, 
        NEW.id_scale, 
        v_current_date,  
        YEAR(NEW.practice_datetime), 
        WEEK(NEW.practice_datetime, 3), 
        MONTH(NEW.practice_datetime), 
        NEW.duration, 
        0,                      
        NEW.duration            
    )
    ON DUPLICATE KEY UPDATE
        
        tiempo_total = tiempo_total + NEW.duration,
        
        tiempo_buena_postura = tiempo_buena_postura + NEW.duration;
END$$

DELIMITER ;

DELIMITER $$


DROP TRIGGER IF EXISTS trg_insert_postural_error;


CREATE TRIGGER trg_insert_postural_error
AFTER INSERT ON PosturalError
FOR EACH ROW
BEGIN
    DECLARE v_duracion_error INT;  
    DECLARE v_practice_datetime DATETIME;  
    
    
    SET v_duracion_error = 
        (SUBSTRING_INDEX(NEW.min_sec_end, ':', 1) * 60 + SUBSTRING_INDEX(NEW.min_sec_end, ':', -1)) -
        (SUBSTRING_INDEX(NEW.min_sec_init, ':', 1) * 60 + SUBSTRING_INDEX(NEW.min_sec_init, ':', -1));

    
    SELECT p.practice_datetime INTO v_practice_datetime
    FROM Practice p
    WHERE p.id = NEW.id_practice;

    
    INSERT INTO TiempoPosturasDiarias (
        id_student, 
        id_scale, 
        fecha,
        anio, 
        semana, 
        mes, 
        tiempo_mala_postura, 
        tiempo_buena_postura
    )
    SELECT 
        p.id_student, 
        p.id_scale, 
        DATE(v_practice_datetime),
        YEAR(v_practice_datetime),
        WEEK(v_practice_datetime, 3),
        MONTH(v_practice_datetime),
        v_duracion_error, 
        0  
    FROM Practice p
    WHERE p.id = NEW.id_practice
    ON DUPLICATE KEY UPDATE

        tiempo_mala_postura = tiempo_mala_postura + v_duracion_error,
        tiempo_buena_postura = tiempo_buena_postura - v_duracion_error;
END$$

DELIMITER ;

DELIMITER $$


DROP TRIGGER IF EXISTS trg_acumular_total_notas_diarias;


CREATE TRIGGER trg_acumular_total_notas_diarias
AFTER INSERT ON Practice
FOR EACH ROW
BEGIN
    DECLARE v_current_date DATE;  
    
    SET v_current_date = DATE(NEW.practice_datetime);
    
    INSERT INTO NotasResumenDiarias (
        id_student, 
        id_scale, 
        fecha, 
        anio, 
        semana, 
        mes, 
        notas_correctas, 
        notas_incorrectas
    )
    VALUES (
        NEW.id_student, 
        NEW.id_scale, 
        v_current_date,  
        YEAR(NEW.practice_datetime), 
        WEEK(NEW.practice_datetime, 3), 
        MONTH(NEW.practice_datetime), 
        NEW.total_notes_played, 
        0                       
    )
    ON DUPLICATE KEY UPDATE
        
        notas_correctas = notas_correctas + NEW.total_notes_played;
END$$

DELIMITER ;

DELIMITER $$


DROP TRIGGER IF EXISTS trg_insert_musical_error;


CREATE TRIGGER trg_insert_musical_error
AFTER INSERT ON MusicalError
FOR EACH ROW
BEGIN
    DECLARE v_practice_datetime DATETIME;  
    
    
    SELECT p.practice_datetime INTO v_practice_datetime
    FROM Practice p
    WHERE p.id = NEW.id_practice;

    INSERT INTO NotasResumenDiarias (
        id_student, 
        id_scale, 
        fecha, 
        anio, 
        semana, 
        mes, 
        notas_correctas, 
        notas_incorrectas
    )
    SELECT 
        p.id_student, 
        p.id_scale, 
        DATE(v_practice_datetime),  
        YEAR(v_practice_datetime),
        WEEK(v_practice_datetime, 3),
        MONTH(v_practice_datetime),
        -1,  
        1    
    FROM Practice p
    WHERE p.id = NEW.id_practice
    
    ON DUPLICATE KEY UPDATE
        
        notas_incorrectas = notas_incorrectas + 1,
        notas_correctas = notas_correctas - 1; 
END$$

DELIMITER ;

DELIMITER $$


DROP TRIGGER IF EXISTS trg_progreso_postural;


CREATE TRIGGER trg_progreso_postural
AFTER INSERT ON PosturalError
FOR EACH ROW
BEGIN
    DECLARE v_practice_datetime DATETIME;  
    
    
    SELECT p.practice_datetime INTO v_practice_datetime
    FROM Practice p
    WHERE p.id = NEW.id_practice;
    
    
    INSERT INTO ProgresoErroresPosturales (
        id_student, 
        id_scale, 
        fecha, 
        anio, 
        semana, 
        mes, 
        cantidad_errores
    )
    SELECT 
        p.id_student, 
        p.id_scale, 
        DATE(v_practice_datetime),  
        YEAR(v_practice_datetime),
        WEEK(v_practice_datetime, 3), 
        MONTH(v_practice_datetime),
        1
    FROM Practice p
    WHERE p.id = NEW.id_practice
    ON DUPLICATE KEY UPDATE
        cantidad_errores = cantidad_errores + 1;
END$$

DELIMITER ;

DELIMITER $$


DROP TRIGGER IF EXISTS trg_progreso_musical;


CREATE TRIGGER trg_progreso_musical
AFTER INSERT ON MusicalError
FOR EACH ROW
BEGIN
    DECLARE v_practice_datetime DATETIME;  
    
    
    SELECT p.practice_datetime INTO v_practice_datetime
    FROM Practice p
    WHERE p.id = NEW.id_practice;
    
    
    INSERT INTO ProgresoErroresMusicales (
        id_student, 
        id_scale, 
        fecha, 
        anio, 
        semana, 
        mes, 
        cantidad_errores
    )
    SELECT 
        p.id_student, 
        p.id_scale, 
        DATE(v_practice_datetime),
        YEAR(v_practice_datetime),
        WEEK(v_practice_datetime, 3),
        MONTH(v_practice_datetime),
        1
    FROM Practice p
    WHERE p.id = NEW.id_practice
    ON DUPLICATE KEY UPDATE
        cantidad_errores = cantidad_errores + 1;
END$$

DELIMITER ;

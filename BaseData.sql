INSERT INTO Student (uid, name, email, piano_level)
VALUES ('pedro1', 'Pedro García', 'pedro@prueba.com', 'Intermedio');

INSERT INTO Scale (name, scale_type) VALUES 
('Do Mayor', 'Mayor'),
('Fa menor', 'Menor');

-- IDs de Escala: 1 = Do Mayor, 2 = Fa menor

-- ==========================================================
-- 1. Prácticas en la SEMANA 40 (Del 2025-09-29 al 2025-10-05)
-- ==========================================================

-- Práctica 1: Lunes, 2025-09-29 (Día 1 de la semana de prueba)
-- Práctica larga (360s), 100 notas, en Do Mayor
INSERT INTO Practice (practice_datetime, num_postural_errors, num_musical_errors, duration, bpm, total_notes_played, id_student, id_scale)
VALUES ('2025-09-29 10:00:00', 0, 0, 360, 80, 100, 'pedro1', 1); 
-- ID de práctica: 1

-- Práctica 2: Lunes, 2025-09-29 (Mismo día, diferente escala)
-- Práctica corta (180s), 50 notas, en Fa menor
INSERT INTO Practice (practice_datetime, num_postural_errors, num_musical_errors, duration, bpm, total_notes_played, id_student, id_scale)
VALUES ('2025-09-29 11:00:00', 0, 0, 180, 90, 50, 'pedro1', 2); 
-- ID de práctica: 2

-- Práctica 3: Miércoles, 2025-10-01 (Día 2 de la semana de prueba)
-- Práctica media (300s), 80 notas, en Do Mayor
INSERT INTO Practice (practice_datetime, num_postural_errors, num_musical_errors, duration, bpm, total_notes_played, id_student, id_scale)
VALUES ('2025-10-01 15:00:00', 0, 0, 300, 85, 80, 'pedro1', 1);
-- ID de práctica: 3

-- ==========================================================
-- 2. Insertar Errores Posturales (Activará trg_progreso_postural)
-- ==========================================================

-- Error 1: En Práctica 1 (Do Mayor, 2025-09-29) -> Suma 10s al día 09-29
INSERT INTO PosturalError (min_sec_init, min_sec_end, explication, id_practice)
VALUES ('0:10', '0:20', 'Muñeca caída', 1); -- Duración: 10s

-- Error 2: En Práctica 2 (Fa menor, 2025-09-29) -> Suma 20s al día 09-29
INSERT INTO PosturalError (min_sec_init, min_sec_end, explication, id_practice)
VALUES ('1:00', '1:20', 'Dedos planos', 2); -- Duración: 20s

-- Error 3: En Práctica 3 (Do Mayor, 2025-10-01) -> Suma 10s al día 10-01
INSERT INTO PosturalError (min_sec_init, min_sec_end, explication, id_practice)
VALUES ('0:30', '0:40', 'Espalda encorvada', 3); -- Duración: 10s

-- ==========================================================
-- 3. Insertar Errores Musicales (Activará trg_insert_musical_error)
-- ==========================================================

-- Error 4 y 5: En Práctica 1 (Do Mayor, 2025-09-29) -> 2 errores al día 09-29
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice)
VALUES ('0:45', 'C', 'D', 1),
       ('1:00', 'E', 'F', 1); 

-- Error 6: En Práctica 3 (Do Mayor, 2025-10-01) -> 1 error al día 10-01
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice)
VALUES ('0:15', 'G', 'A', 3);


-- ==========================================================
-- 4. Práctica en la SEMANA 41 (Lunes, 2025-10-06)
-- ==========================================================

-- Práctica 4: Lunes, 2025-10-06 (Inicio de Semana 41)
-- Práctica media (240s), 60 notas, en Fa menor
INSERT INTO Practice (practice_datetime, num_postural_errors, num_musical_errors, duration, bpm, total_notes_played, id_student, id_scale)
VALUES ('2025-10-06 18:00:00', 0, 0, 240, 95, 60, 'pedro1', 2);
-- ID de práctica: 4

-- ==========================================================
-- 5. Errores de la Semana 41
-- ==========================================================

-- Error 7: En Práctica 4 (Fa menor, 2025-10-06) -> Suma 10s y 1 error musical
INSERT INTO PosturalError (min_sec_init, min_sec_end, explication, id_practice)
VALUES ('0:00', '0:10', 'Hombro rígido', 4); -- Duración: 10s

INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice)
VALUES ('0:30', 'B', 'C', 4);

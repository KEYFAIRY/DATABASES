INSERT INTO Student (uid, name, email, piano_level) values ('1','Isabella Rodriguez', 'isabella.rodriguez@example.com', 'Teclado 10');
INSERT INTO Student (uid, name, email, piano_level) values ('2','Ana Beltran', 'ana.beltran@example.com', 'Teclado 2');
INSERT INTO Student (uid, name, email, piano_level) values ('3','Daniel Carvajal', 'daniel.carvajal@example.com', 'Teclado 5');


INSERT INTO Scale (name, scale_type) values ('C', 'Major');
INSERT INTO Scale (name, scale_type) values ('C', 'Minor');
INSERT INTO Scale (name, scale_type) values ('C', 'Armonic');
INSERT INTO Scale (name, scale_type) values ('D', 'Major');
INSERT INTO Scale (name, scale_type) values ('D', 'Minor');
INSERT INTO Scale (name, scale_type) values ('D', 'Armonic');
INSERT INTO Scale (name, scale_type) values ('E', 'Major');
INSERT INTO Scale (name, scale_type) values ('E', 'Minor');
INSERT INTO Scale (name, scale_type) values ('E', 'Armonic');
INSERT INTO Scale (name, scale_type) values ('F', 'Major');
INSERT INTO Scale (name, scale_type) values ('F', 'Minor');
INSERT INTO Scale (name, scale_type) values ('F', 'Armonic');
INSERT INTO Scale (name, scale_type) values ('G', 'Major');
INSERT INTO Scale (name, scale_type) values ('G', 'Minor');
INSERT INTO Scale (name, scale_type) values ('G', 'Armonic');
INSERT INTO Scale (name, scale_type) values ('A', 'Major');
INSERT INTO Scale (name, scale_type) values ('A', 'Minor');
INSERT INTO Scale (name, scale_type) values ('A', 'Armonic');
INSERT INTO Scale (name, scale_type) values ('B', 'Major');
INSERT INTO Scale (name, scale_type) values ('B', 'Minor');
INSERT INTO Scale (name, scale_type) values ('B', 'Armonic');


INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-01-01', '10:00', 2, 3, 15, '1', 1);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-01-03', '11:00', 0, 1, 30, '1', 3);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-01-04', '12:00', 2, 2, 60, '1', 5);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-02-04', '13:00', 3, 0, 10, '1', 15);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-02-06', '14:00', 2, 1, 12, '1', 10);

INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-04-08', '10:00', 5, 9, 20, '2', 2);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-04-09', '11:00', 3, 1, 25, '2', 8);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-04-11', '12:00', 8, 2, 13, '2', 9);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-05-13', '13:00', 4, 4, 10, '2', 13);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-05-15', '14:00', 6, 5, 11, '2', 15);

INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-06-23', '10:00', 6, 5, 25, '3', 4);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-06-25', '11:00', 5, 8, 30, '3', 2);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-06-27', '12:00', 8, 10, 10, '3', 18);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-07-02', '13:00', 9, 12, 15, '3', 21);
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale) values ('2025-07-04', '14:00', 4, 3, 20, '3', 12);

-- Practice id = 1 (num_postural_errors = 2)
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:02', 'Wrist posture incorrect', 1);
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:05', 'Fingers not curved', 1);

-- Practice id = 3 (num_postural_errors = 2)
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:02', 'Wrist posture incorrect', 3);
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:04', 'Fingers not curved', 3);

-- Practice id = 4 (num_postural_errors = 3)
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:02', 'Wrist posture incorrect', 4);
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:04', 'Fingers not curved', 4);
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:06', 'Elbow not aligned', 4);

-- Practice id = 5 (num_postural_errors = 2)
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:08', 'Index finger not curved', 5);
INSERT INTO PosturalError (min_sec, explication, id_practice) values ('00:10', 'Thumb not positioned correctly', 5);

-- Practice id = 6 (num_postural_errors = 5)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:02', 'Wrist too bent inward', 6);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:05', 'Fingers too rigid', 6);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:09', 'Thumb misplaced', 6);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:12', 'Finger lifted unnecessarily', 6);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:18', 'Uneven finger pressure', 6);

-- Practice id = 7 (num_postural_errors = 3)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:04', 'Wrist too bent outward', 7);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:10', 'Fingers too rigid', 7);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:16', 'Thumb misplaced', 7);

-- Practice id = 8 (num_postural_errors = 8)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:02', 'Wrist too bent inward', 8);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:04', 'Wrist too bent outward', 8);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:06', 'Fingers not curved properly', 8);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:08', 'Fingers too rigid', 8);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:10', 'Thumb misplaced', 8);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:12', 'Finger lifted unnecessarily', 8);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:14', 'Uneven finger pressure', 8);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:16', 'Fingers not curved properly', 8);

-- Practice id = 9 (num_postural_errors = 4)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:03', 'Wrist too bent inward', 9);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:07', 'Fingers too rigid', 9);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:11', 'Thumb misplaced', 9);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:15', 'Finger lifted unnecessarily', 9);

-- Practice id = 10 (num_postural_errors = 6)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:02', 'Wrist too bent inward', 10);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:05', 'Wrist too bent outward', 10);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:08', 'Fingers too rigid', 10);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:11', 'Thumb misplaced', 10);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:14', 'Uneven finger pressure', 10);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:18', 'Finger lifted unnecessarily', 10);

-- Practice id = 11 (num_postural_errors = 6)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:02', 'Fingers not curved properly', 11);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:06', 'Wrist too bent outward', 11);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:10', 'Thumb misplaced', 11);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:14', 'Fingers too rigid', 11);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:18', 'Uneven finger pressure', 11);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:22', 'Finger lifted unnecessarily', 11);

-- Practice id = 12 (num_postural_errors = 5)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:03', 'Wrist too bent inward', 12);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:07', 'Fingers not curved properly', 12);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:11', 'Thumb misplaced', 12);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:15', 'Finger lifted unnecessarily', 12);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:20', 'Fingers too rigid', 12);

-- Practice id = 13 (num_postural_errors = 8)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:02', 'Wrist too bent inward', 13);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:04', 'Wrist too bent outward', 13);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:06', 'Fingers not curved properly', 13);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:08', 'Fingers too rigid', 13);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:10', 'Thumb misplaced', 13);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:12', 'Uneven finger pressure', 13);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:14', 'Finger lifted unnecessarily', 13);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:16', 'Fingers too rigid', 13);

-- Practice id = 14 (num_postural_errors = 9)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:02', 'Wrist too bent inward', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:04', 'Wrist too bent outward', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:06', 'Fingers not curved properly', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:08', 'Fingers too rigid', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:10', 'Thumb misplaced', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:12', 'Finger lifted unnecessarily', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:14', 'Uneven finger pressure', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:16', 'Fingers too rigid', 14);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:18', 'Wrist too bent inward', 14);

-- Practice id = 15 (num_postural_errors = 4)
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:03', 'Wrist too bent inward', 15);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:07', 'Fingers not curved properly', 15);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:11', 'Thumb misplaced', 15);
INSERT INTO PosturalError (min_sec, explication, id_practice) VALUES ('00:15', 'Fingers too rigid', 15);


-- Practice 1 (id = 1, num_musical_errors = 3)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:03', 'E4', 'D4', 1);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:07', 'G3', 'F3', 1);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:12', 'A4', 'G4', 1);

-- Practice 2 (id = 2, num_musical_errors = 1)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:05', 'C#4', 'C4', 2);

-- Practice 3 (id = 3, num_musical_errors = 2)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:10', 'F4', 'E4', 3);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:22', 'B3', 'A3', 3);

-- Practice 4 (id = 4, num_musical_errors = 0)

-- Practice 5 (id = 5, num_musical_errors = 1)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:08', 'G#4', 'G4', 5);

-- Practice 6 (id = 6, num_musical_errors = 9)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:02', 'D4', 'C4', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:04', 'F3', 'E3', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:06', 'A4', 'G4', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:08', 'C5', 'B4', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:10', 'B3', 'A3', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:12', 'E4', 'D4', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:14', 'F#4', 'F4', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:16', 'G5', 'F5', 6);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:18', 'C#5', 'C5', 6);

-- Practice 7 (id = 7, num_musical_errors = 1)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:09', 'E3', 'D3', 7);

-- Practice 8 (id = 8, num_musical_errors = 2)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:05', 'A3', 'G3', 8);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:09', 'D5', 'C5', 8);

-- Practice 9 (id = 9, num_musical_errors = 4)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:02', 'B4', 'A4', 9);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:04', 'C#4', 'C4', 9);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:06', 'G3', 'F3', 9);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:08', 'F5', 'E5', 9);

-- Practice 10 (id = 10, num_musical_errors = 5)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:02', 'D4', 'C4', 10);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:04', 'G4', 'F4', 10);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:06', 'B3', 'A3', 10);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:08', 'C#5', 'C5', 10);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:10', 'A4', 'G4', 10);

-- Practice 11 (id = 11, num_musical_errors = 5)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:03', 'E3', 'D3', 11);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:06', 'A4', 'G4', 11);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:09', 'C5', 'B4', 11);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:12', 'F3', 'E3', 11);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:15', 'B5', 'A5', 11);

-- Practice 12 (id = 12, num_musical_errors = 8)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:02', 'D5', 'C5', 12);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:04', 'E3', 'D3', 12);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:06', 'G4', 'F4', 12);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:08', 'B4', 'A4', 12);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:10', 'C#5', 'C5', 12);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:12', 'F5', 'E5', 12);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:14', 'G#3', 'G3', 12);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:16', 'D4', 'C4', 12);

-- Practice 13 (id = 13, num_musical_errors = 10)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:01', 'A3', 'G3', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:02', 'E4', 'D4', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:03', 'C5', 'B4', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:04', 'F3', 'E3', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:05', 'B5', 'A5', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:06', 'D#4', 'D4', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:07', 'A4', 'G4', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:08', 'C3', 'B3', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:09', 'G5', 'F5', 13);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:10', 'F#4', 'F4', 13);

-- Practice 14 (id = 14, num_musical_errors = 12)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:01', 'C4', 'B3', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:02', 'A5', 'G5', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:03', 'E3', 'D3', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:04', 'G#4', 'G4', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:05', 'D5', 'C5', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:06', 'B4', 'A4', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:07', 'C#3', 'C3', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:08', 'F4', 'E4', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:09', 'A3', 'G3', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:10', 'E5', 'D5', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:11', 'G5', 'F5', 14);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:12', 'C4', 'B3', 14);

-- Practice 15 (id = 15, num_musical_errors = 3)
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:03', 'G#3', 'G3', 15);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:07', 'B4', 'A4', 15);
INSERT INTO MusicalError (min_sec, note_played, note_correct, id_practice) VALUES ('00:11', 'C5', 'B4', 15);

CREATE DATABASE IF NOT EXISTS piano_db;
USE piano_db;

CREATE TABLE Student (
    uid VARCHAR(128) PRIMARY KEY, -- UID de Firebase
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    piano_level VARCHAR(50) NOT NULL
);

CREATE TABLE Scale (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    scale_type VARCHAR(50) NOT NULL
);

CREATE TABLE Practice (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date VARCHAR(50) NOT NULL,
    time VARCHAR(50) NOT NULL,
    num_postural_errors NUMERIC,
    num_musical_errors NUMERIC,
    duration NUMERIC,
    id_student VARCHAR(128) NOT NULL,
    id_scale INT NOT NULL,
    FOREIGN KEY (id_student) REFERENCES Student(uid) ON DELETE CASCADE,
    FOREIGN KEY (id_scale) REFERENCES Scale(id) ON DELETE CASCADE
);

CREATE TABLE PosturalError (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_sec VARCHAR(50) NOT NULL,
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


-- ========================
-- Insert sample Students
-- ========================
INSERT INTO Student (uid, name, email, piano_level)
VALUES 
('UID12345', 'Alice Johnson', 'alice@example.com', 'principiante'),
('UID67890', 'Bob Martinez', 'bob@example.com', 'intermedio'),
('UID54321', 'Carla Smith', 'carla@example.com', 'avanzado');

-- ========================
-- Insert sample Scales
-- ========================
INSERT INTO Scale (name, scale_type)
VALUES
('C Major', 'Major'),
('A Minor', 'Minor'),
('G Major', 'Major');

-- ========================
-- Insert sample Practices
-- (Use existing uid from Student and id from Scale)
-- ========================
INSERT INTO Practice (date, time, num_postural_errors, num_musical_errors, duration, id_student, id_scale)
VALUES
('2025-09-02', '10:30', 2, 3, 15, 'UID12345', 1), -- Alice practicing C Major
('2025-09-02', '11:00', 1, 0, 20, 'UID67890', 2), -- Bob practicing A Minor
('2025-09-02', '14:15', 0, 1, 25, 'UID54321', 3); -- Carla practicing G Major

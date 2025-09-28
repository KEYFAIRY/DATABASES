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
    FOREIGN KEY (id_practice) REFERENCES Practice(id) ON DELETE CASCADE,
    CONSTRAINT uq_postural_error UNIQUE (min_sec_init, min_sec_end, explication, id_practice)
);

CREATE TABLE MusicalError (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_sec VARCHAR(50) NOT NULL,
    note_played VARCHAR(10),
    note_correct VARCHAR(10),
    id_practice INT NOT NULL,
    FOREIGN KEY (id_practice) REFERENCES Practice(id) ON DELETE CASCADE,
    CONSTRAINT uq_musical_error UNIQUE (min_sec, note_played, note_correct, id_practice)
);
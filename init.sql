CREATE DATABASE IF NOT EXISTS piano_db;
USE piano_db;

CREATE TABLE Usuario (
    id VARCHAR(128) PRIMARY KEY, -- UID de Firebase
    nombre VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL UNIQUE,
    nivel_teclado VARCHAR(50) NOT NULL
);

CREATE TABLE Practica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_escala VARCHAR(255) NOT NULL,
    fecha VARCHAR(50) NOT NULL,
    hora VARCHAR(50) NOT NULL,
    num_err_postura NUMERIC,
    num_err_musical NUMERIC,
    duracion NUMERIC,
    id_usuario VARCHAR(128) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id) ON DELETE CASCADE
);

CREATE TABLE ErrorPostural (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_seg VARCHAR(50) NOT NULL,
    explicacion VARCHAR(500),
    id_practica INT NOT NULL,
    FOREIGN KEY (id_practica) REFERENCES Practica(id) ON DELETE CASCADE
);

CREATE TABLE ErrorMusical (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_seg VARCHAR(50) NOT NULL,
    nota_tocada VARCHAR(10),
    nota_correcta VARCHAR(10),
    id_practica INT NOT NULL,
    FOREIGN KEY (id_practica) REFERENCES Practica(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ESTUDIANTES (
    idEstudiante INT AUTO_INCREMENT PRIMARY KEY,
    identificacion VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    edad INT,
    email VARCHAR(150),
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS MATERIAS (
    idMateria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS MateriasEstudiantes (
    idEstudiante INT,
    idMateria INT,
    nota DECIMAL(3,2),
    PRIMARY KEY (idEstudiante, idMateria),
    FOREIGN KEY (idEstudiante) REFERENCES ESTUDIANTES(idEstudiante) ON DELETE CASCADE,
    FOREIGN KEY (idMateria) REFERENCES MATERIAS(idMateria) ON DELETE CASCADE
) ENGINE=InnoDB;

-- 1.1: Inserción completa de estudiante
INSERT INTO ESTUDIANTES
    (identificacion, nombres, apellidos, edad, email, activo)
VALUES
    ('10203040', 'Carlos', 'Gómez', 20, 'carlos.gomez@email.com', TRUE);

-- 1.2: Inserción de materia
INSERT INTO MATERIAS
    (nombre, descripcion, activo)
VALUES
    ('Bases de Datos I', 'Fundamentos relacionales y lenguaje SQL', TRUE);

-- 1.3: Matrícula y calificación
INSERT INTO MateriasEstudiantes
    (idEstudiante, idMateria, nota)
VALUES
    (1, 1, 4.5);

-- Ejercicio 2.1: Estudiantes activos
SELECT nombres, apellidos, email
FROM ESTUDIANTES
WHERE activo = TRUE;

-- Ejercicio 2.2: Estudiantes mayores de 18, ordenados por edad
SELECT *
FROM ESTUDIANTES
WHERE edad > 18
ORDER BY edad ASC;

-- Ejercicio 2.3: Registros con nota menor a 3.0
SELECT idEstudiante, nota
FROM MateriasEstudiantes
WHERE nota < 3.0;

-- Ejercicio 2.4: Materias cuyo nombre contiene "Programación"
SELECT *
FROM MATERIAS
WHERE nombre LIKE '%Programación%';

-- Ejercicio 2.5: Estudiante, materia inscrita y nota
SELECT e.nombres, e.apellidos, m.nombre AS materia, me.nota
FROM MateriasEstudiantes AS me
INNER JOIN ESTUDIANTES AS e ON e.idEstudiante = me.idEstudiante
INNER JOIN MATERIAS AS m ON m.idMateria = me.idMateria;

-- Ejercicio 2.6: Todos los estudiantes activos, tengan materias o no
SELECT e.idEstudiante, e.nombres, e.apellidos, m.nombre AS materia, me.nota
FROM ESTUDIANTES AS e
LEFT JOIN MateriasEstudiantes AS me ON me.idEstudiante = e.idEstudiante
LEFT JOIN MATERIAS AS m ON m.idMateria = me.idMateria
WHERE e.activo = TRUE;

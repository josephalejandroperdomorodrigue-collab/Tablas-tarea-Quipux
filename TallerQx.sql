

-- 1. Tabla ESTUDIANTES
CREATE TABLE IF NOT EXISTS ESTUDIANTES (
    idEstudiante INT AUTO_INCREMENT PRIMARY KEY,
    identificacion VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    edad INT,
    email VARCHAR(150),
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- 2. Tabla MATERIAS
CREATE TABLE IF NOT EXISTS MATERIAS (
    idMateria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    activo BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

-- 3. Tabla intermedia: permite la relación N:M y que cualquiera de los lados
-- todavía no tenga registros relacionados (participación 0:N).
CREATE TABLE IF NOT EXISTS MateriasEstudiantes (
    idEstudiante INT,
    idMateria INT,
    nota DECIMAL(3,2),
    PRIMARY KEY (idEstudiante, idMateria),
    FOREIGN KEY (idEstudiante) REFERENCES ESTUDIANTES(idEstudiante) ON DELETE CASCADE,
    FOREIGN KEY (idMateria) REFERENCES MATERIAS(idMateria) ON DELETE CASCADE
) ENGINE=InnoDB;
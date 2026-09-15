-- Biblioteca Campus - Esquema de base de datos (MySQL)

CREATE DATABASE IF NOT EXISTS biblioteca_campus;
USE biblioteca_campus;

-- Tabla Autor
CREATE TABLE Autor (
    AutorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Nacionalidad VARCHAR(50)
);

-- Tabla Libro
CREATE TABLE Libro (
    ISBN VARCHAR(13) PRIMARY KEY,
    Titulo VARCHAR(150) NOT NULL,
    Genero VARCHAR(50),
    Disponible BOOLEAN NOT NULL DEFAULT TRUE
);

-- Tabla intermedia LibroAutor (relación muchos a muchos)
CREATE TABLE LibroAutor (
    ISBN VARCHAR(13) NOT NULL,
    AutorID INT NOT NULL,
    PRIMARY KEY (ISBN, AutorID),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (AutorID) REFERENCES Autor(AutorID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Publicacion (ediciones de un libro)
CREATE TABLE Publicacion (
    PublicacionID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13) NOT NULL,
    Edicion INT NOT NULL,
    FechaPublicacion DATE NOT NULL,
    Editorial VARCHAR(100),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabla Miembro
CREATE TABLE Miembro (
    MiembroID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefono VARCHAR(20),
    FechaRegistro DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- Tabla Transaccion (préstamos y devoluciones)
CREATE TABLE Transaccion (
    TransaccionID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13) NOT NULL,
    MiembroID INT NOT NULL,
    FechaPrestamo DATE NOT NULL,
    FechaDevolucion DATE,
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MiembroID) REFERENCES Miembro(MiembroID)
        ON DELETE CASCADE ON UPDATE CASCADE
);

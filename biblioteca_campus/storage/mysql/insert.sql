USE biblioteca_campus;

-- Autores
INSERT INTO Autor (Nombre, Nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Isabel Allende', 'Chilena'),
('Jorge Luis Borges', 'Argentina'),
('Mario Vargas Llosa', 'Peruana'),
('J.K. Rowling', 'Británica');

-- Libros
INSERT INTO Libro (ISBN, Titulo, Genero, Disponible) VALUES
('9780307474728', 'Cien años de soledad', 'Realismo mágico', TRUE),
('9780525433453', 'La casa de los espíritus', 'Realismo mágico', FALSE),
('9788420633101', 'Ficciones', 'Cuento', TRUE),
('9788420412147', 'La ciudad y los perros', 'Novela', TRUE),
('9780747532699', 'Harry Potter y la piedra filosofal', 'Fantasía', FALSE),
('9780439064873', 'Harry Potter y la cámara secreta', 'Fantasía', TRUE);

-- Relación Libro-Autor
INSERT INTO LibroAutor (ISBN, AutorID) VALUES
('9780307474728', 1),
('9780525433453', 2),
('9788420633101', 3),
('9788420412147', 4),
('9780747532699', 5),
('9780439064873', 5);

-- Publicaciones (ediciones)
INSERT INTO Publicacion (ISBN, Edicion, FechaPublicacion, Editorial) VALUES
('9780307474728', 1, '1967-05-30', 'Editorial Sudamericana'),
('9780307474728', 2, '2007-03-01', 'Debolsillo'),
('9780525433453', 1, '1982-01-01', 'Plaza & Janés'),
('9788420633101', 1, '1944-01-01', 'Sur'),
('9788420412147', 1, '1963-01-01', 'Seix Barral'),
('9780747532699', 1, '1997-06-26', 'Bloomsbury'),
('9780439064873', 1, '1998-07-02', 'Bloomsbury');

-- Miembros
INSERT INTO Miembro (Nombre, Email, Telefono, FechaRegistro) VALUES
('Camila Salazar', 'camila.salazar@campus.edu', '3001234567', '2024-02-10'),
('Daniel Rojas', 'daniel.rojas@campus.edu', '3007654321', '2024-03-15'),
('Laura Pinto', 'laura.pinto@campus.edu', '3009988776', '2024-05-01');

-- Transacciones (préstamos y devoluciones)
INSERT INTO Transaccion (ISBN, MiembroID, FechaPrestamo, FechaDevolucion) VALUES
('9780525433453', 1, '2024-06-01', NULL),
('9780747532699', 2, '2024-06-05', NULL),
('9780307474728', 3, '2024-04-10', '2024-04-20'),
('9788420633101', 1, '2024-05-02', '2024-05-15'),
('9780439064873', 2, '2024-07-01', '2024-07-10');

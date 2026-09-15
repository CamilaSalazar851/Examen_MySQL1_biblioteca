Listar todos los libros disponibles
```sql
SELECT * FROM Libro WHERE Disponible = TRUE;
```

Buscar libros por género
```sql
SELECT * FROM Libro WHERE Genero = 'Fantasía';
```

Obtener información de un libro por ISBN
```sql
SELECT * FROM Libro WHERE ISBN = '9780307474728';
```

Contar el número de libros en la biblioteca
```sql
SELECT COUNT(*) AS TotalLibros FROM Libro;
```

Listar todos los autores
```sql
SELECT * FROM Autor;
```

Buscar autores por nombre
```sql
SELECT * FROM Autor WHERE Nombre LIKE '%García%';
```

Obtener todos los libros de un autor específico
```sql
SELECT l.*
FROM Libro l
JOIN LibroAutor la ON l.ISBN = la.ISBN
JOIN Autor a ON la.AutorID = a.AutorID
WHERE a.Nombre = 'Isabel Allende';
```

Listar todas las ediciones de un libro
```sql
SELECT * FROM Publicacion WHERE ISBN = '9780307474728';
```

Obtener la última edición de un libro
```sql
SELECT * FROM Publicacion
WHERE ISBN = '9780307474728'
ORDER BY FechaPublicacion DESC
LIMIT 1;
```

Contar cuántas ediciones hay de un libro específico
```sql
SELECT COUNT(*) AS TotalEdiciones
FROM Publicacion
WHERE ISBN = '9780307474728';
```

Listar todas las transacciones de préstamo
```sql
SELECT * FROM Transaccion;
```

Obtener los libros prestados actualmente
```sql
SELECT l.*
FROM Libro l
JOIN Transaccion t ON l.ISBN = t.ISBN
WHERE t.FechaDevolucion IS NULL;
```

Contar el número de transacciones de un miembro específico
```sql
SELECT COUNT(*) AS TotalTransacciones
FROM Transaccion
WHERE MiembroID = 1;
```

Listar todos los miembros de la biblioteca
```sql
SELECT * FROM Miembro;
```

Buscar un miembro por nombre
```sql
SELECT * FROM Miembro WHERE Nombre LIKE '%Camila%';
```

Obtener las transacciones de un miembro específico
```sql
SELECT * FROM Transaccion WHERE MiembroID = 1;
```

Listar todos los libros y sus autores
```sql
SELECT l.Titulo, a.Nombre AS Autor
FROM Libro l
JOIN LibroAutor la ON l.ISBN = la.ISBN
JOIN Autor a ON la.AutorID = a.AutorID;
```

Obtener el historial de préstamos de un libro específico
```sql
SELECT t.*
FROM Transaccion t
WHERE t.ISBN = '9780307474728'
ORDER BY t.FechaPrestamo;
```

Contar cuántos libros han sido prestados en total
```sql
SELECT COUNT(DISTINCT ISBN) AS LibrosPrestados FROM Transaccion;
```

Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
SELECT l.Titulo, l.Disponible, p.Edicion, p.FechaPublicacion
FROM Libro l
LEFT JOIN Publicacion p ON l.ISBN = p.ISBN
WHERE p.PublicacionID = (
    SELECT PublicacionID
    FROM Publicacion p2
    WHERE p2.ISBN = l.ISBN
    ORDER BY p2.FechaPublicacion DESC
    LIMIT 1
) OR p.PublicacionID IS NULL;
```

INSERT INTO ejemplo.persona(Identidad, Nombre, FechaNacimiento, Genero, Estado, Telefono)
VALUES ('0210-1970-41253', 'Saul Matute Turcios', '1970-05-19', 'M', 'Casado', '9784-1245');

SELECT * FROM ejemplo.persona;

UPDATE ejemplo.persona 

DELETE FROM ejemplo.persona WHERE Id = 2
drop database if exists AlquilerPeliculas;
create database AlquilerPeliculas;
use AlquilerPeliculas;



-- Crear tabla de clientes


CREATE TABLE TipoTarjeta(id INTEGER PRIMARY KEY AUTO_INCREMENT,
tipoTarjeta varchar(30)

);

CREATE TABLE Tarjetas (
  id_tarjeta INTEGER PRIMARY KEY AUTO_INCREMENT,
  banco VARCHAR(50),
  numeroTarjeta INTEGER,
  FechaExpiracion INTEGER,
  email VARCHAR(50),
  tipoTarjeta INTEGER,
  constraint foreign key (tipoTarjeta) references TipoTarjeta (id)

);

CREATE TABLE Clientes (
  id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  direccion VARCHAR(100),
  telefono VARCHAR(20),
  email VARCHAR(50),
  tarjeta INTEGER,
  constraint foreign key (tarjeta) references Tarjetas (id_tarjeta)

);


create table Generos(id INTEGER PRIMARY KEY AUTO_INCREMENT,
tipoGenero varchar(30)
);

create table Directores(id INTEGER PRIMARY KEY AUTO_INCREMENT,
nombre varchar(30)
);

create table ClasificacionEdades(id INTEGER PRIMARY KEY AUTO_INCREMENT,
tipoClasificacion varchar(30)

);






-- Crear tabla de películas
CREATE TABLE Peliculas (
  id_pelicula INTEGER PRIMARY KEY,
  titulo VARCHAR(100),
  director INTEGER,
  genero INTEGER,
  descripcion TEXT,
  clasificacion_edad INTEGER,
  duracion INTEGER,
  precio_renta FLOAT,
  constraint foreign key (director) references Directores (id),
  constraint foreign key (genero) references Generos (id),
  constraint foreign key (clasificacion_edad) references ClasificacionEdades (id)
);

-- Crear tabla de tiendas
CREATE TABLE Tiendas (
  id_tienda INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  direccion VARCHAR(100),
  telefono VARCHAR(20),
  email VARCHAR(50)
);



CREATE TABLE Tiendas_Peliculas(id INTEGER PRIMARY KEY AUTO_INCREMENT,
id_tienda INTEGER,
id_pelicula INTEGER,
numeroCopias INTEGER,
constraint foreign key (id_tienda) references Tiendas (id_tienda),
  constraint foreign key (id_pelicula) references Peliculas (id_pelicula)

);



-- Crear tabla de rentas
CREATE TABLE Alquileres (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_cliente INTEGER,

  fecha_inicio DATE,
  fecha_finalizacion DATE,

  estado_devolucion INTEGER,
  CONSTRAINT FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
  
  
);

-- Crear tabla de detalles de rentas
CREATE TABLE detalles(
  id_alquiler INTEGER,
  id_tiendaPelicula INTEGER ,

  copiasPelicula INTEGER,
  
  CONSTRAINT FOREIGN KEY (id_alquiler) REFERENCES Alquileres (id),
  CONSTRAINT FOREIGN KEY (id_tiendaPelicula) REFERENCES Tiendas_Peliculas (id)
);


INSERT INTO TipoTarjeta (tipoTarjeta) VALUES ('Visa');
INSERT INTO TipoTarjeta (tipoTarjeta) VALUES ('Mastercard');
INSERT INTO TipoTarjeta (tipoTarjeta) VALUES ('American Express');
INSERT INTO TipoTarjeta (tipoTarjeta) VALUES ('Discover');
INSERT INTO TipoTarjeta (tipoTarjeta) VALUES ('Diners Club');

INSERT INTO Tarjetas (banco, numeroTarjeta, FechaExpiracion, email, tipoTarjeta)
VALUES ('BBVA', 1234567, 1231, 'cliente1@correo.com', 1);

INSERT INTO Tarjetas (banco, numeroTarjeta, FechaExpiracion, email, tipoTarjeta)
VALUES ('Santander', 23456, 1231, 'cliente2@correo.com', 2);

INSERT INTO Tarjetas (banco, numeroTarjeta, FechaExpiracion, email, tipoTarjeta)
VALUES ('Bancomer', 3456789, 1231, 'cliente3@correo.com', 3);

INSERT INTO Tarjetas (banco, numeroTarjeta, FechaExpiracion, email, tipoTarjeta)
VALUES ('HSBC', 456789, 1231, 'cliente4@correo.com', 4);

INSERT INTO Tarjetas (banco, numeroTarjeta, FechaExpiracion, email, tipoTarjeta)
VALUES ('HSBC', 456789, 1231, 'cliente5@correo.com', 5);

INSERT INTO Generos (tipoGenero) VALUES ('Acción');
INSERT INTO Generos (tipoGenero) VALUES ('Comedia');
INSERT INTO Generos (tipoGenero) VALUES ('Drama');
INSERT INTO Generos (tipoGenero) VALUES ('Terror');
INSERT INTO Generos (tipoGenero) VALUES ('Romance');

INSERT INTO Directores (nombre) VALUES ('Steven Spielberg');
INSERT INTO Directores (nombre) VALUES ('Christopher Nolan');
INSERT INTO Directores (nombre) VALUES ('Quentin Tarantino');
INSERT INTO Directores (nombre) VALUES ('Martin Scorsese');
INSERT INTO Directores (nombre) VALUES ('Alfonso Cuarón');

INSERT INTO ClasificacionEdades (tipoClasificacion) VALUES ('A');
INSERT INTO ClasificacionEdades (tipoClasificacion) VALUES ('AA');
INSERT INTO ClasificacionEdades (tipoClasificacion) VALUES ('B');
INSERT INTO ClasificacionEdades (tipoClasificacion) VALUES ('B15');
INSERT INTO ClasificacionEdades (tipoClasificacion) VALUES ('C');


INSERT INTO Peliculas (id_pelicula, titulo, director, genero, descripcion, clasificacion_edad, duracion, precio_renta)
VALUES (1, 'El Padrino', 4, 3, 'La historia de la familia Corleone', 4, 175, 2.99);

INSERT INTO Peliculas (id_pelicula, titulo, director, genero, descripcion, clasificacion_edad, duracion, precio_renta)
VALUES (2, 'La La Land', 5, 5, 'Una historia de amor en Hollywood', 1, 128, 1.99);

INSERT INTO Peliculas (id_pelicula, titulo, director, genero, descripcion, clasificacion_edad, duracion, precio_renta)
VALUES (3, 'El Gran Hotel Budapest', 1, 2, 'Las aventuras de Gustave H. y Zero Moustafa', 2, 99, 1.49);

INSERT INTO Peliculas (id_pelicula, titulo, director, genero, descripcion, clasificacion_edad, duracion, precio_renta)
VALUES (4, 'The Dark Knight', 2, 1, 'El Caballero de la Noche lucha contra el Joker', 4, 152, 2.49);

INSERT INTO Peliculas (id_pelicula, titulo, director, genero, descripcion, clasificacion_edad, duracion, precio_renta)
VALUES (5, 'Parasite', 3, 3, 'Una familia pobre se infiltra en una casa rica', 2, 132, 2.99);

INSERT INTO Tiendas (nombre, direccion, telefono, email)
VALUES ('Blockbuster', 'Av. Insurgentes Sur 1520, Col. Actipan', '555-1234', 'ventas@blockbuster.com');

INSERT INTO Tiendas (nombre, direccion, telefono, email)
VALUES ('Cinepolis', 'Plaza Satélite, Blvd. Manuel Ávila Camacho', '555-5678', 'contacto@cinepolis.com');

INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (1, 1, 5);
INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (1, 2, 10);
INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (1, 3, 3);
INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (2, 1, 2);
INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (2, 4, 7);
INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (1, 2, 4);
INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (2, 3, 1);
INSERT INTO Tiendas_Peliculas (id_tienda, id_pelicula, numeroCopias) VALUES (2, 5, 8);

INSERT INTO Clientes (nombre, direccion, telefono, email, tarjeta)
VALUES ('Juan Perez', 'Calle 1, Ciudad de Mexico', '55-1234-5678', 'juanperez@mail.com', 1);

INSERT INTO Clientes (nombre, direccion, telefono, email, tarjeta)
VALUES ('Maria Garcia', 'Avenida 2, Guadalajara', '33-9876-5432', 'mariagarcia@mail.com', 2);

INSERT INTO Clientes (nombre, direccion, telefono, email, tarjeta)
VALUES ('Pedro Rodriguez', 'Calle 3, Monterrey', '81-2468-1357', 'pedrorodriguez@mail.com', 3);

INSERT INTO Clientes (nombre, direccion, telefono, email, tarjeta)
VALUES ('Ana Martinez', 'Avenida 4, Puebla', '222-7654-321', 'anamartinez@mail.com', 4);

INSERT INTO Clientes (nombre, direccion, telefono, email, tarjeta)
VALUES ('Luisa Gutierrez', 'Calle 5, Tijuana', '664-1597-326', 'luisagutierrez@mail.com', 5);

INSERT INTO Alquileres (id_cliente, fecha_inicio, fecha_finalizacion, estado_devolucion)
VALUES (1, '2023-03-29', '2023-04-7', 0);

INSERT INTO Alquileres (id_cliente, fecha_inicio, fecha_finalizacion, estado_devolucion)
VALUES (2, '2023-03-29', '2023-04-7', 0);

INSERT INTO Alquileres (id_cliente, fecha_inicio, fecha_finalizacion, estado_devolucion)
VALUES (3, '2023-03-29', '2023-04-7', 0);

INSERT INTO Alquileres (id_cliente, fecha_inicio, fecha_finalizacion, estado_devolucion)
VALUES (4, '2023-03-29', '2023-04-7', 0);


-- Detalles del alquiler 1
INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (1, 1, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (1, 2, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (1, 3, 3);

-- Detalles del alquiler 2
INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (2, 2, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (2, 3, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (2, 4, 3);

-- Detalles del alquiler 3
INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (3, 5, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (3, 6, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (3, 7, 3);

-- Detalles del alquiler 4
INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (4, 3, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (4, 4, 3);

INSERT INTO detalles (id_alquiler, id_tiendaPelicula, copiasPelicula)
VALUES (4, 5, 3);



SELECT Peliculas.titulo, Directores.nombre, Generos.tipoGenero, Tiendas_Peliculas.numeroCopias 
FROM Peliculas 
INNER JOIN Directores ON Peliculas.director = Directores.id 
INNER JOIN Generos ON Peliculas.genero = Generos.id 
INNER JOIN Tiendas_Peliculas ON Peliculas.id_pelicula = Tiendas_Peliculas.id_pelicula 
WHERE Peliculas.titulo LIKE '%El Padrino%' OR Directores.nombre LIKE '%nombre_director_buscado%' OR Generos.tipoGenero LIKE '%genero_buscado%' AND Tiendas_Peliculas.numeroCopias > 0;


SELECT Peliculas.titulo
FROM Peliculas
INNER JOIN Tiendas_Peliculas ON Peliculas.id_pelicula = Tiendas_Peliculas.id_pelicula
WHERE Tiendas_Peliculas.id_tienda = 1 AND Tiendas_Peliculas.numeroCopias > 0;


SELECT Tiendas_Peliculas.id_tienda, Peliculas.titulo, detalles.id_tiendaPelicula, Alquileres.fecha_inicio
FROM Tiendas_Peliculas
INNER JOIN detalles ON Tiendas_Peliculas.id = detalles.id_tiendaPelicula
INNER JOIN Alquileres ON detalles.id_alquiler = Alquileres.id
INNER JOIN Peliculas ON Tiendas_Peliculas.id_pelicula = Peliculas.id_pelicula
WHERE Alquileres.estado_devolucion = 0;



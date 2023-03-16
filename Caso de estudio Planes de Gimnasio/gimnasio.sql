drop database if exists gimnasio;
create database gimnasio;
use gimnasio;

create table Sedes(ID int primary key,
nombre varchar(30)
);

create table Clases (ID int primary key,
horario date,
cant_participantes int,
Sede_ID int,
constraint foreign key (Sede_ID) references Sedes(ID)
);

INSERT INTO Sedes (ID, nombre) VALUES (1, 'Sede 1');
INSERT INTO Sedes (ID, nombre) VALUES (2, 'Sede 1');
INSERT INTO Sedes (ID, nombre) VALUES (3, 'Sede 1');
SELECT COUNT(*) FROM Sedes;
INSERT INTO Clases (ID, horario, cant_participantes, Sede_ID) VALUES (1, '2023-03-01', 10, 1);
INSERT INTO Clases (ID, horario, cant_participantes, Sede_ID) VALUES (2, '2023-03-01', 10, 1);
SELECT COUNT(*) FROM Clases;


create table Socios (ID int primary key,
nombre varchar(20),
apellido varchar(20),
documento int
);

create table Clases_Socios(ID int primary key auto_increment,
asistencia boolean,
Clases_ID int,
Socios_ID int,
constraint foreign key (Clases_ID) references Clases(ID),
constraint foreign key (Socios_ID) references Socios(ID)
);

create table Tipo (ID int primary key,
nombre varchar(12)
);
create table Plan (ID int primary key,
nombre varchar(20),
duracion datetime,
Socios_ID int,
Tipo_ID int,
constraint foreign key (Socios_ID) references Socios(ID),
constraint foreign key (Tipo_ID) references Tipo(ID)
);


create table Sesiones (ID int primary key,
nombre varchar(20),
Plan_ID int,
constraint foreign key (Plan_ID) references Plan(ID)
);

create table Ejercicios (ID int primary key,
nombre varchar(12),
descripcion varchar(12),
repeticiones int,
series int,
Sesiones_ID int,
constraint foreign key (Sesiones_ID) references Sesiones(ID)
);

create table Registro (ID int primary key,
observaciones varchar(40),
fecha date,
peso float,
repeticiones int,
series int,
Ejercicios_ID int,
constraint foreign key (Ejercicios_ID) references Ejercicios(ID)
);
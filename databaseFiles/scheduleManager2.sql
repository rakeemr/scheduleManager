CREATE DATABASE ScheduleManagerDB2;
--DROP DATABASE ScheduleManagerDB2;


/*******************************************************
	Dominios de la DB
	Valores que por defecto llevan las mismas forma en
	varias estructuras.
********************************************************/
CREATE DOMAIN T_cedula		CHAR(9)	NOT NULL	CHECK(VALUE SIMILAR TO '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');
CREATE DOMAIN T_id		CHAR(6)		NOT NULL	CHECK(VALUE SIMILAR TO '[A-z][A-z][0-9][0-9][0-9][0-9]');
CREATE DOMAIN T_nombre		VARCHAR(6)	NOT NULL	CHECK(VALUE SIMILAR TO '[A-z]%[0-9][0-9]%');

/*********************************************************
			CREAR TABLAS.
**********************************************************/
CREATE TABLE Profesor
(
	cedula 		T_cedula,
	nombre 		VARCHAR(100)		NOT NULL,
	CONSTRAINT  	PK_cedula_Profesor	PRIMARY KEY (cedula)
);

CREATE TABLE Curso
(
	id 		T_id,
	nombre 		VARCHAR(70)		NOT NULL,
	tipoAula	CHAR			NOT NULL,
	creditos	SMALLINT		NOT NULL,
	semestre	SMALLINT		NOT NULL,
	CONSTRAINT 	PK_id_Curso		PRIMARY KEY (id),
	CONSTRAINT	CHK_semestre_Curso	CHECK(semestre IN (1,2,3,4,5,6,7)),
	CONSTRAINT	CHK_tipoAula_Curso	CHECK(tipoAula IN ('L', 'A')) --L: Laboratorio || A: Aula
);

CREATE TABLE Aula
(
	numero		SMALLINT,
	nombre 		T_nombre,
	capacidad	SMALLINT		DEFAULT 20,
	CONSTRAINT	PK_numero_Aula		PRIMARY KEY (numero)
);

CREATE TABLE ProfesorCurso
(
	id 		T_id,
	cedula		T_cedula,
	CONSTRAINT      PK_id_cedula_ProfesorCurso	PRIMARY KEY (id,cedula),
	CONSTRAINT	FK_id_ProfesorCurso		FOREIGN KEY (id) REFERENCES Curso (id) ON UPDATE CASCADE,
	CONSTRAINT	FK_cedula_ProfesorCurso		FOREIGN KEY (cedula) REFERENCES Profesor (cedula) ON UPDATE CASCADE
);

CREATE TABLE HorarioDisponible
(
	id 		SERIAL,
	cedula		T_cedula,
	dia		VARCHAR(10)			NOT NULL,
	CONSTRAINT      PK_id_HorarioDisponible		PRIMARY KEY (id),
	CONSTRAINT	FK_cedula_HorarioDisponible	FOREIGN KEY (cedula) REFERENCES Profesor (cedula) ON UPDATE CASCADE,
	CONSTRAINT	CHK_dia_HorarioDisponible	CHECK(dia IN ('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes'))
);

/*********************************************************
		INSERCION DE DATOS.
**********************************************************/

/**Profesores**/

INSERT INTO Profesor (cedula,nombre)
VALUES 
('200010001','Gaudy_Esquivel'), --compu
('200020002','Rogelio_Gonzalez'), --compu
('200030003','Rocio_Quiros'), --compu
('200040004','Oscar_Viquez'), --compu
('200050005','Lorena_Valerio'), --compu
('200160016','Diego_Rojas'), --compu
('200070007','Marlen_Trevino'), --compu
('200180018','Shi_Alarcon'), --sociales
('200190019','Rodolfo_Gonzalez'), --sociales
('200120012','Dennis_Valverde'), --compu
('200130013','Abel_Mendez'); --compu

SELECT * FROM Profesor;

/**Cursos**/

INSERT INTO Curso (id,nombre,tipoAula,creditos,semestre)
VALUES
--1 Semestre
('IC1802', 'Introduccion_a_la_programacion', 'L', 3, 1),
('IC1803', 'Taller_de_programacion', 'L', 3, 1),
('CI1403', 'Comunicacion_Tecnica', 'A', 2, 1),
--2 Semestre
('IC2001', 'Estructuras_de_Datos', 'L', 4, 2),
('IC2101', 'Programacion_OO', 'L', 3, 2),
('IC3101', 'Arquitectura_de_Computadores', 'L', 4, 2),
--3 Semestre
('IC3002', 'Analisis_de_Algoritmos', 'L', 4, 3),
('IC4301', 'Bases_de_Datos_I', 'L', 4, 3),
('CS2101', 'Ambiente_Humano', 'A', 2, 3),
--4 Semestre
('IC4700', 'Lenguajes_de_programacion', 'L', 4, 4),
('IC4302', 'Bases_de_Datos_II', 'L', 3, 4),
('IC5821', 'Requerimientos_de_Software', 'A', 4, 4),
--5 Semestre
('IC4810', 'Administracion_de_Proyectos', 'L', 4, 5),
('IC5701', 'Compiladores_e_Interpretes', 'L', 4, 5),
('CS3401', 'Seminario_de_Filosoficos', 'A', 2, 5),
--6 Semestre
('IC7900', 'Compu_y_Sociedad', 'L', 2, 6),
('IC6831', 'Aseguramiento_de_la_Calidad', 'L', 4, 6),
('IC4003', 'Electiva_I', 'L', 3, 6),
('CS3401', 'Seminario_de_Costarricenses', 'A', 2, 6),
--7 Semestre
('IC7602', 'Redes', 'L', 4, 7),
('IC5001', 'Electiva_II', 'L', 3, 7),
('IC7841', 'Proyecto_de_Software', 'L', 4, 7);

SELECT * FROM Curso;

/**Aulas**/

INSERT INTO Aula (numero,nombre)
VALUES
(1, 'A01'),
(2, 'A02'),
(6, 'A06'),
(7, 'A07'),
(10, 'A10'),
(117, 'A117'),
(15, 'A15');

INSERT INTO Aula (numero,nombre,capacidad)
VALUES
(23, 'LAB01', 25),
(24, 'LAB02', 25),
(24, 'LAB03', 26),
(25, 'AUC01', 30);

SELECT * FROM Aula;

/**Profes-Cursos**/

INSERT INTO ProfesorCurso (id,cedula)
VALUES
--1 Semestre
('IC1802', '200120012'),
('IC1803', '200120012'),
('CI1403', '200180018'),
--2 Semestre
('IC2001', '200050005'),
('IC2101', '200070007'),
('IC3101', '200030003'),
--3 Semestre
('IC3002', '200050005'),
('IC4301', '200010001'),
('CS2101', '200190019'),
--4 Semestre
('IC4700', '200160016'),('IC4700', '200040004'),
('IC4302', '200010001'),
('IC5821', '200130013'),
--5 Semestre
('IC4810', '200020002'),
('IC5701', '200040004'),
('CS3401', '200190019'),
--6 Semestre
('IC7900', '200120012'),
('IC6831', '200070007'),
('IC4003', '200160016'),
('CS3401', '200180018'),
--7 Semestre
('IC7602', '200020002'),
('IC5001', '200030003'),
('IC7841', '200130013');

SELECT * FROM ProfesorCurso;

/**HorariosDisponibles**/

INSERT INTO HorarioDisponible (cedula,dia)
VALUES 
('200010001','Lunes'), 
('200010001','Miercoles'),
('200010001','Viernes'),
('200020002','Miercoles'),
('200020002','Viernes'), 
('200030003','Martes'),
('200030003','Miercoles'),
('200030003','Jueves'),
('200040004','Lunes'),
('200040004','Miercoles'),
('200040004','Jueves'),
('200050005','Lunes'),
('200050005','Martes'),
('200050005','Jueves'),
('200160016', 'Martes'),
('200160016', 'Viernes'),
('200070007','Miercoles'),
('200070007','Jueves'),
('200070007','Viernes'),
('200180018','Martes'),
('200180018','Miercoles'),
('200190019','Lunes'),
('200190019','Martes'),
('200120012','Martes'),
('200120012','Miercoles'),
('200120012','Viernes'),
('200130013','Jueves'),
('200130013','Viernes');

SELECT * FROM HorarioDisponible;
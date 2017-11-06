CREATE DATABASE ScheduleManagerDB;
--DROP DATABASE ScheduleManagerDB;

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
('200060006','Rodolfo_Jimenez'), --mate
('200070007','Marlen_Trevino'), --compu
('200080008','Carlos_Guillén'), --mate
('200090009','Dylana_Freer'), --mate
('200100010','Johanny_Vallecillo'), --ingles
('200110011','Sonia_Villegas'), --ingles
('200120012','Dennis_Valverde'), --compu
('200130013','Abel_Mendez'); --compu

SELECT * FROM Profesor;

/**Cursos**/

INSERT INTO Curso (id,nombre,tipoAula,creditos,semestre)
VALUES
--1 Semestre
('CI1311', 'Ingles_1', 'A', 3, 1),
('IC1400', 'Fundamentos_de_computadoras', 'L', 3, 1),
('IC1802', 'Introduccion_a_la_programacion', 'L', 3, 1),
('IC1803', 'Taller_de_programacion', 'L', 3, 1),
('MA0101', 'Mate_General', 'A', 2, 1),
--2 Semestre
('CI1312', 'Ingles_2', 'A', 3, 2),
('IC2001', 'Estructuras_de_Datos', 'L', 4, 2),
('IC2101', 'Programacion_OO', 'L', 3, 2),
('MA1404', 'Calculo', 'A', 4, 2),
--3 Semestre
('CI1313', 'Ingles_3', 'A', 3, 3),
('IC3002', 'Analisis_de_Algoritmos', 'L', 4, 3),
('IC4301', 'Bases_de_Datos_I', 'L', 4, 3),
('MA2405', 'Algebra_Lineal', 'A', 4, 3),
--4 Semestre
('CI1314', 'Ingles_4', 'A', 3, 4),
('IC4700', 'Lenguajes_de_programacion', 'L', 4, 4),
('IC4302', 'Bases_de_Datos_II', 'L', 3, 4),
('MA2404', 'Probabilidades', 'A', 2, 4),
--5 Semestre
('IC4810', 'Administracion_de_Proyectos', 'L', 4, 5),
('IC6821', 'Diseño_de_software', 'L', 4, 5),
('IC5701', 'Compiladores_e_Interpretes', 'L', 4, 5),
('MA3405', 'Estadistica', 'A', 4, 5),
--6 Semestre
('IC7900', 'Compu_y_Sociedad', 'L', 2, 6),
('IC6831', 'Aseguramiento_de_la_Calidad', 'L', 4, 6),
('IC6400', 'Ivestigacion_de_Operaciones', 'A', 4, 6),
--7 Semestre
('IC7602', 'Redes', 'L', 4, 7),
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
(25, 'AUC01', 30);

SELECT * FROM Aula;

/**Profes-Cursos**/

INSERT INTO ProfesorCurso (id,cedula)
VALUES
--1 Semestre
('CI1311', '200110011'),
('IC1400', '200130013'),
('IC1802', '200120012'),
('IC1803', '200120012'),
('MA0101', '200080008'),('MA0101', '200090009'),
--2 Semestre
('CI1312', '200100010'),
('IC2001', '200050005'),('IC2001', '200030003'),
('IC2101', '200070007'),
('MA1404', '200090009'),
--3 Semestre
('CI1313', '200110011'),
('IC3002', '200050005'),
('IC4301', '200010001'),
('MA2405', '200060006'),
--4 Semestre
('CI1314', '200100010'),
('IC4700', '200040004'),
('IC4302', '200010001'),
('MA2404', '200080008'),
--5 Semestre
('IC4810', '200120012'),
('IC6821', '200020002'),
('IC5701', '200040004'),
('MA3405', '200060006'),
--6 Semestre
('IC7900', '200030003'),
('IC6831', '200070007'),
('IC6400', '200060006'),
--7 Semestre
('IC7602', '200020002'),
('IC7841', '200130013');

SELECT * FROM ProfesorCurso;

/**HorariosDisponibles**/

INSERT INTO HorarioDisponible (cedula,dia)
VALUES 
('200010001','Lunes'),
('200010001','Miercoles'),
('200020002','Martes'),
('200020002','Viernes'),
('200030003','Martes'),
('200030003','Jueves'),
('200040004','Miercoles'),
('200040004','Jueves'),
('200050005','Lunes'),
('200050005','Martes'),
('200060006','Martes'),
('200060006','Miercoles'),
('200060006','Jueves'),
('200070007','Martes'),
('200070007','Miercoles'),
('200070007','Jueves'),
('200080008','Martes'),
('200080008','Viernes'),
('200090009','Lunes'),
('200090009','Viernes'),
('200100010','Lunes'),
('200100010','Jueves'),
('200110011','Martes'),
('200110011','Miercoles'),
('200120012','Martes'),
('200120012','Jueves'),
('200130013','Lunes'),
('200130013','Miercoles');

SELECT * FROM HorarioDisponible;
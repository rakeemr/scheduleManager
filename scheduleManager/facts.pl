%Inserciones dinámicas en la BD de conocimiento.

:- dynamic profesor/2.

profesor(200010001,Gaudy_Esquivel).
profesor(200020002,Rogelio_Gonzalez).
profesor(200030003,Rocio_Quiros).
profesor(200040004,Oscar_Viquez).
profesor(200050005,Lorena_Valerio).
profesor(200060006,Rodolfo_Jimenez).
profesor(200070007,Marlen_Trevino).
profesor(200080008,Carlos_Guillen).
profesor(200090009,Dylana_Freer).
profesor(200100010,Johanny_Vallecillo).
profesor(200110011,Sonia_Villegas).
profesor(200120012,Dennis_Valverde).
profesor(200130013,Abel_Mendez).
profesor(200160016,Diego_Rojas).
profesor(200070007,Marlen_Trevino).
profesor(200180018,Shi_Alarcon).
profesor(200190019,Rodolfo_Gonzalez).

:- dynamic curso/5.

curso(CI1311, Ingles_1, A, 3, 1).
curso(IC1400, Fundamentos_de_computadoras, L, 3, 1).
curso(IC1802, Introduccion_a_la_programacion, L, 3, 1).
curso(IC1803, Taller_de_programacion, L, 3, 1).
curso(MA0101, Mate_General, A, 2, 1).
curso(CI1403, Comunicacion_Tecnica, A, 2, 1).

curso(CI1312, Ingles_2, A, 3, 2).
curso(IC2001, Estructuras_de_Datos, L, 4, 2).
curso(IC2101, Programacion_OO, L, 3, 2).
curso(MA1404, Calculo, A, 4, 2).
curso(IC3101, Arquitectura_de_Computadores, L, 4, 2).

curso(CI1313, Ingles_3, A, 3, 3).
curso(IC3002, Analisis_de_Algoritmos, L, 4, 3).
curso(IC4301, Bases_de_Datos_I, L, 4, 3).
curso(MA2405, Algebra_Lineal, A, 4, 3).
curso(CS2101, Ambiente_Humano, A, 2, 3).

curso(CI1314, Ingles_4, A, 3, 4).
curso(IC4700, Lenguajes_de_programacion, L, 4, 4).
curso(IC4302, Bases_de_Datos_II, L, 3, 4).
curso(MA2404, Probabilidades, A, 2, 4).
curso(IC5821, Requerimientos_de_Software, A, 4, 4).

curso(IC4810, Administracion_de_Proyectos, L, 4, 5).
curso(IC6821, Disenno_de_software, L, 4, 5).
curso(IC5701, Compiladores_e_Interpretes, L, 4, 5).
curso(MA3405, Estadistica, A, 4, 5).
curso(CS3401, Seminario_de_Filosoficos, A, 2, 5).

curso(IC7900, Compu_y_Sociedad, L, 2, 6).
curso(IC6831, Aseguramiento_de_la_Calidad, L, 4, 6).
curso(IC6400, Ivestigacion_de_Operaciones, A, 4, 6).
curso(IC4003, Electiva_I, L, 3, 6).
curso(CS3401, Seminario_de_Costarricenses, A, 2, 6).

curso(IC7602, Redes, L, 4, 7).
curso(IC7841, Proyecto_de_Software, L, 4, 7).
curso(IC5001, Electiva_II, L, 3, 7).

:- dynamic aula/3.

aula(1, A01, 20).
aula(2, A02, 20).
aula(6, A06, 20).
aula(7, A07, 20).
aula(10, A10, 20).
aula(117, A117, 20).
aula(15, A15, 20).
aula(23, LAB01, 25).
aula(24, LAB02, 25).
aula(25, AUC01, 30).
aula(24, LAB03, 26).

:- dynamic profe_curso/2.

profe_curso(CI1311, 200110011).
profe_curso(IC1400, 200130013).
profe_curso(IC1802, 200120012).
profe_curso(IC1803, 200120012).
profe_curso(MA0101, 200080008).
profe_curso(MA0101, 200090009).
profe_curso(CI1403, 200180018).
profe_curso(CI1312, 200100010).
profe_curso(IC2001, 200050005).
profe_curso(IC2001, 200030003).
profe_curso(IC2101, 200070007).
profe_curso(MA1404, 200090009).
profe_curso(IC3101, 200030003).
profe_curso(CI1313, 200110011).
profe_curso(IC3002, 200050005).
profe_curso(IC4301, 200010001).
profe_curso(MA2405, 200060006).
profe_curso(CS2101, 200190019).
profe_curso(CI1314, 200100010).
profe_curso(IC4700, 200040004).
profe_curso(IC4302, 200010001).
profe_curso(MA2404, 200080008).
profe_curso(IC4700, 200160016).
profe_curso(IC5821, 200130013).
profe_curso(IC4810, 200120012).
profe_curso(IC6821, 200020002).
profe_curso(IC5701, 200040004).
profe_curso(MA3405, 200060006).
profe_curso(IC4810, 200020002).
profe_curso(CS3401, 200190019).
profe_curso(IC7900, 200030003).
profe_curso(IC6831, 200070007).
profe_curso(IC6400, 200060006).
profe_curso(IC7900, 200120012).
profe_curso(IC4003, 200160016).
profe_curso(CS3401, 200180018).
profe_curso(IC7602, 200020002).
profe_curso(IC7841, 200130013).
profe_curso(IC5001, 200030003).

:- dynamic horario_disponible/2.

horario_disponible(200010001,Lunes).
horario_disponible(200010001,Miercoles).
horario_disponible(200020002,Martes).
horario_disponible(200020002,Viernes).
horario_disponible(200030003,Martes).
horario_disponible(200030003,Jueves).
horario_disponible(200040004,Miercoles).
horario_disponible(200040004,Jueves).
horario_disponible(200050005,Lunes).
horario_disponible(200050005,Martes).
horario_disponible(200060006,Martes).
horario_disponible(200060006,Miercoles).
horario_disponible(200060006,Jueves).
horario_disponible(200070007,Martes).
horario_disponible(200070007,Miercoles).
horario_disponible(200070007,Jueves).
horario_disponible(200080008,Martes).
horario_disponible(200080008,Viernes).
horario_disponible(200090009,Lunes).
horario_disponible(200090009,Viernes).
horario_disponible(200100010,Lunes).
horario_disponible(200100010,Jueves).
horario_disponible(200110011,Martes).
horario_disponible(200110011,Miercoles).
horario_disponible(200120012,Martes).
horario_disponible(200120012,Jueves).
horario_disponible(200130013,Lunes).
horario_disponible(200130013,Miercoles).
horario_disponible(200160016,Martes).
horario_disponible(200160016,Viernes).
horario_disponible(200180018,Martes).
horario_disponible(200180018,Miercoles).
horario_disponible(200190019,Lunes).
horario_disponible(200190019,Martes).

cargar(A):-exists_file(A),consult(A).

cumple(IdProfe,IdCurso,IdAula,Dia,Sem):-
    profe_curso(IdCurso,IdProfe),
    curso(IdCurso,_,_,_,Sem),
    aula(IdAula,_,_),
    horario_disponible(IdProfe,Dia).










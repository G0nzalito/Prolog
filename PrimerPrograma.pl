padre(alberto, pepe).
padre(juan, pepe).
padre(jesus, pepe).
padre(alan, jesus).

hermano(A,B) :- padre(A, P), padre(B, P), A \== B.
nieto(A, B) :- padre(B, H), padre(H, A), A \== B.

aspirante('30000000','Lara','Pointer','11111',domicilio('Suipacha',250)).
aspirante('35000000','Tina','Jolié','22222',domicilio('SanMartín',101)).
aspirante('25000000','Paty','Pérez','44444',domicilio('Rivadavia',1321)).
aspirante('20000000','Matilde','Smith','99999',domicilio('9 de Julio',2123)).

evaluacion(1,'30000000',fecha(12,5,2019),['A','B','C'],[10,15,20]).
evaluacion(2,'20000000',fecha(12,5,2019),['B','C'],[12,15]).
evaluacion(3,'30000000',fecha(19,5,2019),['D','E'],[19,18]).
evaluacion(4,'20000000',fecha(19,5,2019),['A','D','E'],[6,15,12]).
evaluacion(5,'30000000',fecha(1,6,2019),['F'],[15]).

item('A','Uniforme',10).
item('B','Trabajo colaborativo',15).
item('C','Cumplimiento de tareas',20).
item('D','Compañerismo',20).
item('E','Idioma inglés',20).
item('F','Idioma portugués',15).

ensena(alejandra, juan).

trabaja(lara,panaderia(sucursal,12)).
trabaja(vera,taller(seccion,97,c)).
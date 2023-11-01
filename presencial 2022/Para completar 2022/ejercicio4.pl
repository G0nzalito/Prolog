% HECHOS

sintoma('Fiebre', 'Gripe').
sintoma('Tos', 'Gripe').
sintoma('Cansancio', 'Anemia').
sintoma('Ardor', 'Gastritis').
sintoma('Nausea','Gastritis').
sintoma('Vomitos','Gastritis').
sintoma('Vomitos','Apendicitis').
sintoma('Fiebre','Apendicitis').

remedio('Jarabe', 'Gripe').
remedio('Aspirinas','Gripe').
remedio('Vitaminas','Anemia').
remedio('Dieta','Gastritis').
remedio('Cirugia','Apendicitis').

enfermo(juan,'Gripe').
enfermo(alicia,'Anemia').
enfermo(patricio,'Apendicitis').
enfermo(pedro,'Gripe').
enfermo(ricardo,'Gripe').
enfermo(roxana,'Gastritis').

trabaja('mati', taller(57, 'Mecanica', 'Asalariado')).


% Predicados

% En el parcial no nos van a decir cuando utilizar la funcion de corte, tenemos que darnos cuenta nostros si esa consigna nos esta
% pidiendo una condicion de corte o no
% ¿Hay alguna persona con gastritis? funcion de corte 
% ¿Que remedios hay para la Nausea? no funcion de corte 


enfermo_de(Sintoma, A) :- sintoma(Sintoma, A).
remeDio_para(Sintoma, Remedio) :-  sintoma(Sintoma, Enfermedad), remedio(Remedio, Enfermedad).
sintomas_de(Enfermo, Sintoma) :- enfermo(Enfermo, Enfermedad), sintoma(Sintoma, Enfermedad).

%Esta resuelto


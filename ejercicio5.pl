% HECHOS
%
% vuelo(Numero de vuelo, procedencia, hora programa, hora de arribo,
% estado del vuelo, numero de linea).
vuelo('LN 481','Santiago de Chile','11:20','11:30','Aterrizado',1).
vuelo('AU 2358','Salta','13:00','13:05','Aterrizado',2).
vuelo('CM 101','Panama','15:00','','Demorado',3).
vuelo('G3 7364','Rio de Janeiro','15:40','16:00','Aterrizado',4).
vuelo('LN 2423','Aeroparque','16:00','','Cancelado',1).
vuelo('AU 1502','Mendoza','17:00','17:10','Aterrizado',2).
vuelo('AU 2818','Aeroparque','18:00','18:20','Aterrizado',2).
vuelo('AU 2590','Aeroparque','20:00','20:10','Aterrizado',2).
linea(1,'Lan Chile').
linea(2,'Austral').
linea(3,'Copa Airlines').
linea(4,'Gol').


% Se solicita definir las reglas que nos permitan responder las
% siguientes consultas:
%

%  1. Informar el n�mero de vuelo y el estado de los arribos cuya
% procedencia es Aeroparque.
%

regla1(NumeroVuelo, Estado) :- vuelo(NumeroVuelo, 'Aeroparque', _, _, Estado, _).

%  2. Informar el n�mero de vuelo, el nombre de la l�nea y la
%  procedencia de los vuelos cancelados.
%

regla2(NumeroVuelo, Linea, Procedencia) :- vuelo(NumeroVuelo, Procedencia,_ , _, 'Cancelado', CodigoLinea ), linea(CodigoLinea, Linea).


%  3. Informar n�mero de vuelo, procedencia y hora estimada de arribo de
% los arribos que pertenezcan a un determinado nombre de l�nea.



%  4. Mostrar procedencia y hora de arribo de los vuelos cuyo estado es
% Aterrizado.



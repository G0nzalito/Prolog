%hechos

chofer(10101,'Juan_de_la_Prueba',direccion('Cabrera',123),12.45,'No',licencia(2018,'D1')).
chofer(10021,'German_de_la_Prueba',direccion('Alvear',125),12.45,'Si',licencia(2016,'D2')).
chofer(10034,'Jose_de_la_Prueba',direccion('Santiago_del_Estero',454),15.60,'Si',licencia(2016,'D2')).
chofer(10343,'Esteban_de_la_Prueba',direccion('San_Juan',556),15.60,'No',licencia(2017,'D1')).
chofer(12034,'Carlo_de_la_Prueba',direccion('San_Martin',52),11.50,'No',licencia(2017,'D2')).
chofer(44312,'Ignacio_de_la_Prueba',direccion('Belgrano',435),12.45,'Si',licencia(2017,'D2')).
chofer(14553,'Marcos_de_la_Prueba',direccion('Belgrano',743),12.45,'Si',licencia(2016,'D1')).
chofer(4532,'Oscar_de_la_Prueba',direccion('Ayacucho',566),15.60,'No',licencia(2018,'D2')).
chofer(12344,'Mariano_de_la_Prueba',direccion('Vilcapugio',454),11.50,'Si',licencia(2018,'D2')).
chofer(34398,'Juan_Carlos_de_la_Prueba',direccion('Salta',124),14.80,'No',licencia(2018,'D1')).

tramo(1,'Tramo_A',200,1,6,10101).
tramo(2,'Tramo_B',150,4,3,12034).
tramo(3,'Tramo_C',80,4,2,10343).
tramo(4,'Tramo_D',150,6,5,44312).
tramo(5,'Tramo_E',100,1,2,14553).
tramo(6,'Tramo_F',200,1,4,10101).
tramo(7,'Tramo_G',80,1,5,12344).
tramo(8,'Tramo_H',200,5,1,34398).
tramo(9,'Tramo_I',150,5,4,4532).

localidad(1,'Cordoba').
localidad(2,'Coronel_Moldes').
localidad(3,'Adelia_Maria').
localidad(4,'Rio_Cuarto').
localidad(5,'Villa_Maria').
localidad(6,'San_Francisco').

hijos(10101, ['maximo','matias','leo']).
hijos(10021,['tiziana']).
hijos(10034,[]).

% Determinar Nombre, Direcci�n completa y
% Refrigerio de los choferes que
% tiene tramos con Origen en la Ciudad de C�rdoba
%
% En item1 esta repetidos porque un chofer puede tener m�s de un tramo


% Informar el Nombre del chofer, la localidad de origen, la localidad
% de destino y el nombre del tramo de
% aquellos tramos cuya distancia es superior a
% un valor de referencia





% 3. Determinar por cada chofer cual es el total que se le paga por
% recorrer el tramo asignado sabiendo que el total se calcula como el
% producto entre la distancia del tramo por el precio por kil�metro
% m�s un 20% adicional si cobra refrigerio.


%4. Indicar la cantidad de choferes que tienen un tipo de licencia X.




%5. Indicar la cantidad de tramos definidos para un Origen X.




%6. Listar el nombre del chofer, la direcci�n, el total a cobrar de
% todos aquellos choferes que tengan la licencia de un tipo X.





%7. Indicar el nombre de los choferes que tienen m�s de 2 hijos.
% Resultado:
% ?-  punto7(Nombre).
% Nombre = 'Jose_de_la_Prueba'

%hijos(10101, ['maximo','matias','leo']).
%hijos(10021,['tiziana']).
%hijos(10034,[]).


%8. Indicar el nombre de los choferes que tienen un hijo llamado
% "maximo"
%Resultado: ?- punto8(Nombre).
%hijos(10101, ['maximo','matias','leo']).
%hijos(10021,['tiziana']).
%hijos(10034,[]).


% 9. Mostrar el sueldo que perciben los choferes que tienen m�s de 2
% hijos.
% Resultado:
%?- punto9(Nombre,Monto).


%10. Determine cual es la cantidad de hijos promedio entre los choferes.


% EXTRA
% Desarrollar una regla que indique si existe o no
% un chofer con una licencia que se vence en el a�o 2018.

% Soluciones 
%item1(Nombre,Calle,Numero,Refrigerio):-

%    chofer(Leg,Nombre,direccion(Calle,Numero),_,
%           Refrigerio,_),
%    tramo(_,_,_,Origen,_,Leg),
%    localidad(Origen,'Cordoba').


%item1_op(ResLista):-
%    findall((Nombre,Calle,Numero,Refrigerio) ,
%            item1(Nombre,Calle,Numero,Refrigerio) ,
%            Lista),
%    sort(Lista,ResLista).

%item2(Nombre,Origen,Destino,Tramo,X):-
%    chofer(Leg,Nombre,_,_,_,_),
%    tramo(_,Tramo,Distancia,NumOrigen,NumDestino,Leg),
%    localidad(NumOrigen,Origen),
%    localidad(NumDestino,Destino),
%    X < Distancia.

%item3(Nom, Tramo,Total):-
%    chofer(Leg,Nom,_,Precio,Ref,_),
%    tramo(_,Tramo,Distancia,_,_,Leg),
%    Total is Distancia * Precio,
 %   (
%
 %         (Ref=='Si', Total is Total + Total * 20 / 100)
  %         ;
   %       (Ref=='No', Total is Total)
    %).

%item4(X,Cantidad):-
 %   findall(Leg,
  %         chofer(Leg,_,_,_,_,licencia(_,X)),
   %         ListaAux
    %       ),
 %   length(ListaAux, Cantidad).

%item5(X,Cantidad):-
    %findall(Num,
   %        tramo(Num,_,_,X,_,_),
  %         ListaAux
 %          ),
%    length(ListaAux, Cantidad).

%item6_aux(Nom,Calle,Numero,Total,X):-
  %  chofer(Leg,Nom,direccion(Calle,Numero),_,_,licencia(_,X)),
 %   tramo(_,Tramo,_,_,_,Leg),
 %   item3(Nom, Tramo,Total).

%item6(X,Lista):-
%
%    findall(
%             (Nom,Calle,Numero,Total),
%              item6_aux(Nom,Calle,Numero,Total,X),
%              ListaAux
%    ),
%    sort(ListaAux, Lista).


%
% Distancia total recorrida en todos los tramos
%
%
%reglaExtra(TotalKmRecorridos):-
%    findall(Distancia,
%           tramo(_,_,Distancia,_,_,_),
%            ListaAux
%           ),
%    sumlist(ListaAux,TotalKmRecorridos).
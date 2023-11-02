%HECHOS

% mueble(cod,descripcion,disponibilidad,precio unitario, cod categoria,
% matrias primas).
mueble('00100','Mesa de luz',300,1500.00,1,['A','B','C']).
mueble('00101','Placard infantil',500,2000.00,1,['A','B']).
mueble('00102','Cucheta madera',400,2800.00,2,['C']).
mueble('00103','Ropero',550,1850.00,3,['A','C']).

%venta(fact,cod mueble, cliente, fecha(dia,mes,anio),cant pedida, desc).
venta('55555','00101','Martinez Mario',fecha(11,06,2020),30,0).
venta('66666','00102','Casablanca Laura',fecha(05,06,2020),150,5).
venta('77777','00100','Bartoli Mar�a',fecha(12,07,2020),260,5).
venta('88888','00103','Altamirano Juan',fecha(16,08,2020),50,0).

%categoria(cod, descripcion)
categoria(1,'Infantil').
categoria(2,'Camas').
categoria(3,'Roperos').


% 1) Conocer si entre las ventas de muebles, existe alguna venta cuyo c�digo de factura es igual a un
% valor pasado como argumento. Predicado sugerido para esta regla:
% regla1/1. (15 puntos).

regla1(Codigo) :- venta(Codigo1,_,_,_,_,_), Codigo == Codigo1,!.
  

% 2) Conocer para las ventas de muebles cuyo mes de facturaci�n se deber� especificar, los siguientes
% datos: cliente, c�digo de factura, cantidad pedida, descripci�n del
% mueble y descuento. Predicado
% sugerido para esta regla: regla2/6.

regla2(Mes, Cliente, CodigoFactura, CantPed, Descripcion, Descuento) :- venta(CodigoFactura, CodigoMueble, Cliente, fecha(_,Mes,_), CantPed, Descuento), 
                                                                        mueble(CodigoMueble, Descripcion,_,_,_,_).

% 3) Generar una lista con todos los nombres de las categor�as de aquellos muebles que dispongan
% una disponibilidad superior a un determinado valor, y que haya usado
% para su fabricaci�n la
% materia prima A. Considerar la posibilidad de que la lista generada
% pueda figurar categor�as
% repetidas, por lo que se deber� evitar esta situaci�n. Predicado
% sugerido para esta regla:
%regla3/2. (20 puntos)

%NO VA AL PARCIAL







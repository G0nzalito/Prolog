
area(1,'Gerencia').
area(2,'Marketing').
area(3,'Limpieza').

localidad(1,'Cordoba').
localidad(2,'Capilla del Monte').
localidad(3,'Calamuchita').
localidad(4,'Laborde').

trabajador(111,'Maria','Richardi',domicilio('Jujuy',142,1),3,contrato(24,25.5,5)).
trabajador(222,'Diana','Bambini',domicilio('Calle 1',339,3),3,contrato(20,25.5,7)).
trabajador(333,'Lara','Pointer',domicilio('Peru',721,3),2,efectivo(2200,1,2)).
trabajador(444,'Victoria','Dove',domicilio('Jujuy',344,4),2,efectivo(2000,12,1.5)).
trabajador(555,'Ximena','Coraggio',domicilio('Salta',545,1),3,contrato(24,25.5,8)).
trabajador(666,'Gaspar','Gioia',domicilio('Chile',123,2),3,contrato(10,25.5,7)).
trabajador(777,'Vera','Petro',domicilio('Salta',888,2),1,efectivo(2500,8,2.5)).
trabajador(888,'Gaston','Bravi',domicilio('Lujan',104,1),2,efectivo(1800,9,2)).

% 1) Legajo, cantidad de horas trabajadas al mes y nombre del
% area en la que trabajan todos los empleados contratados.
regla1(Legajo, HorasTrabajadas, Area) :- trabajador(Legajo, _, _, domicilio(_,_,_), NumArea, contrato(Dias,_,Horas)), area(NumArea, Area), HorasTrabajadas is Dias * Horas.

% 2)Legajo, nombre, apellido, nombre de la localidad, nombre del area y
% cantidad de horas trabajadas por mes de aquellos empleados contratados
% que trabajen al mes mas de 125 hs
regla2(Legajo, Nombre, Apellido, Localidad, Area, HorasTrabajadas) :- trabajador(Legajo, Nombre, Apellido, domicilio(_,_,CodLoc), NumArea, contrato(Dias,_,Horas)), 
        HorasTrabajadas is Dias * Horas, HorasTrabajadas > 125, area(NumArea, Area), localidad(CodLoc, Localidad).

%  3)Legajo, nombre, apellido, nombre de la localidad, nombre del
%  area y antiguedad de aquellos empleados efectivos con mas de 10
%  anios de antiguedad.
regla3(Legajo, Nombre, Apellido, Localidad, Area, Antiguedad) :- trabajador(Legajo, Nombre, Apellido, domicilio(_,_,CodLoc), NumArea, efectivo(_,Antiguedad,_)), Antiguedad > 10, 
        area(NumArea, Area), localidad(CodLoc, Localidad). 

% 4)Legajo y salario (sin incluir los viaticos) de todos los empleados,
% tanto contratados como efectivos
regla4(Legajo, Salario) :-  (trabajador(Legajo, _, _, domicilio(_,_,CodLoc), _, contrato(CantDias, PrecHora, HsDia)), 
                            
                                ((not(CodLoc =:= 1),
                                    Salario is ((CantDias * PrecHora * HsDia) - 250));
                            
                                CodLoc =:= 1,                             
                                    (Salario is CantDias * PrecHora * HsDia)));
                            
                            (trabajador(Legajo, _, _, domicilio(_,_,_), _, efectivo(Basico, Antiguedad, CoefAument)), 
                                (Salario is (Basico + (Basico * Antiguedad * (CoefAument/100))))).

%  5)Legajo, nombre, apellido, area y localidad de los empleados a los que
%  les corresponde viaticos

regla5(Legajo, Nombre, Apellido, Area, Localidad) :- trabajador(Legajo, Nombre, Apellido, domicilio(_,_,CodLoc), CodArea, contrato(_,_,_)), not(CodLoc =:= 1), 
        localidad(CodLoc, Localidad), area(CodArea, Area).

% 6) Legajo y salario final (incluyendo viaticos a quienes les
% corresponda) de todos los empleados, tanto contratados como efectivos.

regla6(Legajo, Salario) :-  (trabajador(Legajo, _, _, domicilio(_,_,_), _, contrato(CantDias,PrecHora,HsDia)), not(CantDias =:= (-1)), Salario is CantDias * PrecHora * HsDia); 
                            (trabajador(Legajo, _, _, domicilio(_,_,_), _, efectivo(Basico,_,_)), not(Basico =:= (-1)), regla4(Legajo, Salario)).    

%Esta resuelto

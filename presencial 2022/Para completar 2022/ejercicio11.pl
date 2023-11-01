
%Hechos
usuario(2, trial(guille, fecha(10, 10, 2021))).
usuario(3, trial(luis, fecha(29, 9, 2021))).
usuario(4, trial(carlos, fecha(21, 9, 202))).
usuario(5, premium(martin, 1000)).


%Punto 1
% 1) El predicado estaVigente/1 determina si una cuenta de usuario trial se creo hace un mes.

hoy(fecha(15,10,2021)).

estaVigente(Nombre) :-
                    usuario(_, trial(Nombre, fecha(DD, MM, AA))), hoy(fecha(DH, MH, AH)),
                    (AA =:= AH, 
                        (
                            (MM =:= MH);
                            (MM =\= MH, (MH - MM) =:= 1, DH >= DD)
                        )
                    ),!.

estaVigente2(Nombre) :-
                    usuario(_, trial(Nombre, fecha(DD, MM, AA))), hoy(fecha(DH, MH, AH)),
                    ((DH + MH * 30 + AH * 365) - (DD + MM * 30 + AA * 365)) =< 30.


% Punto 2
% 2) El predicado estaDisponible/1 indica si un nombre de usuario esta disponible, es decir, no fue tomado aun,
% por ningun usuario premium ni trial.
%
esta_disponible(Nombre) :- not(estaVigente2(Nombre); (usuario(_, premium(Nombre1,_)), Nombre == Nombre1)).   
        


% quicksort(+Lista, -R).
% Es cierto si R unifica con una lista que contiene
% los elementos de Lista ordenados de menor a mayor
% Lista puede contener elementos repetidos.

quicksort([],[]).

quicksort([Ca|Resto],  R) :-
	dividir(Ca, Resto, Me, Ma), % Dividimos en trozos
	quicksort(Me,RMe), % Aplico quicksort para los menores
	quicksort(Ma,RMa), % Aplico quicksort para los mayores
	append(RMe, [Ca|RMa], R). % Concateno ambas soluciones (pivote en medio)
	
	
	
% dividir(+P, +Lista, -Menores, -Mayores)
% Es cierto cuando Menores unifica con los elementos
% de Lista que son menores o iguales que P y Mayores
% unifica con los elementos de Lista que son maores
% que P.

dividir(_,[],[],[]).

dividir(P,[Ca|R], [Ca|Me], Ma) :- Ca =< P , dividir(P,R,Me,Ma).
dividir(P,[Ca|R], Me, [Ca|Ma]) :- Ca > P , dividir(P,R,Me,Ma).
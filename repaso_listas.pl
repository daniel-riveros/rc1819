% ------------------------- Repaso de Funcionamiento de listas --------------------------------

% Primer ejercicio debemos invertir una lista

% invertir(+ListaE, -ListaR) es cierto cuando ListaR unifica
% con una lista que contiene los mismos elementos que listaE
% con el orden inverso.


invertir([],[]).

invertir([Cabeza | Resto], R1) :- 
				invertir(Resto, R),
				append(R, [Cabeza], R1).

% Segundo ejercicio, concatenar dos listas

% concatena(+ListaE1, +ListaE2, -ListaR) es cierto cuando
% ListaR unifica con las dos primeras listas una tras otra

concatena([], L, L).

concatena([Ca|Res], L, [Ca|R1]) :- concatena(Res, L, R1).


% -----------------------------------------------------
% ordena_burbuja(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.

% BubleSort funciona poniendo siempre en la posición primera el elemento mayor

% Append es una herramienta muy potente que debemos usar muchas veces, sobre todo con
% casos de manejo de listas con lo cual debemos saber bien que implementa. 
% En el caso de la ordenación de burbuja escoge dos elementos.

% -----------------------------------------------------

ordena_burbuja(Lista, Lista):- ordenada(Lista).

ordena_burbuja(Lista, RT):-
			append(Ini,[E1,E2|Fin], Lista),
			E1 > E2,
			append(Ini, [E2,E1|Fin], R),
			ordena_burbuja(R, RT).




% Debemos implementar el método ordenada para la comprobación del caso base
% ordenada(L1) es cierto si L1 estaordenada


ordenada([]).
ordenada([_]).

ordenada([E1,E2|Resto]) :-
			E1 =< E2,
			ordenada(Resto).
			
			
% Ordena por insercion.

% -----------------------------------------------------
% inserta_en_list_ord(+Elem, +Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista
% que contiene los elementos de la lista ordenada
% Lista, con el elemento Elem insertado de forma
% ordenada.

% Es necesario este metodo para explicar el funcionamiento de ordena insercion 
% -----------------------------------------------------

inserta_en_list_ord(Elem, [], [Elem]).
inserta_en_list_ord(Elem, [Cab|Resto], [Elem,Cab|Resto]) :-
			Elem =< Cab.

inserta_en_list_ord(Elem, [Cab|Resto], [Cab|R]) :-
			Elem > Cab,
			inserta_en_list_ord(Elem, Resto, R).
			
			
% -----------------------------------------------------
% ordena_insercion(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
% -----------------------------------------------------
ordena_insercion([],[]).

ordena_insercion([Cab|Resto], RT) :-
		ordena_insercion(Resto, R),
		inserta_en_list_ord(Cab,R, RT).
		
		
		
% -----------------------------------------------------
% divide(+Elem, +Lista, -Menores, -Mayores)
% es cierto cuando Menores unifica con una lista que
% contiene los elemenentos de Lista que son menores
% o iguales que Elem y Mayores unifica con una lista
% que contiene los elementos de Lista que son
% mayores que Elem.
% ------------------------------------------------------

divide(_,[],[],[]).

divide(Elem, [Cab|Resto], Menores, [Cab|Mayores]):-
			Cab > Elem,
			divide(Elem, Resto, Menores, Mayores).
			
divide(Elem, [Cab|Resto], [Cab|Menores], Mayores):-
		Cab =< Elem,
		divide(Elem, Resto, Menores, Mayores).
		
% ---------------------------------------------------
% ordena_quick(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
% --------------------------------------------------
ordena_quick([],[]).

ordena_quick([Cab|Resto], R):-
		divide(Cab, Resto, Men, May),
		ordena_quick(Men, RMen),
		ordena_quick(May, RMay),
		append(RMen, [Cab|RMay], R).
		
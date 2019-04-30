% comprime(+Lista, -Resultado)
% es cierto cuando Resultado unifica con una lista
% en el siguiente formato:
% 
% comprime([1,1,1,2,2,3,4,4,4], R).
% R = [(1,3),(2,2),(3,1),(4,4)]
%
% Tupla
%('Jose', 21, '1,60')
% 
comprime([], []).
comprime([E],[(E,1)]).

% Poner el mismo nombre es una condición para que tenga el mismo valor
comprime([Ca, Ca|Res], [(E,N1)|R]) :- 
		comprime([Ca|Res], [(E,N)| R]),
		N1 is N+1.
		
comprime([Ca1, Ca2|Res], [(Ca1,1)|R] ) :- 
		Ca1 \= Ca2,
		comprime([Ca2|Res], R).
		
% Caso Iguales
% [1,1,1,2,2,3,4,4] -> [(1,3), (2,2), (3,1), (4,2)].
% [1,1,2,2,3,4,4] -> [(1,2), (2,2), (3,1), (4,2)].

% Caso Diferentes
% [0,1,1,1,2,2,3,4,4] -> [(0,1), (1,3), (2,2), (3,1), (4,2)].
% [1,1,1,2,2,3,4,4] -> [(1,2), (2,2), (3,1), (4,2)].

% mayor(+Lista, -Tupla).
% es cierto si Tupla unifica con la tupla (E,N) de mayor N1
% de la lista Lista en formato [(1,3), (2,2), (3,1), (4,2)]
% donde el primer valor de la tupla es el elemento y el segundo
% el numero de veces que se repite.

mayor([(E,N)], (E,N)).

mayor([(_,NH)|T], (E,N)) :- mayor(T, (E,N)), N > NH.

mayor([(EH,NH)|T], (EH,NH)) :- mayor(T, (_,N)), N =< NH.

% masveces

masveces(L, E, N) :- msort(L, L2), comprime(L2, R), mayor(R, (E, N)).

% [1,1,1,0,0,0,0,2,2,2,2,3,3,3,6,6]
% [1,1,0,0,0,0,2,2,2,2,3,3,3,6,6] --> (1,2)
%								  	  (0,4)
%									  (2,4)
%									  (3,3)
%									  (6,2).

masveces2([], []).
masveces2([E], [(E,1)]).

masveces2([H|T], (H,N2)) :- 
		masveces2(T, R), 
		member((H, N), R),
		N2 is N+1.
		
masveces2([H|T], (E,N)) :- 
		masveces2(T, R), 
		\+ member((H, N), [(E,N)|R]).
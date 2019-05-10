%------------------------------------------------------
% mas_veces(+Lista, -Elem, -Num)
% Es cierto cuando Elem unifica con el elemento
% que se repite más veces en la lista Lista
% y Num unifica con el número de veces que se
% repite dicho elemento.
%------------------------------------------------------

mas_veces([_], _ , 1).

% Si el elemento a buscar es el que estoy analizando ahora
 
mas_veces([Ca|Res], E1, X1) :- 
		mas_veces(Res, E1, X),
		Ca = E1,
		X1 is X + 1.
							   
% Si el elemento no coincide debemos comprobar si es ese el más buscado

mas_veces([Ca|Res], E1, X) :- 
		mas_veces(Res, E1, X),
		E1 \= Ca,
		contar(Ca, Res, Y),
		Y =< X.
					
mas_veces([Ca|Res], Ca, Y) :- 
		mas_veces(Res, E1, X),
		E1 \= Ca,
		contar(Ca, Res, Y),
		Y > X.	
				
				
% contar(+E, +Lista, -N)
% Es cierto cuando N unifica con el numero de veces que se repite
% el elemento E en la Lista

contar(_, [], 0).

contar(E, [Ca|Res], N1) :- contar(E, Res, N),
						   E = Ca,
						   N1 is N + 1.
						
contar(E, [Ca|Res], N) :- contar(E, Res, N),
						   E \= Ca.
							   
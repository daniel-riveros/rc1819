
% num_nodos_gen(+Arbol_gen, -Num)
% es cierto cuando Num unifica con el número de nodos del árbol Arbol_gen

num_nodos_gen(t(_, Lista_hijos), R):-
		num_nodos_lista(Lista_hijos, RL),
		R is RL + 1.
		
% num_nodos_lista(+Lista_arboles, -Num)
% es cierto cuando Num unifica con el número de nodos de la lista de árboles
% genéricos Lista_arboles
% Sobrecargamos con el mismo nombre, pero al tener diferentes parámetros se diferencias perfectamente

num_nodos_lista([], 0).

num_nodos_lista([Cab|Res], R):-
		num_nodos_gen(Cab, Rcab), % Hace una llamada a un árbol
		num_nodos_lista(Res, RResto), % Hace la llamada a una lista
		R is Rcab + RResto.
		
tree_gen1(t(a,[t(b,[]), t(c,[]), t(d,[]), t(e,[])])).
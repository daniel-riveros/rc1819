
% suma_nodos( +Arbol, -N)
% es cierto cuando N unifica con la suma de todos los valores de los
% nodos del árbol

suma_nodos(nil, 0).

suma_nodos(t(N,nil,nil), N).

suma_nodos(t(N1, L, R), Res) :-
		L \= nil, R \= nil,
		suma_nodos(L, RL),
		suma_nodos(R, RR),
		Res is RL + RR + N1.
		
suma_nodos(t(N, L, nil), Res) :-
		L \= nil,
		suma_nodos(L, RL),
		Res is RL + N.
		
suma_nodos(t(N, nil, R), Res) :-
		R \= nil,
		suma_nodos(R, RR),
		Res is RR + N.
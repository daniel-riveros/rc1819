
% cuenta_internos(+Arbol, -Num)
% es cierto cuando Num unifica con el número de nodos internos que tiene el arbol,
% es decir, el número de nodos que tienen al menos un nodo como hijo

cuenta_internos(nil, 0).

cuenta_internos(t(_, nil, nil), 0).

cuenta_internos(t(_, L, R), Res) :-
		L \= nil, R \= nil,
		cuenta_internos(L, RL),
		cuenta_internos(R, RR),
		Res is RL + RR + 1.
		
cuenta_internos(t(_, L, nil), RL) :-
		L \= nil,
		cuenta_internos(L, RL),
		RL is RL + 1.
		
cuenta_internos(t(_, nil, R), RR) :-
		R \= nil,
		cuenta_internos(R, RR),
		RR is RR + 1.
		
tree1(t(9,t(5, t(2, nil, nil), t(6, nil, nil)), t(12, t(10, nil, nil), t(14, nil, nil)))).

tree2(t(4, t(2, nil, nil), t(6, nil, nil))).
% Trees representation
% 1) nil is a tree, importante
% 2) t(Etiqueta, Izq, Der) Izq y Der son árboles


% Induction
% 1) p(n0)
% 2) p(n-1) -> p(n)
%  p(N): N2 is N-1, p(N2)

% num_nodes(+Tree, -Num)
% it is true if Num unify with the number of
% nodes in Tree

num_nodes(nil, 0).

num_nodes(t(_, I, D), Res) :-
			num_nodes(I, RI),
			num_nodes(D, RD),
			Res is RI + RD + 1.
			
tree1(t(9,t(5, t(2, nil, nil), t(6, nil, nil)), t(12, t(10, nil, nil), t(14, nil, nil)))).
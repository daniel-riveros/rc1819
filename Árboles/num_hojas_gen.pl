
% num_hojas_gen(+Arbol_gen, -Num)
% es cierto cuando Num unifica con el número de hojas
% de Arbol_gen

num_hojas_gen(t(_, []), 1).

num_hojas_gen(t(_, Lista_hijos), RL) :-
		Lista_hijos \= [],
		num_hojas_gen(Lista_hijos, RL).
		
		
% num_hojas_gen(+Lista, -Num)
% es cierto cuando Num unifica con el número de hojas que se encuentran
% en los árboles generales de Lista

num_hojas_gen([], 0).

num_hojas_gen([Ca|Res], Resul) :-
		num_hojas_gen(Ca, RA),
		num_hojas_gen(Res, RL),
		Resul is RA + RL.

tree_gen1(t(a,[t(b,[]), t(c,[]), t(d,[]), t(e,[])])).
tree_gen2(t(a,[t(b,[t(r,[]), t(g,[])]), t(c,[]), t(d,[t(h,[])]), t(e,[])])).
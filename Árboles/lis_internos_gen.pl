% lis_internos_gen(+Arbol_gen, -Lista)
% es cierto cuando Lista unifica con las hojas
% de Arbol_gen

lis_internos_gen(t(_, []), []).

lis_internos_gen(t(Et, Lista_hijos), [Et|RL]) :-
		Lista_hijos \= [],
		lis_internos_gen(Lista_hijos, RL).
		
		
% lis_internos_gen(+Lista, -ListaR)
% es cierto cuando ListaR unifica con las hojas que se encuentran
% en los árboles generales de Lista

lis_internos_gen([], []).

lis_internos_gen([Ca|Res], Resul) :-
		lis_internos_gen(Ca, RA),
		lis_internos_gen(Res, RL),
		append(RA, RL, Resul).

tree_gen1(t(a,[t(b,[]), t(c,[]), t(d,[]), t(e,[])])).
tree_gen2(t(a,[t(b,[t(r,[]), t(g,[])]), t(c,[]), t(d,[t(h,[])]), t(e,[])])).
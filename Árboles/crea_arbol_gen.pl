
% crea_arbol_gen(+ListaEtiquetas, -ArbolGen)
% es cierto cuando ArbolGen unifica con un árbol genérico
% que contiene las etiquetas de ListEtiquetadas

crea_arbol_gen([E], a(E,[])).

crea_arbol_gen([Ca|Res], a(E, [a(Ca,[])|Arb])) :- crea_arbol_gen(Res, a(E, Arb)).
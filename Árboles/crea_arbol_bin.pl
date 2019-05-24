

% crea_arbol_binario(+ListaEtiquetas, -ArbolBinario)
% es cierto cuando ArbolBinario unifica con un árbol binario
% que contiene todas las etiquetas de ListaEtiquetas

% La idea principal es partir la lista en dos 

crea_arbol_binario([], nil).

crea_arbol_binario([Ca|Res], t(Ca, R1, R2)) :- 
		length(Res, L),
		Medio is L div 2,
		length(L1, Medio),
		append(L1, L2, Res),
		crea_arbol_binario(L1, R1),
		crea_arbol_binario(L2, R2).
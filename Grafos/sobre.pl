

grafo3(grafo([a,b,c,d,e], [a(a,b), a(a,c), a(b,c), a(b,d), a(b,e), a(c,d), a(c,e), a(d,e)])).

conectado(grafo(_,A), Ini, Fin) :- member(a(Ini,Fin), A).
conectado(grafo(_,A), Ini, Fin) :- member(a(Fin,Ini), A).

% Camino como lista de aristas y visitados tambien
camino(grafo(_,A), Ini, Fin, _, [a(Ini,Fin), a(Fin, Ini)]) :- member(a(Ini,Fin), A).

camino(G, Ini, Fin, Visitados , [a(Ini,Tmp)|Camino]) :- 
		conectado(G, Ini, Tmp),
		\+ member(a(Ini, Tmp), Visitados),
		camino(G, Tmp, Fin, [a(Ini, Tmp), a(Tmp, Ini) | Visitados], Camino).
		
ciclos(grafo(V, A), R) :- bagof(Ciclo, ciclo(g(V,A), Ciclo), R).
	
ciclo(g(V,A), R) :- member(Vertice, V), camino(grafo(V,A), Vertice, Vertice, [], R).
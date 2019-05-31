
% Debemos ver si existe un camino entre cada par de nodos


grafo2(grafo([a,b,c,d,e], [a(a,b), a(a,c), a(b,c), a(b,d), a(b,e), a(c,d), a(c,e), a(d,e)])).

grafo1(grafo([a,b,c,d,e], [])).

conectado(grafo(_,A), Ini, Fin) :- member(a(Ini,Fin), A).
conectado(grafo(_,A), Ini, Fin) :- member(a(Fin,Ini), A).

% Camino como lista de aristas y visitados tambien. La salida debe ser una lista de aristas
camino(grafo(_,A), Ini, Fin, Visitados, [a(Ini, Fin)]) :- 
	member(a(Ini, Fin), A),
	\+ member(a(Ini, Fin), Visitados),
	\+ member(a(Fin, Ini), Visitados).

camino(G, Ini, Fin, Visitados , [a(Ini,Tmp) |Camino]) :- 
		conectado(G, Ini, Tmp),
		\+ member(a(Ini, Tmp), Visitados),
		\+ member(a(Tmp, Ini), Visitados),
		camino(G, Tmp, Fin, [a(Ini, Tmp), a(Tmp, Ini) | Visitados], Camino).
		
		
% Debemos comprobar todas las combinaciones posibles de pares de vertices


no_conexo(grafo(V,A)) :- member(Vertice, V),
		\+ camino(grafo(V,A), Vertice, _, [], _).
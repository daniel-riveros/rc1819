

grafo2(grafo([madrid, cordoba, sevilla, jaen, granada, huelva, cadiz],
		[a(huelva, sevilla, a49, 94),
		a(sevilla, cadiz,ap4, 125),
		a(sevilla, granada, a92, 256),
		a(granada, jaen,a44, 97),
		a(sevilla, cordoba, a4, 138),
		a(jaen,madrid, a4, 335),
		a(cordoba, madrid, a4, 400)]
)).


% conectado(Grafo, Ini, Fin)
% es cierto si el vertice Ini está conectado mediante una arista conectado
% el vértice Fin en Grafo.


conectado(grafo(_,A), Ini, Fin, Nom, Dis) :- member(a(Ini, Fin, Nom, Dis), A).
conectado(grafo(_,A), Ini, Fin, Nom, Dis) :- member(a(Fin, Ini, Nom, Dis), A).

% camino(+Grafo, +Ini, +Fin, +Visitados, -Camino, -Peso)
% es cierto si Camino unifica con la lista de aristas o de vértices 
% (dependiendo de la representación) que representa el camino que va desde
% Ini hasta Fin sin repeterir ninguna arista y con un coste total de Peso ( opcional ).

% Camino como lista de aristas y visitados como listas de vertices
camino(_, Ini, Ini, _, [], 0).

camino(G, Ini, Fin, Visitados , [a(Ini, Tmp, Nom, Dist)|Camino], PesoTotal) :- 
		conectado(G, Ini, Tmp, Nom, Dist),
		\+ member(Tmp, Visitados),
		camino(G, Tmp, Fin, [Tmp | Visitados], Camino, Peso),
		PesoTotal is Peso + Dist.
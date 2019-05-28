
% Grafo 1
grafo1(grafo([a,b,c,d], [a(a,b), a(b,c), a(c,a), a(c,d), a(d,a)])).

% conectado(Grafo, Ini, Fin)
% es cierto si el vertice Ini está conectado mediante una arista conectado
% el vértice Fin en Grafo.


conectado(grafo(_,A), Ini, Fin) :- member(a(Ini,Fin), A).

% camino(+Grafo, +Ini, +Fin, +Visitados, -Camino, -Peso)
% es cierto si Camino unifica con la lista de aristas o de vértices 
% (dependiendo de la representación) que representa el camino que va desde
% Ini hasta Fin sin repeterir ninguna arista y con un coste total de Peso ( opcional ).

% Camino como lista de vertices y visitados como lista de aristas
camino(_ , Ini, Ini, _, [Ini]).

camino(G, Ini, Fin, Visitados , [Ini|Camino]) :- 
		conectado(G, Ini, Tmp),
		\+ member(a(Ini, Tmp), Visitados),
		camino(G, Tmp, Fin, [a(Ini, Tmp) | Visitados], Camino).


% ord_burbuja(+Lista, -R)
% es cierto ai R unifica con una lista que contiene
% los elementos de Lista ordenados de menor a mayor
% Lista puede contener elementos repetidos.

ord_burbuja(Lista, Lista) :- ordenada(Lista).
ord_burbuja([E1 E2|Resto],  ) :- ord_burbuja(Resto, R).

3 2 1 -- 2 1 -- 1


% Debemos crear una función que nos devuelva si una lista esta ordenada o no
% ordenada(+Lista)
% es cierto si los elementos de Lista esta ordenados de menor a mayor

% Debemos especificar los casos base
ordenada([]).
ordenada([_]).
% Con la expresion de abajo solo vale para listas de minimo dos elementos
ordenada([E1,E2|Resto]) :- E1 =< E2, ordenada([E2|Resto]).
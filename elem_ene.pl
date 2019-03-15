% Comprobar si el elemento que nos pasan es el n-esimo
% elemento_enesimo(+Pos, +Lista, -Elem)
% Es cierto cuando Elem unifica con el elemento que ocupa Pos dentro de Lista

elemento_enesimo(1, [Elem|_], Elem).

elemento_enesimo(N, [Ca|R], E) :- elemento_enesimo(N2, R, E) , N2 is N + 1, N > 1.
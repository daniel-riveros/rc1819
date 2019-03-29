
% Aritmética de Peano
% 
%
% suma(?X, ?Y, ?Z).
% Es cierto si X unifica con la suma
% de X e Y en aritmética de Peano

suma(0, Y, Y).

suma(n(X), Y, n(Z)) :-  suma(X, Y, Z).


% resta(?X, ?Y, ?Z)
% Es cierto si Z unifica con la X - Y

resta(X, 0, X).

resta(X, n(Y), Z) :- resta(X, Y, n(Z)).

% producto(?X, ?Y, ?Z)
% Es cierto si Z unifica con un número en aritmética de
% Peano resultado de sumar X veces el número Y

producto(0, _, 0).

producto(n(X), Y, Z2) :- producto(X, Y, Z), suma(Z, Y, Z2).


% p2d( +P, -D)
% es cierto si D unifica con el numero decimal
% equivalente con su representación en aritmética de Peano

p2d(0, 0).

p2d(n(X), R) :- p2d(X, D), R is D + 1.

% d2p(+D, -P)
% Es cierto si P unifica con el numero en la aritmética de Peano
% equivalente con su representación en decimal.

d2p(0,0).

d2p(X, n(P)) :- X2 is X-1, d2p(X2, P).
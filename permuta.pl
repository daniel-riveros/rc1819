% --------------------------------------------------
% permuta(+Lista, -ListaR).
% Es cierto cuando ListaR unifica con una lista
% que contiene los elementos de Lista en orden
% distinto. Este predicado genera todas las
% listas posibles.

permuta([],[]).

permuta([C|R], RES) :- permuta(R, X),
					insertar_todas(C, X, RES).


% Insertar en todas las posiciones:
% insertar_todas(+E, +Lista, -R)
% Es cierto si R unifica con una lista que contiene
% los elementos de Lista con E insertado en cualquier posición

% Podriamos haber insertado en la cabeza o en el resto

% Caso en el que la lista este vacia
insertar_todas(E, [], [E]).

% Insertamos E en la cabeza de la lista
insertar_todas(E, [Cabeza|Resto], [E, Cabeza|Resto]).

% Recursión, cambiamos de situación de lista
insertar_todas(E, [Cab|Res], [Cab|X] ) :- insertar_todas(E, Res, X).
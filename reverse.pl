% Debemos crear la funcion que genere la inversa de una lista dada
% Se debe llamar a reverse(+List, -ListR)
% Es cierto si R unifica  con una lista que contiene los elementos de L en orden inverso.
% El operador + y el operador - no influyen en la llamada, pero indica que variable
% debe estar declarada antes y cual debe estar vacia

%Debemos implementar la funcion insertar final

insertar_final(E, [], [E]).

insertar_final(E, [Ca|Resto], [Ca|R]) :- insertar_final(E, Resto, R).

reverse([],[]).

reverse([X|Resto], R2) :- reverse(Resto, R), insertar_final(X,R,R2).

% Caso Actual ------------- Caso Anterior ----------- Condicion

% En el caso anterior debemos tener guardada la cabeza de la lista al final de la lista inversa

% En la llamada a reverse podemos cambiar la forma de llamada:
	reverse([1,2,3], R ). --> R = [3, 2, 1]
	reverse(R, [1,2,3]). --> R = [3, 2, 1]
	reverse([1, 2, 3], [3, 2, 1]) --> true
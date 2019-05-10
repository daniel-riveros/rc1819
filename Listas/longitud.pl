	% longitud(lista, Longitud).
	% es cierto cuando Longitud unifica con
	% el número de elementos de Lista

	longitud([], 0).
	% longitud(n-1, R) --> longitud(n, r2)

	longitud([_|Resto], R2) :- longitud(Resto, R), R2 is R + 1.
	%R solo tendra valor si la parte derecha de la operación es cierta
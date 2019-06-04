
% insertar_todas(+E, +Lista, -R)

insertar_todas(E, Lista, [E|Lista]).

insertar_todas(E, [Cab|Resto], [Cab|R]) :-
		insertar_todas(E, Resto, R).
		
		
permutar([],[]).

permutar([Cab|Resto], R2) :-
		permutar(Resto, R),
		insertar_todas(Cab, R, R2).
	
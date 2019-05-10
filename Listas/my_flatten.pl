
% my_flatten([a,[b,[c,d],e]], X).
% X = [a,b,c,d,e].
% es cierto cuando X unifica con una única lista que
% contenga el contenido de la lista de listas pasada
% por parámetros

my_flatten([],[]).

my_flatten([Ca|Res], R2) :-
			is_list(Ca),
			my_flatten( Ca, R),
			my_flatten( Res, R1),
			append(R, R1, R2).
			
my_flatten([Ca|Res], [Ca|R1]) :-
			\+ is_list(Ca),
			my_flatten(Res, R1).
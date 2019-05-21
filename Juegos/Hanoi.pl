

% Hanoi
%
%	|		|		|
%	|		|		|
%	|		|		|
%	|		|		|
%  ---	   ---	   ---
%   A		B		C

% hanoi(+NumeroDiscos, +A, +C, +B, -ListaMov).
% es cierto cuando ListaMov unifica con la lista de movientos
% necesarios para pasar NumeroDiscos de la torre A hasta la torre C
% utilizando la torre B como auxiliar.

% 1. Mover la torre de n-1 discos desde A hasta B usando C como auxiliar
% 2. Mover el disco mayor de X a Z.
% 3. Mover la torre de n-1 discos de Y a Z usando X como auxiliar.

hanoi(1, A, _, C, [pasar(1, A, C)]).

hanoi(N, A, B, C, R1) :-
		N2 is N-1,
		hanoi(N2, A, C, B, M1),
		hanoi(1, A, B, C, M2),
		hanoi(N2, B, C, A, M3),
		append(M1, M2, R),
		append(R, M3, R1). 
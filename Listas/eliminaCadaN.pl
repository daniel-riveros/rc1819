
% eliminaCadaN(+N, +Lista, -ListaR)
%
% es cierto cuando ListaR unifica con una
% lista que contiene los elementos de Lista eliminando
% los que aparecen cada N posiciones.
%
% eliminaCadaN(3, [1,2,3,4,5,6,7], R)
% R = [1,2,4,5,7]. Elimima el 3 y el 6.

eliminaCadaN(N,L,L) :- 
			length(L,N2), 
			N > N2.

eliminaCadaN(N, L, R2 ) :- 
			N1 is N - 1,
			length(L1, N1),
			append(L1, [_|L2], L),
			eliminaCadaN(N, L2, R),
			append(L1, R, R2).
			
			
% [1,2,3,4,5,6] :- [1,2,4,5] 6
% [2,3,4,5,6] :- [2,4,5] 5
% [3,4,5,6] :- [4,5] 4
% [4,5,6] :- [4,5] 3
% [5,6] :- [5] 2
% [6] :- [] 1
% [] :- []



% balanceado(+ArbolBinario)
% es balanceado si ArbolBinario es balanceado, es decir,
% para todo nodo la diferencia de altura entre su hijo derecho y su
% hijo izquiero es como máximo 1.

balanceado(nil).

balanceado(t(_,Iz,Der)) :-
	altura(Iz, AlI),
	altura(Der, AlD),
	D is abs(AlI - AlD),
	D =< 1,
	balanceado(Iz),
	balanceado(Der).



% altura(+ArbolBinario, -A)
% es cierto si A unifica con la altura de ArbolBinario

altura(nil, 0).

altura(t(_,HI,HD), AT) :-
		altura(HI,AI),
		altura(HD,AD),
		A is max(AI,AD),
		AT is A + 1.
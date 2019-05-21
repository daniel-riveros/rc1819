
% Problemas de Estados

% Misioneros y Canibales

% 1. Estado
% estado (MisionerosDch, MisionerosIzq, SituacionesBote)

% 2. Movimientos
%

mov(pasar(M, C, izquierda), estado(MD, CD, derecha), estado(MDN, CDN, izquierda)) :-
		pasar(M,C),
		M =< MD, C =< CD,
		MDN is MD - M, CDN is CD - C,
		\+ novalido(estado(MDN,CDN, _)). 
		
mov(pasar(M, C, derecha), estado(MD, CD, izquierda), estado(MDN, CDN, derecha)) :-
		pasar(M, C),
		MI is 3 - MD, CI is 3- CD,
		M=< MI, C =< CI,
		MDN is MD + M , CDN is CD + C,
		\+ novalido(estado(MDN, CDN,_ )).


% Pasar(Misioneros, Canibales).
% Opciones:
	pasar(2,0).
	pasar(0,2).
	pasar(1,1).
	pasar(1,0).
	pasar(0,1).
	
% valido(estado(MisionerosDch, CanibalesDch, SituacionBote))

valido(estado(3,3,_)).
valido(estado(3,2,_)).
valido(estado(3,1,_)).
valido(estado(3,0,_)).
valido(estado(2,2,_)).
valido(estado(1,1,_)).
valido(estado(2,0,_)).
% ... Salen muchos, mejor hacer el caso contrario

% novalido(estado(MisionerosDch, CanibalesDch, SituacionBote))

novalido(estado(2,3,_)).
novalido(estado(1,3,_)).
novalido(estado(1,2,_)).
% Opuesto de lo de arriba
novalido(estado(1,0,_)).
novalido(estado(2,0,_)).
novalido(estado(2,1,_)).

% camino(+EstadoInicial, +EstadoFin, +Visitados, -Camino)
% es cierto cuando Camino unifica con la lista de movimientos necesarios
% para ir del EstadoInicial al EstadoFin sin repetir los estados Visitados.

camino(Ini, Ini, _, []).

camino(Ini, Fin, Visitados, [pasar(M,C, Direccion)| Camino]) :-
	mov(pasar(M, C, Direccion), Ini, Temp),
	\+ member(Temp, Visitados),
	camino(Temp, Fin, [Temp|Visitados], Camino).

% Encontrar los primos entre X e Y
%
% primosEntreXY(+X, +Y, -Lista)
% es cierto si Lista unifica con los primos que van desde X hasta Y
% X tiene que ser menor o igual que Y

primosEntreXY(X, Y, []) :- X > Y.

primosEntreXY(X, Y, [X|R]) :- X2 is X + 1,
						 primosEntreXY(X2,Y, R),
						 primo(X).
						 
primosEntreXY(X, Y, R) :- X2 is X + 1,
						 primosEntreXY(X2,Y, R),
						 \+ primo(X).



% primo(+X)
% es cierto si X es primo

primo(X) :- divisores(X, [X,1]).

% divisores(+X, -ListaDivisores)
% es cierto si ListaDivisores unifica con lista de números
% que dividen a X (resto de la división entera igual a 0)
%
% X is 5 mod 3. --> Si X es 0 es que es divisible

 divisores(X, Y) :- divisores(X, X, Y);


% Debemos crear un divisores con mas argumentos

% divisores(+X, +Y,-Lista)
% Devuelve una lista con los divisores que cumplen la condicion
% Es cierto si ListaDivisores unifica con los divisores de X que van desde 1 hasta Y.

% Con esto nos da la lista al reves.

divisores(X, 1, [1]).

divisores(X, Y, [Y|R] ) :- 0 is X mod Y,
						  Y >= 1,
						  Y2 is Y - 1,
						  divisores(X, Y2, R).
						  
						  
divisores(X, Y, R) :- Resto is X mod Y, Resto \= 0,
					 Y >= 1,
					 Y2 is Y - 1,
					 divisores(X, Y2, R).
					 
					 
					


% Concatenar(?L1, ?L2, ?R)
% Es cierto cuando R unifica con una lista que 
% contiene los elementos de L1 seguidos de los de L2
% en el mismo orden

% Con dos variables tenemos que elegir cual usar para la recursion.
% Depende de cual elijamos el problema puede ser muy dificil o muy sencillo.
% Si en este caso usamos L2 es muy complicado ya que la cabecera de L2 se perderia
% concatenar([1,2,3], [4,5,6],R)
%
% concatenar([1,2,3],[5,6],[1,2,3,5,6]). --> El 4 se pierde y no se podria recuperar.


concatenar([],L2,L2).

concatenar([Ca|Resto], L2, [Ca|R]) :- concatenar(Resto, L2, R).
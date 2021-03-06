% https://rosettacode.org/wiki/Sierpinski_triangle/Graphical#Recursive_version

:- use_module(library(pce)).

% window(MaxX, MaxY).
window(690, 690).

my_tree(N) :-
    window(MaxX, MaxY),
	sformat(A, 'My tree dimension ~w - ~w x ~w', [N, MaxX, MaxY]),
	new(D, picture(A)),
	starting_point(X,Y),
	draw_tree(D, N, [point(X,Y)], 120),
	send(D, size, size(MaxX,MaxY)),
	send(D, open).
	
starting_point(X, Y):- window(MaxX, MaxY), X is MaxX div 2, Y is MaxY - 10.	
	
draw_tree(_, 1, _, _).
	
draw_tree(Window, N, BranchesList, Length):-
  N > 1,
  N2 is N - 1,
  draw_branches(Window, BranchesList, NewBranches, Length),
  Length2 is Length * 0.7,
  draw_tree(Window, N2, NewBranches,  Length2).
  
  
  
draw_branches(_, [], [], _).	
draw_branches(Window, [point(X,Y)|Tail], [point(X1,Y1), point(X2, Y2)|NewBranches], Length):-
    X1 is X - (Length * 0.9),
	Y1 is Y - (Length * 0.8),
	X2 is X + (Length * 1.1),
	Y2 is Y - (Length * 1.2),
	
	XBc1 is X - (Length * 0.2),
	YBc1 is Y - (Length * 0.8), 
	XBc2 is X + (Length * 0.2),
	
	send(Window, display,
          new(Bc, bezier_curve(point(X,Y),
		                       point(X1, Y1),
							   point(XBc1, YBc1)
                                ))
	),
								
    send(Window, display,
          new(Bc2, bezier_curve(point(X,Y),
		                        point(X2, Y2),
		                        point(XBc2, YBc1)
                                ))
	),
	
    draw_branches(Window, Tail, NewBranches, Length).	

   % |       
   % |
   % |
   % |
   % --------
 

	
	
	

 

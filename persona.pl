
% Esto es un comentario en prolog
% hombre(Persona)
% Es cierto si Persona es un hombre

hombre(luis).
hombre(antonio).
hombre(jose).

% persona(P)
% es cierto si P es hombre o P es mujer
% Si hombre(P) o mujer(P) ---> persona(P) REGLA

persona(P) :- hombre(P).
persona(P) :- mujer(P).

% mujer(Persona)
% es cierto si Persona es mujer

mujer(maria).
mujer(luisa).
mujer(marta).
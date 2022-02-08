%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Inteligência Artificial - MiEI/3 LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas.
operacao(X,Y,+,R) :- R is X + Y .
operacao(X,Y,-,R) :- R is X - Y .
operacao(X,Y,*,R) :- R is X * Y .
operacao(X,Y,/,R) :- R is X / Y .

maior(X,Y,M) :- M is max(X,Y) .
maior3(X,Y,Z,M) :- M is max(X,max(Y,Z)) .
%--------------------------------- - - - - - - - - - -  -  -  -  -   -

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Soma -> {V,F}

soma( X,Y,Soma ) :-
    Soma is X+Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}
soma3(X,Y,Z,Soma3) :- Soma3 is X+Y+Z .

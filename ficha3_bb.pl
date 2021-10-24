%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% inteligência Artificial - MiEI/3 LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes sobre listas.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pertence: Elemento,Lista -> {V,F}

pertence( X,[X|L] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado comprimento: Lista,Comprimento -> {V,F}

comprimento( [],0 ).
comprimento( [X|L],N ) :-
    comprimento( L,N1 ),
    N is N1+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado quantos: Lista,Comprimento -> {V,F}
diferentes([],0).
diferentes([X|L],N) :- pertence(X,L) , diferentes(L,N).
diferentes([X|L],N1) :- not(diferentes(X,L) ) , diferentes(L,N) , N1 is N+1.




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagar: Elemento,Lista,Resultado -> {V,F}

apaga1(X,[X|L],R).
apaga1(X,[Y|L],[Y|L]) :- X\=Y, apaga1(X,R,L).



%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado apagatudo: Elemento,Lista,Resultado -> {V,F}

apagaT(X,[],[]).
apagaT(X,[X|R],L) :- apagaT(X,R,L).
apagaT(X,[Y|R],[Y|L]) :- X \= Y , apagaT(X,R,L).





%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado adicionar: Elemento,Lista,Resultado -> {V,F}

adicionar(X,[],[X]).
adicionar(X,[X|L],[X|L]).
adicionar(X,[Y|L],[Y|R]) :- adicionar(X,L,R).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado concatenar: Lista1,Lista2,Resultado -> {V,F}

concatenar([],[X|L],[X|L]).
concatenar([X|L],[Y|R],[X|S]) :- concatenar(L,[Y|R],S).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado inverter: Lista,Resultado -> {V,F}

inverter([],[]).
inverter([X|L],R) :- inverter(L,I) , concatenar(I,[X],R).




%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sublista: SubLista,Lista -> {V,F}

sublista(Sub,Lista) :- concatenar(L1,L2,Lista) , concatenar(Sub,L3,L2).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

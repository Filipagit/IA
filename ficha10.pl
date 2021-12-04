%---------------------------------------------
Definicoes iniciais 

:-op( 900,xfy,'::').
:-dynamic '-'/1.
:-dynamic jogo/3.

%--------------------------------------------------------
Extensao do predicado jogo: Jogo,Arbitro,Ajudas -> {V,F,D}

-jogo( Jogo,Arbitro,Ajudas):-
     not( jogo(Jogo,Arbitro,Ajudas)),
     not(excecao( jogo( Jogo,Arbitro,Ajudas))).


jogo(1,aa,500).
jogo(2,bb,xpto0123).

excecao( jogo( Jogo,Arbitro,Ajudas ) ) :-
       jogo( Jogo,Arbitro,xpto0123 ).

excecao( jogo(3,cc,500 ) ).
excecao( jogo( 3,cc,2500 ) ).

excecao( jogo(4,dd,Ajudas)) :-
     Ajudas >= 250 , Ajudas =< 750.

jogo(5,ee,xpto765)).

excecao( jogo( Jogo,Arbitro,Ajudas ) ) :-
       jogo( Jogo,Arbitro,xpto765 ).

nulo(xpto765).

+jogo( J,A,C) :: ( findall( Ajudas,(jogo( 5,ee,Ajudas),
    not(nulo( Ajudas)))),S),
    length( S,N),
    N==0).
    

jogo(6,ff,250).
excecao( jogo(6,ff,V)) :- V>=5000.

-jogo(7,gg,2500)).
jogo(7,gg,xpto4567).
excecao(jogo( Jogo,Arbitro,Ajudas)):-
 jogo(Jogo,Arbitro,xpto4567).



excecao( jogo(8,hh,Ajudas)):-
     cerca( 1000,Csup,Cinf),
     Ajudas>= Cinf, Ajudas =< Csup.


cerca(X,Sup,Inf):-
 Sup is X * 1.25,
 Inf is X * 0.75.

excecao( jogo(9,ii,Ajudas)):- 
   mproximo(3000,Csup,Cinf),
   Ajudas >= Cinf, Ajudas =< Csup.

mproximo(X,Sup,Inf):-
  Sup is X * 1.1,
  Inf is X * 0.9.   
 
% Invariante estrutural: nao permitir insercao de conhecimento repetido
+jogo(J,A,C) :-
  findall(J,jogo(J,Arbitro,Custo),S),
  length(S,N),
  N==1).

+jogo(J,A,C) :-
  findall(A,jogo(J,Arbitro,Custo),S),
  length(S,N),
  N =< 3).

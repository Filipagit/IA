%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% ITELIGÊNCIA ARTIFICIAL - MiEI/LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PROLOG: definicoes iniciais

:- dynamic '-'/1.
:- dynamic mamifero/1.
:- dynamic morcego/1.



%--------------------------------- - - - - - - - - - -  -  -  -  -   -

voa( X ) :-
    ave( X ).
-voa( tweety ).
-voa( X ) :-
    mamifero( X ).

ave(pitugui).
ave(X) :- canario(X).

ave(X) :- periquito(X).

periquito(faisca).

canario(piupiu).
mamifero(silvestre).

mamifero(X) :- gato(X).
mamifero(X) :- cao(X).

gato(bichano).
cao(boby).

ave(X) :- avestruz(X).
ave(X) :- pinguim(X).

avestruz(trux).
pinguim(pingu).

mamifero(X) :- morcego(X).
morcego(batemene).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -

% Representar exceções

voa(X) :- ave(X),nao(excecao(voa(X))).
voa(X) :- excecao(-voa(X)).
-voa(X) :- mamifero(X),nao(excecao(-voa(X))).
-voa(X) :- excecao(voa(X)).

excecao(voa(X)) :- avestruz(X).
excecao(voa(X)) :- pinguim(X).
excecao(-voa(X)) :- morcego(X).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado si: Questao,Resposta -> {V,F}
% Resposta = {Verdadeiro,falso,desconhecido}

si(Questao,verdadeiro) :- Questao.
si(Questao,falso) :- -Questao.
si(Questao,desconhecido) :- nao(Questao), nao(-Questao).
	
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado siL: ListaQuestao,ListaResposta -> {V,F}	

siL([],[]).
siL([Questao|L],[Resposta|S]) :-
	si(Questao,Resposta)

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).


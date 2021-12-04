%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% ITELIG�NCIA ARTIFICIAL - MiEI/LEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F,D}

filho( joao,jose ).
filho( jose,manuel ).
filho( carlos,jose ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado idade: Pessoa,Idade -> {V,F}

idade(joao,21).
idade(jose,42).
idade(manuel,63).
idade(carlos,19).


% Invariante Estrutural:  nao permitir a insercao de conhecimento
%                         repetido

+filho( F,P ) :: (solucoes( (F,P),(filho( F,P )),S ),
                  comprimento( S,N ), 
				  N == 1
                  ).
+pai(P,F) :: (solucoes( (P,F),(pai(P,F))),S),
              comprimento(S,N),
              N==1).

+neto(Ne,A) :: (solucoes( (Ne,A),(neto(Ne,A))),S),
                comprimento(S,N),
                N==1).

+avo(A,Ne) :: (solucoes( (A,Ne),(avo(A,Ne))),S),
                comprimento(S,N),
                N==1).

+descendente(D,A,G) :: (solucoes( (D,A,G),(descendente( D,A,G )),S ),
                  comprimento( S,N ), 
				  N == 1).

% Invariante Referencial: nao admitir mais do que 2 progenitores
%                         para um mesmo individuo

+filho(F,P) :: (solucoes( (Ps),(filho(F,Ps))),S),
                comprimento(S,N),
                N =< 2).

+pai(P,F) :: (solucoes((Ps),pai(Ps,F)),S),
              comprimento(S,N),
              N =< 2).

+neto(Ne,A) :: (solucoes((Avs),neto(Ne,Avs),S),
                comprimento(S,N),
                N<=4).
               

+avo(A,Ne) :: (solucoes((Avs), avo(Avs,Ne),S),
					comprimento(S,N),
					N =< 4).               

% Invariante Referencial: não admitir mais grau de descendência que não pertençam

+descente(D,A,G) :: (G > 0).

%Invariante Referencial: não é possível remover filhos para os quais exista registo de idade
-filho(F,P) :: (solucoes((S),filho(F,I),S),
                comprimento(S,N),
                N==0).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :-
	findall(Invariante,+Termo::Invariante,Lista),
	insercao(Termo),
	teste(Lista).

insercao(Termo) :-
	assert(Termo).
insercao(Termo) :-
	retract(Termo),!,fail.

teste([]).
teste([R|LR]) :- R, teste(LR).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a involucao do conhecimento

involucao( Termo ) :-
	findall(Invariante,-Termo::Invariante,Lista),
	remocao(Termo),
	teste(Lista).

remocao(Termo) :-
	retract(Termo).
insercao(Termo) :-
	assert(Termo),!,fail.

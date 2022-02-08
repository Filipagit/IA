%-------------------------------------------------------------------
% Pogramação em Logica



%--------------dados do problema--------
% estado inicial 
inicial(jarros(0,0)).

% estados finais 
final(jarros(4,_)).
final(jarros(_,4)).

% transições possiveis transicao: Ei x Op X Ef 

transicao(jarros(V1,V2),encher(1),jarros(8,V2)):- V1<8.
transicao(jarros(V1,V2),encher(2),jarros(V1,5)):- V2<5.

transicao(jarros(V1,V2),vazio(1),jarros(0,V2)):- V1>0.
transicao(jarros(V1,V2),vazio(2),jarros(V1,0)):- V2>0.


transicao(jarros(V1,V2),encher(1,2),jarros(NV1,NV2)) :- 
  V1>0, NV1 is max(V1-5+V2,0) ,NV1<V1, NV2 is V2+V1-NV1.

transicao(jarros(V1,V2),encher(2,1),jarros(NV1,NV2)) :- 
  V2>0, NV2 is max(V2-8+V1,0) ,NV2<V2, NV1 is V1+V2-NV2.


%--------------------------------------------------- d) ------------------
resolvedf(Solucao) :-
  inicial(InicialEstado),
  resolvedf(InicialEstado,[InicialEstado],Solucao).

  resolvedf(Estado,Historico,[]):-
   final(Estado),!,write(Historico).

   resolvedf(Estado,Historico,[Move|Solucao]):-
     transicao(Estado,Move,Estado),
     not(member(Estado1,Historico)),
     resolvedf(Estado1,[Estado1|Historico],Solucao).


todos(L):- findall((S,C), (resolvedf(S),length(S,C)),L).

melhor(S,Custo):-findall((S,C),resolvedf(S),length(S,C)),L),minimo(L,(S,Custo))

minimo([(P,X)],(P,X)).
minimo([(Px,X)|L],(Py,Y)):-minimo(L,(Py,Y)),X>Y
minimo([(Px,X)|L],(Px,X)):-minimo(L,(Py,Y)),X<=Y

---------------------e)-------
solve(Solucao) :- bfs_M(jarros(0,0),jarros(_,4),Solucao).

bfs_M(Estado1,EstadoF,Solucao):- bfs_M2(EstadoF,[[EstadoI]],Solucao).

bfs_M2(EstadoF,[[EstadoF|T]|_],Solucao):- reverse([EstadoF|T],Solucao).
bfs_M2(EstadoF,[EstadosA|Outros],Solucao) :-
      EstadosA=[Act|_],
      findall([EstadoX|EstadosA],
      (EstadoF\==Act, transicao(Act,Move,EstadoX), \+member(EstadoX,EstadosA)),
      Novos),
      append(Outros,Novos,Todos),
      bfs_M2(EstadoF,Todos,Solucao).
      
  
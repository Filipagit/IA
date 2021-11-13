%------------------------------------------------------------
move(a,b,2).
move(b,c,2).
move(c,d,3).
move(d,t,3).
move(s,e,2).
move(e,f,5).
move(f,g,2).
move(g,t,2).
move(s,a,2).

estima(a,5).
estima(b,4).
estima(c,4).
estima(d,3).
estima(g,2).
estima(f,4).
estima(e,7).
estima(s,10).
estima(t,0).

goal(t).
%---------------------pesquisa em profundidade primeiro com custo 
% resolve_pp_c(s,C,Custo).

resolve_pp_c(Nodo,[Nodo|Caminho],C):-
    profundidadeprimeiro(Nodo,[Nodo],Caminho,C).

profundidadeprimeiro(Nodo,_,[],0):-
       goal(Nodo).

profundidadeprimeiro(Nodo,Historico,[ProxNodo|Caminho],C):-
    adjacente(Nodo,ProxNodo,C1),
    not(member(ProxNodo,Historico)),
    profundidadeprimeiro(ProxNodo,[ProxNodo|Historico],Caminho,C2), C is C1+C2.

adjacente(Nodo,ProxNodo,C):-
  move(Nodo,ProxNodo,C).

adjacente(Nodo,ProxNodo,C):-
  move(Nodo,ProxNodo,C).


%--------- pesquisa gulosa 

resolve_gulosa(Nodo,Caminho/Custo) :-
  estima(Nodo,Estima),
  agulosa([[Nodo]/0/Estima],InvCaminho/Custo/_),
  reverse(InvCaminho,Caminho).

agulosa(Caminhos,Caminho):-
   obtem_melhor_g(Caminhos,Caminho),
   Caminho=[Nodo|_]/_/_,
   goal(Nodo).

agulosa(Caminhos,SolucaoCaminho):-
  obtem_melhor_g(Caminhos,MelhorCaminho),
  seleciona(MelhorCaminho,Caminhos,OutrosCaminhos),
  expande_gulosa(MelhorCaminho,ExpCaminhos),
  append(OutrosCaminhos,ExpCaminhos,NovosCaminhos),
  agulosa(NovosCaminhos,SolucaoCaminho).

obtem_melhor_g([Caminho],Caminho) :- ! .

obtem_melhor_g([Caminho1/Custo1/Est1,_/Custo2/Est2|Caminhos],MelhorCaminho) :-
  Est1=< Est2, !, 
  obtem_melhor_g([Caminho1/Custo!/Est1|Caminhos],MelhorCaminho).

obtem_melhor_g([_|Caminhos],MelhorCaminho) :- 
  obtem_melhor_g(Caminhos,MelhorCaminho).

expande_gulosa(Caminho,ExpCaminhos):-
  findall(NovosCaminhos,adjacente2(Caminho,NovosCaminhos),ExpCaminhos).

adjacente2([Nodo|Caminho]/Custo/_,[ProxNodo,Nodo|Caminho]/NovoCusto/Est):-
  move(Nodo,ProxNodo,PassoCusto),
  \+ member(ProxNodo,Caminho),
  NovoCusto is Custo + PassoCusto,
  estima(ProxNodo,Est).


seleciona(E,[E|Xs],Xs).
seleciona(E,[X|Xs],[X|Ys]) :- seleciona(E,Xs,Ys).





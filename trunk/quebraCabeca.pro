% [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0]]

:-include(jogadas).
:-include(profundidade).

busca(Nodo, Lista)  :-
	busca(Nodo, Lista, []).

busca(Nodo, Lista, Acumulador) :-
	eSolucao(Nodo) ->
	 %imprimeCaminho([Nodo|Acumulador]);
	 true;
	 expandeFilhos(Nodo, Lista, [E|Lista1]),
	 %escolheNodo(Lista1, NodoEscolhido),
	 busca(E, Lista1, [E|Acumulador]).

eSolucao(Tabuleiro) :-
	Tabuleiro == [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0]].

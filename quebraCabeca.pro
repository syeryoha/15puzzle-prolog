tabuleiroCorreto([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0], 15]).
tabuleiroMuitoErrado([[5,6,7,8],[1,2,3,4],[13,14,15,0],[9,10,11,12], 0]).
tabuleiroErrado([[1,2,4,3],[5,7,6,8],[13,14,0,15],[9,10,11,12], 4]).

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

ordena([], []).
ordena([H|Tail], ListaOrdenada) :-
	ordena(Tail, TailOrdenado),
	insere(H, TailOrdenado, ListaOrdenada).

insere(Elemento, [], [Elemento]).
insere(Elemento, [H|Tail], [H|Tail1]) :-
	valor(Elemento, Valor1),
	valor(H, Valor2),
	Valor1 =< Valor2,
	!,
	insere(Elemento, Tail, Tail1).
insere(Elemento, [H|Tail], [Elemento, H|Tail]) :-
	valor(Elemento, Valor1),
	valor(H, Valor2),
	Valor1 > Valor2.	

valor([_, _, _, _, Valor], Valor).

valorTabuleiro([Linha1, Linha2, Linha3, Linha4], Valor) :-
	valorLinha(Linha1, 1, Valor1),
	valorLinha(Linha2, 5, Valor2),
	valorLinha(Linha3, 9, Valor3),
	valorLinha(Linha4, 13, Valor4),
	Valor is Valor1 + Valor2 + Valor3 + Valor4.

valorLinha(Linha, N, Valor) :-
	valorLinha(Linha, N, Valor, 0).
valorLinha([], N, Valor, Valor).
valorLinha([E|L], N, Valor, Acc) :-
	N1 is N+1,
	(E =:= N ->
	(Acc1 is Acc + 1,
	 valorLinha(L, N1, Valor, Acc1));
	valorLinha(L, N1, Valor, Acc)).

imprimeCaminho(Caminho) :-
	imprimeCaminho(Caminho, 1).
imprimeCaminho([Tabuleiro|Lista], Pos) :-
	Pos1 is Pos + 1,
	write('= Posição '),
	write(Pos),
	write(' ='), nl,
	imprimeTabuleiro(Tabuleiro),nl,nl,
	imprimeCaminho(Lista, Pos1).

imprimeTabuleiro([Linha1, Linha2, Linha3, Linha4]) :-
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha1),nl,
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha2),nl,
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha3),nl,
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha4),nl,
	write(' -------------------'),nl.

imprimeLinha([]).
imprimeLinha([E|L]) :-
	(E < 10 ->
	 (write('  '),
	  (E \== 0 ->
	   write(E);
	   write(' ')),
	  write(' '));
	 (write(' '),
	  write(E),
	  write(' '))),
	write('|'),
	imprimeLinha(L).
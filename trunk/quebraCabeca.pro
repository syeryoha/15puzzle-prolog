tabuleiroCorreto([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0], _]).
tabuleiroMuitoErrado([[5,6,7,8],[1,2,3,4],[13,14,15,0],[9,10,11,12], 0]).
%tabuleiroErrado([[1,2,3,4],[5,6,7,8],[9,10,11,12],[0,13,14,15], 12]).
tabuleiroErrado([[1,2,3,4],[5,6,7,8],[9,10,11,0],[13,14,15,12],14]).
tabuleiroErrado2(Y):- X= [[1,2,7,3],[5,10,6,4],[9,0,11,8],[13,14,15,12]],valorTabuleiro(X,V),append(X,[V],Y).

tabuleiroAest([[1,2,7,3],[5,10,6,4],[9,0,11,8],[13,14,15,12],[0,10]]).

:-include(jogadas).
%:-include(profundidade).
%:-include(largura).
%:-include(gradiente).
%:-include(escalada).
:-include(aestrela).
%:-include(beam).
%:-include(heuristicaPosicao).
%:-include(idaestrela). % que feio...
:-include(heuristicaManhattan).

min(5).
max(10).

valor([_,_,_,_,[CustoCaminho, Valor]],Valor).
custoCaminho([_,_,_,_,[CustoCaminho, Valor]],CustoCaminho).
retornaTabuleiro([Linha1, Linha2, Linha3, Linha4, [CustoCaminho, Valor]], [Linha1, Linha2, Linha3, Linha4]).
criaTabuleiro([Linha1, Linha2, Linha3, Linha4], CustoCaminho, Valor, [Linha1, Linha2, Linha3, Linha4, [CustoCaminho, Valor]]).

tabuleiroAleatorio(Aleatorio) :-
	randomize, %deverá ser movido para a função principal
        min(Min),
	max(Max),
	random(Min, Max, R),
	tabuleiroCorreto(Base),
	variasJogadasAleatorias(Base, Aleatorio, R).

variasJogadasAleatorias(Base, Base, 0) :- !.
variasJogadasAleatorias(Base, Aleatorio, N) :-
	N1 is N - 1,
	jogadaAleatoria(Base, NovoTabuleiro),
	variasJogadasAleatorias(NovoTabuleiro, Aleatorio, N1).
	

jogadaAleatoria(Base, Aleatorio) :-
	geraJogadas(Base, F1, F2, F3, F4),
	random(1, 5, Filho),
	((Filho =:= 1 ->
	    Tentativa = F1);
	(Filho =:= 2 ->
	    Tentativa = F2);
	(Filho =:= 3 ->
	    Tentativa = F3);
	(Filho =:= 4 ->
	    Tentativa = F4)),
	((Tentativa \== [] ->
	    (valorTabuleiro(Tentativa, V), %Na verdade, só é necessário calcular o valor do tabuleiro final
	    append(Tentativa, [V], Aleatorio));
	    jogadaAleatoria(Base, Aleatorio))).

busca(Nodo, Lista)  :-
	busca(Nodo, Lista, []).

busca(Nodo, Lista, Acumulador) :-
	(eSolucao(Nodo) -> 
	%	imprimeCaminho([Nodo|Acumulador]),
	 ( statistics,
	   %imprimeLista(Lista),
	   eliminaRepeticoes(Lista,ListaU),
	   write('Número de elementos na lista de nós fechados: '),
	   length(Acumulador, TamAcumulador),
	   write(TamAcumulador), nl,
	   write('Número de elementos na lista de nós abertos: '),
	   length(ListaU, TamListaU),
	   write(TamListaU), nl
	 ) ;			%temporário, só para depurar
	 (naoEstaEm(Nodo, Acumulador) ->
	  expandeFilhos(Nodo, Lista, [E|Lista1]),
%	  debuga(Nodo,E,Lista1),
	  tenta(E, Lista1, [Nodo|Acumulador])
	 )
	).

debuga(Nodo,Filho,NosAbertos) :-
	write('Expandindo pai:'), nl,
	imprimeTabuleiro(Nodo),nl,
	write('Filho:'),nl,
	imprimeTabuleiro(Filho), nl,
	imprimeLista(NosAbertos),
	get_char(_).


tenta(Nodo, [Prox|Lista], Acumulador) :-
	(busca(Nodo, [Prox|Lista], Acumulador) ->
	 true;
%	 write('Falhou. Indo para:'),nl,
%	 imprimeTabuleiro(Prox), nl,
	 tenta(Prox, Lista, Acumulador)
	).
	
naoEstaEm(Elemento, []).
naoEstaEm(Elemento, [E|L]) :-
	E \== Elemento,
	naoEstaEm(Elemento,L).

eSolucao(Tabuleiro) :-
	tabuleiroCorreto(Tabuleiro).

%ordena([], []).
% ordena([H|Tail], ListaOrdenada) :-
% 	ordena(Tail, TailOrdenado),
% 	insere(H, TailOrdenado, ListaOrdenada).

% ordenaMenor([], []).
% ordenaMenor([H|Tail], ListaOrdenada) :-
% 	ordenaMenor(Tail, TailOrdenado),
% 	insereMenor(H, TailOrdenado, ListaOrdenada).

ordena([], []).
ordena([H|Tail], ListaOrdenada) :-
 	ordena(Tail, TailOrdenado),
 	insereMenor(H, TailOrdenado, ListaOrdenada).

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

insereMenor(Elemento, [], [Elemento]).
insereMenor(Elemento, [H|Tail], [H|Tail1]) :-
	valor(Elemento, Valor1),
	valor(H, Valor2),
	Valor1 >= Valor2,
	!,
	insereMenor(Elemento, Tail, Tail1).
insereMenor(Elemento, [H|Tail], [Elemento, H|Tail]) :-
	valor(Elemento, Valor1),
	valor(H, Valor2),
	Valor1 < Valor2.	

imprimeCaminho(Caminho) :-
	imprimeCaminho(Caminho, 1).
imprimeCaminho([Tabuleiro|Lista], Pos) :-
	Pos1 is Pos + 1,
	write('= Posição '),
	write(Pos),
	write(' ='), nl,
	imprimeTabuleiro(Tabuleiro),nl,nl,
	imprimeCaminho(Lista, Pos1).

imprimeTabuleiro([Linha1, Linha2, Linha3, Linha4, Valor]) :-
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

imprimeLista([]).
imprimeLista([H|T]) :- write(H),nl,imprimeLista(T).

eliminaRepeticoes([], []).
eliminaRepeticoes([H|T],R) :-
	member(H,T),
	!,
	eliminaRepeticoes(T,R).

eliminaRepeticoes([H|T], [H|R]) :-
	\+member(H,T),
	!,
	eliminaRepeticoes(T, R).

%eliminaRepeticoes(T, R).

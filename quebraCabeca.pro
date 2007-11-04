:-include(jogadas).

%Modelo do tabuleiro correto, para comparar se é solução
tabuleiroCorreto([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,0], _]).

/*principal(+B, +H, +X) - Executa o algoritmo B, com a heurística H, dado um tabuleiro inicial X*/
principal(B,H,X) :-
	(
	 H == manhattan -> [heuristicaManhattan] ;
	 (
	  H == posicao -> [heuristicaPosicao] ;	  
	  nl,write('Erro na passagem dos parametros'),nl,fail
	 )
	),
	(
	 B == profundidade -> [profundidade] ;
	  (
	   B == largura -> [largura] ; 
	    (
	     B == gradiente -> [gradiente] ;
	      (
	       B == escalada -> [escalada] ;
		(
		 B == aestrela -> [aestrela] ;
		  (
		   B == beam -> [beam] ;
		    (
		     B == idaestrela -> [idaestrela] ;
		      (
		       nl,write('Erro na passagem de parametros'),nl,fail) )
		  )
		)
	      )
	    )
	  )
	),
	valorTabuleiro(X,V),
	(
	 (B == aestrela ; B == idaestrela) -> V1 = [0,V] ;
	 V1 = V
	),
	append(X,[V1],X2),
	(
	 B == idaestrela -> buscaIDA(X2) ;
	 busca(X2)
	).

/* tabuleiroAleatorio(-Aleatorio, +Passos) - Cria um tabuleiro aleatoriamente em Aleatorio, com o número de passos determinado em Passos à partir da solução do tabuleiro */
tabuleiroAleatorio(Aleatorio,Passos) :-
	randomize,
	tabuleiroCorreto(Base),
	variasJogadasAleatorias(Base,Aleatorio,Passos,[Base]).

/* variasJogadasAleatorias(+Base, -Aleatorio, +Passos, +Caminho) - Cria um tabuleiro em Aleatorio, à partir da Base, executando um determinado número de Passos aleatórios, sem repetir os tabuleiros que estão em Caminho*/
variasJogadasAleatorias(Base, Base, 0,_) :- !.
variasJogadasAleatorias(Base, Aleatorio, N,Caminho) :-
	N1 is N - 1,
	jogadaAleatoriaInt(Base, NovoTabuleiro,Caminho),
	variasJogadasAleatorias(NovoTabuleiro, Aleatorio, N1, [NovoTabuleiro|Caminho]).

/* jogadaAleatoriaInt(+Base, -Al, +Lista) - Realiza uma jogada aleatória no tabuleiro Base, produzindo o tabuleiro Al, sem que Al esteja em Lista */
jogadaAleatoriaInt(Base,Al,Lista) :-
	jogadaAleatoria(Base,Al1),
	(
	 member(Al1,Lista) -> jogadaAleatoriaInt(Base,Al,Lista) ;
	 Al = Al1
	).

/* jogadaAleatoria(+Base, -Aleatorio) - Realiza uma jogada aleatória no tabuleiro Base, produzindo o tabuleiro Aleatorio */
jogadaAleatoria(Base, Aleatorio) :-
	geraJogadas(Base, F1, F2, F3, F4),
	random(1, 5, Filho),
	(
	 (
	  Filho =:= 1 -> Tentativa = F1
	 );
	 (
	  Filho =:= 2 -> Tentativa = F2
	 );
	 (
	  Filho =:= 3 -> Tentativa = F3
	 );
	 (
	  Filho =:= 4 -> Tentativa = F4
	 )
	),
	(
	 (
	  Tentativa \== [] ->
	    (
	     valorTabuleiro(Tentativa, V),
	     append(Tentativa, [V], Aleatorio)
	    );
	  jogadaAleatoria(Base, Aleatorio)
	 )
	).

/*busca(+Nodo) - Realiza a busca pela solução, à partir do Nodo*/
busca(Nodo)  :-
	busca(Nodo, [], []).

/*busca(+Nodo, +Lista de Nos Abertos, +Acumulador) - Realiza a busca pela solução, à partir do Nodo, utilizando uma Lista de Nos Abertos e armazenando os resultados no Acumulador*/
busca(Nodo, Lista, Acumulador) :-
	(
	 eSolucao(Nodo) -> 
	 (
	  statistics,
	  eliminaRepeticoes(Lista,ListaU),
	  write('Número de elementos na lista de nós fechados: '),
	  length(Acumulador, TamAcumulador),
	  write(TamAcumulador), nl,
	  write('Número de elementos na lista de nós abertos: '),
	  length(ListaU, TamListaU),
	  write(TamListaU), nl
	 ) ;	
	 (
	  naoEstaEm(Nodo, Acumulador) ->
	  expandeFilhos(Nodo, Lista, [E|Lista1]),
	  tenta(E, Lista1, [Nodo|Acumulador])
	 )
	).

/*debuga(+Nodo, +Filho, +NosAbertos) - Para depuração, imprime um Nodo, seu Filho, e a lista de Nós Abertos (NosAbertos)*/
debuga(Nodo,Filho,NosAbertos) :-
	write('Expandindo pai:'), nl,
	imprimeTabuleiro(Nodo),nl,
	write('Filho:'),nl,
	imprimeTabuleiro(Filho), nl,
	imprimeLista(NosAbertos),
	get_char(_).

/*tenta(+Nodo, +Lista, +Acumulador) - Tenta realizar a expansão do Nodo ou vai para o próximo item da Lista, salvando o resultado no Acumulador*/
tenta(Nodo, [Prox|Lista], Acumulador) :-
	(
	 busca(Nodo, [Prox|Lista], Acumulador) ->
	 true;
	 tenta(Prox, Lista, Acumulador)
	).

/*naoEstaEm(+Elemento, +Lista) - Retorna verdadeiro se Elemento não está na Lista*/
naoEstaEm(_, []).
naoEstaEm(Elemento, [E|L]) :-
	E \== Elemento,
	naoEstaEm(Elemento,L).

/*eSolucao(+Tabuleiro) - Retorna verdadeiro se o Tabuleiro for solução do problema*/
eSolucao(Tabuleiro) :-
	tabuleiroCorreto(Tabuleiro).

/*ordena(+Lista, -ListaOrdenada) - Ordena a Lista, criando a ListaOrdenada*/
ordena([], []).
ordena([H|Tail], ListaOrdenada) :-
 	ordena(Tail, TailOrdenado),
 	insereMenor(H, TailOrdenado, ListaOrdenada).

/*insereMenor(+Elemento, +Lista, -Lista Com Elemento) - Insere o Elemento na Lista, na posição correta, gerando a Lista Com Elemento*/
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


/*imprimeTabuleiro(+Tabuleiro) - Imprime o Tabuleiro*/
imprimeTabuleiro([Linha1, Linha2, Linha3, Linha4, _]) :-
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha1),nl,
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha2),nl,
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha3),nl,
	write(' -------------------'),nl,
	write('|'),imprimeLinha(Linha4),nl,
	write(' -------------------'),nl.

/*imprimeLinha(+Linha) - Imprime a Linha*/
imprimeLinha([]).
imprimeLinha([E|L]) :-
	(
	 E < 10 ->
	 (
	  write('  '),
	  (
	   E \== 0 ->
	   write(E);
	   write(' ')
	  ),
	  write(' ')
	 );
	 (
	  write(' '),
	  write(E),
	  write(' ')
	 )
	),
	write('|'),
	imprimeLinha(L).

/*imprimeLista(+Lista) - Imprime a Lista*/
imprimeLista([]).
imprimeLista([H|T]) :-
	write(H),nl,
	imprimeLista(T).

/*eliminaRepeticoes(+Lista, -Lista Sem Repetições) - Elimina as repetições da Lista, gerando a Lista Sem Repetições*/
eliminaRepeticoes([], []).
eliminaRepeticoes([H|T],R) :-
	member(H,T),
	!,
	eliminaRepeticoes(T,R).
eliminaRepeticoes([H|T], [H|R]) :-
	\+member(H,T),
	!,
	eliminaRepeticoes(T, R).

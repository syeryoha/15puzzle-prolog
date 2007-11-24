pMax(2).

joga(Tabuleiro, Peca, Valor,Jogada) :-
	infinitoPos(InfP),
	infinitoNeg(InfN),
	jogaMax([[],Tabuleiro], Peca, 0,Valor, Jogada).

jogaMax(TabuleiroJogado, Peca, Profundidade, Valor, Jogada) :-
	TabuleiroJogado = [_,Tabuleiro],
	pMax(PMax),cruz(Cruz),bola(Bola),infinitoPos(InfP),infinitoNeg(InfN),inverterPeca(Peca,Inimigo),
	(
	 ganhou(Inimigo,Tabuleiro) ->
	 (write('Meu Deus! Ele vai ganhar!!!'),nl,
	  Valor=InfN
	 );
	 (
	  Profundidade >= PMax ->  heuristica(Tabuleiro, Peca, Valor) ;
	  ( jogadas(Peca,Tabuleiro, Tabuleiros),
	    Profundidade1 is Profundidade + 1,
	    maxAvaliaSucessores(Tabuleiros, Peca, Profundidade1, InfN, Valor, [], Jogada)
	  )
	 )
	).

maxAvaliaSucessores([], Peca, Profundidade, NovoValor, NovoValor, NovoJogada, NovoJogada).
maxAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Valor, NovoValor, Jogada, NovoJogada) :-
	jogaMin(T, Peca, Profundidade, ValorMin),
	max(Valor, ValorMin, PossivelNovoValor),
	T = [_,Tabuleiro],
	( (PossivelNovoValor =:= ValorMin) -> PossivelNovaJogada = T ; PossivelNovaJogada = Jogada ),
	maxAvaliaSucessores(Tabuleiros, Peca, Profundidade, PossivelNovoValor, NovoValor, PossivelNovaJogada, NovoJogada).

jogaMin(TabuleiroJogado, Peca, Profundidade, Valor) :-
	TabuleiroJogado = [_,Tabuleiro],
	pMax(PMax),infinitoPos(InfP),infinitoNeg(InfN),inverterPeca(Peca,Inimigo),
	(
	 ganhou(Peca,Tabuleiro) ->
	 (write('Opa! Eu posso ganhar!'), nl,
	  Valor=InfP
	 );
	 (
	  Profundidade >= PMax -> heuristica(Tabuleiro, Peca, Valor) ;
	  ( jogadas(Inimigo,Tabuleiro, Tabuleiros),
	    Profundidade1 is Profundidade + 1,
	    minAvaliaSucessores(Tabuleiros, Peca, Profundidade1, InfP, Valor,_,_)
	  )
	 )
	).

minAvaliaSucessores([], Peca, Profundidade, NovoValor, NovoValor, NovoJogada, NovoJogada).
minAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Valor, NovoValor, Jogada, NovoJogada) :-
	jogaMax(T, Peca, Profundidade, ValorMax, Jogada),
	min(Valor, ValorMax, PossivelNovoValor),
	minAvaliaSucessores(Tabuleiros, Peca, Profundidade, PossivelNovoValor, NovoValor, _, _).

max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- X < Y.
min(X,Y,X) :- X =< Y.
min(X,Y,Y) :- X > Y.

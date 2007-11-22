infinitoPos(100000000).
infinitoNeg(-100000000).
pMax(2).

joga(Tabuleiro, Peca, Valor,Jogada) :-
	infinitoPos(InfP),
	infinitoNeg(InfN),
	jogaMax([[],Tabuleiro], Peca, InfN, InfP, 0,Valor, Jogada).

jogaMax(TabuleiroJogado, Peca, Alpha, Beta, Profundidade, Valor, Jogada) :-
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
	    maxAvaliaSucessores(Tabuleiros, Peca, Profundidade1, Alpha, NovoAlpha, Beta, InfN, Valor, [], Jogada)
	  )
	 )
	).

maxAvaliaSucessores([], Peca, Profundidade, NovoAlpha, NovoAlpha, Beta, NovoValor, NovoValor, NovoJogada, NovoJogada).
maxAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Alpha, NovoAlpha, Beta, Valor, NovoValor, Jogada, NovoJogada) :-
	jogaMin(T, Peca, Alpha, Beta, Profundidade, ValorMin),
	max(Valor, ValorMin, PossivelNovoValor),
	( PossivelNovoValor =:= ValorMin -> PossivelNovaJogada = T ; PossivelNovaJogada = Jogada ),
	(
	 PossivelNovoValor < Beta ->
	 (
	  max(Alpha, PossivelNovoValor, PossivelNovoAlpha),
	  maxAvaliaSucessores(Tabuleiros, Peca, Profundidade, PossivelNovoAlpha, NovoAlpha, Beta, PossivelNovoValor, NovoValor, PossivelNovaJogada, NovoJogada) 
	 );
	 (
	  NovoValor is PossivelNovoValor,
	  NovoAlpha is Alpha %**VERIFICAR!
	 )
	).

jogaMin(TabuleiroJogado, Peca, Alpha, Beta, Profundidade, Valor) :-
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
	    minAvaliaSucessores(Tabuleiros, Peca, Profundidade1, Alpha, NovoAlpha, InfP, Alpha, Valor,_,_)
	  )
	 )
	).

minAvaliaSucessores([], Peca, Profundidade, Alpha, PossivelNovoBeta, PossivelNovoBeta, NovoValor, NovoValor, NovoJogada, NovoJogada).
minAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Alpha, NovoBeta, Beta, Valor, NovoValor, Jogada, NovoJogada) :-
	jogaMax(T, Peca, Alpha, Beta, Profundidade, ValorMax, Jogada),
	min(Valor, ValorMax, PossivelNovoValor),
	(
	 PossivelNovoValor > Alpha ->
	 (
	  min(Beta, PossivelNovoValor, PossivelNovoBeta),
	  minAvaliaSucessores(Tabuleiros, Peca, Profundidade, Alpha, NovoBeta, PossivelNovoBeta, PossivelNovoValor, NovoValor)
	 );
	 (
	  NovoValor is PossivelNovoValor,
	  NovoBeta is Beta %**VERIFICAR!
	 )
	).

max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- X < Y.
min(X,Y,X) :- X =< Y.
min(X,Y,Y) :- X > Y.

pMax(2).

joga(Tabuleiro, Peca, Valor,Jogada) :-
	infinitoPos(Beta),
	infinitoNeg(Alpha),
	jogaMax([[],Tabuleiro], Peca, 0,Valor, Jogada, Alpha, Beta).

jogaMax(TabuleiroJogado, Peca, Profundidade, Valor, Jogada, Alpha, Beta) :-
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
	    maxAvaliaSucessores(Tabuleiros, Peca, Profundidade1, InfN, Valor, [], Jogada, Alpha, Beta)
	  )
	 )
	).

maxAvaliaSucessores([], Peca, Profundidade, NovoValor, NovoValor, NovoJogada, NovoJogada, Alpha, Beta).
maxAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Valor, NovoValor, Jogada, NovoJogada, Alpha, Beta) :-
	jogaMin(T, Peca, Profundidade, ValorMin, Alpha, Beta),
	max(Valor, ValorMin, PossivelNovoValor),
	T = [_,Tabuleiro],
	( (PossivelNovoValor =:= ValorMin) -> PossivelNovaJogada = T ; PossivelNovaJogada = Jogada ),
        (
          PossivelNovoValor >= Beta  -> 
          (
            NovoValor=PossivelNovoValor,
            NovoJogada=PossivelNovaJogada
           );
          (
          max(Alpha, PossivelNovoValor, NovoAlpha),
          maxAvaliaSucessores(Tabuleiros, Peca, Profundidade, PossivelNovoValor, NovoValor, PossivelNovaJogada, NovoJogada, NovoAlpha, Beta)
          )
        ).

jogaMin(TabuleiroJogado, Peca, Profundidade, Valor, Alpha, Beta) :-
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
	    minAvaliaSucessores(Tabuleiros, Peca, Profundidade1, InfP, Valor, Alpha, Beta)
	  )
	 )
	).

minAvaliaSucessores([], Peca, Profundidade, NovoValor, NovoValor, Alpha, Beta).
minAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Valor, NovoValor, Alpha, Beta) :-
	jogaMax(T, Peca, Profundidade, ValorMax, _, Alpha, Beta),
	min(Valor, ValorMax, PossivelNovoValor),
	(
	    PossivelNovoValor =< Alpha ->
            (
		NovoValor=PossivelNovoValor
            );
	    (
		min(Beta, PossivelNovoValor, NovoBeta),
		minAvaliaSucessores(Tabuleiros, Peca, Profundidade, PossivelNovoValor, NovoValor, Alpha, NovoBeta)
	    )
	).

max(X,Y,X) :- X >= Y.
max(X,Y,Y) :- X < Y.
min(X,Y,X) :- X =< Y.
min(X,Y,Y) :- X > Y.

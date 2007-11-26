:- dynamic(pMax/1).
pMax(2).

joga(Tabuleiro, Peca, Valor,Jogada) :-
	infinitoPos(Beta),
	infinitoNeg(Alpha),
	inverterPeca(Peca,Inimigo),
	jogaMax([[],Tabuleiro], Peca, 0,Valor, Jogada1, Alpha, Beta),
	(
	 Jogada1 == [] ->
	 (
	   retractall(pMax(_)),
	   asserta(pMax(1)),
	   joga(Tabuleiro,Inimigo,_,[JogIn,_]),
	   atribuirCasa(Peca,Tabuleiro,JogIn,TabIn),
	   Jogada = [JogIn,TabIn],
	   retractall(pMax(_)),
	   asserta(pMax(2))
	 ); 
	 Jogada = Jogada1
	).

jogaMax(TabuleiroJogado, Peca, Profundidade, Valor, Jogada, Alpha, Beta) :-
	TabuleiroJogado = [_,Tabuleiro],
	pMax(PMax),cruz(Cruz),bola(Bola),infinitoPos(InfP),infinitoNeg(InfN),
        (
	    Profundidade >= PMax ->  heuristica(Tabuleiro, Peca, Valor) ;
	    (
		jogadas(Peca,Tabuleiro, Tabuleiros),
		Profundidade1 is Profundidade + 1,
		maxAvaliaSucessores(Tabuleiros, Peca, Profundidade1, InfN, Valor, [], Jogada, Alpha, Beta)
	    )
        ).

maxAvaliaSucessores([], Peca, Profundidade, NovoValor, NovoValor, NovoJogada, NovoJogada, Alpha, Beta).
maxAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Valor, NovoValor, Jogada, NovoJogada, Alpha, Beta) :-
        T = [_,Tabuleiro],
	infinitoPos(InfP),
	(
	    ganhou(Peca, Tabuleiro) ->
	    ValorMin = InfP;	
	    jogaMin(T, Peca, Profundidade, ValorMin, Alpha, Beta)
	),
	max(Valor, ValorMin, PossivelNovoValor),
	( (PossivelNovoValor =:= ValorMin,PossivelNovoValor\==Valor) -> PossivelNovaJogada = T ; PossivelNovaJogada = Jogada ),
        (
          PossivelNovoValor > Beta  -> 
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
	    Profundidade >= PMax -> heuristica(Tabuleiro, Peca, Valor) ;
	    (
		jogadas(Inimigo,Tabuleiro, Tabuleiros),
		Profundidade1 is Profundidade + 1,
		minAvaliaSucessores(Tabuleiros, Peca, Profundidade1, InfP, Valor, Alpha, Beta)
	    )
	).

minAvaliaSucessores([], Peca, Profundidade, NovoValor, NovoValor, Alpha, Beta).
minAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Valor, NovoValor, Alpha, Beta) :-
	infinitoNeg(InfN),
	inverterPeca(Peca, Inimigo),
        T = [_,Tabuleiro],
	(
	    ganhou(Inimigo, Tabuleiro) ->
	    (
		write('Ops! Posso perder!'), nl,
		ValorMax = InfN
	    );
	    (
		%write('Tenho chance de ganhar...'),nl,
		jogaMax(T, Peca, Profundidade, ValorMax, _, Alpha, Beta)
	    )
	),
	min(Valor, ValorMax, PossivelNovoValor),
	(
	    PossivelNovoValor < Alpha ->
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

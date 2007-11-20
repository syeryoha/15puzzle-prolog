jogar(Tabuleiro, Peca, [X, Y, Z]) :-
	infinitoPos(InfP),
	infinitoNeg(InfN),
	jogaMax(Tabuleiro, InfN, InfP, 0).

jogaMax(Tabuleiro, Peca, Alpha, Beta, Profundidade, Valor) :-
	pMax(PMax),
	(
	 Profundidade >= PMax ->
	 heuristica(Tabuleiro, Peca, Valor)
	);
	jogadas(Tabuleiro, Tabuleiros),
	infinitoNeg(InfN),
	Profundidade1 is Profundidade + 1,
	maxAvaliaSucessores(Tabuleiros, Peca, Profundidade1, Alpha, NovoAlpha, Beta, InfN, Valor).	

maxAvaliaSucessores([], Peca, Profundidade, NovoAlpha, NovoAlpha, Beta, NovoValor, NovoValor).
maxAvaliaSucessores([T|Tabuleiros], Peca, Profundidade, Alpha, NovoAlpha, Beta, Valor, NovoValor) :-
	jogaMin(T, Peca, Alpha, Beta, Profundidade1, ValorMin),
	max(Valor, ValorMin, PossivelNovoValor),
	(
	 PossivelNovoValor < Beta ->
	 (
	  max(Alpha, PossivelNovoValor, PossivelNovoAlpha),
	  maxAvaliaSucessores(Tabuleiros, Peca, Profundidade, PossivelNovoAlpha, NovoAlpha, Beta, PossivelNovoValor, NovoValor)
	 );
	 (
	  NovoValor is PossivelNovoValor,
	  NovoAlpha is Alpha %**VERIFICAR!
	 )
	).

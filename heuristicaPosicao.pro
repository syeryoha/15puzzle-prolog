/*valorTabuleiro(+Tabuleiro, -Valor) - Calcula o Valor de um Tabuleiro*/
valorTabuleiro([],-1).
valorTabuleiro(Tabuleiro, Valor) :-
	valorTabuleiro2(Tabuleiro, Valor2),
	Valor is 15 - Valor2.

/*valorTabuleiro2(+Tabuleiro, -Valor) - Calcula o Valor de um Tabuleiro, mas nesse caso quanto maior for o valor, melhor é o Tabuleiro*/
valorTabuleiro2([Linha1, Linha2, Linha3, Linha4], Valor) :-
	valorLinha(Linha1, 1, Valor1),
	valorLinha(Linha2, 5, Valor2),
	valorLinha(Linha3, 9, Valor3),
	valorLinha(Linha4, 13, Valor4),
	Valor is Valor1 + Valor2 + Valor3 + Valor4.

/*valorLinha(+Linha, +Número da Linha, -Valor) - Com base no Número da Linha, calcula o Valor de uma Linha do tabuleiro*/
valorLinha(Linha, N, Valor) :-
	valorLinha(Linha, N, Valor, 0).
valorLinha([], _, Valor, Valor).
valorLinha([E|L], N, Valor, Acc) :-
	N1 is N+1,
	(E =:= N ->
	(Acc1 is Acc + 1,
	 valorLinha(L, N1, Valor, Acc1));
	valorLinha(L, N1, Valor, Acc)).

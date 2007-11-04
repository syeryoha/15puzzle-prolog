/*expandeFilhos(+Nodo, +Lista, -ListaR) - Expande os filhos do Nodo, colocando-os na Lista, gerando assim, a ListaR*/
expandeFilhos(Nodo, Lista, ListaR) :-
	geraJogadas(Nodo,F1,F2,F3,F4),
	custoCaminho(Nodo,VN),
	
	valorTabuleiro(F1,VF1),
	valorTabuleiro(F2,VF2),
	valorTabuleiro(F3,VF3),
	valorTabuleiro(F4,VF4),
	
	CustoCaminho is VN + 1,
	VTF1 is VF1+CustoCaminho,
	VTF2 is VF2+CustoCaminho,
	VTF3 is VF3+CustoCaminho,
	VTF4 is VF4+CustoCaminho,
	
	append(F1,[[CustoCaminho,VTF1]],S1),
	append(F2,[[CustoCaminho,VTF2]],S2),
	append(F3,[[CustoCaminho,VTF3]],S3),
	append(F4,[[CustoCaminho,VTF4]],S4),
	
	Fs1 = [S1],
	concatSol(Fs1,[S2],Fs2),
	concatSol(Fs2,[S3],Fs3),
	concatSol(Fs3,[S4],Fs4),
	concatSol(Fs4,Lista,ListaNO),
	ordena(ListaNO,ListaR).

/*concatSol(+Solução1, +Solução2, -Resultado) - Concatena a Solução1 com a Solução2, produzindo uma lista em Resultado*/
concatSol(S1,S2,R) :-
	S1 \= [[_]] ->
	(
	 S2 \= [[_]] -> append(S1,S2,R) ;
	 R = S1
	) ;
	(
	 S2 \= [[_]] -> R = S2 ;
	 R = [[-1]]
	).

/* valor(+Tabuleiro, -Valor) - Retorna o Valor de um Tabuleiro */
valor([_,_,_,_,[_, Valor]],Valor).

/*custoCaminho(+Tabuleiro, -Custo Do Caminho) - Retorna o Custo Do Caminho utilizado para chegar até esse Tabuleiro*/
custoCaminho([_,_,_,_,[CustoCaminho, _]],CustoCaminho).

/*retornaTabuleiro(+Tabuleiro Com Valores, -Tabuleiro) - Retorna apenas o Tabuleiro, de um Tabuleiro Com Valores*/
retornaTabuleiro([Linha1, Linha2, Linha3, Linha4, [_, _]], [Linha1, Linha2, Linha3, Linha4]).

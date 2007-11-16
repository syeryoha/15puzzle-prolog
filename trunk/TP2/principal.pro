:- include(heuristica).
:- include(jogadas).
:- include(tabuleiro).

principal :-
	tabuleiroVazio(X),
	cruz(C),
	principal(X, C).

principal(Tabuleiro, Peca) :-
	imprimeTabuleiro(Tabuleiro),	
	cruz(C),
	bola(B),
	heuristica(Tabuleiro, C, ValorC),
	heuristica(Tabuleiro, B, ValorB),
	write('Valor Cruz: '), write(ValorC), nl,
	write('Valor Bola: '), write(ValorB), nl,
	write('Linha [0-3]: '),
	read(Linha), nl,
	write('Coluna [0-3]: '),
	read(Coluna), nl,
	write('Dimensão [0-3]: '),
	read(Dimensao), nl,
	(
	 atribuirCasa(Peca, Tabuleiro, [Coluna, Linha, Dimensao], TabJogado) ->	%** Por que linha e coluna ficaram invertidas?
	 (
	  (
	   ganhou(Peca, TabJogado) ->
	   (
	    imprimeTabuleiro(TabJogado),
	    nomePeca(Peca, Nome),
	    write(Nome),
	    write(' '),
	    write('Ganhou!'),nl
	   )
	  );
	  (
	   inverterPeca(Peca, OutraPeca),
	   principal(TabJogado, OutraPeca)
	  )
	 );
	 (
	  write('Jogada inválida. Por favor, jogue novamente'), nl,
	  principal(Tabuleiro, Peca)
	 )
	).


ganhou(Peca, Tabuleiro) :-
	avaliaConexoes(Tabuleiro, Peca, Valor, 4),
	Valor > 0.
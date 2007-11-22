:- include(heuristica).
:- include(jogadas).
:- include(tabuleiro).
:- include(minMax).


repete.
repete :- repete.

:- dynamic(tabuleiroAtual/1).
:- dynamic(jogadorAtual/1).

tabuleiroAtual(X) :- tabuleiroVazio(X).
jogadorAtual(X) :- cruz(X).


principal :-
	repete,
	tabuleiroAtual(Tabuleiro),
	jogadorAtual(Peca),
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
	   retractall(tabuleiroAtual(_)),
	   retractall(jogadorAtual(_)),
	   asserta(tabuleiroAtual(TabJogado)),
	   asserta(jogadorAtual(OutraPeca)),
	   fail
	   %principal(TabJogado, OutraPeca)
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

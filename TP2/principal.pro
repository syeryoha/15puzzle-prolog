:- include(heuristica).
:- include(jogadas).
:- include(tabuleiro).
:- include(minMax).
:- include(soquete).

repete.
repete :- repete.

:- dynamic(tabuleiroAtual/1).
:- dynamic(jogadorAtual/1).
:- dynamic(computador/1).

infinitoPos(10000).
infinitoNeg(-10000).

tabuleiroAtual(X) :- tabuleiroVazio(X).
jogadorAtual(X) :- cruz(X).
computador(1).


principal :-
	write('Deseja comecar e conectar a outro jogador? [s/n]'),nl,
	read(Resposta),
	(
	 (Resposta == 's'; Resposta == 'S') ->
	  (
	   write('Digite o servidor a se conectar:'),nl,
	   read(Servidor),
	   write('Digite o porto do servidor:'),nl,
	   read(Porto),
	   decideJogador(Peca),
	   conecta_adversario(Servidor,Porto,Conexao),
	   tabuleiroVazio(Vaz),joga(Vaz,Peca,_,[Jogada,Tabuleiro]),
	   imprimeTabuleiro(Tabuleiro),
	   Jogada = [X,Y,Z],
	   envia_jogada(Conexao,X,Y,Z),
	   retractall(tabuleiroAtual(_)),
	   asserta(tabuleiroAtual(Tabuleiro)),
	   jogo(Peca,Conexao)
	  );
	 ( (Resposta == 'n' ; Resposta == 'N') ->
	  (
	   write('Digite o porto a ser usado:'),nl,
	   read(Porto),
	   decideJogador(Peca),
	   write('Esperando algum jogador se conectar...'),nl,
	   espera_adversario(Porto,Conexao),
	   jogo(Peca,Conexao)
	  );
	  write('Erro, responda s ou n.'),nl
	 )
	).

decideJogador(Peca) :-
	write('Digite qual jogador quer ser: [cruz/bola]'),nl,
	read(PecaNome),
	(PecaNome == cruz -> Peca = 1 ;
	 (PecaNome == bola -> Peca = -1 ;
	  write("Erro, deve-se escolher ou cruz ou bola."),nl,fail 
	 )
	).

jogo(Peca,Conexao) :-
	repete,
	tabuleiroAtual(Tab),inverterPeca(Peca,Inimigo),
	write('Esperando jogada do inimigo...'),nl,
	recebe_jogada(Conexao,X,Y,Z),
	atribuirCasa(Inimigo, Tab, [Y, X, Z], TabJogado),
	imprimeTabuleiro(TabJogado),
	( (jogadas(Peca,TabJogado,Tabs),Tabs == []) -> write('Deu velha!'),nl ;
	 (
	  ganhou(Inimigo,TabJogado) -> write('Eu perdi!'),nl ;
	  ( 
	    write('Calma, estou pensando na minha jogada...'),nl,
	    joga(TabJogado,Peca,_,[Jogada,TabJogado2]),
	    Jogada = [Y1,X1,Z1],
	    envia_jogada(Conexao,X1,Y1,Z1),
	    imprimeTabuleiro(TabJogado2),
	    (
	      ganhou(Peca,TabJogado2) -> write('Eu ganhei!'),nl ;
	        (
		  retractall(tabuleiroAtual(_)),
	          asserta(tabuleiroAtual(TabJogado2)),
	          (
		   (jogadas(Peca,TabJogado2,Tabs2),Tabs2 == []) -> write('Deu velha!'),nl 
		  );
		  fail
		)
	    )
	  )
	 )
	).


principalHumano :-
	repete,
	tabuleiroAtual(Tabuleiro),
	jogadorAtual(Peca),
	imprimeTabuleiro(Tabuleiro),	
	cruz(C),
	bola(B),
	((jogadas(Peca,Tabuleiro,Tabs),Tabs == []) -> write('Deu velha!'),nl;
	
	(
	 computador(1) ->
	 (
	  joga(Tabuleiro, Peca, Valor, [[Coluna, Linha, Dimensao],_]),
          write('Valor: '),
          write(Valor), nl
	 );
	 (
	  write('Linha [0-3]: '),
	  read(Linha), nl,
	  write('Coluna [0-3]: '),
	  read(Coluna), nl,
	  write('Dimensão [0-3]: '),
	  read(Dimensao), nl
	  )
	),
	(
	 write('Jogada: '),nl,
	 write(Coluna),
	 write(', '),
	 write(Linha),
	 write(', '),
	 write(Dimensao),
	 atribuirCasa(Peca, Tabuleiro, [Coluna, Linha, Dimensao], TabJogado) ->	%** Por que linha e coluna ficaram invertidas?
	 (
	  (
	   ganhou(Peca, TabJogado) ->
	   (
	    imprimeTabuleiro(TabJogado),
	    nomePeca(Peca, Nome),
	    write(Nome),
	    write(' '),
	    write('Ganhou!'),nl,!
	   )
	  );
	  (
	   inverterPeca(Peca, OutraPeca),
	   retractall(tabuleiroAtual(_)),
	   retractall(jogadorAtual(_)),
	   asserta(tabuleiroAtual(TabJogado)),
	   asserta(jogadorAtual(OutraPeca)),
	   (
	    computador(1) ->
	    (
	     retractall(computador(_)),
	     asserta(computador(0))
	    );
	    (
	     retractall(computador(_)),
	     asserta(computador(1))
	    )
	   ),
	   fail
	    %principal(TabJogado, OutraPeca)
	  )
	 );
	 (
	  write('Jogada inválida. Por favor, jogue novamente'), nl,
          fail
	  %principal(Tabuleiro, Peca)
	 )
	)
	).


ganhou(Peca, Tabuleiro) :-
	avaliaConexoes(Tabuleiro, Peca, Valor, 4),
	Valor > 0.

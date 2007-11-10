testaX(1).
testaX(2).
testaX(3).
testaY(1).
testaY(2).
testaY(3).
testaZ(1).
testaZ(2).
testaZ(3).

obterCasa([],[X,Y,Z],[]) :-
	testaX(X),testaY(Y),testaZ(Z),
	X == Y, X == Z.

atribuirCasa([],[X,Y,Z],1,W) :-
	W is X + Y + Z.

jogar(Original,Jogado) :-
	obterCasa(Original,[X,Y,Z],Casa),
	( Casa == [] ->
	atribuirCasa(Original,[X,Y,Z],1,Jogado) ; fail ).

jogadas(Tabuleiro,Tabuleiros) :-
	findall(Tabs,jogar(Tabuleiro,Tabs),Tabuleiros).

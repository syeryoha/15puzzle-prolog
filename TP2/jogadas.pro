jogar(Peca,Original,Jogado) :-
	member(Z,[0,1,2,3]), member(Y,[0,1,2,3]), member(X,[0,1,2,3]),
	atribuirCasa(Peca,Original,[X,Y,Z],Jogado).


jogadas(Peca,Tabuleiro,Tabuleiros) :-
	findall(Tabs,jogar(Peca,Tabuleiro,Tabs),Tabuleiros).

jogar(Original,Jogado) :-
	member(Z,[0,1,2,3]), member(Y,[0,1,2,3]), member(X,[0,1,2,3]),
	atribuirCasa(1,Original,[X,Y,Z],Jogado).


jogadas(Tabuleiro,Tabuleiros) :-
	findall(Tabs,jogar(Tabuleiro,Tabs),Tabuleiros).

expandeFilhos(Nodo, Lista, ListaR) :-
	geraJogadas(Nodo,F1,F2,F3,F4),valor(Nodo,VN),
	valorTabuleiro(F1,VF1),valorTabuleiro(F2,VF2),
	valorTabuleiro(F3,VF3),valorTabuleiro(F4,VF4),
	VTF1 is VF1+VN,VTF2 is VF2+VN,VTF3 is VF3+VN,VTF4 is VF4+VN,
	append(F1,[VTF1],S1),append(F2,[VTF2],S2),
	append(F3,[VTF3],S3),append(F4,[VTF4],S4),
	Fs1 = [S1],concatSol(Fs1,[S2],Fs2),concatSol(Fs2,[S3],Fs3),concatSol(Fs3,[S4],Fs4),concatSol(Fs4,Lista,ListaNO),ordenaMenor(ListaNO,ListaR).

concatSol(S1,S2,R) :-
	S1 \= [[_]] -> (S2 \= [[_]] -> append(S1,S2,R) ; R = S1) ;
	(S2 \= [[_]] -> R = S2 ; R = [[-1]]).

expandeFilhos(Nodo, Lista, ListaR) :-
	geraJogadas(Nodo,F1,F2,F3,F4),
	concatSol([F1],[F2],Fs1),concatSol(Fs1,[F3],Fs2),concatSol(Fs2,[F4],Fs3),
	concatSol(Fs3,Lista,ListaR).

concatSol(S1,S2,R) :-
	S1 \== [[]] -> (S2 \== [[]] -> append(S1,S2,R) ; R = S1) ;
	(S2 \== [[]] -> R = S2 ; R = [[]]).

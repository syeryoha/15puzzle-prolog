buscaIDA(Nodo, Lista) :-
	buscaIDA(Nodo, Lista, [], 1, -1).

buscaIDA(Nodo, [], Acumulador, _, -1) :- !, fail.
buscaIDA(Nodo, [], Acumulador, C, C1) :- !, buscaIDA(Nodo, [], Acumulador, C, C).

buscaIDA(Nodo, Lista, Acumulador, C, C1) :-
	(eSolucao(Nodo) ->
	    imprimeTabuleiro(Nodo);
	    (naoEstaEm(Nodo, Acumulador) ->
		expandeFilhosIDA(Nodo, Lista, [E|Lista1], C, C2),
		debuga(Nodo, E, Lista1),
		tentaIDA(E, Lista1, [Nodo|Acumulador], C2)
	    )
	).

tentaIDA(Nodo, [Prox|Lista], Acumulador, C) :-
	(buscaIDA(Nodo, [Prox|Lista], Acumulador, C) ->
	 true;
	 write('Falhou. Indo para:'),nl,
	 imprimeTabuleiro(Prox), nl,
	 tentaIDA(Prox, Lista, Acumulador, C)
	).

expandeFilhosIDA(Nodo, Lista, ListaR, C, C1) :-
	geraJogadas(Nodo,F1,F2,F3,F4),valor(Nodo,VN),
	valorTabuleiro(F1,VF1),valorTabuleiro(F2,VF2),
	valorTabuleiro(F3,VF3),valorTabuleiro(F4,VF4),
	VTF1 is VF1+VN,VTF2 is VF2+VN,VTF3 is VF3+VN,VTF4 is VF4+VN,
	append(NovoF1,[VTF1],S1),append(NovoF2,[VTF2],S2),
	append(NovoF3,[VTF3],S3),append(NovoF4,[VTF4],S4),
	elimina(S1, S2, S3, S4, NovoS1, NovoS2, NovoS3, NovoS4, C, C1),
	Fs1 = [NovoS1],concatsolIDA(Fs1,[NovoS2],Fs2),concatsolIDA(Fs2,[NovoS3],Fs3),concatsolIDA(Fs3,[NovoS4],Fs4),concatsolIDA(Fs4,Lista,ListaNO),ordenaMenor(ListaNO,ListaR).

elimina(Filho1, Filho2, Filho3, Filho4, Sobrevivente1, Sobrevivente2, Sobrevivente3, Sobrevivente4, C, NovoC) :-
	assassino(Filho1, Sobrevivente1, C, C, C1),
	assassino(Filho2, Sobrevivente2, C, C1, C2),
	assassino(Filho3, Sobrevivente3, C, C2, C3),
	assassino(Filho4, Sobrevivente4, C, C3, NovoC).

assassino(Vitima, Sobrevivente, Criterio, C, C1) :-
	valor(Vitima, Valor),
	(Valor >= Criterio ->
	    (Sobrevivente = Vitima,
	    C1 = C);
	    Sobrevivente = [[_]],
	    min(C, Valor, C1)).

min(-1, Y, Y) :- !. %acho que o -1 será utilizado para indicar infinito
min(X, Y, X) :- X < Y.
min(X, Y, Y) :- Y =< X.

concatsolIDA(S1,S2,R) :-
	S1 \= [[_]] -> (S2 \= [[_]] -> append(S1,S2,R) ; R = S1) ;
	(S2 \= [[_]] -> R = S2 ; R = [[-1]]).

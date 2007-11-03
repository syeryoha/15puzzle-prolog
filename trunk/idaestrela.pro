buscaIDA(Nodo, Lista) :-
	buscaIDA([Nodo|Lista], [], [Nodo|Lista], 1, -1).

%buscaIDA(Nodo, [], Acumulador, ListaInicial, _, -1) :- !, fail.
%buscaIDA(Nodo, [], Acumulador, ListaInicial, C, C1) :- !, buscaIDA(ListaInicial, [], Acumulador, ListaInicial, C1, -1).

buscaIDA([Nodo|Lista], Acumulador, ListaInicial, C, C1) :-
	%write('Entrei em buscaIDA'), nl,
	(eSolucao(Nodo) ->
	 imprimeTabuleiro(Nodo);
	 (
	  naoEstaEm(Nodo, Acumulador),
	  (
	   expandeFilhosIDA(Nodo, Lista, ListaR, C, C1, C2),
	   (
	    ListaR = [E|Lista1] ->
	    (
	     debugaIDA(Nodo, E, Lista1, C, C2),
	     tentaIDA([E|Lista1], [Nodo|Acumulador], ListaInicial, C, C2)
	    );
	   %Não consegui pegar o primeiro elemento da lista de nós abertos. Portanto, ela está vazia. Temos que recomeçar uma nova iteração, com o novo valor de C, permitindo aumentar a "abrangência" da busca do algoritmo
	    (
	     C2 =:= -1 -> fail;	%se o C da próxima iteração é infinito (-1), falhamos
	     (
	      %write('Novo C: '),
	      %write(C2), nl,
	      buscaIDA(ListaInicial, [], ListaInicial, C2, -1) % Se há um C, vamos começar tudo de novo com ele
	     )
	    )
	   )
	  )
	 )
	).

debugaIDA(Nodo, Filho, NosAbertos, C, ProxC) :-
	write('C: '), write(C), nl,
	write('ProxC: '), write(ProxC), nl,
	imprimeLista(NosAbertos),
	get_char(_).


tentaIDA([Nodo], Acumulador, ListaInicial, C, C1) :-
	buscaIDA([Nodo], Acumulador, ListaInicial, C, C1).

tentaIDA([Nodo,Prox|Lista], Acumulador, ListaInicial, C, C1) :-
	%write('Entrei em tentaIDA'),nl,
	(buscaIDA([Nodo,Prox|Lista], Acumulador, ListaInicial, C, C1) ->
	 true;
	 %write('Falhou. Indo para:'),nl,
	 %imprimeTabuleiro(Prox), nl,
	 tentaIDA([Prox|Lista], Acumulador, ListaInicial, C, C1)
	).

expandeFilhosIDA(Nodo, Lista, ListaR, C, C1, C2) :-
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
	
	elimina(S1, S2, S3, S4, NovoS1, NovoS2, NovoS3, NovoS4, C, C1, C2),
	
	Fs1 = [NovoS1],
	concatsolIDA(Fs1,[NovoS2],Fs2),
	concatsolIDA(Fs2,[NovoS3],Fs3),
	concatsolIDA(Fs3,[NovoS4],Fs4),
	concatsolIDA(Fs4,Lista,ListaNO),
	ordena(ListaNO,ListaR).

elimina(Filho1, Filho2, Filho3, Filho4, Sobrevivente1, Sobrevivente2, Sobrevivente3, Sobrevivente4, C, C1, NovoC) :-
	assassino(Filho1, Sobrevivente1, C, C1, C2),
	assassino(Filho2, Sobrevivente2, C, C2, C3),
	assassino(Filho3, Sobrevivente3, C, C3, C4),
	assassino(Filho4, Sobrevivente4, C, C4, NovoC).

assassino(Vitima, Sobrevivente, Criterio, C1, C2) :-
	valor(Vitima, Valor),
	(
	 Valor =< Criterio ->
	 (
	  %write('Valor: '), write(Valor), nl,
	  %write('Criterio: '), write(Criterio), nl,
	  %write('Sobreviveu!'),nl,
	  Sobrevivente = Vitima,
	  C2 = C1 %Nesse caso, não trocamos o valor do próximo C.
	 );
	 (
	  %write('Valor: '), write(Valor), nl,
	  %write('Criterio: '), write(Criterio), nl,
	  %write('Morreu!'),nl,
	  Sobrevivente = [[-1, -1]],
	  min(C1, Valor, C2)
	 )
	).

min(-1, Y, Y) :- !. %acho que o -1 será utilizado para indicar infinito
min(X, Y, X) :- X < Y.
min(X, Y, Y) :- Y =< X.

concatsolIDA(S1,S2,R) :-
	S1 \= [[_]] -> (S2 \=[[_]] -> append(S1,S2,R) ; R = S1) ;
	(S2 \= [[_]] -> R = S2 ; R = []).

valor([_,_,_,_,[CustoCaminho, Valor]],Valor).
custoCaminho([_,_,_,_,[CustoCaminho, Valor]],CustoCaminho).
retornaTabuleiro([Linha1, Linha2, Linha3, Linha4, [CustoCaminho, Valor]], [Linha1, Linha2, Linha3, Linha4]).

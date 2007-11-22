pesoCentral0(5).
pesoCentral1(20).
pesoCentral2(20).
pesoCentral3(5).

pesoConexoes2(5).
pesoConexoes3(100).

%heuristica(Tabuleiro, Peca, 100).

heuristica(Tabuleiro, Peca, Valor) :-
	heuristica2(Tabuleiro, Peca, ValorMeu),
	inverterPeca(Peca, OutraPeca),
	heuristica2(Tabuleiro, OutraPeca, ValorAdversario),
	Valor is ValorMeu - ValorAdversario.

	
heuristica2(Tabuleiro, Peca, Valor) :-
	avaliaCentral(Tabuleiro, Peca, Valor0),
	avaliaConexoes(Tabuleiro, Peca, Valor1),
	Valor is Valor0 + Valor1.

avaliaCentral(Tabuleiro, Peca, Valor) :-
	avaliaCentral2(Tabuleiro, Peca, Valor0, 0),
	avaliaCentral2(Tabuleiro, Peca, Valor1, 1),
	avaliaCentral2(Tabuleiro, Peca, Valor2, 2),
	avaliaCentral2(Tabuleiro, Peca, Valor3, 3),
	pesoCentral0(PesoCentral0),
	pesoCentral1(PesoCentral1),
	pesoCentral2(PesoCentral2),
	pesoCentral3(PesoCentral3),
	Valor is PesoCentral0*Valor0 + PesoCentral1*Valor1 + PesoCentral2*Valor2 + PesoCentral3*Valor3.

avaliaCentral2(Tabuleiro, Peca, Valor, N) :-
	obterCasa(Tabuleiro, [1, 1, N], PecaObtida0),
	(
	    PecaObtida0 =:= Peca ->
	    Valor0 is 1;
	    Valor0 is 0
	),
	obterCasa(Tabuleiro, [2, 1, N], PecaObtida1),
	(
	    PecaObtida1 =:= Peca ->
	    Valor1 is Valor0 + 1;
	    Valor1 is Valor0
	),
	obterCasa(Tabuleiro, [1, 2, N], PecaObtida2),
	(
	    PecaObtida2 =:= Peca ->
	    Valor2 is Valor1 + 1;
	    Valor2 is Valor1
	),
	obterCasa(Tabuleiro, [2, 2, N], PecaObtida3),
	(
	    PecaObtida3 =:= Peca ->
	    Valor is Valor2 + 1;
	    Valor is Valor2
	).

avaliaConexoes(Tabuleiro, Peca, Valor) :-
	avaliaConexoes(Tabuleiro, Peca, Valor2, 2),
	avaliaConexoes(Tabuleiro, Peca, Valor3, 3),
	pesoConexoes2(PesoConexoes2),
	pesoConexoes3(PesoConexoes3),
	expEspecial(PesoConexoes2, Valor2, Result2),
	expEspecial(PesoConexoes3, Valor3, Result3),
	Valor is Result2 + Result3.

avaliaConexoes(Tabuleiro, Peca, Valor, N) :-
	avaliaHorizontal(Tabuleiro, Peca, Valor0, N),
	avaliaVertical(Tabuleiro, Peca, Valor1, N),
	avaliaDiagonal(Tabuleiro, Peca, Valor2, N),
	avaliaProfundidade(Tabuleiro, Peca, Valor3, N),
	avaliaDiagonal3D(Tabuleiro, Peca, Valor4, N),
	avaliaHorizontal3D(Tabuleiro, Peca, Valor5, N),
	avaliaVertical3D(Tabuleiro, Peca, Valor6, N),
	Valor is Valor0 + Valor1 + Valor2 + Valor3 + Valor4 + Valor5 + Valor6.

expEspecial(Base, 0, 0) :- !.

expEspecial(Base, Expoente, Resultado) :-
	Resultado is Base ** Expoente.

avaliaHorizontal(Tabuleiro, Peca, Valor, N) :-
	avaliaHorizontal2(Tabuleiro, Peca, Valor0, N, 0),
	avaliaHorizontal2(Tabuleiro, Peca, Valor1, N, 1),
	avaliaHorizontal2(Tabuleiro, Peca, Valor2, N, 2),
	avaliaHorizontal2(Tabuleiro, Peca, Valor3, N, 3),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaHorizontal2(Tabuleiro, Peca, Valor, N, Profundidade) :-
	avaliaHorizontal3(Tabuleiro, Peca, Valor0, N, [0, Profundidade]),
	avaliaHorizontal3(Tabuleiro, Peca, Valor1, N, [1, Profundidade]),
	avaliaHorizontal3(Tabuleiro, Peca, Valor2, N, [2, Profundidade]),
	avaliaHorizontal3(Tabuleiro, Peca, Valor3, N, [3, Profundidade]),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaHorizontal3(Tabuleiro, Peca, Valor, N, [X, Z]) :-
	obterCasa(Tabuleiro, [X, 0, Z], Peca0),
	obterCasa(Tabuleiro, [X, 1, Z], Peca1),
	obterCasa(Tabuleiro, [X, 2, Z], Peca2),
	obterCasa(Tabuleiro, [X, 3, Z], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaVertical(Tabuleiro, Peca, Valor, N) :-
	avaliaVertical2(Tabuleiro, Peca, Valor0, N, 0),
	avaliaVertical2(Tabuleiro, Peca, Valor1, N, 1),
	avaliaVertical2(Tabuleiro, Peca, Valor2, N, 2),
	avaliaVertical2(Tabuleiro, Peca, Valor3, N, 3),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaVertical2(Tabuleiro, Peca, Valor, N, Profundidade) :-
	avaliaVertical3(Tabuleiro, Peca, Valor0, N, [0, Profundidade]),
	avaliaVertical3(Tabuleiro, Peca, Valor1, N, [1, Profundidade]),
	avaliaVertical3(Tabuleiro, Peca, Valor2, N, [2, Profundidade]),
	avaliaVertical3(Tabuleiro, Peca, Valor3, N, [3, Profundidade]),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaVertical3(Tabuleiro, Peca, Valor, N, [Y, Z]) :-
	obterCasa(Tabuleiro, [0, Y, Z], Peca0),
	obterCasa(Tabuleiro, [1, Y, Z], Peca1),
	obterCasa(Tabuleiro, [2, Y, Z], Peca2),
	obterCasa(Tabuleiro, [3, Y, Z], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaDiagonal(Tabuleiro, Peca, Valor, N) :-
	avaliaDiagonal2(Tabuleiro, Peca, Valor0, N, 0),
	avaliaDiagonal2(Tabuleiro, Peca, Valor1, N, 1),
	avaliaDiagonal2(Tabuleiro, Peca, Valor2, N, 2),
	avaliaDiagonal2(Tabuleiro, Peca, Valor3, N, 3),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaDiagonal2(Tabuleiro, Peca, Valor, N, Profundidade) :-
	avaliaDiagonal3(Tabuleiro, Peca, Valor0, N, [0, Profundidade]),
	avaliaDiagonal3(Tabuleiro, Peca, Valor1, N, [1, Profundidade]),
	Valor is Valor0 + Valor1.

avaliaDiagonal3(Tabuleiro, Peca, Valor, N, [0, Z]) :-
	obterCasa(Tabuleiro, [0, 0, Z], Peca0),
	obterCasa(Tabuleiro, [1, 1, Z], Peca1),
	obterCasa(Tabuleiro, [2, 2, Z], Peca2),
	obterCasa(Tabuleiro, [3, 3, Z], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaDiagonal3(Tabuleiro, Peca, Valor, N, [1, Z]) :-
	obterCasa(Tabuleiro, [0, 3, Z], Peca0),
	obterCasa(Tabuleiro, [1, 2, Z], Peca1),
	obterCasa(Tabuleiro, [2, 1, Z], Peca2),
	obterCasa(Tabuleiro, [3, 0, Z], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaProfundidade(Tabuleiro, Peca, Valor, N) :-
	avaliaProfundidade2(Tabuleiro, Peca, Valor0, N, 0),
	avaliaProfundidade2(Tabuleiro, Peca, Valor1, N, 1),
	avaliaProfundidade2(Tabuleiro, Peca, Valor2, N, 2),
	avaliaProfundidade2(Tabuleiro, Peca, Valor3, N, 3),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaProfundidade2(Tabuleiro, Peca, Valor, N, Vertical) :-
	avaliaProfundidade3(Tabuleiro, Peca, Valor0, N, [0, Vertical]),
	avaliaProfundidade3(Tabuleiro, Peca, Valor1, N, [1, Vertical]),
	avaliaProfundidade3(Tabuleiro, Peca, Valor2, N, [2, Vertical]),
	avaliaProfundidade3(Tabuleiro, Peca, Valor3, N, [3, Vertical]),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaProfundidade3(Tabuleiro, Peca, Valor, N, [X, Y]) :-
	obterCasa(Tabuleiro, [X, Y, 0], Peca0),
	obterCasa(Tabuleiro, [X, Y, 1], Peca1),
	obterCasa(Tabuleiro, [X, Y, 2], Peca2),
	obterCasa(Tabuleiro, [X, Y, 3], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaHorizontal3D(Tabuleiro, Peca, Valor, N) :-
	avaliaHorizontal3D2(Tabuleiro, Peca, Valor0, N, 0),
	avaliaHorizontal3D2(Tabuleiro, Peca, Valor1, N, 1),
	avaliaHorizontal3D2(Tabuleiro, Peca, Valor2, N, 2),
	avaliaHorizontal3D2(Tabuleiro, Peca, Valor3, N, 3),
	avaliaHorizontal3D3(Tabuleiro, Peca, Valor4, N, 0),
	avaliaHorizontal3D3(Tabuleiro, Peca, Valor5, N, 1),
	avaliaHorizontal3D3(Tabuleiro, Peca, Valor6, N, 2),
	avaliaHorizontal3D3(Tabuleiro, Peca, Valor7, N, 3),
	Valor is Valor0 + Valor1 + Valor2 + Valor3 + Valor4 + Valor5 + Valor6 + Valor7.

avaliaHorizontal3D2(Tabuleiro, Peca, Valor, N, X) :-
	obterCasa(Tabuleiro, [X, 0, 0], Peca0),
	obterCasa(Tabuleiro, [X, 1, 1], Peca1),
	obterCasa(Tabuleiro, [X, 2, 2], Peca2),
	obterCasa(Tabuleiro, [X, 3, 3], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaHorizontal3D3(Tabuleiro, Peca, Valor, N, X) :-
	obterCasa(Tabuleiro, [X, 0, 3], Peca0),
	obterCasa(Tabuleiro, [X, 1, 2], Peca1),
	obterCasa(Tabuleiro, [X, 2, 1], Peca2),
	obterCasa(Tabuleiro, [X, 3, 0], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaVertical3D(Tabuleiro, Peca, Valor, N) :-
	avaliaVertical3D2(Tabuleiro, Peca, Valor0, N, 0),
	avaliaVertical3D2(Tabuleiro, Peca, Valor1, N, 1),
	avaliaVertical3D2(Tabuleiro, Peca, Valor2, N, 2),
	avaliaVertical3D2(Tabuleiro, Peca, Valor3, N, 3),
	avaliaVertical3D3(Tabuleiro, Peca, Valor4, N, 0),
	avaliaVertical3D3(Tabuleiro, Peca, Valor5, N, 1),
	avaliaVertical3D3(Tabuleiro, Peca, Valor6, N, 2),
	avaliaVertical3D3(Tabuleiro, Peca, Valor7, N, 3),
	Valor is Valor0 + Valor1 + Valor2 + Valor3 + Valor4 + Valor5 + Valor6 + Valor7.

avaliaVertical3D2(Tabuleiro, Peca, Valor, N, Y) :-
	obterCasa(Tabuleiro, [0, Y, 0], Peca0),
	obterCasa(Tabuleiro, [1, Y, 1], Peca1),
	obterCasa(Tabuleiro, [2, Y, 2], Peca2),
	obterCasa(Tabuleiro, [3, Y, 3], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaVertical3D3(Tabuleiro, Peca, Valor, N, Y) :-
	obterCasa(Tabuleiro, [0, Y, 3], Peca0),
	obterCasa(Tabuleiro, [1, Y, 2], Peca1),
	obterCasa(Tabuleiro, [2, Y, 1], Peca2),
	obterCasa(Tabuleiro, [3, Y, 0], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

	
avaliaDiagonal3D(Tabuleiro, Peca, Valor, N) :-
	avaliaDiagonal3D2(Tabuleiro, Peca, Valor0, N, 0),
	avaliaDiagonal3D2(Tabuleiro, Peca, Valor1, N, 1),
	avaliaDiagonal3D2(Tabuleiro, Peca, Valor2, N, 2),
	avaliaDiagonal3D2(Tabuleiro, Peca, Valor3, N, 3),
	Valor is Valor0 + Valor1 + Valor2 + Valor3.

avaliaDiagonal3D2(Tabuleiro, Peca, Valor, N, 0) :-
	obterCasa(Tabuleiro, [0, 0, 0], Peca0),
	obterCasa(Tabuleiro, [1, 1, 1], Peca1),
	obterCasa(Tabuleiro, [2, 2, 2], Peca2),
	obterCasa(Tabuleiro, [3, 3, 3], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaDiagonal3D2(Tabuleiro, Peca, Valor, N, 1) :-
	obterCasa(Tabuleiro, [0, 0, 3], Peca0),
	obterCasa(Tabuleiro, [1, 1, 2], Peca1),
	obterCasa(Tabuleiro, [2, 2, 1], Peca2),
	obterCasa(Tabuleiro, [3, 3, 0], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaDiagonal3D2(Tabuleiro, Peca, Valor, N, 2) :-
	obterCasa(Tabuleiro, [0, 3, 3], Peca0),
	obterCasa(Tabuleiro, [1, 2, 2], Peca1),
	obterCasa(Tabuleiro, [2, 1, 1], Peca2),
	obterCasa(Tabuleiro, [3, 0, 0], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

avaliaDiagonal3D2(Tabuleiro, Peca, Valor, N, 3) :-
	obterCasa(Tabuleiro, [0, 3, 0], Peca0),
	obterCasa(Tabuleiro, [1, 2, 1], Peca1),
	obterCasa(Tabuleiro, [2, 1, 2], Peca2),
	obterCasa(Tabuleiro, [3, 0, 3], Peca3),
	nPeca(Peca, [Peca0, Peca1, Peca2, Peca3], Num),
	(
	    somente(Peca, [Peca0, Peca1, Peca2, Peca3]) ->
	    (
		Num =:= N ->
		Valor is 1;
		Valor is 0
	    );
	    Valor is 0
	).

nPeca(Peca, Pecas, Num) :-
	nPeca(Peca, Pecas, Num, 0).

nPeca(Peca, [], Num, Num).
nPeca(Peca, [P|Pecas], Num, Acc) :-
	(
	    Peca =:= P ->
	    Acc0 is Acc + 1;
	    Acc0 is Acc
	),
	nPeca(Peca, Pecas, Num, Acc0).

somente(Peca, []).
somente(Peca, [P|Pecas]) :-
	branco(Branco),
	(P =:= Branco ; P =:= Peca) ->
	    somente(Peca, Pecas);
	    fail.

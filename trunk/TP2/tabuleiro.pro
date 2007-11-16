branco(0).
cruz(1).
bola(-1).

tabuleiroVazio([[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]],[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]]).

tabuleiroNumerado([[[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15]],[[16,17,18,19],[20,21,22,23],[24,25,26,27],[28,29,30,31]],[[32,33,34,35],[36,37,38,39],[40,41,42,43],[44,45,46,47]],[[48,49,50,51],[52,53,54,55],[56,57,58,59],[60,61,62,63]]]).

obterCasa(Tabuleiro,[X,Y,Z],Casa) :-
	restringeDimensao(Tabuleiro,Z,Tab2D),
	restringeDimensao(Tab2D,Y,Linha),
	restringeDimensao(Linha,X,Casa).

restringeDimensao([H|_],0,H).
restringeDimensao([_|T],X,Res) :-
	X \== 0, X1 is X - 1,
	restringeDimensao(T,X1,Res).

atribuirCasa(Jogada,Original,Coordenadas,Jogado) :-
	atribuiZ(Jogada,Original,Coordenadas,Jogado).

atribuiX(J,[0|T],[0,0,0],[J|T]).
atribuiX(J,[H|T],[X,0,0],[H|T2]) :-
	X \== 0, X1 is X - 1,
	atribuiX(J,T,[X1,0,0],T2).

atribuiY(J,[H|T],[X,0,0],[H2|T]) :-
	atribuiX(J,H,[X,0,0],H2).
atribuiY(J,[H|T],[X,Y,0],[H|T2]) :-
	Y \== 0, Y1 is Y - 1,
	atribuiY(J,T,[X,Y1,0],T2).

atribuiZ(J,[H|T],[X,Y,0],[H2|T]) :-
	atribuiY(J,H,[X,Y,0],H2).
atribuiZ(J,[H|T],[X,Y,Z],[H|T2]) :-
	Z \== 0, Z1 is Z - 1,
	atribuiZ(J,T,[X,Y,Z1],T2).

imprimeTabuleiro([D1, D2, D3, D4]) :-
	write('== Dimensão 1 =='), nl,
	imprimeDimensao(D1),
	write('== Dimensão 2 == '), nl,
	imprimeDimensao(D2),
	write('== Dimensão 3 == '), nl,
	imprimeDimensao(D3),
	write('== Dimensão 4 == '), nl,
	imprimeDimensao(D4).


imprimeDimensao([Linha1, Linha2, Linha3, Linha4]) :-
	write(' ---------------'),nl,
	write('|'),imprimeLinha(Linha1),nl,
	write(' ---------------'),nl,
	write('|'),imprimeLinha(Linha2),nl,
	write(' ---------------'),nl,
	write('|'),imprimeLinha(Linha3),nl,
	write(' ---------------'),nl,
	write('|'),imprimeLinha(Linha4),nl,
	write(' ---------------'),nl.

imprimeLinha([]).
imprimeLinha([0|L]) :-
	write('   |'),
	imprimeLinha(L).
imprimeLinha([1|L]) :-
	write(' X |'),
	imprimeLinha(L).
imprimeLinha([-1|L]) :-
	write(' O |'),
	imprimeLinha(L).

inverterPeca(1, -1).
inverterPeca(-1, 1).

nomePeca(1, 'Cruz').
nomePeca(-1, 'Bola').
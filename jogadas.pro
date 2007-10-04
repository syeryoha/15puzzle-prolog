geraJogadas([Linha1,Linha2,Linha3,Linha4],F1,F2,F3,F4) :-
	Linha1 = [X1,X2,X3,X4], Linha2 = [X5,X6,X7,X8],
	Linha3 = [X9,X10,X11,X12], Linha4 = [X13,X14,X15,X16],

/* Linha 1 */

	(X1 = 0 ->
	F1 = [],
	F2 = [[X2,0,X3,X4],Linha2,Linha3,Linha4],
	F3 = [],
	F4 = [[X5,X2,X3,X4],[0,X6,X7,X8],Linha3,Linha4];
	(X2 = 0 ->
	 F1 = [[0,X1,X3,X4],Linha2,Linha3,Linha4],
	 F2 = [[X1,X3,0,X4],Linha2,Linha3,Linha4],
	 F3 = [],
	 F4 = [[X1,X6,X3,X4],[X5,0,X7,X8],Linha3,Linha4];
	 (X3 = 0 ->
	  F1 = [[X1,0,X2,X4],Linha2,Linha3,Linha4],
	  F2 = [[X1,X2,X4,0],Linha2,Linha3,Linha4],
	  F3 = [],
	  F4 = [[X1,X2,X7,X4],[X5,X6,0,X8],Linha3,Linha4];
	  (X4 = 0 ->
	   F1 = [[X1,X2,0,X3],Linha2,Linha3,Linha4],
	   F2 = [],
	   F3 = [],
	   F4 = [[X1,X2,X3,X8],[X5,X6,X7,0],Linha3,Linha4];

/* Linha 2 */

	(X5 = 0 ->
	 F1 = [],
	 F2 = [Linha1,[X6,0,X7,X8],Linha3,Linha4],
	 F3 = [[0,X2,X3,X4],[X1,X6,X7,X8],Linha3,Linha4],
	 F4 = [Linha1,[X9,X6,X7,X8],[0,X10,X11,X12],Linha4];
	 (X6 = 0 ->
	  F1 = [Linha1,[0,X5,X7,X8],Linha3,Linha4],
	  F2 = [Linha1,[X5,X7,0,X8],Linha3,Linha4],
	  F3 = [[X1,0,X3,X4],[X5,X2,X7,X8],Linha3,Linha4],
	  F4 = [Linha1,[X5,X10,X7,X8],[X9,X6,X11,X12],Linha4];
	  (X7 = 0 ->
	   F1 = [Linha1,[X5,0,X6,X8],Linha3,Linha4],
	   F2 = [Linha1,[X5,X6,X8,0],Linha3,Linha4],
	   F3 = [[X1,X2,0,X4],[X5,X6,X3,X8],Linha3,Linha4],
	   F4 = [Linha1,[X5,X6,X11,X8],[X9,X10,0,X12],Linha4];
	   (X8 = 0 ->
	    F1 = [Linha1,[X5,X6,0,X7],Linha3,Linha4],
	    F2 = [],
	    F3 = [[X1,X2,X3,0],[X5,X6,X7,X4],Linha3,Linha4],
	    F4 = [Linha1,[X5,X6,X7,X12],[X9,X10,X11,0],Linha4];

/* Linha 3 */

	(X9 = 0 ->
	 F1 = [],
	 F2 = [Linha1,Linha2,[X10,0,X11,X12],Linha4],
	 F3 = [Linha1,[0,X6,X7,X8],[X5,X10,X11,X12],Linha4],
	 F4 = [Linha1,Linha2,[X13,X10,X11,X12],[0,X14,X15,X16]];
	 (X10 = 0 ->
	  F1 = [Linha1,Linha2,[0,X9,X11,X12],Linha4],
	  F2 = [Linha1,Linha2,[X9,X11,0,X12],Linha4],
	  F3 = [Linha1,[X5,0,X7,X8],[X9,X6,X11,X12],Linha4],
	  F4 = [Linha1,Linha2,[X9,X14,X11,X12],[X13,0,X15,X16]];
	  (X11 = 0 ->
	   F1 = [Linha1,Linha2,[X9,0,X10,X12],Linha4],
	   F2 = [Linha1,Linha2,[X9,X10,X12,0],Linha4],
	   F3 = [Linha1,[X5,X6,0,X8],[X9,X10,X7,X12],Linha4],
	   F4 = [Linha1,Linha2,[X9,X10,X15,X12],[X13,X14,0,X16]];
	   (X12 = 0 ->
	    F1 = [Linha1,Linha2,[X9,X10,0,X11],Linha4],
	    F2 = [],
	    F3 = [Linha1,[X5,X6,X7,0],[X9,X10,X11,X8],Linha4],
	    F4 = [Linha1,Linha2,[X9,X10,X11,X16],[X13,X14,X15,0]];

/* Linha 4 */

	(X13 = 0 ->
	 F1 = [],
	 F2 = [Linha1,Linha2,Linha3,[X14,0,X15,X16]],
	 F3 = [Linha1,Linha2,[0,X10,X11,X12],[X9,X14,X15,X16]],
	 F4 = [];
	 (X14 = 0 ->
	  F1 = [Linha1,Linha2,Linha3,[0,X13,X15,X16]],
	  F2 = [Linha1,Linha2,Linha3,[X13,X15,0,X16]],
	  F3 = [Linha1,Linha2,[X9,0,X11,X12],[X13,X10,X15,X16]],
	  F4 = [];
	  (X15 = 0 ->
	   F1 = [Linha1,Linha2,Linha3,[X13,0,X14,X16]],
	   F2 = [Linha1,Linha2,Linha3,[X13,X14,X16,0]],
	   F3 = [Linha1,Linha2,[X9,X10,0,X12],[X13,X14,X11,X16]],
	   F4 = [];
	   (X16 = 0 ->
	    F1 = [Linha1,Linha2,Linha3,[X13,X14,0,X15]],
	    F2 = [],
	    F3 = [Linha1,Linha2,[X9,X10,X11,0],[X13,X14,X15,X12]],
	    F4 = [])))) )))) )))) )))).

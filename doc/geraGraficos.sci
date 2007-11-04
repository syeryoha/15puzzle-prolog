// a* - manhattan
printf('a* - manhattan\n');
for i = 1:7

arquivo = strcat(['log-aestMan-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro:28: warning: singleton variables [Nlinha,NColuna] for valorLinha/5\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro compiled, 36 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/aestrela.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro:32: warning: singleton variables [CustoCaminho] for valor/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro:33: warning: singleton variables [Valor] for custoCaminho/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro:34: warning: singleton variables [CustoCaminho,Valor] for retornaTabuleiro/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro compiled, 34 lines read - %d bytes written, %d ms\n');
fscanf(saida,'warning: /var/tmp/rogervn/15puzzle-prolog/aestrela.pro:32: redefining procedure valor/2\n');
fscanf(saida,' /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:31: previous definition\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memAestMan(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoAestMan(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosAestMan(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosAestMan(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisAestMan(i) = nosAbertosAestMan(i) + nosFechadosAestMan(i);
file('close', saida);

end

// a* - posicao
printf('a* - posicao\n');
for i = 1:7

arquivo = strcat(['log-aestPos-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro:16: warning: singleton variables [N] for valorLinha/4\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro compiled, 22 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/aestrela.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro:32: warning: singleton variables [CustoCaminho] for valor/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro:33: warning: singleton variables [Valor] for custoCaminho/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro:34: warning: singleton variables [CustoCaminho,Valor] for retornaTabuleiro/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/aestrela.pro compiled, 34 lines read - %d bytes written, %d ms\n');
fscanf(saida,'warning: /var/tmp/rogervn/15puzzle-prolog/aestrela.pro:32: redefining procedure valor/2\n');
fscanf(saida,' /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:31: previous definition\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memAestPos(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoAestPos(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosAestPos(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosAestPos(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisAestPos(i) = nosAbertosAestPos(i) + nosFechadosAestPos(i);
file('close', saida);

end

// beam - manhattan (parte1)
printf('beam - manhattan (parte1)\n');
for i = 1:6

arquivo = strcat(['log-beamMan-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro:28: warning: singleton variables [Nlinha,NColuna] for valorLinha/5\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro compiled, 36 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/beam.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/beam.pro compiled, 18 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memBeamMan(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoBeamMan(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosBeamMan(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosBeamMan(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisBeamMan(i) = nosAbertosBeamMan(i) + nosFechadosBeamMan(i);
file('close', saida);

end

// beam - manhattan (parte2)
printf('beam - manhattan (parte2)\n');
for i = 1

arquivo = strcat(['log-beamMan-',string(21)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro:28: warning: singleton variables [Nlinha,NColuna] for valorLinha/5\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro compiled, 36 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/beam.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/beam.pro compiled, 18 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memBeamMan2(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoBeamMan2(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosBeamMan2(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosBeamMan2(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisBeamMan2(i) = nosAbertosBeamMan2(i) + nosFechadosBeamMan2(i);
file('close', saida);

end

// beam - pos (parte1)
printf('beam - pos (parte1)\n');
for i = 1:3

arquivo = strcat(['log-beamPos-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro:16: warning: singleton variables [N] for valorLinha/4\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro compiled, 22 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/beam.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/beam.pro compiled, 18 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memBeamPos(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoBeamPos(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosBeamPos(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosBeamPos(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisBeamPos(i) = nosAbertosBeamPos(i) + nosFechadosBeamPos(i);
file('close', saida);

end

// beam - pos (parte2)
printf('beam - pos (parte2)\n');
for i = 1:2

arquivo = strcat(['log-beamPos-',string((i-1)*3 + 18)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro:16: warning: singleton variables [N] for valorLinha/4\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro compiled, 22 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/beam.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/beam.pro compiled, 18 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memBeamPos2(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoBeamPos2(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosBeamPos2(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosBeamPos2(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisBeamPos2(i) = nosAbertosBeamPos2(i) + nosFechadosBeamPos2(i);
file('close', saida);

end

// escalada - pos
printf('escalada - pos\n');
for i = 1:3

arquivo = strcat(['log-escPos-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro:16: warning: singleton variables [N] for valorLinha/4\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro compiled, 22 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/escalada.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/escalada.pro compiled, 13 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memEscPos(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoEscPos(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosEscPos(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosEscPos(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisEscPos(i) = nosAbertosEscPos(i) + nosFechadosEscPos(i);
file('close', saida);

end

// escalada - manhattan
printf('escalada - manhattan\n');
for i = 1:3

arquivo = strcat(['log-escfMan-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro:28: warning: singleton variables [Nlinha,NColuna] for valorLinha/5\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro compiled, 36 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/escalada.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/escalada.pro compiled, 13 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memEscMan(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoEscMan(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosEscMan(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosEscMan(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisEscMan(i) = nosAbertosEscMan(i) + nosFechadosEscMan(i);

file('close', saida);

end

// gradiente - manhattan
printf('gradiente - manhattan\n');
for i = 1:6

arquivo = strcat(['log-gradMan-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro:28: warning: singleton variables [Nlinha,NColuna] for valorLinha/5\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro compiled, 36 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/gradiente.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/gradiente.pro compiled, 13 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memGradMan(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoGradMan(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosGradMan(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosGradMan(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisGradMan(i) = nosAbertosGradMan(i) + nosFechadosGradMan(i);
file('close', saida);

end

// gradiente - pos
printf('gradiente - pos\n');
for i = 1:3

arquivo = strcat(['log-gradPos-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro:16: warning: singleton variables [N] for valorLinha/4\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro compiled, 22 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/gradiente.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/gradiente.pro compiled, 13 lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memGradPos(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoGradPos(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosGradPos(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosGradPos(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisGradPos(i) = nosAbertosGradPos(i) + nosFechadosGradPos(i);
file('close', saida);

end

// ida* - manhattan
printf('ida* - manhattan\n');
for i = 1:7

arquivo = strcat(['log-idaMan-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro:28: warning: singleton variables [Nlinha,NColuna] for valorLinha/5\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro compiled, 36 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/idaestrela.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:96: warning: singleton variables [CustoCaminho] for soma/3\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:106: warning: singleton variables [Criterio] for assassino/5\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:136: warning: singleton variables [CustoCaminho] for valor/2\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:137: warning: singleton variables [Valor] for custoCaminho/2\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:138: warning: singleton variables [CustoCaminho,Valor] for retornaTabuleiro/2\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro compiled, 138 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'warning: /var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:136: redefining procedure valor/2\n');
fscanf(saida, ' /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:31: previous definition\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memIdaMan(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoIdaMan(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosIdaMan(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosIdaMan(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisIdaMan(i) = nosAbertosIdaMan(i) + nosFechadosIdaMan(i);
file('close', saida);

end

// ida* - posicao
printf('ida* - posicao\n');
for i = 1:7

arquivo = strcat(['log-idaPos-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro:16: warning: singleton variables [N] for valorLinha/4\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/heuristicaPosicao.pro compiled, 22 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/idaestrela.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:96: warning: singleton variables [CustoCaminho] for soma/3\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:106: warning: singleton variables [Criterio] for assassino/5\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:136: warning: singleton variables [CustoCaminho] for valor/2\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:137: warning: singleton variables [Valor] for custoCaminho/2\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:138: warning: singleton variables [CustoCaminho,Valor] for retornaTabuleiro/2\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/idaestrela.pro compiled, 138 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'warning: /var/tmp/rogervn/15puzzle-prolog/idaestrela.pro:136: redefining procedure valor/2\n');
fscanf(saida, ' /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:31: previous definition\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memIdaPos(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoIdaPos(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosIdaPos(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosIdaPos(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisIdaPos(i) = nosAbertosIdaPos(i) + nosFechadosIdaPos(i);
file('close', saida);

end

// largura
printf('largura\n');
for i = 1:3

arquivo = strcat(['log-largMan-',string((i-1)*3)]);
saida = file('open', arquivo, 'old');

fscanf(saida,'GNU Prolog 1.3.0\n');
fscanf(saida,'By Daniel Diaz\n');
fscanf(saida,'Copyright (C) 1999-2007 Daniel Diaz\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:115: warning: singleton variables [Elemento] for naoEstaEm/2\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro:172-181: warning: singleton variables [Valor] for imprimeTabuleiro/1\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/quebraCabeca.pro compiled, 306 lines read - %d bytes written, %d ms\n');
fscanf(saida,'compiling /var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro for byte code...\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro:28: warning: singleton variables [Nlinha,NColuna] for valorLinha/5\n');
fscanf(saida,'/var/tmp/rogervn/15puzzle-prolog/heuristicaManhattan.pro compiled, 36 lines read - %d bytes written, %d ms\n');
fscanf(saida, 'compiling /var/tmp/rogervn/15puzzle-prolog/largura.pro for byte code...\n');
fscanf(saida, '/var/tmp/rogervn/15puzzle-prolog/largura.pro compiled, %d lines read - %d bytes written, %d ms\n');
fscanf(saida,'Stacks size in use free\n');
fscanf(saida,'\n');
[tmp, tmp, tmp] = fscanf(saida,' trail stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' cstr stack %f Kb %f Kb %f Kb\n');
[tmp, memLarg(i), tmp] = fscanf(saida,' global stack %f Kb %f Kb %f Kb\n');
[tmp, tmp, tmp] = fscanf(saida,' local stack %f Kb %f Kb %f Kb\n');
fscanf(saida,'\n');
fscanf(saida,'Times since start since last\n');
fscanf(saida,'\n');
[tempoLarg(i), tmp] = fscanf(saida,' user time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' system time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' cpu time %f sec %f sec\n');
[tmp, tmp] = fscanf(saida,' real time %f sec %f sec\n');
nosFechadosLarg(i) = fscanf(saida,'Número de elementos na lista de nós fechados: %d\n');
nosAbertosLarg(i) = fscanf(saida,'Número de elementos na lista de nós abertos: %d\n');
nosTotaisLarg(i) = nosAbertosLarg(i) + nosFechadosLarg(i);

file('close', saida);

end


nMovimentosAestMan = [1, 3, 6, 9, 12, 15, 18];
nMovimentosAestPos = [1, 3, 6, 9, 12, 15, 18];
nMovimentosBeamMan = [1, 3, 6, 9, 12, 15];
nMovimentosBeamMan2 = [21];
nMovimentosBeamPos = [1, 3, 6];
nMovimentosBeamPos2 = [18, 21];
nMovimentosEscPos = [1, 3, 6];
nMovimentosEscMan = [1, 3, 6];
nMovimentosGradMan = [1, 3, 6, 9, 12, 15];
nMovimentosGradPos = [1, 3, 6];
nMovimentosIdaMan = [1, 3, 6, 9, 12, 15, 18];
nMovimentosIdaPos = [1, 3, 6, 9, 12, 15, 18];
nMovimentosLarg = [1, 3, 6];

scf(0);
xtitle('Tempo (Manhattan)','Número de Movimentos', 'Tempo');
plot2d(nMovimentosAestMan, tempoAestMan);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamMan, tempoBeamMan);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamMan2, tempoBeamMan2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscMan, tempoEscMan);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradMan, tempoGradMan);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaMan, tempoIdaMan);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, tempoLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
limit = axes.data_bounds;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(1);
xtitle('Tempo (Posição)','Número de Movimentos', 'Tempo');
plot2d(nMovimentosAestPos, tempoAestPos);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamPos, tempoBeamPos);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamPos2, tempoBeamPos2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscPos, tempoEscPos);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradPos, tempoGradPos);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaPos, tempoIdaPos);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, tempoLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
axes.data_bounds = limit;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(2);
xtitle('Memória (Manhattan)','Número de Movimentos', 'Memória');
plot2d(nMovimentosAestMan, memAestMan);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamMan, memBeamMan);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamMan2, memBeamMan2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscMan, memEscMan);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradMan, memGradMan);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaMan, memIdaMan);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, memLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
limit = axes.data_bounds;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(3);
xtitle('Memória (Posição)','Número de Movimentos', 'Memória');
plot2d(nMovimentosAestPos, memAestPos);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamPos, memBeamPos);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamPos2, memBeamPos2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscPos, memEscPos);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradPos, memGradPos);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaPos, memIdaPos);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, memLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
axes.data_bounds = limit;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(4);
xtitle('Lista de Nós Abertos (Manhattan)','Número de Movimentos', 'Lista de Nós Abertos');
plot2d(nMovimentosAestMan, nosAbertosAestMan);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamMan, nosAbertosBeamMan);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamMan2, nosAbertosBeamMan2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscMan, nosAbertosEscMan);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradMan, nosAbertosGradMan);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaMan, nosAbertosIdaMan);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, nosAbertosLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
limit = axes.data_bounds;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(5);
xtitle('Lista de Nós Abertos (Posição)','Número de Movimentos', 'Lista de Nós Abertos');
plot2d(nMovimentosAestPos, nosAbertosAestPos);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamPos, nosAbertosBeamPos);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamPos2, nosAbertosBeamPos2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscPos, nosAbertosEscPos);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradPos, nosAbertosGradPos);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaPos, nosAbertosIdaPos);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, nosAbertosLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
axes.data_bounds = limit;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(6);
xtitle('Lista de Nós Fechados (Manhattan)','Número de Movimentos', 'Lista de Nós Fechados');
plot2d(nMovimentosAestMan, nosFechadosAestMan);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamMan, nosFechadosBeamMan);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamMan2, nosFechadosBeamMan2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscMan, nosFechadosEscMan);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradMan, nosFechadosGradMan);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaMan, nosFechadosIdaMan);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, nosFechadosLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
limit = axes.data_bounds;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(7);
xtitle('Lista de Nós Fechados (Posição)','Número de Movimentos', 'Lista de Nós Fechados');
plot2d(nMovimentosAestPos, nosFechadosAestPos);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamPos, nosFechadosBeamPos);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamPos2, nosFechadosBeamPos2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscPos, nosFechadosEscPos);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradPos, nosFechadosGradPos);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaPos, nosFechadosIdaPos);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, nosFechadosLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
axes.data_bounds = limit;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(8);
xtitle('Total de Nós Utilizados (Manhattan)','Número de Movimentos', 'Número de Nós');
plot2d(nMovimentosAestMan, nosTotaisAestMan);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamMan, nosTotaisBeamMan);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamMan2, nosTotaisBeamMan2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscMan, nosTotaisEscMan);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradMan, nosTotaisGradMan);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaMan, nosTotaisIdaMan);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, nosTotaisLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
limit = axes.data_bounds;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);

scf(9);
xtitle('Total de Nós Utilizados (Posição)','Número de Movimentos', 'Número de Nós');
plot2d(nMovimentosAestPos, nosTotaisAestPos);
p = get("hdl");
graf = p.children;
graf.foreground = 1;
graf.mark_mode = "on";
graf.mark_style = 5;
plot2d(nMovimentosBeamPos, nosTotaisBeamPos);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosBeamPos2, nosTotaisBeamPos2);
p = get("hdl");
graf = p.children;
graf.foreground = 2;
graf.mark_mode = "on";
graf.mark_style = 2;
plot2d(nMovimentosEscPos, nosTotaisEscPos);
p = get("hdl");
graf = p.children;
graf.foreground = 3;
graf.mark_mode = "on";
graf.mark_style = 3;
plot2d(nMovimentosGradPos, nosTotaisGradPos);
p = get("hdl");
graf = p.children;
graf.foreground = 4;
graf.mark_mode = "on";
graf.mark_style = 4;
plot2d(nMovimentosIdaPos, nosTotaisIdaPos);
p = get("hdl");
graf = p.children;
graf.foreground = 5;
graf.mark_mode = "on";
graf.mark_style = 1;
plot2d(nMovimentosLarg, nosTotaisLarg);
p = get("hdl");
graf = p.children;
graf.foreground = 6;
graf.mark_mode = "on";
graf.mark_style = 6;

p = get("hdl");
axes = p.parent;
axes.data_bounds = limit;
legend('A*','Beam','Beam (Parte 2)', 'Escalada','Gradiente','IDA*','Largura',2);
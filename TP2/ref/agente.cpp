#include "agente.h"
#include "tabuleiroWidget.h"
#include <limits.h>
#include <iostream>

using namespace std;

Agente::Agente(int maxProfundidade, QWidget *dono)
//   :m_thread(this)
{
   m_maxProfundidade = maxProfundidade;
/*   m_cor = cor;
   m_outraCor = (cor == PRETO) ? BRANCO : PRETO;
*/
   m_cor = PRETO;
   m_outraCor = BRANCO;

   m_dificuldade = MEDIO;

   // Pesos
   pMobilidade = 6;
   pCasaC = -3;
   pCasaX = -8;
   pCasaCentral = 6;
   pPosicoesEstaveis = 9;
   pPecas = -3; // No início vou minimizar o número de peças

   m_pensando = false;

   m_dono = dono;
}

bool Agente::pensando()
{
   return m_pensando;
}

void Agente::joga(TabuleiroReversi *tabuleiro)
{
/*   int linha, coluna;
   
   valorMax(tabuleiro, &linha, &coluna, INT_MIN, INT_MAX);

   tabuleiro->executaJogada(linha, coluna, m_cor);
   cout<<"Joguei em "<<linha<<" "<<coluna<<endl;
*/

   m_tabuleiroInicial = tabuleiro;

   this->start();

}

void Agente::run()
{
   int linha, coluna;

   m_pensando = true;

   do
   {
      valorMax(m_tabuleiroInicial, &linha, &coluna, INT_MIN, INT_MAX);

      m_tabuleiroInicial->executaJogada(linha, coluna, m_cor);
      // cout<<"Joguei em "<<linha<<" "<<coluna<<endl;

//   ((TabuleiroWidget *)m_dono)->update();
      m_dono->update();
   } while( ((TabuleiroWidget *)m_dono)->quemJoga() );

   m_pensando = false;
}

int Agente::valorMax(TabuleiroReversi *tabuleiro, int *linha, int *coluna, int alpha, int beta, int profundidade)
{
   int valor = INT_MIN;
   vector<TabuleiroReversi> sucessor;
   vector<Jogada> jogada;
   int min;
   bool nJoguei = false;

   profundidade++;

   if (profundidade >= m_maxProfundidade)
      return aval(tabuleiro);

   if (profundidade == 1)
   {
      sucessores(tabuleiro, &sucessor, &jogada, m_cor);
   }
   else
      sucessores(tabuleiro, &sucessor, m_cor);

   if (sucessor.size() == 0)
   {
      // Não posso jogar nessa situação. Será que acabou o jogo?
      if (tabuleiro->numeroJogadas(m_outraCor) == 0)
	 return aval(tabuleiro);
      else
	 nJoguei = true;
   }

   for(unsigned int i = 0; i < sucessor.size() || nJoguei; i++)
   {
//      valor = max(valor, valorMin(sucessor[i], alpha, beta));
      
      if(nJoguei)
      {
	 min = valorMin(tabuleiro, linha, coluna, alpha, beta, profundidade);
      }
      else
	 min = valorMin(&sucessor.at(i), linha, coluna, alpha, beta, profundidade);

      if (valor < min)
      {
	 valor = min;
	 if (!nJoguei)
	 {
	    if (profundidade == 1)
	    {
	       *linha = jogada.at(i).linha();
	       *coluna = jogada.at(i).coluna();
	    }
	 }
      }

      if (valor >= beta)
      {
	 //liberaSucessores(sucessor, jogada, nSucessores);
	 return valor;
      }

//      alpha = max(alpha, valor);
      alpha = (alpha > valor) ? alpha : valor;

      nJoguei = false;
   }

   //liberaSucessores(sucessor, jogada, nSucessores);
   return valor;
}

int Agente::valorMin(TabuleiroReversi *tabuleiro, int *linha, int *coluna, int alpha, int beta, int profundidade)
{
   int valor = INT_MAX;
   vector<TabuleiroReversi> sucessor;
   vector<Jogada> jogada;
   int max;
   bool nJoguei = false;

   profundidade++;

   if (profundidade >= m_maxProfundidade)
      return aval(tabuleiro);

   sucessores(tabuleiro, &sucessor, m_outraCor);

   if (sucessor.size() == 0)
   {
      // Não posso jogar nessa situação. Será que acabou o jogo?
      if (tabuleiro->numeroJogadas(m_cor) == 0)
	 return aval(tabuleiro);
      else
	 nJoguei = true;
   }

   for(unsigned int i = 0; i < sucessor.size() || nJoguei; i++)
   {
//      valor = max(valor, valorMin(sucessor[i], alpha, beta));

      if(nJoguei)
      {
	 max = valorMax(tabuleiro, linha, coluna, alpha, beta, profundidade);
      }
      else
	 max = valorMax(&sucessor.at(i), linha, coluna, alpha, beta, profundidade);

      if (valor > max)
      {
	 valor = max;
      }

      if (valor <= alpha)
      {
//	 liberaSucessores(sucessor, nSucessores);
	 return valor;
      }

//      beta = min(beta, valor);
      beta = (beta < valor) ? beta : valor;

      nJoguei = false;
   }

   // liberaSucessores(sucessor, nSucessores);
   return valor;
}

void Agente::sucessores(TabuleiroReversi *tabuleiro, vector<TabuleiroReversi> *sucessor, int cor)
{
   sucessores(tabuleiro, sucessor, NULL, cor);
}

void Agente::sucessores(TabuleiroReversi *tabuleiro, vector<TabuleiroReversi> *sucessor, vector<Jogada> *jogada, int cor)
{
   TabuleiroReversi *novo;
   Jogada joga;

   // Vamos percorrer o tabuleiro, procurando por jogadas válidas
   for(int i = 0; i < tabuleiro->tamanho(); i++)
   {
      for(int j = 0; j < tabuleiro->tamanho(); j++)
      {
	 if (tabuleiro->jogadaValida(i, j, cor))
	 {
	    novo = new TabuleiroReversi(*tabuleiro);
	    novo->executaJogada(i, j, cor);
	    joga.colocaLinha(i);
	    joga.colocaColuna(j);

	    sucessor->push_back(*novo);
	    if (jogada != NULL)
	       jogada->push_back(joga);
	    delete novo;
	 }
      }
   }
}

int Agente::aval(TabuleiroReversi *tabuleiro)
{
   int valor = 0;
   int posicoesC[8][2] = {{0,1},{1,0},{6,0},{7,1},{0,6},{1,7},{6,7},{7,6}};
   int posicoesX[4][2] = {{1,1},{6,1},{1,6},{6,6}};
   int posicoesCentro[16][2] = {{2,2}, {2,3}, {2,4}, {2,5},
				{3,2}, {3,3}, {3,4}, {3,5},
				{4,2}, {4,3}, {4,4}, {4,5},
				{5,2}, {5,3}, {5,4}, {5,5}};
   int nPecas = tabuleiro->numPretas() + tabuleiro->numBrancas();
   int tempPCasaCentral = 0;
   int tempPPecas = 0;

   // Numero de peças
   int minhaPecas;
   int outroPecas;

   // Mobilidades
   int minhaMobilidade = 0;
   int outroMobilidade = 0;

   // Casas especiais
   int minhaCasaX = 0;
   int outroCasaX = 0;
   int minhaCasaC = 0;
   int outroCasaC = 0;

   // Posições Estáveis
   int minhaEstavel = 0;
   int outroEstavel = 0;

   // Casas centrais
   int minhaCasaCentral = 0;
   int outroCasaCentral = 0;

   if (m_dificuldade == FACIL)
   {
      valor += tabuleiro->numPretas();
      valor -= tabuleiro->numBrancas();
   }
   else if (m_dificuldade == MEDIO)
   {
      // Vamos verificar a mobilidade no tabuleiro
      minhaMobilidade = tabuleiro->numeroJogadas(m_cor);
      outroMobilidade = tabuleiro->numeroJogadas(m_outraCor);

      // Vamos checar as casas especiais do reversi (C, X e centrais)
      for(int i = 0; i < 8; i++)
      {
	 if (tabuleiro->peca(posicoesC[i][0], posicoesC[i][1]) == m_cor)
	    minhaCasaC++;
	 else if (tabuleiro->peca(posicoesC[i][0], posicoesC[i][1]) == m_outraCor)
	    outroCasaC++;
      }
      for(int i = 0; i < 4; i++)
      {
	 if (tabuleiro->peca(posicoesX[i][0], posicoesX[i][1]) == m_cor)
	    minhaCasaX++;
	 else if (tabuleiro->peca(posicoesX[i][0], posicoesX[i][1]) == m_outraCor)
	    outroCasaX++;
      }
      for(int i = 0; i < 16; i++)
      {
	 if (tabuleiro->peca(posicoesCentro[i][0], posicoesCentro[i][1]) == m_cor)
	    minhaCasaCentral++;
	 else if (tabuleiro->peca(posicoesCentro[i][0], posicoesCentro[i][1]) == m_outraCor)
	    outroCasaCentral++;
      }

      // Vamos verificar as posições estáveis
      minhaEstavel = tabuleiro->numPosicoesEstaveis(m_cor);
      outroEstavel = tabuleiro->numPosicoesEstaveis(m_outraCor);

      // Vamos contar o número de peças
      minhaPecas = tabuleiro->num(m_cor);
      outroPecas = tabuleiro->num(m_outraCor);

      // Os pesos podem variar, se estivermos no início, meio ou fim do jogo
      if(nPecas > 48)
	 tempPPecas = -pPecas;
      else
	 tempPPecas = pPecas;

      if(nPecas > 14)
      	 tempPCasaCentral = 0;
      else
	 tempPCasaCentral = pCasaCentral;

      valor = tempPPecas*(minhaPecas - outroPecas) +
	 pMobilidade*(minhaMobilidade - outroMobilidade) +
	 pCasaC*(minhaCasaC - outroCasaC) +
	 pCasaX*(minhaCasaX - outroCasaX) +
	 pPosicoesEstaveis*(minhaEstavel - outroEstavel) + 
	 tempPCasaCentral *(minhaCasaCentral - outroCasaCentral);
   }

   return valor;
}

int Agente::cor()
{
   return m_cor;
}

void Agente::mudaCor(int cor)
{
   m_cor = cor;
   m_outraCor = (cor == PRETO) ? BRANCO : PRETO;
}

void Agente::mudaDificuldade(int dificuldade)
{
   m_dificuldade = dificuldade;
}

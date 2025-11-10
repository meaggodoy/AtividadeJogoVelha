programa
{
	caracter jogoVelha[3][3]
	
	funcao limparJogo() {
		para (inteiro i = 0; i < 3; i++) {
			para (inteiro j = 0; j < 3; j++) {
				jogoVelha[i][j] = ' '
			}
		}
	}

	funcao inteiro validarJogada(caracter jogada) {
		se (jogada == 'X' ou jogada == 'O') {
			retorne 1
		} senao {
			retorne 0
		}
	}

	funcao inteiro validarPosicao(inteiro x, inteiro y) {
		se (x >= 0 e x < 3) {
			se (y >= 0 e y < 3) {
				retorne 1
			}
		}
		retorne 0
	}

	funcao inteiro validarVazio(inteiro x, inteiro y) {
		se (jogoVelha[x][y] != 'X' e jogoVelha[x][y] != 'O') {
			retorne 1
		}
		retorne 0
	}

	funcao inteiro ganhouLinha() {
		inteiro igual = 1
		
		para (inteiro i = 0; i < 3; i++) {
			para (inteiro j = 0; j < 2; j++) {
				se (validarJogada(jogoVelha[i][j]) == 1 e jogoVelha[i][j] == jogoVelha[i][j+1]) {
					igual++
				}
			}
			
			se (igual == 3) {
				retorne 1
			}
			igual = 1
		}
		retorne 0
	}

	funcao inteiro ganhouColuna() {
		inteiro igual = 1
		
		para (inteiro i = 0; i < 3; i++) {
			para (inteiro j = 0; j < 2; j++) {
				se (validarJogada(jogoVelha[j][i]) == 1 e jogoVelha[j][i] == jogoVelha[j+1][i]) {
					igual++
				}
			}

			se (igual == 3) {
				retorne 1
			}
			igual = 1
		}
		retorne 0
	}

	funcao inteiro ganhouDiagPrincipal() {
		inteiro igual = 1
		
		para (inteiro i = 0; i < 2; i++) {
			se (validarJogada(jogoVelha[i][i]) == 1 e jogoVelha[i][i] == jogoVelha[i+1][i+1]) {
				igual++
			}
		}

		se (igual == 3) {
			retorne 1
		} senao {
			retorne 0
		}
	}

	funcao inteiro ganhouDiagSecundaria() {
		inteiro igual = 1
		
		para (inteiro i = 0; i < 2; i++) {
			se (validarJogada(jogoVelha[i][3-i-1]) == 1 e jogoVelha[i][3-i-1] == jogoVelha[i+1][3-i-2]) {
				igual++
			}
		}
		
		se (igual == 3) {
			retorne 1
		} senao {
			retorne 0
		}
	}

	funcao jogo() {
		escreva("  0   1   2\n")
		
		para (inteiro i = 0; i < 3; i++) {
			escreva(i)
			para (inteiro j = 0; j < 3; j++) {
				se (validarJogada(jogoVelha[i][j]) == 1) {
					se (j < 2) {
						escreva(" ", jogoVelha[i][j], " |")
					} senao {
						escreva(" ", jogoVelha[i][j], " ")
					}
				} senao {
					se (j < 2) {
						escreva("   |")
					} senao {
						escreva("   ")	
					}
				}
			}
			escreva("\n  ----------\n")
		}
	}

	funcao jogar() {
		inteiro l, c, valida, ordem = 1, ganhou = 0, jogadas = 0

		faca {
			faca {
				jogo()
				
				escreva("Digite a linha da jogada: ")
				leia(l)
				escreva("Digite a coluna da jogada: ")
				leia(c)
	
				valida = validarPosicao(l, c)
	
				se(valida == 1) {
					valida += validarVazio(l, c)

					se (validarVazio(l, c) == 0) {
						escreva("Posição ocupada, digite novamente\n")
					}
				}
			} enquanto (valida != 2)
			
			se (ordem == 1) {
				jogoVelha[l][c] = 'X'
			} senao {
				jogoVelha[l][c] = 'O'
			}

			jogadas++
			ordem++
			
			se (ordem == 3) {
				ordem = 1
			}

			se (ganhouLinha() == 1 ou ganhouColuna() == 1 ou ganhouDiagPrincipal() == 1 ou ganhouDiagSecundaria() == 1) {
    				ganhou = 1
    				jogo()
			}
		} enquanto (ganhou == 0 e jogadas < 9)

		se (ganhou != 0) {
			escreva("\nVocê venceu!")
		} senao {
			escreva("\nNinguém venceu")
		}
	}
	
	funcao inicio()
	{
		inteiro opcao

		faca {
			limparJogo()
			jogar()

			escreva("\nDeseja jogar novamente?\n1 - Sim | 2 - Não ")
			leia(opcao)
		} enquanto (opcao == 1)
		
		escreva("Até mais!")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3007; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {jogoVelha, 3, 11, 9}-{ganhou, 130, 35, 6}-{jogadas, 130, 47, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
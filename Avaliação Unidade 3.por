programa
{
	inclua biblioteca Tipos --> tp
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> tx
	
	funcao inicio()
	{
		/*Número máximo da lista de cadastro*/
		const inteiro NUMERO_MAX_CADASTRO = 5
		/*Variáveis entrada para cadastro de dados*/
		inteiro respostaTemporaria = 0
		inteiro codCidades[NUMERO_MAX_CADASTRO]
		inteiro numeroVeiculos[NUMERO_MAX_CADASTRO] 
		inteiro numeroAcidentes [NUMERO_MAX_CADASTRO]
		cadeia respostaContinuar = "S"
		/*Número de cadastros realizados*/
		inteiro numeroCadastros = 0
		/*verificador de condição de repetição*/
		logico verificadorRepeticao = verdadeiro
		logico verificadorRepeticaoSN = verdadeiro
		logico verificadorErroDigitacao = verdadeiro
		/*Variáveis de análise do programa*/
		real mediaDeVeiculos = 0.0
		real mediaDeAcidentesComMenosDe2000Veiculos = 0.0
		inteiro menorIndiceDeAcidentes
		inteiro maiorIndiceDeAcidentes
		inteiro contadorCidadesComMaisDe2000Veiculos = 0
		/*Contador para que o usuário não cadastre dados além da capacidade dos vetores*/
		inteiro indiceVetorCadastros = 0

		
		cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
		faca{
			
			escreva("\nDESEJA INICIAR O CADASTRAMENTO DE DADOS? [DIGITE S PARA SIM E N PARA NAO]: ")
			respostaContinuar = leitorContinuar()
			verificadorErroDigitacao = verificarErroDigitacao(respostaContinuar, numeroCadastros, NUMERO_MAX_CADASTRO)
			verificadorRepeticaoSN = ValidarSN(respostaContinuar, numeroCadastros, NUMERO_MAX_CADASTRO)
		}enquanto(verificadorRepeticaoSN == verdadeiro)
		faca{
			limpa()
			cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
			faca{
				escreva("\nPOR FAVOR, INFORME O CÓDIGO NUMÉRICO DA CIDADE: ")
				respostaTemporaria = leitorResposta()
				verificadorRepeticao = validarRespostaCodCidade(respostaTemporaria, numeroCadastros, NUMERO_MAX_CADASTRO)
				se(verificadorRepeticao == verdadeiro){
					se(validarRepeticao(codCidades, NUMERO_MAX_CADASTRO, respostaTemporaria) == falso){
						limpa()
						cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
						escreva("\nATENÇÃO: ESTA CIDADE JÁ FOI CADASTRADA EM NOSSO BANCO DE DADOS! NÃO É POSSÍVEL HAVER DOIS CADASTROS DA MESMA CIDADE.")
						verificadorRepeticao = falso
					}
				}
			}enquanto(verificadorRepeticao == falso)
			
			codCidades[indiceVetorCadastros] = respostaTemporaria
		//Recebimento do número de veículos registrados na cidade pelo usuário e valida regras de negócio (número igual ou maior que zero)
			limpa()
			cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
			faca{

				escreva("\nPOR FAVOR, INFORME O NÚMERO DE VEÍCULOS DE PASSEIO REGISTRADOS NESTA CIDADE: ")
				respostaTemporaria = leitorResposta()
				verificadorRepeticao = validarResposta(respostaTemporaria, numeroCadastros, NUMERO_MAX_CADASTRO)
				} enquanto (verificadorRepeticao == falso)
				numeroVeiculos[indiceVetorCadastros] = respostaTemporaria
		//Recebimento do número de acidentes de trânsito registrados na cidade pelo usuário e valida regras de negócio (número igual ou maior que zero)
			limpa()
			cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
			faca{
				escreva("\nPOR FAVOR, INFORME O NÚMERO DE ACIDENTES DE TRÂNSITO REGISTRADOS NESTA CIDADE: ")
				respostaTemporaria = leitorResposta()
				verificadorRepeticao = validarResposta(respostaTemporaria, numeroCadastros, NUMERO_MAX_CADASTRO)
				} enquanto (verificadorRepeticao == falso)
				numeroAcidentes[indiceVetorCadastros] = respostaTemporaria
		
			numeroCadastros++
			indiceVetorCadastros++
			
			se(numeroCadastros >= NUMERO_MAX_CADASTRO){
				limpa()
				cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
				escreva("\nO NÚMERO DE CADASTROS JÁ CHEGOU AO LIMITE. O RESULTADO DA ANÁLISE SE ENCONTRA LOGO ABAIXO:")
				verificadorRepeticaoSN = verdadeiro
			}senao{	
				faca{
					limpa()
					cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
					escreva("\nDESEJA REALIZAR UM NOVO CADASTRO? [DIGITE S PARA SIM E N PARA NÃO]: ")
					respostaContinuar = leitorContinuar()
					verificadorErroDigitacao = verificarErroDigitacao(respostaContinuar, numeroCadastros, NUMERO_MAX_CADASTRO)
				} enquanto(verificadorErroDigitacao == falso)
				verificadorRepeticaoSN = ValidarSN(respostaContinuar, numeroCadastros, NUMERO_MAX_CADASTRO)
			}
			
		}enquanto(verificadorRepeticaoSN == falso)
	escreva("\nRESULTADO DA ANÁLISE: \n")
	desenharLinha()
	escreva("\nCIDADES CADASTRADAS NO BANCO DE DADOS:\n")
	mostrarTodosOsCadastros(codCidades,numeroAcidentes,numeroVeiculos,NUMERO_MAX_CADASTRO)
	escreva("\n")
	mediaDeVeiculos = calcularMediaDeVeiculos(numeroVeiculos, NUMERO_MAX_CADASTRO, numeroCadastros)
	desenharLinha()
	escreva("\nA MEDIA DE VEÍCULOS EM TODAS AS "+ numeroCadastros + " CIDADES CADASTRADAS É IGUAL A: " + mediaDeVeiculos + ".\n")
	desenharLinha()
	escreva("\nCIDADE(S) COM O MENOR ÍNDICE DE ACIDENTES DE TRÂNSITO: ")
	menorIndiceDeAcidentes = descobrirMenorIndiceDeAcidentes(codCidades, numeroAcidentes, NUMERO_MAX_CADASTRO)
	mostrarCidadesComMenorIndiceDeAcidentes(codCidades,numeroAcidentes, menorIndiceDeAcidentes, NUMERO_MAX_CADASTRO)
	desenharLinha()
	escreva("\nCIDADE(S) COM O MAIOR ÍNDICE DE ACIDENTES DE TRÂNSITO: ")
	maiorIndiceDeAcidentes = descobrirMaiorIndiceDeAcidentes(numeroAcidentes, NUMERO_MAX_CADASTRO)
	mostrarCidadesComMaiorIndiceDeAcidentes(codCidades,numeroAcidentes, maiorIndiceDeAcidentes, NUMERO_MAX_CADASTRO)
	desenharLinha()
	contadorCidadesComMaisDe2000Veiculos = mostrarNumeroDeCidadesComMaisDe2000Veiculos(codCidades,numeroVeiculos,NUMERO_MAX_CADASTRO)
	escreva("\nFORAM REGISTRADAS " + contadorCidadesComMaisDe2000Veiculos +" CIDADES COM MENOS DE 2000 VEÍCULOS REGISTRADOS") 
	mediaDeAcidentesComMenosDe2000Veiculos = mediaDeAcidentesEmCidadesComMenosDe2000Veiculos(codCidades,numeroVeiculos,NUMERO_MAX_CADASTRO)
	escreva("\nA MEDIA DE ACIDENTES REGISTRADOS NESSAS CIDADES É IGUAL A: "+ mediaDeAcidentesComMenosDe2000Veiculos +"\n")
	desenharLinha()
	}
	
	/*funções relacionadas à entrada de dados do usuário*/ 
	funcao inteiro leitorResposta(){
		inteiro respostaTemporaria = 0
		leia(respostaTemporaria)
		retorne respostaTemporaria
	}
	funcao cadeia leitorContinuar(){
		cadeia respostaContinuar
		leia(respostaContinuar)
		respostaContinuar = tx.caixa_alta(respostaContinuar)
		retorne respostaContinuar
	}
	/*funcções relacionadas ao tratamento e validação das informações de entrada do usuário*/
	funcao logico validarResposta(inteiro respostaTemporaria, inteiro numeroCadastros, inteiro NUMERO_MAX_CADASTRO){
		logico verificacao
		
		verificacao = verdadeiro
		se(respostaTemporaria < 0){
			verificacao = falso
			limpa()
			cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
			escreva("\nATENÇÃO: NÃO É POSSÍVEL PREENCHER ESTE CAMPO COM UM NÚMERO INFERIOR A ZERO.")
			retorne verificacao
		} senao {
			verificacao = verdadeiro
			retorne verificacao
		}
			
	}
	funcao logico validarRespostaCodCidade(inteiro respostaTemporaria, inteiro numeroCadastros, inteiro NUMERO_MAX_CADASTRO){
		logico verificacao
		
		verificacao = verdadeiro
		se(respostaTemporaria <= 0){
			verificacao = falso
			limpa()
			cabecalho(numeroCadastros, NUMERO_MAX_CADASTRO)
			escreva("\nATENÇÃO: NÃO É POSSÍVEL PREENCHER ESTE CAMPO COM UM NÚMERO INFERIOR OU IGUAL A ZERO.")
			retorne verificacao
		} senao {
			verificacao = verdadeiro
			retorne verificacao
		}
			
	}
	funcao logico validarRepeticao(inteiro codCidades[],inteiro NUMERO_MAX_CADASTRO, inteiro respostaTemporaria){
		logico verificacao = verdadeiro
		para(inteiro indice = 0; indice<NUMERO_MAX_CADASTRO; indice++){
			se(codCidades[indice] == respostaTemporaria){
				verificacao = falso
				retorne verificacao
			}
		}
			retorne verificacao
	}	
	funcao logico ValidarSN(cadeia respostaContinuar, inteiro numeroCadastros, inteiro NUMERO_MAX_CADASTROS){
		logico verificadorRepeticaoSN = falso
		
		se(respostaContinuar == "S"){
			verificadorRepeticaoSN = falso
			retorne verificadorRepeticaoSN
		} senao{
			limpa()
			cabecalho(numeroCadastros, NUMERO_MAX_CADASTROS)
			verificadorRepeticaoSN = verdadeiro
			retorne verificadorRepeticaoSN
		}
	}
	funcao logico verificarErroDigitacao(cadeia respostaContinuar, inteiro numeroCadastros, inteiro NUMERO_MAX_CADASTROS){
		
		logico verificadorErroDigitacao = verdadeiro
		
		se(respostaContinuar != "S" e respostaContinuar != "N" ){
			limpa()
			cabecalho(numeroCadastros, NUMERO_MAX_CADASTROS)
			escreva("\nATENÇÃO: ESTE CAMPO ACEITA APENAS AS LETRAS S PARA SIM E N PARA NÃO!\n")
			verificadorErroDigitacao = falso
			retorne verificadorErroDigitacao
		} senao{
			verificadorErroDigitacao = verdadeiro
			retorne verificadorErroDigitacao
		}
	}
	/*Funções relacionadas às funcionalidades do programa de análise*/
	funcao inteiro descobrirMenorIndiceDeAcidentes(inteiro codCidades[], inteiro numeroAcidentes[], inteiro NUMERO_MAX_CADASTRO){
		inteiro menorIndiceDeAcidentes = numeroAcidentes[0]

		para(inteiro indice = 0; indice < NUMERO_MAX_CADASTRO; indice++){
			se(numeroAcidentes[indice] < menorIndiceDeAcidentes e codCidades[indice]!=0){
				menorIndiceDeAcidentes = numeroAcidentes[indice]
			}
		}
		retorne menorIndiceDeAcidentes
		
	}
	funcao mostrarCidadesComMenorIndiceDeAcidentes(inteiro codCidades[],inteiro numeroAcidentes[], inteiro menorIndiceDeAcidentes, inteiro NUMERO_MAX_CADASTRO){
		
		para(inteiro indice = 0; indice < NUMERO_MAX_CADASTRO; indice++){
			se(numeroAcidentes[indice] == menorIndiceDeAcidentes e codCidades[indice]!=0){
				escreva("\nCIDADE: "+codCidades[indice]+"\t\t NUMERO DE ACIDENTES: "+menorIndiceDeAcidentes+"\n")
			}
		}
		
	}
	funcao inteiro descobrirMaiorIndiceDeAcidentes(inteiro numeroAcidentes[], inteiro NUMERO_MAX_CADASTRO){
		inteiro maiorIndiceDeAcidentes = numeroAcidentes[0]

		para(inteiro indice = 0; indice < NUMERO_MAX_CADASTRO; indice++){
			se(numeroAcidentes[indice] > maiorIndiceDeAcidentes){
				maiorIndiceDeAcidentes = numeroAcidentes[indice]
			}
		}
		retorne maiorIndiceDeAcidentes
	}
	funcao mostrarCidadesComMaiorIndiceDeAcidentes(inteiro codCidades[],inteiro numeroAcidentes[], inteiro maiorIndiceDeAcidentes, inteiro NUMERO_MAX_CADASTRO){
		para(inteiro indice = 0; indice < NUMERO_MAX_CADASTRO; indice++){
			se(numeroAcidentes[indice] == maiorIndiceDeAcidentes e codCidades[indice]!=0){
				escreva("\nCIDADE: "+codCidades[indice]+"\t\t NUMERO DE ACIDENTES: "+ maiorIndiceDeAcidentes+"\n")
			}
		}
		
	}
	funcao real calcularMediaDeVeiculos(inteiro numeroVeiculos[],inteiro NUMERO_MAX_CADASTRO, inteiro numeroCadastros){
		real totalDeVeiculos = 0.0
		real mediaDeVeiculos = 0.0
		
		para(inteiro indice = 0; indice < NUMERO_MAX_CADASTRO; indice++){
			
			totalDeVeiculos += tp.inteiro_para_real(numeroVeiculos[indice])
		}
		mediaDeVeiculos = totalDeVeiculos/tp.inteiro_para_real(numeroCadastros)
		retorne mat.arredondar(mediaDeVeiculos, 2)
		
	}
	funcao inteiro mostrarNumeroDeCidadesComMaisDe2000Veiculos(inteiro codCidades[], inteiro numeroVeiculos[], inteiro NUMERO_MAX_CADASTRO){
		inteiro contadorCidadesComMenosDe2000Veiculos = 0
		para(inteiro indice=0; indice < NUMERO_MAX_CADASTRO;indice++){
			se(numeroVeiculos[indice] < 2000 e codCidades[indice] != 0){
				contadorCidadesComMenosDe2000Veiculos++
			}
		}
		retorne contadorCidadesComMenosDe2000Veiculos
		
	}
	funcao real mediaDeAcidentesEmCidadesComMenosDe2000Veiculos(inteiro codCidades[], inteiro numeroVeiculos[], inteiro NUMERO_MAX_CADASTRO){
		real totalDeVeiculosEmCidadesComMenosDe2000Veiculos = 0.0
		real contadorNumeroDeCidades = 0.0
		real mediaDeVeiculosEmCidadesComMenosDe2000Veiculos = 0.0

		para(inteiro indice = 0; indice<NUMERO_MAX_CADASTRO; indice++){
			se(numeroVeiculos[indice]<2000 e codCidades[indice]>0){
				totalDeVeiculosEmCidadesComMenosDe2000Veiculos += tp.inteiro_para_real(numeroVeiculos[indice])
				contadorNumeroDeCidades++
			}
		}
		mediaDeVeiculosEmCidadesComMenosDe2000Veiculos = totalDeVeiculosEmCidadesComMenosDe2000Veiculos / contadorNumeroDeCidades
		retorne mat.arredondar(mediaDeVeiculosEmCidadesComMenosDe2000Veiculos, 2)
	}
	/*Funções estéticas do programa*/
	funcao desenharLinha(){
		para(inteiro indice =0; indice < 100; indice++){
			escreva("=")
		}
		escreva("=")
	}
	funcao cabecalho(inteiro numeroCadastros, inteiro NUMERO_MAX_CADASTRO){
		desenharLinha()
		escreva("\nINSTITUTO BRASILEIRO DE GEOGRAFIA E ESTATÍSTICA - IBGE")
		escreva("\n" + numeroCadastros +" de "+NUMERO_MAX_CADASTRO + " cadastros.\n")
		desenharLinha()
	}
	funcao mostrarTodosOsCadastros(inteiro codCidades[], inteiro numeroAcidentes[], inteiro numeroVeiculos[], inteiro NUMERO_MAX_CADASTRO){
		para(inteiro indice = 0; indice < NUMERO_MAX_CADASTRO; indice++){
			se(codCidades[indice] != 0){
				escreva("\nCIDADE: "+codCidades[indice]+"\t\tNÚMERO DE VEÍCULOS: "+numeroVeiculos[indice]+"\t\tNÚMERO DE ACIDENTES: "+numeroAcidentes[indice])
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11952; 
 * @DOBRAMENTO-CODIGO = [123, 128, 135, 151, 167, 183, 177, 190, 206, 217, 230, 226, 236, 256, 282, 281, 287, 295, 294, 293];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
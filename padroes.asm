.data
	a:	.word 0
	teste: .asciiz "Hello World!\n"
.text
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//		REALIZA O PUSH DE 1 REGISTRADOR NA PILHA (X28)		//
	.macro PUSH_1 (%REGISTRADOR)					//
		SUBI X28, X28, 8					//
		STUR %REGISTRADOR, [X28, 8]				//
	.end_macro							//
//----------------------------------------------------------------------//
//		REALIZA O POP DE 1 REGISTRADOR NA PILHA (X28)		//
	.macro POP_1 (%REGISTRADOR)					//
		LDUR %REGISTRADOR, [X28, 8]				//
		SUBI X28, X28, 8					//
	.end_macro							//
//----------------------------------------------------------------------//
//		PRINTA O NUMERO ESCOLHIDO PELO REGISTRADOR		//
		//Deste modo designamos somente o registrador em que o valor se encontra
		//Nao sendo necessario realizar um push e pop, portanto menos codigo	
	.macro PRINT_INT (%REGISTRADOR)					//	
		ADD X7, %REGISTRADOR, XZR				//	
		ADDI X8, XZR, 1						//	
		SVC 0 							//
	.end_macro							//	
//----------------------------------------------------------------------//
//		PRINTA A LABEL ESCOLHIDA PELO REGISTRADOR		//
	.macro PRINT_LB (%LABEL)					//
		LDA X7, %LABEL						//
		ADDI X8, XZR, 4						//
		SVC 0							//
	.end_macro							//
//----------------------------------------------------------------------//
//		PEGA INT DO USUARIO, ARMAZENADO EM X2			//
	.macro GET_INT							//
		ADDI X8, XZR, 5						//	
		SVC 0							//
	.end_macro							//
//----------------------------------------------------------------------//
//		FINALIZA O PROGRAMA 					//
	.macro EXIT							//
		ADDI X8, XZR, 10					//
		SVC 0							//
	.end_macro							//
//////////////////////////////////////////////////////////////////////////

//Exemplo print integer
ADDI X0, XZR, 40
PRINT_INT(X0)

//Fim print int

//Exemplo print label
PRINT_LB(teste)
//Fim print label

//Exemplo pega int
GET_INT
PRINT_INT(X2) //Quando utilizamos get, o valor se encontra em x2
//Fim pega int

EXIT
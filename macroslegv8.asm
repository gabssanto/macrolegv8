//Desenvolvido por:
//-Gabriel Santos	github.com/salanho
//-Carlos Gabriel Soares github.com/gabuvns


//////////////////////////////////////////////////////////////////////////
//REALIZA O PUSH DE 1 REGISTRADOR NA PILHA (X28)	
	.macro push_1 (%REGISTRADOR)				
		SUBI X28, X28, 8				
		STUR %REGISTRADOR, [X28, 8]			
	.end_macro		
							
//----------------------------------------------------------------------//
//REALIZA O POP DE 1 REGISTRADOR NA PILHA (X28)	
	.macro pop_1 (%REGISTRADOR)				
		LDUR %REGISTRADOR, [X28, 8]			
		SUBI X28, X28, 8				
	.end_macro						
	
//----------------------------------------------------------------------//
//PRINTA O NUMERO INT ESCOLHIDO PELO REGISTRADOR	
	
	.macro print_int (%REGISTRADOR)					
		ADD X7, %REGISTRADOR, XZR				
		ADDI X8, XZR, 1						
		SVC 0 						
	.end_macro
								
//----------------------------------------------------------------------//
//PRINTA A LABEL ESCOLHIDA PELO REGISTRADOR	
	.macro print_lb (%LABEL)				
		LDA X7, %LABEL					
		ADDI X8, XZR, 4					
		SVC 0						
	.end_macro	
						
//----------------------------------------------------------------------//
//PEGA INT DO USUARIO, ARMAZENADO EM X2		
	.macro get_int						
		ADDI X8, XZR, 5						
		SVC 0						
	.end_macro	
						
//----------------------------------------------------------------------//
//FINALIZA O PROGRAMA 				
	.macro exit						
		ADDI X8, XZR, 10				
		SVC 0						
	.end_macro
//----------------------------------------------------------------------//	
//PEGA FLOAT DO USUARIO E ARMAZENA EM D0
	.macro get_fl 
		ADDI X8, XZR, 6
		SVC 0
	.end_macro	
//----------------------------------------------------------------------//
//PRINTA O FLOAT DO REGISTRADOR D6, PARA ISTO D15 NAO PODE ARMAZENAR NENHUM VALOR
	.macro print_fl (%REGISTRADOR)
		FSUBS D15, D15, D15
		FADDS D6, %REGISTRADOR, D15
		ADDI X8, XZR, 2
		SVC 0
	.end_macro
	
//----------------------------------------------------------------------//	
//PEGA DOUBLE DO USUARIO E ARMAZENA EM D0
	.macro get_db
		ADDI X8, XZR, 7
		SVC 0
	.end_macro	
//----------------------------------------------------------------------//
//PRINTA O DOUBLE DO REGISTRADOR D6, PARA ISTO D15 NAO PODE ARMAZENAR NENHUM VALOR
	.macro print_db (%REGISTRADOR)
		FSUBD D15, D15, D15
		FADDD D6, D0, D15
		ADDI X8, XZR, 3
		SVC 0
	.end_macro
						
//////////////////////////////////////////////////////////////////////////

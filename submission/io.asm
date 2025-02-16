@ /000
	JP START ; Inicia o programa

@ /100
START	GD /000 ; Le os dois primeiros bytes
	SB ZERO ; Converte pra numerico
	MM VAR_X ; Armazena
	GD /000 ; Le os espaços em branco
	SB ZERO ; Faz a mesma coisa que os outros numeros, pode ser desnecessario
	MM ESPACO ; Armazena os espaços, tambem pode ser desnecessario
	GD /000 ; Le os dois ultimos bytes
	SB ZERO ; Converte para numerico
	MM VAR_Y ; Armazena
	AD VAR_X ; Faz X+Y
	MM RES ; Armazena resultado
	DV DEZESSEIS ; Divide por 16, shift para a esquerda
	ML DEZESSEIS ; Multiplica por 16 para pegar o numero sem o ultimo algarismo
	MM MASCARA ; Armazena o numero sem o algarismo menos significativo
	LD RES ; Carrega o resultado 
	SB MASCARA ; Subtrai pela mascara para obter o algarismo menos significativo
	SB VAR_A ; Subtrai por A
	JN NEG ; Verifica se o algarismo menos significativo e menor que A
	LD RES ; Carrega resultado caso o algarismo significativo for maior que A
	SB VAR_A ; Realiza algoritmo de 'vai um' 
	AD D_SQUARED
	JP CONVERT ; Acaba algoritmo
NEG	LD RES ; Aqui nao precisa do vai um, basta apenas converter pra ASCII
CONVERT	AD ZERO ; Converte pra ASCII de novo
	PD /100 ; Imprime no monitor
	HM /000 ; Encerra programa

@ /200
; Constantes e variaveis utilizadas
ZERO	K /3030 
VAR_X	K /0000
VAR_Y	K /0000
VAR_A	K /000A
DEZESSEIS	K /0010
RES	K /0000
D_SQUARED	K /0100
MASCARA	K /FFF0
ESPACO K /0000

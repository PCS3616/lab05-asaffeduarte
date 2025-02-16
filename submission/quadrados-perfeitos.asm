@ /000
	JP START  ; Pula para o início do código

@ /200
START   LV =0     ; Inicializa AC com 0 (n = 0)
        MM N      ; Armazena n
        MM SUM    ; Inicializa SUM (soma acumulada)
        MM NEXT_ODD ; Inicializa o próximo ímpar (2n+1), começa em 1

LOOP	LD SUM    ; Carrega o valor atual de SUM
	AD NEXT_ODD ; Soma o próximo número ímpar (2n + 1)
	MM SUM    ; Atualiza SUM
	LD N      ; Carrega n
	ML DOIS   ; Multiplica por 2 (para calcular 2n)
	AD UM     ; Soma 1 (2n + 1)
	MM NEXT_ODD ; Atualiza o próximo ímpar
	LD N      ; Carrega n
	AD UM     ; Incrementa n
	MM N      ; Atualiza n
	LD SUM
	MM TEMP
	LD ADDR
	AD OP_MM
	MM ARMAZENA
	LD TEMP
ARMAZENA	MM /0000
	LD ADDR
	AD DOIS
	MM ADDR
	SB LIMITE ; Verifica se n == 64
	JZ STOP   ; Se sim, para
	JP LOOP   ; Senão, continua o loop

STOP	HM =0    ; Finaliza execução

@ /300
N	K /0000  ; Contador n
SUM	K /0000  ; Soma acumulada
NEXT_ODD	K /0001 ; Próximo ímpar a ser somado (2n+1)
DOIS	K /0002  ; Constante 2
UM	K /0001  ; Constante 1
LIMITE	K /0180  ; Valor de endereço para parada
TEMP	K /0000
OP_MM	MM /000 ; Coloca 9 na frente do ARMAZENA 
ADDR	K /100 ; Endereços que serao passados para o ARMAZENA, o qual colocara os quadrados na tabela

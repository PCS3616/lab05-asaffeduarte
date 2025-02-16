@ /000
	LD N ; Numero para o qual sera calculado o fatorial
	MM /106 ; armazena N temporariamente em /106
	SC FATORI ; Inicia sub-rotina fatorial
	HM /00C ; Encerra programa

@ /020
FATORI	JP /000
	LD N ; Carrega N
	JZ ZorN ; Verifica se e zero, ou seja, fatorial = 1
	JN ZorN ; Verifica se e negativo, se for, fatorial = 1
LOOP	MM /104 ; servira como N em N(N-1)
SUBT	SC SUB ; Subtrai N por 1
	JZ FIM ; Se for zero, chegou ao fim do algoritmo
	ML /106 ; Multiplica por N
	MM /106 ; Vai armazenando em 106 o resultado
	LD /014 ; Carrega N-1
	MM /104 ; Armazena N-1 em 104 para o loop
	JP LOOP ; Retorna ao inicio do loop
ZorN	LD CONS ; Se for zero ou negativo, carrega 1 no AC
	MM RES	; Coloca o resultado de AC na posiçao de memoria do resultado
	RS FATORI ; Acaba sub-rotina
FIM	LD /106 ; No fim do algoritmo, carrega o resultado de 106
	MM RES ; Armazena no endereço de resposta o resultado
	RS FATORI ; Acaba sub-rotina

@ /100
N	K /003
RES	K /000

@ /200
CONS	K /001

@ /300
; Sub-rotina de subtraçao N-1
SUB	JP SUBT
	SB CONS
	MM /014
	RS SUB

##--------------------Registradores-----------------
# $v0 - registrador de valor de retorno. Quando um subprograma retorna um valor, ele � armazenado em v0
# a0 - registrador de argumento. Quando voce quer imprimir um valor usando a syscall com c�digo 1(imprimir inteiro), voce
# precisa colocar o valor em a0

#--------------------Array------------------------
#	Para criar array com espa�os definidos
#Ex: 6 espa�os = 24. Espa�s x 4 = N�mero do .data
#.data
#v:	.space 24

#	Carregar o endere�o do array em um registrador
#la $t1, v #carrega o endere�o do array no registrador t1

#	Criar um contador para percorrer o array
#li $t0, 0 #contador da posi��o do array 
	
#	Armazenar o valor em uma posi��o do array
#sw $v0, 0($t1) #sw = armazenar o valor lido de um registrador em uma posi��o de mem�ria 
#armazenar o valor de v0 no array

#	Para percorrer o array (endere�o + posi��o)
# addi $t1, $t1, 4  # incrementar o endere�o do array para a pr�xima posi��o
# addi $t0, $t0, 1 # incrementar contador para a pr�xima posi��o do array

#--------------------Strings------------------------
#Ao imprimir uma string em .data devemos colocar
#la (load address) $a0, nome_string antes de imprimi-la com:
#li $v0, 4
#syscall


#--------------------Subprogramas------------------------
#No main escrever jal (nome subprograma)
#No fim do subprograma n�o esquecer de colocar:
# jr $ra
#Vale a pena tamb�m passar o resultado final para v0 e no main passar o v0 para a0
#[Subprograma]
# move $v0, $t0
#[Main]
# move $a0, $v0

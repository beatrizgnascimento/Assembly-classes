##--------------------Registradores-----------------
# $v0 - registrador de valor de retorno. Quando um subprograma retorna um valor, ele é armazenado em v0
# a0 - registrador de argumento. Quando voce quer imprimir um valor usando a syscall com código 1(imprimir inteiro), voce
# precisa colocar o valor em a0

#--------------------Array------------------------
#	Para criar array com espaços definidos
#Ex: 6 espaços = 24. Espaõs x 4 = Número do .data
#.data
#v:	.space 24

#	Carregar o endereço do array em um registrador
#la $t1, v #carrega o endereço do array no registrador t1

#	Criar um contador para percorrer o array
#li $t0, 0 #contador da posição do array 
	
#	Armazenar o valor em uma posição do array
#sw $v0, 0($t1) #sw = armazenar o valor lido de um registrador em uma posição de memória 
#armazenar o valor de v0 no array

#	Para percorrer o array (endereço + posição)
# addi $t1, $t1, 4  # incrementar o endereço do array para a próxima posição
# addi $t0, $t0, 1 # incrementar contador para a próxima posição do array

#--------------------Strings------------------------
#Ao imprimir uma string em .data devemos colocar
#la (load address) $a0, nome_string antes de imprimi-la com:
#li $v0, 4
#syscall


#--------------------Subprogramas------------------------
#No main escrever jal (nome subprograma)
#No fim do subprograma não esquecer de colocar:
# jr $ra
#Vale a pena também passar o resultado final para v0 e no main passar o v0 para a0
#[Subprograma]
# move $v0, $t0
#[Main]
# move $a0, $v0

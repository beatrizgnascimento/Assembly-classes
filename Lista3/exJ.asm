.data
v:	.space 24 # array de 6 espa�os
.text
.globl main
main:
	jal leitura
	jal maior_valor
	
	move $a0, $v0 #imprimir o maior valor
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall


leitura:
	la $t1, v #carrega o endere�o do array no registrador t1
	li $t0, 0 #contador da posi��o do array
while1:
	li $v0, 5 #Ler inteiro
	syscall
	sw $v0, 0($t1) #sw = armazenar o valor de um registrador em uma posi��o de mem�ria 
	#armazenar o valor de v0 no array
	addi $t1, $t1, 4  # incrementar o endere�o do array para a pr�xima posi��o
	addi $t0, $t0, 1 # incrementar contador para a pr�xima posi��o do array
	blt $t0, 6, while1 #loop vai at� 6 valores
	jr $ra



maior_valor:
	la $t1, v #carrega o endere�o do array no registrador t1
	li $t0, 0 #cont = 0
	lw $t2, 0($t1) # Carrega o primeiro valor do array
	move $t3, $t2 # maior = v[0].
while2:
	lw $t2, 0($t1) # ler elemento atual
	bgt $t2, $t3, then1 #Se atual > maior, atualizar o valor
	addi $t1, $t1, 4 # incrementar endere�o do array para a pr�xima posi��o
	addi $t0, $t0, 1 # incrementar contador
	blt $t0, 6, while2 #loop percorre todo o array
	move $v0, $t3 # retorna o maior valor
	jr $ra
then1:
	move $t3, $t2 # atualizar o valor de t3 (maior valor)
	j while2

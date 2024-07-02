.data
v:	.space 24

.text
.globl main
main:
	jal leitura
	jal maior_valor
	
	move $a0, $v0
	
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
leitura:
	la $t0, v #carrega o endereço do array no registrador t1
	li $t1, 0 #contador da posição do array
while1:
	li $v0, 5 #Ler inteiro
	syscall
	sw $v0, 0($t0) #sw = armazenar o valor de um registrador em uma posição de memória 
	#armazenar o valor de v0 no array
	addi $t0, $t0, 4  # incrementar o endereço do array para a próxima posição
	addi $t1, $t1, 1 # incrementar contador para a próxima posição do array
	blt $t1, 6, while1 #loop vai até 6 valores
	jr $ra
	
maior_valor:
	la $t0, v
	li $t1, 0
	lw $t2, 0($t0) #lw le o primeiro valor do array
	move $t3, $t2 #maior = v[0]
while2:
	lw $t2, 0($t0) #lw le o elemento atual do  array
	bgt $t2, $t3, then1
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	blt $t1, 6, while2
	move $v0, $t3
	jr $ra
then1:
	move $t3, $t2
	j while2
	
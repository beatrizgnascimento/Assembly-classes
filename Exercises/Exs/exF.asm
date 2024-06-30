.data
space:	.asciiz " "

.text
.globl main
main:
	li $v0, 5 #ler N
	syscall
	
	move $t0, $v0
	
	li $t1, 0 #cont = 0
	li $t2, 0 # i = 0
while:
	beq $t1, $t0, fim #Se cont == N, fim
	add $t2, $t2, 1 #i++ (passa para o próximo)
	andi $t3, $t2, 1 #impar
	j impar #Se for impar
	j while #Se nao, retorna o loop
impar:
	move $a0, $t2
	li $v0, 1 #Imprime o número atual (i)
	syscall
	la $a0, space #Imprime espaço entre os números
	li $v0, 4
	syscall
	addi $t1, $t1, 1 #add cont
	addi $t2, $t2, 1 #passa para o próximo número
	j while
fim:
	

.data
space:	.asciiz " "

.text
.globl main
main:

	li $v0, 5 #Leitura do inteiro N
	syscall
	
	add $t1, $zero, $v0 #t1 (que será o nosso contador i) = N
	
	# Contador regressivo: i = n; i >= 1; i--
while:
	beq $t1, $zero, fim #Se t1 == 0, fim
	li $v0, 1
	add $a0, $t1, $zero #copia o valor de t1 para a0
	syscall #Imprimir $a0
	
	#Imprimir com espaço
	la $a0, space #Carregar o endereço de space em $a0
	li $v0, 4
	syscall #imprimir string
	
	
	addi $t1, $t1, -1 #t1--
	bne $t1, $zero, while #Se o t1 != 0, continue no loop
	
fim:

	

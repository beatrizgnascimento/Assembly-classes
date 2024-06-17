.data
space: .asciiz " "  # Defini��o de uma string contendo um espa�o

.text
.globl main
main:
    # Leitura de N
    li $v0, 5           
    syscall              # Realiza a leitura do inteiro e armazena em $v0
    
    # Armazenar N em outro registrador
    add $t0, $zero, $v0        # $t0 = N
    
    li $t1, 0 #cont = 0 - conta os n�meros �mpares
    li $t2, 0 #i = 0 - n�mero atual
    
while:
	beq, $t1, $t0, fim
    	andi $t3, $t2, 1 #t3 = t2 & 1
    	bne $t3, $zero, print #� �mpar
    	addi $t2, $t2, 1
    	j while
print:
	move $a0, $t2 #a0 = t2
	li $v0, 1 #carrega o n�mero
	syscall #imprime o n�mero
	la $a0, space
	li $v0, 4
	syscall #imprime o espa�o entre n�meros
	addi $t1, $t1, 1 #adiciona 1 no contador
	addi $t2, $t2, 1 #passa para o pr�ximo n�mero
	j while
    	
fim:
    
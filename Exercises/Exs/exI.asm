.text
.globl main
main:
	li $v0, 5 #Ler valor A (será o i)
	syscall
	move $t0, $v0
	
	li $v0, 5 #Ler valor B
	syscall
	move $t1, $v0
	
	jal soma
	
	move $a0, $v0 #Passa v0 para a0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
.text
soma:
	li $t2, 0 #soma = 0
	move $t3, $t0
while:
	bgt $t3, $t1, fim
	
	add $t2, $t2, $t3 #soma = soma + i
	addi $t3, $t3, 1
	j while
	
fim:
	move $v0, $t2 #Passa a soma para v0
	jr $ra

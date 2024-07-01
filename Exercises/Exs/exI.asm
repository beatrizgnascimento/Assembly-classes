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
	
.text
soma:
while:
	li $t2, 0 #soma = 0
	beq $t0, $t1, fim
	
	add $t3, $t2, $t0 #soma = soma + i
	addi $t0, $t0, 1
	j while
	
fim:
	move $a0, $t3
	li $v0, 1
	syscall
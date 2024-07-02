.data
space:	.asciiz " "
.text
.globl main
main:
	li $v0, 5 #Ler N
	syscall
	
	move $t0, $v0 #t0 = N
	
	li $t1, 1 #i = 1
	
while:
	bgt $t1, $t0, fim
	move $a0, $t1
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	addi $t1, $t1, 1
	j while
fim:
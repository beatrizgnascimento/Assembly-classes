#Fibonacci
.data
space:	.asciiz " "

.text
.globl main
main:
	li $v0, 5 #Ler N
	syscall
	
	move $t0, $v0
	
	li $t1, 0 #i = 0
	li $t2, 0 #j = 0
	li $t3, 1 #k = 1 
	
	
while:
	bgt $t1, $t0, fim
	
	move $a0, $t2
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	add $t4, $t2, $t3
	move $t2, $t3
	move $t3, $t4
	
	addi $t1, $t1, 1
	j while
fim:
	
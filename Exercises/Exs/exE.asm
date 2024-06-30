.data
space:	.asciiz " "

.text
.globl main
main:
	li $v0, 5 #Ler N
	syscall
	
	move $t0, $v0 #t0 = n
	
	la $t1, 1 #i = 1
	
while:

	beq $t0, $zero, fim

	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	sub $t0, $t0, 1 #n --;
	j while
	
	
fim:
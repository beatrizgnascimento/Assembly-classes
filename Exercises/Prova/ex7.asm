#Números primos
.data
space:	.asciiz " "

.text
.globl main
main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	li $t1, 0 #i = 0
while
.data
par:	.asciiz "par"
impar:	.asciiz "impar"
.text
.globl main
# Recebe o valor em a0
# Devolve em v0: 1(sim) 0 (nao)
main:
	#leitura do valor
	li $v0, 5 #read int
	syscall
	
	#parametro em $a0
	add $a0, $zero, $v0
	
	jal quad
	
	add $s0, $zero, $v0
if2:
	bne $s0, $zero, else2
then2:
	li $v0, 4
	la $a0, par
	syscall
else2:
	li $v0, 4
	la $a0, impar
	syscall

endIf2:
	#encerra
	li $v0, 10
	syscall

.data
.text
quad:
	andi $t0, $a0, 1
	jr $ra
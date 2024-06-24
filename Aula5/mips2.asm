
.data
sim:	.asciiz "sim"
nao:	.asciiz "nao"
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
	la $a0, nao
	syscall
else2:
	li $v0, 4
	la $a0, sim
	syscall

endIf2:
	#encerra
	li $v0, 10
	syscall


.data
.text
quad:
	li $t0, 0 # i
	
while:
	mul $t1, $t0, $t0 # t1 = i * i
	slt $t2, $t1, $a0 # if(t1 < n) t2 = 1; else t2 = 0
	
	beq $t2, $zero, fimWhile
	
	addi $t0, $t0, 1 #i++
	j while
	
fimWhile:
	
if:
	mul $t1, $t0, $t0 # t1 = i * i
	bne $t1, $a0, else
then:
	li $v0, 1 #sim
	j endIf
else:
	li $v0, 0 #nao

endIf:
	jr $ra

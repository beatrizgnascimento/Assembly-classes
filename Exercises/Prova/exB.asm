.data
v:	.space 32

.text
.globl main
main:
	jal leitura
	jal menor
	
leitura:
	la $t1, v
	li $t0, 0
	
while:
	li $v0, 5
	syscall
	sw $v0, 0($t1)
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	blt $t1, 8, while
	jr $ra
	
menor:
	la $t1, v
	li $t0, 0
	lw $t2, 0($t1) #primeiro elemento do array
	move $t3, $t2 #menor = primeiro elemento
while2:
	lw $t2, 0($t1)
	blt $t2, $t3, then1
	addi $t1, $t1, 4
	addi $t0, $t0, 1
	blt $t1, 8, while2
	move $v0, $t3
	jr $ra
	
then1:
	move $t3, $t2
	j while2
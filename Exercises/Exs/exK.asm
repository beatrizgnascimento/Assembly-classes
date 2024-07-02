.text
.globl main
main:
	li $v0, 5
	syscall
	move $t0, $v0
	
	jal quadrado
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
quadrado:
	li $t1, 0 #i = 0
while:
	mul $t2, $t1, $t1
	slt $t3, $t2, $t0 #Se t2 for menor do que o t0; t3 = 1, se não, 0
	beq $t3, $zero, then1 #Se o t3 for 0, vai para then1
	addi $t1, $t1, 1 #i++
	j while
	
then1:
	beq $t2, $t0, then2 #Se i != N, então não é quadrado perfeito
	li $v0, 0
	jr $ra
	
then2:
	li $v0, 1
	jr $ra
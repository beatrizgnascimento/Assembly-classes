.text
.globl main
main:
	li $v0, 5 #Ler valor inteiro
	syscall
	move $a0, $v0
	
	jal quadrado
	move $a0, $v0
	
	li $v0, 1
	syscall
	
	#encerra
	li $v0, 10
	syscall
	
.data
.text
quadrado:
	li $t0, 0 # i = 0
	
while:
	mul $t1, $t0, $t0 # t1 = i * i
	slt $t2, $t1, $a0 # if(t1 < n) t2 = 1; else t2 = 0
	
	beq $t2, $zero, fimWhile
	
	addi $t0, $t0, 1 #i++
	j while
	
fimWhile:
	bne $t1, $a0, then1
	li $v0, 1
	jr $ra
	
then1:
	li $v0, 0 # não é quadrado perfeito
	jr $ra
	
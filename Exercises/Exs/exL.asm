.data
a: .space 16
b: .space 24

.text
.globl main
main: 	
	la $t0, a #carrega o vet a
	li $t1, 0 #cont1 = 0
	li $t5, 0 #cont2 = 0
	
	la $t2, b #carrega o vet b
while:
	li $v0, 5
	syscall
	sw $v0, 0($t0) #Coloca cada valor de v0 em uma posição de t0(vetA)
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	blt $t1, 4, while # Loop até cont1 < 4

	# Resetar t0 e t1 para reuso
	la $t0, a 
	li $t1, 0
	
while2:
	li $v0, 5
	syscall
	sw $v0, 0($t2) #Coloca cada valor de v0 em uma posição de t2(vetB)
	addi $t2, $t2, 4
	addi $t5, $t5, 1
	blt $t5, 6, while2 # Loop até cont2 < 6
	
fim:
	jal iguais
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

iguais:
	la $t0, a #carrega o vet a
	la $t2, b #carrega o vet b
	li $t4, 0 #cont numeros iguais = 0
	li $t1, 0 #contA = 0
	
while3:
	lw $t3, 0($t0) #carrega 1 valor do array A
	la $t2, b
	li $t5, 0 # Reset contB
	
inner_while:
	lw $t6, 0($t2) #carrega o 1 valor do array b
	beq $t3, $t6, then1
	addi $t2, $t2, 4
	addi $t5, $t5, 1 #vai para a próxima posição do array b
	blt $t5, 6, inner_while # Loop até contB < 6
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1 #passa para o próximo número do array A
	blt $t1, 4, while3 # Loop até contA < 4
	
	move $v0, $t4 # store the return value in $v0
    	jr $ra # jump back to the caller function
	
	j fim1

then1:
	addi $t4, $t4, 1 #cont-num-igual++
	la $t2, b # Resetar t2 para o início do array b
	j while3

fim1:
	move $v0, $t4
	jr $ra

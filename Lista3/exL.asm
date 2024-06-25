.data
a:	.space 16 #array A
b:	.space 24 #array B
msg:	.asciiz "\n"
.text
.globl main
main:
	la $t1, a #carrega o endereço do array no registrador t1
	li $t0, 0 #contador da posição do array
while1:
	li $v0, 5 #Ler inteiro
	syscall
	sw $v0, 0($t1) #sw = armazenar o valor de um registrador em uma posição de memória 
	#armazenar o valor de v0 no array
	addi $t1, $t1, 4  # incrementar o endereço do array para a próxima posição
	addi $t0, $t0, 1 # incrementar contador para a próxima posição do array
	blt $t0, 4, while1 #loop vai até 4 valores
	j end1

end1:
	la $t2, b #carrega o endereço do array no registrador t1
	li $t0, 0 #contador da posição do array
while2:
	li $v0, 5 #Ler inteiro
	syscall
	sw $v0, 0($t2) #sw = armazenar o valor de um registrador em uma posição de memória 
	#armazenar o valor de v0 no array
	addi $t2, $t2, 4  # incrementar o endereço do array para a próxima posição
	addi $t0, $t0, 1 # incrementar contador para a próxima posição do array
	blt $t0, 6, while2 #loop vai até 6 valores
	j end2

end2:
	jal numeros_iguais
	
	move $a0, $v0
	li $v0, 1
	syscall
	
    	# Encerrar o programa
    	li $v0, 10
    	syscall
	
	
.text
numeros_iguais:
	li $t4, 0 #cont = 0; contador de números iguais
	la $t1, a #carregar endereço do array A em t1
	li $t5, 4 #tamanho de A
	
while3:
	beqz $t5, end3 #Se t5 for 0, fim
	lw $t6, 0($t1) #Carrega o elemento de a[$t1]
	la $t2, b #Carrega o endereço de b em t2
	li $t7, 6 #tamanho de B

while4:
	beqz $t7, end4 #Se t7 for 0, fim
	lw $t8, 0($t2) #Carrega o elemento de b[$t2]
	beq $t6, $t8, incrementador #Se A[$t1] == B[$t2] incrementa o contador
	addi $t2, $t2, 4 #Incrementa o endereço de B
	subi $t7, $t7, 1 #Decrementa o contador de B
	j while4
	
incrementador:
	addi $t4, $t4, 1 #incrementa o contador de elementos
	
end4:
	addi $t1, $t1, 4 #Incrementa o endereço de A
	subi $t5, $t5, 1 #Decrementa o contador de A
	j while3
	addi $t1, $t1, 4
	addi $t0, $t0, 1 #percorrer todo o array a
end3:
	move $v0, $t4 #Retorna o cont
	jr $ra
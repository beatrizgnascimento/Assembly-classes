.text
.globl main
main:
	li $v0, 5 #Ler N
	syscall
	
	ble $v0, $zero, main #Se o número for menor ou igual a 0, volta para main
	
	move $t0, $v0 #Armazena N em t0; 
	
	li $t1, 0 #soma = 0
	
	li $t2, 1 #i = 1

while:
	bgt $t2, $t0, fim #Se i = N; fim
	
	add $t1, $t1, $t2 #cont = cont + i
	
	addi $t2, $t2, 1 #i vai para o próximo número
	
	j while
	
fim:
	move $a0, $t1
	li $v0, 1 #Imprime cont
	syscall
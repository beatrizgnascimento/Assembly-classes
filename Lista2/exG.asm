.text
.globl main
main:
	
	li $v0, 5 #Ler n
	syscall
	
	#Se n for 0, volta para main
	beq $v0, $zero, main
	
	#Se n for menor do que 0, volta para main
	ble $v0, $zero, main
	
	move $t0, $v0 #coloca n em outro registrador
	
	
	li $t1, 0 #cont = 0 - contador para a soma
    	li $t2, 1 #i = 1 - número atual
    	
while:
	ble $t2, $t0, soma #se i <= N vai para soma
	j fim #caso contrário, acaba o loop
	
soma:
	add $t1, $t1, $t2 #t1 = cont + i
	addi $t2, $t2, 1 #passa para o próximo número
	j while
fim:
	move $a0, $t1 #a0 = cont
	li $v0, 1
	syscall #imprime a soma
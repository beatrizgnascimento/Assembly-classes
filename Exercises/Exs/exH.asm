.text
.globl main
main:
	li $v0, 5 #Ler N
	syscall
	
	move $t0, $v0
	
	li $t1, 1 #fat = 1
	
	li $t2, 1 #i = 1

while:
	bgt $t2, $t0, fim #Se i = N; fim
	
	mul $t1, $t1, $t2 #mul = mul * i
	
	addi $t2, $t2, 1 #i vai para o próximo número
	
	j while
	
fim:
	move $a0, $t1
	li $v0, 1 #Imprime cont
	syscall
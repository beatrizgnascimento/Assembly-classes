.text
.globl main
main:

	li $v0, 5 #Ler n�mero 1
	syscall
	
	move $t0, $v0 
	
	li $v0, 5 #Ler n�mero 2
	syscall
	
	move $t1, $v0 
	
	li $v0, 5 #Ler n�mero 3
	syscall
	
	move $t2, $v0 
	
	li $v0, 5 #Ler n�mero 4
	syscall
	
	move $t3, $v0 
	
	#Maior n�mero ser� o primeiro a ter sido digitado
	
	bgt $t1, $t0, then #Se o segundo n�mero for maior do que o primeiro
	
then:
	move $t0, $t1 #t1 ser� o maior n�mero
	
	bgt $t2, $t0, then2 #Se t2 for maior do que o maior
	j end
	
then2:
	move $t0, $t2 #t2 ser� o maior
	bgt $t3, $t0, then3
	j end
	
then3:
	move $t0, $t3
	j end
	
end:
	move $a0, $t0
	li $v0, 1
	syscall #Imprime o maior n�mero
	
	
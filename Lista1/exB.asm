.text
.globl main
main:
	li $v0, 5	#Ler número 1
	syscall
	add $t0, $zero, $v0
	
	li $v0, 5	#Ler número 2
	syscall
	add $t1, $zero, $v0
	
	li $v0, 5	#Ler número 3
	syscall
	add $t2, $zero, $v0
	
	li $v0, 5	#Ler número 4
	syscall
	add $t3, $zero, $v0
	
	# Primeiro if; Se t1 > t0, t0 = t1
	bge $t0, $t1, then1
	add $t0, $zero, $t1
	
	
then1:
	#Segundo if; Se t2 > t0 t0 = t2
	bge $t0, $t2, then2
	add $t0, $zero, $t2

then2:
	#Terceiro if; Se t3> t0, t0 = t3
	bge $t0, $t3, end_if
	add $t0, $zero, $t3
	
end_if:
	add $a0, $zero, $t0
	li $v0, 1
	syscall
	

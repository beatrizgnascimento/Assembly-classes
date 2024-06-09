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
	
	# Primeiro if; Se num2 > num1 vai para then1
	bge $t0, $t1, then1
	add $t0, $zero, $t1
	
	
then1:
	#Segundo if; Se num3 > num2 vai para then2
	bge $t0, $t2, then2
	add $t0, $zero, $t2

then2:
	#Terceiro if; Se num4> num3 vai para end_if
	bge $t0, $t2, end_if
	add $t0, $zero, $t3
end_if:
	add $a0, $zero, $t0
	li $v0, 1
	syscall
	
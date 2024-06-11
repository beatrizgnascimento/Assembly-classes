.data
equi:	.asciiz "equilatero"
iso:	.asciiz "isosceles"
esc:	.asciiz "escaleno"

.text
.globl main
main:
	li $v0, 5	#Ler lado 1
	syscall
	add $t0, $zero, $v0
	
	li $v0, 5	#Ler lado 2
	syscall
	add $t1, $zero, $v0
	
	li $v0, 5	#Ler lado 3
	syscall
	add $t2, $zero, $v0

	# Se l1 == l2
	beq $t0, $t1, then1
	
	#Se l1 == l3
	beq $t0, $t2, then3
	
	#Se l2 == l3
	beq $t1, $t2, then3
	
	#Se não, é escaleno
	la $a0, esc
   	li $v0, 4
   	syscall
   	j end_if

then1:
	#Se l2 == l3 será equilátero
	beq $t1, $t2, then2
	
	#Se não, é isósceles
	la $a0, iso
   	li $v0, 4
   	syscall
   	j end_if
	
then2:
	la $a0, equi
   	li $v0, 4
   	syscall
   	j end_if
   	
then3:
	la $a0, iso
   	li $v0, 4
   	syscall
   	j end_if
   
end_if:

	
	
	

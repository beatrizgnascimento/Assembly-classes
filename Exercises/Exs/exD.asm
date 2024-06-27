.data
equi:	.asciiz "equilatero"
iso:	.asciiz "isosceles"
esc:	.asciiz "escaleno"

.text
.globl main
main:
	li $v0, 5 #Ler lado A
	syscall
	
	move $t0, $v0
	
	li $v0, 5 #Ler lado B
	syscall
	
	move $t1, $v0
	
	li $v0, 5 #Ler lado C
	syscall
	move $t2, $v0
	
	beq $t0, $t1, then1
	
	beq $t0, $t2, then3
	
	la $t3, esc
	li $v0, 4
	syscall
	
then1:
	beq $t0, $t2, then2
	la $t3, iso
	li $v0, 4
	syscall
	j end
	
then2:
	la $t3, equi
	li $v0, 4
	syscall
	j end
	
then3:
	la $t3, iso
	li $v0, 4
	syscall
	j end
end:
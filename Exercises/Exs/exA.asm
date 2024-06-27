.data
pos:	.asciiz "postitivo"
neg:	.asciiz "negativo"
.text
.globl main
main:
	li $v0, 5 #Ler valor
	syscall
	
	move $t1, $v0
	
	bgt $t1, 0, then
	la $a0, neg
	li $v0, 4
	syscall
	j end
	
then:
	la $a0, pos
	li $v0, 4
	syscall
	j end
	
end:
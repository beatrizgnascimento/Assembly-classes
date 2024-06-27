.data
sim:	.asciiz "sim"
nao:	.asciiz "nao"
.text 
.globl main
main:
	li $v0, 5 #Ler idade
	syscall
	move $t0, $v0 #Armazenar idade em t0
	
	li $v0, 5
	syscall
	move $t1, $v0 #Armazenar tempo de serviço em t1
	
	bge $t0, 65, then1
	bge $t1, 35, then1
	bge $t0, 60, then2
	
	la $a0, nao
	li $v0, 4
	syscall 
	j end

then1:
	la $a0, sim
	li $v0, 4
	syscall
	j end
	
then2:
	bge $t1, 30, then1
	la $a0, nao
	li $v0, 4
	syscall 
	j end
	
end:
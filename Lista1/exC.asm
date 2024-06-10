.data
sim:	.asciiz "sim"
nao:	.asciiz "nao"
idade_65:	.word 65
idade_60:	.word 60
trab_35:	.word 35
trab_30:	.word 30

.text
.globl main
main:
	li $v0, 5	#Ler idade
	syscall
	add $t0, $zero, $v0 #Armazena a idade em t0
	
	li $v0, 5	#Ler tempo de serviço
	syscall
	add $t1, $zero, $v0 #Armazena tempo de serviço em t1
	
	# Carregar endereços
	lw $t2, idade_65
	lw $t3, idade_60 
	lw $t4, trab_35
	lw $t5, trab_30
	
	#IF t0 >= 65
	bge $t0, $t2, then1 
	
	#If trab >= 35
	bge $t1, $t4, then1 
	
	#If idade >= 60
	bge $t0, $t3, then2
	
	#If idade < 60
	j else
	
then1:
	#Print sim
	la $a0, sim
	li $v0, 4
	syscall
	j end_if
then2:
	#If trab >= 30 vai para then1
	bge $t1, $t5, then1 
	
	#If trab < 30
	j else

else:
	
	la $a0, nao #Carrega a string nao
	li $v0, 4 
	syscall
	j end_if
	
	
end_if:

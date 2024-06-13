.data
par:	.asciiz "par"
impar:	.asciiz "impar"
.text
.globl main
# Recebe o valor em a0
# Devolve em v0: 1(sim) 0 (nao)

#Isolar o �ltimo bit do n�mero (se for 0 � par, se for 1 � �mpar)
main:
	#leitura do valor
	li $v0, 5 #read int
	syscall #o valor digitado est� em $v0
	
	#passar o argumento n para $a0
	add $a0, $zero, $v0 #$a0 = $v0
	
	jal verifica #jump and link
	
	# a resposta est� em v0
	
	add $s0, $zero, $v0
if:
	#if v0 = 0 ->par
	bne $s0, $zero, else
then:
	li $v0, 4
	la $a0, par
	syscall
	j endIf
	
else:	# �mpar
	li $v0, 4
	la $a0, impar
	syscall

endIf:
	#encerra
	li $v0, 10
	syscall

.data
.text
#Se for par, retorna 0 em $v0
#Se for �mpar, retorna 1 em $v0
verifica:
	# $a0 = 101011
	#	000001
	# $v0 =	000001
	andi $t0, $a0, 1 #A opera��o andi � bit a bit e faz o and entre as unidades (multiplica��o)
	jr $ra

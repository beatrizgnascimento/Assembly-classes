.data
pos:	.asciiz "postitivo"
neg:	.asciiz "negativo"
.text
.globl main
main:
	li $v0, 5 #Ler valor
	syscall
	
	move $t1, $v0 #Passar o valor de v0 para t1
	
	bgt $t1, 0, then #Se t1 for maior que 0, vai para then
	la $a0, neg
	li $v0, 4
	syscall
	j end
	
then:
	la $a0, pos #Carrega o endereço da string
	li $v0, 4 #Imprime a string
	syscall
	j end
	
end:
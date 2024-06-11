.data
pos:	.asciiz "positivo"
neg:	.asciiz "negativo"

.text
.globl main
main:
	li $v0, 5 #Ler o valor inteiro
	syscall
	
	slt $t0, $v0, $zero #Se v0 < 0
	bne $t0, $zero, then1
	
	#Bloco else
	la $a0, pos #Carrega o endereço da string positivo
	li $v0, 4 #imprime a string
	syscall
	j end_if

then1:
	la $a0, neg #Carrega o endereço de negativo
	li $v0, 4 #Imprime a string
	syscall
	j end_if
	
end_if:
	

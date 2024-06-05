.data

msg1:	.asciiz "Informe a temperatura: "
sol:	.asciiz "solido"
liq:	.asciiz "liquido"
gas:	.asciiz "gasoso"

.text
.globl main

main:
	la $a0, msg1 #imprimir a mensagem 1
	li $v0, 4 #imprimir string
	syscall
	
	#leitura do valor digitado em v0
	li $v0, 5 #ler inteiro
	syscall
	
	#o valor digitado está em v0
	
	#determinar o estado físico da água com base na temperatura digitada
	
	#condição do sólido
if1: 	slt $t0, $v0, $zero	#if(v0 < 0)
			    	#  t0 = 1
			    	#else
			    	#  t0 = 0
	beq $t0, $zero, else1
	
then1:
	#imprime a mensagem sólido
	la $a0, sol
	li $v0, 4
	syscall
	
	j end_if
	
else1:	

if2:	li $t1, 100 
	slt $t0, $t1, $v0 # if (100 < temp)
	beq $t0, $zero, else2
then2:
	la $a0, gas
	li $v0, 4
	syscall
	
	j end_if
	
else2:
	la $a0, liq
	li $v0, 4
	syscall
	

end_if:
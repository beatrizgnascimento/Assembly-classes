.data
msg1: 	.asciiz "Informe o valor "
msg2:	.asciiz "Resposta: "

.text
.globl main
#Mensagem ao usuário
	li $v0, 4 #print string
	la $a0, msg1 #endereço da string
	syscall
	
	#Leitura do valor
	li, $v0, 5 #read int
	syscall
	
	# Enviar o valor para o subprograma
	add $a0, $zero, $v0 # armazenando o valor em $a0
	# Invocar o subprograma
	jal fatorial
	
	add $t0, $zero, $v0 # t1 = v0 (fatorial)
	
	li $v0, 4 # print string
	la $a0, msg2 
	syscall
	
	add $a0, $zero, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall #Encerra a execução
main:

#Subprograma fatorial
#Calcular o valor do fatorial em a0
#Devolve a resposta em v0
.data
.text
fatorial:
	li $v0, 1
laco:
	beq $a0, $zero, fim # i > 0
	
	mul $v0, $v0, $a0 # f = f * i
	subi $a0, $a0, 1 # i--
	
	j laco
fim:

	jr $ra #return

# Escrever um subprograma que verifique se um valor informado pelo usu?rio ? um n?mero primo

.data
primo:		.asciiz "primo"
nprimo:		.asciiz "composto"

.text
.globl main
main:
	li $v0, 5 #read int
	syscall #o valor digitado est? em $v0
	
	#passar o argumento n para $a0
	add $a0, $zero, $v0 #$a0 = $v0
	
	jal verifica #jump and link
	
if3:
	bne $v0, $zero, else3 #se ele n?o ? 0, ? primo
then3:	
	la $a0, nprimo
	li $v0, 4
	syscall
	j endIf3
else3:
	la $a0, primo
	li $v0, 4
	syscall
	j endIf3
endIf3:
	li $v0, 10
	syscall

.data
.text
verifica:
	#Recebe o numero em a0
	# $a0 = n
	li	$t0, 0 #cont = 0
	li	$t1, 1 #i = 1
	
	addi $t2, $a0, 1 # t2 = (n + 1)
	
inicio:
	#so vai escapar do loop quando i = n + 1
	beq $11, $t2, fim
	
	# verifica o resto da divis?o
	rem $t3, $a0, $t1 # t3 = n % i
	
if:
	bne $t3, $zero, endIf 
	addi $t0, $t0, 1
endIf:
	#incrementar o i
	addi	$t1, $t1, 1 # i = i + 1
	j	inicio
	
fim:
	li $t4, 2 
	li $v0, 0 #salva a resposta, nao primo
if2:
	beq $t0, $t4, endIf2
	li $v0, 1 #salva a respotsa em v0, primo
endIf2:
	jr $ra
.data
primo:	.asciiz "primo"
nprimo:	.asciiz "composto"

.text
.globl main
main:
	li $v0, 5 #Ler N
	syscall
	
	ble $v0, $zero, nprimo_print #Se for 0 ou menor do que 0, não é primo
	
	j fim
	
nprimo_print:
	la $a0, nprimo
	li $v0, 4
	syscall
fim:
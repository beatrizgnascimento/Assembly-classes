.data

.text
.globl main
main:

	li $t0, 0 #total = 0
inicio:
	li $v0, 5 #5 = read int
	syscall
	
	#i está em v0
	slt $t1, $zero, $v0 #if(0 < i) t1=1; else t1=0
	beq $t1, $zero, fim
	
	add $t0, $t0, $v0 #total = total + i
	j inicio
fim:

	add $a0, $zero, $t0
	li $v0, 1 #print int
	syscall
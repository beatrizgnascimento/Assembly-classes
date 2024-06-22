.text
.globl main
main:
	li $v0, 5 #Ler valor A
	syscall
	move $t0, $v0 #t0 guarda A
	li $v0, 5 #Ler valor B
	syscall
	move $t1, $v0 #t1 guarda B
	
	jal soma
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
.data
.text	
soma:
	 li $t2, 0 #cont = 0
	 move $t3, $t0 # i = A
while:
	bgt $t3, $t1, fim #Se i > B, vai para o fim
	add $t2, $t2, $t3 #t2 = cont(t2) + i
	addi $t3, $t3, 1 #passa para o próximo número
	j while
	
fim:
	move $v0, $t2 #v0 = cont
	jr $ra

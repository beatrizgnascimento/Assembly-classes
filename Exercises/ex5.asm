.data
fizz:	.asciiz "Fizz"
buzz:	.asciiz "Buzz"
fizzbuzz:	.asciiz "FizzBuzz"
space:	.asciiz " "

.text
.globl main
main:
	li $v0, 5 
	syscall
	
	move $t0, $v0
	
	li $t1, 1 #i = 1
	
while:
	bgt $t1, $t0, fim
	
	li $t2, 3 #t2 = 3
	div $t1, $t2
	mfhi $t3 #armazena o resto da divisão
	beqz $t3, then1 #Se t3 for 0 vai para then1
	
	li $t4, 5
	div $t1, $t4
	mfhi $t5
	beqz $t5, then3
	
	 move $a0, $t1
    	li $v0, 1
    	syscall
    	
    	la $a0, space
    	li $v0, 4
    	syscall
    	
    	addi $t1, $t1, 1
    	j while
    
	
then1:
	li $t4, 5
	div $t1, $t4
	mfhi $t5
	beqz $t5, then2
	#Se nao é múltiplo, imprime apenas fizz
	
	la $a0, fizz
	li $v0, 4
	syscall
	la $a0, space
	li $v0, 4
	syscall
	
	addi $t1, $t1, 1 #i vai para o proximo
	
	
	
	j while
	
	
then2:
	la $a0, fizzbuzz
	li $v0, 4
	syscall
	la $a0, space
	li $v0, 4
	syscall
	
	addi $t1, $t1, 1 #i vai para o proximo
	j while
	
then3:
 	la $a0, buzz
	li $v0, 4
	syscall
	la $a0, space
	li $v0, 4
	syscall
	
	addi $t1, $t1, 1 #i vai para o proximo
	
	j while
fim:

	
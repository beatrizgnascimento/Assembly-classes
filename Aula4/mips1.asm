#int v[5] = {1,2,3,4,5}
#for(i=0; i<5; i++)
#	soma += v[i]
.data
v:	.word 1,2,3,4,5
.text
.globl main
main:
	
	li	$s0, 0 #soma = 0
	li	$s1, 0 #i = 0
	li	$s3, 5 #n = 5
	
	 # endere�o de cada posi��o = base + deslocamento
	 # posicao 0 
	la $t0, v #endere�o BASE: onde come�a o vetor// la:carregar endere�o
	
inicio:
	beq	$s1, $s3, fim
	# deslocamento para �ndice 0
	sll	$t1, $s1, 2 # 4 * i
	
	# endere�o 0: base + deslocamento
	add	$s2, $t0, $t1 #s2 = base + deslocamento
	
	#somando o valor
	lw	$t2, 0($s2) # t2 = v[0]
	add	$s0, $s0, $t2 # soma = soma+ v[0]
	
	#incrementar o i
	addi	$s1, $s1, 1 # i = i + 1
	j	inicio
	
fim:
	 
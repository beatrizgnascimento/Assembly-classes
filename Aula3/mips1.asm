#Endereçamento por label

.data
x:	.word 1
y:	.word 2
z:	.word 7

.text

	lw $s1, x
	lw $s2, y
	
	add $s0, $s1, $s2 # 3
	
	#salvar na memória z o resultado
	sw $s0, z
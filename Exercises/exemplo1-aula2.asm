.data
.text
.globl main
main:
    li $v0, 5 # Chamada para leitura de inteiro
    syscall # Lê um inteiro e armazena em $v0

    addi $t3, $zero, 100 # Armazena 100 em $t3

    # Primeiro if: verifica se $v0 < 0
    slt $t0, $v0, $zero
    bne $t0, $zero, then1

    # Segundo if: verifica se $v0 > 100
    slt $t1, $t3, $v0
    bne $t1, $zero, then2

    # Bloco else
    addi $s3, $zero, 2
    j end_if

then1:
    addi $s1, $zero, 1
    j end_if

then2:
    addi $s2, $zero, 3

end_if:
    # Fim do programa
    li $v0, 10 # Chamada para finalizar o programa
    syscall

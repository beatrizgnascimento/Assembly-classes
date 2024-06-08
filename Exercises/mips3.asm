# $s0 = f
# s1 = g
# s2 = h
#s3 = i
#s4 = j

	
	addi $s1, $zero, 4
	addi $s2, $zero, 10
if1:
	slt $s3, $s3, $t1
then:
	add $s0, $s1, $s2
	j end_if
else_if:
	sub $s0, $s1, $s2
	j end_if
	

end_if:
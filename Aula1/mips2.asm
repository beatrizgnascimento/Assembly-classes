# $s0 = r
# $s1 = m
# $s2 = n
# $s3 = o
# $s4 = p

# Exercício B: r = m - (n + o)
add $t0, $s2, $s3 # t0 = n + o 
sub $s0, $s1, $t0 # m - t0
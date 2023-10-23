# $s0 = i
# $s1 = j
# $s2 = f
# $t0 = g
# $t1 = h	
	.data
	.text
main:
	bne $s0, $s1, else
	add $s2, $t0, $t1
	j exit
else: 
	sub $s2, $t0, $t1
exit:
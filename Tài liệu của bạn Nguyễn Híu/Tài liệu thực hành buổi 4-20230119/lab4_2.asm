# $s0 = i
# $s1 = N
# $s2 = Sum	
	.data
	.text
main:
	li $s2, 0
	li $s0, 1
loop:
	slt $t0, $s1, $s0 #N < i, t0 = 1, t0 = 0 (N>i)
	beq $t0, $0, do	# t0 = 0, do	
	j exit
do:
	add $s2, $s2, $s0
	addi $s0, $s0, 1
	j loop
exit:
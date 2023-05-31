li $s0, 0 #i = 0
li $s1, 5 #N = 5
li $s2, 0 #j = 0

sum:
 	addi $s0, $s0, 1
 	add $s2, $s2, $s0
 	bne  $s1, $s0, sum
 
 #in ket qua
 li $v0, 1
move $a0, $s2
syscall




do1:
blt $s0, $s1, do2 #nếu i >= j
mul $s4, $s0, 4 #chuyển s4 =  i / 4 (vì 1 word cách nhau 4 bit)
add $s3, $s3, $s4
sw $s1, ($s3)   #A[i] = j
j exit
do2:
mul $s4, $s0, 4   #Nếu i <j, A[i] = i
add $s3, $s3, $s4
sw $s0, ($s3)
j exit

exit:

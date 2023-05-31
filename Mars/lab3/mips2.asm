.data
var1: .word 23
.text
__start:
lw $t0, var1
li $t1, 5
sw $t1, var1

.data
var1: .word 8
.text
__start:
add $t2, $t3, 3 

addi $t1, $t5, 1

addu $t4, $t3, 5

addiu $t5, $t3, 2

sub $t1, $t4, $t5

subu $t1, $t4, $t5

and $t6, $t1, $t2

andi $t7, $t2, 10

or $t8, $t5, $t3

nor $t1, $t2, $t3


lw $t1, var1

sw $t2, var1

slt $t1, $t2, $t3

slti $t1, $t2, 12

sltu $t1, $t2, $t3

sltiu $t1, $t2, 12

li $v0, 1
li $a0, 123
syscall


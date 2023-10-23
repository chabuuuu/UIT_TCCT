.data 
xuongdong : .asciiz " \n" 
max: .asciiz "Max = " 
min: .asciiz "Min = " 
sum: .asciiz "Sum = " 
vt: .asciiz "F[" 
vt2: .asciiz "] = " 
mangso: .word 100
.text
li $v0, 5
syscall
move $s0, $v0
move $s1, $s0
la $t0, mangso
addi $s3, $s3,9999999
do1:
beq $s1, 0, ndo1
li $v0, 5
syscall
sw $v0, ($t0)
addi $t0,$t0,4 
addi $s1,$s1,-1 
add $s4,$s4,$v0
blt $v0,$s2,skip1
move $s2,$v0
skip1: 
bgt $v0,$s3,skip2 #c?p nh?t min 
move $s3,$v0 #s3 l?u min 
skip2:
j do1
ndo1:
li $v0, 4
la $a0, max
syscall
li $v0, 1
move $a0, $s2
syscall
li $v0, 4
la $a0, xuongdong
syscall
li $v0, 4
la $a0, xuongdong
syscall
li $v0, 4
la $a0, min
syscall
li $v0, 1
move $a0, $s3
syscall
li $v0, 4
la $a0, xuongdong
syscall
li $v0, 4
la $a0, sum
syscall
li $v0, 1
move $a0, $s4
syscall
li $v0, 4
la $a0, xuongdong
syscall
li $v0, 5
syscall
move $s5, $v0
li $v0, 4
la $a0, vt
syscall
li $v0, 1
move $a0, $s5
syscall
li $v0, 4
la $a0, vt2
syscall
mul $s5, $s5, 4
la $t0, mangso
add $t0, $t0, $s5
li $v0, 1
lw $a0, ($t0)
syscall

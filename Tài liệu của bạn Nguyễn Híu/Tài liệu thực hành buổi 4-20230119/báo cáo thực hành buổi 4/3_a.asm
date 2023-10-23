.data
string1: .asciiz "Nhap ki tu: "
string2: .asciiz "\nKi tu truoc: "
string3: .asciiz "\nKi tu sau: "
string4: .asciiz "\ninvalid type"
string5: .asciiz "\nLoai so" 
string6: .asciiz "\nLoai chu"
string7: .asciiz "\nLoai chu hoa"
.text
addi $v0, $zero, 4 
lui $1, 0x00001001
ori $a0, $1, 0
syscall
addi $v0, $zero, 12 
syscall
addi $t0, $v0, 0
slti $t1, $t0, 123 # >122
beq $t1, $zero, end
slti $t1, $t0, 97
bne $t1, $zero, work1
j chu
work1:
slti $t2, $t0, 91
beq $t2, $zero, end
j work2
work2:
slti $t1, $t0, 65 # 58< <64
bne $t1, $zero, work3
j chuhoa
work3:
slti $t2, $t0, 58
beq $t2, $zero, end
j work4
work4:
slti $t1, $t0, 48 # <48
bne $t1, $zero, end
j so
so:
addi $v0, $zero, 4
lui $1, 0x00001001
ori $a0, $1, 55
syscall
j main
chu:
addi $v0, $zero, 4
lui $1, 0x00001001
ori $a0, $1, 64
syscall
j main
chuhoa:
addi $v0, $zero, 4
lui $1, 0x00001001
ori $a0, $1, 74
syscall
j main
main:
addi $v0, $zero, 4 #xuat str2
lui $1, 0x00001001
ori $a0, $1, 13
syscall
addi $a0, $t0, -1
addi $v0, $zero, 11
syscall
addi $v0, $zero, 4 #xuat str3
lui $1, 0x00001001
ori $a0, $1, 28
syscall
addi $a0, $t0, 1
addi $v0, $zero, 11
syscall
addi $a0, $zero, 0
j exit
end:
addi $v0, $zero, 4
lui $1, 0x00001001
ori $a0, $1, 41
syscall
exit:
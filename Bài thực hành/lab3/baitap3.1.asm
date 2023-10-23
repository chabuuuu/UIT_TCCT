.data 

string1: .asciiz "Chao ban! Ban la sinh vien nam thu may?\n"
string2: .asciiz "Hihi, minh la sinh vien nam thu 1 ^_^\n"
string3: .asciiz "\n"
var1: .asciiz ""
.text
main:
li $v0 8
la $a0, var1
li $a1, 10000
syscall


#xuat 2 chuoi
li $v0, 4
la $a0, string1
syscall
li $v0, 4
la $a0, string2
syscall


#in ra dia chi 2 chuoi duoi dang nhi phan
la $t0, string1       # luu dia chi cua chuoi 1
la $t1, string2       # luu dia chi cua chuoi 2

# In dia chi cua chuoi 1
li $v0, 35         # syscall: In dia chi duoi dang nhi phan
move $a0, $t0      # Load dia chi cua chuoi 1 vao $a0
syscall

#in dau xuong dong
la $t3, string3
li $v0, 4
move $a0, $t3
syscall

# In dia chi cua chuoi 2
li $v0, 35         # syscall: In dia chi duoi dang nhi phan
move $a0, $t1      # Load dia chi cua chuoi 2 vao $a0
syscall

#in dau xuong dong
la $t3, string3
li $v0, 4
move $a0, $t3
syscall


#in ra chuoi ban dau da nhap
li $v0, 4
la $a0, var1
syscall


#nhap 2 so a, b, xuat tong
li $v0 5
syscall
move $t5, $v0

li $v0 5
syscall
move $t6, $v0

add $t7, $t5, $t6

li $v0 1
move $a0, $t7
syscall




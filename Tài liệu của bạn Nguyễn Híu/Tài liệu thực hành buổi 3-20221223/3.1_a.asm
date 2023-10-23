.data
string1: .asciiz "Chao ban! Ban la sinh vien nam thu may?\n"
string2: .asciiz "Hihi, minh la sinh vien nam thu 1 ^-^\n"
.text
main:

li $v0,4
la $a0,string1
syscall

li $v0,4
la $a0,string2
syscall

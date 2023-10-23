.data
string0: .asciiz "Nhap: "
string1: .space 20
string2: .asciiz "Xuat: "
.text
main:	li $v0, 4
	la $a0, string0
	syscall
	li $v0, 8
	la $a0, string1
	li $a1, 20
	syscall
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 4
	la $a0,string1
	syscall
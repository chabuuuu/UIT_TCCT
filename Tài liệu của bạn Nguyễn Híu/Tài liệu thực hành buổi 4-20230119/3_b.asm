.data
	str1: .asciiz "Nhap so thu 1: "#16
	str2: .asciiz "\nNhap so thu 2: "#17
	str3: .asciiz "\nSo lon hon: "#14
	str4: .asciiz "\nTong: "#8
	str5: .asciiz "\nHieu: " #8
	str6: .asciiz "\nTich: "#8
	str7: .asciiz "\nThuong: " #10
	str8: .asciiz "\nHai so bang nhau."
.text
	addi $v0, $zero, 4 
	lui $1, 0x00001001
	ori $a0, $1, 0
	syscall
	
	addi $v0, $zero, 5
	syscall
	add $s1, $zero, $v0
	addi $v0, $zero, 4 #xuat str2
	lui $1, 0x00001001
	ori $a0, $1, 16
	syscall
	addi $v0, $zero, 5
	syscall
	add $s2, $zero, $v0
	beq $s1, $s2, bang
	slt $t0, $s1, $s2
	beq $t0, $zero, lon
	addi $v0, $zero, 4 
	lui $1, 0x00001001
	ori $a0, $1, 33
	syscall
	addi $v0, $zero, 1
	addi $a0, $s2, 0
	syscall
	j main
	lon:
	addi $v0, $zero, 4 
	lui $1, 0x00001001
	ori $a0, $1, 33
	syscall
	addi $v0, $zero, 1
	addi $a0, $s1, 0
	syscall
	j main
	bang:
	addi $v0, $zero, 4
	lui $1, 0x00001001
	ori $a0, $1, 81
	syscall
main:
	add $t0, $s1, $s2 #Tong
	addi $v0, $zero, 4 
	lui $1, 0x00001001
	ori $a0, $1, 47
	syscall
	addi $v0, $zero, 1
	addi $a0, $t0, 0
	syscall
	sub $t0, $s1, $s2 #Hieu
	addi $v0, $zero, 4 
	lui $1, 0x00001001
	ori $a0, $1, 55
	syscall
	addi $v0, $zero, 1
	addi $a0, $t0, 0
	syscall
	mul $t0, $s1, $s2 #Tich
	addi $v0, $zero, 4 
	lui $1, 0x00001001
	ori $a0, $1, 63
	syscall
	addi $v0, $zero, 1
	addi $a0, $t0, 0
	syscall
	div $s1, $s2 #Thuong
	mflo $t0
	addi $v0, $zero, 4 
	lui $1, 0x00001001
	ori $a0, $1, 71
	syscall
	addi $v0, $zero, 1
	addi $a0, $t0, 0
	syscall

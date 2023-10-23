.data 
	inputStr: .space 16
	enterString: .asciiz "Nhap Chuoi:"
	outerString: .asciiz "\nXuat Chuoi:"
.text 
	.globl main
	main:
		li $v0,4
		la $a0,enterString
		syscall
		
		li $v0,8 # system call để đọc chuỗi
		la $a0, inputStr #  đưa địa chỉ biến để nhập chuỗi
		li $a1, 16 # chiều dài của biến lưu chuỗi input
		move $t0, $a0 # tạm lưu vào biến tạm để lát in ra sau
		syscall
		
		li $v0,4
		la $a0,outerString
		syscall
		
		la $a0, inputStr
		move $a0, $t0
		li $v0, 4 
		syscall
		
		li $v0, 10
		syscall
	.data
array_a: .word 0:1000
array_b: .byte 0:1000
string1: .asciiz "Nhap so n: \n"
string2: .asciiz "Gia tri lon nhat trong mang A la: \n"
string3: .asciiz "Nhap gia tri m: \n"
string4: .asciiz "\n Tong cac phan tu trong mang B la: \n"
	.text
main:
	la $t0,array_a 
	la $t1,array_b
	la $a0,string1
	li $v0,4 
	syscall
	li $v0,5 
	syscall
	add $t2,$v0,$0
	sll $t3,$t2,2 
	add $t4,$t0,$t3
	Loop_Input_a:
		slt $t5,$t0,$t4
		beq $t5,$0,Exit_Loop_Input_a 
		li $v0,5
		syscall
		sw $v0,0($t0)
		add $t0,$t0,4
		j Loop_Input_a
	Exit_Loop_Input_a:
	
	
	la $a0,string3
	li $v0,4 
	syscall
	li $v0,5 
	syscall
	add $t7,$v0,$0 
	
	add $t4,$t7,$t1
	Loop_Input_b:
		slt $t5,$t1,$t4
		beq $t5,$0,Exit_Loop_Input_b 
		li $v0,5
		syscall
		sb $v0,0($t1)
		add $t1,$t1,1
		j Loop_Input_b
	Exit_Loop_Input_b:
	
	la $t0,array_a
	add $s4,$0,$0 
	sll $t3,$t2,2 
	add $t4,$t0,$t3 
	Loop_max_a:
		slt $t5,$t0,$t4
		beq $t5,$0,Exit_max_a
		lw $s1,0($t0)
		slt $t6,$s4,$s1
		beq $t6,$0, else
		add $s4,$0,$s1				
		else:
		add $t0,$t0,4
		j Loop_max_a
	Exit_max_a:
	
	la $a0,string2
	li $v0,4
	syscall
	add $a0,$s4,$0
	li $v0,1
	syscall
	
	la $t1,array_b
	add $s5,$0,$0 
	add $t4,$t7,$t1
	Loop_sum_b:
		slt $t5,$t1,$t4
		beq $t5,$0,Exit_Loop_sum_b
		lb $s2,0($t1)
		add $s5,$s5,$s2
		add $t1,$t1,1
		j Loop_sum_b
	Exit_Loop_sum_b:
	
	la $a0,string4
	li $v0,4
	syscall
	add $a0,$s5,$0
	li $v0,1
	syscall
	
	# cau c   
	la $t0,array_a
	la $t1,array_b
	add $t3,$0,$0 
	Loop_c1:
		slt $t4, $t3 , $t7
		beq $t4,$0,Exit_c1
		lw $s1, 0($t0)
		sb $s1, 0($t1)
		add $t0,$t0,4
		add $t1,$t1,1
		add $t3,$t3,1
		j Loop_c1
	Exit_c1:
	
	
	
	la $t0,array_b
	addi $t6,$t7,-1
	add $t3,$t0,$t7 
	add $t4,$t0,$t6 
	
	Loop_sort1:
		beq $t0,$t4,Exit_sort1
		addi $t1,$t0,1 
		Loop_sort2:
			beq $t1,$t3,Exit_sort2
			lb $s1,0($t0) 
			lb $s2,0($t1) 
			
			bgt $s2,$s1,increment
			sb $s1,0($t1)
			sb $s2,0($t0)
			
			increment:
				addi $t1,$t1,1
 			j Loop_sort2
		Exit_sort2:
		addi $t0,$t0,1
		j Loop_sort1
	Exit_sort1:
	
	
	
	
	
	
	
	

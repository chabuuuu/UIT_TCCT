.data
array1: .word 5, 6, 7, 8, 1, 2, 3, 9, 10, 4
size1: .word 10
array2: .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
size2: .word 16
array3: .space 8
size3: .word 8
prompt1: .asciiz "Array 1:\n"
prompt2: .asciiz "Array 2:\n"
prompt3: .asciiz "Enter array index (0-9): "
prompt4: .asciiz "Enter element index (0-15): "
result: .asciiz "The corresponding element is: "

.text
main:
    # In ra cửa sổ I/O tất cả các phần tử của mảng array1
    la $t0, array1    # Đưa địa chỉ của array1 vào $t0
    lw $t1, size1    # Load kích thước của array1 vào $t1
    li $v0, 4        # Lệnh in chuỗi
    la $a0, prompt1  # Đưa địa chỉ của prompt1 vào $a0
    syscall
    li $v0, 1        # Lệnh in số nguyên
    move $a0, $t0    # Đưa địa chỉ của array1 vào $a0
    
    add $t5, $zero, $t0   #con trỏ p = địa chỉ nền của mảng A
    loop1:
    	slt $t3, $t5, $t1 #Kiểm tra xem i < size array 1 không. 
    	beq $t3, $zero, exit_loop1  #Nếu i > = size array1 thì thoát vòng lặp
    	sll $t6, $t5, 2  #Dịch trái $t5, ý nghĩa là chuyển đổi số nguyên i sang nhị phân, để sau đó có thể cộng thêm vào địa chỉ của mảng ban đầu ta được a[i]
    	add $t7, $t0, $t6   #Quy đổi sang a[i] bằng cách lấy địa chỉ a[0] + thêm cho bit i * 4
    	lw $a0, 0($t7)    # Load giá trị của array1[i] vào $a0
        syscall          # In giá trị của array1[i]
    	addi $t5, $t5, 1
    	j loop1
    
    exit_loop1:
    # In ra cửa sổ I/O tất cả các phần tử của mảng array2
    la $t0, array2    # Đưa địa chỉ của array1 vào $t0
    lw $t1, size2    # Load kích thước của array1 vào $t1
    li $v0, 4        # Lệnh in chuỗi
    la $a0, prompt2  # Đưa địa chỉ của prompt2 vào $a0
    syscall
    li $v0, 1        # Lệnh in số nguyên
    move $a0, $t0    # Đưa địa chỉ của array2 vào $a0
    
    add $t5, $zero, $zero #bien i
    loop2:
    	slt $t3, $t5, $t1 #Kiểm tra xem i < size array2 không. 
    	beq $t3, $zero, exit_loop2  #Nếu i > = size array1 thì thoát vòng lặp
    	sll $t6, $t5, 0  #Dịch trái $t5, ý nghĩa là chuyển đổi số nguyên i sang nhị phân, để sau đó có thể cộng thêm vào địa chỉ của mảng ban đầu ta được a[i]
    	add $t7, $t0, $t6   #Quy đổi sang a[i] bằng cách lấy địa chỉ a[0] + thêm cho bit i * 4
    	lb $a0, 0($t7)    # Load giá trị của array1[i] vào $a0
        syscall          # In giá trị của array1[i]
    	addi $t5, $t5, 1
    	j loop2
    
    exit_loop2:
    
    
     # Gán giá trị cho mảng array3
    la $t0, array2    # Đưa địa chỉ của array2 vào $t0
    lw $t1, size2    # Load kích thước của array2 vào $t1
    addiu $t1, $t1, -1    # size2 - 1
    la $t2, array3    # Đưa địa chỉ của array3 vào $t2
    li $t3, 0        # Gán biến đếm i = 0
    add $t5, $zero, $zero #bien i
    loop3:
        
        #Thu dung mang
        
        
        slt $t3, $t5, $t1 #Kiểm tra xem i < size array2 không. 
    	beq $t3, $zero, exit_loop3  #Nếu i > = size array1 thì thoát vòng lặp
    	sll $t6, $t5, 0  #Dịch trái $t5, ý nghĩa là chuyển đổi số nguyên i sang nhị phân, để sau đó có thể cộng thêm vào địa chỉ của mảng ban đầu ta được a[i]
    	add $t7, $t0, $t6   #Quy đổi sang a[i] bằng cách lấy địa chỉ a[0] + thêm cho bit i * 4
    	lb $t4, 0($t7)    # Load giá trị của a2[i] vào $t4
    	#Tính t9 = size - 1 - i
    	sub $t9, $t1, $t5
    	
    	#quy đổi size - 1 -1 sang địa chỉ
    	sll $t6, $t9, 0
    	add $t8, $t0, $t6 #Lấy địa chỉ a[0] cộng cho size  - 1 - i đã quy đổi được t8= a2[size - 1- i]
    	#Chuyển thnàh giá trị
    	lb $t8, 0($t8)
    	
    	
    	add $s0, $t8, $t4 #Tính a[i] + a[size - 1 + i]
    	
    	sll $t6, $t5, 0  #Dịch trái $t5, ý nghĩa là chuyển đổi số nguyên i sang nhị phân, để sau đó có thể cộng thêm vào địa chỉ của mảng ban đầu ta được a[i]
    	add $t7, $t2, $t6 
    	
    	sb $s0, 0($t7)
    	addi $t5, $t5, 1
    	j loop3
exit_loop3:       
        
    
li $v0, 4
  la $a0, prompt3
  syscall
  li $v0, 5
  syscall
  move $t0, $v0

  li $v0, 4
  la $a0, prompt4
  syscall
  li $v0, 5
  syscall
  move $t1, $v0

  # Xuat ra phan tu tuong ung
  beq $t0, 1, output_array1
  beq $t0, 2, output_array2
  beq $t0, 3, output_array3
  j end

output_array1:
  la $t0, array1
  sll $t1, $t1, 2
  addu $t0, $t0, $t1
  lw $a0, 0($t0)
  li $v0, 1
  syscall
  j end

output_array2:
  la $t0, array2
  addu $t0, $t0, $t1
  lb $a0, 0($t0)
  li $v0, 1
  syscall
  j end

output_array3:
  la $t0, array3
  addu $t0, $t0, $t1
  lb $a0, 0($t0)
  li $v0, 1
  syscall
  j end

end:
  li $v0, 10
  syscall

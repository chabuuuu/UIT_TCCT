    # Nhập vào một ký tự
    li $v0, 12         # Đặt $v0 = 12 để thực hiện syscall để đọc ký tự
    syscall            # Thực hiện syscall
    
    move $t0, $v0      # Lưu giá trị ký tự nhập vào vào $t0
    
    # Kiểm tra ký tự liền trước và liền sau
    sub $t1, $t0, 1    # Ký tự liền trước: $t1 = $t0 - 1
    add $t2, $t0, 1    # Ký tự liền sau: $t2 = $t0 + 1
    
    # Xuất ra ký tự liền trước và liền sau
    li $v0, 11         # Đặt $v0 = 11 để thực hiện syscall để xuất ký tự
    move $a0, $t1      # Đặt $a0 = $t1 để xuất ký tự liền trước
    syscall            # Thực hiện syscall
    
    move $a0, $t2      # Đặt $a0 = $t2 để xuất ký tự liền sau
    syscall            # Thực hiện syscall
    
    # Kiểm tra loại ký tự nhập vào
    li $t3, 48         # '0' (số)
    li $t4, 96        # ki tu lien truoc "a" (chu thuong)
    li $t5, 64        # ki tu lien truoc 'A' (chữ hoa)
    li $t6, 58 		# ki tu lien sau 9
    li $t7, 91 #ki tu lien sau Z
    li $t8, 123  #ki tu lien sau "z" (chu thuong)
    # So sánh ký tự nhập vào với ba loại ký tự
    blt $t0, $t3, invalid   # Nếu ký tự < '0' thì nó không thuộc ba loại ký tự
    blt $t0, $t6, is_number
    
    bgt $t0, $t5, check_valid_chuhoa
    bgt $t0, $t4, check_valid_chuthuong
    
    
    #Ham invalid:
     li $v0, 4                # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, invalid_type     # Đặt $a0 = địa chỉ chuỗi invalid_type
    syscall  
    j end
    
    
 
is_lowercase:  
    # Ký tự thuộc chữ thường
    li $v0, 4                # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, lowercase        # Đặt $a0 = địa chỉ chuỗi lowercase
    syscall                  # Thực hiện syscall
    j end                    # Nhảy tới kết thúc
    
is_number:
    # Ký tự là số
    li $v0, 4                # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, number           # Đặt $a0 = địa chỉ chuỗi number
    syscall                  # Thực hiện syscall
    j end                    # Nhảy tới kết thúc
is_uppercase:
    # Ký tự là số
    li $v0, 4                # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, uppercase           # Đặt $a0 = địa chỉ chuỗi number
    syscall                  # Thực hiện syscall
    j end                    # Nhảy tới kết thúc

check_valid_chuhoa:
	 blt $t0, $t7, is_uppercase
check_valid_chuthuong:
	blt $t0, $t8, is_lowercase
invalid:
     li $v0, 4                # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, invalid_type     # Đặt $a0 = địa chỉ chuỗi invalid_type
    syscall                  # Thực hiện syscall
    
end:
    .data
lowercase:  .asciiz "Day la chu thuong"
number:     .asciiz "Day la so"
uppercase:  .asciiz "Day la chua hoa"
invalid_type: .asciiz "Invalid type."

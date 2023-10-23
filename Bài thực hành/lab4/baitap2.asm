    # Nhập số thứ nhất
    li $v0, 5           # Đặt $v0 = 5 để thực hiện syscall để đọc số nguyên
    syscall             # Thực hiện syscall
    
    move $t0, $v0       # Lưu giá trị số thứ nhất vào $t0
    
    # Nhập số thứ hai
    li $v0, 5           # Đặt $v0 = 5 để thực hiện syscall để đọc số nguyên
    syscall             # Thực hiện syscall
    
    move $t1, $v0       # Lưu giá trị số thứ hai vào $t1
    
    # Tìm số lớn hơn
    slt $t2, $t1, $t0
    li $t3, 1
    #neu t2 = 1 => so thu hai be hon so thu nhat
    beq $t2, $t3, num0_greater
  #nguoc lai, neu t2 = 0 thi so thu hai lon hon so thu nhat
        # Số thứ hai lớn hơn số thứ nhất
       move $t9, $t1
    li $v0, 4                # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, num1             # Đặt $a0 = địa chỉ chuỗi num1
    syscall                  # Thực hiện syscall
    j calculate
    
    # Nếu hai số bằng nhau
    li $v0, 4                # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, equal            # Đặt $a0 = địa chỉ chuỗi equal
    syscall                  # Thực hiện syscall
    j calculate              # Nhảy tới tính toán tổng, hiệu, tích và thương
	  
num0_greater:
 move $t9, $t0
    # Số thứ nhất lớn hơn số thứ hai
    li $v0, 4               # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    la $a0, num0             # Đặt $a0 = địa chỉ chuỗi num0
    syscall                  # Thực hiện syscall
    j calculate              # Nhảy tới tính toán tổng, hiệu, tích và thương
              
    
calculate:
    # Tính tổng
    add $t2, $t0, $t1        # Tổng = số thứ nhất + số thứ hai
    
    # Tính hiệu
    sub $t3, $t0, $t1        # Hiệu = số thứ nhất - số thứ hai
    
    # Tính tích
    mul $t4, $t0, $t1        # Tích = số thứ nhất * số thứ hai
    
    # Tính thương
    div $t0, $t1             # Thực hiện phép chia số thứ nhất cho số thứ hai
    mflo $t5              # Lưu kết quả thương vào $t5
    
    # Xuất kết quả
    li $v0, 4             # Đặt $v0 = 4 để thực hiện syscall để xuất chuỗi
    
    # In số lớn hơn
    la $a0, greater       # Đặt $a0 = địa chỉ chuỗi greater
    syscall               # Thực hiện syscall
    li $v0, 1
    move $a0, $t9
    syscall
    
    
    li $v0, 4
    # In tổng
    la $a0, sum           # Đặt $a0 = địa chỉ chuỗi sum
    syscall               # Thực hiện syscall
    
    move $a0, $t2         # Đặt $a0 = giá trị tổng ($t2)
    li $v0, 1             # Đặt $v0 = 1 để thực hiện syscall để xuất số nguyên
    syscall               # Thực hiện syscall
    
    # In hiệu
    li $v0, 4
    la $a0, difference    # Đặt $a0 = địa chỉ chuỗi difference
    syscall               # Thực hiện syscall
    
    li $v0, 1
    move $a0, $t3         # Đặt $a0 = giá trị hiệu ($t3)
    syscall               # Thực hiện syscall
    
    li $v0, 4
    # In tích
    la $a0, product       # Đặt $a0 = địa chỉ chuỗi product
    syscall               # Thực hiện syscall
    
    li $v0, 1
    move $a0, $t4         # Đặt $a0 = giá trị tích ($t4)
    syscall               # Thực hiện syscall
    
    li $v0, 4
    # In thương
    la $a0, quotient      # Đặt $a0 = địa chỉ chuỗi quotient
    syscall               # Thực hiện syscall
    li $v0, 1
    move $a0, $t5         # Đặt $a0 = giá trị thương ($t5)
    syscall               # Thực hiện syscall
    j end
end:
    .data
equal:      .asciiz "\n Hai so bang nhau\n"
num0:       .asciiz "\n So thu nhat lon hon so thu hai\n"
num1:       .asciiz "\n So thu hai lon hon so thu nhat.\n"
greater:    .asciiz "\n So lon hon la \n"
sum:        .asciiz "\n Tong: \n"
difference: .asciiz "\n Hieu:  \n"
product:    .asciiz "\n Tich: \n"
quotient:   .asciiz "\n Thuong \n"

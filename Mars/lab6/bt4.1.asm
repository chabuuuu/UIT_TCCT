.data
a: .word 0
b: .word 0
c: .word 0
d: .word 0

.text
main:
    # Khởi tạo giá trị cho a và b
    addiu $t0, $t3, 6
    li $t0, 6
    sw $t0, a
    
    li $t0, 5
    sw $t0, b

    # Tính toán giá trị c = a - b
    lw $t0, a
    lw $t1, b
    sub $t2, $t0, $t1
    sw $t2, c

    # Tính toán giá trị d = a + b
    lw $t0, a
    lw $t1, b
    add $t2, $t0, $t1
    sw $t2, d

    # Kết thúc chương trình
    li $v0, 10
    syscall

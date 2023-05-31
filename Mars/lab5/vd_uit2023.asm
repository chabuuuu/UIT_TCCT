.data
    str: .asciiz "UIT 2023"
    searchChar: .asciiz "2"
    result: .asciiz "Vị trí của '2':"

.text
    main:
        # In ra chuỗi "result"
        li $v0, 4
        la $a0, result
        syscall

        # Lặp qua từng kí tự trong chuỗi "str"
        la $t0, str
    loop:
        lbu $t1, 0($t0)    # Đọc kí tự tại địa chỉ $t0
        beqz $t1, exit     # Nếu đọc được kí tự null '\0', thoát khỏi vòng lặp (đã đi hết chuỗi)

        # So sánh kí tự với "searchChar"
        li $t2, '2'
        beq $t1, $t2, printPosition

        # Tăng địa chỉ để truy cập kí tự tiếp theo trong chuỗi
        addi $t0, $t0, 1
        j loop

    printPosition:
        # In ra vị trí của kí tự "2"
        #move $a0, $t0
        la $t5, str
        sub $t6, $t0, $t5  #Lấy địa chỉ con trỏ trừ đi địa chỉ nền của chuỗi để lấy vị trí kí tự
        move $a0, $t6 #In ra vị trí
        li $v0, 1
        syscall

        # In ra ký tự ':'
        li $v0, 11
        li $a0, ':'
        syscall

        # Tăng địa chỉ để truy cập kí tự tiếp theo trong chuỗi
        addi $t0, $t0, 1
        j loop

    exit:
        # Kết thúc chương trình
        li $v0, 10
        syscall

    # Khởi tạo các giá trị
    li $s0, 5   # i = 5
    li $s1, 5   # j = 5
    li $t0, 10  # g = 10
    li $t1, 3   # h = 3
    
    # So sánh i và j
    bne $s0, $s1, equal  # if (i == j) -> nhảy tới nhãn equal
    
    # i != j
    sub $s2, $t0, $t1    # f = g - h
    j end               # nhảy tới nhãn end
    
equal:
    add $s2, $t0, $t1    # f = g + h
    

end:
li $v0, 1
move $a0, $s2
syscall
lui 
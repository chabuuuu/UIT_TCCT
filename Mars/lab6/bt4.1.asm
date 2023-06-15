.data
a: .word 0
b: .word 0
c: .word 0
d: .word 0

.text
main:
    addiu $t0, $zero, 6 
    sw $t0, a
    
    addiu $t0, $zero, 5
    sw $t0, b


    lw $t0, a
    lw $t1, b
    sub $t2, $t0, $t1
    sw $t2, c
    
    add $t2, $t0, $t1
    sw $t2, d




.data    
xuongdong : .asciiz " \n"   
max: .asciiz "Max = "   
min: .asciiz "Min = "   
sum: .asciiz "Sum = "   
vt: .asciiz "F["   
vt2: .asciiz "] = "   
mangso: .word 100
.text

#Nhập n
li $v0, 5
syscall
move $s0, $v0 #Gán giá trị s0 = v0
move $t9, $v0
move $s1, $s0 #Gán s1 = s0
la $t0, mangso   #Gán địa chỉ của mảng cho $t0
addi $s3, $zero,9999999   #Gán min = 999999


#Nhập mảng n phần tử:
do1:
beq $s1, 0, ndo1  #Nếu s1 = 0 (tức là với s1 = n, s1-- thì s1 = 0 ta thoát vòng lặp)

li $v0, 5 #Nhập giá trị vào v0
syscall

sw $v0, ($t0)  #Gán giá trị của v0 cho thanh ghi có địa chỉ là t0 (a[i[ = v0)
addi $t0,$t0,4    #Tăng con trỏ t0 thêm 4 (vì 1 word có 4)
addi $s1,$s1,-1  #Gỉam s1--

add $s4,$s4,$v0 #Tính tổng sum = s4 = s4 + s0

blt $v0,$s2,skip1     #Cập nhật max (nếu v0 > s2 thì không skip)
move $s2,$v0        #Gán s2 = max = v0
skip1: 

bgt $v0,$s3,skip2 #cập nhật min 
move $s3,$v0 #s3 lưu min 
skip2:

j do1
ndo1:
li $v0, 4
la $a0, max
syscall

li $v0, 1
move $a0, $s2 #In max
syscall


li $v0, 4
la $a0, xuongdong
syscall

li $v0, 4
la $a0, min
syscall

li $v0, 1
move $a0, $s3  #In min
syscall

li $v0, 4
la $a0, xuongdong
syscall

li $v0, 4
la $a0, sum  
syscall

li $v0, 1
move $a0, $s4  #In sum
syscall

li $v0, 4
la $a0, xuongdong
syscall

li $v0, 5  #Nhập vị trí phần tử trong mảng
syscall
move $s5, $v0

li $v0, 4
la $a0, vt  #In F[
syscall

li $v0, 1
move $a0, $s5    # Vị trí của phần tử
syscall

li $v0, 4
la $a0, vt2    #In ]
syscall





mul $s5, $s5, 4
la $t0, mangso
add $t0, $t0, $s5


li $v0, 1
lw $a0, ($t0)
syscall



li $v0, 5
syscall
move $s0, $v0

li $v0, 5
syscall
move $s1, $v0

la $s3, mangso
do_1:
blt $s0, $s1, do_2 #nếu i >= j
mul $s4, $s0, 4 #chuyển s4 =  i / 4 (vì 1 word cách nhau 4 bit)
add $s3, $s3, $s4
sw $s1, ($s3)   #A[i] = j
j exit
do_2:
mul $s4, $s0, 4   #Nếu i <j, A[i] = i
add $s3, $s3, $s4
sw $s0, ($s3)
j exit

exit: 
la $t0, mangso   #Gán địa chỉ của mảng cho $t0
addi $s3, $zero,9999999   #Gán min = 999999

#xuất mảng n phần tử:
xuat:
beq $t9, 0, nxuat  



lb $a0, ($t0)
li $v0, 1
syscall
addi $t0,$t0,4    #Tăng con trỏ t0 thêm 4 (vì 1 word có 4)
addi $t9,$t9,-1  #Gỉam s1--

j xuat
nxuat:


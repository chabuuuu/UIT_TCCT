.data
.text
main:
	li $v0,5
	syscall
	move $t1,$v0
	
	li $v0,5
	syscall
	move $t2,$v0
	
	li $v0,1
	add $a0,$t1,$t2
	syscall
.data
	gameBoard: .byte ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '
	vertical: .byte '|'
	horizontal: .asciiz "-+-+-\n"
	nextLine: .byte '\n'
	
.text
	la $a0, gameBoard
	jal Output
	li $v0, 10
	syscall
Output: #pass address of array in a0
	addi $sp, $sp, -12
	sw $a0, 0($sp)
	sw $s0, 4($sp)
	sw $ra, 8($sp)
	add $s0, $a0, $zero #s0 = base address of array
	jal L1
	la $a0, horizontal
	li $v0, 4
	syscall
	jal L1
	la $a0, horizontal
	li $v0, 4
	syscall
	jal L1
	lw $a0, 0($sp)
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	jr $ra
L1:	addi $sp, $sp, -8
	sw $a0, 0($sp)
	sw $s0, 4($sp)
	lb, $a0, 0($s0) #a0 = char at gameBoard[0]
	li $v0, 11
	syscall #print a0
	lb, $a0, vertical #a0 = vertical line
	syscall #print a0
	addi $s0, $s0, 1
	lb $a0, 0($s0) #a0 = gameBoard[1]
	syscall
	lb, $a0, vertical #a0 = vertical line
	syscall #print a0
	addi $s0, $s0, 1
	lb $a0, 0($s0) #a0 = gameBoard[1]
	syscall	 
	addi $s0, $s0, 1
	lb $a0, nextLine #go to next line
	syscall
	lw $a0, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
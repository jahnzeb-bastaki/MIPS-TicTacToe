.data
	instruction1:	.asciiz "Tic-Tac-Toe\n\n"
	instruction2:	.asciiz "INSTRUCTIONS: PLAYER will take turns with COMPUTER to play a game of Tic-Tac-Toe!\nChoose a cell numbered from 1 to 9 as below and play!\n\n"
	instruction3:	.asciiz "1|2|3\n"
	instruction4:	.asciiz "4|5|6\n"
	instruction5:	.asciiz "7|8|9\n\n"
	instruction6:	.asciiz "PLAYER is X\n"
	instruction7:	.asciiz "COMPUTER is O\n\n"
	breakline:	.asciiz "-\t-\t-\t-\t-\t-\t-\t-\t-\t-\n\n"
	prompt1:   .asciiz "\nThe Computer will now make its move.\n\n" 
	prompt2:   .asciiz "\nYour turn. Pick a space with its corresponding number.\n\n" 
	compWin: .asciiz "The computer won!"
	humanWin: .asciiz "Congratulations! You won the game!"
	tie: .asciiz "The game ended in a tie!"
	gameBoard: .byte ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '
	vertical: .byte '|'
	horizontal: .asciiz "-+-+-\n"
	nextLine: .byte '\n'
	X: .byte 'X'
	O: .byte 'O'
	
.text
	jal printInstruction
	jal moveComp
	jal moveHmn
	jal moveComp
	jal moveHmn
	jal moveComp
	add $a0, $zero, $zero
	jal winner
	jal moveHmn
	li $a0, 1
	jal winner
	jal moveComp
	add $a0, $zero, $zero
	jal winner
	jal moveHmn
	li $a0, 1
	jal winner
	jal moveComp
	add $a0, $zero, $zero
	jal winner
	li $v0, 4
	la $a0, tie
	syscall
END:	li $v0, 10
	syscall


printInstruction:
	li	$v0, 4
	la	$a0, instruction1
	syscall
	la	$a0, instruction2
	syscall
	la	$a0, instruction3
	syscall
	la	$a0, horizontal
	syscall
	la	$a0, instruction4
	syscall
	la	$a0, horizontal
	syscall
	la	$a0, instruction5
	syscall
	la	$a0, instruction6
	syscall
	la	$a0, instruction7
	syscall
	la	$a0, breakline
	syscall
	jr	$ra


moveComp:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $v0, 4
	la $a0, prompt1
	syscall
	#add in computer making a move
	jal Output
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


moveHmn:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $v0, 4
	la $a0, prompt2
	syscall
	#add in human making a move
	jal Output
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


winner:	#pass 0 for comp move, 1 for human
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	#add in winner check
	#if win, say who won and j END
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra


Output: #pass address of array in a0
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)
	la $s0, gameBoard #s0 = base address of array
	jal L1
	la $a0, horizontal
	li $v0, 4
	syscall
	jal L1
	la $a0, horizontal
	li $v0, 4
	syscall
	jal L1
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
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

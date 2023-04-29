.data
newline:		.asciiz "\n"
output1:		.asciiz " | "
output2:		.asciiz "\t\t---+---+---\n"
output3:		.asciiz "\t\t "
instruction1:		.asciiz "\t\tTic-Tac-Toe\n\n"
instruction2:		.asciiz "INSTRUCTIONS: PLAYER will take turns with COMPUTER to play a game of Tic-Tac-Toe!\nChoose a cell numbered from 1 to 9 as below and play!\n\n"
instruction3:		.asciiz "\t\t 1 | 2 | 3  \n"
instruction4:		.asciiz "\t\t 4 | 5 | 6  \n"
instruction5:		.asciiz "\t\t 7 | 8 | 9  \n\n"
instruction6:		.asciiz "PLAYER is X\n"
instruction7:		.asciiz "COMPUTER is O\n\n"
breakline:		.asciiz "-\t-\t-\t-\t-\t-\t-\t-\t-\t-\n\n"
board:			.byte   ' ' , ' ', ' ', ' ' , ' ', ' ', ' ' , ' ', ' '
#board:			.byte	'X' , 'O' , 'X', 'O', 'X', 'O', 'X', 'O', 'X'


.text
main:
	jal printInstruction
	jal displayBoard
	
	# End program
	li	$v0, 10			
	syscall
######################## End of main ###########################

######################## start of displayBoard #################
displayBoard:
	addi	$sp, $sp, -4	# increase stack pointer by 4 bytes
	sw	$ra, 0($sp)	# store return address in stack
	li	$t0, 0		# loop counter = 0
	li	$t1, 2		# loop size = 3
	la	$t2, board	# base address of board
	li	$t3, 0		# offset pointer for board array
loop1:
	# Print output 3
	li	$v0, 4
	la	$a0, output3
	syscall
	# Print the character at relative array position
	jal	printArray
	# Print output1
	li	$v0, 4
	la	$a0, output1
	syscall
	# Print the character at relative array position
	jal	printArray
	# Print output1
	li	$v0, 4
	la	$a0, output1
	syscall
	# Print the character at relative array position
	jal	printArray
	# Print a new line
	li	$v0, 4
	la	$a0, newline
	syscall
	# if t0 == t1 (t1 = 2) then jump to exit1
	beq	$t0, $t1, exit1
	# Print output2
	li	$v0, 4
	la	$a0, output2
	syscall
	# t0 = t + 1
	addi	$t0, $t0, 1
	j	loop1
printArray:
	add	$t4, $t2, $t3	# t4 = offset + base address of array
	lbu	$t4, 0($t4)	# t4 = character at the specified location
	li	$v0, 11		
	la	$a0, ($t4)
	syscall			# print the character on screen
	addi	$t3, $t3, 1	# t3 = t3 + 1
	jr	$ra
exit1:
	lw	$ra, 0($sp)	# pop off register address from stack
	addi	$sp, $sp, 4	# restore stack
	jr	$ra	
######################## End of displayBoard ######################

######################## Start of instructions ######################
printInstruction:
	li	$v0, 4
	la	$a0, instruction1
	syscall
	la	$a0, instruction2
	syscall
	la	$a0, instruction3
	syscall
	la	$a0, output2
	syscall
	la	$a0, instruction4
	syscall
	la	$a0, output2
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
######################## End of instructions ######################
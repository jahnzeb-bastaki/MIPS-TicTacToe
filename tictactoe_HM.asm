
.data 
grid: .word '0' '0' '0' '0' '0' '0' '0' '0' '0'
prompt: .asciiz " \nEnter your mark 'x' or 'o': \n x player: please enter row/col, one player line:\n o player: please enter ow/col, one player line:\n"
input: .asciiz " \n Enter a number between 1-9:"
player1: .asciiz "\nplayer 1, you won! congrate.\nplayer 2 better luck next time.   "
player2: .asciiz " \nplayer 2, you won! congrats. \nplayer 1 better luck next time  "
playAgain: .asciiz "\n thank you for palying, would you like to play again(y/n)? "

.text 
start:
# prompting player 1
la $a0, prompt 
li $v0,4 
syscall 
#checks the player one entery 
li $v0, 12
syscall
#setting the player1 entery 
move $s0,$v0
#setting the player2 entery 
beq $s0,'x',setplayer2
li $s1, 'x'
setplayer2:
li $s1, '0'
la $s2,grid
#display grid
move $a0,$s2
jal gridDisplay 
#creating a loop until one of the palyers win
repeat:
#creating player 1 moves and the play 
move $a0, $s2
move $a1,$s0
jal placeMark 
move $a0, $s2
jal gridDisplay
move $a0,$s2
move $a1, $s0
jal checkWinner 
beq $v0,0,next
li $v0, 4
la $a0,player1
syscall 
#using j next game for if one game is over the next game should start 
j nextGame
next: 
#creating player 2 moves and play 
move $a0,$s2
move $a1, $s2
jal placeMark
move $a0,$s2
jal gridDisplay 
move $a0,$s2
move $a1,$s1
jal checkWinner 
beq $v0,0, repeat 
li $v0,4
la $a0, player2
syscall 
# using j next game for if one game is over the next game should start
j nextGame
nextGame:
la $a0,playAgain
li $v0,4
syscall
li $v0,12 
syscall
beq $v0,'y',start
#the end of the program. using end: to end the program 
end: 
li $v0, 10
syscall
#using display grid to display when the program is run 
gridDisplay:
li $t0, 1
move $t1, $a0
li $t3,3
li $a0,10
li $v0,11
syscall
#using displayloop to display 3*3 grid 
dispLoop:
bgt $t0,9,retDisp
lw $a0, ($t1)
li $v0,11
syscall
div $t0,$t3
mfhi $t2
beqz $t2, nextLine 
#creating a space display 
li $a0,32
li $v0,11
syscall 
addi $t0, $t0,1
addi $t1, $t1,4
j dispLoop
nextLine:
#creating next line display to show the next line that needs to 
li $a0,10
li $v0,11
syscall 
addi $t0,$t0, 1
addi $t1, $t1,4 
j dispLoop 
# takes you back to main screen whichis the start of the game 
retDisp:
jr $ra

#showing on the grid what did the player select 
placeMark:
move $t0, $a0
la $a0,input
li $v0,4 
syscall
li $v0,5
syscall 
addi $v0,$v0,-1
mul $v0, $v0,4
add $t0,$t0,$v0
lw $t1, ($t0)
beq $t1, '0' , change 
jr $ra
change:
sw $a1, ($t0)
jr $ra
# using chckwinner to check who won the game according to the rule 
checkWinner:
move $t0,$a0
li $t1,1
li $v0,1
loop:
bgt $t1,9,ret
lw $t2, ($t0)
#checking each row wisley 
beq $t2,$a1,nextCo12
addi $t0, $t0,4
lw $t2, ($t0)
addi $t1, $t1, 1
beq $t2, $a1, nextCo12
addi $t0, $t0, 4
lw $t2,($t0)
addi $t1, $t1, 1
beq $t2, $a1, nextCo13
li $v0,0
j ret 
#checks each colunms 
nextCo12: 
addi $t0,$t0,4
lw $t2, ($t0)
addi $t1, $t1, 1
beq $t2, $a1, nextCo13
addi $t0, $t0, 8 
lw $t2, ($t0)
addi $t1, $t1, 1
beq $t2, $a1, nextRow
addi $t0,$t0,8
lw $t2, ($t0)
addi $t1, $t1, 1
beq $t2, $a1, nextDiag
nextCo13:
addi $t0, $t0,4
lw $t2, ($t0)
addi $t1, $t1, 1
beq $t2, $a1, ret 
j loop 
nextRow:
addi $t0,$t0,12
lw $t2, ($t0)
addi $t1, $t1,1
beq $t2, $a1, ret
j loop 
# checking evething diagonally 
nextDiag:
addi $t0, $t0, 16
lw $t2,($t0)
addi $t1, $t1,1
beq $t2, $a1, ret
j loop 
ret:
jr $ra
 

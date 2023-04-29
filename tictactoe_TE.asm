

##PRINTING THE BOARD## 

addiu $sp, $sp, -4          #get some stack space 
sw ra, 4($sp)               #store the return register
jal PRINTBRD                #call the print routine , we’ll use our own name for procedure* 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4           #return the same space we allocated


##GETTING THE COMPUTER’S MOVE##
##X -ASSIGNED TO THE COMPUTER## 
##O - ASSIGNED TO THE HUMAN##

li $v0, 4                   #print the prompt for getting the computer’s move
la $a0, MSG2 
syscall 

addiu $sp, $sp, -4          #this gets a word from the stack 
sw $ra, 4($sp)
jal MOVECOMP                #a procedure call that takes the computer’s move
lw $ra, 4($sp)              #loading back the return address 
addiu $sp, $sp, 4 
lb $t0, X                   #loading the ‘X’ character into a register
sb $t0, 0($v0)              #storing the ‘X’ character into an empty square


##SHOWS THE BOARD AFTER COMPUTER’S FIRST MOVE## 
##Second time printing## 

addiu $sp, $sp, -4 
sw ra, 4($sp) 
jal PRINTBRD                #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4

##HUMAN’S TURN TO MAKE A MOVE ## 

addiu $sp, $sp, -4 
sw $ra, 4($sp) 
jal MOVEHMN                 #a procedure call that takes the human’s move
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
lb $t1, O 
sb $t1, 0($v0)              #Printing the O on the board

##BOARD AFTER HUMAN’S FIRST MOVE##
##THIRD TIME PRINTING##

addiu $sp, $sp, -4          #get some stack space 
sw ra, 4($sp)               #store the return register
jal PRINTBRD                #call the print routine , we’ll use our own name for procedure* 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4           #return the same space we allocated


##GETTING THE COMPUTER’S SECOND MOVE##

li $v0, 4                   #print the prompt for getting the computer’s move
la $a0, MSG2 
syscall 

addiu $sp, $sp, -4          #this gets a word from the stack 
sw $ra, 4($sp)
jal MOVECOMP                #this shows the move of the Computer 
lw $ra, 4($sp)              #loading back the return address 
addiu $sp, $sp, 4 
lb $t0, X                   #loading the ‘X’ character into a register
sb $t0, 0($v0)              #storing the ‘X’ character into an empty square

##SHOWS THE BOARD AFTER COMPUTER’S SECOND MOVE## 
##FOURTH time printing## 

addiu $sp, $sp, -4 
sw ra, 4($sp) 
jal PRINTBRD                #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4

##HUMAN’S SECOND MOVE ## 

addiu $sp, $sp, -4 
sw $ra, 4($sp) 
jal MOVEHMN                 #Procedure name for human’s turn 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
lb $t1, O 
sb $t1, 0($v0)              #Printing the O on the board

##BOARD AFTER HUMAN’S SECOND MOVE###
##FIFTH time printing## 

addiu $sp, $sp, -4 
sw ra, 4($sp) 
jal PRINTBRD                #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4

## COMPUTER’S THIRD MOVE##

li $v0, 4                   #print the prompt for getting the computer’s move
la $a0, MSG2 
syscall 

addiu $sp, $sp, -4          #this gets a word from the stack 
sw $ra, 4($sp)
jal MOVECOMP                #this shows the move of the Computer 
lw $ra, 4($sp)              #loading back the return address 
addiu $sp, $sp, 4 
lb $t0, X                   #loading the ‘X’ character into a register
sb $t0, 0($v0)              #storing the ‘X’ character into an empty square

##BOARD AFTER COMPUTER’S THIRD MOVE###
##SIXTH time printing## 

addiu $sp, $sp, -4 
sw ra, 4($sp) 
jal PRINTBRD                #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4

##Since the computer completed its third move, we can now check if there’s a winner##
##We’ll use a procedure for determining the winner## 

addiu $sp, $sp, -4
sw $ra, 4($sp)
jal WINNER                  #a procedure call that distinguishes a winning pattern 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
bnez $v0, W                 #if 0 is being returned, a winner is concluded

##HUMAN’S THIRD MOVE ## 

addiu $sp, $sp, -4 
sw $ra, 4($sp) 
jal MOVEHMN                 #Procedure name for human’s turn 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
lb $t1, O 
sb $t1, 0($v0)              #Printing the O on the board 

##BOARD AFTER HUMAN’S THIRD MOVE###
##SEVENTH time printing## 

addiu $sp, $sp, -4  
sw ra, 4($sp) 
jal PRINTBRD                #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4

##CHECK AGAIN FOR WINNER## 

addiu $sp, $sp, -4
sw $ra, 4($sp)
jal WINNER                  #a procedure call that distinguishes a winning pattern 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
bnez $v0, W                 #if 0 is being returned, a winner is concluded 

## COMPUTER’S FOURTH MOVE##

li $v0, 4                   #print the prompt for getting the computer’s move
la $a0, MSG2 
syscall 

addiu $sp, $sp, -4 #this gets a word from the stack 
sw $ra, 4($sp)
jal MOVECOMP                #this shows the move of the Computer 
lw $ra, 4($sp)              #loading back the return address 
addiu $sp, $sp, 4 
lb $t0, X                   #loading the ‘X’ character into a register
sb $t0, 0($v0)              #storing the ‘X’ character into an empty square

##BOARD AFTER COMPUTER’S FOURTH MOVE###
##EIGHTH time printing## 

addiu $sp, $sp, -4 
sw ra, 4($sp) 
jal PRINTBRD                #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4 

##CHECK AGAIN FOR WINNER## 

addiu $sp, $sp, -4
sw $ra, 4($sp)
jal WINNER                  #a procedure call that distinguishes a winning pattern 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
bnez $v0, W                 #if 0 is being returned, a winner is concluded

##HUMAN’S FOURTH MOVE ## 

addiu $sp, $sp, -4 
sw $ra, 4($sp) 
jal MOVEHMN                 #Procedure name for human’s turn 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
lb $t1, O 
sb $t1, 0($v0)              #Printing the O on the board 

##BOARD AFTER HUMAN’S FOURTH MOVE###
##NINTH time printing## 

addiu $sp, $sp, -4 
sw ra, 4($sp) 
jal PRINTBRD                #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4

##CHECK AGAIN FOR WINNER## 

addiu $sp, $sp, -4
sw $ra, 4($sp)
jal WINNER                  #a procedure call that distinguishes a winning pattern 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
bnez $v0, W                 #if 0 is being returned, a winner is concluded 

## COMPUTER’S FIFTH MOVE##

li $v0, 4                   #print the prompt for getting the computer’s move
la $a0, MSG2 
syscall 

addiu $sp, $sp, -4          #this gets a word from the stack 
sw $ra, 4($sp)
jal MOVECOMP                #this shows the move of the Computer 
lw $ra, 4($sp)              #loading back the return address 
addiu $sp, $sp, 4 
lb $t0, X                   #loading the ‘X’ character into a register
sb $t0, 0($v0)              #storing the ‘X’ character into an empty square

##BOARD AFTER COMPUTER’S FIFTH MOVE###
##TENTH time printing## 

addiu $sp, $sp, -4 
sw ra, 4($sp) 
jal PRINTBRD                  #calling the procedure the 2nd time 
lw $ra, 4($sp)              #restoring the return register
addiu $sp, $sp, 4 

##CHECK AGAIN FOR WINNER## 

addiu $sp, $sp, -4
sw $ra, 4($sp)
jal WINNER                  #a procedure call that distinguishes a winning pattern 
lw $ra, 4($sp) 
addiu $sp, $sp, 4 
bnez $v0, W                 #if 0 is being returned, a winner is concluded 

##PROCEDURES FOR THE GAME WINNER STATUS## 
##After the 5th move is the time to check if the game is a tie##



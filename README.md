#Tic-Tac-Toe

Tic-Tac-Toe Game made our Computer Architecture Class 

.data 

prompt1:   .asciiz "Welcome to a game of Tic-Tac-Toe! Are you ready to play?"
prompt2:   .asciiz "The Computer will now make its first move." 
prompt3:   .asciiz "Your turn. Pick a space with its corresponding number." 

##Board Elements## 

boardNums: .asciiz "0123456789"
line: .byte '|'
tab:  .byte '\n'
X:    .byte 'X'
O:    .byte 'O' 





  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 2

  @ *** your program goes here ***

  @ check for letters (hex)
    CMP R1, #57      @ if (R1 > 57)
    BLS endIf1      @ {
    SUB R1, R1, #7  @   R1 = R1 - 7
  endIf1:           @ }
  
    CMP R2, #57      @ if (R2 > 57)
    BLS endIf2      @ {
    SUB R2, R2, #7  @   R2 = R2 - 7
  endIf2:           @ }
  
    CMP R3, #57      @ if (R3 > 57)
    BLS endIf3      @ {
    SUB R3, R3, #7  @   R3 = R3 - 7
  endIf3:           @ }
  
    CMP R4, #57      @ if (R4 > 57)
    BLS endIf4      @ {
    SUB R4, R4, #7  @   R4 = R4 - 7
  endIf4:           @ }
  
  @ ASCII characters to corresponding decimal integer 
  SUB R1, R1, #48   @ '4' = 4
  SUB R2, R2, #48   @ '3' = 3
  SUB R3, R3, #48   @ '0' = 0
  SUB R4, R4, #48   @ '2' = 2
  
  @ sum of integers times place value
  MOV R0, R1         @ result = 4
  
  MUL R2, R2, R5     @ result = 3 * place value (10)
  ADD R0, R0, R2     @ result = 34
  
  MUL R6, R5, R5     @ place value = base^2
  MUL R3, R3, R6     @ tmp = 0 * place value (100)
  ADD R0, R0, R3     @ result = 34
 
  MUL R6, R6, R5     @ place value = base^3
  MUL R4, R4, R6     @ tmp = 2 * place value (1000)
  ADD R0, R0, R4     @ result = 2034

  @ End of program ... check your result

End_Main:
  BX    lr

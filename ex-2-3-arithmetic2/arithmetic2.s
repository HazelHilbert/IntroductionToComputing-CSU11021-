  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute x^3−4x^2+3x+8 where x is a value in R1

  @ *** your program goes here ***
  MOV   R0, #8      @ result = 8
  
  MOV   R2, #3      @ temp = 3
  MUL   R2, R2, R1  @ temp = 3 * x
  ADD   R0, R0, R2  @ result = 3x + 8
  
  MOV   R2, #4      @ temp = 4
  MUL   R2, R2, R1  @ temp = 4 * x
  MUl   R2, R2, R1  @ temp = 4 * x * x
  SUB   R0, R0, R2  @ result = -4x^2 + 3x + 8
 
  MOV   R2, R1      @ temp = x
  MUL   R2, R2, R1  @ temp = x * x
  MUL   R2, R2, R1  @ temp = x * x * x
  ADD   R0, R2, R0  @ result = x^3 - 4x^2 + 3x + 8
  
  @ End of program ... check your result

End_Main:
  BX    lr

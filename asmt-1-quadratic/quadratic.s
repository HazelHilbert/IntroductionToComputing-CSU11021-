  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write an ARM Assembly Language program to evaluate
  @   ax^2 + bx + c for given values of a, b, c and x

  MUL   R2, R2, R1     @ temp1 = a * x
  MUL   R2, R2, R1     @ temp1 = a * x^2
  MUL   R3, R3, R1     @ temp2 = b * a
  ADD   R0, R2, R3     @ result = ax^2 + bx
  ADD   R0, R0, R4     @ result = ax^2 + bx + c

  @ End of program ... check your result

End_Main:
  BX    lr

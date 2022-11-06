  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute the maximum of the values in R1 and R2

  @ *** your program goes here ***

    CMP   R1, R2      @ if (a >= b)
    BLT   ElseMaxB    @ {
    MOV   R0, R1      @   max = a;
    B     EndMax      @ }
  ElseMaxB:            @ else {
    MOV   R0, R2      @   max = b;
  EndMax:             @ }

  @ End of program ... check your result

End_Main:
  BX    lr

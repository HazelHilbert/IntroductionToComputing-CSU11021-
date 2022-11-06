  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute n! when n is a value in R1

  @ *** your program goes here ***
    MOV R0, #1    @ result = 1
    MOV R2, R1    @ tmp = value
  WhileMul:          
    CMP R2, #1    @ while (tmp > 1)
    BLS EndWhMul     @ {
    MUL R0, R0, R2    @   result = result * tmp
    SUB R2, R2, #1    @   tmp--
    B   WhileMul     @ }
  EndWhMul:

  @ End of program ... check your result

End_Main:
  BX    lr

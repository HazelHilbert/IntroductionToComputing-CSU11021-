  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @ 
  @ Write a program to compute the length of the string
  @   in memory that begins at the address in R1.
  @
  @ Store your result (the length of the string) in R0.
  @

  MOV   R0, #0    @ result = 0;
While:
  LDRB  R2, [R1]
  CMP   R2, #0    @ while ((ch = byte[address]) != 0)
  BEQ   EndWhile  @ {
  ADD   R0, #1    @   result++
  ADD   R1, #1    @   ch++
  B     While     @ }
EndWhile:
 
  @ End of program ... check your result

End_Main:
  BX    lr


  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @
  @ Build and run this program to check that your computer is ready
  @   for the CSU11021 examination
  @

  MOV   R0, #0      @ result = 0;
whSum:
  CMP   R1, #1      @ while (i >= 1)
  BLO   eWhSum      @ {
  ADD   R0, R0, R1  @   result = result + i;
  SUB   R1, R1, #1  @   i = i - 1;
  B     whSum       @ }
eWhSum:

End_Main:
  BX    lr

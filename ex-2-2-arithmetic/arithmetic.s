  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to compute 4x^2+3x
  
  MUL R0, R1, R1    @ result=x*x (x^2)
  MOV R2, #4
  MUL R0, R0, R2    @ result=result*4 (4x^2)
  
  MOV R2, #3
  MUL R2, R1, R2    @ tmp=x*3 (3x)
  
  ADD R0, R0, R2    @ result=result+tmp (4x^2+3x)

  @ End of program ... check your result

End_Main:
  BX    lr

  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Write a program to swap the contents of R0 and R1
  MOV   R2, R0      @ tmp=R0
  MOV   R0, R1      @ R0=R1
  MOV   R1, R2      @ R1=tmp
  @ End of program ... check your result

End_Main:
  BX    lr

.end

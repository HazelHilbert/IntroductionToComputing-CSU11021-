  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  CMP   R1, R2    @ if (a < b)
  BGE   ElseThen  @ {
  MOV   R0, R1    @   r = a;
  B     EndIf     @ }
 ElseThen:        @ else {
  MOV   R0, R2    @   r = b;
 EndIf:            @ }  

  @ End of program ... check your result

End_Main:
  BX    lr

.end
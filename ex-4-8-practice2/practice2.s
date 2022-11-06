  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  CMP   R1, #10    @ if (v < 10)
  BGE   ElseIf1    @ {
  MOV   R0, #1     @   r = 1;
  B     EndIf      @ }
 ElseIf1:
  CMP   R1, #100   @ if (v < 100)
  BGE   ElseIf2   @ {
  MOV   R0, #10     @   r = 10;
  B     EndIf      @ }
 ElseIf2: 
  CMP   R1, #1000  @ if (v < 1000)
  BGE   ElseThen   @ {
  MOV   R0, #100     @   r = 100;
  B     EndIf      @ }
 ElseThen:         @ else {
  MOV   R0, #0     @   r = 0;
 EndIf:            @ }  

  @ End of program ... check your result

End_Main:
  BX    lr

.end
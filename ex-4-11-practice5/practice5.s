  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  MOV   R0, #0     @ else { r = 0;}
  CMP   R1, #'a'   @ if (ch=='a'
  BEQ   Then       @     ||
  CMP   R1, #'e'   @     ch=='e'
  BEQ   Then       @     ||
  CMP   R1, #'i'   @     ch=='i'
  BEQ   Then       @     ||
  CMP   R1, #'o'   @     ch=='o'
  BEQ   Then       @     ||
  CMP   R1, #'u'   @     ch=='u'
  BNE   EndIf      @ )
Then:              @ {
  MOV R0, #1       @  r = 1;
EndIf:             @ }

  @ End of program ... check your result

End_Main:
  BX    lr

.end
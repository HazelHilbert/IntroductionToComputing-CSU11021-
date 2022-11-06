  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  CMP R0, #'A'      @ if (char >= 'A'
  BLO EndIf         @   AND
  CMP R0, #'Z'      @   char <= 'Z')
  BHI EndIf         @ {
  ADD R0, R0, #0x20 @   char = char + 0x20
EndIf:              @ }

  @ End of program ... check your result

End_Main:
  BX    lr

.end
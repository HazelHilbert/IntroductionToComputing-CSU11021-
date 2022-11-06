  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write your program between here ...

  @ Key
  @ R0 -> adrC
  @ R1 -> adrA
  @ R2 -> adrB
  @ R3 -> counter
  @ R4 -> temp
  @ R5 -> tempA/B
  @ R6 -> length
  @ R7 -> counterA/B
  @ R8 -> copyAdrA/B
  @ R9 -> origonalAdrA
  @ R10 -> origonalAdrC


  MOV   R9, R1        @ origonalAdrA = adrA
  MOV   R10, R0        @ origonalAdrC = adrC
  LDR   R6, [R1]      @ length = byte[adrA]
  MOV   R3, R6        @ counter = length
CopySetA:
  CMP   R3, #0        @ while (counter != 0)
  BEQ   EndCopyA      @ {
  ADD   R1, R1, #4    @   adrA += 4
  ADD   R0, R0, #4    @   adrC += 4
  LDR   R4, [R1]      @   temp = byte[adrA]
  LDR   R7, [R2]      @   counterB = byte[adrB]
  MOV   R8, R2        @   copyAdrB = adrB
LoopB:
  CMP   R7, #0        @   while (counterB != 0)
  BEQ   EndLoopB      @   {
  ADD   R8, R8, #4    @   copyAdrB += 4
  LDR   R5, [R8]      @   tempB = byte[adrB]
  CMP   R5, R4        @   if (temp = tempB)
  BNE   continue      @   {
  
  B     duplicate     @     duplicate = true
Continue:             @   }
  SUB   R7, R7, #1    @   counterB--
  B     LoopB         @   }
EndLoopB:     
  STR   R4, [R0]      @   byte[adrC] = temp
  B     notDuplicate
duplicate:            @   if (duplicate) {
  SUB   R0, R0, #4    @     adrC -= 4
  SUB   R6, R6, #1    @     length--
notDuplicate:         @   }
  SUB   R3, R3, #1    @   counter--
  B     CopySetA      @ }
EndCopyA:

  MOV   R1, R9        @ adrA = origonalAdrA
  LDR   R3, [R2]      @ counter = byte[adrB]
  ADD   R6, R6, R3    @ length += counter
CopySetB:
  CMP   R3, #0        @ while (counter != 0)
  BEQ   EndCopyB      @ {
  ADD   R2, R2, #4    @   adrB += 4
  ADD   R0, R0, #4    @   adrC += 4
  LDR   R4, [R2]      @   temp = byte[adrA]
  LDR   R7, [R1]      @   counterA = byte[adrA]
  MOV   R8, R1        @   copyAdrA = adrA
LoopA:
  CMP   R7, #0        @   while (counterA != 0)
  BEQ   EndLoopA      @   {
  ADD   R8, R8, #4    @   copyAdrA += 4
  LDR   R5, [R8]      @   tempA = byte[adrB]
  CMP   R5, R4        @   if (temp = tempA)
  BEQ   duplicateC    @     duplicate = true
  SUB   R7, R7, #1    @   counterA--
  B     LoopA         @   }
EndLoopA:     
  STR   R4, [R0]      @   byte[adrC] = temp
  B     notDuplicateC
duplicateC:           @   if (duplicate) {
  SUB   R0, R0, #4    @     adrC -= 4
  SUB   R6, R6, #1    @     length--
notDuplicateC:        @   }
  SUB   R3, R3, #1    @   counter--
  B     CopySetB      @ }
EndCopyB:

  STR   R6, [R10]     @ byte[origonalAdrC] = length


  @ ... and here.

End_Main:
  BX    LR

  .end

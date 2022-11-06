  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

@
@ Follow the instructions contained in the examination paper
@
@ Your program goes here
@

  @ Key
  @ R0 -> average
  @ R1 -> mode
  @ R2 -> adr
  @ R3 -> size
  @ R4 -> counter
  @ R5 -> sum
  @ R6 -> temp
  @ R7 -> repeats
  @ R8 -> tempRepeats
  @ R9 -> counter2
  @ R10 -> temp2
  @ R11 -> adr2

  LDR   R3, [R2]        @ size = word[adr]
  MOV   R4, #0          @ counter = 0
  MOV   R5, #0          @ sum = 0
  MOV   R7, #0          @ repeats = 0
summation:
  CMP   R3, R4          @ while (size != counter)
  BEQ   endSummation    @ {
  ADD   R2, R2, #4      @   adr += 4
  LDR   R6, [R2]        @   temp = word[adr]
  ADD   R5, R5, R6      @   sum += temp

  MOV   R8, #0          @   tempRepeats = 0
  MOV   R9, R4          @   counter2 = counter
  MOV   R11, R2         @   adr2 = adr
findRepeats:            @
  CMP   R3, R9          @   while (size != counter2)
  BEQ   endFindRepeats  @   {
  LDR   R10, [R11]      @     temp2 = word[adr2]
  CMP   R6, R10         @     if (temp = temp2)
  BNE   notRepeated     @     {
  ADD   R8, R8, #1      @       tempRepeats++
notRepeated:            @     }
  ADD   R11, R11, #4    @     adr2 += 4
  ADD   R9, R9, #1      @     counter2++
  B     findRepeats     @   }
endFindRepeats:

  CMP   R7, R8          @   if (repeats < tempRepeats)
  BHS   noNewMode       @   {
  MOV   R7, R8          @     repeats = tempRepeats
  MOV   R1, R6          @     mode = temp
noNewMode:              @   }

  ADD   R4, R4, #1      @   counter++
  B     summation       @ }
endSummation:
  UDIV  R0, R5, R3      @ average = sum / size


End_Main:
  BX    lr

  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 6

  @
  @ TIP: To view the contents of setC while debugging, you can add
  @      the following watch expression, remembering that the first value
  @      listed should be the size of setC and the remaining values shown
  @      should be the values in the set in memory.
  @
  @      (int [64])setC
  @

  @ *** your program goes here ***

@ Key:
@ R0 -> adrSetC
@ R1 -> adrSetA
@ R2 -> adrSetB
@ R3 -> size
@ R4 -> counter
@ R5 -> temp
@ R6 -> counter2
@ R7 -> temp2
@ R9 -> tempAdrC
@ R10 -> originalAdrSetC
  
  MOV     R10, R0         @ originalAdrSetC = adrSetC

  @ copy setA to setC in memory
  LDR     R3, [R1]        @ size = word[adrSetA]
  MOV     R4, R3          @ counter = size
CopyA:                    @
  CMP     R4, #0          @ while (counter != 0)
  BEQ     EndCopyA        @ {
  ADD     R0, R0, #4      @   adrSetC += 4
  ADD     R1, R1, #4      @   adrSetA += 4
  LDR     R5, [R1]        @   temp = word[adrSetA]
  STR     R5, [R0]        @   word[adrSetC] = temp
  SUB     R4, R4, #1      @   counter--
  B       CopyA           @ }
EndCopyA:

  @ copy setB into memory, disregarding duplicates
  LDR     R4, [R2]        @ counter = word[adrSetB]
CopyB:                    @
  CMP     R4, #0          @ while (counter != 0)
  BEQ     EndCopyB        @ {
  ADD     R0, R0, #4      @   adrSetC += 4
  ADD     R2, R2, #4      @   adrSetB += 4
  LDR     R5, [R2]        @   temp = word[adrSetB]

  @ checks each element of setA against setB
  MOV     R6, R3          @   counter2 = size
  MOV     R9, R10         @   tempAddress = originalAdrSetC
Repeated:                 @
  CMP     R6, #0          @   while (counter2 != 0)
  BEQ     EndRepeated     @   {
  ADD     R9, R9, #4      @     tempAddress += 4
  LDR     R7, [R9]        @     temp2 = word[tempAddress];
  CMP     R5, R7          @     if (temp = temp2)
  BEQ     Duplicate       @       break
  SUB     R6, R6, #1      @     counter2--
  B       Repeated        @   }
EndRepeated:
  
  STR     R5, [R0]        @   word[adrSetC] = temp
  ADD     R3, R3, #1      @   size++
  B       NotDuplicate    @   break
Duplicate:                @
  SUB     R0, R0, #4      @   adrSetC -= 4
NotDuplicate:             @
  SUB     R4, R4, #1      @   counter++
  B       CopyB           @ }
EndCopyB:

  @ null terminate
  ADD     R0, R0, #4      @ adrSetC += 4
  MOV     R5, #0          @ temp = 0
  STR     R5, [R0]        @ word[adrSetC] = temp

  @ store set size in memory
  STR     R3, [R10]       @ word[originalAdrSetC] = size

  @ End of program ... check your result


End_Main:
  BX    lr

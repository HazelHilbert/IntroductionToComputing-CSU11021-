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
  @ R0 -> result
  @ R1 -> adr
  @ R2 -> char
  @ R3 -> number
  @ R4 -> operator
  @ R5 -> digits
  @ R6 -> place
  @ R7 -> base
  @ R8 -> count
  @ R9 -> temp
  @ R10 -> tempAdr
  @ R11 -> continue
  @ R12 -> 0x (little endianess)
  
  MOV   R3, #0          @ number = 0
  MOV   R4, #'+'        @ operator = '+'
  MOV   R5, #0          @ digits = 0
  MOV   R6, #1          @ place = 1
  MOV   R7, #10         @ base = 10
  MOV   R11, #1         @ continue = 1
  LDR   R12, =0x7830    @ 0x = 0x7830
loopExpression:
  CMP   R11, #1         @ while (continue = 1)
  BNE   endExpression   @ {
  LDRB  R2, [R1]        @   char = byte[adr]
  CMP   R2, #0          @   if (char = 0)
  BNE   continue        @   {
  MOV   R11, #0         @     continue = 0
continue:               @   }

  LDRH  R9, [R1]        @   temp = halfword[adr]
  CMP   R9, R12         @   if (temp = 0x)
  BNE   notHex          @   {
  MOV   R7, #16         @     base = 16
  ADD   R1, R1, #1      @     adr++
  B     endElse         @   }
notHex:

  CMP   R2, #'0'        @   if (char < '0')
  BHS   elseNumber      @   {
  MOV   R8, R5          @     count = digits
  MOV   R10, R1         @     tempAdr = adr
loopNumber:             @
  SUB   R10, R10, #1    @     while (count != 0)
  CMP   R8, #0          @     {
  BEQ   endLoopNumber   @       tempAdr--
  LDRB  R9, [R10]       @       temp = byte[tempAdr]
  CMP   R9, #'A'        @       if (temp >= 'A')
  BLO   elseDecimal     @       {
  SUB   R9, R9, #0x37   @         temp -= 0x37
  B     endElseDecimal  @       }
elseDecimal:            @       else {
  SUB   R9, R9, #0x30   @         temp -= 0x30
endElseDecimal:         @       }
  MUL   R9, R9, R6      @       temp *= place
  MUL   R6, R6, R7      @       place *= base
  ADD   R3, R3, R9      @       number += temp
  SUB   R8, R8, #1      @       counter--
  B     loopNumber      @     }
endLoopNumber:
 
  CMP   R4, #'+'        @     if (operator = '+')
  BNE   notAdd          @     {
  ADD   R0, R0, R3      @       result += number
notAdd:                 @     }
  CMP   R4, #'-'        @     if (operator = '-') 
  BNE   notSub          @     {
  SUB   R0, R0, R3      @       result -= number
notSub:                 @     }
  CMP   R4, #'*'        @     if (operator = '*')
  BNE   notMul          @     {
  MUL   R0, R0, R3      @       result *= number
notMul:                 @     }
  MOV   R4, R2          @     operator = char
  MOV   R3, #0          @     number = 0
  MOV   R5, #0          @     digits = 0
  MOV   R6, #1          @     place = 1
  MOV   R7, #10         @     base = 10
  B     endElse         @   }

elseNumber:             @   else {
  ADD   R5, R5, #1      @     digits++
endElse:                @   }

  ADD   R1, R1, #1      @   adr++
  B     loopExpression  @ }
endExpression:

End_Main:
  BX    lr

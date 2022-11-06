  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 4

  @ Key:
  @ R0 -> result
  @ R1 -> n
  @ R2 -> count
  @ R3 -> divisor
  @ R4 -> remainder
  @ R5 -> quotient
  @ WhileLoop -> loops through numbers 2 up to n
  @ CheckPrime -> checks if count is a prime number

  MOV   R0, #0             @ result = 0;

  MOV   R2, #2             @ count = 2;  
WhileLoop:                 @
  CMP   R2, R1             @ while (count < n)
  BHS   EndWhileLoop       @ {
 
  MOV   R3, #2             @   divisor = 2;
  MOV   R4, #1             @   remainder = 1; 
CheckPrime:                @
  CMP   R3, R2             @   while (divisor < count
  BHS   EndCheckPrime      @     &&
  CMP   R4, #0             @     remainder != 0)
  BEQ   EndCheckPrime      @   {
  UDIV   R5, R2, R3        @     quotient = count / divisor
  MUL    R5, R5, R3        @     temp = quotient * divisor
  SUB    R4, R2, R5        @     remainder = count - temp
  ADD   R3, R3, #1         @     divisor = divisor + 1;
  B     CheckPrime         @   }
EndCheckPrime:

  CMP   R4, #0             @   if (remainder != 0)
  BEQ   NotPrime           @   {
  ADD   R0, R0, #1         @     result = result + 1;
NotPrime:                  @   }
 
  ADD   R2, R2, #1         @   count = count + 1;
  B     WhileLoop          @ }
EndWhileLoop:             
  
  @ End of program ... check your result

End_Main:
  BX    lr

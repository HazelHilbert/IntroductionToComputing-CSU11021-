  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 3
  
  @ this program uses the euclidean algorithm to find the GCD of integers a and b
  @ note: the WhileMod loop calculates a % b

WhileGCD:
  CMP   R3, #0          @ while (b != 0)
  BEQ   EndWhileGCD     @ {
  MOV   R4, R3          @   temp = b;
WhileMod:
  CMP   R2, R3          @   while (a >= b)
  BLO   EndWhileMod     @   {
  SUB   R2, R2, R3      @     a = a - b;
  B     WhileMod        @   }
EndWhileMod:          
  MOV   R3, R2          @   b = a;
  MOV   R2, R4          @   a = temp;
  B     WhileGCD        @ }
EndWhileGCD:
  MOV R0, R2            @ result = a;

  @ End of program ... check your result

End_Main:
  BX    lr

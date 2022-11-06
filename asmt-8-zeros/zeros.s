  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 8

  @ *** your program goes here ***

  @ R0 -> longestContiguousZeros
  @ R1 -> value
  @ R2 -> contiguousZeros
  @ R3 -> count

  MOV   R0, #0            @ longestContiguousZeros = 0;
  MOV   R2, #0            @ contiguousZeros = 0;
  MOV   R3, #0            @ count = 0;
while:
  CMP   R3, #32           @ while (count != 32)
  BEQ   endWhile          @ {

  MOVS  R1, R1, LSL #1    @   value = value.LSL(1);
  BCS   else              @   if (carry set) {
  ADD   R2, R2, #1        @     contiguousZeros += 1;
  B     endIf             @   }
else:                     @   else {
  MOV   R2, #0            @     contiguousZeros = 0;
endIf:                    @   }
  
  CMP   R0, R2            @   if (longestContiguousZeros < contiguousZeros)
  BHS   notMore           @   {
  MOV   R0, R2            @     longestContiguousZeros = contiguousZeros;
notMore:                  @   }

  ADD   R3, R3, #1        @   count += 1;
  B     while             @ }
endWhile:

  @ End of program ... check your result

End_Main:
  BX    lr

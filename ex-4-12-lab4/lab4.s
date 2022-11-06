  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ 
  @ If x is a value in R1, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (x >= 5) {
  @   x = 0;
  @ }
  @

  CMP   R1, #5      @ if (x >= 5) 
  BLT   EndIf1      @ {
  MOV   R1, #0      @   x = 0;
EndIf1:             @ }

  @ 
  @ If y is a value in R2, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (y != 0) {
  @   y = y * 2;
  @ }
  @ else {
  @   y = 1;
  @ }
  @

  CMP   R2, #0      @ if (y != 0)
  BEQ   ElseIf2     @ {
  MOV   R7, #2      @    temp = 2;
  MUL   R2, R2, R7  @   y *= temp;
  B     EndIf2      @ }
ElseIf2:            @ else {
  MOV   R2, #0      @   y = 0;
EndIf2:             @ }

  @ 
  @ If z is a value in R3, translate the following pseudocode
  @   into ARM Assembly Langauge
  @
  @ if (z >= 13 && z <= 23) {
  @   z = z - 12;
  @ else if (z == 0) {
  @   z = 12;
  @ }
  @

  CMP   R3, #13       @ if ( z >= 13
  BLT   ElseIf3       @     &&
  CMP   R3, #23       @     z <= 23)
  BGT   ElseIf3       @ {
  SUB   R3, R3, #12   @   z -= 12;
  B     EndIf3        @ }
ElseIf3:               
  CMP   R3, #0        @ else if (z == 0)
  BNE   EndIf3        @ {
  MOV   R3, #12       @   z = 12;
EndIf3:               @ }


  @ 
  @ If a and b are values in R4 and R5, translate the following
  @   pseudocode into ARM Assembly Langauge
  @
  @ while (a >= 5) {
  @   b = b + (2 * a);
  @   a = a - 5;
  @ }
  @

While:
  CMP   R4, #5        @ while (a >= 5)
  BLT   EndWhile      @ {
  MOV   R7, #2        @   temp1 = 2;
  MUL   R6, R4, R7    @   temp2 = a * temp1;
  ADD   R5, R5, R6    @   b = b + temp2;
  SUB   R4, #5        @   a = a - 5;
  B     While         @ }
EndWhile:

End_Main:
  BX    lr

.end
  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 5

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])strA
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&strA
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &strA and length at
  @   least 11. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  @

  @ *** your program goes here ***

  @ genreal aproach: check if the value is positive, negative, or zero and 
  @ store associated ACII character in memory. If the value is negative, 
  @ take the absolute value. Check how many places the value has and add that
  @ to the address in memory so that we can work backwards. Null-terminate the 
  @ string. Finnaly, convert the integer at each place (starting from ones) into
  @ its ACII character and store in memory.

CheckSign:
  CMP   R1, #0            @ if (value > 0)
  BGT   IfPositive        @ {
  CMP   R1, #0            @   temp = '+';
  BLT   IfNegative        @   byte[address] = temp;
  MOV   R2, #'0'          @ }
  STRB  R2, [R0]          @ else if (value < 0)
  B     EndCheckSign      @ {
IfPositive:               @   temp = '-';
  MOV   R2, #'+'          @   byte[address] = temp;
  STRB  R2, [R0]          @   temp = -1;
  B     EndCheckSign      @   value *= -1;
IfNegative:               @ }
  MOV   R2, #'-'          @ else
  STRB  R2, [R0]          @ {
  MOV   R2, #-1           @   temp = '0';
  MUL   R1, R1, R2        @   byte[address] = temp;
EndCheckSign:             @ }
   
  MOV   R2, #10           @ temp = 10;
  MOV   R3, #0            @ place = 0;
  MOV   R4, R1            @ tempValue = value;
Places:                   @
  CMP   R4, #0            @ while (tempValue != 0)
  BEQ   EndPlaces         @ {
  UDIV  R4, R4, R2        @   tempValue /= temp;
  ADD   R3, R3, #1        @   place += 1;
  B     Places            @ }
EndPlaces:
  ADD   R0, R0, R3        @ address += place;
  
  ADD   R0, R0, #1        @ address += 1;
  MOV   R4, #0            @ temp1 = 0; 
  STRB  R4, [R0]          @ byte[address] = temp1;
  SUB   R0, R0, #1        @ address -= 1;

  MOV   R4, R1            @ tempValue = value;
NumbersToASCII:           @
  CMP   R3, #0            @ While (place != 0)
  BEQ   EndNumbersToASCII @ {
  MOV   R5, R4            @   int = tempValue;
  UDIV  R4, R4, R2        @   tempValue /= temp;
  MUL   R4, R4, R2        @   tempValue *= temp;
  SUB   R5, R5, R4        @   int -= tempValue;
  UDIV  R4, R4, R2        @   tempValue /= temp;
  ADD   R5, R5, #'0'      @   int += '0';
  STRB  R5, [R0]          @   byte[address] = int;
  SUB   R0, R0, #1        @   address -= 1;
  SUB   R3, R3, #1        @   place -= 1;
  B     NumbersToASCII    @ }
EndNumbersToASCII:

  @ End of program ... check your result


End_Main:
  BX    lr

  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ Write a program that will reverse a NULL-terminated string stored in
  @   memory. The original string is stored in memory starting at the
  @   address in R1. Your program should store the reversed string in memory
  @   beginning at the address in R0.
  @

  LDRB  R2, [R1]         @ temp = byte[address1];
WhileLength:             @
  CMP   R2, #0           @ while (temp != 0)
  BEQ   EndWhileLength   @ {
  ADD   R1, #1           @   address1 += 1;
  LDRB  R2, [R1]         @   temp = byte[address1];
  B     WhileLength      @ }
EndWhileLength:
 
  SUB   R1, #1           @ address1 -= 1; 
  LDRB  R2, [R1]         @ temp = byte[address1];
  STRB  R2, [R0]         @ byte[address0] = temp;
While:                   @
  CMP   R2, #0           @ while (temp != 0)
  BEQ   EndWhile         @ {
  SUB   R1, #1           @   address1 -= 1;
  ADD   R0, #1           @   address0 += 1;
  LDRB  R2, [R1]         @   temp = byte[address1];
  STRB  R2, [R0]         @   byte[address0] = temp;
  B     While            @ }
EndWhile:

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])strB
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&strB
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &strB and length at
  @   least 11. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  @

  @ End of program ... check your result

End_Main:
  BX    lr


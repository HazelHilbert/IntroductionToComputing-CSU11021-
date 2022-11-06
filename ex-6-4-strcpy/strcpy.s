  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ Write aprogram that will make a copy of a NULL-terminated string stored in
  @   memory. The original string is stored in memory starting at the address
  @   in R1. Store the new copy of the string in memory beginning at the address
  @   in R0.
  @


  LDR   R2, [R1]    @ temp = byte[address1];
  STR   R2, [R0]    @   byte[address0] = temp;
While:              @
  CMP   R2, #0       @ while (temp != 0)
  BEQ   EndWhile    @ {
  ADD   R1, #4      @   address1 += 4;
  ADD   R0, #4      @   address0 += 4;
  LDR   R2, [R1]    @   temp = byte[address1];
  STR   R2, [R0]    @   byte[address0] = temp;
  B     While       @ }
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


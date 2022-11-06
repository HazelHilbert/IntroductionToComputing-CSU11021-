  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  
  @ Follow the instructions in the handout for Assignment 7

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the watch expression to see individual characters: (char[64])newString
  @
  @   OR
  @
  @   Add the watch expression to see the string: (char*)&newString
  @
  @   OR
  @
  @   Open a 'Memory View' specifying the address &newString and length at
  @   least 128. You can open a Memory View with ctrl-shift-p type
  @   'View Memory' (cmd-shift-p on a Mac).
  @

  @ *** your program goes here ***

  @ key
  @ R0 -> adrResult
  @ R1 -> adrOriginal
  @ R2 -> char
  @ R3 -> previousChar
  @ R4 -> adrTemp
  
  MOV   R4, R0          @ adrTemp = adrOriginal
  MOV   R2, #0x20       @ char = " ";
  MOV   R3, #0x41       @ previousChar = 'A';
while:                  @ 
  CMP   R2, #0          @ while (char != 0)
  BEQ   endWhile        @ {
  LDRB  R2, [R1]        @   char = byte[adrOriginal];
  ADD   R1, R1, #1      @   adrOriginal++;

  CMP   R2, #0x41       @   if (char >= 'A')
  BLO   deleteSpace     @   {

  CMP   R2, #0x61       @     if (char < 'a')
  BHS   lowercase       @     {
  ADD   R2, #0x20       @       char += #0x20;
lowercase:              @     }

  CMP   R3, #0x41       @     if (previousChar < "A"
  BHS   notNewWord      @         &&
  CMP   R0, R4          @         adrOriginal != adrTemp)
  BEQ   notNewWord      @     {
  SUB   R2, R2, #0x20   @       char -= #0x20;
notNewWord:             @     }

  STRB  R2, [R0]        @     byte[adrResult] = char;
  ADD   R0, R0, #1      @     adrResult++;
deleteSpace:            @   }

  MOV   R3, R2          @   previousChar = char;
  B     while           @ }
endWhile:
  
  @ null terminate
  MOV   R4, #0          @ temp = 0;
  STR   R4, [R0]        @ word[adrResult] = temp;


  @ End of program ... check your result


End_Main:
  BX    lr

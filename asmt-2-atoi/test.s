  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Init_Test

  .section  .text
  .type     Init_Test, %function
Init_Test:

  @ 2034 (base 10 / decimal)
  LDR   R1, ='4'    @ '4' = 0x34
  LDR   R2, ='3'    @ '3' = 0x33
  LDR   R3, ='0'    @ '0' = 0x30
  LDR   R4, ='2'    @ '2' = 0x32

  LDR   R5, =10     @ base 10 / decimal


  bx    lr

.end
  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Init_Test

  .section  .text

  .type     Init_Test, %function
Init_Test:
  @ Set up a, b, c and d with some test values
  MOV   R1, #1          @ a=1
  MOV   R2, #2          @ b=2
  MOV   R3, #2          @ c=2
  MOV   R4, #3          @ d=3
  bx    lr

.end

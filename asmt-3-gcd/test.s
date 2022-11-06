  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Init_Test

  .section  .text
  .type     Init_Test, %function
Init_Test:

  LDR   R2, =24     @ a = 24
  LDR   R3, =32     @ b = 32

  bx    lr

.end
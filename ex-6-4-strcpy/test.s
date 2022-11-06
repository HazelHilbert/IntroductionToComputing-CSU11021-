  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb

  .global Init_Test
  .global strA
  .global strB

  .section  .text

  .type     Init_Test, %function
Init_Test:

  LDR   R1, =strA
  LDR   R0, =strB
  BX    LR


  .section  .rodata

strA:
  .asciz  "Hello World!"


  .section  .data

strB:
  .space  256

.end
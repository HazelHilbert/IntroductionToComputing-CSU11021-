  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Init_Test
  .section  .text

  .type     Init_Test, %function
Init_Test:
  MOV     R1, #4    @ x
  MOV     R2, #5    @ y
  MOV     R3, #20   @ z
  MOV     R4, #13   @ a
  MOV     R5, #1    @ b

  BX      lr

.end
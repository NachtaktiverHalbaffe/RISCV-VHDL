.globl __start

.text

__start:
  addi x3, x0,8
  NOP
  NOP
  NOP
  NOP
  sw x3,4(x0)
  NOP
  NOP
  NOP
  NOP
  lw x1,4(x0)
  sw x3,4(x3)
  ecall
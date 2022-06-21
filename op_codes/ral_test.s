.globl __start

.text

__start:
  addi x3, x0,8
  NOP
  NOP
  NOP
  NOP
  sw x3,0(x0)
  NOP
  NOP
  NOP
  NOP
  lw x1,0(x0)
  add x2,x1,x1
  ecall
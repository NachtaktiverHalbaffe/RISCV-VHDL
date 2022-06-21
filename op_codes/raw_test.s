.globl __start

.text

__start:
  addi x1, x0,8
  NOP
  NOP
  NOP
  NOP
  addi x2, x0,16
  add x3, x2,x1
  NOP
  NOP
  NOP
  NOP
  sw x3,0(x0)
  ecall
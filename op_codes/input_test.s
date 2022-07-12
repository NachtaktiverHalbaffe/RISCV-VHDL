.globl __start

.text
  
__start:
  li x2, 0 
  li x3,1
  slli x3,x3,28
  addi x4, x3, 8
  addi x5, x3, 12
  sw x2, 0(x3)
  sw x2, 0(x5)
loop:
  lw x2, x5,0
  sw x2, 0(x3)
  sw x2, 0(x4)
  j loop
  ecall
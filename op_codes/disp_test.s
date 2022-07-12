.globl __start

.text
  
__start:
  li x2, 0 
  li x3,1
  slli x3,x3,28
  addi x4, x3, 4
  addi x5, x3, 8
  li x6, 50000
  sw x2, 0(x3)
  sw x2, 0(x4)
loop:
  beq x6, x0, end
  addi x6, x6,-1
  j loop
end: 
  addi x2, x2,1
  sw x2, 0(x3)
  sw x2, 0(x5)
  srli x7, x2, 8
  sw x7, 0(x4)
  li x6, 50000
  j loop
  ecall
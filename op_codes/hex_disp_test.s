.globl __start

.text
  
__start:
  li x2, 0 
  li x3,1
  slli x3,x3,28
  li x4, 25000
  sw x2, 0(x3)
loop:
  beq x4, x0, end
  addi x4, x4,-1
  j loop
end: 
  addi x2, x2,1
  sw x2, 0(x3)
  li x4, 25000
  j loop
  ecall
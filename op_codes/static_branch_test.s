.globl __start

.text
  
__start:
  addi x3, x0,8
  jal ra, add_two
  addi x4, x0,9
  
add_two: 
  addi x3,x3,2
  ret
  ecall
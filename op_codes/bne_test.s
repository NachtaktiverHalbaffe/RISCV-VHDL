.globl __start

.text
  
__start:
  addi x3, x0, 8
  beq x3, x0, srt
  addi x4, x0,9
  j end
srt: 
  addi x3,x3,2
  ret
end: 
  nop
  ecall
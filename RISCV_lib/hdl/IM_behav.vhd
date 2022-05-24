--
-- VHDL Architecture RISCV_lib.IM.behav
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 15:41:47 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee; use ieee.std_logic_1164.all;
library RISCV_lib; use RISCV_lib.all;

ARCHITECTURE behav OF im IS

BEGIN
  
  rom: process(if_pc) is
  begin
    case to_integer(unsigned(if_pc)) is
    when 0 => 
      if_op_Code <= b"000000000001_00000_000_00101_00100_11";  --ADDI x5, x0, 1
    when 1 => 
      if_op_Code <= b"000000000111_00000_000_00110_00100_11";  --ADDI x6, x0, 1
    when 2 => 
      if_op_Code <= b"0000000_00101_00110_000_00111_01100_11"; --ADD x7, x5, x6
    when others => 
      if_op_Code <= b"0000000_00111_00101_000_00111_01100_11"; --ADD x7, x7, x6 
  end case;
  end process rom;
  
  
END ARCHITECTURE behav;





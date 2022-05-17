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
      if_op_Code <= b"00";
    when 1 => 
      if_op_Code <= b"00";
    when 2 => 
      if_op_Code <= b"00";
    when others => 
      if_op_Code <= null;
  end case;
  end process rom;
  
  
END ARCHITECTURE behav;


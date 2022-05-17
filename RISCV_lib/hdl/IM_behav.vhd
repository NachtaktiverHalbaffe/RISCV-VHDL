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

ARCHITECTURE behav OF IM IS

BEGIN
  
  rom: process(PC) is
  begin
    case to_integer(unsigned(PC)) is
    when 0 => 
      OP_Code <= b"00";
    when 1 => 
      OP_Code <= b"00";
    when 2 => 
      OP_Code <= b"00";
    when others => 
      OP_Code <= null;
  end case;
  end process rom;
  
  
END ARCHITECTURE behav;


--
-- VHDL Architecture RISCV_lib.pc_reg.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:54:30 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.all;

architecture behave of pc_reg is
begin
  pc_reg : process (clk, res_n) is
  begin
    if res_n = '0' then
      if_pc <= (others => '0');
    else
      if clk'event and clk = '1' then
        if stall = '0' then
          if_pc <= pc;
        end if;
      end if;
    end if;
  end process pc_reg;
end architecture behave;
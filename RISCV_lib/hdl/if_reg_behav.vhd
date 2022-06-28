--
-- VHDL Architecture RISCV_lib.if_reg.behav
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:52:35 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee; use ieee.std_logic_1164.all;
library RISCV_lib; use RISCV_lib.all;

ARCHITECTURE behav OF if_reg IS
BEGIN
    if_reg: process(clk, res_n, stall) is
    begin
        if res_n = '0' then
            op_code <= (others => '0');
        else
            if clk'event and clk='1' then
              if stall = '0' then
                op_code <= if_op_code;
                dec_next_PC <= next_PC;
              end if;
            end if;
        end if;
    end process if_reg;
END ARCHITECTURE behav;


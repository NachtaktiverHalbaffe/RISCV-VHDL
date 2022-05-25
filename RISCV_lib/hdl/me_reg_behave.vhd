--
-- VHDL Architecture RISCV_lib.me_reg.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:36 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee; use ieee.std_logic_1164.all;
library RISCV_lib; use RISCV_lib.all;

ARCHITECTURE behave OF me_reg IS
BEGIN
    me_reg: process(clk, res_n) is
        begin
            if res_n = '0' then
                wb_data <= (others => '0');
                wb_traget_reg <= (others => '0');
            else
                if clk'event and clk='1' then
                    wb_data <= me_alu_out;
                    wb_traget_reg <= me_target_reg;
                end if;
            end if;
        end process me_reg;
END ARCHITECTURE behave;


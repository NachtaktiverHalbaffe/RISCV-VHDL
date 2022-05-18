--
-- VHDL Architecture RISCV_lib.RF.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:54:46 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee; use ieee.std_logic_1164.all;
library RISCV_lib; use RISCV_lib.all;

ARCHITECTURE behave OF RF IS
    signal registers: rf_storage;

BEGIN
    dec_rs1 <= registers(to_integer(unsigned(sel_rs1)));
    dec_rs2 <= registers(to_integer(unsigned(sel_rs2)));

    wb: process(wb_data,wb_target_reg) is
    begin
        registers(to_integer(unsigned(wb_target_reg)))  <= wb_data;
        registers(to_integer(unsigned(0))) <= (others => '0');
    end process wb;

END ARCHITECTURE behave;


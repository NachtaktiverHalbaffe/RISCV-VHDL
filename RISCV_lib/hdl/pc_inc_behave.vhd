--
-- VHDL Architecture RISCV_lib.pc_inc.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:57:14 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee; use ieee.std_logic_1164.all;
library RISCV_lib; use RISCV_lib.all;

ARCHITECTURE behave OF pc_inc IS
BEGIN
    PC_INC: process(if_pc) is
    begin
        nextPC <= std_logic_vector(unsigned(if_pc)+1);
    PC_INC end process;
END ARCHITECTURE behave;


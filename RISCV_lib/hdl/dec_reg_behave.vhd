--
-- VHDL Architecture RISCV_lib.dec_reg.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:11 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee; use ieee.std_logic_1164.all;
library RISCV_lib; use RISCV_lib.all;

ARCHITECTURE behave OF dec_reg IS
BEGIN
    if_reg: process(clk, res_n) is
    begin
        if res_n = '0' then
            -- TODO how to reset?
        else
            if clk'event and clk='1' then
                ex_alu_mode <= dec_alu_mode;
                
                ex_rs1  <= dec_rs1;

                ex_mux_alu_sel <= dec_mux_alu_sel;
                ex_rs2 <= dec_rs2;
                ex_imm <= dec_imm;

                ex_target_reg <= dec_target_reg; 
            end if;
        end if;
    end process if_reg;
END ARCHITECTURE behave;

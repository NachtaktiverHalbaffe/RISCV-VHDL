--
-- VHDL Architecture RISCV_lib.dec_reg.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:11 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.all;

architecture behave of dec_reg is
begin
  dec_reg : process (clk, res_n) is
  begin
    if res_n = '0' then
      -- Operation modes
      ex_alu_mode <= alu_add;
      ex_mem_mode <= mem_nls;
      -- Registers aand immediates
      ex_rs1 <= (others => '0');
      ex_rs2 <= (others => '0');
      ex_target_reg <= (others => '0');
      ex_mux_alu_sel <= 0;
      ex_imm <= (others => '0');
      -- Forwarding
      ex_mux_fw_rs1_sel <= fwd_reg_data;
      ex_mux_fw_rs2_sel <= fwd_reg_data;
      ex_mux_fw_mem_sel <= fwd_reg_data;
    else
      if clk'event and clk = '1' then
        -- Operation modes
        ex_alu_mode <= dec_alu_mode;
        ex_mem_mode <= dec_mem_mode;
        -- Registers aand immediates
        ex_rs1 <= dec_rs1;
        ex_rs2 <= dec_rs2;
        ex_target_reg <= dec_target_reg;
        ex_mux_alu_sel <= dec_mux_alu_sel;
        ex_imm <= dec_imm;
        -- Forwarding
        ex_mux_fw_rs1_sel <= dec_mux_fw_rs1_sel;
        ex_mux_fw_rs2_sel <= dec_mux_fw_rs2_sel;
        ex_mux_fw_mem_sel <= ex_mux_fw_mem_sel;
      end if;
    end if;
  end process dec_reg;
end architecture behave;
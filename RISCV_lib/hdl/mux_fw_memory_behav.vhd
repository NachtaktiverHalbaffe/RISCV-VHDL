--
-- VHDL Architecture RISCV_lib.mux_fw_memory.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:58:37 05/31/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of mux_fw_memory is
begin
  process (ex_mux_fw_mem_sel, me_rs2_fwd wb_data) is
  begin
    case ex_mux_fw_rs2_sel is
      when fwd_reg_data | fwd_alu_data => me_store_data_fwd <= ex_rs2_fwd;
      when fwd_return_data => me_store_data_fwd <= wb_data;
    end case;
  end process;
end architecture behav;
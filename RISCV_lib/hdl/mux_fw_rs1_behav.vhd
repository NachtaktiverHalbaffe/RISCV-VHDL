--
-- VHDL Architecture RISCV_lib.mux_fw_rs1.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:58:15 05/31/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of mux_fw_rs1 is
begin
  process (ex_mux_fw_rs1_sel, ex_rs1, me_alu_out, wb_data) is
  begin
    case ex_mux_fw_rs1_sel is
      when fwd_reg_data => alu_in_1 <= ex_rs1;
      when fwd_alu_data => alu_in_1 <= me_alu_out;
      when fwd_return_data => alu_in_1 <= wb_data;
    end case;
  end process;
end architecture behav;
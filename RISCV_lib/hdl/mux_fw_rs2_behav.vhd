--
-- VHDL Architecture RISCV_lib.mux_fw_rs2.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:58:26 05/31/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of mux_fw_rs2 is
begin
  process (ex_mux_fw_rs2_sel, ex_rs2, me_alu_out, wb_data) is
  begin
    case ex_mux_fw_rs2_sel is
      when fwd_reg_data => ex_rs2_fwd <= ex_rs2;
      when fwd_alu_data => ex_rs2_fwd <= me_alu_out;
      when fwd_return_data => ex_rs2_fwd <= wb_data;
    end case;
  end process;

end architecture behav;
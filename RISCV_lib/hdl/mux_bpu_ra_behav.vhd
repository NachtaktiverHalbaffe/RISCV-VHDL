--
-- VHDL Architecture RISCV_lib.mux_bpu_ra.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 10:53:36 06/28/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of mux_bpu_ra is
begin

  process (alu_out, ex_jmp_target, mux_bpu_ra_select) is
  begin
    if mux_bpu_ra_select = '1' then
      ex_alu_out <= ex_jmp_target;
    else
      ex_alu_out <= alu_out;
    end if;
  end process;

end architecture behav;
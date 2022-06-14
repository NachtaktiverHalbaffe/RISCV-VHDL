--
-- VHDL Architecture RISCV_lib.mux_fw_rs1.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:58:15 05/31/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of mux_bpu is

begin

  process (dec_sbta_valid, ex_dbta_valid, ex_jmp_target, dec_jmp_target, next_PC) is
  begin
    if dec_sbta_valid = '1' then
      pc <= dec_jmp_target;
    elsif ex_dbta_valid = '1' then
      pc <= ex_jmp_target;
    else
      pc <= next_PC;
    end if;
  end process;

end architecture behav;
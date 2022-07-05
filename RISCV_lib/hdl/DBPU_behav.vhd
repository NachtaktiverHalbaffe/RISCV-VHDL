--
-- VHDL Architecture RISCV_lib.ALU.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:24 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of DBPU is
begin

  -- Calculates jump target of branch
  jmp_target : process (ex_imm, ex_alu_out,ex_sbta,ex_dbpu_addr_sel) is
  begin
    if ex_dbpu_addr_sel = '1' then
      -- Calculate dynamic adress
      ex_jmp_target <= ex_alu_out;
    else
      -- Use adress from SBPU
      ex_jmp_target <= ex_sbta;
    end if;
  end process jmp_target;

  --  Validates if branch executes 
  jmp_valid : process (ex_alu_out, ex_dbpu_mode, ex_alu_mode) is
  begin
    if ex_alu_out(ex_alu_out'right) = '1' and ex_dbpu_mode = '1' then
      ex_dbta_valid <= '1';
    elsif ex_dbpu_mode = '1' and ex_alu_mode = alu_jalr then
      ex_dbta_valid <= '1';
    else
      ex_dbta_valid <= '0';
    end if;
  end process jmp_valid;

end architecture behav;
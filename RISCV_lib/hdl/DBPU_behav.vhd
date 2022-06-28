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
  jmp_target : process (ex_imm, alu_in_1, ex_sbta, ex_dbpu_mode) is
  begin
    if ex_dbpu_mode = '1' then
      -- Calculate dynamic adress
      ex_jmp_target <= std_logic_vector(to_unsigned(to_integer(unsigned(alu_in_1)) + to_integer(unsigned(ex_imm)), 32));
      mux_bpu_ra_select <= '1';
      else
      -- Use adress from SBPU
      ex_jmp_target <= ex_sbta;
    end if;
  end process jmp_target;

  --  Validates if branch executes 
  jmp_valid : process (alu_out) is
  begin
    if alu_out(alu_out'low) = '1' and ex_dbpu_mode = '1' then
      ex_dbta_valid <= '1';
      else
      ex_dbta_valid <= '0';
    end if;
  end process jmp_valid;

end architecture behav;
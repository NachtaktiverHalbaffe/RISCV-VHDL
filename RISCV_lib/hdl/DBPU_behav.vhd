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
signal adress : word;
begin

  -- Select the rightsignal from which the adress for jmp_traget-calculation comes from
  mux_addr : process (ex_dbpu_addr_sel, next_PC, ex_rs1) is
  begin
    if ex_dbpu_addr_sel = '0' then
      addr <= next_PC;
    else
      addr <= ex_rs1;
    end if;
  end process mux_addr;

  -- Calculates jump target of branch
  jmp_target : process (ex_imm, adress, ex_sbta, ex_dbpu_mode) is
  begin
    if ex_dbpu_mode = '1' then
      -- Calculate dynamic adress
      ex_jmp_target <= std_logic_vector(to_unsigned(to_integer(unsigned(adress)) + to_integer(unsigned(ex_imm)), 32));
    else
      -- Use adress from SBPU
      ex_jmp_target <= ex_sbta;
    end if;

  end process jmp_target;

  --   Validates if branch executes 
  jmp_valid : process (ex_alu_out) is
  begin
    if ex_alu_out(ex_alu_out'low) = '1' then
      ex_dbta_valid <= '1';
    else
      ex_dbta_valid <= '0';
    end if;
  end process jmp_valid;

end architecture behav;
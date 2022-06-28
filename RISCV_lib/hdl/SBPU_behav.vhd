--
-- VHDL Architecture RISCV_lib.ALU.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:24 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of SBPU is

begin
  -- Calculates jump target of branch
  jmp_target : process (dec_imm, dec_next_PC, dec_alu_mode) is
    variable jmp_target : integer range 0 to 1024;
  begin
    if dec_alu_mode = alu_jal then
      jmp_target := to_integer(unsigned(dec_imm)) + to_integer(unsigned(dec_next_PC)) + 4;
    else
      jmp_target := to_integer(unsigned(dec_imm)) + to_integer(unsigned(dec_next_PC));
    end if;
    dec_jmp_target <= std_logic_vector(to_unsigned(jmp_target, 32));
  end process jmp_target;

  --   Validates if branch executes 
  jmp_valid : process (sbpu_mode) is
  begin
    if sbpu_mode = '1' then
      dec_sbta_valid <= '1';
    else
      dec_sbta_valid <= '0';
    end if;
  end process jmp_valid;

end architecture behav;
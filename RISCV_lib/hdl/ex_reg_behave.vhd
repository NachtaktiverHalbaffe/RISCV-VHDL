--
-- VHDL Architecture RISCV_lib.ex_reg.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:30 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behave of ex_reg is
begin
  ex_reg : process (clk, res_n) is
  begin
    if res_n = '0' then
      -- ALU
      me_alu_out <= (others => '0');
      -- Memory operations
      me_mem_mode <= mem_nls;
      --   Registers
      me_target_reg <= (others => '0');
    else
      if clk'event and clk = '1' then
        -- ALU
        me_alu_out <= ex_alu_out;
        -- Memory operations
        me_mem_mode <= ex_mem_mode;
        -- Registers
        me_target_reg <= ex_target_reg;
      end if;
    end if;
  end process ex_reg;
end architecture behave;
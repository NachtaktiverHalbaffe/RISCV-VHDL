--
-- VHDL Architecture RISCV_lib.ex_reg.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:30 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behave OF ex_reg IS
BEGIN
if_reg: process(clk, res_n) is
begin
    if res_n = '0' then
        me_target_reg <= (others => '0');
    else
        if clk'event and clk='1' then
            me_alu_out <= ex_alu_out;
            me_target_reg <= ex_target_reg;
        end if;
    end if;
end process if_reg;
END ARCHITECTURE behave;


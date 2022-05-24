--
-- VHDL Architecture RISCV_lib.mux_alu.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:18 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behave OF mux_alu IS
BEGIN
    MUX : process(ex_mux_alu_sel, ex_rs2, ex_imm) is
    begin
        if ex_mux_alu_sel = '0' then
            alu_in_2 <= ex_rs2;
        else
            alu_in_2 <= ex_imm; 
        end if;
    end process;
END ARCHITECTURE behave;


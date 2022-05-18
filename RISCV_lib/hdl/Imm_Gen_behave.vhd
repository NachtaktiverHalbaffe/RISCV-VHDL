--
-- VHDL Architecture RISCV_lib.Imm_Gen.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:54:55 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behave OF Imm_Gen IS
BEGIN
    Imm_Gen: process(imm_type,op_code) is
    begin
        case imm_type is
        when I_Type => 
            dec_imm <= (others => opcode(31));
            dec_imm <= op_code(31 downto 20);
        when S_Type
            dec_imm <= (others => opcode(31));
            dec_imm <= op_code(31 downto 25) & op_code(11 downto 7);
        when B_Type
        when U_Type
        when J_Type
        when others => 
            dec_imm <=(others => '0')

END ARCHITECTURE behave;


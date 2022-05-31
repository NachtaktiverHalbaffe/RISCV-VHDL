--
-- VHDL Architecture RISCV_lib.Imm_Gen.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:54:55 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behave of Imm_Gen is -- TODO reimplementation with fewer MUX possible 
begin
  Imm_Gen : process (dec_imm_type, op_code) is
  begin
    case dec_imm_type is
      when I_Type =>
        dec_imm <= (others => op_code(31));
        dec_imm(11 downto 0) <= op_code(31 downto 20);
      when S_Type =>
        dec_imm <= (others => op_code(31));
        dec_imm(11 downto 0) <= op_code(31 downto 25) & op_code(11 downto 7);
      when B_Type =>
        dec_imm <= (others => op_code(31));
        dec_imm(11 downto 0) <= op_code(7) & op_code(30 downto 25) & op_code(11 downto 8) & '0';
      when U_Type =>
        dec_imm <= op_code;
        dec_imm(11 downto 0) <= (others => '0');
      when J_Type =>
        dec_imm <= (others => op_code(31));
        dec_imm(19 downto 0) <= op_code(19 downto 12) & op_code(20) & op_code(30 downto 21) & '0';
      when R_Type =>
        dec_imm <= (others => '0');
    end case;
  end process Imm_Gen;

end architecture behave;
--
-- VHDL Architecture RISCV_lib.IM.behav
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 15:41:47 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.all;

ARCHITECTURE behav OF im IS
signal op_code_mnemonic : op_code_mnemonics;
BEGIN
 rom: process(if_pc) is
    variable word_pc_int : integer := 0;
    constant rom_content: im_rom_type(0 to 1023) := (
      NOP,
      NOP,
      x"00000113",
      x"00100193",
      x"01c19193",
      x"00a00213",
      x"0021a023",
      x"00020663",
      x"fff20213",
      x"ff9ff06f",
      x"00100113",
      x"0021a023",
      x"00a00213",
      x"fe9ff06f",
      x"00000073",
      others => NOP
    );
  begin
    word_pc_int := to_integer(unsigned(if_pc))/4;
    if word_pc_int < rom_content'right then
      if_im_out <= rom_content(  to_integer(unsigned(if_pc))/4 );
    else
      if_im_out <= NOP;
    end if;
  end process rom;

--   translate: process(if_im_out) is
--    variable sliced_opcode  : std_logic_vector(6 downto 0);
--    variable sliced_rd      : std_logic_vector(4 downto 0);
--    variable sliced_func3   : std_logic_vector(2 downto 0);
--    variable sliced_rs1     : std_logic_vector(4 downto 0);
--    variable sliced_rs2     : std_logic_vector(4 downto 0);
--    variable sliced_func7   : std_logic_vector(6 downto 0);

--  begin
--    sliced_func7 := if_im_out(31 downto 25);
--    sliced_rs2 := if_im_out(24 downto 20);
--    sliced_rs1 := if_im_out(19 downto 15);
--    sliced_func3 := if_im_out(14 downto 12); 
--    sliced_rd := if_im_out(11 downto 7); 
--    sliced_opcode := if_im_out(6 downto 0);
   
--    case sliced_opcode is
--    when b"0010111" =>
--      report "U-type";
--      op_code_mnemonic <= mne_auipc;

--    when b"0110111" =>
--      report "U-type";
--      op_code_mnemonic <= mne_lui;

--   --  when b"1100111" =>
--   --    report "J-type";
--   --    op_code_mnemonic <= mne_jal;

--    when b"1100011" =>
--      report "B-type";
--      case sliced_func3 is
--      when b"000" => op_code_mnemonic <= mne_beq;
--      when b"001" => op_code_mnemonic <= mne_bne;
--      when b"100" => op_code_mnemonic <= mne_blt;
--      when b"101" => op_code_mnemonic <= mne_bge;
--      when b"110" => op_code_mnemonic <= mne_bltu;
--      when b"111" => op_code_mnemonic <= mne_bgeu;
--      when others => report "ERROR: invalid opcode! Unknown func3 data for B-Type opcode";
--      end case;
       
--    when b"0110011" =>
--      report "R-type";
--      case sliced_func7 & sliced_func3 is
--      when b"0000000_000" => op_code_mnemonic <=  mne_add;
--      when b"0100000_000" => op_code_mnemonic <=  mne_sub;
--      when b"0000000_001" => op_code_mnemonic <=  mne_sll;
--      when b"0000000_010" => op_code_mnemonic <=  mne_slt;
--      when b"0000000_011" => op_code_mnemonic <= mne_sltu;
--      when b"0000000_100" => op_code_mnemonic <=  mne_xor;
--      when b"0000000_101" => op_code_mnemonic <=  mne_srl;
--      when b"0100000_101" => op_code_mnemonic <=  mne_sra;
--      when b"0000000_110" => op_code_mnemonic <=   mne_or;
--      when b"0000000_111" => op_code_mnemonic <=  mne_and;
--      when others => report "ERROR: invalid opcode! Unknown func7 or func3 data for R-Type opcode";
--      end case;

--    when b"0000011" =>
--      report "I-type";
--      case sliced_func3 is
--      when b"000" => op_code_mnemonic <=  mne_lb;
--      when b"001" => op_code_mnemonic <=  mne_lh;
--      when b"010" => op_code_mnemonic <=  mne_lw;
--      when b"100" => op_code_mnemonic <= mne_lbu;
--      when b"101" => op_code_mnemonic <= mne_lhu;
--      when others => report "ERROR: invalid opcode! Unknown func3 data for I-Type opcode";
--      end case;
     
--    when b"0010011" =>
--      report "I-type";
--      case sliced_func3 is
--      when b"000" => 
--        if if_im_out = x"00000013" then
--          op_code_mnemonic <=  mne_NOP;
--        else
--          op_code_mnemonic <=  mne_addi;
--        end if;
--      when b"010" => op_code_mnemonic <=  mne_slti;
--      when b"011" => op_code_mnemonic <= mne_sltiu;
--      when b"100" => op_code_mnemonic <=  mne_xori;
--      when b"110" => op_code_mnemonic <=   mne_ori;
--      when b"111" => op_code_mnemonic <=  mne_andi;
--      when b"001" => op_code_mnemonic <=  mne_slli;
--      when b"101" =>
--        if sliced_func7 = b"0000000" then
--          op_code_mnemonic <=  mne_slli;
--        elsif sliced_func7 = b"0100000" then
--          op_code_mnemonic <=  mne_slli;
--        else
--          report "ERROR: invalid opcode! Unknown func7 data for I-Type opcode";
--        end if;
--      when others => report "ERROR: invalid opcode! Unknown func7 data for I-Type opcode";
--      end case;

--     when b"1100111" =>
--      report "I-type";
--      if sliced_func3 = b"000" then
--        op_code_mnemonic <=  mne_jalr;
--      else
--         op_code_mnemonic <= mne_jal;
--      end if;

--    when b"0100011" =>
--      report "S-type";
--      case sliced_func3 is
--      when b"000" => op_code_mnemonic <=  mne_sb;
--      when b"001" => op_code_mnemonic <=  mne_sh;
--      when b"010" => op_code_mnemonic <=  mne_sw;
--      when others => report "ERROR: invalid opcode! Unknown func3 data for S-Type opcode";
--      end case;

--    when others => report "ERROR: invalid opcode!";
--    end case;

     
--  end process translate;

END ARCHITECTURE behav;

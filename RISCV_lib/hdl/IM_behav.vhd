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
    constant rom_content: im_rom_type := (
      b"000000000001_00000_000_00101_00100_11",  --ADDI x5, x0, 1
      b"000000000111_00000_000_00110_00100_11",  --ADDI x6, x0, 7
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00101_00110_000_00111_01100_11", --ADD x7, x5, x6
      b"000000000010_00000_000_00101_00100_11",  --ADDI x5, x0, 2
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11", --NOP
      b"0000000_00000_00000_000_00000_01100_11" --NOP
    );
  begin
    word_pc_int := to_integer(unsigned(if_pc))/4;
    if word_pc_int < rom_content'right then
      if_im_out <= rom_content(  to_integer(unsigned(if_pc))/4 );
    else
      if_im_out <= b"0000000_00000_00000_000_00000_01100_11"; --NOP
    end if;
  end process rom;

  translate: process(if_op_code) is
    variable sliced_opcode  : std_logic_vector(6 downto 0);
    variable sliced_rd      : std_logic_vector(4 downto 0);
    variable sliced_func3   : std_logic_vector(2 downto 0);
    variable sliced_rs1     : std_logic_vector(4 downto 0);
    variable sliced_rs2     : std_logic_vector(4 downto 0);
    variable sliced_func7   : std_logic_vector(6 downto 0);

  begin
    sliced_func7 := if_op_code(31 downto 25);
    sliced_rs2 := if_op_code(24 downto 20);
    sliced_rs1 := if_op_code(19 downto 15);
    sliced_func3 := if_op_code(14 downto 12); 
    sliced_rd := if_op_code(11 downto 7); 
    sliced_opcode := if_op_code(6 downto 0);
    
    case sliced_opcode is
    when b"0010111" =>
      report "U-type";
      op_code_mnemonic <= mne_auipc;

    when b"0110111" =>
      report "U-type";
      op_code_mnemonic <= mne_lui;

    when b"1100111" =>
      report "J-type";
      op_code_mnemonic <= mne_jal;

    when b"1100011" =>
      report "B-type";
      case sliced_func3 is
      when b"000" => op_code_mnemonic <= mne_beq;
      when b"001" => op_code_mnemonic <= mne_bne;
      when b"100" => op_code_mnemonic <= mne_blt;
      when b"101" => op_code_mnemonic <= mne_bge;
      when b"110" => op_code_mnemonic <= mne_bltu;
      when b"111" => op_code_mnemonic <= mne_bgeu;
      when others => report "ERROR: invalid opcode! Unknown func3 data for B-Type opcode";
      end case;
        
    when b"0110011" =>
      report "R-type";
      case sliced_func7 & sliced_func3 is
      when b"0000000_000" => op_code_mnemonic <=  mne_add;
      when b"0100000_000" => op_code_mnemonic <=  mne_sub;
      when b"0000000_001" => op_code_mnemonic <=  mne_sll;
      when b"0000000_010" => op_code_mnemonic <=  mne_slt;
      when b"0000000_011" => op_code_mnemonic <= mne_sltu;
      when b"0000000_100" => op_code_mnemonic <=  mne_xor;
      when b"0000000_101" => op_code_mnemonic <=  mne_srl;
      when b"0100000_101" => op_code_mnemonic <=  mne_sra;
      when b"0000000_110" => op_code_mnemonic <=   mne_or;
      when b"0000000_111" => op_code_mnemonic <=  mne_and;
      when others => report "ERROR: invalid opcode! Unknown func7 or func3 data for R-Type opcode";
      end case;

    when b"0000011" =>
      report "I-type";
      case sliced_func3 is
      when b"000" => op_code_mnemonic <=  mne_lb;
      when b"001" => op_code_mnemonic <=  mne_lh;
      when b"010" => op_code_mnemonic <=  mne_lw;
      when b"100" => op_code_mnemonic <= mne_lbu;
      when b"101" => op_code_mnemonic <= mne_lhu;
      when others => report "ERROR: invalid opcode! Unknown func3 data for I-Type opcode";
      end case;
      
    when b"0010011" =>
      report "I-type";
      case sliced_func3 is
      when b"000" => op_code_mnemonic <=  mne_addi;
      when b"010" => op_code_mnemonic <=  mne_slti;
      when b"011" => op_code_mnemonic <= mne_sltiu;
      when b"100" => op_code_mnemonic <=  mne_xori;
      when b"110" => op_code_mnemonic <=   mne_ori;
      when b"111" => op_code_mnemonic <=  mne_andi;
      when b"001" => op_code_mnemonic <=  mne_slli;
      when b"101" =>
        if sliced_func7 = b"0000000" then
          op_code_mnemonic <=  mne_slli;
        elsif sliced_func7 = b"0100000" then
          op_code_mnemonic <=  mne_slli;
        else
          report "ERROR: invalid opcode! Unknown func7 data for I-Type opcode";
        end if;
      when others => report "ERROR: invalid opcode! Unknown func7 data for I-Type opcode";
      end case;

    --when b"1100111" =>
    --  report "I-type";
    --  if sliced_func3 = b"000" then
    --    op_code_mnemonic <=  mne_jalr;
    --  else
    --    report "ERROR: invalid opcode! Unknown func3 data for I-Type opcode";
    --  end if;

    when b"0100011" =>
      report "S-type";
      case sliced_func3 is
      when b"000" => op_code_mnemonic <=  mne_sb;
      when b"001" => op_code_mnemonic <=  mne_sh;
      when b"010" => op_code_mnemonic <=  mne_sw;
      when others => report "ERROR: invalid opcode! Unknown func3 data for S-Type opcode";
      end case;

    when others => report "ERROR: invalid opcode!";
    end case;

      
  end process translate;

END ARCHITECTURE behav;
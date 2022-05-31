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
      if_op_code <= rom_content(  to_integer(unsigned(if_pc))/4 );
    else
      if_op_code <= b"0000000_00000_00000_000_00000_01100_11"; --NOP
    end if;
  end process rom;

END ARCHITECTURE behav;
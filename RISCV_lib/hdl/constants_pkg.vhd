--
-- VHDL Package Header RISCV_lib.constants
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 15:32:52 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE constants IS
  ------------------------------------------
  -- CONSTANTS
  ------------------------------------------
  constant WORD_WIDTH: integer := 32;
  
  ------------------------------------------
  -- ISA
  ------------------------------------------ 
  constant NOP: bit_vector :=b"00000" ;
  ------------------------------------------
  -- Types
  ------------------------------------------
  -- word in memory
  subtype word is std_logic_vector(WORD_WIDTH-1 downto 0);
  
END constants;


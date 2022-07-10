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
  constant BYTE_WIDTH: integer := 8;
  constant REG_NUM: integer := 32;
  constant MEM_SIZE: integer := 1024;
  
  -- Opcodes for insertion 
  constant NOP: std_logic_vector := x"0000_0013"; 

  -- Reserved Mem Addresses 
  constant HEX_DISP_ADDR    : std_logic_vector  := x"1000_0000";  
  constant LEDS_RED_ADDR    : std_logic_vector  := x"1000_0004";  
  constant LEDS_GREEN_ADDR  : std_logic_vector  := x"1000_0008";  
  constant KEYS_ADDR        : std_logic_vector  := x"1000_000c";  
  constant SWITCHES_ADDR    : std_logic_vector  := x"1000_0010";  
  


  


END constants;


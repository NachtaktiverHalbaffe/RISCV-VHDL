-- VHDL Entity RISCV_lib.riscv.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 13:55:27 07/19/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY IEEE;
USE ieee.std_logic_1164.all;
LIBRARY RISCV_lib;
USE RISCV_lib.constants.all;
USE RISCV_lib.data_types.all;

ENTITY riscv IS
   PORT( 
      clk        : IN     std_logic;
      keys       : IN     keys_type;
      miso_i     : IN     std_logic;
      res_n      : IN     std_logic;
      cs_bo      : OUT    std_logic;
      hex_disp0  : OUT    hex_disp_type;
      hex_disp1  : OUT    hex_disp_type;
      hex_disp2  : OUT    hex_disp_type;
      hex_disp3  : OUT    hex_disp_type;
      leds_green : OUT    leds_green_type;
      leds_red   : OUT    leds_red_type;
      sclk_o     : OUT    std_logic
   );

-- Declarations

END riscv ;


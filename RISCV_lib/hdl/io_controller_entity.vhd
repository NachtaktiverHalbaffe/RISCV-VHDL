-- VHDL Entity RISCV_lib.io_controller.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 12:49:53 07/05/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
LIBRARY RISCV_lib;
USE RISCV_lib.constants.all;
USE RISCV_lib.data_types.all;
USE RISCV_lib.isa.all;

ENTITY io_controller IS
   PORT( 
      clk               : IN     std_logic;
      ex_alu_out        : IN     word;
      ex_mem_mode       : IN     mem_mode;
      me_store_data_fwd : IN     word;
      res_n             : IN     std_logic;
      addr_reserved     : OUT    std_logic;
      hex_disp0         : OUT    hex_disp_type;
      hex_disp1         : OUT    hex_disp_type;
      hex_disp2         : OUT    hex_disp_type;
      hex_disp3         : OUT    hex_disp_type;
      leds_red          : OUT    leds_red_type;
      leds_green        : OUT    leds_green_type;
      keys              : IN     keys_type;
      io_data_out       : OUT    word
   );

-- Declarations

END io_controller ;


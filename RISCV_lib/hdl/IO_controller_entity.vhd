LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
LIBRARY RISCV_lib;
USE RISCV_lib.constants.all;
USE RISCV_lib.data_types.all;
USE RISCV_lib.isa.all;

ENTITY io_contoller IS
   PORT( 
      clk               : IN     std_logic;
      res_n             : IN     std_logic;
      ex_alu_out        : IN     word;
      ex_mem_mode       : IN     mem_mode;
      me_store_data_fwd : IN     word;
      io_data_out       : OUT    word;
      addr_reserved     : OUT    std_logic;
      hex_disp0         : OUT    hex_disp_type; 
      hex_disp1         : OUT    hex_disp_type;
      hex_disp2         : OUT    hex_disp_type;
      hex_disp3         : OUT    hex_disp_type 
      --leds_red          : OUT    leds_red; 
      --leds_green        : OUT    leds_green;
      --keys              : IN     keys;
      --switches          : IN     switches
   );
END io_contoller;
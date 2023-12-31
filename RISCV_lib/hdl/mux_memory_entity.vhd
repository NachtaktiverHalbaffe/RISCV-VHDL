-- VHDL Entity RISCV_lib.mux_memory.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 11:58:04 07/05/22
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

ENTITY mux_memory IS
   PORT( 
      addr_reserved : IN     std_logic;
      io_data_out   : IN     word;
      me_alu_out    : IN     word;
      me_load_data  : IN     word;
      me_mem_mode   : IN     mem_mode;
      me_me_out     : OUT    word
   );

-- Declarations

END mux_memory ;


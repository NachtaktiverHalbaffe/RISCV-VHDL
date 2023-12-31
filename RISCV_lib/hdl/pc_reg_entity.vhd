-- VHDL Entity RISCV_lib.pc_reg.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 18:24:59 06/21/22
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

ENTITY pc_reg IS
   PORT( 
      clk   : IN     std_logic;
      pc    : IN     word;
      res_n : IN     std_logic;
      stall : IN     std_logic;
      if_pc : OUT    word
   );

-- Declarations

END pc_reg ;


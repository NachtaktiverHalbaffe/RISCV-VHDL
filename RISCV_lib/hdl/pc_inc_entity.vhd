-- VHDL Entity RISCV_lib.pc_inc.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 17:47:52 05/17/22
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

ENTITY pc_inc IS
   PORT( 
      if_pc   : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      next_PC : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );

-- Declarations

END pc_inc ;

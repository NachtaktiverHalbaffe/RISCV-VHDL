-- VHDL Entity RISCV_lib.mux_nop.interface
--
-- Created:
--          by - tzndirr.meyer (pc084)
--          at - 14:36:45 06/14/22
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

ENTITY mux_nop IS
   PORT( 
      dec_stba_valid : IN     std_logic;
      ex_dbta_valid  : IN     std_logic;
      if_im_out      : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      if_op_code     : OUT    word
   );

-- Declarations

END mux_nop ;


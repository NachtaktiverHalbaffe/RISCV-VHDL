-- VHDL Entity RISCV_lib.SBPU.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 11:43:07 06/28/22
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

ENTITY SBPU IS
   PORT( 
      dec_alu_mode   : IN     alu_mode_type;
      dec_imm        : IN     word;
      dec_next_PC    : IN     word;
      sbpu_mode      : IN     std_logic;
      dec_jmp_target : OUT    word;
      dec_sbta_valid : OUT    std_logic
   );

-- Declarations

END SBPU ;


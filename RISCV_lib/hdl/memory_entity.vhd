-- VHDL Entity RISCV_lib.Memory.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 15:18:17 05/31/22
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

ENTITY Memory IS
   PORT( 
      me_alu_out        : IN     word;
      me_mem_mode       : IN     mem_mode;
      me_store_data_fwd : IN     word;
      sig0              : OUT    std_logic
   );

-- Declarations

END Memory ;


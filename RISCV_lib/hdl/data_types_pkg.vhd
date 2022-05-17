--
-- VHDL Package Header RISCV_lib.data_types
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:09:23 05/17/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.constants.all;

package data_types is

  ------------------------------------------
  -- Types
  ------------------------------------------
  -- word in memory
  subtype word is std_logic_vector(WORD_WIDTH - 1 downto 0);

  ------------------------------------------
  -- Signals
  ------------------------------------------

  -- Determines the operation for alu
  type alu_mode is (alu_add, alu_sub,
    alu_sll, alu_srl, alu_sra, alu_sll, alu_srl,
    alu_and, alu_sub, alu_xor,
    alu_slt, alu_sltu,
    alu_jal, alu_jalr, alu_bew, alu_bne, alu_blt, alu_bge, alu_bltu, alu_bgeu
  );
  -- Dtermines memory operation mode
  type mem_mode is (lb, lh, lw, lbu, lhu, sb, sh, sw);

  -- Determines rf
  type rf_storage is array(1 to REG_NUM) of std_logic_vector(WORD_WIDTH - 1 downto 0);
end data_types;
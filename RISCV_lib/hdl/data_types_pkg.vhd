--
-- VHDL Package Header RISCV_lib.data_types
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:09:23 05/17/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
PACKAGE data_types IS
  
  ------------------------------------------
  -- Types
  ------------------------------------------
  -- word in memory
  subtype word is std_logic_vector(WORD_WIDTH-1 downto 0);
  
  ------------------------------------------
  -- Signals
  ------------------------------------------
  
  -- Determines the operation for alu
  type alu_mode is (alu_add,alu_sub,
                    alu_sll,alu_srl, alu_sra, alu_sll, alu_srl, 
                    alu_and, alu_sub, alu_xor, 
                    alu_slt, alu_sltu,
                    alu_jal, alu_jalr, alu_bew, alu_bne, alu_blt, alu_bge, alu_bltu, alu_bgeu
                  );
  -- Dtermines memory operation mode
  type mem_mode is (lb, lh, lw, lbu, lhu, sb, sh ,sw);
END data_types;

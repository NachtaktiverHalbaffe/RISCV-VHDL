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
  -- Data types
  ------------------------------------------
  -- word in memory
  subtype word is std_logic_vector(WORD_WIDTH - 1 downto 0);
  type rf_storage_type is array(0 to REG_NUM - 1) of std_logic_vector(WORD_WIDTH - 1 downto 0);
  type imm_type is (R_Type, I_Type, S_Type, B_Type, U_Type, J_Type);

  ------------------------------------------
  -- Operation Modes
  ------------------------------------------

  -- Determines the operation for alu
  type alu_mode_type is (
    alu_add, alu_sub,
    alu_sll, alu_srl, alu_sra,
    alu_and, alu_or, alu_xor,
    alu_slt, alu_sltu,
    alu_jal, alu_jalr, alu_beq, alu_bne, alu_blt, alu_bge, alu_bltu, alu_bgeu
  );
  -- Determines memory operation mode
  type mem_mode is (mem_lb, mem_lh, mem_lw, mem_lbu, mem_lhu, mem_sb, mem_sh, mem_sw, mem_nls);

  ------------------------------------------
  -- Adress types
  ------------------------------------------
  -- Determines rf
  subtype rf_storage_addr is std_logic_vector(4 downto 0);
  -- Sets the forwarding mode of an forwarding multiplexer. 
  type fwd_sel is (
    -- Data from an register is used (rs1 ord rs2)
    fwd_reg_data,
    -- Data from an ALU operation is used
    fwd_alu_data,
    -- Data from a ISA command at the writeback stage is used
    fwd_return_data);

end data_types;
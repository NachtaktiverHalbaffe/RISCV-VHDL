--
-- VHDL Package Header RISCV_lib.ISA
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:21:44 05/17/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
package ISA is
  ------------------------------------------
  -- ISA
  ------------------------------------------ 
  constant NOP : std_logic_vector := b"00000";

  ------------------------------------------
  -- arithmetic operations
  ------------------------------------------
  constant isa_arith_direct_op : std_logic_vector := b"0110011";
  constant isa_arith_imm_op : std_logic_vector := b"0010011";

  -- Basic calculations
  constant isa_add_func3 : std_logic_vector := b"000";
  constant isa_sub_func3 : std_logic_vector := b"000";
  constant isa_add_func7 : std_logic_vector := b"0000000";
  constant isa_sub_func7 : std_logic_vector := b"0100000";

  -- Shift operations
  constant isa_sll_func3 : std_logic_vector := b"001";
  constant isa_srl_func3 : std_logic_vector := b"011";
  constant isa_sra_func3 : std_logic_vector := b"011";
  constant isa_slt_func3 : std_logic_vector := b"010";
  constant isa_sltu_func3 : std_logic_vector := b"011";
  constant isa_sra_func7 : std_logic_vector := b"0100000";
  -----------------------------------------
  -- logical operations
  -----------------------------------------
  constant isa_log_direct_op : std_logic_vector := b"0110011";
  constant isa_log_imm_op : std_logic_vector := b"0010011";

  constant isa_xor_func3 : std_logic_vector := b"100";
  constant isa_or_func3 : std_logic_vector := b"110";
  constant isa_and_func3 : std_logic_vector := b"111";

  constant isa_xor_func7 : std_logic_vector := b"100";
  constant isa_or_func7 : std_logic_vector := b"110";
  constant isa_and_func7 : std_logic_vector := b"111";

  -----------------------------------------
  -- branch operation
  -----------------------------------------
  constant isa_bra_op : std_logic_vector := b"1100011";

  constant isa_beq_func3 : std_logic_vector := b"000";
  constant isa_bne_func3 : std_logic_vector := b"001";
  constant isa_blt_func3 : std_logic_vector := b"100";
  constant isa_bge_func3 : std_logic_vector := b"101";
  constant isa_bltu_func3 : std_logic_vector := b"110";
  constant isa_bgeu_func3 : std_logic_vector := b"111";

  ----------------------------------------
  -- memory operations
  ----------------------------------------
  constant isa_store_op : std_logic_vector := b"0100011";
  constant isa_load_op : std_logic_vector := b"0000011";

  -- load operations
  constant isa_lb_func3 : std_logic_vector := b"000";
  constant isa_lh_func3 : std_logic_vector := b"001";
  constant isa_lw_func3 : std_logic_vector := b"010";
  constant isa_lbu_func3 : std_logic_vector := b"100";
  constant isa_lhu_func3 : std_logic_vector := b"101";

  -- store operations
  constant isa_sb_func3 : std_logic_vector := b"000";
  constant isa_sh_func3 : std_logic_vector := b"001";
  constant isa_sw_func3 : std_logic_vector := b"010";

  ----------------------------------------
  -- Misc
  ----------------------------------------
  constant isa_jal_op : std_logic_vector := b"1101111";

  constant isa_jalr_op : std_logic_vector := b"1100111";
  constant isa_jalr_func3 : std_logic_vector := b"000";

  constant isa_lui_op : std_logic_vector := b"0110111";
  constant isa_auipc_op : std_logic_vector := b"0010111";

  constant isa_ecall_op : std_logic_vector := b"1110011";
end ISA;
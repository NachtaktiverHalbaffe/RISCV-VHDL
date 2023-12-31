-- VHDL Entity RISCV_lib.decoder.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 11:14:51 07/05/22
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

ENTITY decoder IS
   PORT( 
      ex_dbta_valid      : IN     std_logic;
      ex_mem_mode        : IN     mem_mode;
      ex_target_reg      : IN     rf_storage_addr;
      me_mem_mode        : IN     mem_mode;
      me_target_reg      : IN     rf_storage_addr;
      op_code            : IN     word;
      dec_alu_mode       : OUT    alu_mode_type;
      dec_dbpu_addr_sel  : OUT    std_logic;
      dec_dbpu_mode      : OUT    std_logic;
      dec_imm_type       : OUT    imm_type;
      dec_mem_mode       : OUT    mem_mode;
      dec_mux_alu_sel    : OUT    std_logic;
      dec_mux_fw_mem_sel : OUT    fwd_sel;
      dec_mux_fw_rs1_sel : OUT    fwd_sel;
      dec_mux_fw_rs2_sel : OUT    fwd_sel;
      dec_target_reg     : OUT    rf_storage_addr;
      sbpu_mode          : OUT    std_logic;
      sel_rs1            : OUT    rf_storage_addr;
      sel_rs2            : OUT    rf_storage_addr;
      stall              : OUT    std_logic
   );

-- Declarations

END decoder ;


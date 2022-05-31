-- VHDL Entity RISCV_lib.dec_reg.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 15:25:54 05/31/22
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

ENTITY dec_reg IS
   PORT( 
      clk                : IN     std_logic;
      dec_alu_mode       : IN     alu_mode_type;
      dec_imm            : IN     word;
      dec_mem_mode       : IN     mem_mode;
      dec_mux_fw_mem_sel : IN     fwd_sel;
      dec_mux_fw_rs1_sel : IN     fwd_sel;
      dec_mux_fw_rs2_sel : IN     fwd_sel;
      dec_mux_memory     : IN     std_logic;
      dec_rs1            : IN     word;
      dec_rs2            : IN     word;
      dec_target_reg     : IN     rf_storage_addr;
      res_n              : IN     std_logic;
      ex_alu_mode        : OUT    alu_mode_type;
      ex_imm             : OUT    word;
      ex_mem_mode        : OUT    mem_mode;
      ex_mux_alu_sel     : OUT    std_logic;
      ex_mux_fw_mem_sel  : OUT    fwd_sel;
      ex_mux_fw_rs1_sel  : OUT    fwd_sel;
      ex_mux_fw_rs2_sel  : OUT    fwd_sel;
      ex_rs1             : OUT    word;
      ex_rs2             : OUT    word;
      ex_target_reg      : OUT    rf_storage_addr
   );

-- Declarations

END dec_reg ;


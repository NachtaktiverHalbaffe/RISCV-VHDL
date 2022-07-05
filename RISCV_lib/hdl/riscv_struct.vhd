--
-- VHDL Architecture RISCV_lib.riscv.struct
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 12:36:27 07/05/22
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library RISCV_lib;
use RISCV_lib.constants.all;
use RISCV_lib.data_types.all;
use RISCV_lib.isa.all;
architecture struct of riscv is

  -- Architecture declarations

  -- Internal signal declarations
  signal alu_in_1 : word;
  signal alu_in_2 : word;
  signal dec_alu_mode : alu_mode_type;
  signal dec_dbpu_addr_sel : std_logic;
  signal dec_dbpu_mode : std_logic;
  signal dec_imm : word;
  signal dec_imm_type : imm_type;
  signal dec_jmp_target : word;
  signal dec_mem_mode : mem_mode;
  signal dec_mux_alu_sel : std_logic;
  signal dec_mux_fw_mem_sel : fwd_sel;
  signal dec_mux_fw_rs1_sel : fwd_sel;
  signal dec_mux_fw_rs2_sel : fwd_sel;
  signal dec_next_PC : word;
  signal dec_rs1 : word;
  signal dec_rs2 : word;
  signal dec_sbta_valid : std_logic;
  signal dec_target_reg : rf_storage_addr;
  signal ex_alu_mode : alu_mode_type;
  signal ex_alu_out : word;
  signal ex_dbpu_addr_sel : std_logic;
  signal ex_dbpu_mode : std_logic;
  signal ex_dbta_valid : std_logic;
  signal ex_imm : word;
  signal ex_jmp_target : word;
  signal ex_mem_mode : mem_mode;
  signal ex_mux_alu_sel : std_logic;
  signal ex_mux_fw_mem_sel : fwd_sel;
  signal ex_mux_fw_rs1_sel : fwd_sel;
  signal ex_mux_fw_rs2_sel : fwd_sel;
  signal ex_next_PC : word;
  signal ex_rs1 : word;
  signal ex_rs2 : word;
  signal ex_rs2_fwd : word;
  signal ex_sbta : word;
  signal ex_target_reg : rf_storage_addr;
  signal if_im_out : word;
  signal if_op_code : word;
  signal if_pc : word;
  signal me_alu_out : word;
  signal me_load_data : word;
  signal me_me_out : word;
  signal me_mem_mode : mem_mode;
  signal me_store_data_fwd : word;
  signal me_target_reg : rf_storage_addr;
  signal next_PC : word;
  signal op_code : word;
  signal pc : word;
  signal sbpu_mode : std_logic;
  signal sel_rs1 : rf_storage_addr;
  signal sel_rs2 : rf_storage_addr;
  signal stall : std_logic;
  signal wb_data : word;
  signal wb_traget_reg : rf_storage_addr;
  -- Component Declarations
  component ALU
    port (
      alu_in_1 : in word;
      alu_in_2 : in word;
      ex_alu_mode : in alu_mode_type;
      ex_alu_out : out word
    );
  end component;
  component DBPU
    port (
      ex_alu_mode : in alu_mode_type;
      ex_alu_out : in word;
      ex_dbpu_addr_sel : in std_logic;
      ex_dbpu_mode : in std_logic;
      ex_imm : in word;
      ex_next_PC : in word;
      ex_sbta : in word;
      ex_dbta_valid : out std_logic;
      ex_jmp_target : out word
    );
  end component;
  component Imm_Gen
    port (
      dec_imm_type : in imm_type;
      op_code : in word;
      dec_imm : out word
    );
  end component;
  component Memory
    port (
      clk : in std_logic;
      ex_alu_out : in word;
      ex_mem_mode : in mem_mode;
      me_store_data_fwd : in word;
      res_n : in std_logic;
      me_load_data : out word
    );
  end component;
  component RF
    port (
      clk : in std_logic;
      res_n : in std_logic;
      sel_rs1 : in rf_storage_addr;
      sel_rs2 : in rf_storage_addr;
      wb_data : in word;
      wb_traget_reg : in rf_storage_addr;
      dec_rs1 : out word;
      dec_rs2 : out word
    );
  end component;
  component SBPU
    port (
      dec_imm : in word;
      dec_next_PC : in word;
      sbpu_mode : in std_logic;
      dec_jmp_target : out word;
      dec_sbta_valid : out std_logic
    );
  end component;
  component dec_reg
    port (
      clk : in std_logic;
      dec_alu_mode : in alu_mode_type;
      dec_dbpu_addr_sel : in std_logic;
      dec_dbpu_mode : in std_logic;
      dec_imm : in word;
      dec_jmp_target : in word;
      dec_mem_mode : in mem_mode;
      dec_mux_alu_sel : in std_logic;
      dec_mux_fw_mem_sel : in fwd_sel;
      dec_mux_fw_rs1_sel : in fwd_sel;
      dec_mux_fw_rs2_sel : in fwd_sel;
      dec_next_PC : in word;
      dec_rs1 : in word;
      dec_rs2 : in word;
      dec_target_reg : in rf_storage_addr;
      res_n : in std_logic;
      ex_alu_mode : out alu_mode_type;
      ex_dbpu_addr_sel : out std_logic;
      ex_dbpu_mode : out std_logic;
      ex_imm : out word;
      ex_mem_mode : out mem_mode;
      ex_mux_alu_sel : out std_logic;
      ex_mux_fw_mem_sel : out fwd_sel;
      ex_mux_fw_rs1_sel : out fwd_sel;
      ex_mux_fw_rs2_sel : out fwd_sel;
      ex_next_PC : out word;
      ex_rs1 : out word;
      ex_rs2 : out word;
      ex_sbta : out word;
      ex_target_reg : out rf_storage_addr
    );
  end component;
  component decoder
    port (
      ex_dbta_valid : in std_logic;
      ex_mem_mode : in mem_mode;
      ex_target_reg : in rf_storage_addr;
      me_mem_mode : in mem_mode;
      me_target_reg : in rf_storage_addr;
      op_code : in word;
      dec_alu_mode : out alu_mode_type;
      dec_dbpu_addr_sel : out std_logic;
      dec_dbpu_mode : out std_logic;
      dec_imm_type : out imm_type;
      dec_mem_mode : out mem_mode;
      dec_mux_alu_sel : out std_logic;
      dec_mux_fw_mem_sel : out fwd_sel;
      dec_mux_fw_rs1_sel : out fwd_sel;
      dec_mux_fw_rs2_sel : out fwd_sel;
      dec_target_reg : out rf_storage_addr;
      sbpu_mode : out std_logic;
      sel_rs1 : out rf_storage_addr;
      sel_rs2 : out rf_storage_addr;
      stall : out std_logic
    );
  end component;
  component ex_reg
    port (
      clk : in std_logic;
      ex_alu_out : in word;
      ex_mem_mode : in mem_mode;
      ex_mux_fw_mem_sel : in fwd_sel;
      ex_target_reg : in rf_storage_addr;
      res_n : in std_logic;
      me_alu_out : out word;
      me_mem_mode : out mem_mode;
      me_target_reg : out rf_storage_addr
    );
  end component;
  component if_reg
    port (
      clk : in std_logic;
      if_op_code : in word;
      next_PC : in word;
      res_n : in std_logic;
      stall : in std_logic;
      dec_next_PC : out word;
      op_code : out word
    );
  end component;
  component im
    port (
      if_pc : in word;
      res_n : in std_logic;
      if_im_out : out word
    );
  end component;
  component me_reg
    port (
      clk : in std_logic;
      me_me_out : in word;
      me_target_reg : in rf_storage_addr;
      res_n : in std_logic;
      wb_data : out word;
      wb_traget_reg : out rf_storage_addr
    );
  end component;
  component mux_alu
    port (
      ex_imm : in word;
      ex_mux_alu_sel : in std_logic;
      ex_rs2_fwd : in word;
      alu_in_2 : out word
    );
  end component;
  component mux_bpu
    port (
      dec_jmp_target : in word;
      dec_sbta_valid : in std_logic;
      ex_dbta_valid : in std_logic;
      ex_jmp_target : in word;
      next_PC : in word;
      pc : out word
    );
  end component;
  component mux_fw_memory
    port (
      ex_mux_fw_mem_sel : in fwd_sel;
      ex_rs2_fwd : in word;
      me_me_out : in word;
      me_store_data_fwd : out word
    );
  end component;
  component mux_fw_rs1
    port (
      ex_mux_fw_rs1_sel : in fwd_sel;
      ex_rs1 : in word;
      me_alu_out : in word;
      wb_data : in word;
      alu_in_1 : out word
    );
  end component;
  component mux_fw_rs2
    port (
      ex_mux_fw_rs2_sel : in fwd_sel;
      ex_rs2 : in word;
      me_alu_out : in word;
      wb_data : in word;
      ex_rs2_fwd : out word
    );
  end component;
  component mux_memory
    port (
      me_alu_out : in word;
      me_load_data : in word;
      me_mem_mode : in mem_mode;
      me_me_out : out word
    );
  end component;
  component mux_nop
    port (
      dec_sbta_valid : in std_logic;
      ex_dbta_valid : in std_logic;
      if_im_out : in word;
      if_op_code : out word
    );
  end component;
  component pc_inc
    port (
      if_pc : in word;
      next_PC : out word
    );
  end component;
  component pc_reg
    port (
      clk : in std_logic;
      pc : in word;
      res_n : in std_logic;
      stall : in std_logic;
      if_pc : out word
    );
  end component;

  -- Optional embedded configurations
  -- pragma synthesis_off
  for all : ALU use entity RISCV_lib.ALU;
  for all : DBPU use entity RISCV_lib.DBPU;
  for all : Imm_Gen use entity RISCV_lib.Imm_Gen;
  for all : Memory use entity RISCV_lib.Memory;
  for all : RF use entity RISCV_lib.RF;
  for all : SBPU use entity RISCV_lib.SBPU;
  for all : dec_reg use entity RISCV_lib.dec_reg;
  for all : decoder use entity RISCV_lib.decoder;
  for all : ex_reg use entity RISCV_lib.ex_reg;
  for all : if_reg use entity RISCV_lib.if_reg;
  for all : im use entity RISCV_lib.im;
  for all : me_reg use entity RISCV_lib.me_reg;
  for all : mux_alu use entity RISCV_lib.mux_alu;
  for all : mux_bpu use entity RISCV_lib.mux_bpu;
  for all : mux_fw_memory use entity RISCV_lib.mux_fw_memory;
  for all : mux_fw_rs1 use entity RISCV_lib.mux_fw_rs1;
  for all : mux_fw_rs2 use entity RISCV_lib.mux_fw_rs2;
  for all : mux_memory use entity RISCV_lib.mux_memory;
  for all : mux_nop use entity RISCV_lib.mux_nop;
  for all : pc_inc use entity RISCV_lib.pc_inc;
  for all : pc_reg use entity RISCV_lib.pc_reg;
  -- pragma synthesis_on
begin

  -- Instance port mappings.
  U_7 : ALU
  port map(
    alu_in_1 => alu_in_1,
    alu_in_2 => alu_in_2,
    ex_alu_mode => ex_alu_mode,
    ex_alu_out => ex_alu_out
  );
  U_18 : DBPU
  port map(
    ex_alu_mode => ex_alu_mode,
    ex_alu_out => ex_alu_out,
    ex_dbpu_addr_sel => ex_dbpu_addr_sel,
    ex_dbpu_mode => ex_dbpu_mode,
    ex_imm => ex_imm,
    ex_next_PC => ex_next_PC,
    ex_sbta => ex_sbta,
    ex_dbta_valid => ex_dbta_valid,
    ex_jmp_target => ex_jmp_target
  );
  U_9 : Imm_Gen
  port map(
    dec_imm_type => dec_imm_type,
    op_code => op_code,
    dec_imm => dec_imm
  );
  U_12 : Memory
  port map(
    clk => clk,
    ex_alu_out => ex_alu_out,
    ex_mem_mode => ex_mem_mode,
    me_store_data_fwd => me_store_data_fwd,
    res_n => res_n,
    me_load_data => me_load_data
  );
  U_5 : RF
  port map(
    clk => clk,
    res_n => res_n,
    sel_rs1 => sel_rs1,
    sel_rs2 => sel_rs2,
    wb_data => wb_data,
    wb_traget_reg => wb_traget_reg,
    dec_rs1 => dec_rs1,
    dec_rs2 => dec_rs2
  );
  U_19 : SBPU
  port map(
    dec_imm => dec_imm,
    dec_next_PC => dec_next_PC,
    sbpu_mode => sbpu_mode,
    dec_jmp_target => dec_jmp_target,
    dec_sbta_valid => dec_sbta_valid
  );
  U_6 : dec_reg
  port map(
    clk => clk,
    dec_alu_mode => dec_alu_mode,
    dec_dbpu_addr_sel => dec_dbpu_addr_sel,
    dec_dbpu_mode => dec_dbpu_mode,
    dec_imm => dec_imm,
    dec_jmp_target => dec_jmp_target,
    dec_mem_mode => dec_mem_mode,
    dec_mux_alu_sel => dec_mux_alu_sel,
    dec_mux_fw_mem_sel => dec_mux_fw_mem_sel,
    dec_mux_fw_rs1_sel => dec_mux_fw_rs1_sel,
    dec_mux_fw_rs2_sel => dec_mux_fw_rs2_sel,
    dec_next_PC => dec_next_PC,
    dec_rs1 => dec_rs1,
    dec_rs2 => dec_rs2,
    dec_target_reg => dec_target_reg,
    res_n => res_n,
    ex_alu_mode => ex_alu_mode,
    ex_dbpu_addr_sel => ex_dbpu_addr_sel,
    ex_dbpu_mode => ex_dbpu_mode,
    ex_imm => ex_imm,
    ex_mem_mode => ex_mem_mode,
    ex_mux_alu_sel => ex_mux_alu_sel,
    ex_mux_fw_mem_sel => ex_mux_fw_mem_sel,
    ex_mux_fw_rs1_sel => ex_mux_fw_rs1_sel,
    ex_mux_fw_rs2_sel => ex_mux_fw_rs2_sel,
    ex_next_PC => ex_next_PC,
    ex_rs1 => ex_rs1,
    ex_rs2 => ex_rs2,
    ex_sbta => ex_sbta,
    ex_target_reg => ex_target_reg
  );
  U_4 : decoder
  port map(
    ex_dbta_valid => ex_dbta_valid,
    ex_mem_mode => ex_mem_mode,
    ex_target_reg => ex_target_reg,
    me_mem_mode => me_mem_mode,
    me_target_reg => me_target_reg,
    op_code => op_code,
    dec_alu_mode => dec_alu_mode,
    dec_dbpu_addr_sel => dec_dbpu_addr_sel,
    dec_dbpu_mode => dec_dbpu_mode,
    dec_imm_type => dec_imm_type,
    dec_mem_mode => dec_mem_mode,
    dec_mux_alu_sel => dec_mux_alu_sel,
    dec_mux_fw_mem_sel => dec_mux_fw_mem_sel,
    dec_mux_fw_rs1_sel => dec_mux_fw_rs1_sel,
    dec_mux_fw_rs2_sel => dec_mux_fw_rs2_sel,
    dec_target_reg => dec_target_reg,
    sbpu_mode => sbpu_mode,
    sel_rs1 => sel_rs1,
    sel_rs2 => sel_rs2,
    stall => stall
  );
  U_8 : ex_reg
  port map(
    clk => clk,
    ex_alu_out => ex_alu_out,
    ex_mem_mode => ex_mem_mode,
    ex_mux_fw_mem_sel => ex_mux_fw_mem_sel,
    ex_target_reg => ex_target_reg,
    res_n => res_n,
    me_alu_out => me_alu_out,
    me_mem_mode => me_mem_mode,
    me_target_reg => me_target_reg
  );
  U_2 : if_reg
  port map(
    clk => clk,
    if_op_code => if_op_code,
    next_PC => next_PC,
    res_n => res_n,
    stall => stall,
    dec_next_PC => dec_next_PC,
    op_code => op_code
  );
  U_1 : im
  port map(
    if_pc => if_pc,
    res_n => res_n,
    if_im_out => if_im_out
  );
  U_10 : me_reg
  port map(
    clk => clk,
    me_me_out => me_me_out,
    me_target_reg => me_target_reg,
    res_n => res_n,
    wb_data => wb_data,
    wb_traget_reg => wb_traget_reg
  );
  U_11 : mux_alu
  port map(
    ex_imm => ex_imm,
    ex_mux_alu_sel => ex_mux_alu_sel,
    ex_rs2_fwd => ex_rs2_fwd,
    alu_in_2 => alu_in_2
  );
  U_20 : mux_bpu
  port map(
    dec_jmp_target => dec_jmp_target,
    dec_sbta_valid => dec_sbta_valid,
    ex_dbta_valid => ex_dbta_valid,
    ex_jmp_target => ex_jmp_target,
    next_PC => next_PC,
    pc => pc
  );
  U_16 : mux_fw_memory
  port map(
    ex_mux_fw_mem_sel => ex_mux_fw_mem_sel,
    ex_rs2_fwd => ex_rs2_fwd,
    me_me_out => me_me_out,
    me_store_data_fwd => me_store_data_fwd
  );
  U_14 : mux_fw_rs1
  port map(
    ex_mux_fw_rs1_sel => ex_mux_fw_rs1_sel,
    ex_rs1 => ex_rs1,
    me_alu_out => me_alu_out,
    wb_data => wb_data,
    alu_in_1 => alu_in_1
  );
  U_15 : mux_fw_rs2
  port map(
    ex_mux_fw_rs2_sel => ex_mux_fw_rs2_sel,
    ex_rs2 => ex_rs2,
    me_alu_out => me_alu_out,
    wb_data => wb_data,
    ex_rs2_fwd => ex_rs2_fwd
  );
  U_13 : mux_memory
  port map(
    me_alu_out => me_alu_out,
    me_load_data => me_load_data,
    me_mem_mode => me_mem_mode,
    me_me_out => me_me_out
  );
  U_17 : mux_nop
  port map(
    dec_sbta_valid => dec_sbta_valid,
    ex_dbta_valid => ex_dbta_valid,
    if_im_out => if_im_out,
    if_op_code => if_op_code
  );
  U_3 : pc_inc
  port map(
    if_pc => if_pc,
    next_PC => next_PC
  );
  U_0 : pc_reg
  port map(
    clk => clk,
    pc => pc,
    res_n => res_n,
    stall => stall,
    if_pc => if_pc
  );

end struct;
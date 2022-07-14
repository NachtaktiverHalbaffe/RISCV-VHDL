--
-- VHDL Architecture RISCV_lib.riscv.struct
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 16:17:11 07/14/22
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


ARCHITECTURE struct OF riscv IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL addr_reserved      : std_logic;
   SIGNAL alu_in_1           : word;
   SIGNAL alu_in_2           : word;
   SIGNAL cs_bo              : std_logic;
   SIGNAL data_valid         : std_logic;
   SIGNAL dec_alu_mode       : alu_mode_type;
   SIGNAL dec_dbpu_addr_sel  : std_logic;
   SIGNAL dec_dbpu_mode      : std_logic;
   SIGNAL dec_imm            : word;
   SIGNAL dec_imm_type       : imm_type;
   SIGNAL dec_jmp_target     : word;
   SIGNAL dec_mem_mode       : mem_mode;
   SIGNAL dec_mux_alu_sel    : std_logic;
   SIGNAL dec_mux_fw_mem_sel : fwd_sel;
   SIGNAL dec_mux_fw_rs1_sel : fwd_sel;
   SIGNAL dec_mux_fw_rs2_sel : fwd_sel;
   SIGNAL dec_next_PC        : word;
   SIGNAL dec_rs1            : word;
   SIGNAL dec_rs2            : word;
   SIGNAL dec_sbta_valid     : std_logic;
   SIGNAL dec_target_reg     : rf_storage_addr;
   SIGNAL ex_alu_mode        : alu_mode_type;
   SIGNAL ex_alu_out         : word;
   SIGNAL ex_dbpu_addr_sel   : std_logic;
   SIGNAL ex_dbpu_mode       : std_logic;
   SIGNAL ex_dbta_valid      : std_logic;
   SIGNAL ex_imm             : word;
   SIGNAL ex_jmp_target      : word;
   SIGNAL ex_mem_mode        : mem_mode;
   SIGNAL ex_mux_alu_sel     : std_logic;
   SIGNAL ex_mux_fw_mem_sel  : fwd_sel;
   SIGNAL ex_mux_fw_rs1_sel  : fwd_sel;
   SIGNAL ex_mux_fw_rs2_sel  : fwd_sel;
   SIGNAL ex_next_PC         : word;
   SIGNAL ex_rs1             : word;
   SIGNAL ex_rs2             : word;
   SIGNAL ex_rs2_fwd         : word;
   SIGNAL ex_sbta            : word;
   SIGNAL ex_target_reg      : rf_storage_addr;
   SIGNAL if_im_out          : word;
   SIGNAL if_op_code         : word;
   SIGNAL if_pc              : word;
   SIGNAL io_data_out        : word;
   SIGNAL load_op_mem        : std_logic;
   SIGNAL loading            : std_logic;
   SIGNAL me_alu_out         : word;
   SIGNAL me_load_data       : word;
   SIGNAL me_me_out          : word;
   SIGNAL me_mem_mode        : mem_mode;
   SIGNAL me_store_data_fwd  : word;
   SIGNAL me_target_reg      : rf_storage_addr;
   SIGNAL miso_i             : std_logic;
   SIGNAL next_PC            : word;
   SIGNAL op_code            : word;
   SIGNAL pc                 : word;
   SIGNAL sbpu_mode          : std_logic;
   SIGNAL sclk               : std_logic;
   SIGNAL sel_rs1            : rf_storage_addr;
   SIGNAL sel_rs2            : rf_storage_addr;
   SIGNAL sp_op_code         : word;
   SIGNAL stall              : std_logic;
   SIGNAL wb_data            : word;
   SIGNAL wb_traget_reg      : rf_storage_addr;


   -- Component Declarations
   COMPONENT ALU
   PORT (
      alu_in_1    : IN     word ;
      alu_in_2    : IN     word ;
      ex_alu_mode : IN     alu_mode_type ;
      ex_alu_out  : OUT    word 
   );
   END COMPONENT;
   COMPONENT DBPU
   PORT (
      ex_alu_mode      : IN     alu_mode_type ;
      ex_alu_out       : IN     word ;
      ex_dbpu_addr_sel : IN     std_logic ;
      ex_dbpu_mode     : IN     std_logic ;
      ex_imm           : IN     word ;
      ex_next_PC       : IN     word ;
      ex_sbta          : IN     word ;
      ex_dbta_valid    : OUT    std_logic ;
      ex_jmp_target    : OUT    word 
   );
   END COMPONENT;
   COMPONENT Imm_Gen
   PORT (
      dec_imm_type : IN     imm_type ;
      op_code      : IN     word ;
      dec_imm      : OUT    word 
   );
   END COMPONENT;
   COMPONENT Memory
   PORT (
      clk               : IN     std_logic ;
      ex_alu_out        : IN     word ;
      ex_mem_mode       : IN     mem_mode ;
      me_store_data_fwd : IN     word ;
      res_n             : IN     std_logic ;
      me_load_data      : OUT    word 
   );
   END COMPONENT;
   COMPONENT RF
   PORT (
      clk           : IN     std_logic ;
      res_n         : IN     std_logic ;
      sel_rs1       : IN     rf_storage_addr ;
      sel_rs2       : IN     rf_storage_addr ;
      wb_data       : IN     word ;
      wb_traget_reg : IN     rf_storage_addr ;
      dec_rs1       : OUT    word ;
      dec_rs2       : OUT    word 
   );
   END COMPONENT;
   COMPONENT SBPU
   PORT (
      dec_imm        : IN     word ;
      dec_next_PC    : IN     word ;
      sbpu_mode      : IN     std_logic ;
      dec_jmp_target : OUT    word ;
      dec_sbta_valid : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT SD_Controller
   PORT (
      clk         : IN     std_logic ;
      load_op_mem : IN     std_logic ;
      miso_i      : IN     std_logic ;
      res_n       : IN     std_logic ;
      cs_bo       : OUT    std_logic ;
      data_valid  : OUT    std_logic ;
      loading     : OUT    std_logic ;
      sclk        : OUT    std_logic ;
      sp_op_code  : OUT    word 
   );
   END COMPONENT;
   COMPONENT dec_reg
   PORT (
      clk                : IN     std_logic ;
      dec_alu_mode       : IN     alu_mode_type ;
      dec_dbpu_addr_sel  : IN     std_logic ;
      dec_dbpu_mode      : IN     std_logic ;
      dec_imm            : IN     word ;
      dec_jmp_target     : IN     word ;
      dec_mem_mode       : IN     mem_mode ;
      dec_mux_alu_sel    : IN     std_logic ;
      dec_mux_fw_mem_sel : IN     fwd_sel ;
      dec_mux_fw_rs1_sel : IN     fwd_sel ;
      dec_mux_fw_rs2_sel : IN     fwd_sel ;
      dec_next_PC        : IN     word ;
      dec_rs1            : IN     word ;
      dec_rs2            : IN     word ;
      dec_target_reg     : IN     rf_storage_addr ;
      res_n              : IN     std_logic ;
      ex_alu_mode        : OUT    alu_mode_type ;
      ex_dbpu_addr_sel   : OUT    std_logic ;
      ex_dbpu_mode       : OUT    std_logic ;
      ex_imm             : OUT    word ;
      ex_mem_mode        : OUT    mem_mode ;
      ex_mux_alu_sel     : OUT    std_logic ;
      ex_mux_fw_mem_sel  : OUT    fwd_sel ;
      ex_mux_fw_rs1_sel  : OUT    fwd_sel ;
      ex_mux_fw_rs2_sel  : OUT    fwd_sel ;
      ex_next_PC         : OUT    word ;
      ex_rs1             : OUT    word ;
      ex_rs2             : OUT    word ;
      ex_sbta            : OUT    word ;
      ex_target_reg      : OUT    rf_storage_addr 
   );
   END COMPONENT;
   COMPONENT decoder
   PORT (
      ex_dbta_valid      : IN     std_logic ;
      ex_mem_mode        : IN     mem_mode ;
      ex_target_reg      : IN     rf_storage_addr ;
      me_mem_mode        : IN     mem_mode ;
      me_target_reg      : IN     rf_storage_addr ;
      op_code            : IN     word ;
      dec_alu_mode       : OUT    alu_mode_type ;
      dec_dbpu_addr_sel  : OUT    std_logic ;
      dec_dbpu_mode      : OUT    std_logic ;
      dec_imm_type       : OUT    imm_type ;
      dec_mem_mode       : OUT    mem_mode ;
      dec_mux_alu_sel    : OUT    std_logic ;
      dec_mux_fw_mem_sel : OUT    fwd_sel ;
      dec_mux_fw_rs1_sel : OUT    fwd_sel ;
      dec_mux_fw_rs2_sel : OUT    fwd_sel ;
      dec_target_reg     : OUT    rf_storage_addr ;
      sbpu_mode          : OUT    std_logic ;
      sel_rs1            : OUT    rf_storage_addr ;
      sel_rs2            : OUT    rf_storage_addr ;
      stall              : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ex_reg
   PORT (
      clk               : IN     std_logic ;
      ex_alu_out        : IN     word ;
      ex_mem_mode       : IN     mem_mode ;
      ex_mux_fw_mem_sel : IN     fwd_sel ;
      ex_target_reg     : IN     rf_storage_addr ;
      res_n             : IN     std_logic ;
      me_alu_out        : OUT    word ;
      me_mem_mode       : OUT    mem_mode ;
      me_target_reg     : OUT    rf_storage_addr 
   );
   END COMPONENT;
   COMPONENT if_reg
   PORT (
      clk         : IN     std_logic ;
      if_op_code  : IN     word ;
      load_op_mem : IN     std_logic ;
      next_PC     : IN     word ;
      res_n       : IN     std_logic ;
      stall       : IN     std_logic ;
      dec_next_PC : OUT    word ;
      op_code     : OUT    word 
   );
   END COMPONENT;
   COMPONENT im
   PORT (
      data_valid  : IN     std_logic ;
      if_pc       : IN     word ;
      loading     : IN     std_logic ;
      res_n       : IN     std_logic ;
      sp_op_code  : IN     word ;
      if_im_out   : OUT    word ;
      load_op_mem : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT io_controller
   PORT (
      clk               : IN     std_logic ;
      ex_alu_out        : IN     word ;
      ex_mem_mode       : IN     mem_mode ;
      keys              : IN     keys_type ;
      me_store_data_fwd : IN     word ;
      res_n             : IN     std_logic ;
      addr_reserved     : OUT    std_logic ;
      hex_disp0         : OUT    hex_disp_type ;
      hex_disp1         : OUT    hex_disp_type ;
      hex_disp2         : OUT    hex_disp_type ;
      hex_disp3         : OUT    hex_disp_type ;
      io_data_out       : OUT    word ;
      leds_green        : OUT    leds_green_type ;
      leds_red          : OUT    leds_red_type 
   );
   END COMPONENT;
   COMPONENT me_reg
   PORT (
      clk           : IN     std_logic ;
      me_me_out     : IN     word ;
      me_target_reg : IN     rf_storage_addr ;
      res_n         : IN     std_logic ;
      wb_data       : OUT    word ;
      wb_traget_reg : OUT    rf_storage_addr 
   );
   END COMPONENT;
   COMPONENT mux_alu
   PORT (
      ex_imm         : IN     word ;
      ex_mux_alu_sel : IN     std_logic ;
      ex_rs2_fwd     : IN     word ;
      alu_in_2       : OUT    word 
   );
   END COMPONENT;
   COMPONENT mux_bpu
   PORT (
      dec_jmp_target : IN     word ;
      dec_sbta_valid : IN     std_logic ;
      ex_dbta_valid  : IN     std_logic ;
      ex_jmp_target  : IN     word ;
      next_PC        : IN     word ;
      pc             : OUT    word 
   );
   END COMPONENT;
   COMPONENT mux_fw_memory
   PORT (
      ex_mux_fw_mem_sel : IN     fwd_sel ;
      ex_rs2_fwd        : IN     word ;
      me_me_out         : IN     word ;
      me_store_data_fwd : OUT    word 
   );
   END COMPONENT;
   COMPONENT mux_fw_rs1
   PORT (
      ex_mux_fw_rs1_sel : IN     fwd_sel ;
      ex_rs1            : IN     word ;
      me_alu_out        : IN     word ;
      wb_data           : IN     word ;
      alu_in_1          : OUT    word 
   );
   END COMPONENT;
   COMPONENT mux_fw_rs2
   PORT (
      ex_mux_fw_rs2_sel : IN     fwd_sel ;
      ex_rs2            : IN     word ;
      me_alu_out        : IN     word ;
      wb_data           : IN     word ;
      ex_rs2_fwd        : OUT    word 
   );
   END COMPONENT;
   COMPONENT mux_memory
   PORT (
      addr_reserved : IN     std_logic ;
      io_data_out   : IN     word ;
      me_alu_out    : IN     word ;
      me_load_data  : IN     word ;
      me_mem_mode   : IN     mem_mode ;
      me_me_out     : OUT    word 
   );
   END COMPONENT;
   COMPONENT mux_nop
   PORT (
      dec_sbta_valid : IN     std_logic ;
      ex_dbta_valid  : IN     std_logic ;
      if_im_out      : IN     word ;
      if_op_code     : OUT    word 
   );
   END COMPONENT;
   COMPONENT pc_inc
   PORT (
      if_pc   : IN     word ;
      next_PC : OUT    word 
   );
   END COMPONENT;
   COMPONENT pc_reg
   PORT (
      clk         : IN     std_logic ;
      load_op_mem : IN     std_logic ;
      pc          : IN     word ;
      res_n       : IN     std_logic ;
      stall       : IN     std_logic ;
      if_pc       : OUT    word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ALU USE ENTITY RISCV_lib.ALU;
   FOR ALL : DBPU USE ENTITY RISCV_lib.DBPU;
   FOR ALL : Imm_Gen USE ENTITY RISCV_lib.Imm_Gen;
   FOR ALL : Memory USE ENTITY RISCV_lib.Memory;
   FOR ALL : RF USE ENTITY RISCV_lib.RF;
   FOR ALL : SBPU USE ENTITY RISCV_lib.SBPU;
   FOR ALL : SD_Controller USE ENTITY RISCV_lib.SD_Controller;
   FOR ALL : dec_reg USE ENTITY RISCV_lib.dec_reg;
   FOR ALL : decoder USE ENTITY RISCV_lib.decoder;
   FOR ALL : ex_reg USE ENTITY RISCV_lib.ex_reg;
   FOR ALL : if_reg USE ENTITY RISCV_lib.if_reg;
   FOR ALL : im USE ENTITY RISCV_lib.im;
   FOR ALL : io_controller USE ENTITY RISCV_lib.io_controller;
   FOR ALL : me_reg USE ENTITY RISCV_lib.me_reg;
   FOR ALL : mux_alu USE ENTITY RISCV_lib.mux_alu;
   FOR ALL : mux_bpu USE ENTITY RISCV_lib.mux_bpu;
   FOR ALL : mux_fw_memory USE ENTITY RISCV_lib.mux_fw_memory;
   FOR ALL : mux_fw_rs1 USE ENTITY RISCV_lib.mux_fw_rs1;
   FOR ALL : mux_fw_rs2 USE ENTITY RISCV_lib.mux_fw_rs2;
   FOR ALL : mux_memory USE ENTITY RISCV_lib.mux_memory;
   FOR ALL : mux_nop USE ENTITY RISCV_lib.mux_nop;
   FOR ALL : pc_inc USE ENTITY RISCV_lib.pc_inc;
   FOR ALL : pc_reg USE ENTITY RISCV_lib.pc_reg;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_7 : ALU
      PORT MAP (
         alu_in_1    => alu_in_1,
         alu_in_2    => alu_in_2,
         ex_alu_mode => ex_alu_mode,
         ex_alu_out  => ex_alu_out
      );
   U_18 : DBPU
      PORT MAP (
         ex_alu_mode      => ex_alu_mode,
         ex_alu_out       => ex_alu_out,
         ex_dbpu_addr_sel => ex_dbpu_addr_sel,
         ex_dbpu_mode     => ex_dbpu_mode,
         ex_imm           => ex_imm,
         ex_next_PC       => ex_next_PC,
         ex_sbta          => ex_sbta,
         ex_dbta_valid    => ex_dbta_valid,
         ex_jmp_target    => ex_jmp_target
      );
   U_9 : Imm_Gen
      PORT MAP (
         dec_imm_type => dec_imm_type,
         op_code      => op_code,
         dec_imm      => dec_imm
      );
   U_12 : Memory
      PORT MAP (
         clk               => clk,
         ex_alu_out        => ex_alu_out,
         ex_mem_mode       => ex_mem_mode,
         me_store_data_fwd => me_store_data_fwd,
         res_n             => res_n,
         me_load_data      => me_load_data
      );
   U_5 : RF
      PORT MAP (
         clk           => clk,
         res_n         => res_n,
         sel_rs1       => sel_rs1,
         sel_rs2       => sel_rs2,
         wb_data       => wb_data,
         wb_traget_reg => wb_traget_reg,
         dec_rs1       => dec_rs1,
         dec_rs2       => dec_rs2
      );
   U_19 : SBPU
      PORT MAP (
         dec_imm        => dec_imm,
         dec_next_PC    => dec_next_PC,
         sbpu_mode      => sbpu_mode,
         dec_jmp_target => dec_jmp_target,
         dec_sbta_valid => dec_sbta_valid
      );
   U_22 : SD_Controller
      PORT MAP (
         clk         => clk,
         load_op_mem => load_op_mem,
         miso_i      => miso_i,
         res_n       => res_n,
         cs_bo       => cs_bo,
         data_valid  => data_valid,
         loading     => loading,
         sclk        => sclk,
         sp_op_code  => sp_op_code
      );
   U_6 : dec_reg
      PORT MAP (
         clk                => clk,
         dec_alu_mode       => dec_alu_mode,
         dec_dbpu_addr_sel  => dec_dbpu_addr_sel,
         dec_dbpu_mode      => dec_dbpu_mode,
         dec_imm            => dec_imm,
         dec_jmp_target     => dec_jmp_target,
         dec_mem_mode       => dec_mem_mode,
         dec_mux_alu_sel    => dec_mux_alu_sel,
         dec_mux_fw_mem_sel => dec_mux_fw_mem_sel,
         dec_mux_fw_rs1_sel => dec_mux_fw_rs1_sel,
         dec_mux_fw_rs2_sel => dec_mux_fw_rs2_sel,
         dec_next_PC        => dec_next_PC,
         dec_rs1            => dec_rs1,
         dec_rs2            => dec_rs2,
         dec_target_reg     => dec_target_reg,
         res_n              => res_n,
         ex_alu_mode        => ex_alu_mode,
         ex_dbpu_addr_sel   => ex_dbpu_addr_sel,
         ex_dbpu_mode       => ex_dbpu_mode,
         ex_imm             => ex_imm,
         ex_mem_mode        => ex_mem_mode,
         ex_mux_alu_sel     => ex_mux_alu_sel,
         ex_mux_fw_mem_sel  => ex_mux_fw_mem_sel,
         ex_mux_fw_rs1_sel  => ex_mux_fw_rs1_sel,
         ex_mux_fw_rs2_sel  => ex_mux_fw_rs2_sel,
         ex_next_PC         => ex_next_PC,
         ex_rs1             => ex_rs1,
         ex_rs2             => ex_rs2,
         ex_sbta            => ex_sbta,
         ex_target_reg      => ex_target_reg
      );
   U_4 : decoder
      PORT MAP (
         ex_dbta_valid      => ex_dbta_valid,
         ex_mem_mode        => ex_mem_mode,
         ex_target_reg      => ex_target_reg,
         me_mem_mode        => me_mem_mode,
         me_target_reg      => me_target_reg,
         op_code            => op_code,
         dec_alu_mode       => dec_alu_mode,
         dec_dbpu_addr_sel  => dec_dbpu_addr_sel,
         dec_dbpu_mode      => dec_dbpu_mode,
         dec_imm_type       => dec_imm_type,
         dec_mem_mode       => dec_mem_mode,
         dec_mux_alu_sel    => dec_mux_alu_sel,
         dec_mux_fw_mem_sel => dec_mux_fw_mem_sel,
         dec_mux_fw_rs1_sel => dec_mux_fw_rs1_sel,
         dec_mux_fw_rs2_sel => dec_mux_fw_rs2_sel,
         dec_target_reg     => dec_target_reg,
         sbpu_mode          => sbpu_mode,
         sel_rs1            => sel_rs1,
         sel_rs2            => sel_rs2,
         stall              => stall
      );
   U_8 : ex_reg
      PORT MAP (
         clk               => clk,
         ex_alu_out        => ex_alu_out,
         ex_mem_mode       => ex_mem_mode,
         ex_mux_fw_mem_sel => ex_mux_fw_mem_sel,
         ex_target_reg     => ex_target_reg,
         res_n             => res_n,
         me_alu_out        => me_alu_out,
         me_mem_mode       => me_mem_mode,
         me_target_reg     => me_target_reg
      );
   U_2 : if_reg
      PORT MAP (
         clk         => clk,
         if_op_code  => if_op_code,
         load_op_mem => load_op_mem,
         next_PC     => next_PC,
         res_n       => res_n,
         stall       => stall,
         dec_next_PC => dec_next_PC,
         op_code     => op_code
      );
   U_1 : im
      PORT MAP (
         data_valid  => data_valid,
         if_pc       => if_pc,
         loading     => loading,
         res_n       => res_n,
         sp_op_code  => sp_op_code,
         if_im_out   => if_im_out,
         load_op_mem => load_op_mem
      );
   U_21 : io_controller
      PORT MAP (
         clk               => clk,
         ex_alu_out        => ex_alu_out,
         ex_mem_mode       => ex_mem_mode,
         keys              => keys,
         me_store_data_fwd => me_store_data_fwd,
         res_n             => res_n,
         addr_reserved     => addr_reserved,
         hex_disp0         => hex_disp0,
         hex_disp1         => hex_disp1,
         hex_disp2         => hex_disp2,
         hex_disp3         => hex_disp3,
         io_data_out       => io_data_out,
         leds_green        => leds_green,
         leds_red          => leds_red
      );
   U_10 : me_reg
      PORT MAP (
         clk           => clk,
         me_me_out     => me_me_out,
         me_target_reg => me_target_reg,
         res_n         => res_n,
         wb_data       => wb_data,
         wb_traget_reg => wb_traget_reg
      );
   U_11 : mux_alu
      PORT MAP (
         ex_imm         => ex_imm,
         ex_mux_alu_sel => ex_mux_alu_sel,
         ex_rs2_fwd     => ex_rs2_fwd,
         alu_in_2       => alu_in_2
      );
   U_20 : mux_bpu
      PORT MAP (
         dec_jmp_target => dec_jmp_target,
         dec_sbta_valid => dec_sbta_valid,
         ex_dbta_valid  => ex_dbta_valid,
         ex_jmp_target  => ex_jmp_target,
         next_PC        => next_PC,
         pc             => pc
      );
   U_16 : mux_fw_memory
      PORT MAP (
         ex_mux_fw_mem_sel => ex_mux_fw_mem_sel,
         ex_rs2_fwd        => ex_rs2_fwd,
         me_me_out         => me_me_out,
         me_store_data_fwd => me_store_data_fwd
      );
   U_14 : mux_fw_rs1
      PORT MAP (
         ex_mux_fw_rs1_sel => ex_mux_fw_rs1_sel,
         ex_rs1            => ex_rs1,
         me_alu_out        => me_alu_out,
         wb_data           => wb_data,
         alu_in_1          => alu_in_1
      );
   U_15 : mux_fw_rs2
      PORT MAP (
         ex_mux_fw_rs2_sel => ex_mux_fw_rs2_sel,
         ex_rs2            => ex_rs2,
         me_alu_out        => me_alu_out,
         wb_data           => wb_data,
         ex_rs2_fwd        => ex_rs2_fwd
      );
   U_13 : mux_memory
      PORT MAP (
         addr_reserved => addr_reserved,
         io_data_out   => io_data_out,
         me_alu_out    => me_alu_out,
         me_load_data  => me_load_data,
         me_mem_mode   => me_mem_mode,
         me_me_out     => me_me_out
      );
   U_17 : mux_nop
      PORT MAP (
         dec_sbta_valid => dec_sbta_valid,
         ex_dbta_valid  => ex_dbta_valid,
         if_im_out      => if_im_out,
         if_op_code     => if_op_code
      );
   U_3 : pc_inc
      PORT MAP (
         if_pc   => if_pc,
         next_PC => next_PC
      );
   U_0 : pc_reg
      PORT MAP (
         clk         => clk,
         load_op_mem => load_op_mem,
         pc          => pc,
         res_n       => res_n,
         stall       => stall,
         if_pc       => if_pc
      );

END struct;

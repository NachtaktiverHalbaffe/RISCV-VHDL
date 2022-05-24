--
-- VHDL Architecture RISCV_lib.riscv.struct
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 15:08:05 05/24/22
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
   SIGNAL alu_in_2        : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL clk             : std_logic;
   SIGNAL dec_alu_mode    : alu_mode_type;
   SIGNAL dec_imm         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL dec_imm_type    : imm_type;
   SIGNAL dec_mux_alu_sel : std_logic;
   SIGNAL dec_rs1         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL dec_rs2         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL dec_target_reg  : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL ex_alu_mode     : alu_mode_type;
   SIGNAL ex_alu_out      : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL ex_imm          : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL ex_mux_alu_sel  : std_logic;
   SIGNAL ex_rs1          : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL ex_rs2          : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL ex_target_reg   : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL if_op_code      : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL if_pc           : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL me_out          : integer RANGE 0 TO 4;
   SIGNAL me_target_reg   : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL next_PC         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL op_code         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL res_n           : std_logic;
   SIGNAL sel_rs1         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL sel_rs2         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL wb_data         : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);
   SIGNAL wb_traget_reg   : std_logic_vector(WORD_WIDTH-1 DOWNTO 0);


   -- Component Declarations
   COMPONENT ALU
   PORT (
      alu_in_2    : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_alu_mode : IN     alu_mode_type ;
      ex_rs1      : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_alu_out  : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT Imm_Gen
   PORT (
      dec_imm_type : IN     imm_type ;
      op_code      : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_imm      : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT RF
   PORT (
      res_n         : IN     std_logic ;
      sel_rs1       : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      sel_rs2       : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      wb_data       : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      wb_traget_reg : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_rs1       : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_rs2       : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT dec_reg
   PORT (
      clk             : IN     std_logic ;
      dec_alu_mode    : IN     alu_mode_type ;
      dec_imm         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_mux_alu_sel : IN     std_logic ;
      dec_rs1         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_rs2         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_target_reg  : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      res_n           : IN     std_logic ;
      ex_alu_mode     : OUT    alu_mode_type ;
      ex_imm          : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_mux_alu_sel  : OUT    std_logic ;
      ex_rs1          : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_rs2          : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_target_reg   : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT decoder
   PORT (
      op_code         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_alu_mode    : OUT    alu_mode_type ;
      dec_imm_type    : OUT    imm_type ;
      dec_mux_alu_sel : OUT    std_logic ;
      dec_target_reg  : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      sel_rs1         : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      sel_rs2         : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT ex_reg
   PORT (
      clk           : IN     std_logic ;
      ex_alu_out    : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_target_reg : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      res_n         : IN     std_logic ;
      me_out        : OUT    integer RANGE 0 TO 4;
      me_target_reg : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT if_reg
   PORT (
      clk        : IN     std_logic ;
      if_op_code : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      next_PC    : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      res_n      : IN     std_logic ;
      op_code    : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT im
   PORT (
      if_pc      : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      res_n      : IN     std_logic ;
      if_op_code : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT me_reg
   PORT (
      clk           : IN     std_logic ;
      me_out        : IN     integer RANGE 0 TO 4;
      me_target_reg : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      res_n         : IN     std_logic ;
      wb_data       : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      wb_traget_reg : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT mux_alu
   PORT (
      ex_imm         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_mux_alu_sel : IN     std_logic ;
      ex_rs2         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      alu_in_2       : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT pc_inc
   PORT (
      if_pc   : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      next_PC : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT pc_reg
   PORT (
      clk     : IN     std_logic ;
      next_PC : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      res_n   : IN     std_logic ;
      if_pc   : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ALU USE ENTITY RISCV_lib.ALU;
   FOR ALL : Imm_Gen USE ENTITY RISCV_lib.Imm_Gen;
   FOR ALL : RF USE ENTITY RISCV_lib.RF;
   FOR ALL : dec_reg USE ENTITY RISCV_lib.dec_reg;
   FOR ALL : decoder USE ENTITY RISCV_lib.decoder;
   FOR ALL : ex_reg USE ENTITY RISCV_lib.ex_reg;
   FOR ALL : if_reg USE ENTITY RISCV_lib.if_reg;
   FOR ALL : im USE ENTITY RISCV_lib.im;
   FOR ALL : me_reg USE ENTITY RISCV_lib.me_reg;
   FOR ALL : mux_alu USE ENTITY RISCV_lib.mux_alu;
   FOR ALL : pc_inc USE ENTITY RISCV_lib.pc_inc;
   FOR ALL : pc_reg USE ENTITY RISCV_lib.pc_reg;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_7 : ALU
      PORT MAP (
         alu_in_2    => alu_in_2,
         ex_alu_mode => ex_alu_mode,
         ex_rs1      => ex_rs1,
         ex_alu_out  => ex_alu_out
      );
   U_9 : Imm_Gen
      PORT MAP (
         dec_imm_type => dec_imm_type,
         op_code      => op_code,
         dec_imm      => dec_imm
      );
   U_5 : RF
      PORT MAP (
         res_n         => res_n,
         sel_rs1       => sel_rs1,
         sel_rs2       => sel_rs2,
         wb_data       => wb_data,
         wb_traget_reg => wb_traget_reg,
         dec_rs1       => dec_rs1,
         dec_rs2       => dec_rs2
      );
   U_6 : dec_reg
      PORT MAP (
         clk             => clk,
         dec_alu_mode    => dec_alu_mode,
         dec_imm         => dec_imm,
         dec_mux_alu_sel => dec_mux_alu_sel,
         dec_rs1         => dec_rs1,
         dec_rs2         => dec_rs2,
         dec_target_reg  => dec_target_reg,
         res_n           => res_n,
         ex_alu_mode     => ex_alu_mode,
         ex_imm          => ex_imm,
         ex_mux_alu_sel  => ex_mux_alu_sel,
         ex_rs1          => ex_rs1,
         ex_rs2          => ex_rs2,
         ex_target_reg   => ex_target_reg
      );
   U_4 : decoder
      PORT MAP (
         op_code         => op_code,
         dec_alu_mode    => dec_alu_mode,
         dec_imm_type    => dec_imm_type,
         dec_mux_alu_sel => dec_mux_alu_sel,
         dec_target_reg  => dec_target_reg,
         sel_rs1         => sel_rs1,
         sel_rs2         => sel_rs2
      );
   U_8 : ex_reg
      PORT MAP (
         clk           => clk,
         ex_alu_out    => ex_alu_out,
         ex_target_reg => ex_target_reg,
         res_n         => res_n,
         me_out        => me_out,
         me_target_reg => me_target_reg
      );
   U_2 : if_reg
      PORT MAP (
         clk        => clk,
         if_op_code => if_op_code,
         next_PC    => next_PC,
         res_n      => res_n,
         op_code    => op_code
      );
   U_1 : im
      PORT MAP (
         if_pc      => if_pc,
         res_n      => res_n,
         if_op_code => if_op_code
      );
   U_10 : me_reg
      PORT MAP (
         clk           => clk,
         me_out        => me_out,
         me_target_reg => me_target_reg,
         res_n         => res_n,
         wb_data       => wb_data,
         wb_traget_reg => wb_traget_reg
      );
   U_11 : mux_alu
      PORT MAP (
         ex_imm         => ex_imm,
         ex_mux_alu_sel => ex_mux_alu_sel,
         ex_rs2         => ex_rs2,
         alu_in_2       => alu_in_2
      );
   U_3 : pc_inc
      PORT MAP (
         if_pc   => if_pc,
         next_PC => next_PC
      );
   U_0 : pc_reg
      PORT MAP (
         clk     => clk,
         next_PC => next_PC,
         res_n   => res_n,
         if_pc   => if_pc
      );

END struct;

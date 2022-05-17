-- VHDL Entity RISCV_lib.dec_reg.interface
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 17:57:41 05/17/22
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
      clk             : IN     std_logic;
      dec_alu_mode    : IN     alu_mode_type;
      dec_imm         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_mux_alu_sel : IN     std_logic;
      dec_rs1         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_rs2         : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      dec_target_reg  : IN     std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      res_n           : IN     std_logic;
      ex_alu_mode     : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_imm          : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_mux_alu_sel  : OUT    std_logic;
      ex_rs1          : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      ex_target_reg   : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0);
      sig0            : OUT    std_logic_vector (WORD_WIDTH-1 DOWNTO 0)
   );

-- Declarations

END dec_reg ;


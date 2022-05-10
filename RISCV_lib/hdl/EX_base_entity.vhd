--
-- VHDL Entity RISCV_lib.EX_base.arch_name
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 14:11:57 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE iee.numeric_std.all;
ENTITY EX_base IS
  Generic(
  PC_WIDTH: positive;
  REGISTER_WIDTH: positive);
  port(
     NEXT_PC: in std_logic_vector(PC_WIDTH-1 downto 0);
    -- Quellregister
    rs1,rs2: in std_logic_vector(REGISTER_WIDTH-1 downto 0);
    -- immediate
    imm: in std_logic_vector(REGISTER_WIDTH-1 downto 0);
    -- Zielregister
    rd: in std_logic_vector(REGISTER_WIDTH-1 downto 0);
    ALU_out: out std_logic_vector(REGISTER_WIDTH-1 downto 0)
    );
END ENTITY EX_base;


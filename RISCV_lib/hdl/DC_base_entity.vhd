--
-- VHDL Entity RISCV_lib.DC_base.arch_name
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 14:11:38 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity DC_base is
  generic (
    -- Width of program counter (in RISCV doch named "XLEN")
    PC_WIDTH       : positive;
    REGISTER_WIDTH : positive);
  port (
    OP_CODE     : in std_logic_vector(31 downto 0);
    NEXT_PC_IN  : in std_logic_vector(PC_WIDTH - 1 downto 0);
    NEXT_PC_OUT : in std_logic_vector(PC_WIDTH - 1 downto 0);
    -- Quellregister
    rs1, rs2 : out std_logic_vector(REGISTER_WIDTH - 1 downto 0);
    -- immediate
    imm : out std_logic_vector(REGISTER_WIDTH - 1 downto 0);
    -- Zielregister
    rd : out std_logic_vector(REGISTER_WIDTH - 1 downto 0)
    -- Later: also static branch adress
  );
end entity DC_base;
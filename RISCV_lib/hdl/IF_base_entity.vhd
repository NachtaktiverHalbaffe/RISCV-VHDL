--
-- VHDL Entity RISCV_lib.IF_base.arch_name
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 14:11:21 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity IF_base is
  generic (
    -- Width of program counter (in RISCV docs named "XLEN")
    PC_WIDTH : positive);
  port (
    PC : in std_logic_vector(PC_WIDTH - 1 downto 0);
    --
    OP_Code : out std_logic_vector(31 downto 0);
    --
    NEXT_PC : out std_logic_vector(PC_WIDTH - 1 downto 0));
end entity IF_base;
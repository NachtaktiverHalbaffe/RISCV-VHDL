--
-- VHDL Entity RISCV_lib.IM.arch_name
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 15:27:15 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
LIBRARY RISCV_lib;
USE RISCV_lib.constants.all;

ENTITY IM IS

  port (
    PC : in std_logic_vector(WORD_WIDTH - 1 downto 0);
    OP_Code : out std_logic_vector(WORD_WIDTH - 1 downto 0)
    );
END ENTITY IM;


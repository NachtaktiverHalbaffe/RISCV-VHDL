--
-- VHDL Entity RISCV_lib.ME_base.arch_name
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 14:10:27 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE iee.numeric_std.all;
ENTITY ME_base IS
    Generic(
  REGISTER_WIDTH: positive);
  port(
    ALU_out: in std_logic_vector(REGISTER_WIDTH-1 downto 0);
    ME_out: out std_logic_vector(REGISTER_WIDTH-1 downto 0)
    );
END ENTITY ME_base;


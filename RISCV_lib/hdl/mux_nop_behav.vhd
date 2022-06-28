--
-- VHDL Architecture RISCV_lib.mux_nop.behav
--
-- Created:
--          by - tzndirr.meyer (pc084)
--          at - 14:36:45 06/14/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.constants.all;

architecture behav of mux_nop is
begin
  process (if_im_out, dec_sbta_valid, ex_dbta_valid) is
  begin
    if dec_sbta_valid = '1' or ex_dbta_valid = '1' then
      if_op_code <= NOP;
    else
      if_op_code <= if_im_out;
    end if;
  end process;
end architecture behav;
--
-- VHDL Architecture RISCV_lib.SD_Fetch.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 17:20:00 07/12/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF SD_Fetch IS
BEGIN
  
  -- Invert reset signal
  reset_i <= not res_n;
  
  
END ARCHITECTURE behav;


--
-- VHDL Architecture RISCV_lib.RF.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:54:46 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee; use ieee.std_logic_1164.all;
library RISCV_lib; use RISCV_lib.all;

ARCHITECTURE behave OF RF IS
    signal registers: rf_storage_type;

BEGIN
    
    rf_read: process(all) is
    begin
      dec_rs1 <= registers(to_integer(unsigned(sel_rs1)));
      dec_rs2 <= registers(to_integer(unsigned(sel_rs2)));

      if to_integer(unsigned(wb_traget_reg)) /= 0 then
        if sel_rs1 = wb_traget_reg then
          dec_rs1 <= wb_data;
        end if;
        if sel_rs2 = wb_traget_reg then
          dec_rs2 <= wb_data;
        end if;
      end if;
    end process rf_read;
  

    rf_wb: process(clk, res_n) is
    begin
        if res_n = '0' then
            registers <= (others => (others => '0'));
        else
          if clk'event and clk = '1' then
            registers(to_integer(unsigned(wb_traget_reg)))  <= wb_data;
            registers(0) <= (others => '0');
          end if;
        end if;
    end process rf_wb;

END ARCHITECTURE behave;


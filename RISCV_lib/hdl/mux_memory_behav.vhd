--
-- VHDL Architecture RISCV_lib.mux_memory.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:23:42 05/31/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of mux_memory is
begin
  process (me_mem_mode, me_load_data, me_alu_out, io_data_out, addr_reserved) is
  begin
    if me_mem_mode = mem_nls then
      me_me_out <= me_alu_out;
    else
      if addr_reserved = '1' then
        me_me_out <= io_data_out;
      else
        me_me_out <= me_load_data;
      end if;
    end if;
  end process;
end architecture behav;
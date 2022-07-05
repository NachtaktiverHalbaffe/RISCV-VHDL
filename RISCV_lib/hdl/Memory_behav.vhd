--
-- VHDL Architecture RISCV_lib.Memory.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 14:23:54 05/31/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.all;

ARCHITECTURE behave OF Memory IS
    signal memory_file: mem_storage_type;

BEGIN

    rf_wb: process(clk, res_n) is
    begin
        if res_n = '0' then
            memory_file <= (others => (others => '0'));
        else
          if clk'event and clk = '1' then
            if to_integer(signed(ex_alu_out)) < MEM_SIZE-3 then -- for word access 
                report "MEMORY: accessed";
                case ex_mem_mode is
                when mem_lb =>
                    me_load_data(7 downto 0) <= (memory_file(to_integer(unsigned(ex_alu_out))));
                    me_load_data(WORD_WIDTH-1 downto 8) <= (others => memory_file(to_integer(unsigned(ex_alu_out)))(7));

                when mem_lh =>
                    me_load_data(15 downto 0) <= (memory_file(to_integer(unsigned(ex_alu_out))+1))
                                                &(memory_file(to_integer(unsigned(ex_alu_out))));
                    me_load_data(WORD_WIDTH-1 downto 16) <= (others => me_load_data(15));

                when mem_lw =>
                    me_load_data(31 downto 0) <= (memory_file(to_integer(unsigned(ex_alu_out))+3))
                                                &(memory_file(to_integer(unsigned(ex_alu_out))+2))
                                                &(memory_file(to_integer(unsigned(ex_alu_out))+1))
                                                &(memory_file(to_integer(unsigned(ex_alu_out))));

                when mem_lbu =>
                    me_load_data(7 downto 0) <= (memory_file(to_integer(unsigned(ex_alu_out))));
                    me_load_data(WORD_WIDTH-1 downto 8) <= (others => '0');

                when mem_lhu =>
                    me_load_data(15 downto 0) <= (memory_file(to_integer(unsigned(ex_alu_out))+1))
                                                &(memory_file(to_integer(unsigned(ex_alu_out))));
                    me_load_data(WORD_WIDTH-1 downto 16) <= (others => '0');

                when mem_sb =>
                    memory_file(to_integer(unsigned(ex_alu_out))) <= me_store_data_fwd(7 downto 0);

                when mem_sh =>
                    memory_file(to_integer(unsigned(ex_alu_out))) <= me_store_data_fwd(7 downto 0);
                    memory_file(to_integer(unsigned(ex_alu_out))+1) <= me_store_data_fwd(15 downto 8);

                when mem_sw =>
                    memory_file(to_integer(unsigned(ex_alu_out))+0) <= me_store_data_fwd(7 downto 0);
                    memory_file(to_integer(unsigned(ex_alu_out))+1) <= me_store_data_fwd(15 downto 8);
                    memory_file(to_integer(unsigned(ex_alu_out))+2) <= me_store_data_fwd(23 downto 16);
                    memory_file(to_integer(unsigned(ex_alu_out))+3) <= me_store_data_fwd(31 downto 24);

                when mem_nls =>
                    me_load_data <= (others => '0');

                end case;
            else
                report "MEMORY: Adress out of Bound!";
                me_load_data <= (others => '0');
            end if;                    
          end if;
        end if;
    end process rf_wb;

END ARCHITECTURE behave;


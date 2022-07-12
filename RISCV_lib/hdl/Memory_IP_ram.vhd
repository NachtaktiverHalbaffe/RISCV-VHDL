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
USE RISCV_lib.all;


use RISCV_lib.all;

ARCHITECTURE ip_ram OF Memory IS
    subtype ram_addr_width is std_logic_vector(12 downto 0);
    type ram_addr_type is array (MEM_BYTE_WIDTH-1 downto 0) of ram_addr_width;
    type ram_data_type is array (MEM_BYTE_WIDTH-1 downto 0) of byte;

    signal ram_addr : ram_addr_type;
    signal ram_data : ram_data_type;
    signal ram_w_en : std_logic_vector(MEM_BYTE_WIDTH-1 downto 0);
    signal ram_out : ram_data_type;
    signal addr_offset : integer;

    function own_rol(reg: std_logic_vector; shift: integer) return std_logic_vector is
		variable temp : std_logic_vector(reg'range);
    begin
        assert reg'length < shift report "rol: index too large";
        case shift is
            when 1 =>  temp := reg(reg'left+1 to reg'right) & reg(reg'left);
            when 2 =>  temp := reg(reg'left+2 to reg'right) & reg(reg'left to reg'left+1);
            when 3 =>  temp := reg(reg'left+3 to reg'right) & reg(reg'left to reg'left+2);
        when others => temp := reg;
        end case;
        return  temp;
    end function own_rol;

BEGIN
    ram_cellarray: for cell in ram_addr'range generate
    begin
        ram_cell: entity RISCV_lib.ram port map(
            clock   => clk,
            address => ram_addr(cell),
            data    => ram_data(cell),
            wren    => ram_w_en(cell),
            q       => ram_out(cell)
        );
    end generate ram_cellarray;

    ram_input_processing: process(ex_alu_out, ex_mem_mode, me_store_data_fwd) is
        variable addr_temp   : ram_addr_width := (others => '0');
    begin
        if unsigned(ex_alu_out) < MEM_SIZE-3 then -- for word access 
            addr_temp   := std_logic_vector(unsigned(ex_alu_out(addr_temp'range)) / MEM_BYTE_WIDTH); 
            addr_offset <= to_integer(unsigned(ex_alu_out(addr_temp'range))) mod MEM_BYTE_WIDTH; 
        
            for cell in ram_addr'range loop
                if cell < addr_offset then 
                    ram_addr(cell) <= std_logic_vector(unsigned(addr_temp) + 1);
                else 
                    ram_addr(cell) <= addr_temp;
                end if;
                
                ram_data(cell) <= me_store_data_fwd((BYTE_WIDTH*(cell+1)) - 1  downto (BYTE_WIDTH*cell));
            end loop;
            
            case ex_mem_mode is
            when mem_sb => ram_w_en <= b"0001";
            when mem_sh => ram_w_en <= b"0011";
            when mem_sw => ram_w_en <= b"1111";
            when others => ram_w_en <= b"0000";
            end case;
        end if;
    end process ram_input_processing;

    ram_output_processing: process (ex_mem_mode,ram_out,addr_offset)
        variable temp_output : word;
    begin
        temp_output := own_rol(ram_out(3)&ram_out(2)&ram_out(1)&ram_out(0), addr_offset);
		case ex_mem_mode is
        when mem_lb => 
            me_load_data(7 downto 0) <= temp_output(7 downto 0);
            me_load_data(WORD_WIDTH-1 downto 8) <= (others => temp_output(7));
            
        when mem_lh =>
            me_load_data(15 downto 0) <= temp_output(15 downto 0);
            me_load_data(WORD_WIDTH-1 downto 16) <= (others => temp_output(15));

        when mem_lw =>
            me_load_data <= temp_output;

        when mem_lbu =>		
            me_load_data(7 downto 0) <= temp_output(7 downto 0);
            me_load_data(WORD_WIDTH-1 downto 8) <= (others => '0');	

        when mem_lhu =>
            me_load_data(15 downto 0) <= temp_output(15 downto 0);
            me_load_data(WORD_WIDTH-1 downto 16) <= (others => '0');

        when others =>
            me_load_data <= (others => '0');
        end case;
    end process ram_output_processing;

END ARCHITECTURE ip_ram;


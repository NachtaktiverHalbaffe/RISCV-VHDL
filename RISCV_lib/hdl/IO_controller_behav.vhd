library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.all;
  
ARCHITECTURE behave OF io_contoller IS
    -- Entity

    -- Architecture 
    signal io_hex_buffer: word;

    function seven_seg_encoder(input: integer) return std_logic_vector is 
		variable result: std_logic_vector(hex_disp(0)'range);
	begin
		case input is
			when 0 => result := "0111111";
			when 1 => result := "0000110";
			when 2 => result := "1011011";
			when 3 => result := "1001111";
			when 4 => result := "1100110";
			when 5 => result := "1101101";
			when 6 => result := "1111101";
			when 7 => result := "0000111";
			when 8 => result := "1111111";
			when 9 => result := "1101111";
            when 10 => result := "1110111";
            when 11 => result := "1111100";
            when 12 => result := "1011000";
            when 13 => result := "1010111";
            when 14 => result := "1111001";
            when 15 => result := "1111001";
			when others => result := "0111110";
		end case;

		return not result;
	end function seven_seg_encoder;

BEGIN
    show_hex_disp: process(io_hex_buffer) is
    begin
		if io_hex_buffer <= x"FFFF" then
			hex_disp(0) <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer(7 downto 0))));
			hex_disp(1) <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer(15 downto 8))));
			hex_disp(2) <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer(23 downto 16))));
			hex_disp(3) <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer(31 downto 24))));
		else
			hex_disp(0) <= seven_seg_encoder(16);
			hex_disp(1) <= seven_seg_encoder(16);
			hex_disp(2) <= seven_seg_encoder(16);
			hex_disp(3) <= seven_seg_encoder(16);
		end if;
    end process show_hex_disp;

	read_write_hex_disp: process(clk, res_n) is
	begin
		if res_n = '0' then
			io_hex_buffer <= (others => '0');
		else
			if clk'event and clk = '1' then
				if ex_alu_out = HEX_DISP_ADDR then
					addr_reserved <= '1';
					case ex_mem_mode is
					when mem_lb =>
						io_data_out(7 downto 0) <= io_hex_buffer(7 downto 0);
						io_data_out(WORD_WIDTH-1 downto 8) <= (others => io_hex_buffer(7));
	
					when mem_lh =>
						io_data_out(15 downto 0) <= io_hex_buffer(15 downto 0);
						io_data_out(WORD_WIDTH-1 downto 16) <= (others => io_hex_buffer(15));
	
					when mem_lw =>
						io_data_out(31 downto 0) <= io_hex_buffer;
	
					when mem_lbu =>							
						io_data_out(15 downto 0) <= io_hex_buffer(15 downto 0);
						io_data_out(WORD_WIDTH-1 downto 16) <= (others => '0');
	
					when mem_lhu =>
						io_data_out(15 downto 0) <= io_hex_buffer(15 downto 0);
						io_data_out(WORD_WIDTH-1 downto 16) <= (others => '0');
	
					when mem_sb =>
						io_hex_buffer(7 downto 0)<= me_store_data_fwd(7 downto 0);
	
					when mem_sh =>
						io_hex_buffer(15 downto 0) <= me_store_data_fwd(15 downto 8);
	
					when mem_sw =>
						io_hex_buffer <= me_store_data_fwd;
	
					when mem_nls =>
						io_data_out <= (others => '0');
	
					end case; 
				else
					addr_reserved <= '0';
				end if;
			end if;
		end if;
	end process read_write_hex_disp;
END ARCHITECTURE behave;
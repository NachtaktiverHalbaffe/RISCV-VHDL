--
-- VHDL Architecture RISCV_lib.io_controller.behave
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 12:57:07 07/05/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
library ieee;
use ieee.std_logic_1164.all;
library RISCV_lib;
use RISCV_lib.all;

ARCHITECTURE behave OF io_controller IS
	signal io_hex_buffer			: word := (others => '0');
	signal io_leds_red_buffer		: word := (others => '0');
	signal io_leds_green_buffer		: word := (others => '0');
	signal io_keys_buffer			: word := (others => '0');
	signal io_switches_buffer		: word := (others => '0');
	signal io_keys_sync				: keys_type;

    function seven_seg_encoder(input: integer) return std_logic_vector is 
		variable result: std_logic_vector(hex_disp0'range);
	begin
		case input is
		when  0 => result := "0111111";
		when  1 => result := "0000110";
		when  2 => result := "1011011";
		when  3 => result := "1001111";
		when  4 => result := "1100110";
		when  5 => result := "1101101";
		when  6 => result := "1111101";
		when  7 => result := "0000111";
		when  8 => result := "1111111";
		when  9 => result := "1101111";
		when 10 => result := "1110111";
		when 11 => result := "1111100";
		when 12 => result := "1011000";
		when 13 => result := "1011110";
		when 14 => result := "1111001";
		when 15 => result := "1110001";
		when others => result := "0111110";
		end case;

		return not result;
	end function seven_seg_encoder;

	procedure read_access(
		signal mode: 			 in mem_mode; 
		signal buffer_reg :   inout word;
		signal output_reg:		out word
		) is

	begin 
		case mode is
		when mem_lb =>
			output_reg(7 downto 0) <= buffer_reg(7 downto 0);
			output_reg(WORD_WIDTH-1 downto 8) <= (others => buffer_reg(7));

		when mem_lh =>
			output_reg(15 downto 0) <= buffer_reg(15 downto 0);
			output_reg(WORD_WIDTH-1 downto 16) <= (others => buffer_reg(15));

		when mem_lw =>
			output_reg(31 downto 0) <= buffer_reg;

		when mem_lbu =>							
			output_reg(7 downto 0) <= buffer_reg(7 downto 0);
			output_reg(WORD_WIDTH-1 downto 8) <= (others => '0');

		when mem_lhu =>
			output_reg <= (others => '0');

		when mem_sb =>
			output_reg <= (others => '0');

		when mem_sh =>
			output_reg <= (others => '0');

		when mem_sw =>
			output_reg <= (others => '0');

		when mem_nls =>
			output_reg <= (others => '0');

		end case; 
	end procedure read_access;

	procedure read_write_access(
		signal mode: 			 in mem_mode; 
		signal buffer_reg :   inout word;
		signal output_reg:		out word
		) is

	begin 
		case mode is
		when mem_lb =>
			output_reg(7 downto 0) <= buffer_reg(7 downto 0);
			output_reg(WORD_WIDTH-1 downto 8) <= (others => buffer_reg(7));

		when mem_lh =>
			output_reg(15 downto 0) <= buffer_reg(15 downto 0);
			output_reg(WORD_WIDTH-1 downto 16) <= (others => buffer_reg(15));

		when mem_lw =>
			output_reg(31 downto 0) <= buffer_reg;

		when mem_lbu =>							
			output_reg(7 downto 0) <= buffer_reg(7 downto 0);
			output_reg(WORD_WIDTH-1 downto 8) <= (others => '0');

		when mem_lhu =>
			output_reg(15 downto 0) <= buffer_reg(15 downto 0);
			output_reg(WORD_WIDTH-1 downto 16) <= (others => '0');

		when mem_sb =>
			buffer_reg(7 downto 0)<= me_store_data_fwd(7 downto 0);

		when mem_sh =>
			buffer_reg(15 downto 0) <= me_store_data_fwd(15 downto 0);

		when mem_sw =>
			buffer_reg <= me_store_data_fwd;

		when mem_nls =>
			output_reg <= (others => '0');

		end case; 
	end procedure read_write_access;

BEGIN
	keys_sync: for key in keys'range generate
	begin
		cell_key: entity RISCV_lib.button_input port map(
			clk => clk,
			res_n => res_n,
			key_in => keys(key),
			key_out => io_keys_sync(key)
		);
	end generate keys_sync; 
	
	leds_red <= io_leds_red_buffer(leds_red'range);

	leds_green <= io_leds_green_buffer(leds_green'range);
	
	keys_interface: process(clk, res_n) is
	begin
		if res_n = '0' then
			io_keys_buffer <= (others => '0');
		else
			if clk'event and clk = '1' then
				io_keys_buffer(io_keys_sync'range) <= io_keys_sync;
			end if;
		end if;
	end process keys_interface;

    show_hex_disp: process(io_hex_buffer) is
    begin
		if io_hex_buffer <= x"FFFF" then
			hex_disp0 <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer( 3 downto  0))));
			hex_disp1 <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer( 7 downto  4))));
			hex_disp2 <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer(11 downto  8))));
			hex_disp3 <= seven_seg_encoder(to_integer(unsigned(io_hex_buffer(15 downto 12))));
		else
			hex_disp0 <= seven_seg_encoder(16);
			hex_disp1 <= seven_seg_encoder(16);
			hex_disp2 <= seven_seg_encoder(16);
			hex_disp3 <= seven_seg_encoder(16);
		end if;
    end process show_hex_disp;
	 

	read_write_io: process(clk, res_n) is
	begin
		if res_n = '0' then
			io_hex_buffer <= (others => '0');
			io_leds_red_buffer <= (others => '0');
			io_leds_green_buffer <= (others => '0');
		else
			if clk'event and clk = '1' then
				case ex_alu_out is
				when HEX_DISP_ADDR =>
					addr_reserved <= '1';
					read_write_access(
						mode 		=> ex_mem_mode, 
						buffer_reg 	=> io_hex_buffer,
						output_reg	=> io_data_out
					);
					
				when LEDS_RED_ADDR =>
					addr_reserved <= '1';
					read_write_access(
						mode 		=> ex_mem_mode, 
						buffer_reg 	=> io_leds_red_buffer,
						output_reg	=> io_data_out
					);
					
				when LEDS_GREEN_ADDR =>
					addr_reserved <= '1';
					read_write_access(
						mode 		=> ex_mem_mode, 
						buffer_reg 	=> io_leds_green_buffer,
						output_reg	=> io_data_out
					);
				
				when KEYS_ADDR =>
					addr_reserved <= '1';
					read_access(
						mode 		=> ex_mem_mode, 
						buffer_reg 	=> io_keys_buffer,
						output_reg	=> io_data_out
					);
			
				when SWITCHES_ADDR =>
					addr_reserved <= '1';
					read_access(
						mode 		=> ex_mem_mode, 
						buffer_reg 	=> io_switches_buffer,
						output_reg	=> io_data_out
					);
						
				when others =>
					addr_reserved <= '0';
					
				end case;
			end if;
		end if;
	end process read_write_io;

END ARCHITECTURE behave;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;
LIBRARY RISCV_lib;
USE RISCV_lib.all;

entity button_input is
    port( 
        clk, res_n: in std_logic;
        key_in: in std_logic;
        key_out: out std_logic
    );
end entity button_input;


architecture behav of button_input is
    signal tx_1st: std_logic;
begin
    DualRankSync: process(clk, res_n) is
    begin
        if res_n = '0' then
            tx_1st <= '0';
        else
            if clk'event and clk = '1' then
                tx_1st <= not key_in;
                key_out <= tx_1st;
            end if;
        end if;
    end process DualRankSync;

end architecture behav;
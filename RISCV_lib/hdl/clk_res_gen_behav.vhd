--
-- VHDL Architecture RISCV_lib.clk_res_gen.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 18:10:50 05/24/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
ARCHITECTURE behav OF clk_res_gen IS
BEGIN
  clk_gen: process is
    constant T: integer :=20; 
  begin
    loop
      clk <='0';
      wait for 10 ns;
      clk <='1';
      wait for 10 ns;
    end loop; 
  end process clk_gen;
  
  res_gen: process(clk) is
    constant T : integer :=20; 
    constant N: integer := 200/T;
    variable count: integer range 0 to N :=0;
  begin
    if clk'event and clk='1' then
      res_n <='1';
      if count < N then
        res_n <='0';
        count := count+1;
      else
        res_n <='1';
      end if;
    end if;
  end process res_gen;
END ARCHITECTURE behav;


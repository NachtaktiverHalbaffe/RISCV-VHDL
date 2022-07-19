--
-- VHDL Architecture RISCV_lib.SD_Fetch.behav
--
-- Created:
--          by - flxbrggr.meyer (pc084)
--          at - 17:20:00 07/12/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behav of SD_Fetch is
begin

  init_controller : process (res_n, clk) is
  begin
    if res_n = '0' then
      reset_i <= '1';
    else
      reset_i <= '0';
    end if;
  end process init_controller;

  init_read : process (load_op_mem, busy_o) is
  begin
    addr_i <= (others => '0');
    if load_op_mem = '1' then
      if busy_o = '0' then
        rd_i <= '1';
      else
        rd_i <= '0';
      end if;
    else
      rd_i <= '0';
    end if;
  end process init_read;

  read_word : process (busy_o, hndShk_o, data_o, res_n) is
    variable addr : std_logic_vector(31 downto 0);
    variable read_word : word;
    variable finished : boolean;
  begin
    if res_n = '0' then
      addr := (others => '0');
      hndShk_i <= '0';
      sp_op_code <= (others => '0');
      data_valid <= '0';
      loading <= '0';
      finished := false;
    else
      hndShk_i <= '0';
      sp_op_code <= (others => '0');
      data_valid <= '0';
      loading <= '0';
      continue_i <= '0';

      if busy_o = '1' then
        loading <= '1';
        hndShk_i <= '0';
        continue_i <= '1';
        ---------------------------------------------------------------------------------------------------
        -- Data block available from SD card
        ---------------------------------------------------------------------------------------------------
        if hndShk_o = '1' then
          case (to_integer(unsigned(addr)) mod 4) is
            when 0 =>
              -- Reset word before reading new word
              read_word := (others => '0');
              read_word(31 downto 24) := data_o;
              addr := std_logic_vector(unsigned(addr) + 1);
            when 1 =>
              read_word(23 downto 16) := data_o;
              addr := std_logic_vector(unsigned(addr) + 1);
            when 2 =>
              read_word(15 downto 8) := data_o;
              addr := std_logic_vector(unsigned(addr) + 1);
            when 3 =>
              read_word(7 downto 0) := data_o;
              addr := std_logic_vector(unsigned(addr) + 1);
              -- Detectif no op_code needs to be loaded again (Improvement possible?)
              if read_word(0) = '0' and read_word(1) = '0' then
                loading <= '0';
                finished := true;
                continue_i <= '0';
              end if;
              -- Only send op_code to IM if it still receives op_codes
              if not finished then
                sp_op_code <= read_word;
                data_valid <= '1';
                continue_i <= '1';
              end if;
            when others => null;
          end case;
          hndShk_i <= '1';
        end if;

        ---------------------------------------------------------------------------------------------------
        -- Controller recognised handshake
        ---------------------------------------------------------------------------------------------------
        if hndShk_o = '0' then
          hndShk_i <= '0';
        end if;

      else
        finished := false;
      end if;
    end if;
  end process read_word;
end architecture behav;
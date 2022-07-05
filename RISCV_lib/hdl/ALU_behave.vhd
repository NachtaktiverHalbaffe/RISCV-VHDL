--
-- VHDL Architecture RISCV_lib.ALU.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:24 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--
architecture behave of ALU is
begin
  arith : process (ex_alu_mode, alu_in_1, alu_in_2) is
    -- for adding/subtracting
    variable au_l, au_f : word;
    variable au_h : std_logic_vector(word'left + 1 downto word'left);
    -- flags
    variable au_c, au_v : std_logic;
    variable n, z,v,c : std_logic;
    -- input/output signals
    variable compute_result, temp_result : word;
    variable x, y : word;
  begin
    ---------------------------------------------------------------
    -- Addition/Substraction
    ---------------------------------------------------------------
    -- Reset variables and signals

    compute_result := (others => '0');
    temp_result := (others => '0');
    ex_alu_out <= (others => '0');
    -- Store input signals in variables for caluculation
    x := alu_in_1;
    y := alu_in_2;

    -- Performing add/sub-operation because its always needed
    if ex_alu_mode = alu_add or ex_alu_mode = alu_jalr or ex_alu_mode = alu_jal then
      au_l := std_logic_vector(
        unsigned('0' & x(x'left - 1 downto x'right)) +
        unsigned('0' & y(y'left - 1 downto y'right)));
      au_h := std_logic_vector(
        unsigned('0' & x(x'left downto x'left)) +
        unsigned('0' & y(y'left downto y'left)) +
        unsigned('0' & au_l(au_l'left downto au_l'left)));
    else
      au_l := std_logic_vector(
        unsigned('0' & x(x'left - 1 downto x'right)) -
        unsigned('0' & y(y'left - 1 downto y'right)));
      au_h := std_logic_vector(
        unsigned('0' & x(x'left downto x'left)) -
        unsigned('0' & y(y'left downto y'left)) -
        unsigned('0' & au_l(au_l'left downto au_l'left)));
    end if;
    
    au_c := au_h(au_h'left);
    au_v := au_h(au_h'left) xor au_l(au_l'left);
    au_f := au_h(au_h'right) & au_l(au_l'left - 1 downto au_l'right);

    -- signed substraction because branches could need signed substraction
    temp_result := std_logic_vector(signed(x) - signed(y));
    ---------------------------------------------------------------
    -- Perform ALU operation
    ---------------------------------------------------------------
    case ex_alu_mode is
      when alu_add | alu_sub =>
        compute_result := au_f;
        
        --   shift operations
      when alu_sll =>
        compute_result := std_logic_vector(shift_left(unsigned(x), to_integer(unsigned(y))));
        c := x(x'left);
        v := x(x'left) xor x(x'left - 1);
      when alu_srl => ex_alu_out <= x;
        compute_result := std_logic_vector(shift_right(unsigned(x), to_integer(unsigned(y))));
        c := x(x'right);
        v := x(x'left) xor '0';
      when alu_sra =>
        compute_result := x(x'left) & x(x'left downto x'right + 1);
        --   logical operations
      when alu_and =>
        compute_result := x and y;
        c := '0';
        v := '0';
      when alu_or =>
        compute_result := x or y;
        c := '0';
        v := '0';
      when alu_xor =>
        compute_result := x xor y;
        c := '0';
        v := '0';
        --  Set less
      when alu_slt =>
        temp_result := std_logic_vector(signed(x) - signed(y));
        c := '0';
        v := '0';
        if temp_result(31) = '1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when alu_sltu => null;
        temp_result := std_logic_vector(unsigned(x) - unsigned(y));
        c := '0';
        v := '0';
        if temp_result(31) = '1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when others => compute_result := au_f;
    end case;

    ---------------------------------------------------------------
    -- Set flags
    ---------------------------------------------------------------
    n := compute_result(compute_result'left);
    if compute_result = x"00000000" then
      z := '1';
    else
      z := '0';
    end if;

    ---------------------------------------------------------------
    -- Process branch checks
    ---------------------------------------------------------------
    case ex_alu_mode is
      when alu_jalr | alu_jal =>
        compute_result := std_logic_vector(signed(au_f) + 4);
      when alu_beq =>
        if z = '0' then
          compute_result := X"00000000";
        else
          compute_result := X"00000001";
        end if;
      when alu_bne =>
        if z = '0' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when alu_blt =>
        if n = '1' xor v='1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when alu_bge =>
        if n = '0' xor v='1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when alu_bltu =>
        if c = '1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when alu_bgeu =>
        if c = '0' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when others => compute_result := compute_result;
    end case;

    ---------------------------------------------------------------
    -- Set output signals
    ---------------------------------------------------------------
    ex_alu_out <= compute_result;

  end process arith;
end architecture behave;
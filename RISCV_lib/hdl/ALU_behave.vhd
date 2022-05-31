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

  arith : process (ex_alu_mode, ex_rs1, alu_in_2) is
    -- Carry for carry-ripple-add
    variable c_in : std_logic;
    variable c_word : word;

    -- for adding/subtracting
    variable au_l, au_f : word;
    variable au_h : std_logic_vector(word'left + 1 downto word'left);
    variable au_c, au_v : std_logic;
    -- flags
    variable n, z, v, c : std_logic;
    -- input/output signals
    variable compute_result, temp_result : word;
    variable x, y : word;
  begin
    ---------------------------------------------------------------
    -- Addition/Substraction
    ---------------------------------------------------------------
    -- Reset variables
    c_word := (0 => c_in, others => '0');
    compute_result := (others => '0');
    temp_result := (others => '0');
    -- Store input signals in variables for caluculation
    x := ex_rs1;
    y := alu_in_2;

    -- Performing add/sub-operation because its always needed
    if ex_alu_mode = alu_add then
      au_l := std_logic_vector(
        unsigned('0' & x(x'left - 1 downto x'right)) +
        unsigned('0' & y(y'left - 1 downto y'right)) + unsigned(c_word));
      au_h := std_logic_vector(
        unsigned('0' & x(x'left downto x'left)) +
        unsigned('0' & y(y'left downto y'left)) +
        unsigned('0' & au_l(au_l'left downto au_l'left)));
    else
      au_l := std_logic_vector(
        unsigned('0' & x(x'left - 1 downto x'right)) -
        unsigned('0' & y(y'left - 1 downto y'right)) - unsigned(c_word));
      au_h := std_logic_vector(
        unsigned('0' & x(x'left downto x'left)) -
        unsigned('0' & y(y'left downto y'left)) -
        unsigned('0' & au_l(au_l'left downto au_l'left)));
    end if;

    au_c := au_h(au_h'left);
    au_v := au_h(au_h'left) xor au_l(au_l'left);
    au_f := au_h(au_h'right) & au_l(au_l'left - 1 downto au_l'right);

    ---------------------------------------------------------------
    -- Perform ALU operation
    ---------------------------------------------------------------
    case ex_alu_mode is
      when alu_add | alu_sub =>
        compute_result := au_f;
        c := au_c;
        v := au_v;
        --   shift operations
      when alu_sll =>
        compute_result := x(x'left - 1 downto x'right) & '0';
        c := x(x'left);
        v := x(x'left) xor x(x'left - 1);
      when alu_srl => ex_alu_out <= x;
        compute_result := '0' & x(x'left downto x'right + 1);
        c := x(x'right);
        v := x(x'left) xor '0';
      when alu_sra =>
        compute_result := x(x'left) & x(x'left downto x'right + 1);
        c := x(x'right);
        v := x(x'left) xor x(x'left);
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
        c := '0';
        v := '0';
        temp_result := std_logic_vector(signed(x) - signed(y));
        if temp_result(31) = '1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when alu_sltu => null;
        c := '0';
        v := '0';
        temp_result := std_logic_vector(unsigned(x) - unsigned(y));
        if temp_result(31) = '1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
        -- branch operations
      when alu_jal => null;
      when alu_jalr => null;
      when alu_beq => null;
      when alu_bne => null;
      when alu_blt => null;
      when alu_bge => null;
      when alu_bltu => null;
      when alu_bgeu => null;
      when others => compute_result := (others => '0');
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
    -- Set output signals
    ---------------------------------------------------------------
    ex_alu_out <= compute_result;

  end process arith;
end architecture behave;
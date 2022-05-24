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
    -- Carry for 
    variable c_in : std_logic;
    variable c_word : word;

    -- for adding/subtracting
    variable au_l, au_f : word;
    variable au_h : std_logic_vector(word'left + 1 downto word'left);
    variable au_c, au_v : std_logic;
    -- flags
    variable n, z, v, c : std_logic;

    variable compute_result : word;
    variable temp_result: word;
  begin
    ---------------------------------------------------------------
    -- Addition/Substraktion
    ---------------------------------------------------------------
    c_word := (0 => c_in, others => '0');
    compute_result := (others => '0');

    -- Computing half
    if ex_alu_mode = alu_add then
      au_l := std_logic_vector(
      unsigned('0' & ex_rs1(ex_rs1'left - 1 downto ex_rs1'right)) +
      unsigned('0' & alu_in_2(alu_in_2'left - 1 downto alu_in_2'right)) + unsigned(c_word));
      au_h := std_logic_vector(
      unsigned('0' & ex_rs1(ex_rs1'left downto ex_rs1'left)) +
      unsigned('0' & alu_in_2(alu_in_2'left downto alu_in_2'left)) +
      unsigned('0' & au_l(au_l'left downto au_l'left)));
      else
      au_l := std_logic_vector(
      unsigned('0' & ex_rs1(ex_rs1'left - 1 downto ex_rs1'right)) -
      unsigned('0' & alu_in_2(alu_in_2'left - 1 downto alu_in_2'right)) - unsigned(c_word));
      au_h := std_logic_vector(
      unsigned('0' & ex_rs1(ex_rs1'left downto ex_rs1'left)) -
      unsigned('0' & alu_in_2(alu_in_2'left downto alu_in_2'left)) -
      unsigned('0' & au_l(au_l'left downto au_l'left)));
    end if;

    -- Set flags and sum
    au_c := au_h(au_h'left);
    au_v := au_h(au_h'left) xor au_l(au_l'left);
    au_f := au_h(au_h'right) & au_l(au_l'left - 1 downto au_l'right);

    ---------------------------------------------------------------
    -- compute output and flags
    ---------------------------------------------------------------
    case ex_alu_mode is
      when alu_add | alu_sub =>
        compute_result := au_f;
        c := au_c;
        v := au_v;
          --   shift operations
          when alu_sll =>
          compute_result := ex_rs1(ex_rs1'left - 1 downto ex_rs1'right) & '0';
        c := ex_rs1(ex_rs1'left);
        v := ex_rs1(ex_rs1'left) xor ex_rs1(ex_rs1'left - 1);
      when alu_srl => ex_alu_out <= ex_rs1;
        compute_result := '0' & ex_rs1(ex_rs1'left downto ex_rs1'right + 1);
        c := ex_rs1(ex_rs1'right);
        v := ex_rs1(ex_rs1'left) xor '0';
      when alu_sra =>
        compute_result := ex_rs1(ex_rs1'left) & ex_rs1(ex_rs1'left downto ex_rs1'right + 1);
        c := ex_rs1(ex_rs1'right);
        v := ex_rs1(ex_rs1'left) xor ex_rs1(ex_rs1'left);
        --   logical operations
      when alu_and =>
        compute_result := ex_rs1 and alu_in_2;
        c := '0';
        v := '0';
      when alu_or =>
        compute_result := ex_rs1 or alu_in_2;
        c := '0';
        v := '0';
      when alu_xor =>
        compute_result := ex_rs1 xor alu_in_2;
        c := '0';
        v := '0';
        --  Set less
      when alu_slt =>
        c := '0';
        v := '0';
        temp_result :=  std_logic_vector(signed(ex_rs1) - signed(alu_in_2));
        if temp_result(31) = '1' then
          compute_result := X"00000001";
        else
          compute_result := X"00000000";
        end if;
      when alu_sltu => null;
        c := '0';
        v := '0';
        temp_result := std_logic_vector(unsigned(ex_rs1) - unsigned(alu_in_2));
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

    -- Set flags
    n := compute_result(compute_result'left);
    if compute_result = x"00000000" then
      z := '1';
    else
      z := '0';
    end if;
    
    ex_alu_out <= compute_result;
  end process arith;
end architecture behave;
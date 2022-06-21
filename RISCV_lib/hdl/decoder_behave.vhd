--
-- VHDL Architecture RISCV_lib.decoder.behave
--
-- Created:
--          by - flxbrggr.meyer (pc085)
--          at - 17:55:04 05/10/22
--
-- using Mentor Graphics HDL Designer(TM) 2020.2 Built on 12 Apr 2020 at 11:28:22
--

architecture behave of decoder is
  signal op_code_sliced : std_logic_vector(6 downto 0);
  signal func3 : std_logic_vector(2 downto 0);
  signal func7 : std_logic_vector(6 downto 0);
  signal rs1, rs2 : std_logic_vector(4 downto 0);
  signal insert_nop : boolean;
begin

  op_code_sliced <= op_code(6 downto 0);
  func3 <= op_code(14 downto 12);
  func7 <= op_code(31 downto 25);

  decode_alu : process (op_code_sliced, func3, func7) is
  begin
    dec_alu_mode <= alu_add;
    case op_code_sliced is
        -- arithmetic operations
      when isa_arith_direct_op | isa_arith_imm_op =>
        case func3 is
          when isa_add_func3 =>
            if func7 = isa_add_func7 then
              dec_alu_mode <= alu_add;
            elsif func7 = isa_sub_func7 then
              dec_alu_mode <= alu_sub;
            end if;
            -- shifting
          when isa_sll_func3 => dec_alu_mode <= alu_sll;
          when isa_srl_func3 =>
            if func7 = isa_sra_func7 then
              dec_alu_mode <= alu_sra;
            else
              dec_alu_mode <= alu_srl;
            end if;
          when isa_slt_func3 => dec_alu_mode <= alu_slt;
          when isa_sltu_func3 => dec_alu_mode <= alu_sltu;
            -- logical operations
          when isa_xor_func3 => dec_alu_mode <= alu_xor;
          when isa_or_func3 => dec_alu_mode <= alu_or;
          when isa_and_func3 => dec_alu_mode <= alu_and;
          when others => dec_alu_mode <= alu_add;
        end case;
        -- branch operations
      when isa_bra_op =>
        case func3 is
          when isa_beq_func3 => dec_alu_mode <= alu_beq;
          when isa_bne_func3 => dec_alu_mode <= alu_bne;
          when isa_blt_func3 => dec_alu_mode <= alu_blt;
          when isa_bge_func3 => dec_alu_mode <= alu_bge;
          when isa_bltu_func3 => dec_alu_mode <= alu_bltu;
          when isa_bgeu_func3 => dec_alu_mode <= alu_bgeu;
          when others => dec_alu_mode <= alu_add;
        end case;
      when others => dec_alu_mode <= alu_add;
    end case;
  end process decode_alu;

  decode_imm : process (op_code_sliced, func3, func7) is
  begin
    case op_code_sliced is
        -- I-Type formatting
      when isa_arith_imm_op | isa_load_op | isa_jalr_op =>
        dec_imm_type <= I_type;
        dec_mux_alu_sel <= '1';
        -- S-Type formatting
      when isa_store_op =>
        dec_imm_type <= S_type;
        dec_mux_alu_sel <= '1';
        -- B-Type formatting
      when isa_bra_op =>
        dec_imm_type <= B_type;
        dec_mux_alu_sel <= '1';
        -- U-Type formattingmem_mode
      when isa_lui_op | isa_auipc_op =>
        dec_imm_type <= U_type;
        dec_mux_alu_sel <= '1';
        --   J-Type formatting
      when isa_jal_op =>
        dec_imm_type <= J_type;
        dec_mux_alu_sel <= '1';
      when others =>
        dec_imm_type <= R_type;
        dec_mux_alu_sel <= '0';
    end case;
  end process decode_imm;

  decode_mem : process (op_code_sliced, func3) is
  begin
    case op_code_sliced is
      when isa_store_op =>
        case func3 is
          when isa_sb_func3 => dec_mem_mode <= mem_sb;
          when isa_sh_func3 => dec_mem_mode <= mem_sh;
          when isa_sw_func3 => dec_mem_mode <= mem_sw;
          when others => dec_mem_mode <= mem_nls;
        end case;
      when isa_load_op =>
        case func3 is
          when isa_lb_func3 => dec_mem_mode <= mem_lb;
          when isa_lh_func3 => dec_mem_mode <= mem_lh;
          when isa_lw_func3 => dec_mem_mode <= mem_lw;
          when isa_lbu_func3 => dec_mem_mode <= mem_lbu;
          when isa_lhu_func3 => dec_mem_mode <= mem_lhu;
          when others => dec_mem_mode <= mem_nls;
        end case;
      when others => dec_mem_mode <= mem_nls;
    end case;
  end process decode_mem;

  decode_rf : process (op_code_sliced, op_code, insert_nop) is
  begin
    dec_target_reg <= b"00000";
    sel_rs1 <= b"00000";
    sel_rs2 <= b"00000";
    case op_code_sliced is
        -- R-Type formatting
      when isa_arith_direct_op =>
        dec_target_reg <= op_code(11 downto 7);
        sel_rs1 <= op_code(19 downto 15);
        sel_rs2 <= op_code(24 downto 20);
        rs1 <= op_code(19 downto 15);
        rs2 <= op_code(24 downto 20);
        -- I-Type formatting
      when isa_arith_imm_op | isa_load_op | isa_jalr_op =>
        dec_target_reg <= op_code(11 downto 7);
        sel_rs1 <= op_code(19 downto 15);
        rs1 <= op_code(19 downto 15);
        rs2 <= (others => '0');
        -- S-Type/B-Type formatting
      when isa_store_op | isa_bra_op => null;
        sel_rs1 <= op_code(19 downto 15);
        sel_rs2 <= op_code(24 downto 20);
        rs1 <= op_code(19 downto 15);
        rs2 <= op_code(24 downto 20);
        -- U-Type/J-Type formatting
      when isa_jal_op | isa_lui_op | isa_auipc_op =>
        dec_target_reg <= op_code(11 downto 7);
      when others =>
        dec_target_reg <= b"00000";
        sel_rs1 <= b"00000";
        sel_rs2 <= b"00000";
        rs1 <= b"00000";
        rs2 <= b"00000";
    end case;

    if insert_nop then
      dec_target_reg <= b"00000";
    end if;

  end process decode_rf;

  forwarding : process (op_code_sliced, rs1, rs2, ex_target_reg, me_target_reg, ex_mem_mode, me_mem_mode) is
  begin
    insert_nop <= false;
    stall <= '0';
    dec_mux_fw_rs1_sel <= fwd_reg_data;
    dec_mux_fw_rs2_sel <= fwd_reg_data;
    dec_mux_fw_mem_sel <= fwd_reg_data;
    ----------------------------------------------------------
    -- RAW
    ----------------------------------------------------------
    -- rs1
    if rs1 = ex_target_reg then
      dec_mux_fw_rs1_sel <= fwd_alu_data;
    elsif rs1 = me_target_reg then
      dec_mux_fw_rs1_sel <= fwd_return_data;
    end if;
    -- rs2
    if rs2 = ex_target_reg   then
      dec_mux_fw_rs2_sel <= fwd_alu_data;
    elsif rs2 = me_target_reg  then
      dec_mux_fw_rs2_sel <= fwd_return_data;
    end if;

    ----------------------------------------------------------
    -- Store after Load
    ----------------------------------------------------------
    -- rs1
    if rs1 = me_target_reg and op_code_sliced = isa_store_op then
      dec_mux_fw_rs1_sel <= fwd_alu_data;
    end if;
    -- rs2
    if rs1 = me_target_reg and op_code_sliced = isa_store_op then
      dec_mux_fw_rs2_sel <= fwd_alu_data;
    end if;

    ----------------------------------------------------------
    -- RAL
    ----------------------------------------------------------
    -- rs1
    -- Detects the load in execute stage => stall
    if rs1 = ex_target_reg and rs1 /= b"00000" and(ex_mem_mode = mem_lw or ex_mem_mode = mem_lb or ex_mem_mode = mem_lh or ex_mem_mode = mem_lbu or ex_mem_mode = mem_lhu) then
      stall <= '1';
      insert_nop <= true;
    -- Detects Load in memory stage => set forwarding signal
    elsif rs1 = me_target_reg and (me_mem_mode = mem_lw or me_mem_mode = mem_lb or me_mem_mode = mem_lh or me_mem_mode = mem_lbu or me_mem_mode = mem_lhu) then
      stall <= '0';
      dec_mux_fw_rs1_sel <= fwd_return_data;
    end if;
    -- rs2
    -- Detects the load in execute stage => stall
    if rs2 = ex_target_reg and rs2 /= b"00000" and (ex_mem_mode = mem_lw or ex_mem_mode = mem_lb or ex_mem_mode = mem_lh or ex_mem_mode = mem_lbu or ex_mem_mode = mem_lhu) then
      stall <= '1';
      insert_nop <= true;
    -- Detects Load in memory stage => set forwarding signal
    elsif rs2 = me_target_reg and (me_mem_mode = mem_lw or me_mem_mode = mem_lb or me_mem_mode = mem_lh or me_mem_mode = mem_lbu or me_mem_mode = mem_lhu) then
      stall <= '0';
      dec_mux_fw_rs2_sel <= fwd_return_data;
    end if;
    
    if rs1 = b"00000" then
      dec_mux_fw_rs1_sel <= fwd_reg_data;
    end if;
    if rs2 = b"00000" then
      dec_mux_fw_rs2_sel <= fwd_reg_data;
    end if;
    
  end process forwarding;

end architecture behave;
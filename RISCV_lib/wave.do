onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /riscv_tb/U_0/clk
add wave -noupdate /riscv_tb/U_0/res_n
add wave -noupdate /riscv_tb/U_0/stall
add wave -noupdate -expand -group {IF Signale} /riscv_tb/U_0/if_op_code
add wave -noupdate -expand -group {IF Signale} -expand -group {IF Signale} /riscv_tb/U_0/if_pc
add wave -noupdate -expand -group {IF Signale} -expand -group {IF Signale} /riscv_tb/U_0/next_PC
add wave -noupdate -expand -group {IF Signale} -group Debug /riscv_tb/U_0/U_1/op_code_mnemonic
add wave -noupdate -expand -group {DEC Signale} -group BPU /riscv_tb/U_0/dec_sbta_valid
add wave -noupdate -expand -group {DEC Signale} -group BPU /riscv_tb/U_0/dec_dbpu_addr_sel
add wave -noupdate -expand -group {DEC Signale} -group BPU /riscv_tb/U_0/dec_dbpu_mode
add wave -noupdate -expand -group {DEC Signale} -group BPU /riscv_tb/U_0/dec_jmp_target
add wave -noupdate -expand -group {DEC Signale} -expand -group Steuersignale /riscv_tb/U_0/dec_alu_mode
add wave -noupdate -expand -group {DEC Signale} -expand -group Steuersignale /riscv_tb/U_0/dec_mem_mode
add wave -noupdate -expand -group {DEC Signale} -group Immediate /riscv_tb/U_0/dec_imm
add wave -noupdate -expand -group {DEC Signale} -group Immediate /riscv_tb/U_0/dec_imm_type
add wave -noupdate -expand -group {DEC Signale} -group Immediate /riscv_tb/U_0/dec_mux_alu_sel
add wave -noupdate -expand -group {DEC Signale} -expand -group RF /riscv_tb/U_0/U_5/wb_data
add wave -noupdate -expand -group {DEC Signale} -expand -group RF /riscv_tb/U_0/U_5/wb_traget_reg
add wave -noupdate -expand -group {DEC Signale} -expand -group RF -expand /riscv_tb/U_0/U_5/registers
add wave -noupdate -expand -group {DEC Signale} -expand -group RF /riscv_tb/U_0/U_4/sel_rs1
add wave -noupdate -expand -group {DEC Signale} -expand -group RF /riscv_tb/U_0/U_4/sel_rs2
add wave -noupdate -expand -group {DEC Signale} -expand -group RF /riscv_tb/U_0/dec_target_reg
add wave -noupdate -expand -group {DEC Signale} -expand -group RF /riscv_tb/U_0/dec_rs1
add wave -noupdate -expand -group {DEC Signale} -expand -group RF /riscv_tb/U_0/dec_rs2
add wave -noupdate -expand -group {DEC Signale} -group Forwarding /riscv_tb/U_0/dec_mux_fw_mem_sel
add wave -noupdate -expand -group {DEC Signale} -group Forwarding /riscv_tb/U_0/dec_mux_fw_rs1_sel
add wave -noupdate -expand -group {DEC Signale} -group Forwarding /riscv_tb/U_0/dec_mux_fw_rs2_sel
add wave -noupdate -expand -group {EX Signale} -group ALU /riscv_tb/U_0/ex_alu_mode
add wave -noupdate -expand -group {EX Signale} -group ALU /riscv_tb/U_0/U_7/arith/x
add wave -noupdate -expand -group {EX Signale} -group ALU /riscv_tb/U_0/U_7/arith/y
add wave -noupdate -expand -group {EX Signale} -group ALU /riscv_tb/U_0/ex_imm
add wave -noupdate -expand -group {EX Signale} -group ALU /riscv_tb/U_0/U_7/arith/compute_result
add wave -noupdate -expand -group {EX Signale} -group ALU -group {Calc Variables} /riscv_tb/U_0/U_7/arith/au_l
add wave -noupdate -expand -group {EX Signale} -group ALU -group {Calc Variables} /riscv_tb/U_0/U_7/arith/au_f
add wave -noupdate -expand -group {EX Signale} -group ALU -group {Calc Variables} /riscv_tb/U_0/U_7/arith/au_h
add wave -noupdate -expand -group {EX Signale} -group ALU -group {Calc Variables} /riscv_tb/U_0/U_7/arith/temp_result
add wave -noupdate -expand -group {EX Signale} -group ALU -group Flags /riscv_tb/U_0/U_7/arith/n
add wave -noupdate -expand -group {EX Signale} -group ALU -group Flags /riscv_tb/U_0/U_7/arith/z
add wave -noupdate -expand -group {EX Signale} -expand -group BPU /riscv_tb/U_0/ex_dbpu_addr_sel
add wave -noupdate -expand -group {EX Signale} -expand -group BPU /riscv_tb/U_0/ex_dbpu_mode
add wave -noupdate -expand -group {EX Signale} -expand -group BPU /riscv_tb/U_0/ex_dbta_valid
add wave -noupdate -expand -group {EX Signale} -expand -group BPU /riscv_tb/U_0/ex_jmp_target
add wave -noupdate -expand -group {EX Signale} /riscv_tb/U_0/ex_alu_out
add wave -noupdate -expand -group {EX Signale} /riscv_tb/U_0/ex_mem_mode
add wave -noupdate -expand -group {EX Signale} -expand -group Registers /riscv_tb/U_0/ex_rs1
add wave -noupdate -expand -group {EX Signale} -expand -group Registers /riscv_tb/U_0/ex_rs2
add wave -noupdate -expand -group {EX Signale} -expand -group Registers /riscv_tb/U_0/ex_target_reg
add wave -noupdate -expand -group {EX Signale} -group Forwarding /riscv_tb/U_0/ex_mux_fw_mem_sel
add wave -noupdate -expand -group {EX Signale} -group Forwarding /riscv_tb/U_0/ex_mux_fw_rs1_sel
add wave -noupdate -expand -group {EX Signale} -group Forwarding /riscv_tb/U_0/ex_mux_fw_rs2_sel
add wave -noupdate -expand -group {EX Signale} -group Forwarding /riscv_tb/U_0/ex_rs2
add wave -noupdate -expand -group {EX Signale} -group Forwarding /riscv_tb/U_0/ex_mux_alu_sel
add wave -noupdate -group {ME Signale} /riscv_tb/U_0/me_me_out
add wave -noupdate -group {ME Signale} -group {IO Controller} /riscv_tb/U_0/U_21/io_data_out
add wave -noupdate -group {ME Signale} -group {IO Controller} /riscv_tb/U_0/U_21/addr_reserved
add wave -noupdate -group {ME Signale} -group {IO Controller} /riscv_tb/U_0/U_21/hex_disp0
add wave -noupdate -group {ME Signale} -group {IO Controller} /riscv_tb/U_0/U_21/hex_disp1
add wave -noupdate -group {ME Signale} -group {IO Controller} /riscv_tb/U_0/U_21/hex_disp2
add wave -noupdate -group {ME Signale} -group {IO Controller} /riscv_tb/U_0/U_21/hex_disp3
add wave -noupdate -group {ME Signale} -expand -group Memory /riscv_tb/U_0/ex_mem_mode
add wave -noupdate -group {ME Signale} -expand -group Memory /riscv_tb/U_0/me_mem_mode
add wave -noupdate -group {ME Signale} -expand -group Memory /riscv_tb/U_0/U_12/me_store_data_fwd
add wave -noupdate -group {ME Signale} -expand -group Memory /riscv_tb/U_0/ex_alu_out
add wave -noupdate -group {ME Signale} -expand -group Memory /riscv_tb/U_0/U_12/memory_file
add wave -noupdate -group {ME Signale} -group Forwarding /riscv_tb/U_0/ex_mux_fw_mem_sel
add wave -noupdate -group {ME Signale} /riscv_tb/U_0/U_10/me_target_reg
add wave -noupdate -group {WB Signale} /riscv_tb/U_0/U_10/wb_data
add wave -noupdate -group {WB Signale} /riscv_tb/U_0/U_10/wb_traget_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1345 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 225
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {806 ns} {1537 ns}

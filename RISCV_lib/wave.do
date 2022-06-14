onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /riscv_tb/U_0/clk
add wave -noupdate /riscv_tb/U_0/res_n
add wave -noupdate -expand -group {IF Signale} /riscv_tb/U_0/if_pc
add wave -noupdate -expand -group {IF Signale} /riscv_tb/U_0/next_PC
add wave -noupdate -expand -group {IF Signale} /riscv_tb/U_0/if_op_code
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/dec_alu_mode
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/dec_imm
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/dec_imm_type
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/dec_mux_alu_sel
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/U_4/sel_rs1
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/U_4/sel_rs2
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/dec_rs1
add wave -noupdate -group {DEC Signale} /riscv_tb/U_0/dec_rs2
add wave -noupdate -group RF /riscv_tb/U_0/U_5/wb_data
add wave -noupdate -group RF /riscv_tb/U_0/U_5/wb_traget_reg
add wave -noupdate -group RF /riscv_tb/U_0/U_5/registers
add wave -noupdate -group {EX Signale} /riscv_tb/U_0/ex_alu_mode
add wave -noupdate -group {EX Signale} /riscv_tb/U_0/ex_alu_out
add wave -noupdate -group {EX Signale} /riscv_tb/U_0/ex_imm
add wave -noupdate -group {EX Signale} /riscv_tb/U_0/ex_mux_alu_sel
add wave -noupdate -group {EX Signale} /riscv_tb/U_0/ex_rs1
add wave -noupdate -group {EX Signale} /riscv_tb/U_0/ex_rs2
add wave -noupdate -group {EX Signale} /riscv_tb/U_0/ex_target_reg
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/au_l
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/au_f
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/au_h
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/au_c
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/au_v
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/n
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/z
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/v
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/c
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/compute_result
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/temp_result
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/x
add wave -noupdate -group ALU /riscv_tb/U_0/U_7/arith/y
add wave -noupdate -expand -group {ME Signale} /riscv_tb/U_0/U_12/me_mem_mode
add wave -noupdate -expand -group {ME Signale} /riscv_tb/U_0/U_12/me_store_data_fwd
add wave -noupdate -expand -group {ME Signale} /riscv_tb/U_0/U_12/me_alu_out
add wave -noupdate -expand -group {ME Signale} /riscv_tb/U_0/U_10/me_target_reg
add wave -noupdate -group {WB Signale} /riscv_tb/U_0/U_10/wb_data
add wave -noupdate -group {WB Signale} /riscv_tb/U_0/U_10/wb_traget_reg
add wave -noupdate /riscv_tb/U_0/U_12/memory_file
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {601 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ns} {4111 ns}

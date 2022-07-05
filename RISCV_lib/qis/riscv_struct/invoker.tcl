package require ::quartus::project
set need_to_close_project 0
set make_assignments 1
# Check that the right project is open
if {[is_project_open]} {
   if {[string compare $quartus(project) "riscv"]} {
      puts "Project riscv is not open"
      set make_assignments 0
   }
} else {
   # Only open if not already open
   if {[project_exists riscv]} {
      project_open -revision riscv riscv
   } else {
      project_new -revision riscv riscv
   }
   set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
   set_global_assignment -name COMPILER_SETTINGS riscv
   set_global_assignment -name SIMULATOR_SETTINGS riscv
   set_global_assignment -name SOFTWARE_SETTINGS riscv
   set_global_assignment -name FMAX_REQUIREMENT 50MHz
   set_global_assignment -name FAMILY "cyclone v"
   set_global_assignment -name TOP_LEVEL_ENTITY riscv
   set_global_assignment -name DEVICE 5cgxfc5c6f27c7
   set_global_assignment -name USE_COMPILER_SETTINGS riscv
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/constants_pkg.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/data_types_pkg.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/riscv_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/ISA_pkg.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/pc_reg_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/pc_reg_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/im_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/IM_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/me_reg_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/me_reg_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_alu_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_alu_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/memory_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/Memory_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_memory_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_memory_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_fw_rs1_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_fw_rs1_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_fw_rs2_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_fw_rs2_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_fw_memory_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_fw_memory_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_nop_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_nop_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/dbpu_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/DBPU_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/sbpu_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/SBPU_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/if_reg_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/if_reg_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_bpu_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/mux_bpu_behav.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/io_controller_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/io_controller_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/pc_inc_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/pc_inc_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/decoder_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/decoder_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/rf_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/RF_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/dec_reg_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/dec_reg_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/alu_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/ALU_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/ex_reg_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/ex_reg_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/imm_gen_entity.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/Imm_Gen_behave.vhd" 
	set_global_assignment -name VHDL_FILE "/u/home/stud/flxbrggr/dev/HDS/RISCV/RISCV_lib/hdl/riscv_struct.vhd" 


   # Commit assignments
   export_assignments


   # Close project
   if {$need_to_close_project} {
      project_close
   }
}


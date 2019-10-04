
# (C) 2001-2019 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 18.1 625 linux 2019.10.01.23:40:08
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     q_sys
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "aldec.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/aldec/rivierapro_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# set USER_DEFINED_VHDL_COMPILE_OPTIONS <compilation options for VHDL>
# set USER_DEFINED_VERILOG_COMPILE_OPTIONS <compilation options for Verilog>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog -sv2k5 <your compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If q_sys is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "q_sys"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "/home/switch/intelFPGA_lite/18.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VHDL_COMPILE_OPTIONS] { 
  set USER_DEFINED_VHDL_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_VERILOG_COMPILE_OPTIONS] { 
  set USER_DEFINED_VERILOG_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                       ./libraries/altera_ver           
vmap       altera_ver            ./libraries/altera_ver           
ensure_lib                       ./libraries/lpm_ver              
vmap       lpm_ver               ./libraries/lpm_ver              
ensure_lib                       ./libraries/sgate_ver            
vmap       sgate_ver             ./libraries/sgate_ver            
ensure_lib                       ./libraries/altera_mf_ver        
vmap       altera_mf_ver         ./libraries/altera_mf_ver        
ensure_lib                       ./libraries/altera_lnsim_ver     
vmap       altera_lnsim_ver      ./libraries/altera_lnsim_ver     
ensure_lib                       ./libraries/cyclonev_ver         
vmap       cyclonev_ver          ./libraries/cyclonev_ver         
ensure_lib                       ./libraries/cyclonev_hssi_ver    
vmap       cyclonev_hssi_ver     ./libraries/cyclonev_hssi_ver    
ensure_lib                       ./libraries/cyclonev_pcie_hip_ver
vmap       cyclonev_pcie_hip_ver ./libraries/cyclonev_pcie_hip_ver
ensure_lib                                                                      ./libraries/error_adapter_0                                                     
vmap       error_adapter_0                                                      ./libraries/error_adapter_0                                                     
ensure_lib                                                                      ./libraries/rsp_mux                                                             
vmap       rsp_mux                                                              ./libraries/rsp_mux                                                             
ensure_lib                                                                      ./libraries/rsp_demux                                                           
vmap       rsp_demux                                                            ./libraries/rsp_demux                                                           
ensure_lib                                                                      ./libraries/cmd_mux                                                             
vmap       cmd_mux                                                              ./libraries/cmd_mux                                                             
ensure_lib                                                                      ./libraries/cmd_demux                                                           
vmap       cmd_demux                                                            ./libraries/cmd_demux                                                           
ensure_lib                                                                      ./libraries/router_001                                                          
vmap       router_001                                                           ./libraries/router_001                                                          
ensure_lib                                                                      ./libraries/router                                                              
vmap       router                                                               ./libraries/router                                                              
ensure_lib                                                                      ./libraries/avalon_st_adapter_002                                               
vmap       avalon_st_adapter_002                                                ./libraries/avalon_st_adapter_002                                               
ensure_lib                                                                      ./libraries/router_003                                                          
vmap       router_003                                                           ./libraries/router_003                                                          
ensure_lib                                                                      ./libraries/avalon_st_adapter_001                                               
vmap       avalon_st_adapter_001                                                ./libraries/avalon_st_adapter_001                                               
ensure_lib                                                                      ./libraries/avalon_st_adapter                                                   
vmap       avalon_st_adapter                                                    ./libraries/avalon_st_adapter                                                   
ensure_lib                                                                      ./libraries/limiter_pipeline                                                    
vmap       limiter_pipeline                                                     ./libraries/limiter_pipeline                                                    
ensure_lib                                                                      ./libraries/pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter
vmap       pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter ./libraries/pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter
ensure_lib                                                                      ./libraries/rsp_mux_003                                                         
vmap       rsp_mux_003                                                          ./libraries/rsp_mux_003                                                         
ensure_lib                                                                      ./libraries/rsp_mux_001                                                         
vmap       rsp_mux_001                                                          ./libraries/rsp_mux_001                                                         
ensure_lib                                                                      ./libraries/rsp_demux_001                                                       
vmap       rsp_demux_001                                                        ./libraries/rsp_demux_001                                                       
ensure_lib                                                                      ./libraries/cmd_mux_001                                                         
vmap       cmd_mux_001                                                          ./libraries/cmd_mux_001                                                         
ensure_lib                                                                      ./libraries/cmd_demux_003                                                       
vmap       cmd_demux_003                                                        ./libraries/cmd_demux_003                                                       
ensure_lib                                                                      ./libraries/cmd_demux_001                                                       
vmap       cmd_demux_001                                                        ./libraries/cmd_demux_001                                                       
ensure_lib                                                                      ./libraries/onchip_memory2_0_s1_burst_adapter                                   
vmap       onchip_memory2_0_s1_burst_adapter                                    ./libraries/onchip_memory2_0_s1_burst_adapter                                   
ensure_lib                                                                      ./libraries/ctl_0_dma_read_master_0_data_read_master_limiter                    
vmap       ctl_0_dma_read_master_0_data_read_master_limiter                     ./libraries/ctl_0_dma_read_master_0_data_read_master_limiter                    
ensure_lib                                                                      ./libraries/router_006                                                          
vmap       router_006                                                           ./libraries/router_006                                                          
ensure_lib                                                                      ./libraries/router_005                                                          
vmap       router_005                                                           ./libraries/router_005                                                          
ensure_lib                                                                      ./libraries/onchip_memory2_0_s1_agent_rsp_fifo                                  
vmap       onchip_memory2_0_s1_agent_rsp_fifo                                   ./libraries/onchip_memory2_0_s1_agent_rsp_fifo                                  
ensure_lib                                                                      ./libraries/onchip_memory2_0_s1_agent                                           
vmap       onchip_memory2_0_s1_agent                                            ./libraries/onchip_memory2_0_s1_agent                                           
ensure_lib                                                                      ./libraries/pcie_cv_hip_avmm_0_Rxm_BAR0_agent                                   
vmap       pcie_cv_hip_avmm_0_Rxm_BAR0_agent                                    ./libraries/pcie_cv_hip_avmm_0_Rxm_BAR0_agent                                   
ensure_lib                                                                      ./libraries/onchip_memory2_0_s1_translator                                      
vmap       onchip_memory2_0_s1_translator                                       ./libraries/onchip_memory2_0_s1_translator                                      
ensure_lib                                                                      ./libraries/pcie_cv_hip_avmm_0_Rxm_BAR0_translator                              
vmap       pcie_cv_hip_avmm_0_Rxm_BAR0_translator                               ./libraries/pcie_cv_hip_avmm_0_Rxm_BAR0_translator                              
ensure_lib                                                                      ./libraries/dma_write_master_0                                                  
vmap       dma_write_master_0                                                   ./libraries/dma_write_master_0                                                  
ensure_lib                                                                      ./libraries/dma_read_master_0                                                   
vmap       dma_read_master_0                                                    ./libraries/dma_read_master_0                                                   
ensure_lib                                                                      ./libraries/modular_sgdma_dispatcher_0                                          
vmap       modular_sgdma_dispatcher_0                                           ./libraries/modular_sgdma_dispatcher_0                                          
ensure_lib                                                                      ./libraries/rst_controller                                                      
vmap       rst_controller                                                       ./libraries/rst_controller                                                      
ensure_lib                                                                      ./libraries/irq_mapper                                                          
vmap       irq_mapper                                                           ./libraries/irq_mapper                                                          
ensure_lib                                                                      ./libraries/mm_interconnect_2                                                   
vmap       mm_interconnect_2                                                    ./libraries/mm_interconnect_2                                                   
ensure_lib                                                                      ./libraries/mm_interconnect_1                                                   
vmap       mm_interconnect_1                                                    ./libraries/mm_interconnect_1                                                   
ensure_lib                                                                      ./libraries/mm_interconnect_0                                                   
vmap       mm_interconnect_0                                                    ./libraries/mm_interconnect_0                                                   
ensure_lib                                                                      ./libraries/pio_coder_rst                                                       
vmap       pio_coder_rst                                                        ./libraries/pio_coder_rst                                                       
ensure_lib                                                                      ./libraries/pcie_cv_hip_avmm_0                                                  
vmap       pcie_cv_hip_avmm_0                                                   ./libraries/pcie_cv_hip_avmm_0                                                  
ensure_lib                                                                      ./libraries/onchip_memory2_0                                                    
vmap       onchip_memory2_0                                                     ./libraries/onchip_memory2_0                                                    
ensure_lib                                                                      ./libraries/master_read                                                         
vmap       master_read                                                          ./libraries/master_read                                                         
ensure_lib                                                                      ./libraries/ctl_0                                                               
vmap       ctl_0                                                                ./libraries/ctl_0                                                               
ensure_lib                                                                      ./libraries/alt_xcvr_reconfig_0                                                 
vmap       alt_xcvr_reconfig_0                                                  ./libraries/alt_xcvr_reconfig_0                                                 

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                    -work altera_ver           
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                             -work lpm_ver              
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                                -work sgate_ver            
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                            -work altera_mf_ver        
  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                        -work altera_lnsim_ver     
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_atoms_ncrypt.v"          -work cyclonev_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_hmi_atoms_ncrypt.v"      -work cyclonev_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_atoms.v"                       -work cyclonev_ver         
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_hssi_atoms_ncrypt.v"     -work cyclonev_hssi_ver    
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_hssi_atoms.v"                  -work cyclonev_hssi_ver    
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/cyclonev_pcie_hip_atoms_ncrypt.v" -work cyclonev_pcie_hip_ver
  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/cyclonev_pcie_hip_atoms.v"              -work cyclonev_pcie_hip_ver
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_avalon_st_adapter_002_error_adapter_0.sv"             -work error_adapter_0                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_avalon_st_adapter_001_error_adapter_0.sv"             -work error_adapter_0                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv"                 -work error_adapter_0                                                     
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_2_rsp_mux.sv"                                           -work rsp_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_2_rsp_demux.sv"                                         -work rsp_demux                                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_2_cmd_mux.sv"                                           -work cmd_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work cmd_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_2_cmd_demux.sv"                                         -work cmd_demux                                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_2_router_001.sv"                                        -work router_001                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_2_router.sv"                                            -work router                                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_avalon_st_adapter_002.v"                              -work avalon_st_adapter_002                                               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_rsp_mux.sv"                                           -work rsp_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_rsp_demux.sv"                                         -work rsp_demux                                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_cmd_mux.sv"                                           -work cmd_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work cmd_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_cmd_demux.sv"                                         -work cmd_demux                                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_router_003.sv"                                        -work router_003                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_router_001.sv"                                        -work router_001                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1_router.sv"                                            -work router                                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_avalon_st_adapter_001.v"                              -work avalon_st_adapter_001                                               
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_avalon_st_adapter.v"                                  -work avalon_st_adapter                                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                           -work limiter_pipeline                                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                             -work limiter_pipeline                                                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_width_adapter.sv"                                               -work pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                           -work pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                          -work pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_mux_003.sv"                                       -work rsp_mux_003                                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux_003                                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_mux_001.sv"                                       -work rsp_mux_001                                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux_001                                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_mux.sv"                                           -work rsp_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work rsp_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_demux_001.sv"                                     -work rsp_demux_001                                                       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_rsp_demux.sv"                                         -work rsp_demux                                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_mux_001.sv"                                       -work cmd_mux_001                                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work cmd_mux_001                                                         
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_mux.sv"                                           -work cmd_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work cmd_mux                                                             
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_demux_003.sv"                                     -work cmd_demux_003                                                       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_demux_001.sv"                                     -work cmd_demux_001                                                       
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_cmd_demux.sv"                                         -work cmd_demux                                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter.sv"                                               -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_uncmpr.sv"                                        -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_13_1.sv"                                          -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_adapter_new.sv"                                           -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_incr_burst_converter.sv"                                               -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_wrap_burst_converter.sv"                                               -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_default_burst_converter.sv"                                            -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_address_alignment.sv"                                           -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_stage.sv"                                           -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                             -work onchip_memory2_0_s1_burst_adapter                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_traffic_limiter.sv"                                             -work ctl_0_dma_read_master_0_data_read_master_limiter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_reorder_memory.sv"                                              -work ctl_0_dma_read_master_0_data_read_master_limiter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                      -work ctl_0_dma_read_master_0_data_read_master_limiter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_avalon_st_pipeline_base.v"                                             -work ctl_0_dma_read_master_0_data_read_master_limiter                    
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_006.sv"                                        -work router_006                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_005.sv"                                        -work router_005                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_003.sv"                                        -work router_003                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router_001.sv"                                        -work router_001                                                          
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0_router.sv"                                            -work router                                                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                      -work onchip_memory2_0_s1_agent_rsp_fifo                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                 -work onchip_memory2_0_s1_agent                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                          -work onchip_memory2_0_s1_agent                                           
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                -work pcie_cv_hip_avmm_0_Rxm_BAR0_agent                                   
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                            -work onchip_memory2_0_s1_translator                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                           -work pcie_cv_hip_avmm_0_Rxm_BAR0_translator                              
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/write_master.v"                                                               -work dma_write_master_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/byte_enable_generator.v"                                                      -work dma_write_master_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/ST_to_MM_Adapter.v"                                                           -work dma_write_master_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/write_burst_control.v"                                                        -work dma_write_master_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/read_master.v"                                                                -work dma_read_master_0                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/MM_to_ST_Adapter.v"                                                           -work dma_read_master_0                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/read_burst_control.v"                                                         -work dma_read_master_0                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/dispatcher.v"                                                                 -work modular_sgdma_dispatcher_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/csr_block.v"                                                                  -work modular_sgdma_dispatcher_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/descriptor_buffers.v"                                                         -work modular_sgdma_dispatcher_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/response_block.v"                                                             -work modular_sgdma_dispatcher_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/fifo_with_byteenables.v"                                                      -work modular_sgdma_dispatcher_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/read_signal_breakout.v"                                                       -work modular_sgdma_dispatcher_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/write_signal_breakout.v"                                                      -work modular_sgdma_dispatcher_0                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                    -work rst_controller                                                      
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                  -work rst_controller                                                      
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/q_sys_irq_mapper.sv"                                                          -work irq_mapper                                                          
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_2.v"                                                    -work mm_interconnect_2                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_1.v"                                                    -work mm_interconnect_1                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_mm_interconnect_0.v"                                                    -work mm_interconnect_0                                                   
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_pio_coder_rst.v"                                                        -work pio_coder_rst                                                       
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_a2p_addrtrans.v"                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_a2p_fixtrans.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_a2p_vartrans.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_control_register.v"                              -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_avalon.v"                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_interrupt.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_rp.v"                                         -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cfg_status.v"                                    -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_cr_mailbox.v"                                    -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_p2a_addrtrans.v"                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_reg_fifo.v"                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_rx.v"                                            -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_rx_cntrl.v"                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_rx_resp.v"                                       -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_tx.v"                                            -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_tx_cntrl.v"                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_txavl_cntrl.v"                                   -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_stif_txresp_cntrl.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_stif/altpciexpav_clksync.v"                                            -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_a2p_addrtrans.v"                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_a2p_fixtrans.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_a2p_vartrans.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_clksync.v"                                       -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_control_register.v"                              -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_avalon.v"                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_interrupt.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_rp.v"                                         -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cfg_status.v"                                    -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_cr_mailbox.v"                                    -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_p2a_addrtrans.v"                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rx.v"                                            -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rx_cntrl.v"                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_fifo.v"                                          -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rxm_adapter.v"                                   -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_rx_resp.v"                                       -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_tx.v"                                            -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_tx_cntrl.v"                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_txavl_cntrl.v"                                   -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_txresp_cntrl.v"                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_mm_128/altpciexpav128_underflow_adapter.v"                             -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/avalon_lite/altpciexpav_lite_app.v"                                           -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_cv_hip_avmm_hwtcl.v"                                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpciexpav_stif_app.v"                                                       -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpciexpav128_app.v"                                                         -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_cv_hip_ast_hwtcl.v"                                                   -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_av_hip_128bit_atom.v"                                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_av_hip_ast_hwtcl.v"                                                   -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_rs_hip.v"                                                             -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcie_rs_serdes.v"                                                          -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altpcierd_hip_rs.v"                                                           -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_xcvr.sv"                                                -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_ip.sv"                                                  -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_merger.sv"                                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_h.sv"                                                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_avmm_csr.sv"                                                          -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_tx_pma_ch.sv"                                                              -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_tx_pma.sv"                                                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_rx_pma.sv"                                                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_pma.sv"                                                                    -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_pcs_ch.sv"                                                                 -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_pcs.sv"                                                                    -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_avmm.sv"                                                              -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_native.sv"                                                            -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_plls.sv"                                                              -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_data_adapter.sv"                                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_basic.sv"                                               -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_xcvr.sv"                                                -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_8g_rx_pcs_rbc.sv"                                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_8g_tx_pcs_rbc.sv"                                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_common_pcs_pma_interface_rbc.sv"                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_common_pld_pcs_interface_rbc.sv"                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_pipe_gen1_2_rbc.sv"                                                   -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_rx_pcs_pma_interface_rbc.sv"                                          -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_rx_pld_pcs_interface_rbc.sv"                                          -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_tx_pcs_pma_interface_rbc.sv"                                          -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_hssi_tx_pld_pcs_interface_rbc.sv"                                          -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_reset_ctrl_lego.sv"                                                       -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_reset_ctrl_tgx_cdrauto.sv"                                                -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                                           -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_csr_common_h.sv"                                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_csr_common.sv"                                                       -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g_h.sv"                                                      -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_csr_pcs8g.sv"                                                        -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv"                                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_mgmt2dec.sv"                                                         -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_wait_generate.v"                                                       -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_emsip_adapter.sv"                                                     -work pcie_cv_hip_avmm_0                                                  
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_pipe_native_hip.sv"                                                   -work pcie_cv_hip_avmm_0                                                  
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_onchip_memory2_0.v"                                                     -work onchip_memory2_0                                                    
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/custom_master.v"                                                              -work master_read                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/burst_write_master.v"                                                         -work master_read                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/burst_read_master.v"                                                          -work master_read                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/latency_aware_write_master.v"                                                 -work master_read                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/latency_aware_read_master.v"                                                  -work master_read                                                         
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/q_sys_ctl_0.v"                                                                -work ctl_0                                                               
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_xcvr_functions.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_h.sv"                                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_resync.sv"                                                           -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_h.sv"                                                       -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig.sv"                                                         -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cal_seq.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xreconf_cif.sv"                                                           -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xreconf_uif.sv"                                                           -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xreconf_basic_acq.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog.sv"                                                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_analog_av.sv"                                               -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xreconf_analog_datactrl_av.sv"                                            -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xreconf_analog_rmw_av.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xreconf_analog_ctrlsm.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation.sv"                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_offset_cancellation_av.sv"                                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_eyemon.sv"                                                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dfe.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_adce.sv"                                                    -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_av.sv"                                                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_cal_av.sv"                                              -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_dcd_control_av.sv"                                          -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_mif.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_reconfig_mif.sv"                                                      -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_reconfig_mif_ctrl.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_reconfig_mif_avmm.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_pll.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_reconfig_pll.sv"                                                      -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_reconfig_pll_ctrl.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_soc.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_ram.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_direct.sv"                                                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_arbiter_acq.sv"                                                           -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_basic.sv"                                                   -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xrbasic_l2p_addr.sv"                                                       -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xrbasic_l2p_ch.sv"                                                         -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xrbasic_l2p_rom.sv"                                                        -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xrbasic_lif_csr.sv"                                                        -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xrbasic_lif.sv"                                                            -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_xcvr_reconfig_basic.sv"                                                    -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_arbiter.sv"                                                          -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_m2s.sv"                                                              -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_wait_generate.v"                                                       -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_csr_selector.sv"                                                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/sv_reconfig_bundle_to_basic.sv"                                               -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_basic.sv"                                               -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/av_reconfig_bundle_to_xcvr.sv"                                                -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu.v"                                                      -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu.v"                                         -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_reconfig_cpu_test_bench.v"                              -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0.v"                                    -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_irq_mapper.sv"                                          -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_controller.v"                                                    -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_reset_synchronizer.v"                                                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_translator.sv"                                           -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_translator.sv"                                            -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_master_agent.sv"                                                -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_slave_agent.sv"                                                 -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_burst_uncompressor.sv"                                          -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/altera_avalon_sc_fifo.v"                                                      -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router.sv"                            -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_001.sv"                        -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_002.sv"                        -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_router_003.sv"                        -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux.sv"                         -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_demux_001.sv"                     -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux.sv"                           -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/altera_merlin_arbitrator.sv"                                                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_cmd_mux_001.sv"                       -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux.sv"                           -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_rsp_mux_001.sv"                       -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_avalon_st_adapter.v"                  -work alt_xcvr_reconfig_0                                                 
  eval  vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/submodules/alt_xcvr_reconfig_cpu_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv" -work alt_xcvr_reconfig_0                                                 
  eval  vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/q_sys.v"                                                                                                                                                           
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_002 -L router_003 -L avalon_st_adapter_001 -L avalon_st_adapter -L limiter_pipeline -L pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter -L rsp_mux_003 -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_001 -L cmd_demux_003 -L cmd_demux_001 -L onchip_memory2_0_s1_burst_adapter -L ctl_0_dma_read_master_0_data_read_master_limiter -L router_006 -L router_005 -L onchip_memory2_0_s1_agent_rsp_fifo -L onchip_memory2_0_s1_agent -L pcie_cv_hip_avmm_0_Rxm_BAR0_agent -L onchip_memory2_0_s1_translator -L pcie_cv_hip_avmm_0_Rxm_BAR0_translator -L dma_write_master_0 -L dma_read_master_0 -L modular_sgdma_dispatcher_0 -L rst_controller -L irq_mapper -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L pio_coder_rst -L pcie_cv_hip_avmm_0 -L onchip_memory2_0 -L master_read -L ctl_0 -L alt_xcvr_reconfig_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L error_adapter_0 -L rsp_mux -L rsp_demux -L cmd_mux -L cmd_demux -L router_001 -L router -L avalon_st_adapter_002 -L router_003 -L avalon_st_adapter_001 -L avalon_st_adapter -L limiter_pipeline -L pcie_cv_hip_avmm_0_Rxm_BAR0_to_onchip_memory2_0_s1_cmd_width_adapter -L rsp_mux_003 -L rsp_mux_001 -L rsp_demux_001 -L cmd_mux_001 -L cmd_demux_003 -L cmd_demux_001 -L onchip_memory2_0_s1_burst_adapter -L ctl_0_dma_read_master_0_data_read_master_limiter -L router_006 -L router_005 -L onchip_memory2_0_s1_agent_rsp_fifo -L onchip_memory2_0_s1_agent -L pcie_cv_hip_avmm_0_Rxm_BAR0_agent -L onchip_memory2_0_s1_translator -L pcie_cv_hip_avmm_0_Rxm_BAR0_translator -L dma_write_master_0 -L dma_read_master_0 -L modular_sgdma_dispatcher_0 -L rst_controller -L irq_mapper -L mm_interconnect_2 -L mm_interconnect_1 -L mm_interconnect_0 -L pio_coder_rst -L pcie_cv_hip_avmm_0 -L onchip_memory2_0 -L master_read -L ctl_0 -L alt_xcvr_reconfig_0 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                                         -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                                           -- Compile device library files"
  echo
  echo "com                                               -- Compile the design files in correct order"
  echo
  echo "elab                                              -- Elaborate top level design"
  echo
  echo "elab_debug                                        -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                                                -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                                          -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                                    -- Top level module name."
  echo "                                                     For most designs, this should be overridden"
  echo "                                                     to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME                              -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                                       -- Platform Designer base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR                               -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS                      -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS                         -- User-defined elaboration options, added to elab/elab_debug aliases."
  echo
  echo "USER_DEFINED_VHDL_COMPILE_OPTIONS                 -- User-defined vhdl compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_VERILOG_COMPILE_OPTIONS              -- User-defined verilog compile options, added to com/dev_com aliases."
}
file_copy
h

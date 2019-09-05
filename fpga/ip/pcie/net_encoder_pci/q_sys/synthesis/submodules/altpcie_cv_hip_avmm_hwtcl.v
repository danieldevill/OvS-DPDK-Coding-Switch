// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

module altpcie_cv_hip_avmm_hwtcl # (

      parameter pll_refclk_freq_hwtcl                             = "100 MHz",
      parameter enable_slot_register_hwtcl                        = 0,
      parameter port_type_hwtcl                                   = "Native endpoint",
      parameter bypass_cdc_hwtcl                                  = "false",
      parameter enable_rx_buffer_checking_hwtcl                   = "false",
      parameter single_rx_detect_hwtcl                            = 0,
      parameter use_crc_forwarding_hwtcl                          = 0,
      parameter ast_width_hwtcl                                   = "rx_tx_64",
      parameter gen123_lane_rate_mode_hwtcl                       = "gen1",
      parameter lane_mask_hwtcl                                   = "x4",
      parameter disable_link_x2_support_hwtcl                     = "false",
      parameter hip_hard_reset_hwtcl                              = "disable",
      parameter wrong_device_id_hwtcl                             = "disable",
      parameter data_pack_rx_hwtcl                                = "disable",
      parameter use_ast_parity                                    = 0,
      parameter ltssm_1ms_timeout_hwtcl                           = "disable",
      parameter ltssm_freqlocked_check_hwtcl                      = "disable",
      parameter deskew_comma_hwtcl                                = "skp_eieos_deskw",
      parameter port_link_number_hwtcl                            = 1,
      parameter device_number_hwtcl                               = 0,
      parameter bypass_clk_switch_hwtcl                           = "disabled",
      parameter pipex1_debug_sel_hwtcl                            = "disable",
      parameter pclk_out_sel_hwtcl                                = "pclk",
      parameter vendor_id_hwtcl                                   = 4466,
      parameter device_id_hwtcl                                   = 57345,
      parameter revision_id_hwtcl                                 = 1,
      parameter class_code_hwtcl                                  = 16711680,
      parameter subsystem_vendor_id_hwtcl                         = 4466,
      parameter subsystem_device_id_hwtcl                         = 57345,
      parameter no_soft_reset_hwtcl                               = "false",
      parameter maximum_current_hwtcl                             = 0,
      parameter d1_support_hwtcl                                  = "false",
      parameter d2_support_hwtcl                                  = "false",
      parameter d0_pme_hwtcl                                      = "false",
      parameter d1_pme_hwtcl                                      = "false",
      parameter d2_pme_hwtcl                                      = "false",
      parameter d3_hot_pme_hwtcl                                  = "false",
      parameter d3_cold_pme_hwtcl                                 = "false",
      parameter use_aer_hwtcl                                     = 0,
      parameter low_priority_vc_hwtcl                             = "single_vc",
      parameter disable_snoop_packet_hwtcl                        = "false",
      parameter max_payload_size_hwtcl                            = 256,
      parameter surprise_down_error_support_hwtcl                 = 0,
      parameter dll_active_report_support_hwtcl                   = 0,
      parameter extend_tag_field_hwtcl                            = "false",
      parameter endpoint_l0_latency_hwtcl                         = 0,
      parameter endpoint_l1_latency_hwtcl                         = 0,
     parameter indicator_hwtcl                                   = 0,
      parameter slot_power_scale_hwtcl                            = 0,
      parameter enable_l1_aspm_hwtcl                              = "false",
      parameter l1_exit_latency_sameclock_hwtcl                   = 0,
      parameter l1_exit_latency_diffclock_hwtcl                   = 0,
      parameter hot_plug_support_hwtcl                            = 0,
      parameter slot_power_limit_hwtcl                            = 0,
      parameter slot_number_hwtcl                                 = 0,
      parameter diffclock_nfts_count_hwtcl                        = 128,
      parameter sameclock_nfts_count_hwtcl                        = 128,
      parameter completion_timeout_hwtcl                          = "abcd",
      parameter enable_completion_timeout_disable_hwtcl           = 1,
      parameter extended_tag_reset_hwtcl                          = "false",
      parameter ecrc_check_capable_hwtcl                          = 0,
      parameter ecrc_gen_capable_hwtcl                            = 0,
      parameter msi_multi_message_capable_hwtcl                   = "count_4",
      parameter msi_64bit_addressing_capable_hwtcl                = "true",
      parameter msi_masking_capable_hwtcl                         = "false",
      parameter msi_support_hwtcl                                 = "true",
      parameter interrupt_pin_hwtcl                               = "inta",
      parameter enable_function_msix_support_hwtcl                = 0,
      parameter msix_table_size_hwtcl                             = 0,
      parameter msix_table_bir_hwtcl                              = 0,
      parameter msix_table_offset_hwtcl                           = 0,
      parameter msix_pba_bir_hwtcl                                = 0,
      parameter msix_pba_offset_hwtcl                             = 0,
      parameter bridge_port_vga_enable_hwtcl                      = "false",
      parameter bridge_port_ssid_support_hwtcl                    = "false",
      parameter ssvid_hwtcl                                       = 0,
      parameter ssid_hwtcl                                        = 0,
      parameter eie_before_nfts_count_hwtcl                       = 4,
      parameter gen2_diffclock_nfts_count_hwtcl                   = 255,
      parameter gen2_sameclock_nfts_count_hwtcl                   = 255,
      parameter deemphasis_enable_hwtcl                           = "false",
      parameter pcie_spec_version_hwtcl                           = "v2",
      parameter l0_exit_latency_sameclock_hwtcl                   = 6,
      parameter l0_exit_latency_diffclock_hwtcl                   = 6,
      parameter rx_ei_l0s_hwtcl                                   = 1,
       parameter l2_async_logic_hwtcl                              = "disable",
      parameter aspm_config_management_hwtcl                      = "true",
      parameter atomic_op_routing_hwtcl                           = "false",
      parameter atomic_op_completer_32bit_hwtcl                   = "false",
      parameter atomic_op_completer_64bit_hwtcl                   = "false",
      parameter cas_completer_128bit_hwtcl                        = "false",
      parameter ltr_mechanism_hwtcl                               = "false",
      parameter tph_completer_hwtcl                               = "false",
      parameter extended_format_field_hwtcl                       = "true",
      parameter atomic_malformed_hwtcl                            = "false",
      parameter flr_capability_hwtcl                              = "true",
      parameter enable_adapter_half_rate_mode_hwtcl               = "false",
      parameter vc0_clk_enable_hwtcl                              = "true",
      parameter bar0_io_space_hwtcl                               = "Disabled",
      parameter bar0_64bit_mem_space_hwtcl                        = "Enabled",
      parameter bar0_prefetchable_hwtcl                           = "Enabled",
      parameter bar0_size_mask_hwtcl                              = "256 MBytes - 28 bits",
      parameter bar1_io_space_hwtcl                               = "Disabled",
      parameter bar1_64bit_mem_space_hwtcl                        = "Disabled",
      parameter bar1_prefetchable_hwtcl                           = "Disabled",
      parameter bar1_size_mask_hwtcl                              = "N/A",
      parameter bar2_io_space_hwtcl                               = "Disabled",
      parameter bar2_64bit_mem_space_hwtcl                        = "Disabled",
      parameter bar2_prefetchable_hwtcl                           = "Disabled",
      parameter bar2_size_mask_hwtcl                              = "N/A",
      parameter bar3_io_space_hwtcl                               = "Disabled",
      parameter bar3_64bit_mem_space_hwtcl                        = "Disabled",
      parameter bar3_prefetchable_hwtcl                           = "Disabled",
      parameter bar3_size_mask_hwtcl                              = "N/A",
      parameter bar4_io_space_hwtcl                               = "Disabled",
      parameter bar4_64bit_mem_space_hwtcl                        = "Disabled",
      parameter bar4_prefetchable_hwtcl                           = "Disabled",
      parameter bar4_size_mask_hwtcl                              = "N/A",
      parameter bar5_io_space_hwtcl                               = "Disabled",
      parameter bar5_64bit_mem_space_hwtcl                        = "Disabled",
      parameter bar5_prefetchable_hwtcl                           = "Disabled",
      parameter bar5_size_mask_hwtcl                              = "N/A",
      parameter expansion_base_address_register_hwtcl             = 0,
      parameter io_window_addr_width_hwtcl                        = 0,
      parameter prefetchable_mem_window_addr_width_hwtcl          = 0,
      parameter skp_os_gen3_count_hwtcl                           = 0,
      parameter tx_cdc_almost_empty_hwtcl                         = 5,
      parameter rx_cdc_almost_full_hwtcl                          = 12,
      parameter tx_cdc_almost_full_hwtcl                          = 12,
      parameter rx_l0s_count_idl_hwtcl                            = 0,
      parameter cdc_dummy_insert_limit_hwtcl                      = 11,
      parameter ei_delay_powerdown_count_hwtcl                    = 10,
      parameter millisecond_cycle_count_hwtcl                     = 248500,
      parameter skp_os_schedule_count_hwtcl                       = 0,
      parameter fc_init_timer_hwtcl                               = 1024,
      parameter l01_entry_latency_hwtcl                           = 31,
      parameter flow_control_update_count_hwtcl                   = 30,
      parameter flow_control_timeout_count_hwtcl                  = 200,
      parameter credit_buffer_allocation_aux_hwtcl                = "balanced",
      parameter vc0_rx_flow_ctrl_posted_header_hwtcl              = 50,
      parameter vc0_rx_flow_ctrl_posted_data_hwtcl                = 360,
      parameter vc0_rx_flow_ctrl_nonposted_header_hwtcl           = 54,
      parameter vc0_rx_flow_ctrl_nonposted_data_hwtcl             = 0,
      parameter vc0_rx_flow_ctrl_compl_header_hwtcl               = 112,
      parameter vc0_rx_flow_ctrl_compl_data_hwtcl                 = 448,
      parameter rx_ptr0_posted_dpram_min_hwtcl                    = 0,
      parameter rx_ptr0_posted_dpram_max_hwtcl                    = 0,
      parameter rx_ptr0_nonposted_dpram_min_hwtcl                 = 0,
      parameter rx_ptr0_nonposted_dpram_max_hwtcl                 = 0,
      parameter retry_buffer_last_active_address_hwtcl            = 2047,
      parameter retry_buffer_memory_settings_hwtcl                = 0,
      parameter vc0_rx_buffer_memory_settings_hwtcl               = 0,
      parameter in_cvp_mode_hwtcl                                 = 0,
      parameter slotclkcfg_hwtcl                                  = 1,
      parameter reconfig_to_xcvr_width                            = 350,
      parameter set_pld_clk_x1_625MHz_hwtcl                       = 0,
      parameter reconfig_from_xcvr_width                          = 230,
      parameter enable_l0s_aspm_hwtcl                             = "true",
      parameter cpl_spc_header_hwtcl                              = 195,
      parameter cpl_spc_data_hwtcl                                = 781,
      parameter coreclkout_hip_phaseshift_hwtcl                   = "0 ps",
      parameter pldclk_hip_phase_shift_hwtcl                      = "0 ps",
      parameter port_width_be_hwtcl                               = 8,
      parameter port_width_data_hwtcl                             = 64,
      parameter reserved_debug_hwtcl                              = 0,
      parameter hip_reconfig_hwtcl                                = 0,
      parameter user_id_hwtcl                                     = 0,
      parameter vsec_id_hwtcl                                     = 0,
      parameter vsec_rev_hwtcl                                    = 0,
      parameter gen3_rxfreqlock_counter_hwtcl                     = 0,
      parameter gen3_skip_ph2_ph3_hwtcl                           = "true",
      parameter g3_bypass_equlz_hwtcl                             = "true",
      parameter cvp_rate_sel_hwtcl                                = "full_rate",
      parameter cvp_data_compressed_hwtcl                         = "false",
      parameter cvp_data_encrypted_hwtcl                          = "false",
      parameter cvp_mode_reset_hwtcl                              = "false",
      parameter cvp_clk_reset_hwtcl                               = "false",
      parameter cseb_cpl_status_during_cvp_hwtcl                  = "config_retry_status",
      parameter core_clk_sel_hwtcl                                = "pld_clk",

      parameter rpre_emph_a_val_hwtcl                             = 0,
      parameter rpre_emph_b_val_hwtcl                             = 0,
      parameter rpre_emph_c_val_hwtcl                             = 0,
      parameter rpre_emph_d_val_hwtcl                             = 0,
      parameter rpre_emph_e_val_hwtcl                             = 0,
      parameter rvod_sel_a_val_hwtcl                              = 0,
      parameter rvod_sel_b_val_hwtcl                              = 0,
      parameter rvod_sel_c_val_hwtcl                              = 0,
      parameter rvod_sel_d_val_hwtcl                              = 0,
      parameter rvod_sel_e_val_hwtcl                              = 0,
      parameter register_pipe_signals_hwtcl                       = "true",
      parameter no_command_completed_hwtcl                        = "true",
      parameter use_tl_cfg_sync_hwtcl                             = 0,



      /// Bridge Parameters
      parameter CG_ENABLE_A2P_INTERRUPT = 0,
      parameter CG_RXM_IRQ_NUM = 16,
      parameter CB_PCIE_MODE   = 0,
      parameter CB_PCIE_RX_LITE   = 0,
      parameter CB_RXM_DATA_WIDTH   = 64,
      parameter CB_A2P_ADDR_MAP_IS_FIXED = 0,
      parameter CB_A2P_ADDR_MAP_NUM_ENTRIES = 1,
      parameter CG_AVALON_S_ADDR_WIDTH = 24,
      parameter CG_IMPL_CRA_AV_SLAVE_PORT = 1,
      parameter a2p_pass_thru_bits = 24,
      parameter CB_P2A_AVALON_ADDR_B0               = 32'h00000000,
      parameter CB_P2A_AVALON_ADDR_B1               = 32'h00000000,
      parameter CB_P2A_AVALON_ADDR_B2               = 32'h00000000,
      parameter CB_P2A_AVALON_ADDR_B3               = 32'h00000000,
      parameter CB_P2A_AVALON_ADDR_B4               = 32'h00000000,
      parameter CB_P2A_AVALON_ADDR_B5               = 32'h00000000,
      parameter CB_P2A_AVALON_ADDR_B6               = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_0_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_0_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_1_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_1_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_2_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_2_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_3_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_3_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_4_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_4_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_5_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_5_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_6_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_6_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_7_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_7_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_8_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_8_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_9_LOW   = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_9_HIGH  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_10_LOW  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_10_HIGH = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_11_LOW  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_11_HIGH = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_12_LOW  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_12_HIGH = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_13_LOW  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_13_HIGH = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_14_LOW  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_14_HIGH = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_15_LOW  = 32'h00000000,
      parameter CB_A2P_ADDR_MAP_FIXED_TABLE_15_HIGH = 32'h00000000,
      parameter bar_prefetchable = 1,
      parameter avmm_width_hwtcl = 64,
      parameter avmm_burst_width_hwtcl = 7,
      parameter AVALON_ADDR_WIDTH = 32,
      parameter BYPASSS_A2P_TRANSLATION = 0,
      parameter CG_ENABLE_ADVANCED_INTERRUPT = 0


) (

      // Reset signals
      input                 pin_perst,
      input                 npor,
      output                reset_status,

      // Serdes related
      input                 refclk,

      // HIP control signals
      input  [4 : 0]        hpg_ctrler,

      // Driven by the testbench
      // Input PIPE simulation for simulation only
      input                 simu_mode_pipe,          // When 1'b1 indicate running DUT under pipe simulation
      input [31 : 0]        test_in,
      output [127 : 0]      testout,
      output [1 : 0]        sim_pipe_rate,
      input                 sim_pipe_pclk_in,
      output                sim_pipe_pclk_out,
      output                sim_pipe_clk250_out,
      output                sim_pipe_clk500_out,
      output [4 : 0]        sim_ltssmstate,
      input                 phystatus0,
      input                 phystatus1,
      input                 phystatus2,
      input                 phystatus3,
      input                 phystatus4,
      input                 phystatus5,
      input                 phystatus6,
      input                 phystatus7,
      input  [7 : 0]        rxdata0,
      input  [7 : 0]        rxdata1,
      input  [7 : 0]        rxdata2,
      input  [7 : 0]        rxdata3,
      input  [7 : 0]        rxdata4,
      input  [7 : 0]        rxdata5,
      input  [7 : 0]        rxdata6,
      input  [7 : 0]        rxdata7,
      input                 rxdatak0,
      input                 rxdatak1,
      input                 rxdatak2,
      input                 rxdatak3,
      input                 rxdatak4,
      input                 rxdatak5,
      input                 rxdatak6,
      input                 rxdatak7,
      input                 rxelecidle0,
      input                 rxelecidle1,
      input                 rxelecidle2,
      input                 rxelecidle3,
      input                 rxelecidle4,
      input                 rxelecidle5,
      input                 rxelecidle6,
      input                 rxelecidle7,
      input                 rxfreqlocked0,
      input                 rxfreqlocked1,
      input                 rxfreqlocked2,
      input                 rxfreqlocked3,
      input                 rxfreqlocked4,
      input                 rxfreqlocked5,
      input                 rxfreqlocked6,
      input                 rxfreqlocked7,
      input  [2 : 0]        rxstatus0,
      input  [2 : 0]        rxstatus1,
      input  [2 : 0]        rxstatus2,
      input  [2 : 0]        rxstatus3,
      input  [2 : 0]        rxstatus4,
      input  [2 : 0]        rxstatus5,
      input  [2 : 0]        rxstatus6,
      input  [2 : 0]        rxstatus7,
      input                 rxdataskip0,
      input                 rxdataskip1,
      input                 rxdataskip2,
      input                 rxdataskip3,
      input                 rxdataskip4,
      input                 rxdataskip5,
      input                 rxdataskip6,
      input                 rxdataskip7,
      input                 rxblkst0,
      input                 rxblkst1,
      input                 rxblkst2,
      input                 rxblkst3,
      input                 rxblkst4,
      input                 rxblkst5,
      input                 rxblkst6,
      input                 rxblkst7,
      input  [1 : 0]        rxsynchd0,
      input  [1 : 0]        rxsynchd1,
      input  [1 : 0]        rxsynchd2,
      input  [1 : 0]        rxsynchd3,
      input  [1 : 0]        rxsynchd4,
      input  [1 : 0]        rxsynchd5,
      input  [1 : 0]        rxsynchd6,
      input  [1 : 0]        rxsynchd7,
      input                 rxvalid0,
      input                 rxvalid1,
      input                 rxvalid2,
      input                 rxvalid3,
      input                 rxvalid4,
      input                 rxvalid5,
      input                 rxvalid6,
      input                 rxvalid7,

      // Output Pipe interface
      output [2 : 0]        eidleinfersel0,
      output [2 : 0]        eidleinfersel1,
      output [2 : 0]        eidleinfersel2,
      output [2 : 0]        eidleinfersel3,
      output [2 : 0]        eidleinfersel4,
      output [2 : 0]        eidleinfersel5,
      output [2 : 0]        eidleinfersel6,
      output [2 : 0]        eidleinfersel7,
      output [1 : 0]        powerdown0,
      output [1 : 0]        powerdown1,
      output [1 : 0]        powerdown2,
      output [1 : 0]        powerdown3,
      output [1 : 0]        powerdown4,
      output [1 : 0]        powerdown5,
      output [1 : 0]        powerdown6,
      output [1 : 0]        powerdown7,
      output                rxpolarity0,
      output                rxpolarity1,
      output                rxpolarity2,
      output                rxpolarity3,
      output                rxpolarity4,
      output                rxpolarity5,
      output                rxpolarity6,
      output                rxpolarity7,
      output                txcompl0,
      output                txcompl1,
      output                txcompl2,
      output                txcompl3,
      output                txcompl4,
      output                txcompl5,
      output                txcompl6,
      output                txcompl7,
      output [7 : 0]        txdata0,
      output [7 : 0]        txdata1,
      output [7 : 0]        txdata2,
      output [7 : 0]        txdata3,
      output [7 : 0]        txdata4,
      output [7 : 0]        txdata5,
      output [7 : 0]        txdata6,
      output [7 : 0]        txdata7,
      output                txdatak0,
      output                txdatak1,
      output                txdatak2,
      output                txdatak3,
      output                txdatak4,
      output                txdatak5,
      output                txdatak6,
      output                txdatak7,
      output                txdatavalid0,
      output                txdatavalid1,
      output                txdatavalid2,
      output                txdatavalid3,
      output                txdatavalid4,
      output                txdatavalid5,
      output                txdatavalid6,
      output                txdatavalid7,
      output                txdetectrx0,
      output                txdetectrx1,
      output                txdetectrx2,
      output                txdetectrx3,
      output                txdetectrx4,
      output                txdetectrx5,
      output                txdetectrx6,
      output                txdetectrx7,
      output                txelecidle0,
      output                txelecidle1,
      output                txelecidle2,
      output                txelecidle3,
      output                txelecidle4,
      output                txelecidle5,
      output                txelecidle6,
      output                txelecidle7,
      output [2 : 0]        txmargin0,
      output [2 : 0]        txmargin1,
      output [2 : 0]        txmargin2,
      output [2 : 0]        txmargin3,
      output [2 : 0]        txmargin4,
      output [2 : 0]        txmargin5,
      output [2 : 0]        txmargin6,
      output [2 : 0]        txmargin7,
      output                txdeemph0,
      output                txdeemph1,
      output                txdeemph2,
      output                txdeemph3,
      output                txdeemph4,
      output                txdeemph5,
      output                txdeemph6,
      output                txdeemph7,
      output                txswing0,
      output                txswing1,
      output                txswing2,
      output                txswing3,
      output                txswing4,
      output                txswing5,
      output                txswing6,
      output                txswing7,

      output                txblkst0,
      output                txblkst1,
      output                txblkst2,
      output                txblkst3,
      output                txblkst4,
      output                txblkst5,
      output                txblkst6,
      output                txblkst7,
      output [1 : 0]        txsynchd0,
      output [1 : 0]        txsynchd1,
      output [1 : 0]        txsynchd2,
      output [1 : 0]        txsynchd3,
      output [1 : 0]        txsynchd4,
      output [1 : 0]        txsynchd5,
      output [1 : 0]        txsynchd6,
      output [1 : 0]        txsynchd7,
      output [17 : 0]       currentcoeff0,
      output [17 : 0]       currentcoeff1,
      output [17 : 0]       currentcoeff2,
      output [17 : 0]       currentcoeff3,
      output [17 : 0]       currentcoeff4,
      output [17 : 0]       currentcoeff5,
      output [17 : 0]       currentcoeff6,
      output [17 : 0]       currentcoeff7,
      output [2 : 0]        currentrxpreset0,
      output [2 : 0]        currentrxpreset1,
      output [2 : 0]        currentrxpreset2,
      output [2 : 0]        currentrxpreset3,
      output [2 : 0]        currentrxpreset4,
      output [2 : 0]        currentrxpreset5,
      output [2 : 0]        currentrxpreset6,
      output [2 : 0]        currentrxpreset7,
      output                coreclkout,

        // Reconfig GXB
      input                [reconfig_to_xcvr_width-1:0]   reconfig_to_xcvr,
      input                busy_xcvr_reconfig,
      output               [reconfig_from_xcvr_width-1:0] reconfig_from_xcvr,
      output               fixedclk_locked,




      // serial interface
      input    rx_in0,
      input    rx_in1,
      input    rx_in2,
      input    rx_in3,
      input    rx_in4,
      input    rx_in5,
      input    rx_in6,
      input    rx_in7,

      output   tx_out0,
      output   tx_out1,
      output   tx_out2,
      output   tx_out3,
      output   tx_out4,
      output   tx_out5,
      output   tx_out6,
      output   tx_out7,

      // Avalon Tx Slave interface
      input                                  TxsChipSelect_i,
      input                                  TxsRead_i,
      input                                  TxsWrite_i,
      input  [avmm_width_hwtcl-1:0]          TxsWriteData_i,
      input  [avmm_burst_width_hwtcl-1:0]    TxsBurstCount_i,
      input  [CG_AVALON_S_ADDR_WIDTH-1:0]    TxsAddress_i,
      input  [(avmm_width_hwtcl/8)-1:0]      TxsByteEnable_i,
      output                                 TxsReadDataValid_o,
      output  [avmm_width_hwtcl-1:0]         TxsReadData_o,
      output                                 TxsWaitRequest_o,

      // Avalon- RX Master
      input    [15:0]                         RxmIrq_i,
       // Avalon Rx Master interface 0
      output                                 RxmWrite_0_o,
      output [AVALON_ADDR_WIDTH-1:0]         RxmAddress_0_o,
      output [avmm_width_hwtcl-1:0]          RxmWriteData_0_o,
      output [(avmm_width_hwtcl/8)-1:0]      RxmByteEnable_0_o,
      output [avmm_burst_width_hwtcl-1:0]    RxmBurstCount_0_o,
      input                                  RxmWaitRequest_0_i,
      output                                 RxmRead_0_o,
      input  [avmm_width_hwtcl-1:0]          RxmReadData_0_i,
      input                                  RxmReadDataValid_0_i,

      // Avalon Rx Master interface 1
      output                                 RxmWrite_1_o,
      output [AVALON_ADDR_WIDTH-1:0]         RxmAddress_1_o,
      output [avmm_width_hwtcl-1:0]          RxmWriteData_1_o,
      output [(avmm_width_hwtcl/8)-1:0]      RxmByteEnable_1_o,
      output [avmm_burst_width_hwtcl-1:0]    RxmBurstCount_1_o,
      input                                  RxmWaitRequest_1_i,
      output                                 RxmRead_1_o,
      input  [avmm_width_hwtcl-1:0]          RxmReadData_1_i,
      input                                  RxmReadDataValid_1_i,

      // Avalon Rx Master interface 2
      output                                 RxmWrite_2_o,
      output [AVALON_ADDR_WIDTH-1:0]         RxmAddress_2_o,
      output [avmm_width_hwtcl-1:0]          RxmWriteData_2_o,
      output [(avmm_width_hwtcl/8)-1:0]      RxmByteEnable_2_o,
      output [avmm_burst_width_hwtcl-1:0]    RxmBurstCount_2_o,
      input                                  RxmWaitRequest_2_i,
      output                                 RxmRead_2_o,
      input  [avmm_width_hwtcl-1:0]          RxmReadData_2_i,
      input                                  RxmReadDataValid_2_i,

      // Avalon Rx Master interface 3
      output                                 RxmWrite_3_o,
      output [AVALON_ADDR_WIDTH-1:0]         RxmAddress_3_o,
      output [avmm_width_hwtcl-1:0]          RxmWriteData_3_o,
      output [(avmm_width_hwtcl/8)-1:0]      RxmByteEnable_3_o,
      output [avmm_burst_width_hwtcl-1:0]    RxmBurstCount_3_o,
      input                                  RxmWaitRequest_3_i,
      output                                 RxmRead_3_o,
      input  [avmm_width_hwtcl-1:0]          RxmReadData_3_i,
      input                                  RxmReadDataValid_3_i,

      // Avalon Rx Master interface 4
      output                                 RxmWrite_4_o,
      output [AVALON_ADDR_WIDTH-1:0]         RxmAddress_4_o,
      output [avmm_width_hwtcl-1:0]          RxmWriteData_4_o,
      output [(avmm_width_hwtcl/8)-1:0]      RxmByteEnable_4_o,
      output [6:0]                           RxmBurstCount_4_o,
      input                                  RxmWaitRequest_4_i,
      output                                 RxmRead_4_o,
      input  [avmm_width_hwtcl-1:0]          RxmReadData_4_i,
      input                                  RxmReadDataValid_4_i,

      // Avalon Rx Master interface 5
      output                                 RxmWrite_5_o,
      output [AVALON_ADDR_WIDTH-1:0]         RxmAddress_5_o,
      output [avmm_width_hwtcl-1:0]          RxmWriteData_5_o,
      output [(avmm_width_hwtcl/8)-1:0]      RxmByteEnable_5_o,
      output [avmm_burst_width_hwtcl-1:0]    RxmBurstCount_5_o,
      input                                  RxmWaitRequest_5_i,
      output                                 RxmRead_5_o,
      input  [avmm_width_hwtcl-1:0]          RxmReadData_5_i,
      input                                  RxmReadDataValid_5_i,

      // Avalon Rx Master interface 6
      output                                 RxmWrite_6_o,
      output [AVALON_ADDR_WIDTH-1:0]         RxmAddress_6_o,
      output [avmm_width_hwtcl-1:0]          RxmWriteData_6_o,
      output [(avmm_width_hwtcl/8)-1:0]      RxmByteEnable_6_o,
      output [avmm_burst_width_hwtcl-1:0]    RxmBurstCount_6_o,
      input                                  RxmWaitRequest_6_i,
      output                                 RxmRead_6_o,
      input  [avmm_width_hwtcl-1:0]          RxmReadData_6_i,
      input                                  RxmReadDataValid_6_i,

      // Avalon Control Register Access (CRA) Slave (This is 32-bit interface)
      input                                  CraChipSelect_i,
      input                                  CraRead,
      input                                  CraWrite,
      input  [31:0]                          CraWriteData_i,
      input  [13:0]                          CraAddress_i,
      input  [3:0]                           CraByteEnable_i,
      output [31:0]                          CraReadData_o,      // This comes from Rx Completion to be returned to Avalon master
      output                                 CraWaitRequest_o,
      output                                 CraIrq_o,
               /// MSI/MSI-X/INTx supported signals
      output  [81:0]                         MsiIntfc_o,
      output  [15:0]                         MsiControl_o,
      output  [15:0]                         MsixIntfc_o,
      input                                  IntxReq_i,
      output                                 IntxAck_o,

      /// Hip Status Extention
      output                                 rx_st_valid      ,
      output                                 rx_st_sop        ,
      output                                 rx_st_eop        ,
      output                                 rx_st_err        ,
      output  [avmm_width_hwtcl-1:0]         rx_st_data       ,
      output  [7:0]                          rx_st_bar        ,
      output                                 tx_st_ready      ,
      output                                 pld_clk_inuse    ,
      output                                 dlup_exit        ,
      output                                 hotrst_exit      ,
      output                                 l2_exit          ,
      output  [1:0]                          currentspeed     ,
      output  [4:0]                          ltssmstate       ,
      output                                 derr_cor_ext_rcv ,
      output                                 derr_cor_ext_rpl ,
      output                                 derr_rpl         ,
      output  [3:0]                          int_status       ,
      output                                 serr_out         ,
      output  [3:0]                          tl_cfg_add       ,
      output  [31:0]                         tl_cfg_ctl       ,
      output  [52:0]                         tl_cfg_sts       ,
      output                                 pme_to_sr        ,
      output  [3:0]                          lane_act         ,
      output                                 ev128ns          ,
      output                                 ev1us            ,
      output  [7 : 0]                        ko_cpl_spc_header,
      output  [11: 0]                        ko_cpl_spc_data



);

function integer is_pld_clk_250MHz;
   input [8*25:1] l_ast_width;
   input [8*25:1] l_gen123_lane_rate_mode;
   input [8*25:1] l_lane_mask;
   begin
           if ((l_ast_width=="Avalon-ST 64-bit" ) && (l_gen123_lane_rate_mode=="Gen2 (5.0 Gbps)") && (l_lane_mask=="x4"))  is_pld_clk_250MHz=1;
      else if ((l_ast_width=="Avalon-ST 64-bit" ) && (l_gen123_lane_rate_mode=="Gen1 (2.5 Gbps)") && (l_lane_mask=="x8"))  is_pld_clk_250MHz=1;
      else if ((l_ast_width=="Avalon-ST 128-bit") && (l_gen123_lane_rate_mode=="Gen2 (5.0 Gbps)") && (l_lane_mask=="x8"))  is_pld_clk_250MHz=1;
      else                                                                                                                 is_pld_clk_250MHz=0;
   end
endfunction

// Exposed parameters
localparam pll_refclk_freq                               = pll_refclk_freq_hwtcl                                               ;// String  : "100 MHz";
localparam enable_slot_register                          = (enable_slot_register_hwtcl==1)?"true":"false"                      ;// String  : "false";
localparam bypass_cdc                                    = bypass_cdc_hwtcl                                                    ;// String  : "false";
localparam enable_rx_buffer_checking                     = enable_rx_buffer_checking_hwtcl                                     ;// String  : "false";
localparam [3:0] single_rx_detect                        = single_rx_detect_hwtcl                                     ;// integer : 4'b0;
localparam use_crc_forwarding                            = (use_crc_forwarding_hwtcl==1)?"true":"false"                        ;// String  : "false";
localparam gen123_lane_rate_mode                         = (gen123_lane_rate_mode_hwtcl=="Gen3 (8.0 Gbps)")?"gen1_gen2_gen3":
                                                            (gen123_lane_rate_mode_hwtcl=="Gen2 (5.0 Gbps)")?"gen1_gen2":"gen1";// String  : "gen1";
localparam lane_mask                                     = lane_mask_hwtcl                                                     ;// String  : "x4";
localparam disable_link_x2_support                       = disable_link_x2_support_hwtcl                                       ;// String  : "false";
localparam hip_hard_reset                                = hip_hard_reset_hwtcl                                                ;// String  : "disable";
localparam dis_paritychk                                 = (use_ast_parity==0)?"disable":"enable"                              ;// String  : "enable";
localparam wrong_device_id                               = wrong_device_id_hwtcl                                               ;// String  : "disable";
localparam data_pack_rx                                  = data_pack_rx_hwtcl                                                  ;// String  : "disable";
localparam ast_width                                     = (ast_width_hwtcl=="Avalon-ST 256-bit")?"rx_tx_256":(ast_width_hwtcl=="Avalon-ST 128-bit")?"rx_tx_128":"rx_tx_64";// String  : "rx_tx_64";
localparam rx_ast_parity                                 = (use_ast_parity==0)?"disable":"enable"                              ;// String  : "disable";
localparam tx_ast_parity                                 = (use_ast_parity==0)?"disable":"enable"                              ;// String  : "disable";
localparam ltssm_1ms_timeout                             = ltssm_1ms_timeout_hwtcl                                             ;// String  : "disable";
localparam ltssm_freqlocked_check                        = ltssm_freqlocked_check_hwtcl                                        ;// String  : "disable";
localparam deskew_comma                                  = deskew_comma_hwtcl                                                  ;// String  : "skp_eieos_deskw";
localparam [7:0] port_link_number                        = port_link_number_hwtcl                                     ;// integer : 8'b1;
localparam [4:0] device_number                           = device_number_hwtcl                                        ;// Integer : 5'b0;
localparam bypass_clk_switch                             = bypass_clk_switch_hwtcl                                             ;// String  : "TRUE";
localparam pipex1_debug_sel                              = pipex1_debug_sel_hwtcl                                              ;// String  : "disable";
localparam pclk_out_sel                                  = pclk_out_sel_hwtcl                                                  ;// String  : "pclk";
localparam [15:0] vendor_id                              = vendor_id_hwtcl                                           ;// integer : 16'b1000101110010;
localparam [15:0] device_id                              = device_id_hwtcl                                           ;// integer : 16'b1;
localparam [ 7:0] revision_id                            = revision_id_hwtcl                                          ;// integer : 8'b1;
localparam [23:0] class_code                             = class_code_hwtcl                                          ;// integer : 24'b111111110000000000000000;
localparam [15:0] subsystem_vendor_id                    = subsystem_vendor_id_hwtcl                                 ;// integer : 16'b1000101110010;
localparam [15:0] subsystem_device_id                    = subsystem_device_id_hwtcl                                 ;// integer : 16'b1;

localparam no_soft_reset                                 = no_soft_reset_hwtcl                                        ;// String  : "false";
localparam [2:0] maximum_current                         = maximum_current_hwtcl                                      ;// integer : 3'b0;
localparam d1_support                                    = d1_support_hwtcl                                                    ;// String  : "false";
localparam d2_support                                    = d2_support_hwtcl                                                    ;// String  : "false";
localparam d0_pme                                        = d0_pme_hwtcl                                                        ;// String  : "false";
localparam d1_pme                                        = d1_pme_hwtcl                                                        ;// String  : "false";
localparam d2_pme                                        = d2_pme_hwtcl                                                        ;// String  : "false";
localparam d3_hot_pme                                    = d3_hot_pme_hwtcl                                                    ;// String  : "false";
localparam d3_cold_pme                                   = d3_cold_pme_hwtcl                                                   ;// String  : "false";
localparam use_aer                                       = (use_aer_hwtcl==1)?"true":"false"                                   ;// String  : "false";
localparam low_priority_vc                               = low_priority_vc_hwtcl                                               ;// String  : "single_vc";
localparam disable_snoop_packet                          = disable_snoop_packet_hwtcl                                          ;// String  : "false";
localparam max_payload_size                              = (max_payload_size_hwtcl==128 )?"payload_128":
                                                           (max_payload_size_hwtcl==256 )?"payload_256":
                                                           (max_payload_size_hwtcl==512 )?"payload_512":
                                                           (max_payload_size_hwtcl==1024)?"payload_1024":
                                                           (max_payload_size_hwtcl==2048)?"payload_2048":"payload_128"         ;// String  : "payload_512";
localparam surprise_down_error_support                   = (surprise_down_error_support_hwtcl==1)?"true":"false"               ;// String  : "false";
localparam dll_active_report_support                     = (dll_active_report_support_hwtcl  ==1)?"true":"false"               ;// String  : "false";
localparam extend_tag_field                              = (extend_tag_field_hwtcl=="32")?"false":"true"                       ;// String  : "false";
localparam [2:0] endpoint_l0_latency                     = endpoint_l0_latency_hwtcl                                  ;// Integer : 3'b0;
localparam [2:0] endpoint_l1_latency                     = endpoint_l1_latency_hwtcl                                  ;// Integer : 3'b0;
localparam [2:0] indicator                               = indicator_hwtcl                                            ;// Integer : 3'b111;
localparam [1:0] slot_power_scale                        = slot_power_scale_hwtcl                                     ;// Integer : 2'b0;
localparam max_link_width                                = lane_mask_hwtcl                                                     ;// String  : "x4";
localparam enable_l1_aspm                                = enable_l1_aspm_hwtcl                                                ;// String  : "false";
localparam [2:0] l1_exit_latency_sameclock               = l1_exit_latency_sameclock_hwtcl                            ;// Integer : 3'b0;
localparam [2:0] l1_exit_latency_diffclock               = l1_exit_latency_diffclock_hwtcl                            ;// Integer : 3'b0;
localparam [6:0] hot_plug_support                        = hot_plug_support_hwtcl                                     ;// Integer : 7'b0;
localparam [7:0] slot_power_limit                        = slot_power_limit_hwtcl                                     ;// Integer : 8'b0;
localparam [12:0] slot_number                            = slot_number_hwtcl                                         ;// Integer : 13'b0;
localparam [7:0] diffclock_nfts_count                    = diffclock_nfts_count_hwtcl                                 ;// Integer : 8'b0;
localparam [7:0] sameclock_nfts_count                    = sameclock_nfts_count_hwtcl                                 ;// Integer : 8'b0;
localparam completion_timeout                            = completion_timeout_hwtcl                                            ;// String  : "abcd";
localparam enable_completion_timeout_disable             = (enable_completion_timeout_disable_hwtcl==1)?"true":"false"        ;// String  : "true";
localparam extended_tag_reset                            = extended_tag_reset_hwtcl                                            ;// String  : "false";
localparam ecrc_check_capable                            = (ecrc_check_capable_hwtcl==1)?"true":"false"                        ;// String  : "true";
localparam ecrc_gen_capable                              = (ecrc_gen_capable_hwtcl  ==1)?"true":"false"                        ;// String  : "true";
localparam msi_multi_message_capable                     = (msi_multi_message_capable_hwtcl=="1")?"count_1":
                                                           (msi_multi_message_capable_hwtcl=="2")?"count_2":
                                                           (msi_multi_message_capable_hwtcl=="4")?"count_4":
                                                           (msi_multi_message_capable_hwtcl=="8")?"count_8":"count_16"         ;// String  : "count_4";
localparam msi_64bit_addressing_capable                  = msi_64bit_addressing_capable_hwtcl                                  ;// String  : "true";
localparam msi_masking_capable                           = msi_masking_capable_hwtcl                                           ;// String  : "false";
localparam msi_support                                   = msi_support_hwtcl                                                   ;// String  : "true";
localparam interrupt_pin                                 = interrupt_pin_hwtcl                                                 ;// String  : "inta";
localparam enable_function_msix_support                  = (enable_function_msix_support_hwtcl==1)?"true":"false"              ;// String  : "true";
localparam [10:0] msix_table_size                        = msix_table_size_hwtcl                                     ;// Integer : 11'b0;
localparam [2:0]  msix_table_bir                         = msix_table_bir_hwtcl                                       ;// Integer : 3'b0;
localparam [28:0] msix_table_offset                      = msix_table_offset_hwtcl                                   ;// Integer : 29'b0;
localparam [2:0]  msix_pba_bir                           = msix_pba_bir_hwtcl                                         ;// Integer : 3'b0;
localparam [28:0] msix_pba_offset                        = msix_pba_offset_hwtcl                                     ;// Integer : 29'b0;
localparam bridge_port_vga_enable                        = bridge_port_vga_enable_hwtcl                                        ;// String  : "false";
localparam bridge_port_ssid_support                      = bridge_port_ssid_support_hwtcl                                      ;// String  : "false";
localparam [15:0] ssvid                                  = ssvid_hwtcl                                               ;// String  : 16'b0;
localparam [15:0] ssid                                   = ssid_hwtcl                                                ;// String  : 16'b0;
localparam [ 3:0] eie_before_nfts_count                  = eie_before_nfts_count_hwtcl                                ;// String  : 4'b100;
localparam [ 7:0] gen2_diffclock_nfts_count              = gen2_diffclock_nfts_count_hwtcl                            ;// String  : 8'b11111111;
localparam [ 7:0] gen2_sameclock_nfts_count              = gen2_sameclock_nfts_count_hwtcl                            ;// String  : 8'b11111111;
localparam deemphasis_enable                             = deemphasis_enable_hwtcl                                             ;// String  : "false";
localparam pcie_spec_version                             = (pcie_spec_version_hwtcl=="2.1")?"v2":"v2"                          ;// String  : "v2";
localparam [2:0] l0_exit_latency_sameclock               = l0_exit_latency_sameclock_hwtcl                            ;// String  : 3'b110;
localparam [2:0] l0_exit_latency_diffclock               = l0_exit_latency_diffclock_hwtcl                            ;// String  : 3'b110;
localparam rx_ei_l0s                                     = (rx_ei_l0s_hwtcl==1)?"disable":"enable"                             ;// String  : "disable";
localparam l2_async_logic                                = l2_async_logic_hwtcl                                                ;// String  : "enable";
localparam aspm_config_management                        = aspm_config_management_hwtcl                                        ;// String  : "true";
localparam atomic_op_routing                             = atomic_op_routing_hwtcl                                             ;// String  : "false";
localparam atomic_op_completer_32bit                     = atomic_op_completer_32bit_hwtcl                                     ;// String  : "false";
localparam atomic_op_completer_64bit                     = atomic_op_completer_64bit_hwtcl                                     ;// String  : "false";
localparam cas_completer_128bit                          = cas_completer_128bit_hwtcl                                          ;// String  : "false";
localparam ltr_mechanism                                 = ltr_mechanism_hwtcl                                                 ;// String  : "false";
localparam tph_completer                                 = tph_completer_hwtcl                                                 ;// String  : "false";
localparam extended_format_field                         = extended_format_field_hwtcl                                         ;// String  : "true";
localparam atomic_malformed                              = atomic_malformed_hwtcl                                              ;// String  : "false";
localparam flr_capability                                = flr_capability_hwtcl                                                ;// String  : "true";
localparam enable_adapter_half_rate_mode                 = enable_adapter_half_rate_mode_hwtcl                                 ;// String  : "false";
localparam vc0_clk_enable                                = vc0_clk_enable_hwtcl                                                ;// String  : "true";

localparam bar0_io_space                                 = (bar0_io_space_hwtcl        == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar0_64bit_mem_space                          = (bar0_64bit_mem_space_hwtcl == "Enabled")?"true":"false"            ;// String  : "true";
localparam bar0_prefetchable                             = (bar0_prefetchable_hwtcl    == "Enabled")?"true":"false"            ;// String  : "true";
localparam bar0_size_mask                                = bar0_size_mask_hwtcl                                                ;// String  : "256 MBytes - 28 bits";
localparam bar1_io_space                                 = (bar1_io_space_hwtcl        == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar1_64bit_mem_space                          = (bar1_64bit_mem_space_hwtcl == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar1_prefetchable                             = (bar1_prefetchable_hwtcl    == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar1_size_mask                                = bar1_size_mask_hwtcl                                                ;// String  : "N/A";
localparam bar2_io_space                                 = (bar2_io_space_hwtcl        == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar2_64bit_mem_space                          = (bar2_64bit_mem_space_hwtcl == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar2_prefetchable                             = (bar2_prefetchable_hwtcl    == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar2_size_mask                                = bar2_size_mask_hwtcl                                                ;// String  : "N/A";
localparam bar3_io_space                                 = (bar3_io_space_hwtcl        == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar3_64bit_mem_space                          = (bar3_64bit_mem_space_hwtcl == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar3_prefetchable                             = (bar3_prefetchable_hwtcl    == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar3_size_mask                                = bar3_size_mask_hwtcl                                                ;// String  : "N/A";
localparam bar4_io_space                                 = (bar4_io_space_hwtcl        == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar4_64bit_mem_space                          = (bar4_64bit_mem_space_hwtcl == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar4_prefetchable                             = (bar4_prefetchable_hwtcl    == "Enabled")?"true":"false"            ;// String  : "false";
localparam bar4_size_mask                                = bar4_size_mask_hwtcl                                                ;// String  : "N/A";
localparam bar5_io_space                                 = (bar5_io_space_hwtcl         == "Enabled")?"true":"false"           ;// String  : "false";
localparam bar5_64bit_mem_space                          = (bar5_64bit_mem_space_hwtcl  == "Enabled")?"true":"false"           ;// String  : "false";
localparam bar5_prefetchable                             = (bar5_prefetchable_hwtcl     == "Enabled")?"true":"false"           ;// String  : "false";
localparam bar5_size_mask                                = bar5_size_mask_hwtcl                                                ;// String  : "N/A";
localparam bar_io_window_size                            = 0;

localparam expansion_base_address_register               = expansion_base_address_register_hwtcl                     ;// String  : 32'b0;

localparam io_window_addr_width                          = io_window_addr_width_hwtcl                                ;// String  : "window_32_bit";
localparam prefetchable_mem_window_addr_width            = prefetchable_mem_window_addr_width_hwtcl                  ;// String  : "prefetch_32";
localparam [10:0] skp_os_gen3_count                      = skp_os_gen3_count_hwtcl                                   ;// Integer : 11'b0;
localparam [ 3:0] tx_cdc_almost_empty                    = tx_cdc_almost_empty_hwtcl                                 ;// Integer : 4'b101;
localparam [ 3:0] rx_cdc_almost_full                     = rx_cdc_almost_full_hwtcl                                  ;// Integer : 4'b1100;
localparam [ 3:0] tx_cdc_almost_full                     = tx_cdc_almost_full_hwtcl                                  ;// Integer : 4'b1100;
localparam [ 7:0] rx_l0s_count_idl                       = rx_l0s_count_idl_hwtcl                                    ;// Integer : 8'b0;
localparam [ 3:0] cdc_dummy_insert_limit                 = cdc_dummy_insert_limit_hwtcl                              ;// Integer : 4'b1011;
localparam [ 7:0] ei_delay_powerdown_count               = ei_delay_powerdown_count_hwtcl                            ;// Integer : 8'b1010;
localparam [19:0] millisecond_cycle_count                = millisecond_cycle_count_hwtcl                             ;// Integer : 20'b0;
localparam [10:0] skp_os_schedule_count                  = skp_os_schedule_count_hwtcl                               ;// Integer : 11'b0;
localparam [10:0] fc_init_timer                          = fc_init_timer_hwtcl                                       ;// Integer : 11'b10000000000;
localparam [ 4:0] l01_entry_latency                      = l01_entry_latency_hwtcl                                   ;// Integer : 5'b11111;
localparam [ 4:0] flow_control_update_count              = flow_control_update_count_hwtcl                           ;// Integer : 5'b11110;
localparam [ 7:0] flow_control_timeout_count             = flow_control_timeout_count_hwtcl                          ;// Integer : 8'b11001000;
localparam [ 7:0] vc0_rx_flow_ctrl_posted_header         = vc0_rx_flow_ctrl_posted_header_hwtcl                      ;// Integer : 8'b110010;
localparam [11:0] vc0_rx_flow_ctrl_posted_data           = vc0_rx_flow_ctrl_posted_data_hwtcl                        ;// Integer : 12'b101101000;
localparam [ 7:0] vc0_rx_flow_ctrl_nonposted_header      = vc0_rx_flow_ctrl_nonposted_header_hwtcl                   ;// Integer : 8'b110110;
localparam [ 7:0] vc0_rx_flow_ctrl_nonposted_data        = vc0_rx_flow_ctrl_nonposted_data_hwtcl                     ;// Integer : 8'b0;
localparam [ 7:0] vc0_rx_flow_ctrl_compl_header          = vc0_rx_flow_ctrl_compl_header_hwtcl                       ;// Integer : 8'b1110000;
localparam [11:0] vc0_rx_flow_ctrl_compl_data            = vc0_rx_flow_ctrl_compl_data_hwtcl                         ;// Integer : 12'b111000000;
localparam [10:0] rx_ptr0_posted_dpram_min               = rx_ptr0_posted_dpram_min_hwtcl                            ;// Integer : 11'b0;
localparam [10:0] rx_ptr0_posted_dpram_max               = rx_ptr0_posted_dpram_max_hwtcl                            ;// Integer : 11'b0;
localparam [10:0] rx_ptr0_nonposted_dpram_min            = rx_ptr0_nonposted_dpram_min_hwtcl                         ;// Integer : 11'b0;
localparam [10:0] rx_ptr0_nonposted_dpram_max            = rx_ptr0_nonposted_dpram_max_hwtcl                         ;// Integer : 11'b0;
localparam [10:0] retry_buffer_last_active_address       = retry_buffer_last_active_address_hwtcl                    ;// Integer : 11'b11111111111;
localparam [29:0] retry_buffer_memory_settings           = retry_buffer_memory_settings_hwtcl                        ;// Integer : 30'b0;
localparam [29:0] vc0_rx_buffer_memory_settings          = vc0_rx_buffer_memory_settings_hwtcl                       ;// Integer : 30'b0;


// Not visible parameters
localparam pcie_mode                                     = "shared_mode"                                                       ;// String  : "shared_mode";
localparam rx_sop_ctrl                                   = (ast_width=="rx_tx_256")? "boundary_256":"boundary_64";// String  : "boundary_64";
localparam bist_memory_settings                          = 75'b0;
localparam credit_buffer_allocation_aux                  = credit_buffer_allocation_aux_hwtcl;
localparam iei_enable_settings                           = "gen2_infei_infsd_gen1_infei_sd";
localparam vsec_id                                       = vsec_id_hwtcl ; //16'b1000101110010;
localparam cvp_rate_sel                                  = "full_rate";
localparam hard_reset_bypass                             = "true";
localparam cvp_data_compressed                           = "false";
localparam cvp_data_encrypted                            = "false";
localparam cvp_mode_reset                                = "false";
localparam cvp_clk_reset                                 = "false";

localparam ACDS_V10=1;
localparam MEM_CHECK=0;
localparam USE_INTERNAL_250MHZ_PLL = 1;
localparam in_cvp_mode = "NOT_IN_CVP_MODE";
localparam vsec_cap = vsec_rev_hwtcl;         //4'b0;
localparam jtag_id = 32'b0;
localparam user_id = user_id_hwtcl ;  //16'b0;
localparam cseb_extend_pci = "false";
localparam cseb_extend_pcie = "false";
localparam cseb_cpl_status_during_cvp = "config_retry_status";
localparam cseb_route_to_avl_rx_st = "cseb";
localparam cseb_config_bypass = "disable";
localparam cseb_cpl_tag_checking = "enable";
localparam cseb_bar_match_checking = "enable";
localparam cseb_min_error_checking = "false";
localparam cseb_temp_busy_crs = "completer_abort";
localparam gen3_diffclock_nfts_count = 8'b10000000;
localparam gen3_sameclock_nfts_count = 8'b10000000;
localparam gen3_coeff_errchk = "enable";
localparam gen3_paritychk = "enable";
localparam gen3_coeff_delay_count = 7'b1111101;
localparam gen3_coeff_1 = 18'b0;
localparam gen3_coeff_1_sel = "coeff_1";
localparam gen3_coeff_1_preset_hint = 3'b0;
localparam gen3_coeff_1_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_1_nxtber_more = "g3_coeff_1_nxtber_more";
localparam gen3_coeff_1_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_1_nxtber_less = "g3_coeff_1_nxtber_less";
localparam gen3_coeff_1_reqber = 5'b0;
localparam gen3_coeff_1_ber_meas = 6'b0;
localparam gen3_coeff_2 = 18'b0;
localparam gen3_coeff_2_sel = "coeff_2";
localparam gen3_coeff_2_preset_hint = 3'b0;
localparam gen3_coeff_2_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_2_nxtber_more = "g3_coeff_2_nxtber_more";
localparam gen3_coeff_2_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_2_nxtber_less = "g3_coeff_2_nxtber_less";
localparam gen3_coeff_2_reqber = 5'b0;
localparam gen3_coeff_2_ber_meas = 6'b0;
localparam gen3_coeff_3 = 18'b0;
localparam gen3_coeff_3_sel = "coeff_3";
localparam gen3_coeff_3_preset_hint = 3'b0;
localparam gen3_coeff_3_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_3_nxtber_more = "g3_coeff_3_nxtber_more";
localparam gen3_coeff_3_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_3_nxtber_less = "g3_coeff_3_nxtber_less";
localparam gen3_coeff_3_reqber = 5'b0;
localparam gen3_coeff_3_ber_meas = 6'b0;
localparam gen3_coeff_4 = 18'b0;
localparam gen3_coeff_4_sel = "coeff_4";
localparam gen3_coeff_4_preset_hint = 3'b0;
localparam gen3_coeff_4_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_4_nxtber_more = "g3_coeff_4_nxtber_more";
localparam gen3_coeff_4_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_4_nxtber_less = "g3_coeff_4_nxtber_less";
localparam gen3_coeff_4_reqber = 5'b0;
localparam gen3_coeff_4_ber_meas = 6'b0;
localparam gen3_coeff_5 = 18'b0;
localparam gen3_coeff_5_sel = "coeff_5";
localparam gen3_coeff_5_preset_hint = 3'b0;
localparam gen3_coeff_5_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_5_nxtber_more = "g3_coeff_5_nxtber_more";
localparam gen3_coeff_5_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_5_nxtber_less = "g3_coeff_5_nxtber_less";
localparam gen3_coeff_5_reqber = 5'b0;
localparam gen3_coeff_5_ber_meas = 6'b0;
localparam gen3_coeff_6 = 18'b0;
localparam gen3_coeff_6_sel = "coeff_6";
localparam gen3_coeff_6_preset_hint = 3'b0;
localparam gen3_coeff_6_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_6_nxtber_more = "g3_coeff_6_nxtber_more";
localparam gen3_coeff_6_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_6_nxtber_less = "g3_coeff_6_nxtber_less";
localparam gen3_coeff_6_reqber = 5'b0;
localparam gen3_coeff_6_ber_meas = 6'b0;
localparam gen3_coeff_7 = 18'b0;
localparam gen3_coeff_7_sel = "coeff_7";
localparam gen3_coeff_7_preset_hint = 3'b0;
localparam gen3_coeff_7_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_7_nxtber_more = "g3_coeff_7_nxtber_more";
localparam gen3_coeff_7_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_7_nxtber_less = "g3_coeff_7_nxtber_less";
localparam gen3_coeff_7_reqber = 5'b0;
localparam gen3_coeff_7_ber_meas = 6'b0;
localparam gen3_coeff_8 = 18'b0;
localparam gen3_coeff_8_sel = "coeff_8";
localparam gen3_coeff_8_preset_hint = 3'b0;
localparam gen3_coeff_8_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_8_nxtber_more = "g3_coeff_8_nxtber_more";
localparam gen3_coeff_8_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_8_nxtber_less = "g3_coeff_8_nxtber_less";
localparam gen3_coeff_8_reqber = 5'b0;
localparam gen3_coeff_8_ber_meas = 6'b0;
localparam gen3_coeff_9 = 18'b0;
localparam gen3_coeff_9_sel = "coeff_9";
localparam gen3_coeff_9_preset_hint = 3'b0;
localparam gen3_coeff_9_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_9_nxtber_more = "g3_coeff_9_nxtber_more";
localparam gen3_coeff_9_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_9_nxtber_less = "g3_coeff_9_nxtber_less";
localparam gen3_coeff_9_reqber = 5'b0;
localparam gen3_coeff_9_ber_meas = 6'b0;
localparam gen3_coeff_10 = 18'b0;
localparam gen3_coeff_10_sel = "coeff_10";
localparam gen3_coeff_10_preset_hint = 3'b0;
localparam gen3_coeff_10_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_10_nxtber_more = "g3_coeff_10_nxtber_more";
localparam gen3_coeff_10_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_10_nxtber_less = "g3_coeff_10_nxtber_less";
localparam gen3_coeff_10_reqber = 5'b0;
localparam gen3_coeff_10_ber_meas = 6'b0;
localparam gen3_coeff_11 = 18'b0;
localparam gen3_coeff_11_sel = "coeff_11";
localparam gen3_coeff_11_preset_hint = 3'b0;
localparam gen3_coeff_11_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_11_nxtber_more = "g3_coeff_11_nxtber_more";
localparam gen3_coeff_11_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_11_nxtber_less = "g3_coeff_11_nxtber_less";
localparam gen3_coeff_11_reqber = 5'b0;
localparam gen3_coeff_11_ber_meas = 6'b0;
localparam gen3_coeff_12 = 18'b0;
localparam gen3_coeff_12_sel = "coeff_12";
localparam gen3_coeff_12_preset_hint = 3'b0;
localparam gen3_coeff_12_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_12_nxtber_more = "g3_coeff_12_nxtber_more";
localparam gen3_coeff_12_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_12_nxtber_less = "g3_coeff_12_nxtber_less";
localparam gen3_coeff_12_reqber = 5'b0;
localparam gen3_coeff_12_ber_meas = 6'b0;
localparam gen3_coeff_13 = 18'b0;
localparam gen3_coeff_13_sel = "coeff_13";
localparam gen3_coeff_13_preset_hint = 3'b0;
localparam gen3_coeff_13_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_13_nxtber_more = "g3_coeff_13_nxtber_more";
localparam gen3_coeff_13_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_13_nxtber_less = "g3_coeff_13_nxtber_less";
localparam gen3_coeff_13_reqber = 5'b0;
localparam gen3_coeff_13_ber_meas = 6'b0;
localparam gen3_coeff_14 = 18'b0;
localparam gen3_coeff_14_sel = "coeff_14";
localparam gen3_coeff_14_preset_hint = 3'b0;
localparam gen3_coeff_14_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_14_nxtber_more = "g3_coeff_14_nxtber_more";
localparam gen3_coeff_14_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_14_nxtber_less = "g3_coeff_14_nxtber_less";
localparam gen3_coeff_14_reqber = 5'b0;
localparam gen3_coeff_14_ber_meas = 6'b0;
localparam gen3_coeff_15 = 18'b0;
localparam gen3_coeff_15_sel = "coeff_15";
localparam gen3_coeff_15_preset_hint = 3'b0;
localparam gen3_coeff_15_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_15_nxtber_more = "g3_coeff_15_nxtber_more";
localparam gen3_coeff_15_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_15_nxtber_less = "g3_coeff_15_nxtber_less";
localparam gen3_coeff_15_reqber = 5'b0;
localparam gen3_coeff_15_ber_meas = 6'b0;
localparam gen3_coeff_16 = 18'b0;
localparam gen3_coeff_16_sel = "coeff_16";
localparam gen3_coeff_16_preset_hint = 3'b0;
localparam gen3_coeff_16_nxtber_more_ptr = 4'b0;
localparam gen3_coeff_16_nxtber_more = "g3_coeff_16_nxtber_more";
localparam gen3_coeff_16_nxtber_less_ptr = 4'b0;
localparam gen3_coeff_16_nxtber_less = "g3_coeff_16_nxtber_less";
localparam gen3_coeff_16_reqber = 5'b0;
localparam gen3_coeff_16_ber_meas = 6'b0;
localparam gen3_preset_coeff_1 = 18'b0;
localparam gen3_preset_coeff_2 = 18'b0;
localparam gen3_preset_coeff_3 = 18'b0;
localparam gen3_preset_coeff_4 = 18'b0;
localparam gen3_preset_coeff_5 = 18'b0;
localparam gen3_preset_coeff_6 = 18'b0;
localparam gen3_preset_coeff_7 = 18'b0;
localparam gen3_preset_coeff_8 = 18'b0;
localparam gen3_preset_coeff_9 = 18'b0;
localparam gen3_preset_coeff_10 = 18'b0;
localparam gen3_rxfreqlock_counter = 20'b0;
localparam QW_ZERO                 = 64'h0;
localparam INTENDED_DEVICE_FAMILY = "Cyclone V";

localparam CB_A2P_ADDR_MAP_FIXED_TABLE_INT = { CB_A2P_ADDR_MAP_FIXED_TABLE_15_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_15_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_14_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_14_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_13_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_13_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_12_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_12_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_11_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_11_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_10_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_10_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_9_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_9_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_8_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_8_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_7_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_7_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_6_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_6_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_5_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_5_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_4_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_4_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_3_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_3_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_2_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_2_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_1_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_1_LOW,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_0_HIGH,
                                               CB_A2P_ADDR_MAP_FIXED_TABLE_0_LOW
                                              };

localparam PLD_CLK_IS_250MHZ = (is_pld_clk_250MHz(ast_width_hwtcl, gen123_lane_rate_mode_hwtcl, lane_mask_hwtcl ));


// Input for internal test port (PE/TE)
wire                 gnd_entest             = 1'b0;
wire                 gnd_frzlogic           = 1'b0;
wire                 gnd_frzreg             = 1'b0;
wire  [7 : 0]        gnd_idrcv              = QW_ZERO[7 : 0];
wire  [7 : 0]        gnd_idrpl              = QW_ZERO[7 : 0];
wire                 gnd_bistenrcv          = 1'b0;
wire                 gnd_bistenrpl          = 1'b0;
wire                 gnd_bistscanen         = 1'b0;
wire                 gnd_bistscanin         = 1'b0;
wire                 gnd_bisttesten         = 1'b0;
wire                 gnd_memhiptestenable   = 1'b0;
wire                 gnd_memredenscan       = 1'b0;
wire                 gnd_memredscen         = 1'b0;
wire                 gnd_memredscin         = 1'b0;
wire                 gnd_memredsclk         = 1'b0;
wire                 gnd_memredscrst        = 1'b0;
wire                 gnd_memredscsel        = 1'b0;
wire                 gnd_memregscanen       = 1'b0;
wire                 gnd_memregscanin       = 1'b0;
wire                 gnd_scanmoden          = 1'b0;
wire                 gnd_usermode           = 1'b0;
wire                 gnd_scanshiftn         = 1'b0;
wire                 gnd_nfrzdrv            = 1'b0;
wire                 gnd_plniotri           = 1'b0;
// Input for past QII 10.0 support
wire  [31 : 0]       gnd_csebrddata         = QW_ZERO[31 : 0];
wire  [3 : 0]        gnd_csebrddataparity   = QW_ZERO[3 : 0];
wire  [2 : 0]        gnd_csebrdresponse     = QW_ZERO[2 : 0];
wire                 gnd_csebwaitrequest    = 1'b0;
wire  [2 : 0]        gnd_csebwrresponse     = QW_ZERO[2 : 0];
wire                 gnd_csebwrrespvalid    = 1'b0;
wire  [43 : 0]       gnd_dbgpipex1rx        = QW_ZERO[43 : 0];
wire  [1 : 0]        gnd_swctmod            = QW_ZERO[1 : 0];
wire  [2 : 0]        gnd_swdn_in            = QW_ZERO[2 : 0];
wire  [6 : 0]        gnd_swup_in            = QW_ZERO[6 : 0];
wire                 gnd_cal_blk_clk        = 1'b0;


wire [1 :0]        tx_st_empty;
wire               tx_st_eop;
wire               tx_st_err;
wire               tx_st_sop;
wire [avmm_width_hwtcl-1 : 0]     tx_st_data;
wire [(avmm_width_hwtcl/8)-1:0]      tx_st_parity;
wire [(avmm_width_hwtcl/8)-1:0]      rx_st_parity;
wire [(avmm_width_hwtcl/8)-1:0]      rx_st_be;
wire [3 : 0]       rx_st_sop_int;
wire [3 : 0]       rx_st_valid_int;
wire [1 : 0]       rx_st_empty_int;
wire [3 : 0]       rx_st_eop_int;
wire [3 : 0]       rx_st_err_int;
wire [7 : 0]       rx_st_bardec1;
wire [7 : 0]       rx_st_bardec2;


wire                serdes_pll_locked;
wire                pld_core_ready;
wire                coreclkout_pll_locked;
wire                coreclkout_hip;
wire                pld_clk_hip;
reg           [1:0] pld_clk_rst_r;
reg                 pld_clk_rst;
wire                app_rstn;

//  Application interface
wire                  app_msi_ack;
wire                  lmi_ack;
wire   [31 : 0]       lmi_dout;

wire                  rx_st_empty;

wire   [11 : 0]       tx_cred_datafccp;
wire   [11 : 0]       tx_cred_datafcnp;
wire   [11 : 0]       tx_cred_datafcp;
wire   [5 : 0]        tx_cred_fchipcons;
wire   [5 : 0]        tx_cred_fcinfinite;
wire   [7 : 0]        tx_cred_hdrfccp;
wire   [7 : 0]        tx_cred_hdrfcnp;
wire   [7 : 0]        tx_cred_hdrfcp;

//  HIP Status signals
wire                  dlup;
wire                  rx_par_err;
wire   [1 : 0]        tx_par_err;
wire                  cfg_par_err;

wire  [1 : 0]        mode;

// Internal wire for internal test port (PE/TE)
wire [32 : 0] open_csebaddr;
wire [4 : 0]  open_csebaddrparity;
wire [3 : 0]  open_csebbe;
wire          open_csebisshadow;
wire          open_csebrden;
wire [31 : 0] open_csebwrdata;
wire [3 : 0]  open_csebwrdataparity;
wire          open_csebwren;
wire          open_csebwrrespreq;
wire [6 : 0]  open_swdnout;
wire [2 : 0]  open_swupout;
wire          open_bistdonearcv;
wire          open_bistdonearcv1;
wire          open_bistdonearpl;
wire          open_bistdonebrcv;
wire          open_bistdonebrcv1;
wire          open_bistdonebrpl;
wire          open_bistpassrcv;
wire          open_bistpassrcv1;
wire          open_bistpassrpl;
wire          open_bistscanoutrcv;
wire          open_bistscanoutrcv1;
wire          open_bistscanoutrpl;
wire          open_memredscout;
wire          open_memregscanout;
wire          open_wakeoen;
wire          open_srst;
wire          open_crst;
wire      adv_irq_ena;
wire      app_int_sts_internal;


// Application signals
wire  [4 : 0]        aer_msi_num;
wire                 app_int_sts;
wire  [4 : 0]        app_msi_num;
wire                 app_msi_req;
wire  [2 : 0]        app_msi_tc;
wire  [4 : 0]        pex_msi_num;

wire                 pm_auxpwr;
wire  [9 : 0]        pm_data;
wire                 pme_to_cr;
wire                 pm_event;
wire                 rx_st_mask;
wire                 rx_st_ready;

wire                 tx_st_valid;
wire  [12:0]         cfglink2csrpld;
wire  [6 :0]         cpl_err;
wire                 cpl_pending;
wire                 tl_slotclk_cfg;
reg [2:0]            reset_status_sync_pldclk_r;
wire                 reset_status_sync_pldclk;
wire                 npor_int;

wire           avalon_rstn;
wire           avalon_clk;

wire      reset_status_int;
assign mode = (port_type_hwtcl=="Native endpoint")?2'b00:2'b01;
assign    adv_irq_ena = (CG_ENABLE_ADVANCED_INTERRUPT == 1)? 1'b1 : 1'b0;


        altpcie_cv_hip_ast_hwtcl #(
                .lane_mask_hwtcl                           (lane_mask_hwtcl),
                .gen12_lane_rate_mode_hwtcl                (gen123_lane_rate_mode_hwtcl),
                .pcie_spec_version_hwtcl                   (pcie_spec_version_hwtcl),
                .ast_width_hwtcl                           (ast_width_hwtcl),
                .pll_refclk_freq_hwtcl                     (pll_refclk_freq_hwtcl),
                .set_pld_clk_x1_625MHz_hwtcl               (set_pld_clk_x1_625MHz_hwtcl),
                .in_cvp_mode_hwtcl                         (in_cvp_mode_hwtcl),
                .num_of_func_hwtcl                         (1),
                .use_crc_forwarding_hwtcl                  (use_crc_forwarding_hwtcl),
                .port_link_number_hwtcl                    (port_link_number_hwtcl),
                .slotclkcfg_hwtcl                          (slotclkcfg_hwtcl),
                .enable_slot_register_hwtcl                (enable_slot_register_hwtcl),
                .porttype_func0_hwtcl                      (port_type_hwtcl),
                .bar0_size_mask_0_hwtcl                    (bar0_size_mask_hwtcl),
                .bar0_io_space_0_hwtcl                     (bar0_io_space_hwtcl),
                .bar0_64bit_mem_space_0_hwtcl              (bar0_64bit_mem_space_hwtcl),
                .bar0_prefetchable_0_hwtcl                 (bar0_prefetchable_hwtcl),
                .bar1_size_mask_0_hwtcl                    (bar1_size_mask_hwtcl),
                .bar1_io_space_0_hwtcl                     (bar1_io_space_hwtcl),
                .bar1_prefetchable_0_hwtcl                 (bar1_prefetchable_hwtcl),
                .bar2_size_mask_0_hwtcl                    (bar2_size_mask_hwtcl),
                .bar2_io_space_0_hwtcl                     (bar2_io_space_hwtcl),
                .bar2_64bit_mem_space_0_hwtcl              (bar2_64bit_mem_space_hwtcl),
                .bar2_prefetchable_0_hwtcl                 (bar2_prefetchable_hwtcl),
                .bar3_size_mask_0_hwtcl                    (bar3_size_mask_hwtcl),
                .bar3_io_space_0_hwtcl                     (bar3_io_space_hwtcl),
                .bar3_prefetchable_0_hwtcl                 (bar3_prefetchable_hwtcl),
                .bar4_size_mask_0_hwtcl                    (bar4_size_mask_hwtcl                       ),
                .bar4_io_space_0_hwtcl                     (bar4_io_space_hwtcl                        ),
                .bar4_64bit_mem_space_0_hwtcl              (bar4_64bit_mem_space_hwtcl                 ),
                .bar4_prefetchable_0_hwtcl                 (bar4_prefetchable_hwtcl                    ),
                .bar5_size_mask_0_hwtcl                    (bar5_size_mask_hwtcl                       ),
                .bar5_io_space_0_hwtcl                     (bar5_io_space_hwtcl                        ),
                .bar5_prefetchable_0_hwtcl                 (bar5_prefetchable_hwtcl                    ),
                .expansion_base_address_register_0_hwtcl   (expansion_base_address_register_hwtcl),
                .io_window_addr_width_hwtcl                (io_window_addr_width_hwtcl),
                .prefetchable_mem_window_addr_width_hwtcl  (prefetchable_mem_window_addr_width_hwtcl),
                .vendor_id_0_hwtcl                         (vendor_id_hwtcl                            ),
                .device_id_0_hwtcl                         (device_id_hwtcl                            ),
                .revision_id_0_hwtcl                       (revision_id_hwtcl                          ),
                .class_code_0_hwtcl                        (class_code_hwtcl                           ),
                .subsystem_vendor_id_0_hwtcl               (subsystem_vendor_id_hwtcl                  ),
                .subsystem_device_id_0_hwtcl               (subsystem_device_id_hwtcl                  ),
                .max_payload_size_0_hwtcl                  (max_payload_size_hwtcl                     ),
                .extend_tag_field_0_hwtcl                  (extend_tag_field_hwtcl                     ),
                .completion_timeout_0_hwtcl                (completion_timeout_hwtcl                   ),
                .enable_completion_timeout_disable_0_hwtcl (enable_completion_timeout_disable_hwtcl    ),
                .flr_capability_0_hwtcl                    (flr_capability_hwtcl                       ),
                .use_aer_0_hwtcl                           (use_aer_hwtcl                              ),
                .ecrc_check_capable_0_hwtcl                (ecrc_check_capable_hwtcl                   ),
                .ecrc_gen_capable_0_hwtcl                  (ecrc_gen_capable_hwtcl                     ),
                .dll_active_report_support_0_hwtcl         (dll_active_report_support_hwtcl            ),
                .surprise_down_error_support_0_hwtcl       (surprise_down_error_support_hwtcl          ),
                .msi_multi_message_capable_0_hwtcl         (msi_multi_message_capable_hwtcl            ),
                .msi_64bit_addressing_capable_0_hwtcl      (msi_64bit_addressing_capable_hwtcl         ),
                .msi_masking_capable_0_hwtcl               (msi_masking_capable_hwtcl                  ),
                .msi_support_0_hwtcl                       (msi_support_hwtcl                          ),
                .enable_function_msix_support_0_hwtcl      (enable_function_msix_support_hwtcl         ),
                .msix_table_size_0_hwtcl                   (msix_table_size_hwtcl                      ),
                .msix_table_offset_0_hwtcl                 (msix_table_offset_hwtcl                    ),
                .msix_table_bir_0_hwtcl                    (msix_table_bir_hwtcl                       ),
                .msix_pba_offset_0_hwtcl                   (msix_pba_offset_hwtcl                      ),
                .msix_pba_bir_0_hwtcl                      (msix_pba_bir_hwtcl                         ),
                .interrupt_pin_0_hwtcl                     (interrupt_pin_hwtcl                        ),
                .slot_power_scale_0_hwtcl                  (slot_power_scale_hwtcl                     ),
                .slot_power_limit_0_hwtcl                  (slot_power_limit_hwtcl                     ),
                .slot_number_0_hwtcl                       (slot_number_hwtcl                          ),
                .rx_ei_l0s_0_hwtcl                         (rx_ei_l0s_hwtcl                            ),
                .endpoint_l0_latency_0_hwtcl               (endpoint_l0_latency_hwtcl                  ),
                .endpoint_l1_latency_0_hwtcl               (endpoint_l1_latency_hwtcl                  ),

                .hip_reconfig_hwtcl                        (hip_reconfig_hwtcl),
                .hip_hard_reset_hwtcl                      (hip_hard_reset_hwtcl),
                .enable_rx_buffer_checking_hwtcl           (enable_rx_buffer_checking_hwtcl),
                .single_rx_detect_hwtcl                    (single_rx_detect_hwtcl),
                .disable_link_x2_support_hwtcl             (disable_link_x2_support_hwtcl),
                .device_number_hwtcl                       (device_number_hwtcl),
                .bypass_clk_switch_hwtcl                   (bypass_clk_switch_hwtcl),
                .pipex1_debug_sel_hwtcl                    (pipex1_debug_sel_hwtcl),
                .pclk_out_sel_hwtcl                        (pclk_out_sel_hwtcl),
                .no_soft_reset_hwtcl                       (no_soft_reset_hwtcl),
                .maximum_current_0_hwtcl                   (maximum_current_hwtcl),
                .d1_support_hwtcl                          (d1_support_hwtcl),
                .d2_support_hwtcl                          (d2_support_hwtcl),
                .d0_pme_hwtcl                              (d0_pme_hwtcl),
                .d1_pme_hwtcl                              (d1_pme_hwtcl                       ),
                .d2_pme_hwtcl                              (d2_pme_hwtcl                       ),
                .d3_hot_pme_hwtcl                          (d3_hot_pme_hwtcl                   ),
                .d3_cold_pme_hwtcl                         (d3_cold_pme_hwtcl                  ),
                .low_priority_vc_hwtcl                     (low_priority_vc_hwtcl              ),
                .disable_snoop_packet_0_hwtcl              (disable_snoop_packet_hwtcl),

                .indicator_hwtcl                           (indicator_hwtcl                                                     ),
                .enable_l1_aspm_hwtcl                      (enable_l1_aspm_hwtcl                                                ),
                .enable_l0s_aspm_hwtcl                     (enable_l0s_aspm_hwtcl                                               ),
                .l1_exit_latency_sameclock_hwtcl           (l1_exit_latency_sameclock_hwtcl                                     ),
                .l1_exit_latency_diffclock_hwtcl           (l1_exit_latency_diffclock_hwtcl                                     ),
                .hot_plug_support_hwtcl                    (hot_plug_support_hwtcl                                              ),
                .diffclock_nfts_count_hwtcl                (diffclock_nfts_count_hwtcl                                          ),
                .sameclock_nfts_count_hwtcl                (sameclock_nfts_count_hwtcl                                          ),
                .no_command_completed_hwtcl                (no_command_completed_hwtcl                                          ),
                .use_tl_cfg_sync_hwtcl                     (use_tl_cfg_sync_hwtcl                                             ),
                .bridge_port_vga_enable_0_hwtcl            (bridge_port_vga_enable_hwtcl                                      ),
                .bridge_port_ssid_support_0_hwtcl          (bridge_port_ssid_support_hwtcl                                    ),
                .ssvid_0_hwtcl                             (ssvid_hwtcl                                                       ),
                .ssid_0_hwtcl                              (ssid_hwtcl                                                        ),
                .eie_before_nfts_count_hwtcl               (eie_before_nfts_count_hwtcl                                         ),
                .gen2_diffclock_nfts_count_hwtcl           (gen2_diffclock_nfts_count_hwtcl                                     ),
                .gen2_sameclock_nfts_count_hwtcl           (gen2_sameclock_nfts_count_hwtcl                                     ),
                .deemphasis_enable_hwtcl                   (deemphasis_enable_hwtcl                                             ),
                .l0_exit_latency_sameclock_hwtcl           (l0_exit_latency_sameclock_hwtcl                                     ),
                .l0_exit_latency_diffclock_hwtcl           (l0_exit_latency_diffclock_hwtcl                                     ),
                .l2_async_logic_hwtcl                      (l2_async_logic_hwtcl                                                ),
                .aspm_optionality_hwtcl                    ("true"                                              ),
                .enable_adapter_half_rate_mode_hwtcl       (enable_adapter_half_rate_mode_hwtcl                                 ),
                .vc0_clk_enable_hwtcl                      (vc0_clk_enable_hwtcl                                                ),
                .register_pipe_signals_hwtcl               (register_pipe_signals_hwtcl                                         ),
                .tx_cdc_almost_empty_hwtcl                 (tx_cdc_almost_empty_hwtcl                                           ),
                .rx_cdc_almost_full_hwtcl                  (rx_cdc_almost_full_hwtcl                                            ),
                .tx_cdc_almost_full_hwtcl                  (tx_cdc_almost_full_hwtcl                                            ),
                .rx_l0s_count_idl_hwtcl                    (rx_l0s_count_idl_hwtcl                                              ),
                .cdc_dummy_insert_limit_hwtcl              (cdc_dummy_insert_limit_hwtcl                                        ),
                .ei_delay_powerdown_count_hwtcl            (ei_delay_powerdown_count_hwtcl                                      ),
                .millisecond_cycle_count_hwtcl             (millisecond_cycle_count_hwtcl                                       ),
                .skp_os_schedule_count_hwtcl               (skp_os_schedule_count_hwtcl                                         ),
                .fc_init_timer_hwtcl                       (fc_init_timer_hwtcl                                                 ),
                .l01_entry_latency_hwtcl                   (l01_entry_latency_hwtcl                                             ),
                .flow_control_update_count_hwtcl           (flow_control_update_count_hwtcl                                     ),
                .flow_control_timeout_count_hwtcl          (flow_control_timeout_count_hwtcl                                    ),
                .credit_buffer_allocation_aux_hwtcl        (credit_buffer_allocation_aux_hwtcl                                  ),
                .vc0_rx_flow_ctrl_posted_header_hwtcl      (vc0_rx_flow_ctrl_posted_header_hwtcl                                ),
                .vc0_rx_flow_ctrl_posted_data_hwtcl        (vc0_rx_flow_ctrl_posted_data_hwtcl                                  ),
                .vc0_rx_flow_ctrl_nonposted_header_hwtcl   (vc0_rx_flow_ctrl_nonposted_header_hwtcl                             ),
                .vc0_rx_flow_ctrl_nonposted_data_hwtcl     (vc0_rx_flow_ctrl_nonposted_data_hwtcl                               ),
                .vc0_rx_flow_ctrl_compl_header_hwtcl       (vc0_rx_flow_ctrl_compl_header_hwtcl                                 ),
                .vc0_rx_flow_ctrl_compl_data_hwtcl         (vc0_rx_flow_ctrl_compl_data_hwtcl                                   ),
                .cpl_spc_header_hwtcl                      (cpl_spc_header_hwtcl                                                ),
                .cpl_spc_data_hwtcl                        (cpl_spc_data_hwtcl                                                  ),
                .retry_buffer_last_active_address_hwtcl    (retry_buffer_last_active_address_hwtcl                              ),
                .port_width_data_hwtcl                     (port_width_data_hwtcl                                               ),
                .reserved_debug_hwtcl                      (reserved_debug_hwtcl                                                ),
                .core_clk_sel_hwtcl                        (core_clk_sel_hwtcl),
                .rpre_emph_a_val_hwtcl                     (rpre_emph_a_val_hwtcl),
                .rpre_emph_b_val_hwtcl                     (rpre_emph_b_val_hwtcl),
                .rpre_emph_c_val_hwtcl                     (rpre_emph_c_val_hwtcl),
                .rpre_emph_d_val_hwtcl                     (rpre_emph_d_val_hwtcl),
                .rpre_emph_e_val_hwtcl                     (rpre_emph_e_val_hwtcl),
                .rvod_sel_a_val_hwtcl                      (rvod_sel_a_val_hwtcl ),
                .rvod_sel_b_val_hwtcl                      (rvod_sel_b_val_hwtcl ),
                .rvod_sel_c_val_hwtcl                      (rvod_sel_c_val_hwtcl ),
                .rvod_sel_d_val_hwtcl                      (rvod_sel_d_val_hwtcl ),
                .rvod_sel_e_val_hwtcl                      (rvod_sel_e_val_hwtcl ),

                .porttype_func1_hwtcl                      ("Native endpoint"),
                .bar0_size_mask_1_hwtcl                    (28),
                .bar0_io_space_1_hwtcl                     ("Disabled"),
                .bar0_64bit_mem_space_1_hwtcl              ("Enabled"),
                .bar0_prefetchable_1_hwtcl                 ("Enabled"),
                .bar1_size_mask_1_hwtcl                    (0),
                .bar1_io_space_1_hwtcl                     ("Disabled"),
                .bar1_prefetchable_1_hwtcl                 ("Disabled"),
                .bar2_size_mask_1_hwtcl                    (0),
                .bar2_io_space_1_hwtcl                     ("Disabled"),
                .bar2_64bit_mem_space_1_hwtcl              ("Disabled"),
                .bar2_prefetchable_1_hwtcl                 ("Disabled"),
                .bar3_size_mask_1_hwtcl                    (0),
                .bar3_io_space_1_hwtcl                     ("Disabled"),
                .bar3_prefetchable_1_hwtcl                 ("Disabled"),
                .bar4_size_mask_1_hwtcl                    (0),
                .bar4_io_space_1_hwtcl                     ("Disabled"),
                .bar4_64bit_mem_space_1_hwtcl              ("Disabled"),
                .bar4_prefetchable_1_hwtcl                 ("Disabled"),
                .bar5_size_mask_1_hwtcl                    (0),
                .bar5_io_space_1_hwtcl                     ("Disabled"),
                .bar5_prefetchable_1_hwtcl                 ("Disabled"),
                .expansion_base_address_register_1_hwtcl   (0),
                .vendor_id_1_hwtcl                         (0),
                .device_id_1_hwtcl                         (1),
                .revision_id_1_hwtcl                       (1),
                .class_code_1_hwtcl                        (0),
                .subsystem_vendor_id_1_hwtcl               (0),
                .subsystem_device_id_1_hwtcl               (0),
                .max_payload_size_1_hwtcl                  (128),
                .extend_tag_field_1_hwtcl                  ("32"),
                .completion_timeout_1_hwtcl                ("ABCD"),
                .enable_completion_timeout_disable_1_hwtcl (1),
                .flr_capability_1_hwtcl                    (0),
                .use_aer_1_hwtcl                           (0),
                .ecrc_check_capable_1_hwtcl                (0),
                .ecrc_gen_capable_1_hwtcl                  (0),
                .dll_active_report_support_1_hwtcl         (0),
                .surprise_down_error_support_1_hwtcl       (0),
                .msi_multi_message_capable_1_hwtcl         ("4"),
                .msi_64bit_addressing_capable_1_hwtcl      ("true"),
                .msi_masking_capable_1_hwtcl               ("false"),
                .msi_support_1_hwtcl                       ("true"),
                .enable_function_msix_support_1_hwtcl      (0),
                .msix_table_size_1_hwtcl                   (0),
                .msix_table_offset_1_hwtcl                 (0),
                .msix_table_bir_1_hwtcl                    (0),
                .msix_pba_offset_1_hwtcl                   (0),
                .msix_pba_bir_1_hwtcl                      (0),
                .interrupt_pin_1_hwtcl                     ("inta"),
                .slot_power_scale_1_hwtcl                  (0),
                .slot_power_limit_1_hwtcl                  (0),
                .slot_number_1_hwtcl                       (0),
                .rx_ei_l0s_1_hwtcl                         (0),
                .endpoint_l0_latency_1_hwtcl               (0),
                .endpoint_l1_latency_1_hwtcl               (0),
                .maximum_current_1_hwtcl                   (0),
                .disable_snoop_packet_1_hwtcl              ("false"),
                .bridge_port_vga_enable_1_hwtcl            ("false"),
                .bridge_port_ssid_support_1_hwtcl          ("false"),
                .ssvid_1_hwtcl                             (0),
                .ssid_1_hwtcl                              (0),
                .porttype_func2_hwtcl                      ("Native endpoint"),
                .bar0_size_mask_2_hwtcl                    (28),
                .bar0_io_space_2_hwtcl                     ("Disabled"),
                .bar0_64bit_mem_space_2_hwtcl              ("Enabled"),
                .bar0_prefetchable_2_hwtcl                 ("Enabled"),
                .bar1_size_mask_2_hwtcl                    (0),
                .bar1_io_space_2_hwtcl                     ("Disabled"),
                .bar1_prefetchable_2_hwtcl                 ("Disabled"),
                .bar2_size_mask_2_hwtcl                    (0),
                .bar2_io_space_2_hwtcl                     ("Disabled"),
                .bar2_64bit_mem_space_2_hwtcl              ("Disabled"),
                .bar2_prefetchable_2_hwtcl                 ("Disabled"),
                .bar3_size_mask_2_hwtcl                    (0),
                .bar3_io_space_2_hwtcl                     ("Disabled"),
                .bar3_prefetchable_2_hwtcl                 ("Disabled"),
                .bar4_size_mask_2_hwtcl                    (0),
                .bar4_io_space_2_hwtcl                     ("Disabled"),
                .bar4_64bit_mem_space_2_hwtcl              ("Disabled"),
                .bar4_prefetchable_2_hwtcl                 ("Disabled"),
                .bar5_size_mask_2_hwtcl                    (0),
                .bar5_io_space_2_hwtcl                     ("Disabled"),
                .bar5_prefetchable_2_hwtcl                 ("Disabled"),
                .expansion_base_address_register_2_hwtcl   (0),
                .vendor_id_2_hwtcl                         (0),
                .device_id_2_hwtcl                         (1),
                .revision_id_2_hwtcl                       (1),
                .class_code_2_hwtcl                        (0),
                .subsystem_vendor_id_2_hwtcl               (0),
                .subsystem_device_id_2_hwtcl               (0),
                .max_payload_size_2_hwtcl                  (128),
                .extend_tag_field_2_hwtcl                  ("32"),
                .completion_timeout_2_hwtcl                ("ABCD"),
                .enable_completion_timeout_disable_2_hwtcl (1),
                .flr_capability_2_hwtcl                    (0),
                .use_aer_2_hwtcl                           (0),
                .ecrc_check_capable_2_hwtcl                (0),
                .ecrc_gen_capable_2_hwtcl                  (0),
                .dll_active_report_support_2_hwtcl         (0),
                .surprise_down_error_support_2_hwtcl       (0),
                .msi_multi_message_capable_2_hwtcl         ("4"),
                .msi_64bit_addressing_capable_2_hwtcl      ("true"),
                .msi_masking_capable_2_hwtcl               ("false"),
                .msi_support_2_hwtcl                       ("true"),
                .enable_function_msix_support_2_hwtcl      (0),
                .msix_table_size_2_hwtcl                   (0),
                .msix_table_offset_2_hwtcl                 (0),
                .msix_table_bir_2_hwtcl                    (0),
                .msix_pba_offset_2_hwtcl                   (0),
                .msix_pba_bir_2_hwtcl                      (0),
                .interrupt_pin_2_hwtcl                     ("inta"),
                .slot_power_scale_2_hwtcl                  (0),
                .slot_power_limit_2_hwtcl                  (0),
                .slot_number_2_hwtcl                       (0),
                .rx_ei_l0s_2_hwtcl                         (0),
                .endpoint_l0_latency_2_hwtcl               (0),
                .endpoint_l1_latency_2_hwtcl               (0),
                .maximum_current_2_hwtcl                   (0),
                .disable_snoop_packet_2_hwtcl              ("false"),
                .bridge_port_vga_enable_2_hwtcl            ("false"),
                .bridge_port_ssid_support_2_hwtcl          ("false"),
                .ssvid_2_hwtcl                             (0),
                .ssid_2_hwtcl                              (0),
                .porttype_func3_hwtcl                      ("Native endpoint"),
                .bar0_size_mask_3_hwtcl                    (28),
                .bar0_io_space_3_hwtcl                     ("Disabled"),
                .bar0_64bit_mem_space_3_hwtcl              ("Enabled"),
                .bar0_prefetchable_3_hwtcl                 ("Enabled"),
                .bar1_size_mask_3_hwtcl                    (0),
                .bar1_io_space_3_hwtcl                     ("Disabled"),
                .bar1_prefetchable_3_hwtcl                 ("Disabled"),
                .bar2_size_mask_3_hwtcl                    (0),
                .bar2_io_space_3_hwtcl                     ("Disabled"),
                .bar2_64bit_mem_space_3_hwtcl              ("Disabled"),
                .bar2_prefetchable_3_hwtcl                 ("Disabled"),
                .bar3_size_mask_3_hwtcl                    (0),
                .bar3_io_space_3_hwtcl                     ("Disabled"),
                .bar3_prefetchable_3_hwtcl                 ("Disabled"),
                .bar4_size_mask_3_hwtcl                    (0),
                .bar4_io_space_3_hwtcl                     ("Disabled"),
                .bar4_64bit_mem_space_3_hwtcl              ("Disabled"),
                .bar4_prefetchable_3_hwtcl                 ("Disabled"),
                .bar5_size_mask_3_hwtcl                    (0),
                .bar5_io_space_3_hwtcl                     ("Disabled"),
                .bar5_prefetchable_3_hwtcl                 ("Disabled"),
                .expansion_base_address_register_3_hwtcl   (0),
                .vendor_id_3_hwtcl                         (0),
                .device_id_3_hwtcl                         (1),
                .revision_id_3_hwtcl                       (1),
                .class_code_3_hwtcl                        (0),
                .subsystem_vendor_id_3_hwtcl               (0),
                .subsystem_device_id_3_hwtcl               (0),
                .max_payload_size_3_hwtcl                  (128),
                .extend_tag_field_3_hwtcl                  ("32"),
                .completion_timeout_3_hwtcl                ("ABCD"),
                .enable_completion_timeout_disable_3_hwtcl (1),
                .flr_capability_3_hwtcl                    (0),
                .use_aer_3_hwtcl                           (0),
                .ecrc_check_capable_3_hwtcl                (0),
                .ecrc_gen_capable_3_hwtcl                  (0),
                .dll_active_report_support_3_hwtcl         (0),
                .surprise_down_error_support_3_hwtcl       (0),
                .msi_multi_message_capable_3_hwtcl         ("4"),
                .msi_64bit_addressing_capable_3_hwtcl      ("true"),
                .msi_masking_capable_3_hwtcl               ("false"),
                .msi_support_3_hwtcl                       ("true"),
                .enable_function_msix_support_3_hwtcl      (0),
                .msix_table_size_3_hwtcl                   (0),
                .msix_table_offset_3_hwtcl                 (0),
                .msix_table_bir_3_hwtcl                    (0),
                .msix_pba_offset_3_hwtcl                   (0),
                .msix_pba_bir_3_hwtcl                      (0),
                .interrupt_pin_3_hwtcl                     ("inta"),
                .slot_power_scale_3_hwtcl                  (0),
                .slot_power_limit_3_hwtcl                  (0),
                .slot_number_3_hwtcl                       (0),
                .rx_ei_l0s_3_hwtcl                         (0),
                .endpoint_l0_latency_3_hwtcl               (0),
                .endpoint_l1_latency_3_hwtcl               (0),
                .maximum_current_3_hwtcl                   (0),
                .disable_snoop_packet_3_hwtcl              ("false"),
                .bridge_port_vga_enable_3_hwtcl            ("false"),
                .bridge_port_ssid_support_3_hwtcl          ("false"),
                .ssvid_3_hwtcl                             (0),
                .ssid_3_hwtcl                              (0),
                .porttype_func4_hwtcl                      ("Native endpoint"),
                .bar0_size_mask_4_hwtcl                    (28),
                .bar0_io_space_4_hwtcl                     ("Disabled"),
                .bar0_64bit_mem_space_4_hwtcl              ("Enabled"),
                .bar0_prefetchable_4_hwtcl                 ("Enabled"),
                .bar1_size_mask_4_hwtcl                    (0),
                .bar1_io_space_4_hwtcl                     ("Disabled"),
                .bar1_prefetchable_4_hwtcl                 ("Disabled"),
                .bar2_size_mask_4_hwtcl                    (0),
                .bar2_io_space_4_hwtcl                     ("Disabled"),
                .bar2_64bit_mem_space_4_hwtcl              ("Disabled"),
                .bar2_prefetchable_4_hwtcl                 ("Disabled"),
                .bar3_size_mask_4_hwtcl                    (0),
                .bar3_io_space_4_hwtcl                     ("Disabled"),
                .bar3_prefetchable_4_hwtcl                 ("Disabled"),
                .bar4_size_mask_4_hwtcl                    (0),
                .bar4_io_space_4_hwtcl                     ("Disabled"),
                .bar4_64bit_mem_space_4_hwtcl              ("Disabled"),
                .bar4_prefetchable_4_hwtcl                 ("Disabled"),
                .bar5_size_mask_4_hwtcl                    (0),
                .bar5_io_space_4_hwtcl                     ("Disabled"),
                .bar5_prefetchable_4_hwtcl                 ("Disabled"),
                .expansion_base_address_register_4_hwtcl   (0),
                .vendor_id_4_hwtcl                         (0),
                .device_id_4_hwtcl                         (1),
                .revision_id_4_hwtcl                       (1),
                .class_code_4_hwtcl                        (0),
                .subsystem_vendor_id_4_hwtcl               (0),
                .subsystem_device_id_4_hwtcl               (0),
                .max_payload_size_4_hwtcl                  (128),
                .extend_tag_field_4_hwtcl                  ("32"),
                .completion_timeout_4_hwtcl                ("ABCD"),
                .enable_completion_timeout_disable_4_hwtcl (1),
                .flr_capability_4_hwtcl                    (0),
                .use_aer_4_hwtcl                           (0),
                .ecrc_check_capable_4_hwtcl                (0),
                .ecrc_gen_capable_4_hwtcl                  (0),
                .dll_active_report_support_4_hwtcl         (0),
                .surprise_down_error_support_4_hwtcl       (0),
                .msi_multi_message_capable_4_hwtcl         ("4"),
                .msi_64bit_addressing_capable_4_hwtcl      ("true"),
                .msi_masking_capable_4_hwtcl               ("false"),
                .msi_support_4_hwtcl                       ("true"),
                .enable_function_msix_support_4_hwtcl      (0),
                .msix_table_size_4_hwtcl                   (0),
                .msix_table_offset_4_hwtcl                 (0),
                .msix_table_bir_4_hwtcl                    (0),
                .msix_pba_offset_4_hwtcl                   (0),
                .msix_pba_bir_4_hwtcl                      (0),
                .interrupt_pin_4_hwtcl                     ("inta"),
                .slot_power_scale_4_hwtcl                  (0),
                .slot_power_limit_4_hwtcl                  (0),
                .slot_number_4_hwtcl                       (0),
                .rx_ei_l0s_4_hwtcl                         (0),
                .endpoint_l0_latency_4_hwtcl               (0),
                .endpoint_l1_latency_4_hwtcl               (0),
                .maximum_current_4_hwtcl                   (0),
                .disable_snoop_packet_4_hwtcl              ("false"),
                .bridge_port_vga_enable_4_hwtcl            ("false"),
                .bridge_port_ssid_support_4_hwtcl          ("false"),
                .ssvid_4_hwtcl                             (0),
                .ssid_4_hwtcl                              (0),
                .porttype_func5_hwtcl                      ("Native endpoint"),
                .bar0_size_mask_5_hwtcl                    (28),
                .bar0_io_space_5_hwtcl                     ("Disabled"),
                .bar0_64bit_mem_space_5_hwtcl              ("Enabled"),
                .bar0_prefetchable_5_hwtcl                 ("Enabled"),
                .bar1_size_mask_5_hwtcl                    (0),
                .bar1_io_space_5_hwtcl                     ("Disabled"),
                .bar1_prefetchable_5_hwtcl                 ("Disabled"),
                .bar2_size_mask_5_hwtcl                    (0),
                .bar2_io_space_5_hwtcl                     ("Disabled"),
                .bar2_64bit_mem_space_5_hwtcl              ("Disabled"),
                .bar2_prefetchable_5_hwtcl                 ("Disabled"),
                .bar3_size_mask_5_hwtcl                    (0),
                .bar3_io_space_5_hwtcl                     ("Disabled"),
                .bar3_prefetchable_5_hwtcl                 ("Disabled"),
                .bar4_size_mask_5_hwtcl                    (0),
                .bar4_io_space_5_hwtcl                     ("Disabled"),
                .bar4_64bit_mem_space_5_hwtcl              ("Disabled"),
                .bar4_prefetchable_5_hwtcl                 ("Disabled"),
                .bar5_size_mask_5_hwtcl                    (0),
                .bar5_io_space_5_hwtcl                     ("Disabled"),
                .bar5_prefetchable_5_hwtcl                 ("Disabled"),
                .expansion_base_address_register_5_hwtcl   (0),
                .vendor_id_5_hwtcl                         (0),
                .device_id_5_hwtcl                         (1),
                .revision_id_5_hwtcl                       (1),
                .class_code_5_hwtcl                        (0),
                .subsystem_vendor_id_5_hwtcl               (0),
                .subsystem_device_id_5_hwtcl               (0),
                .max_payload_size_5_hwtcl                  (128),
                .extend_tag_field_5_hwtcl                  ("32"),
                .completion_timeout_5_hwtcl                ("ABCD"),
                .enable_completion_timeout_disable_5_hwtcl (1),
                .flr_capability_5_hwtcl                    (0),
                .use_aer_5_hwtcl                           (0),
                .ecrc_check_capable_5_hwtcl                (0),
                .ecrc_gen_capable_5_hwtcl                  (0),
                .dll_active_report_support_5_hwtcl         (0),
                .surprise_down_error_support_5_hwtcl       (0),
                .msi_multi_message_capable_5_hwtcl         ("4"),
                .msi_64bit_addressing_capable_5_hwtcl      ("true"),
                .msi_masking_capable_5_hwtcl               ("false"),
                .msi_support_5_hwtcl                       ("true"),
                .enable_function_msix_support_5_hwtcl      (0),
                .msix_table_size_5_hwtcl                   (0),
                .msix_table_offset_5_hwtcl                 (0),
                .msix_table_bir_5_hwtcl                    (0),
                .msix_pba_offset_5_hwtcl                   (0),
                .msix_pba_bir_5_hwtcl                      (0),
                .interrupt_pin_5_hwtcl                     ("inta"),
                .slot_power_scale_5_hwtcl                  (0),
                .slot_power_limit_5_hwtcl                  (0),
                .slot_number_5_hwtcl                       (0),
                .rx_ei_l0s_5_hwtcl                         (0),
                .endpoint_l0_latency_5_hwtcl               (0),
                .endpoint_l1_latency_5_hwtcl               (0),
                .maximum_current_5_hwtcl                   (0),
                .disable_snoop_packet_5_hwtcl              ("false"),
                .bridge_port_vga_enable_5_hwtcl            ("false"),
                .bridge_port_ssid_support_5_hwtcl          ("false"),
                .ssvid_5_hwtcl                             (0),
                .ssid_5_hwtcl                              (0),
                .porttype_func6_hwtcl                      ("Native endpoint"),
                .bar0_size_mask_6_hwtcl                    (28),
                .bar0_io_space_6_hwtcl                     ("Disabled"),
                .bar0_64bit_mem_space_6_hwtcl              ("Enabled"),
                .bar0_prefetchable_6_hwtcl                 ("Enabled"),
                .bar1_size_mask_6_hwtcl                    (0),
                .bar1_io_space_6_hwtcl                     ("Disabled"),
                .bar1_prefetchable_6_hwtcl                 ("Disabled"),
                .bar2_size_mask_6_hwtcl                    (0),
                .bar2_io_space_6_hwtcl                     ("Disabled"),
                .bar2_64bit_mem_space_6_hwtcl              ("Disabled"),
                .bar2_prefetchable_6_hwtcl                 ("Disabled"),
                .bar3_size_mask_6_hwtcl                    (0),
                .bar3_io_space_6_hwtcl                     ("Disabled"),
                .bar3_prefetchable_6_hwtcl                 ("Disabled"),
                .bar4_size_mask_6_hwtcl                    (0),
                .bar4_io_space_6_hwtcl                     ("Disabled"),
                .bar4_64bit_mem_space_6_hwtcl              ("Disabled"),
                .bar4_prefetchable_6_hwtcl                 ("Disabled"),
                .bar5_size_mask_6_hwtcl                    (0),
                .bar5_io_space_6_hwtcl                     ("Disabled"),
                .bar5_prefetchable_6_hwtcl                 ("Disabled"),
                .expansion_base_address_register_6_hwtcl   (0),
                .vendor_id_6_hwtcl                         (0),
                .device_id_6_hwtcl                         (1),
                .revision_id_6_hwtcl                       (1),
                .class_code_6_hwtcl                        (0),
                .subsystem_vendor_id_6_hwtcl               (0),
                .subsystem_device_id_6_hwtcl               (0),
                .max_payload_size_6_hwtcl                  (128),
                .extend_tag_field_6_hwtcl                  ("32"),
                .completion_timeout_6_hwtcl                ("ABCD"),
                .enable_completion_timeout_disable_6_hwtcl (1),
                .flr_capability_6_hwtcl                    (0),
                .use_aer_6_hwtcl                           (0),
                .ecrc_check_capable_6_hwtcl                (0),
                .ecrc_gen_capable_6_hwtcl                  (0),
                .dll_active_report_support_6_hwtcl         (0),
                .surprise_down_error_support_6_hwtcl       (0),
                .msi_multi_message_capable_6_hwtcl         ("4"),
                .msi_64bit_addressing_capable_6_hwtcl      ("true"),
                .msi_masking_capable_6_hwtcl               ("false"),
                .msi_support_6_hwtcl                       ("true"),
                .enable_function_msix_support_6_hwtcl      (0),
                .msix_table_size_6_hwtcl                   (0),
                .msix_table_offset_6_hwtcl                 (0),
                .msix_table_bir_6_hwtcl                    (0),
                .msix_pba_offset_6_hwtcl                   (0),
                .msix_pba_bir_6_hwtcl                      (0),
                .interrupt_pin_6_hwtcl                     ("inta"),
                .slot_power_scale_6_hwtcl                  (0),
                .slot_power_limit_6_hwtcl                  (0),
                .slot_number_6_hwtcl                       (0),
                .rx_ei_l0s_6_hwtcl                         (0),
                .endpoint_l0_latency_6_hwtcl               (0),
                .endpoint_l1_latency_6_hwtcl               (0),
                .maximum_current_6_hwtcl                   (0),
                .disable_snoop_packet_6_hwtcl              ("false"),
                .bridge_port_vga_enable_6_hwtcl            ("false"),
                .bridge_port_ssid_support_6_hwtcl          ("false"),
                .ssvid_6_hwtcl                             (0),
                .ssid_6_hwtcl                              (0),
                .porttype_func7_hwtcl                      ("Native endpoint"),
                .bar0_size_mask_7_hwtcl                    (28),
                .bar0_io_space_7_hwtcl                     ("Disabled"),
                .bar0_64bit_mem_space_7_hwtcl              ("Enabled"),
                .bar0_prefetchable_7_hwtcl                 ("Enabled"),
                .bar1_size_mask_7_hwtcl                    (0),
                .bar1_io_space_7_hwtcl                     ("Disabled"),
                .bar1_prefetchable_7_hwtcl                 ("Disabled"),
                .bar2_size_mask_7_hwtcl                    (0),
                .bar2_io_space_7_hwtcl                     ("Disabled"),
                .bar2_64bit_mem_space_7_hwtcl              ("Disabled"),
                .bar2_prefetchable_7_hwtcl                 ("Disabled"),
                .bar3_size_mask_7_hwtcl                    (0),
                .bar3_io_space_7_hwtcl                     ("Disabled"),
                .bar3_prefetchable_7_hwtcl                 ("Disabled"),
                .bar4_size_mask_7_hwtcl                    (0),
                .bar4_io_space_7_hwtcl                     ("Disabled"),
                .bar4_64bit_mem_space_7_hwtcl              ("Disabled"),
                .bar4_prefetchable_7_hwtcl                 ("Disabled"),
                .bar5_size_mask_7_hwtcl                    (0),
                .bar5_io_space_7_hwtcl                     ("Disabled"),
                .bar5_prefetchable_7_hwtcl                 ("Disabled"),
                .expansion_base_address_register_7_hwtcl   (0),
                .vendor_id_7_hwtcl                         (0),
                .device_id_7_hwtcl                         (1),
                .revision_id_7_hwtcl                       (1),
                .class_code_7_hwtcl                        (0),
                .subsystem_vendor_id_7_hwtcl               (0),
                .subsystem_device_id_7_hwtcl               (0),
                .max_payload_size_7_hwtcl                  (128),
                .extend_tag_field_7_hwtcl                  ("32"),
                .completion_timeout_7_hwtcl                ("ABCD"),
                .enable_completion_timeout_disable_7_hwtcl (1),
                .flr_capability_7_hwtcl                    (0),
                .use_aer_7_hwtcl                           (0),
                .ecrc_check_capable_7_hwtcl                (0),
                .ecrc_gen_capable_7_hwtcl                  (0),
                .dll_active_report_support_7_hwtcl         (0),
                .surprise_down_error_support_7_hwtcl       (0),
                .msi_multi_message_capable_7_hwtcl         ("4"),
                .msi_64bit_addressing_capable_7_hwtcl      ("true"),
                .msi_masking_capable_7_hwtcl               ("false"),
                .msi_support_7_hwtcl                       ("true"),
                .enable_function_msix_support_7_hwtcl      (0),
                .msix_table_size_7_hwtcl                   (0),
                .msix_table_offset_7_hwtcl                 (0),
                .msix_table_bir_7_hwtcl                    (0),
                .msix_pba_offset_7_hwtcl                   (0),
                .msix_pba_bir_7_hwtcl                      (0),
                .interrupt_pin_7_hwtcl                     ("inta"),
                .slot_power_scale_7_hwtcl                  (0),
                .slot_power_limit_7_hwtcl                  (0),
                .slot_number_7_hwtcl                       (0),
                .rx_ei_l0s_7_hwtcl                         (0),
                .endpoint_l0_latency_7_hwtcl               (0),
                .endpoint_l1_latency_7_hwtcl               (0),
                .maximum_current_7_hwtcl                   (0),
                .disable_snoop_packet_7_hwtcl              ("false"),
                .bridge_port_vga_enable_7_hwtcl            ("false"),
                .bridge_port_ssid_support_7_hwtcl          ("false"),
                .ssvid_7_hwtcl                             (0),
                .ssid_7_hwtcl                              (0),
                .reconfig_to_xcvr_width                    (reconfig_to_xcvr_width),
                .reconfig_from_xcvr_width                  (reconfig_from_xcvr_width),
                .vsec_id_hwtcl                             (vsec_id_hwtcl),
                .vsec_rev_hwtcl                            (vsec_rev_hwtcl),
                .user_id_hwtcl                             (user_id_hwtcl)

        ) c5_hip_ast (
                .npor                    (npor),                 //               npor.npor
                .pin_perst               (pin_perst),            //                   .pin_perst
                .test_in                 (test_in),          //           hip_ctrl.test_in
                .simu_mode_pipe          (simu_mode_pipe),   //                   .simu_mode_pipe
                .pld_clk                 (pld_clk_hip),                        //            pld_clk.clk
                .coreclkout              (coreclkout_hip),                      //     coreclkout_hip.clk
                .refclk                  (refclk),                //             refclk.clk
                .rx_in0                  (rx_in0),         //         hip_serial.rx_in0
                .tx_out0                 (tx_out0),        //                   .tx_out0
                .rx_st_valid         (rx_st_valid),                             //              rx_st.valid
                .rx_st_sop           (rx_st_sop),                     //                   .startofpacket
                .rx_st_eop           (rx_st_eop),                       //                   .endofpacket
                .rx_st_ready         (rx_st_ready),                             //                   .ready
                .rx_st_err           (rx_st_err),                             //                   .error
                .rx_st_data          (rx_st_data),                              //                   .data
                .rx_st_bar               (rx_st_bar),                     //          rx_bar_be.rx_st_bar
                .rx_st_be                (rx_st_be),                      //                   .rx_st_be
                .rx_st_mask              (rx_st_mask),                   //                   .rx_st_mask
                .tx_st_valid         (tx_st_valid),                            //              tx_st.valid
                .tx_st_sop           (tx_st_sop),                    //                   .startofpacket
                .tx_st_eop           (tx_st_eop),                      //                   .endofpacket
                .tx_st_ready         (tx_st_ready),                            //                   .ready
                .tx_st_err           (1'b0),                            //                   .error
                .tx_st_data          (tx_st_data),                             //                   .data
                .tx_cred_datafccp        (tx_cred_datafccp),                //            tx_cred.tx_cred_datafccp
                .tx_cred_datafcnp        (tx_cred_datafcnp),                //                   .tx_cred_datafcnp
                .tx_cred_datafcp         (tx_cred_datafcp),                 //                   .tx_cred_datafcp
                .tx_cred_fchipcons       (tx_cred_fchipcons),               //                   .tx_cred_fchipcons
                .tx_cred_fcinfinite      (tx_cred_fcinfinite),              //                   .tx_cred_fcinfinite
                .tx_cred_hdrfccp         (tx_cred_hdrfccp),                 //                   .tx_cred_hdrfccp
                .tx_cred_hdrfcnp         (tx_cred_hdrfcnp),                 //                   .tx_cred_hdrfcnp
                .tx_cred_hdrfcp          (tx_cred_hdrfcp),                  //                   .tx_cred_hdrfcp

                .sim_pipe_pclk_in        (sim_pipe_pclk_in), //           hip_pipe.sim_pipe_pclk_in
                .sim_pipe_rate           (sim_pipe_rate),    //                   .sim_pipe_rate
                .sim_ltssmstate          (sim_ltssmstate),   //                   .sim_ltssmstate
                .eidleinfersel0          (eidleinfersel0),   //                   .eidleinfersel0
                .powerdown0              (powerdown0),       //                   .powerdown0
                .rxpolarity0             (rxpolarity0),      //                   .rxpolarity0
                .txcompl0                (txcompl0),         //                   .txcompl0
                .txdata0                 (txdata0),          //                   .txdata0
                .txdatak0                (txdatak0),         //                   .txdatak0
                .txdetectrx0             (txdetectrx0),      //                   .txdetectrx0
                .txelecidle0             (txelecidle0),      //                   .txelecidle0
                .txdeemph0               (txdeemph0),        //                   .txdeemph0
                .phystatus0              (phystatus0),       //                   .phystatus0
                .rxdata0                 (rxdata0),          //                   .rxdata0
                .rxdatak0                (rxdatak0),         //                   .rxdatak0
                .rxelecidle0             (rxelecidle0),      //                   .rxelecidle0
                .rxstatus0               (rxstatus0),        //                   .rxstatus0
                .rxvalid0                (rxvalid0),         //                   .rxvalid0
                .reset_status            (reset_status_int),                    //            hip_rst.reset_status
                .serdes_pll_locked       (serdes_pll_locked),               //                   .serdes_pll_locked
                .pld_clk_inuse           (pld_clk_inuse),                   //                   .pld_clk_inuse
                .pld_core_ready          (pld_core_ready),                 //                   .pld_core_ready
                .testin_zero             (),                     //                   .testin_zero
                .lmi_addr                (12'h0),                           //                lmi.lmi_addr
                .lmi_din                 (32'h0),                            //                   .lmi_din
                .lmi_rden                (1'b0),                           //                   .lmi_rden
                .lmi_wren                (1'b0),                           //                   .lmi_wren
                .lmi_ack                 (),                             //                   .lmi_ack
                .lmi_dout                (),                            //                   .lmi_dout
                .pm_auxpwr               (1'b0),                   //         power_mngt.pm_auxpwr
                .pm_data                 (10'h0),                     //                   .pm_data
                .pme_to_cr               (1'b0),                   //                   .pme_to_cr
                .pm_event                (1'b0),                    //                   .pm_event
                .pme_to_sr               (pme_to_sr),                    //                   .pme_to_sr
                .busy_xcvr_reconfig      (busy_xcvr_reconfig),    //   reconfig_to_xcvr.busy_xcvr_reconfig
                .fixedclk_locked         (fixedclk_locked),      // reconfig_from_xcvr.fixedclk_locked
                .reconfig_from_xcvr      (reconfig_from_xcvr),
                .reconfig_to_xcvr        (reconfig_to_xcvr),
                .app_int_sts_vec      (app_int_sts_internal),                    //            int_msi.app_int_sts
                .app_msi_num          (app_msi_num),                    //                   .app_msi_num
                .app_msi_req          (app_msi_req),                    //                   .app_msi_req
                .app_msi_tc           (app_msi_tc),                     //                   .app_msi_tc
                .app_msi_ack          (app_msi_ack),                     //                   .app_msi_ack
                .serr_out                (serr_out),                        //                   .serr_out
                .tl_hpg_ctrl_er          (hpg_ctrler),                   //          config_tl.hpg_ctrler
                .tl_cfg_ctl              (tl_cfg_ctl),                    //                   .tl_cfg_ctl
                .cpl_err                 (7'h0),                      //                   .cpl_err
                .tl_cfg_add              (tl_cfg_add),                    //                   .tl_cfg_add
                .tl_cfg_sts              (tl_cfg_sts),                    //                   .tl_cfg_sts
                .cpl_pending             (cpl_pending),                  //                   .cpl_pending
                .dl_current_speed        (currentspeed),                 //         hip_status.currentspeed
                .derr_cor_ext_rcv0       (derr_cor_ext_rcv),             //                   .derr_cor_ext_rcv
                .derr_cor_ext_rpl        (derr_cor_ext_rpl),             //                   .derr_cor_ext_rpl
                .derr_rpl                (derr_rpl),                     //                   .derr_rpl
                .dlup_exit               (dlup_exit),                    //                   .dlup_exit
                .dl_ltssm                (ltssmstate),                   //                   .ltssmstate
                .ev128ns                 (ev128ns),                      //                   .ev128ns
                .ev1us                   (ev1us),                        //                   .ev1us
                .hotrst_exit             (hotrst_exit),                  //                   .hotrst_exit
                .int_status              (int_status),                   //                   .int_status
                .l2_exit                 (l2_exit),                      //                   .l2_exit
                .lane_act                (lane_act),                     //                   .lane_act
                .ko_cpl_spc_header       (ko_cpl_spc_header),            //                   .ko_cpl_spc_header
                .ko_cpl_spc_data         (ko_cpl_spc_data),              //                   .ko_cpl_spc_data
                .rx_in1                  (rx_in1            ),                                        //        (terminated)
                .rx_in2                  (rx_in2            ),                                        //        (terminated)
                .rx_in3                  (rx_in3            ),                                        //        (terminated)
                .rx_in4                  (rx_in4            ),                                        //        (terminated)
                .rx_in5                  (rx_in5            ),                                        //        (terminated)
                .rx_in6                  (rx_in6            ),                                        //        (terminated)
                .rx_in7                  (rx_in7            ),                                        //        (terminated)
                .tx_out1                 (tx_out1),                                            //        (terminated)
                .tx_out2                 (tx_out2),                                            //        (terminated)
                .tx_out3                 (tx_out3),                                            //        (terminated)
                .tx_out4                 (tx_out4),                                            //        (terminated)
                .tx_out5                 (tx_out5),                                            //        (terminated)
                .tx_out6                 (tx_out6),                                            //        (terminated)
                .tx_out7                 (tx_out7),                                            //        (terminated)
                .rx_st_empty         (rx_st_empty),                                            //        (terminated)
                .rx_bar_dec_func_num (),                                            //        (terminated)
                .tx_st_empty         (tx_st_empty),                                       //        (terminated)
                .eidleinfersel1          (eidleinfersel1                    ),                                            //        (terminated)
                .eidleinfersel2          (eidleinfersel2                    ),                                            //        (terminated)
                .eidleinfersel3          (eidleinfersel3                    ),                                            //        (terminated)
                .eidleinfersel4          (eidleinfersel4                    ),                                            //        (terminated)
                .eidleinfersel5          (eidleinfersel5                    ),                                            //        (terminated)
                .eidleinfersel6          (eidleinfersel6                    ),                                            //        (terminated)
                .eidleinfersel7          (eidleinfersel7                    ),                                            //        (terminated)
                .powerdown1              (powerdown1                   ),                                            //        (terminated)
                .powerdown2              (powerdown2                   ),                                            //        (terminated)
                .powerdown3              (powerdown3                   ),                                            //        (terminated)
                .powerdown4              (powerdown4                   ),                                            //        (terminated)
                .powerdown5              (powerdown5                   ),                                            //        (terminated)
                .powerdown6              (powerdown6                   ),                                            //        (terminated)
                .powerdown7              (powerdown7                   ),                                            //        (terminated)
                .rxpolarity1             (rxpolarity1                  ),                                            //        (terminated)
                .rxpolarity2             (rxpolarity2                  ),                                            //        (terminated)
                .rxpolarity3             (rxpolarity3                  ),                                            //        (terminated)
                .rxpolarity4             (rxpolarity4                  ),                                            //        (terminated)
                .rxpolarity5             (rxpolarity5                  ),                                            //        (terminated)
                .rxpolarity6             (rxpolarity6                  ),                                            //        (terminated)
                .rxpolarity7             (rxpolarity7                  ),                                            //        (terminated)
                .txcompl1                (txcompl1                     ),                                            //        (terminated)
                .txcompl2                (txcompl2                     ),                                            //        (terminated)
                .txcompl3                (txcompl3                     ),                                            //        (terminated)
                .txcompl4                (txcompl4                     ),                                            //        (terminated)
                .txcompl5                (txcompl5                     ),                                            //        (terminated)
                .txcompl6                (txcompl6                     ),                                            //        (terminated)
                .txcompl7                (txcompl7                     ),                                            //        (terminated)
                .txdata1                 (txdata1                      ),                                            //        (terminated)
                .txdata2                 (txdata2                      ),                                            //        (terminated)
                .txdata3                 (txdata3                      ),                                            //        (terminated)
                .txdata4                 (txdata4                      ),                                            //        (terminated)
                .txdata5                 (txdata5                      ),                                            //        (terminated)
                .txdata6                 (txdata6                      ),                                            //        (terminated)
                .txdata7                 (txdata7                      ),                                            //        (terminated)
                .txdatak1                (txdatak1                     ),                                            //        (terminated)
                .txdatak2                (txdatak2                     ),                                            //        (terminated)
                .txdatak3                (txdatak3                     ),                                            //        (terminated)
                .txdatak4                (txdatak4                     ),                                            //        (terminated)
                .txdatak5                (txdatak5                     ),                                            //        (terminated)
                .txdatak6                (txdatak6                     ),                                            //        (terminated)
                .txdatak7                (txdatak7                     ),                                            //        (terminated)
                .txdetectrx1             (txdetectrx1                  ),                                            //        (terminated)
                .txdetectrx2             (txdetectrx2                  ),                                            //        (terminated)
                .txdetectrx3             (txdetectrx3                  ),                                            //        (terminated)
                .txdetectrx4             (txdetectrx4                  ),                                            //        (terminated)
                .txdetectrx5             (txdetectrx5                  ),                                            //        (terminated)
                .txdetectrx6             (txdetectrx6                  ),                                            //        (terminated)
                .txdetectrx7             (txdetectrx7                  ),                                            //        (terminated)
                .txelecidle1             (txelecidle1                  ),                                            //        (terminated)
                .txelecidle2             (txelecidle2                  ),                                            //        (terminated)
                .txelecidle3             (txelecidle3                  ),                                            //        (terminated)
                .txelecidle4             (txelecidle4                  ),                                            //        (terminated)
                .txelecidle5             (txelecidle5                  ),                                            //        (terminated)
                .txelecidle6             (txelecidle6                  ),                                            //        (terminated)
                .txelecidle7             (txelecidle7                  ),                                            //        (terminated)
                .txdeemph1               (txdeemph1                    ),                                            //        (terminated)
                .txdeemph2               (txdeemph2                    ),                                            //        (terminated)
                .txdeemph3               (txdeemph3                    ),                                            //        (terminated)
                .txdeemph4               (txdeemph4                    ),                                            //        (terminated)
                .txdeemph5               (txdeemph5                    ),                                            //        (terminated)
                .txdeemph6               (txdeemph6                    ),                                            //        (terminated)
                .txdeemph7               (txdeemph7                    ),                                            //        (terminated)
                .phystatus1              (phystatus1                      ),                                        //        (terminated)
                .phystatus2              (phystatus2                      ),                                        //        (terminated)
                .phystatus3              (phystatus3                      ),                                        //        (terminated)
                .phystatus4              (phystatus4                      ),                                        //        (terminated)
                .phystatus5              (phystatus5                      ),                                        //        (terminated)
                .phystatus6              (phystatus6                      ),                                        //        (terminated)
                .phystatus7              (phystatus7                      ),                                        //        (terminated)
                .rxdata1                 (rxdata1                        ),                                 //        (terminated)
                .rxdata2                 (rxdata2                        ),                                 //        (terminated)
                .rxdata3                 (rxdata3                        ),                                 //        (terminated)
                .rxdata4                 (rxdata4                        ),                                 //        (terminated)
                .rxdata5                 (rxdata5                        ),                                 //        (terminated)
                .rxdata6                 (rxdata6                        ),                                 //        (terminated)
                .rxdata7                 (rxdata7                        ),                                 //        (terminated)
                .rxdatak1                (rxdatak1                        ),                                        //        (terminated)
                .rxdatak2                (rxdatak2                        ),                                        //        (terminated)
                .rxdatak3                (rxdatak3                        ),                                        //        (terminated)
                .rxdatak4                (rxdatak4                        ),                                        //        (terminated)
                .rxdatak5                (rxdatak5                        ),                                        //        (terminated)
                .rxdatak6                (rxdatak6                        ),                                        //        (terminated)
                .rxdatak7                (rxdatak7                        ),                                        //        (terminated)
                .rxelecidle1             (rxelecidle1                     ),                                        //        (terminated)
                .rxelecidle2             (rxelecidle2                     ),                                        //        (terminated)
                .rxelecidle3             (rxelecidle3                     ),                                        //        (terminated)
                .rxelecidle4             (rxelecidle4                     ),                                        //        (terminated)
                .rxelecidle5             (rxelecidle5                     ),                                        //        (terminated)
                .rxelecidle6             (rxelecidle6                     ),                                        //        (terminated)
                .rxelecidle7             (rxelecidle7                     ),                                        //        (terminated)
                .rxstatus1               (rxstatus1                        ),                                      //        (terminated)
                .rxstatus2               (rxstatus2                        ),                                      //        (terminated)
                .rxstatus3               (rxstatus3                        ),                                      //        (terminated)
                .rxstatus4               (rxstatus4                        ),                                      //        (terminated)
                .rxstatus5               (rxstatus5                        ),                                      //        (terminated)
                .rxstatus6               (rxstatus6                        ),                                      //        (terminated)
                .rxstatus7               (rxstatus7                        ),                                      //        (terminated)
                .rxvalid1                (rxvalid1                         ),                                        //        (terminated)
                .rxvalid2                (rxvalid2                         ),                                        //        (terminated)
                .rxvalid3                (rxvalid3                         ),                                        //        (terminated)
                .rxvalid4                (rxvalid4                         ),                                        //        (terminated)
                .rxvalid5                (rxvalid5                         ),                                        //        (terminated)
                .rxvalid6                (rxvalid6                         ),                                        //        (terminated)
                .rxvalid7                (rxvalid7                         ),                                        //        (terminated)
                .txmargin0               (txmargin0                        ),                                            //        (terminated)
                .txmargin1               (txmargin1                        ),                                            //        (terminated)
                .txmargin2               (txmargin2                        ),                                            //        (terminated)
                .txmargin3               (txmargin3                        ),                                            //        (terminated)
                .txmargin4               (txmargin4                        ),                                            //        (terminated)
                .txmargin5               (txmargin5                        ),                                            //        (terminated)
                .txmargin6               (txmargin6                        ),                                            //        (terminated)
                .txmargin7               (txmargin7                        ),                                            //        (terminated)

                .sim_pipe_pclk_out       (sim_pipe_pclk_out),                                            //        (terminated)
                .pm_event_func           (3'b000),                                      //        (terminated)
                .app_msi_func         (3'b000),                                      //        (terminated)
                .aer_msi_num          (5'b00000),                                    //        (terminated)
                .pex_msi_num          (5'b00000),                                    //        (terminated)
                .cpl_err_func            (3'b000),                                      //        (terminated)
                .tl_cfg_ctl_wr           (),                                            //        (terminated)
                .tl_cfg_sts_wr           ()                                            //        (terminated)
        //      .derr_cor_ext_rcv1       ()                                             //        (terminated)
        );


//// instantiate the Avalon-MM bridge logic
generate if (avmm_width_hwtcl==64 & !(CB_PCIE_MODE == 1 && CB_PCIE_RX_LITE   == 1))
  begin
altpciexpav_stif_app

# (
     .INTENDED_DEVICE_FAMILY               (INTENDED_DEVICE_FAMILY),
     .CG_AVALON_S_ADDR_WIDTH               (CG_AVALON_S_ADDR_WIDTH),
     .CG_COMMON_CLOCK_MODE                 (1),
     .CG_IMPL_CRA_AV_SLAVE_PORT            (CG_IMPL_CRA_AV_SLAVE_PORT),
     .CB_PCIE_MODE                         (CB_PCIE_MODE),
     .CB_A2P_ADDR_MAP_IS_FIXED             (0),
     .CB_A2P_ADDR_MAP_FIXED_TABLE          (CB_A2P_ADDR_MAP_FIXED_TABLE_INT),
     .CB_A2P_ADDR_MAP_NUM_ENTRIES          (CB_A2P_ADDR_MAP_NUM_ENTRIES),
     .CB_A2P_ADDR_MAP_PASS_THRU_BITS       (a2p_pass_thru_bits),
     .CB_P2A_AVALON_ADDR_B0                (CB_P2A_AVALON_ADDR_B0),
     .CB_P2A_AVALON_ADDR_B1                (CB_P2A_AVALON_ADDR_B1),
     .CB_P2A_AVALON_ADDR_B2                (CB_P2A_AVALON_ADDR_B2),
     .CB_P2A_AVALON_ADDR_B3                (CB_P2A_AVALON_ADDR_B3),
     .CB_P2A_AVALON_ADDR_B4                (CB_P2A_AVALON_ADDR_B4),
     .CB_P2A_AVALON_ADDR_B5                (CB_P2A_AVALON_ADDR_B5),
     .CB_P2A_AVALON_ADDR_B6                (CB_P2A_AVALON_ADDR_B6),
     .bar0_64bit_mem_space                 (bar0_64bit_mem_space),
     .bar0_io_space                        (bar0_io_space),
     .bar0_prefetchable                    (bar0_prefetchable),
     .bar0_size_mask                       (bar0_size_mask),
     .bar1_64bit_mem_space                 (bar1_64bit_mem_space),
     .bar1_io_space                        (bar1_io_space),
     .bar1_prefetchable                    (bar1_prefetchable),
     .bar1_size_mask                       (bar1_size_mask),
     .bar2_64bit_mem_space                 ( bar2_64bit_mem_space),
     .bar2_io_space                        (bar2_io_space),
     .bar2_prefetchable                    (bar2_prefetchable),
     .bar2_size_mask                       (bar2_size_mask),
     .bar3_64bit_mem_space                 (bar3_64bit_mem_space),
     .bar3_io_space                        (bar3_io_space),
     .bar3_prefetchable                    (bar3_prefetchable),
     .bar3_size_mask                       (bar3_size_mask),
     .bar4_64bit_mem_space                 (bar4_64bit_mem_space),
     .bar4_io_space                        (bar4_io_space),
     .bar4_prefetchable                    (bar4_prefetchable),
     .bar4_size_mask                       (bar4_size_mask),
     .bar5_64bit_mem_space                 (bar5_64bit_mem_space),
     .bar5_io_space                        (bar5_io_space),
     .bar5_prefetchable                    (bar5_prefetchable),
     .bar5_size_mask                       (bar5_size_mask),
     .bar_io_window_size                   (bar_io_window_size),
     .bar_prefetchable                     (bar_prefetchable),
     .expansion_base_address_register      (expansion_base_address_register),
     .EXTERNAL_A2P_TRANS                   (0),
     .CG_ENABLE_A2P_INTERRUPT              (CG_ENABLE_A2P_INTERRUPT),
     .CG_RXM_IRQ_NUM                       (CG_RXM_IRQ_NUM),
     .CB_RXM_DATA_WIDTH                    (CB_RXM_DATA_WIDTH),
     .CB_PCIE_RX_LITE                      (CB_PCIE_RX_LITE),
     .port_type_hwtcl                      (port_type_hwtcl),
     .AVALON_ADDR_WIDTH                    (AVALON_ADDR_WIDTH),
     .BYPASSS_A2P_TRANSLATION              (BYPASSS_A2P_TRANSLATION),
     .CG_ENABLE_ADVANCED_INTERRUPT         (CG_ENABLE_ADVANCED_INTERRUPT),
     .in_cvp_mode_hwtcl                    (in_cvp_mode_hwtcl)
)


avalon_bridge (

         // system inputs
         .AvlClk_i(avalon_clk),
         .Rstn_i(app_rstn),

         .RxStReady_o(rx_st_ready),
         .RxStMask_o(rx_st_mask),
         .RxStData_i(rx_st_data),
         .RxStParity_i(),
         .RxStBe_i(rx_st_be),
         .RxStEmpty_i(rx_st_empty),
         .RxStErr_i(rx_st_err),
         .RxStSop_i(rx_st_sop),
         .RxStEop_i(rx_st_eop),
         .RxStValid_i(rx_st_valid),
         .RxStBarDec1_i(rx_st_bar),
         .RxStBarDec2_i(8'h0),

         .TxStReady_i(tx_st_ready)  ,
         .TxStData_o (tx_st_data)  ,
         .TxStParity_o (),
         .TxStErr_o  (tx_st_err)  ,
         .TxStSop_o (tx_st_sop)   ,
         .TxStEop_o  (tx_st_eop)  ,
         .TxStEmpty_o (tx_st_empty) ,
         .TxStValid_o(tx_st_valid)  ,
         .TxAdapterFifoEmpty_i(1'b0),
         .CplPending_o(cpl_pending),

         .TxCredPDataLimit_i(),
         .TxCredNpDataLimit_i(tx_cred_datafcnp),
         .TxCredCplDataLimit_i(tx_cred_datafccp),
         .TxCredHipCons_i(tx_cred_fchipcons),
         .TxCredInfinit_i(tx_cred_fcinfinite),
         .TxCredPHdrLimit_i(tx_cred_hdrfcp),
         .TxCredNpHdrLimit_i(tx_cred_hdrfcnp),
         .TxCredCplHdrLimit_i(tx_cred_hdrfccp),
         .ko_cpl_spc_header       (ko_cpl_spc_header),            //                   .ko_cpl_spc_header
               .ko_cpl_spc_data         (ko_cpl_spc_data),              //                   .ko_cpl_spc_data

               .TxCredit_i(36'h0),
         .TxNpCredOne_i(1'b0),

         .CfgCtlWr_i(1'b0),
         .CfgAddr_i(tl_cfg_add),
         .CfgCtl_i(tl_cfg_ctl),

         // MSI and Interrupt interface
         .MsiReq_o(app_msi_req),
         .MsiAck_i(app_msi_ack),
         .MsiTc_o(app_msi_tc),
         .MsiNum_o(app_msi_num),
         .IntxReq_o(app_int_sts),
         .IntxAck_i(1'b0),

         // Avalon Tx Slave interface
         .TxsClk_i(avalon_clk),
         .TxsRstn_i(app_rstn),
         .TxsChipSelect_i(TxsChipSelect_i),
         .TxsRead_i(TxsRead_i),
         .TxsWrite_i(TxsWrite_i),
         .TxsWriteData_i(TxsWriteData_i),
         .TxsBurstCount_i(TxsBurstCount_i),
         .TxsAddress_i(TxsAddress_i),
         .TxsByteEnable_i(TxsByteEnable_i),
         .TxsReadDataValid_o(TxsReadDataValid_o),
         .TxsReadData_o(TxsReadData_o),
         .TxsWaitRequest_o(TxsWaitRequest_o),

         // Avalon Rx Master interface

         .RxmWrite_0_o(RxmWrite_0_o),
         .RxmAddress_0_o(RxmAddress_0_o),
         .RxmWriteData_0_o(RxmWriteData_0_o),
         .RxmByteEnable_0_o(RxmByteEnable_0_o),
         .RxmBurstCount_0_o(RxmBurstCount_0_o),
         .RxmWaitRequest_0_i(RxmWaitRequest_0_i),
         .RxmRead_0_o(RxmRead_0_o),
         .RxmReadData_0_i(RxmReadData_0_i),
         .RxmReadDataValid_0_i(RxmReadDataValid_0_i),

         .RxmWrite_1_o(RxmWrite_1_o),
         .RxmAddress_1_o(RxmAddress_1_o),
         .RxmWriteData_1_o(RxmWriteData_1_o),
         .RxmByteEnable_1_o(RxmByteEnable_1_o),
         .RxmBurstCount_1_o(RxmBurstCount_1_o),
         .RxmWaitRequest_1_i(RxmWaitRequest_1_i),
         .RxmRead_1_o(RxmRead_1_o),
         .RxmReadData_1_i(RxmReadData_1_i),
         .RxmReadDataValid_1_i(RxmReadDataValid_1_i),

         .RxmWrite_2_o(RxmWrite_2_o),
         .RxmAddress_2_o(RxmAddress_2_o),
         .RxmWriteData_2_o(RxmWriteData_2_o),
         .RxmByteEnable_2_o(RxmByteEnable_2_o),
         .RxmBurstCount_2_o(RxmBurstCount_2_o),
         .RxmWaitRequest_2_i(RxmWaitRequest_2_i),
         .RxmRead_2_o(RxmRead_2_o),
         .RxmReadData_2_i(RxmReadData_2_i),
         .RxmReadDataValid_2_i(RxmReadDataValid_2_i),

         .RxmWrite_3_o(RxmWrite_3_o),
         .RxmAddress_3_o(RxmAddress_3_o),
         .RxmWriteData_3_o(RxmWriteData_3_o),
         .RxmByteEnable_3_o(RxmByteEnable_3_o),
         .RxmBurstCount_3_o(RxmBurstCount_3_o),
         .RxmWaitRequest_3_i(RxmWaitRequest_3_i),
         .RxmRead_3_o(RxmRead_3_o),
         .RxmReadData_3_i(RxmReadData_3_i),
         .RxmReadDataValid_3_i(RxmReadDataValid_3_i),

         .RxmWrite_4_o(RxmWrite_4_o),
         .RxmAddress_4_o(RxmAddress_4_o),
         .RxmWriteData_4_o(RxmWriteData_4_o),
         .RxmByteEnable_4_o(RxmByteEnable_4_o),
         .RxmBurstCount_4_o(RxmBurstCount_4_o),
         .RxmWaitRequest_4_i(RxmWaitRequest_4_i),
         .RxmRead_4_o(RxmRead_4_o),
         .RxmReadData_4_i(RxmReadData_4_i),
         .RxmReadDataValid_4_i(RxmReadDataValid_4_i),

         .RxmWrite_5_o(RxmWrite_5_o),
         .RxmAddress_5_o(RxmAddress_5_o),
         .RxmWriteData_5_o(RxmWriteData_5_o),
         .RxmByteEnable_5_o(RxmByteEnable_5_o),
         .RxmBurstCount_5_o(RxmBurstCount_5_o),
         .RxmWaitRequest_5_i(RxmWaitRequest_5_i),
         .RxmRead_5_o(RxmRead_5_o),
         .RxmReadData_5_i(RxmReadData_5_i),
         .RxmReadDataValid_5_i(RxmReadDataValid_5_i),

         .RxmIrq_i(RxmIrq_i),
         .CraClk_i(avalon_clk),
         .CraRstn_i(app_rstn),
         .CraChipSelect_i(CraChipSelect_i),
         .CraRead(CraRead),
         .CraWrite(CraWrite),
         .CraWriteData_i(CraWriteData_i),
         .CraAddress_i(CraAddress_i[13:2]),
         .CraByteEnable_i(CraByteEnable_i),
         .CraReadData_o(CraReadData_o),      // This comes from Rx Completion to be returned to Avalon master
         .CraWaitRequest_o(CraWaitRequest_o),
         .CraIrq_o   (CraIrq_o  ),
         .MsiIntfc_o(MsiIntfc_o),
         .MsiControl_o(MsiControl_o),
         .MsixIntfc_o(MsixIntfc_o),
         .RxIntStatus_i(int_status),
         .pld_clk_inuse(pld_clk_inuse),
         .tx_cons_cred_sel(),
         .ltssm_state(ltssmstate),
         .current_speed(currentspeed),
         .lane_act(lane_act)


                );
end
endgenerate


generate if (avmm_width_hwtcl==128& !(CB_PCIE_MODE == 1 && CB_PCIE_RX_LITE   == 1))
     begin

         wire           rx_st_ready_128_int;
         wire           rx_st_valid_128_int;
         wire [127:0]   rx_st_data_128_int;
         wire [15:0]    rx_st_be_128_int;
         wire           rx_st_sop_128_int;
         wire           rx_st_eop_128_int;
         wire           rx_st_empty_128_int;
         wire [7:0]     rx_st_bar_128_int;


altpciexpav128_app

# (  .INTENDED_DEVICE_FAMILY                   (INTENDED_DEVICE_FAMILY),
     .CG_AVALON_S_ADDR_WIDTH                   (CG_AVALON_S_ADDR_WIDTH),
     .CG_COMMON_CLOCK_MODE                     (1),
     .CG_IMPL_CRA_AV_SLAVE_PORT                (CG_IMPL_CRA_AV_SLAVE_PORT),
     .CB_PCIE_MODE                             (CB_PCIE_MODE),
     .CB_A2P_ADDR_MAP_IS_FIXED                 (0),
     .CB_A2P_ADDR_MAP_FIXED_TABLE              (CB_A2P_ADDR_MAP_FIXED_TABLE_INT),
     .CB_A2P_ADDR_MAP_NUM_ENTRIES              (CB_A2P_ADDR_MAP_NUM_ENTRIES),
     .CB_A2P_ADDR_MAP_PASS_THRU_BITS           (a2p_pass_thru_bits),
     .CB_P2A_AVALON_ADDR_B0                    (CB_P2A_AVALON_ADDR_B0),
     .CB_P2A_AVALON_ADDR_B1                    (CB_P2A_AVALON_ADDR_B1),
     .CB_P2A_AVALON_ADDR_B2                    (CB_P2A_AVALON_ADDR_B2),
     .CB_P2A_AVALON_ADDR_B3                    (CB_P2A_AVALON_ADDR_B3),
     .CB_P2A_AVALON_ADDR_B4                    (CB_P2A_AVALON_ADDR_B4),
     .CB_P2A_AVALON_ADDR_B5                    (CB_P2A_AVALON_ADDR_B5),
     .CB_P2A_AVALON_ADDR_B6                    (CB_P2A_AVALON_ADDR_B6),
     .bar0_64bit_mem_space                     (bar0_64bit_mem_space),
     .bar0_io_space                            (bar0_io_space),
     .bar0_prefetchable                        (bar0_prefetchable),
     .bar0_size_mask                           (bar0_size_mask),
     .bar1_64bit_mem_space                     (bar1_64bit_mem_space),
     .bar1_io_space                            (bar1_io_space),
     .bar1_prefetchable                        (bar1_prefetchable),
     .bar1_size_mask                           (bar1_size_mask),
     .bar2_64bit_mem_space                     ( bar2_64bit_mem_space),
     .bar2_io_space                            (bar2_io_space),
     .bar2_prefetchable                        (bar2_prefetchable),
     .bar2_size_mask                           (bar2_size_mask),
     .bar3_64bit_mem_space                     (bar3_64bit_mem_space),
     .bar3_io_space                            (bar3_io_space),
     .bar3_prefetchable                        (bar3_prefetchable),
     .bar3_size_mask                           (bar3_size_mask),
     .bar4_64bit_mem_space                     (bar4_64bit_mem_space),
     .bar4_io_space                            (bar4_io_space),
     .bar4_prefetchable                        (bar4_prefetchable),
     .bar4_size_mask                           (bar4_size_mask),
     .bar5_64bit_mem_space                     (bar5_64bit_mem_space),
     .bar5_io_space                            (bar5_io_space),
     .bar5_prefetchable                        (bar5_prefetchable),
     .bar5_size_mask                           (bar5_size_mask),

     .bar_io_window_size                   (bar_io_window_size),
     .bar_prefetchable                     (bar_prefetchable),
     .expansion_base_address_register      (expansion_base_address_register),
     .EXTERNAL_A2P_TRANS                   (0),
     .CG_ENABLE_A2P_INTERRUPT              (CG_ENABLE_A2P_INTERRUPT),
     .CG_RXM_IRQ_NUM                       (CG_RXM_IRQ_NUM),
     .CB_RXM_DATA_WIDTH                    (CB_RXM_DATA_WIDTH),
     .CB_PCIE_RX_LITE                      (CB_PCIE_RX_LITE),
     .port_type_hwtcl                      (port_type_hwtcl),
     .AVALON_ADDR_WIDTH                    (AVALON_ADDR_WIDTH),
     .BYPASSS_A2P_TRANSLATION              (BYPASSS_A2P_TRANSLATION),
     .CG_ENABLE_ADVANCED_INTERRUPT         (CG_ENABLE_ADVANCED_INTERRUPT),
     .in_cvp_mode_hwtcl                    (in_cvp_mode_hwtcl)
     )
avalon_bridge (    // 128
     .AvlClk_i                  (avalon_clk                  ),
     .Rstn_i                    (app_rstn            ),
     .RxStReady_o               (rx_st_ready_128_int               ),
     .RxStMask_o                (rx_st_mask                ),
     .RxStData_i                (rx_st_data_128_int                ),
     .RxStBe_i                  (rx_st_be_128_int                  ),
     .RxStEmpty_i               (rx_st_empty_128_int               ),
     .RxStErr_i                 (rx_st_err                 ),
     .RxStSop_i                 (rx_st_sop_128_int                 ),
     .RxStEop_i                 (rx_st_eop_128_int                 ),
     .RxStValid_i               (rx_st_valid_128_int               ),
     .RxStBarDec1_i             (rx_st_bar_128_int             ),
     .RxStBarDec2_i             (8'h0             ),
     .TxStReady_i               (tx_st_ready               ),
     .TxStData_o                (tx_st_data                ),
     .TxStSop_o                 (tx_st_sop                 ),
     .TxStEop_o                 (tx_st_eop                 ),
     .TxStEmpty_o               (tx_st_empty               ),
     .TxStValid_o               (tx_st_valid               ),
     .TxAdapterFifoEmpty_i      (1'b0      ),
     .TxCredPDataLimit_i        (0),
     .TxCredNpDataLimit_i(tx_cred_datafcnp),
     .TxCredCplDataLimit_i(tx_cred_datafccp),
     .TxCredHipCons_i(tx_cred_fchipcons),
     .TxCredInfinit_i(tx_cred_fcinfinite),
     .TxCredPHdrLimit_i(tx_cred_hdrfcp),
     .TxCredNpHdrLimit_i(tx_cred_hdrfcnp),
     .TxCredCplHdrLimit_i(tx_cred_hdrfccp),
     .ko_cpl_spc_header       (ko_cpl_spc_header),            //                   .ko_cpl_spc_header
                 .ko_cpl_spc_data         (ko_cpl_spc_data),              //                   .ko_cpl_spc_data
     .CfgCtlWr_i                (1'b0                ),
     .CfgAddr_i                 (tl_cfg_add                 ),
     .CfgCtl_i                  (tl_cfg_ctl                  ),
         // MSI and Interrupt interface
     .MsiReq_o(app_msi_req),
     .MsiAck_i(app_msi_ack),
     .MsiTc_o(app_msi_tc),
     .MsiNum_o(app_msi_num),
     .IntxReq_o(app_int_sts),
     .IntxAck_i(1'b0),
     .TxsClk_i                  (avalon_clk                  ),
     .TxsRstn_i                 (app_rstn                 ),
     .TxsChipSelect_i           (TxsChipSelect_i           ),
     .TxsRead_i                 (TxsRead_i                 ),
     .TxsWrite_i                (TxsWrite_i                ),
     .TxsWriteData_i            (TxsWriteData_i            ),
     .TxsBurstCount_i           (TxsBurstCount_i           ),
     .TxsAddress_i              (TxsAddress_i              ),
     .TxsByteEnable_i           (TxsByteEnable_i           ),
     .TxsReadDataValid_o        (TxsReadDataValid_o        ),
     .TxsReadData_o             (TxsReadData_o             ),
     .TxsWaitRequest_o          (TxsWaitRequest_o          ),
     .RxmWrite_0_o              (RxmWrite_0_o              ),
     .RxmAddress_0_o            (RxmAddress_0_o            ),
     .RxmWriteData_0_o          (RxmWriteData_0_o          ),
     .RxmByteEnable_0_o         (RxmByteEnable_0_o         ),
     .RxmBurstCount_0_o         (RxmBurstCount_0_o         ),
     .RxmWaitRequest_0_i        (RxmWaitRequest_0_i        ),
     .RxmRead_0_o               (RxmRead_0_o               ),
     .RxmReadData_0_i           (RxmReadData_0_i           ),
     .RxmReadDataValid_0_i      (RxmReadDataValid_0_i      ),
     .RxmWrite_1_o              (RxmWrite_1_o              ),
     .RxmAddress_1_o            (RxmAddress_1_o            ),
     .RxmWriteData_1_o          (RxmWriteData_1_o          ),
     .RxmByteEnable_1_o         (RxmByteEnable_1_o         ),
     .RxmBurstCount_1_o         (RxmBurstCount_1_o         ),
     .RxmWaitRequest_1_i        (RxmWaitRequest_1_i        ),
     .RxmRead_1_o               (RxmRead_1_o               ),
     .RxmReadData_1_i           (RxmReadData_1_i           ),
     .RxmReadDataValid_1_i      (RxmReadDataValid_1_i      ),
     .RxmWrite_2_o              (RxmWrite_2_o              ),
     .RxmAddress_2_o            (RxmAddress_2_o            ),
     .RxmWriteData_2_o          (RxmWriteData_2_o          ),
     .RxmByteEnable_2_o         (RxmByteEnable_2_o         ),
     .RxmBurstCount_2_o         (RxmBurstCount_2_o         ),
     .RxmWaitRequest_2_i        (RxmWaitRequest_2_i        ),
     .RxmRead_2_o               (RxmRead_2_o               ),
     .RxmReadData_2_i           (RxmReadData_2_i           ),
     .RxmReadDataValid_2_i      (RxmReadDataValid_2_i      ),
     .RxmWrite_3_o              (RxmWrite_3_o              ),
     .RxmAddress_3_o            (RxmAddress_3_o            ),
     .RxmWriteData_3_o          (RxmWriteData_3_o          ),
     .RxmByteEnable_3_o         (RxmByteEnable_3_o         ),
     .RxmBurstCount_3_o         (RxmBurstCount_3_o         ),
     .RxmWaitRequest_3_i        (RxmWaitRequest_3_i        ),
     .RxmRead_3_o               (RxmRead_3_o               ),
     .RxmReadData_3_i           (RxmReadData_3_i           ),
     .RxmReadDataValid_3_i      (RxmReadDataValid_3_i      ),
     .RxmWrite_4_o              (RxmWrite_4_o              ),
     .RxmAddress_4_o            (RxmAddress_4_o            ),
     .RxmWriteData_4_o          (RxmWriteData_4_o          ),
     .RxmByteEnable_4_o         (RxmByteEnable_4_o         ),
     .RxmBurstCount_4_o         (RxmBurstCount_4_o         ),
     .RxmWaitRequest_4_i        (RxmWaitRequest_4_i        ),
     .RxmRead_4_o               (RxmRead_4_o               ),
     .RxmReadData_4_i           (RxmReadData_4_i           ),
     .RxmReadDataValid_4_i      (RxmReadDataValid_4_i      ),
     .RxmWrite_5_o              (RxmWrite_5_o              ),
     .RxmAddress_5_o            (RxmAddress_5_o            ),
     .RxmWriteData_5_o          (RxmWriteData_5_o          ),
     .RxmByteEnable_5_o         (RxmByteEnable_5_o         ),
     .RxmBurstCount_5_o         (RxmBurstCount_5_o         ),
     .RxmWaitRequest_5_i        (RxmWaitRequest_5_i        ),
     .RxmRead_5_o               (RxmRead_5_o               ),
     .RxmReadData_5_i           (RxmReadData_5_i           ),
     .RxmReadDataValid_5_i      (RxmReadDataValid_5_i      ),
     .RxmIrq_i                  (RxmIrq_i                  ),
     .CraClk_i                  (avalon_clk                  ),
     .CraRstn_i                 (app_rstn           ),
     .CraChipSelect_i           (CraChipSelect_i           ),
     .CraRead                   (CraRead                   ),
     .CraWrite                  (CraWrite                  ),
     .CraWriteData_i            (CraWriteData_i            ),
     .CraAddress_i              (CraAddress_i[13:2]        ),
     .CraByteEnable_i           (CraByteEnable_i           ),
     .CraReadData_o             (CraReadData_o             ),
     .CraWaitRequest_o          (CraWaitRequest_o          ),
     .CraIrq_o                  (CraIrq_o                  ),
     .CplPending_o              (cpl_pending               ),
     .MsiIntfc_o(MsiIntfc_o),
     .MsiControl_o(MsiControl_o),
     .MsixIntfc_o(MsixIntfc_o),
     .RxIntStatus_i(int_status),
     .pld_clk_inuse(pld_clk_inuse),
     .tx_cons_cred_sel(),
     .ltssm_state(ltssmstate),
     .current_speed(currentspeed),
     .lane_act(lane_act)


 );

 /// adapter for underflow TLP
 altpciexpav128_underflow_adapter  underflow_adapter

 (
    .Clk_i( avalon_clk),
    .Rstn_i(app_rstn ),
    .HipRxReady_o(rx_st_ready ),
    .HipRxValid_i(rx_st_valid ),
    .HipRxData_i( rx_st_data),
    .HipRxBe_i(rx_st_be ),
    .HipRxSop_i(rx_st_sop ),
    .HipRxEop_i(rx_st_eop ),
    .HipRxEmpty_i(rx_st_empty ),
    .HipRxBarDec_i(rx_st_bar ),
    .BridgeRxReady_i(rx_st_ready_128_int),
    .BridgeRxValid_o(rx_st_valid_128_int ),
    .BridgeRxData_o(rx_st_data_128_int ),
    .BridgeRxBe_o(rx_st_be_128_int ),
    .BridgeRxSop_o( rx_st_sop_128_int),
    .BridgeRxEop_o( rx_st_eop_128_int),
    .BridgeRxEmpty_o( rx_st_empty_128_int),
    .BridgeRxBarDec_o(rx_st_bar_128_int )

 );



     end
endgenerate


generate if ( CB_PCIE_MODE == 1 && CB_PCIE_RX_LITE   == 1)
  begin
         altpciexpav_lite_app

# (
      .CB_P2A_AVALON_ADDR_B0( CB_P2A_AVALON_ADDR_B0),
      .CB_P2A_AVALON_ADDR_B1(CB_P2A_AVALON_ADDR_B1 ),
      .CB_P2A_AVALON_ADDR_B2(CB_P2A_AVALON_ADDR_B2 ),
      .CB_P2A_AVALON_ADDR_B3(CB_P2A_AVALON_ADDR_B3 ),
      .CB_P2A_AVALON_ADDR_B4(CB_P2A_AVALON_ADDR_B4 ),
      .CB_P2A_AVALON_ADDR_B5(CB_P2A_AVALON_ADDR_B5 ),
      .CB_P2A_AVALON_ADDR_B6(CB_P2A_AVALON_ADDR_B6 ),
      .bar0_64bit_mem_space(bar0_64bit_mem_space ),
      .bar0_io_space(bar0_io_space ),
      .bar0_prefetchable(bar0_prefetchable ),
      .bar0_size_mask(bar0_size_mask ),
      .bar1_64bit_mem_space(bar1_64bit_mem_space ),
      .bar1_io_space( bar1_io_space),
      .bar1_prefetchable( bar1_prefetchable),
      .bar1_size_mask (bar1_size_mask ),
      .bar2_64bit_mem_space(bar2_64bit_mem_space ),
      .bar2_io_space( bar2_io_space),
      .bar2_prefetchable(bar2_prefetchable ),
      .bar2_size_mask( bar2_size_mask),
      .bar3_64bit_mem_space( bar3_64bit_mem_space),
      .bar3_io_space(bar3_io_space ),
      .bar3_prefetchable(bar3_prefetchable ),
      .bar3_size_mask(bar3_size_mask ),
      .bar4_64bit_mem_space(bar4_64bit_mem_space ),
      .bar4_io_space(bar4_io_space ),
      .bar4_prefetchable( bar4_prefetchable),
      .bar4_size_mask(bar4_size_mask ),
      .bar5_64bit_mem_space(bar5_64bit_mem_space ),
      .bar5_io_space(bar5_io_space ),
      .bar5_prefetchable( bar5_prefetchable),
      .bar5_size_mask (bar5_size_mask ),
      .bar_io_window_size(bar_io_window_size ),
      .bar_prefetchable ( bar_prefetchable),
      .expansion_base_address_register(expansion_base_address_register ),
      .CB_RXM_DATA_WIDTH(CB_RXM_DATA_WIDTH),
      .CG_RXM_IRQ_NUM(CG_RXM_IRQ_NUM),
      .deviceFamily(INTENDED_DEVICE_FAMILY)

      )
 avalon_bridge
  (
       .Clk_i( avalon_clk),
       .Rstn_i(app_rstn ),
       .RxStEmpty_i(rx_st_empty ),
       .RxStMask_o(rx_st_mask),
       .RxStSop_i(rx_st_sop ),
       .RxStEop_i(rx_st_eop ),
       .RxStData_i(rx_st_data ),
       .RxStValid_i(rx_st_valid ),
       .RxStReady_o(rx_st_ready ),
       .RxStBarDec_i(rx_st_bar ),
       .TxStReady_i(tx_st_ready ),
       .TxStSop_o(tx_st_sop ),
       .TxStEop_o(tx_st_eop ),
       .TxStData_o(tx_st_data ),
       .TxStValid_o(tx_st_valid ),
       .RxmWrite_0_o(RxmWrite_0_o ),
       .RxmAddress_0_o(RxmAddress_0_o ),
       .RxmWriteData_0_o(RxmWriteData_0_o ),
       .RxmByteEnable_0_o(RxmByteEnable_0_o ),
       .RxmWaitRequest_0_i(RxmWaitRequest_0_i ),
       .RxmRead_0_o(RxmRead_0_o ),
       .RxmReadData_0_i( RxmReadData_0_i),
       .RxmReadDataValid_0_i(RxmReadDataValid_0_i ),
       .RxmWrite_1_o(RxmWrite_1_o ),
       .RxmAddress_1_o(RxmAddress_1_o ),
       .RxmWriteData_1_o(RxmWriteData_1_o ),
       .RxmByteEnable_1_o( RxmByteEnable_1_o),
       .RxmWaitRequest_1_i(RxmWaitRequest_1_i ),
       .RxmRead_1_o(RxmRead_1_o ),
       .RxmReadData_1_i( RxmReadData_1_i),
       .RxmReadDataValid_1_i(RxmReadDataValid_1_i ),
       .RxmWrite_2_o( RxmWrite_2_o),
       .RxmAddress_2_o(RxmAddress_2_o ),
       .RxmWriteData_2_o(RxmWriteData_2_o ),
       .RxmByteEnable_2_o(RxmByteEnable_2_o ),
       .RxmWaitRequest_2_i(RxmWaitRequest_2_i ),
       .RxmRead_2_o(RxmRead_2_o ),
       .RxmReadData_2_i( RxmReadData_2_i),
       .RxmReadDataValid_2_i( RxmReadDataValid_2_i),
       .RxmWrite_3_o(RxmWrite_3_o ),
       .RxmAddress_3_o( RxmAddress_3_o),
       .RxmWriteData_3_o(RxmWriteData_3_o ),
       .RxmByteEnable_3_o(RxmByteEnable_3_o ),
       .RxmWaitRequest_3_i( RxmWaitRequest_3_i),
       .RxmRead_3_o(RxmRead_3_o ),
       .RxmReadData_3_i(RxmReadData_3_i ),
       .RxmReadDataValid_3_i(RxmReadDataValid_3_i ),
       .RxmWrite_4_o(RxmWrite_4_o ),
       .RxmAddress_4_o( RxmAddress_4_o),
       .RxmWriteData_4_o(RxmWriteData_4_o ),
       .RxmByteEnable_4_o( RxmByteEnable_4_o),
       .RxmWaitRequest_4_i(RxmWaitRequest_4_i ),
       .RxmRead_4_o( RxmRead_4_o),
       .RxmReadData_4_i( RxmReadData_4_i),
       .RxmReadDataValid_4_i(RxmReadDataValid_4_i ),
       .RxmWrite_5_o( RxmWrite_5_o),
       .RxmAddress_5_o(RxmAddress_5_o ),
       .RxmWriteData_5_o( RxmWriteData_5_o),
       .RxmByteEnable_5_o( RxmByteEnable_5_o),
       .RxmWaitRequest_5_i(RxmWaitRequest_5_i ),
       .RxmRead_5_o( RxmRead_5_o),
       .RxmReadData_5_i(RxmReadData_5_i ),
       .RxmReadDataValid_5_i(RxmReadDataValid_5_i ),
       .RxmIrq_i( RxmIrq_i),
       .CfgCtlWr_i( 1'b0),
       .CfgAddr_i(tl_cfg_add ),
       .CfgCtl_i( tl_cfg_ctl),
       .AppIntSts_o(app_int_sts),
       .MsiReq_o(app_msi_req ),
       .MsiAck_i(app_msi_ack ),
       .MsiTc_o(app_msi_tc ),
       .MsiNum_o (app_msi_num)
  );
  end
endgenerate

// Intx export
assign IntxAck_o = 1'b0;
assign app_int_sts_internal = adv_irq_ena? IntxReq_i : app_int_sts;

assign avalon_rstn = (pin_perst==1'b0)?1'b0:(npor==1'b0)?1'b0:1'b1;
assign avalon_clk = coreclkout;

 //////////////// SIMULATION-ONLY CONTENTS
   //synthesis translate_off
   initial begin
      reset_status_sync_pldclk_r = 3'b111;
   end
  //synthesis translate_on

   always @(posedge coreclkout or posedge reset_status_int) begin
      if (reset_status_int == 1'b1) begin
         reset_status_sync_pldclk_r <= 3'b111;
      end
      else begin
         reset_status_sync_pldclk_r[0] <= 1'b0;
         reset_status_sync_pldclk_r[1] <= reset_status_sync_pldclk_r[0];
         reset_status_sync_pldclk_r[2] <= reset_status_sync_pldclk_r[1];
      end
   end
   assign reset_status_sync_pldclk = reset_status_sync_pldclk_r[2];
   assign npor_int         = ~reset_status_sync_pldclk;

assign reset_status = app_rstn;


   altpcierd_hip_rs            #(
      .HIPRST_USE_LTSSM_HOTRESET((port_type_hwtcl=="Native endpoint")?1:0),
      .HIPRST_USE_LTSSM_DISABLE ((port_type_hwtcl=="Native endpoint")?1:0),
      .HIPRST_USE_L2            ((port_type_hwtcl=="Native endpoint")?1:0),
      .HIPRST_USE_DLUP_EXIT     ((port_type_hwtcl=="Native endpoint")?1:0)
   )      rs_hip                (
      .app_rstn                 (app_rstn),
      .dlup_exit                (dlup_exit),
      .hotrst_exit              (npor_int),
      .l2_exit                  (l2_exit),
      .ltssm                    (ltssmstate),
      .npor                     (npor_int & pld_clk_inuse),
      .pld_clk                  (coreclkout),
      .test_sim                 (1'b1)
   );



   assign pld_core_ready =  (PLD_CLK_IS_250MHZ==1) ? coreclkout_pll_locked : serdes_pll_locked;
   generate begin : g_hip_coreclkout_gclk
      if  (PLD_CLK_IS_250MHZ==1) begin
         wire fbclkout;
         wire open_locked;
         wire open_fbclkout;
         //                                                                _______
         //                                 |-------pld_clk_hip----------->|      |
         //                                 |   (pldclk_hip_phase_shift)   |      |
         //                               __^_                             | HIP  |
         //                              |    |                            |      |
         //                              |PLL |                            |      |
         //   <------coreclkout<--------<|____|<------coreclkout_hip------<|______|
         //    (coreclkout_hip_phaseshift)
         //
         // PLL to generate phase shifted coreclkout to apps i.e. apps_clk
         generic_pll #       ( .reference_clock_frequency("250.0 MHz"), .output_clock_frequency("250.0 MHz"), .phase_shift("0 ps"/*coreclkout_hip_phaseshift*/))
            u_pll_coreclkout ( .refclk(coreclkout_hip), .outclk(coreclkout), .locked(coreclkout_pll_locked), .fboutclk(fbclkout), .rst(~serdes_pll_locked), .fbclk(fbclkout));


         // PLL to generate phase shifted coreclkout_hip to HIP
         // Cascaded PLL module requires : .locked(open_locked), .fboutclk(open_fbclkout),
         generic_pll #       ( .reference_clock_frequency("250.0 MHz"), .output_clock_frequency("250.0 MHz"),  .phase_shift("0 ps" /*pldclk_hip_phase_shift*/))
            u_pll_pldclk     ( .refclk(coreclkout_hip), .outclk(pld_clk_hip), .locked(open_locked), .fboutclk(open_fbclkout), .rst(~serdes_pll_locked), .fbclk(fbclkout));
      end
      else begin

/// SIMULATION CONTENTS
            //synthesis translate_off
      assign coreclkout = coreclkout_hip;

// END SIMULATION CONTENTS
         //synthesis translate_on

          //synthesis read_comments_as_HDL on
         //global u_global_buffer_coreclkout (.in(coreclkout_hip), .out(coreclkout));
         //synthesis read_comments_as_HDL off

       assign pld_clk_hip   = coreclkout_hip;


      end
   end
   endgenerate

/// SIMULATION CONTENTS
            //synthesis translate_off
//  generate if(port_type_hwtcl == "Root port")
//    begin
//       wire       bfm_log_common_dummy_out;
//       wire       driver_rp_dummy_out;
//       wire       bfm_req_intf_common_dummy_out;
//       wire       bfm_shmem_common_dummy_out;
//       wire       ltssm_dummy_out;
//       altpcietb_bfm_log_common bfm_log_common ( .dummy_out (bfm_log_common_dummy_out));
//       altpcietb_bfm_req_intf_common bfm_req_intf_common ( .dummy_out (bfm_req_intf_common_dummy_out));
//       altpcietb_bfm_shmem_common bfm_shmem_common ( .dummy_out (bfm_shmem_common_dummy_out));
//       altpcietb_ltssm_mon ltssm_mon ( .dummy_out (ltssm_dummy_out), .ep_ltssm (5'h0), .rp_clk (sim_pipe_pclk_out), .rp_ltssm (ltssmstate), .rstn (npor));
//     end
// endgenerate

//synthesis translate_on


endmodule


module q_sys (
	alt_xcvr_reconfig_0_mgmt_clk_clk_clk,
	alt_xcvr_reconfig_0_mgmt_rst_reset_reset,
	alt_xcvr_reconfig_0_reconfig_mgmt_address,
	alt_xcvr_reconfig_0_reconfig_mgmt_read,
	alt_xcvr_reconfig_0_reconfig_mgmt_readdata,
	alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest,
	alt_xcvr_reconfig_0_reconfig_mgmt_write,
	alt_xcvr_reconfig_0_reconfig_mgmt_writedata,
	clk_0_clk_clk,
	clk_0_clk_reset_reset_n,
	master_read_control_fixed_location,
	master_read_control_read_base,
	master_read_control_read_length,
	master_read_control_go,
	master_read_control_done,
	master_read_control_early_done,
	master_read_user_read_buffer,
	master_read_user_buffer_output_data,
	master_read_user_data_available,
	master_write_control_fixed_location,
	master_write_control_write_base,
	master_write_control_write_length,
	master_write_control_go,
	master_write_control_done,
	master_write_user_write_buffer,
	master_write_user_buffer_input_data,
	master_write_user_buffer_full,
	pcie_cv_hip_avmm_0_hip_ctrl_test_in,
	pcie_cv_hip_avmm_0_hip_ctrl_simu_mode_pipe,
	pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_pclk_in,
	pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_rate,
	pcie_cv_hip_avmm_0_hip_pipe_sim_ltssmstate,
	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel0,
	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel1,
	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel2,
	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel3,
	pcie_cv_hip_avmm_0_hip_pipe_powerdown0,
	pcie_cv_hip_avmm_0_hip_pipe_powerdown1,
	pcie_cv_hip_avmm_0_hip_pipe_powerdown2,
	pcie_cv_hip_avmm_0_hip_pipe_powerdown3,
	pcie_cv_hip_avmm_0_hip_pipe_rxpolarity0,
	pcie_cv_hip_avmm_0_hip_pipe_rxpolarity1,
	pcie_cv_hip_avmm_0_hip_pipe_rxpolarity2,
	pcie_cv_hip_avmm_0_hip_pipe_rxpolarity3,
	pcie_cv_hip_avmm_0_hip_pipe_txcompl0,
	pcie_cv_hip_avmm_0_hip_pipe_txcompl1,
	pcie_cv_hip_avmm_0_hip_pipe_txcompl2,
	pcie_cv_hip_avmm_0_hip_pipe_txcompl3,
	pcie_cv_hip_avmm_0_hip_pipe_txdata0,
	pcie_cv_hip_avmm_0_hip_pipe_txdata1,
	pcie_cv_hip_avmm_0_hip_pipe_txdata2,
	pcie_cv_hip_avmm_0_hip_pipe_txdata3,
	pcie_cv_hip_avmm_0_hip_pipe_txdatak0,
	pcie_cv_hip_avmm_0_hip_pipe_txdatak1,
	pcie_cv_hip_avmm_0_hip_pipe_txdatak2,
	pcie_cv_hip_avmm_0_hip_pipe_txdatak3,
	pcie_cv_hip_avmm_0_hip_pipe_txdetectrx0,
	pcie_cv_hip_avmm_0_hip_pipe_txdetectrx1,
	pcie_cv_hip_avmm_0_hip_pipe_txdetectrx2,
	pcie_cv_hip_avmm_0_hip_pipe_txdetectrx3,
	pcie_cv_hip_avmm_0_hip_pipe_txelecidle0,
	pcie_cv_hip_avmm_0_hip_pipe_txelecidle1,
	pcie_cv_hip_avmm_0_hip_pipe_txelecidle2,
	pcie_cv_hip_avmm_0_hip_pipe_txelecidle3,
	pcie_cv_hip_avmm_0_hip_pipe_txswing0,
	pcie_cv_hip_avmm_0_hip_pipe_txswing1,
	pcie_cv_hip_avmm_0_hip_pipe_txswing2,
	pcie_cv_hip_avmm_0_hip_pipe_txswing3,
	pcie_cv_hip_avmm_0_hip_pipe_txmargin0,
	pcie_cv_hip_avmm_0_hip_pipe_txmargin1,
	pcie_cv_hip_avmm_0_hip_pipe_txmargin2,
	pcie_cv_hip_avmm_0_hip_pipe_txmargin3,
	pcie_cv_hip_avmm_0_hip_pipe_txdeemph0,
	pcie_cv_hip_avmm_0_hip_pipe_txdeemph1,
	pcie_cv_hip_avmm_0_hip_pipe_txdeemph2,
	pcie_cv_hip_avmm_0_hip_pipe_txdeemph3,
	pcie_cv_hip_avmm_0_hip_pipe_phystatus0,
	pcie_cv_hip_avmm_0_hip_pipe_phystatus1,
	pcie_cv_hip_avmm_0_hip_pipe_phystatus2,
	pcie_cv_hip_avmm_0_hip_pipe_phystatus3,
	pcie_cv_hip_avmm_0_hip_pipe_rxdata0,
	pcie_cv_hip_avmm_0_hip_pipe_rxdata1,
	pcie_cv_hip_avmm_0_hip_pipe_rxdata2,
	pcie_cv_hip_avmm_0_hip_pipe_rxdata3,
	pcie_cv_hip_avmm_0_hip_pipe_rxdatak0,
	pcie_cv_hip_avmm_0_hip_pipe_rxdatak1,
	pcie_cv_hip_avmm_0_hip_pipe_rxdatak2,
	pcie_cv_hip_avmm_0_hip_pipe_rxdatak3,
	pcie_cv_hip_avmm_0_hip_pipe_rxelecidle0,
	pcie_cv_hip_avmm_0_hip_pipe_rxelecidle1,
	pcie_cv_hip_avmm_0_hip_pipe_rxelecidle2,
	pcie_cv_hip_avmm_0_hip_pipe_rxelecidle3,
	pcie_cv_hip_avmm_0_hip_pipe_rxstatus0,
	pcie_cv_hip_avmm_0_hip_pipe_rxstatus1,
	pcie_cv_hip_avmm_0_hip_pipe_rxstatus2,
	pcie_cv_hip_avmm_0_hip_pipe_rxstatus3,
	pcie_cv_hip_avmm_0_hip_pipe_rxvalid0,
	pcie_cv_hip_avmm_0_hip_pipe_rxvalid1,
	pcie_cv_hip_avmm_0_hip_pipe_rxvalid2,
	pcie_cv_hip_avmm_0_hip_pipe_rxvalid3,
	pcie_cv_hip_avmm_0_hip_serial_rx_in0,
	pcie_cv_hip_avmm_0_hip_serial_rx_in1,
	pcie_cv_hip_avmm_0_hip_serial_rx_in2,
	pcie_cv_hip_avmm_0_hip_serial_rx_in3,
	pcie_cv_hip_avmm_0_hip_serial_tx_out0,
	pcie_cv_hip_avmm_0_hip_serial_tx_out1,
	pcie_cv_hip_avmm_0_hip_serial_tx_out2,
	pcie_cv_hip_avmm_0_hip_serial_tx_out3,
	pcie_cv_hip_avmm_0_npor_npor,
	pcie_cv_hip_avmm_0_npor_pin_perst,
	pcie_cv_hip_avmm_0_reconfig_clk_locked_fixedclk_locked,
	pcie_cv_hip_avmm_0_refclk_clk,
	pio_coder_rst_external_connection_export);	

	input		alt_xcvr_reconfig_0_mgmt_clk_clk_clk;
	input		alt_xcvr_reconfig_0_mgmt_rst_reset_reset;
	input	[6:0]	alt_xcvr_reconfig_0_reconfig_mgmt_address;
	input		alt_xcvr_reconfig_0_reconfig_mgmt_read;
	output	[31:0]	alt_xcvr_reconfig_0_reconfig_mgmt_readdata;
	output		alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest;
	input		alt_xcvr_reconfig_0_reconfig_mgmt_write;
	input	[31:0]	alt_xcvr_reconfig_0_reconfig_mgmt_writedata;
	output		clk_0_clk_clk;
	output		clk_0_clk_reset_reset_n;
	input		master_read_control_fixed_location;
	input	[31:0]	master_read_control_read_base;
	input	[31:0]	master_read_control_read_length;
	input		master_read_control_go;
	output		master_read_control_done;
	output		master_read_control_early_done;
	input		master_read_user_read_buffer;
	output	[31:0]	master_read_user_buffer_output_data;
	output		master_read_user_data_available;
	input		master_write_control_fixed_location;
	input	[31:0]	master_write_control_write_base;
	input	[31:0]	master_write_control_write_length;
	input		master_write_control_go;
	output		master_write_control_done;
	input		master_write_user_write_buffer;
	input	[31:0]	master_write_user_buffer_input_data;
	output		master_write_user_buffer_full;
	input	[31:0]	pcie_cv_hip_avmm_0_hip_ctrl_test_in;
	input		pcie_cv_hip_avmm_0_hip_ctrl_simu_mode_pipe;
	input		pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_pclk_in;
	output	[1:0]	pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_rate;
	output	[4:0]	pcie_cv_hip_avmm_0_hip_pipe_sim_ltssmstate;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel0;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel1;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel2;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel3;
	output	[1:0]	pcie_cv_hip_avmm_0_hip_pipe_powerdown0;
	output	[1:0]	pcie_cv_hip_avmm_0_hip_pipe_powerdown1;
	output	[1:0]	pcie_cv_hip_avmm_0_hip_pipe_powerdown2;
	output	[1:0]	pcie_cv_hip_avmm_0_hip_pipe_powerdown3;
	output		pcie_cv_hip_avmm_0_hip_pipe_rxpolarity0;
	output		pcie_cv_hip_avmm_0_hip_pipe_rxpolarity1;
	output		pcie_cv_hip_avmm_0_hip_pipe_rxpolarity2;
	output		pcie_cv_hip_avmm_0_hip_pipe_rxpolarity3;
	output		pcie_cv_hip_avmm_0_hip_pipe_txcompl0;
	output		pcie_cv_hip_avmm_0_hip_pipe_txcompl1;
	output		pcie_cv_hip_avmm_0_hip_pipe_txcompl2;
	output		pcie_cv_hip_avmm_0_hip_pipe_txcompl3;
	output	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_txdata0;
	output	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_txdata1;
	output	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_txdata2;
	output	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_txdata3;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdatak0;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdatak1;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdatak2;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdatak3;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdetectrx0;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdetectrx1;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdetectrx2;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdetectrx3;
	output		pcie_cv_hip_avmm_0_hip_pipe_txelecidle0;
	output		pcie_cv_hip_avmm_0_hip_pipe_txelecidle1;
	output		pcie_cv_hip_avmm_0_hip_pipe_txelecidle2;
	output		pcie_cv_hip_avmm_0_hip_pipe_txelecidle3;
	output		pcie_cv_hip_avmm_0_hip_pipe_txswing0;
	output		pcie_cv_hip_avmm_0_hip_pipe_txswing1;
	output		pcie_cv_hip_avmm_0_hip_pipe_txswing2;
	output		pcie_cv_hip_avmm_0_hip_pipe_txswing3;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_txmargin0;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_txmargin1;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_txmargin2;
	output	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_txmargin3;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdeemph0;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdeemph1;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdeemph2;
	output		pcie_cv_hip_avmm_0_hip_pipe_txdeemph3;
	input		pcie_cv_hip_avmm_0_hip_pipe_phystatus0;
	input		pcie_cv_hip_avmm_0_hip_pipe_phystatus1;
	input		pcie_cv_hip_avmm_0_hip_pipe_phystatus2;
	input		pcie_cv_hip_avmm_0_hip_pipe_phystatus3;
	input	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_rxdata0;
	input	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_rxdata1;
	input	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_rxdata2;
	input	[7:0]	pcie_cv_hip_avmm_0_hip_pipe_rxdata3;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxdatak0;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxdatak1;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxdatak2;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxdatak3;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxelecidle0;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxelecidle1;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxelecidle2;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxelecidle3;
	input	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_rxstatus0;
	input	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_rxstatus1;
	input	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_rxstatus2;
	input	[2:0]	pcie_cv_hip_avmm_0_hip_pipe_rxstatus3;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxvalid0;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxvalid1;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxvalid2;
	input		pcie_cv_hip_avmm_0_hip_pipe_rxvalid3;
	input		pcie_cv_hip_avmm_0_hip_serial_rx_in0;
	input		pcie_cv_hip_avmm_0_hip_serial_rx_in1;
	input		pcie_cv_hip_avmm_0_hip_serial_rx_in2;
	input		pcie_cv_hip_avmm_0_hip_serial_rx_in3;
	output		pcie_cv_hip_avmm_0_hip_serial_tx_out0;
	output		pcie_cv_hip_avmm_0_hip_serial_tx_out1;
	output		pcie_cv_hip_avmm_0_hip_serial_tx_out2;
	output		pcie_cv_hip_avmm_0_hip_serial_tx_out3;
	input		pcie_cv_hip_avmm_0_npor_npor;
	input		pcie_cv_hip_avmm_0_npor_pin_perst;
	output		pcie_cv_hip_avmm_0_reconfig_clk_locked_fixedclk_locked;
	input		pcie_cv_hip_avmm_0_refclk_clk;
	output		pio_coder_rst_external_connection_export;
endmodule

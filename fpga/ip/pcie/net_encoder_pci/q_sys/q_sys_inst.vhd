	component q_sys is
		port (
			alt_xcvr_reconfig_0_mgmt_clk_clk_clk                   : in  std_logic                     := 'X';             -- clk
			alt_xcvr_reconfig_0_mgmt_rst_reset_reset               : in  std_logic                     := 'X';             -- reset
			alt_xcvr_reconfig_0_reconfig_mgmt_address              : in  std_logic_vector(6 downto 0)  := (others => 'X'); -- address
			alt_xcvr_reconfig_0_reconfig_mgmt_read                 : in  std_logic                     := 'X';             -- read
			alt_xcvr_reconfig_0_reconfig_mgmt_readdata             : out std_logic_vector(31 downto 0);                    -- readdata
			alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest          : out std_logic;                                        -- waitrequest
			alt_xcvr_reconfig_0_reconfig_mgmt_write                : in  std_logic                     := 'X';             -- write
			alt_xcvr_reconfig_0_reconfig_mgmt_writedata            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			clk_0_clk_clk                                          : out std_logic;                                        -- clk
			clk_0_clk_reset_reset_n                                : out std_logic;                                        -- reset_n
			master_read_control_fixed_location                     : in  std_logic                     := 'X';             -- fixed_location
			master_read_control_read_base                          : in  std_logic_vector(31 downto 0) := (others => 'X'); -- read_base
			master_read_control_read_length                        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- read_length
			master_read_control_go                                 : in  std_logic                     := 'X';             -- go
			master_read_control_done                               : out std_logic;                                        -- done
			master_read_control_early_done                         : out std_logic;                                        -- early_done
			master_read_user_read_buffer                           : in  std_logic                     := 'X';             -- read_buffer
			master_read_user_buffer_output_data                    : out std_logic_vector(31 downto 0);                    -- buffer_output_data
			master_read_user_data_available                        : out std_logic;                                        -- data_available
			master_write_control_fixed_location                    : in  std_logic                     := 'X';             -- fixed_location
			master_write_control_write_base                        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_base
			master_write_control_write_length                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_length
			master_write_control_go                                : in  std_logic                     := 'X';             -- go
			master_write_control_done                              : out std_logic;                                        -- done
			master_write_user_write_buffer                         : in  std_logic                     := 'X';             -- write_buffer
			master_write_user_buffer_input_data                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- buffer_input_data
			master_write_user_buffer_full                          : out std_logic;                                        -- buffer_full
			pcie_cv_hip_avmm_0_hip_ctrl_test_in                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- test_in
			pcie_cv_hip_avmm_0_hip_ctrl_simu_mode_pipe             : in  std_logic                     := 'X';             -- simu_mode_pipe
			pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_pclk_in           : in  std_logic                     := 'X';             -- sim_pipe_pclk_in
			pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_rate              : out std_logic_vector(1 downto 0);                     -- sim_pipe_rate
			pcie_cv_hip_avmm_0_hip_pipe_sim_ltssmstate             : out std_logic_vector(4 downto 0);                     -- sim_ltssmstate
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel0             : out std_logic_vector(2 downto 0);                     -- eidleinfersel0
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel1             : out std_logic_vector(2 downto 0);                     -- eidleinfersel1
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel2             : out std_logic_vector(2 downto 0);                     -- eidleinfersel2
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel3             : out std_logic_vector(2 downto 0);                     -- eidleinfersel3
			pcie_cv_hip_avmm_0_hip_pipe_powerdown0                 : out std_logic_vector(1 downto 0);                     -- powerdown0
			pcie_cv_hip_avmm_0_hip_pipe_powerdown1                 : out std_logic_vector(1 downto 0);                     -- powerdown1
			pcie_cv_hip_avmm_0_hip_pipe_powerdown2                 : out std_logic_vector(1 downto 0);                     -- powerdown2
			pcie_cv_hip_avmm_0_hip_pipe_powerdown3                 : out std_logic_vector(1 downto 0);                     -- powerdown3
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity0                : out std_logic;                                        -- rxpolarity0
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity1                : out std_logic;                                        -- rxpolarity1
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity2                : out std_logic;                                        -- rxpolarity2
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity3                : out std_logic;                                        -- rxpolarity3
			pcie_cv_hip_avmm_0_hip_pipe_txcompl0                   : out std_logic;                                        -- txcompl0
			pcie_cv_hip_avmm_0_hip_pipe_txcompl1                   : out std_logic;                                        -- txcompl1
			pcie_cv_hip_avmm_0_hip_pipe_txcompl2                   : out std_logic;                                        -- txcompl2
			pcie_cv_hip_avmm_0_hip_pipe_txcompl3                   : out std_logic;                                        -- txcompl3
			pcie_cv_hip_avmm_0_hip_pipe_txdata0                    : out std_logic_vector(7 downto 0);                     -- txdata0
			pcie_cv_hip_avmm_0_hip_pipe_txdata1                    : out std_logic_vector(7 downto 0);                     -- txdata1
			pcie_cv_hip_avmm_0_hip_pipe_txdata2                    : out std_logic_vector(7 downto 0);                     -- txdata2
			pcie_cv_hip_avmm_0_hip_pipe_txdata3                    : out std_logic_vector(7 downto 0);                     -- txdata3
			pcie_cv_hip_avmm_0_hip_pipe_txdatak0                   : out std_logic;                                        -- txdatak0
			pcie_cv_hip_avmm_0_hip_pipe_txdatak1                   : out std_logic;                                        -- txdatak1
			pcie_cv_hip_avmm_0_hip_pipe_txdatak2                   : out std_logic;                                        -- txdatak2
			pcie_cv_hip_avmm_0_hip_pipe_txdatak3                   : out std_logic;                                        -- txdatak3
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx0                : out std_logic;                                        -- txdetectrx0
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx1                : out std_logic;                                        -- txdetectrx1
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx2                : out std_logic;                                        -- txdetectrx2
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx3                : out std_logic;                                        -- txdetectrx3
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle0                : out std_logic;                                        -- txelecidle0
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle1                : out std_logic;                                        -- txelecidle1
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle2                : out std_logic;                                        -- txelecidle2
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle3                : out std_logic;                                        -- txelecidle3
			pcie_cv_hip_avmm_0_hip_pipe_txswing0                   : out std_logic;                                        -- txswing0
			pcie_cv_hip_avmm_0_hip_pipe_txswing1                   : out std_logic;                                        -- txswing1
			pcie_cv_hip_avmm_0_hip_pipe_txswing2                   : out std_logic;                                        -- txswing2
			pcie_cv_hip_avmm_0_hip_pipe_txswing3                   : out std_logic;                                        -- txswing3
			pcie_cv_hip_avmm_0_hip_pipe_txmargin0                  : out std_logic_vector(2 downto 0);                     -- txmargin0
			pcie_cv_hip_avmm_0_hip_pipe_txmargin1                  : out std_logic_vector(2 downto 0);                     -- txmargin1
			pcie_cv_hip_avmm_0_hip_pipe_txmargin2                  : out std_logic_vector(2 downto 0);                     -- txmargin2
			pcie_cv_hip_avmm_0_hip_pipe_txmargin3                  : out std_logic_vector(2 downto 0);                     -- txmargin3
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph0                  : out std_logic;                                        -- txdeemph0
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph1                  : out std_logic;                                        -- txdeemph1
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph2                  : out std_logic;                                        -- txdeemph2
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph3                  : out std_logic;                                        -- txdeemph3
			pcie_cv_hip_avmm_0_hip_pipe_phystatus0                 : in  std_logic                     := 'X';             -- phystatus0
			pcie_cv_hip_avmm_0_hip_pipe_phystatus1                 : in  std_logic                     := 'X';             -- phystatus1
			pcie_cv_hip_avmm_0_hip_pipe_phystatus2                 : in  std_logic                     := 'X';             -- phystatus2
			pcie_cv_hip_avmm_0_hip_pipe_phystatus3                 : in  std_logic                     := 'X';             -- phystatus3
			pcie_cv_hip_avmm_0_hip_pipe_rxdata0                    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- rxdata0
			pcie_cv_hip_avmm_0_hip_pipe_rxdata1                    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- rxdata1
			pcie_cv_hip_avmm_0_hip_pipe_rxdata2                    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- rxdata2
			pcie_cv_hip_avmm_0_hip_pipe_rxdata3                    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- rxdata3
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak0                   : in  std_logic                     := 'X';             -- rxdatak0
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak1                   : in  std_logic                     := 'X';             -- rxdatak1
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak2                   : in  std_logic                     := 'X';             -- rxdatak2
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak3                   : in  std_logic                     := 'X';             -- rxdatak3
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle0                : in  std_logic                     := 'X';             -- rxelecidle0
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle1                : in  std_logic                     := 'X';             -- rxelecidle1
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle2                : in  std_logic                     := 'X';             -- rxelecidle2
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle3                : in  std_logic                     := 'X';             -- rxelecidle3
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus0                  : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- rxstatus0
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus1                  : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- rxstatus1
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus2                  : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- rxstatus2
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus3                  : in  std_logic_vector(2 downto 0)  := (others => 'X'); -- rxstatus3
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid0                   : in  std_logic                     := 'X';             -- rxvalid0
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid1                   : in  std_logic                     := 'X';             -- rxvalid1
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid2                   : in  std_logic                     := 'X';             -- rxvalid2
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid3                   : in  std_logic                     := 'X';             -- rxvalid3
			pcie_cv_hip_avmm_0_hip_serial_rx_in0                   : in  std_logic                     := 'X';             -- rx_in0
			pcie_cv_hip_avmm_0_hip_serial_rx_in1                   : in  std_logic                     := 'X';             -- rx_in1
			pcie_cv_hip_avmm_0_hip_serial_rx_in2                   : in  std_logic                     := 'X';             -- rx_in2
			pcie_cv_hip_avmm_0_hip_serial_rx_in3                   : in  std_logic                     := 'X';             -- rx_in3
			pcie_cv_hip_avmm_0_hip_serial_tx_out0                  : out std_logic;                                        -- tx_out0
			pcie_cv_hip_avmm_0_hip_serial_tx_out1                  : out std_logic;                                        -- tx_out1
			pcie_cv_hip_avmm_0_hip_serial_tx_out2                  : out std_logic;                                        -- tx_out2
			pcie_cv_hip_avmm_0_hip_serial_tx_out3                  : out std_logic;                                        -- tx_out3
			pcie_cv_hip_avmm_0_npor_npor                           : in  std_logic                     := 'X';             -- npor
			pcie_cv_hip_avmm_0_npor_pin_perst                      : in  std_logic                     := 'X';             -- pin_perst
			pcie_cv_hip_avmm_0_reconfig_clk_locked_fixedclk_locked : out std_logic;                                        -- fixedclk_locked
			pcie_cv_hip_avmm_0_refclk_clk                          : in  std_logic                     := 'X';             -- clk
			pio_coder_rst_external_connection_export               : out std_logic;                                        -- export
			pio_encoder_start_external_connection_export           : out std_logic                                         -- export
		);
	end component q_sys;

	u0 : component q_sys
		port map (
			alt_xcvr_reconfig_0_mgmt_clk_clk_clk                   => CONNECTED_TO_alt_xcvr_reconfig_0_mgmt_clk_clk_clk,                   --       alt_xcvr_reconfig_0_mgmt_clk_clk.clk
			alt_xcvr_reconfig_0_mgmt_rst_reset_reset               => CONNECTED_TO_alt_xcvr_reconfig_0_mgmt_rst_reset_reset,               --     alt_xcvr_reconfig_0_mgmt_rst_reset.reset
			alt_xcvr_reconfig_0_reconfig_mgmt_address              => CONNECTED_TO_alt_xcvr_reconfig_0_reconfig_mgmt_address,              --      alt_xcvr_reconfig_0_reconfig_mgmt.address
			alt_xcvr_reconfig_0_reconfig_mgmt_read                 => CONNECTED_TO_alt_xcvr_reconfig_0_reconfig_mgmt_read,                 --                                       .read
			alt_xcvr_reconfig_0_reconfig_mgmt_readdata             => CONNECTED_TO_alt_xcvr_reconfig_0_reconfig_mgmt_readdata,             --                                       .readdata
			alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest          => CONNECTED_TO_alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest,          --                                       .waitrequest
			alt_xcvr_reconfig_0_reconfig_mgmt_write                => CONNECTED_TO_alt_xcvr_reconfig_0_reconfig_mgmt_write,                --                                       .write
			alt_xcvr_reconfig_0_reconfig_mgmt_writedata            => CONNECTED_TO_alt_xcvr_reconfig_0_reconfig_mgmt_writedata,            --                                       .writedata
			clk_0_clk_clk                                          => CONNECTED_TO_clk_0_clk_clk,                                          --                              clk_0_clk.clk
			clk_0_clk_reset_reset_n                                => CONNECTED_TO_clk_0_clk_reset_reset_n,                                --                        clk_0_clk_reset.reset_n
			master_read_control_fixed_location                     => CONNECTED_TO_master_read_control_fixed_location,                     --                    master_read_control.fixed_location
			master_read_control_read_base                          => CONNECTED_TO_master_read_control_read_base,                          --                                       .read_base
			master_read_control_read_length                        => CONNECTED_TO_master_read_control_read_length,                        --                                       .read_length
			master_read_control_go                                 => CONNECTED_TO_master_read_control_go,                                 --                                       .go
			master_read_control_done                               => CONNECTED_TO_master_read_control_done,                               --                                       .done
			master_read_control_early_done                         => CONNECTED_TO_master_read_control_early_done,                         --                                       .early_done
			master_read_user_read_buffer                           => CONNECTED_TO_master_read_user_read_buffer,                           --                       master_read_user.read_buffer
			master_read_user_buffer_output_data                    => CONNECTED_TO_master_read_user_buffer_output_data,                    --                                       .buffer_output_data
			master_read_user_data_available                        => CONNECTED_TO_master_read_user_data_available,                        --                                       .data_available
			master_write_control_fixed_location                    => CONNECTED_TO_master_write_control_fixed_location,                    --                   master_write_control.fixed_location
			master_write_control_write_base                        => CONNECTED_TO_master_write_control_write_base,                        --                                       .write_base
			master_write_control_write_length                      => CONNECTED_TO_master_write_control_write_length,                      --                                       .write_length
			master_write_control_go                                => CONNECTED_TO_master_write_control_go,                                --                                       .go
			master_write_control_done                              => CONNECTED_TO_master_write_control_done,                              --                                       .done
			master_write_user_write_buffer                         => CONNECTED_TO_master_write_user_write_buffer,                         --                      master_write_user.write_buffer
			master_write_user_buffer_input_data                    => CONNECTED_TO_master_write_user_buffer_input_data,                    --                                       .buffer_input_data
			master_write_user_buffer_full                          => CONNECTED_TO_master_write_user_buffer_full,                          --                                       .buffer_full
			pcie_cv_hip_avmm_0_hip_ctrl_test_in                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_ctrl_test_in,                    --            pcie_cv_hip_avmm_0_hip_ctrl.test_in
			pcie_cv_hip_avmm_0_hip_ctrl_simu_mode_pipe             => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_ctrl_simu_mode_pipe,             --                                       .simu_mode_pipe
			pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_pclk_in           => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_pclk_in,           --            pcie_cv_hip_avmm_0_hip_pipe.sim_pipe_pclk_in
			pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_rate              => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_rate,              --                                       .sim_pipe_rate
			pcie_cv_hip_avmm_0_hip_pipe_sim_ltssmstate             => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_sim_ltssmstate,             --                                       .sim_ltssmstate
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel0             => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel0,             --                                       .eidleinfersel0
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel1             => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel1,             --                                       .eidleinfersel1
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel2             => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel2,             --                                       .eidleinfersel2
			pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel3             => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_eidleinfersel3,             --                                       .eidleinfersel3
			pcie_cv_hip_avmm_0_hip_pipe_powerdown0                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_powerdown0,                 --                                       .powerdown0
			pcie_cv_hip_avmm_0_hip_pipe_powerdown1                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_powerdown1,                 --                                       .powerdown1
			pcie_cv_hip_avmm_0_hip_pipe_powerdown2                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_powerdown2,                 --                                       .powerdown2
			pcie_cv_hip_avmm_0_hip_pipe_powerdown3                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_powerdown3,                 --                                       .powerdown3
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity0                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxpolarity0,                --                                       .rxpolarity0
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity1                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxpolarity1,                --                                       .rxpolarity1
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity2                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxpolarity2,                --                                       .rxpolarity2
			pcie_cv_hip_avmm_0_hip_pipe_rxpolarity3                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxpolarity3,                --                                       .rxpolarity3
			pcie_cv_hip_avmm_0_hip_pipe_txcompl0                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txcompl0,                   --                                       .txcompl0
			pcie_cv_hip_avmm_0_hip_pipe_txcompl1                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txcompl1,                   --                                       .txcompl1
			pcie_cv_hip_avmm_0_hip_pipe_txcompl2                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txcompl2,                   --                                       .txcompl2
			pcie_cv_hip_avmm_0_hip_pipe_txcompl3                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txcompl3,                   --                                       .txcompl3
			pcie_cv_hip_avmm_0_hip_pipe_txdata0                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdata0,                    --                                       .txdata0
			pcie_cv_hip_avmm_0_hip_pipe_txdata1                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdata1,                    --                                       .txdata1
			pcie_cv_hip_avmm_0_hip_pipe_txdata2                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdata2,                    --                                       .txdata2
			pcie_cv_hip_avmm_0_hip_pipe_txdata3                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdata3,                    --                                       .txdata3
			pcie_cv_hip_avmm_0_hip_pipe_txdatak0                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdatak0,                   --                                       .txdatak0
			pcie_cv_hip_avmm_0_hip_pipe_txdatak1                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdatak1,                   --                                       .txdatak1
			pcie_cv_hip_avmm_0_hip_pipe_txdatak2                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdatak2,                   --                                       .txdatak2
			pcie_cv_hip_avmm_0_hip_pipe_txdatak3                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdatak3,                   --                                       .txdatak3
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx0                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdetectrx0,                --                                       .txdetectrx0
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx1                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdetectrx1,                --                                       .txdetectrx1
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx2                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdetectrx2,                --                                       .txdetectrx2
			pcie_cv_hip_avmm_0_hip_pipe_txdetectrx3                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdetectrx3,                --                                       .txdetectrx3
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle0                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txelecidle0,                --                                       .txelecidle0
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle1                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txelecidle1,                --                                       .txelecidle1
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle2                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txelecidle2,                --                                       .txelecidle2
			pcie_cv_hip_avmm_0_hip_pipe_txelecidle3                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txelecidle3,                --                                       .txelecidle3
			pcie_cv_hip_avmm_0_hip_pipe_txswing0                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txswing0,                   --                                       .txswing0
			pcie_cv_hip_avmm_0_hip_pipe_txswing1                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txswing1,                   --                                       .txswing1
			pcie_cv_hip_avmm_0_hip_pipe_txswing2                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txswing2,                   --                                       .txswing2
			pcie_cv_hip_avmm_0_hip_pipe_txswing3                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txswing3,                   --                                       .txswing3
			pcie_cv_hip_avmm_0_hip_pipe_txmargin0                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txmargin0,                  --                                       .txmargin0
			pcie_cv_hip_avmm_0_hip_pipe_txmargin1                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txmargin1,                  --                                       .txmargin1
			pcie_cv_hip_avmm_0_hip_pipe_txmargin2                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txmargin2,                  --                                       .txmargin2
			pcie_cv_hip_avmm_0_hip_pipe_txmargin3                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txmargin3,                  --                                       .txmargin3
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph0                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdeemph0,                  --                                       .txdeemph0
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph1                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdeemph1,                  --                                       .txdeemph1
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph2                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdeemph2,                  --                                       .txdeemph2
			pcie_cv_hip_avmm_0_hip_pipe_txdeemph3                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_txdeemph3,                  --                                       .txdeemph3
			pcie_cv_hip_avmm_0_hip_pipe_phystatus0                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_phystatus0,                 --                                       .phystatus0
			pcie_cv_hip_avmm_0_hip_pipe_phystatus1                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_phystatus1,                 --                                       .phystatus1
			pcie_cv_hip_avmm_0_hip_pipe_phystatus2                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_phystatus2,                 --                                       .phystatus2
			pcie_cv_hip_avmm_0_hip_pipe_phystatus3                 => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_phystatus3,                 --                                       .phystatus3
			pcie_cv_hip_avmm_0_hip_pipe_rxdata0                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdata0,                    --                                       .rxdata0
			pcie_cv_hip_avmm_0_hip_pipe_rxdata1                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdata1,                    --                                       .rxdata1
			pcie_cv_hip_avmm_0_hip_pipe_rxdata2                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdata2,                    --                                       .rxdata2
			pcie_cv_hip_avmm_0_hip_pipe_rxdata3                    => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdata3,                    --                                       .rxdata3
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak0                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdatak0,                   --                                       .rxdatak0
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak1                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdatak1,                   --                                       .rxdatak1
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak2                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdatak2,                   --                                       .rxdatak2
			pcie_cv_hip_avmm_0_hip_pipe_rxdatak3                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxdatak3,                   --                                       .rxdatak3
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle0                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxelecidle0,                --                                       .rxelecidle0
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle1                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxelecidle1,                --                                       .rxelecidle1
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle2                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxelecidle2,                --                                       .rxelecidle2
			pcie_cv_hip_avmm_0_hip_pipe_rxelecidle3                => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxelecidle3,                --                                       .rxelecidle3
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus0                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxstatus0,                  --                                       .rxstatus0
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus1                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxstatus1,                  --                                       .rxstatus1
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus2                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxstatus2,                  --                                       .rxstatus2
			pcie_cv_hip_avmm_0_hip_pipe_rxstatus3                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxstatus3,                  --                                       .rxstatus3
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid0                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxvalid0,                   --                                       .rxvalid0
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid1                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxvalid1,                   --                                       .rxvalid1
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid2                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxvalid2,                   --                                       .rxvalid2
			pcie_cv_hip_avmm_0_hip_pipe_rxvalid3                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_pipe_rxvalid3,                   --                                       .rxvalid3
			pcie_cv_hip_avmm_0_hip_serial_rx_in0                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_rx_in0,                   --          pcie_cv_hip_avmm_0_hip_serial.rx_in0
			pcie_cv_hip_avmm_0_hip_serial_rx_in1                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_rx_in1,                   --                                       .rx_in1
			pcie_cv_hip_avmm_0_hip_serial_rx_in2                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_rx_in2,                   --                                       .rx_in2
			pcie_cv_hip_avmm_0_hip_serial_rx_in3                   => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_rx_in3,                   --                                       .rx_in3
			pcie_cv_hip_avmm_0_hip_serial_tx_out0                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_tx_out0,                  --                                       .tx_out0
			pcie_cv_hip_avmm_0_hip_serial_tx_out1                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_tx_out1,                  --                                       .tx_out1
			pcie_cv_hip_avmm_0_hip_serial_tx_out2                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_tx_out2,                  --                                       .tx_out2
			pcie_cv_hip_avmm_0_hip_serial_tx_out3                  => CONNECTED_TO_pcie_cv_hip_avmm_0_hip_serial_tx_out3,                  --                                       .tx_out3
			pcie_cv_hip_avmm_0_npor_npor                           => CONNECTED_TO_pcie_cv_hip_avmm_0_npor_npor,                           --                pcie_cv_hip_avmm_0_npor.npor
			pcie_cv_hip_avmm_0_npor_pin_perst                      => CONNECTED_TO_pcie_cv_hip_avmm_0_npor_pin_perst,                      --                                       .pin_perst
			pcie_cv_hip_avmm_0_reconfig_clk_locked_fixedclk_locked => CONNECTED_TO_pcie_cv_hip_avmm_0_reconfig_clk_locked_fixedclk_locked, -- pcie_cv_hip_avmm_0_reconfig_clk_locked.fixedclk_locked
			pcie_cv_hip_avmm_0_refclk_clk                          => CONNECTED_TO_pcie_cv_hip_avmm_0_refclk_clk,                          --              pcie_cv_hip_avmm_0_refclk.clk
			pio_coder_rst_external_connection_export               => CONNECTED_TO_pio_coder_rst_external_connection_export,               --      pio_coder_rst_external_connection.export
			pio_encoder_start_external_connection_export           => CONNECTED_TO_pio_encoder_start_external_connection_export            --  pio_encoder_start_external_connection.export
		);


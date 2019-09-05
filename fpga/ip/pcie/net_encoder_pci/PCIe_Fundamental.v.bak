// ============================================================================
// Copyright (c) 2017 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//  Terasic Technologies Inc
//  9F., No.176, Sec.2, Gongdao 5th Rd, East Dist, Hsinchu City, 30070. Taiwan
//  
//  
//                     web: http://www.terasic.com/  
//                     email: support@terasic.com
//
// ============================================================================
//Date:  Tue Nov 21 13:54:58 2017
// ============================================================================

//`define ENABLE_DDR3
//`define ENABLE_GPIO
`define ENABLE_PCIE

module PCIe_Fundamental(

      ///////// CLOCK /////////
      input              CLOCK_50_B3B,
      input              CLOCK_50_B4A, //Clock in DDR3's Bank
      input              CLOCK_50_B5B,
      input              CLOCK_50_B6A,
      input              CLOCK_50_B7A,
      input              CLOCK_50_B8A,

      ///////// Buttons /////////
      input              CPU_RESET_n, //RESET_n is Low-Active
      input    [ 3: 0]   KEY, //KEY is Low-Active

      ///////// Swtiches /////////
      input    [ 3: 0]   SW,

      ///////// LED /////////
      output   [ 3: 0]   LED, //LED is High-Active

      ///////// HEX0 /////////
      output             HEX0_DP,
      output   [ 6: 0]   HEX0,

      ///////// HEX1 /////////
      output             HEX1_DP,
      output   [ 6: 0]   HEX1,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// DRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_n,
      output             DRAM_WE_n,
      output             DRAM_CAS_n,
      output             DRAM_RAS_n,

`ifdef ENABLE_DDR3
      ///////// DDR3 /////////
      output   [14: 0]   DDR3_ADDR,
      output   [ 2: 0]   DDR3_BA,
      output             DDR3_CK_p,
      output             DDR3_CK_n,
      output             DDR3_CKE,
      inout    [ 3: 0]   DDR3_DQS_p,
      inout    [ 3: 0]   DDR3_DQS_n,
      inout    [31: 0]   DDR3_DQ,
      output   [ 3: 0]   DDR3_DM,
      output             DDR3_CS_n,
      output             DDR3_WE_n,
      output             DDR3_CAS_n,
      output             DDR3_RAS_n,
      output             DDR3_RESET_n,
      output             DDR3_ODT,
      input              DDR3_RZQ,
`endif /*ENABLE_DDR3*/

      ///////// Uart to Usb /////////
      output             UART_TX,
      input              UART_RX,
      input              UART_CTS,
      output             UART_RTS,

`ifdef ENABLE_GPIO
      ///////// GPIO /////////
      inout    [35: 0]   GPIO_0,
      inout    [35: 0]   GPIO_1,
`endif /*ENABLE_GPIO*/

      ///////// Arduino Interface /////////
      output             ADC_SCK,
      input              ADC_SDO,
      output             ADC_SDI,
      output             ADC_CONVST,
      inout    [15: 0]   ARD_IO,

`ifdef ENABLE_PCIE
      ///////// PCIE /////////
      inout              PCIE_SMBCLK,
      inout              PCIE_SMBDAT,
      input              PCIE_REFCLK_p,
      output   [ 3: 0]   PCIE_TX_p,
      input    [ 3: 0]   PCIE_RX_p,
      input              PCIE_PERST_n,
      output             PCIE_WAKE_n,
`endif /*ENABLE_PCIE*/

      ///////// SMA /////////
      input              SMA_CLKIN,
      output             SMA_CLKOUT 

);

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [3:0]	pio_led;
wire [3:0]	pio_button;
wire [31:0] pcie_hip_ctrl_test_in;//           .test_in
wire        pld_clk_clk;

//////////////////////
// PCIE RESET
wire        any_rstn;
reg         any_rstn_r /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102"  */;
reg         any_rstn_rr /* synthesis ALTERA_ATTRIBUTE = "SUPPRESS_DA_RULE_INTERNAL=R102"  */;
wire 			reconfig_xcvr_clk;
wire [5:0]  ltssm;

//=======================================================
//  Structural coding
//=======================================================

assign	pcie_hip_ctrl_test_in[4:0]  =  5'b01000;
assign	pcie_hip_ctrl_test_in[31:5] =  27'h5;
assign 	PCIE_WAKE_n = 1'b1;
assign 	FAN_CTRL = 1'b1;
assign 	any_rstn = PCIE_PERST_n;

//reset Synchronizer
  always @(posedge reconfig_xcvr_clk or negedge any_rstn)
    begin
      if (any_rstn == 0)
        begin
          any_rstn_r <= 0;
          any_rstn_rr <= 0;
        end
      else
        begin
          any_rstn_r <= 1;
          any_rstn_rr <= any_rstn_r;
        end
    end

assign reconfig_xcvr_clk = CLOCK_50_B3B;

q_sys u0 (
        .clk_0_clk_clk                                          (pld_clk_clk),
		  .clk_0_clk_reset_reset_n                                (),
        .pcie_cv_hip_avmm_0_refclk_clk                          (PCIE_REFCLK_p),
        .pcie_cv_hip_avmm_0_npor_npor                           (any_rstn_rr),
        .pcie_cv_hip_avmm_0_npor_pin_perst                      (PCIE_PERST_n),
        .pcie_cv_hip_avmm_0_hip_ctrl_test_in                    (pcie_hip_ctrl_test_in),
        .pcie_cv_hip_avmm_0_hip_ctrl_simu_mode_pipe             (1'b0),
		  .pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_pclk_in           (1'b0),
        .pcie_cv_hip_avmm_0_hip_pipe_sim_pipe_rate              (),
        .pcie_cv_hip_avmm_0_hip_pipe_sim_ltssmstate             (ltssm),
        .alt_xcvr_reconfig_0_mgmt_clk_clk_clk                   (reconfig_xcvr_clk),
        .alt_xcvr_reconfig_0_mgmt_rst_reset_reset               (!fixedclk_locked),
		  
        .alt_xcvr_reconfig_0_reconfig_mgmt_address              (7'h0),
        .alt_xcvr_reconfig_0_reconfig_mgmt_read                 (1'b0),
        .alt_xcvr_reconfig_0_reconfig_mgmt_readdata             (32'h0),
        .alt_xcvr_reconfig_0_reconfig_mgmt_waitrequest          (1'b0),
        .alt_xcvr_reconfig_0_reconfig_mgmt_write                (1'b0),
        .alt_xcvr_reconfig_0_reconfig_mgmt_writedata            (32'h0),
		  
        .pcie_cv_hip_avmm_0_reconfig_clk_locked_fixedclk_locked (fixedclk_locked),

		  // x1
        .pcie_cv_hip_avmm_0_hip_serial_rx_in0                   (PCIE_RX_p[0]),
        .pcie_cv_hip_avmm_0_hip_serial_tx_out0                  (PCIE_TX_p[0]),

			// x4
        .pcie_cv_hip_avmm_0_hip_serial_rx_in1                   (PCIE_RX_p[1]),
        .pcie_cv_hip_avmm_0_hip_serial_rx_in2                   (PCIE_RX_p[2]),
        .pcie_cv_hip_avmm_0_hip_serial_rx_in3                   (PCIE_RX_p[3]),
        .pcie_cv_hip_avmm_0_hip_serial_tx_out1                  (PCIE_TX_p[1]),
        .pcie_cv_hip_avmm_0_hip_serial_tx_out2                  (PCIE_TX_p[2]),
        .pcie_cv_hip_avmm_0_hip_serial_tx_out3                  (PCIE_TX_p[3]),
        .pio_led_external_connection_export                     (pio_led),
        .pio_key_external_connection_export                     (pio_button)
    );
	 
assign 	LED = pio_led;       // led high-active
assign 	pio_button = KEY;    // key high-active

endmodule

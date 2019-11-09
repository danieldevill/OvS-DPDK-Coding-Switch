//CP5 FPGA, PCIe Based Network Encoder
//Modified and appended to the PCIe_Fundamental module, provided by Terasic:
//By DBB de Villiers. e: dbbdevilliers[at]gmail.com
//============================================================================
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

`define ENABLE_PCIE

module PCIe_Fundamental(

      ///////// CLOCK /////////
      input              CLOCK_50_B3B,
		
      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// Uart to Usb /////////
      output             UART_TX,
      input              UART_RX,
      input              UART_CTS,
      output             UART_RTS,

      ///////// PCIE /////////
      inout              PCIE_SMBCLK,
      inout              PCIE_SMBDAT,
      input              PCIE_REFCLK_p,
      output   [ 3: 0]   PCIE_TX_p,
      input    [ 3: 0]   PCIE_RX_p,
      input              PCIE_PERST_n,
      output             PCIE_WAKE_n
);

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire [31:0] pcie_hip_ctrl_test_in;//           .test_in
wire        pld_clk_clk;

//Master Read Wires
reg         mr_control_fixed_location;
reg [31:0]  mr_control_base;
reg [31:0]  mr_control_length;
reg     mr_control_go;
wire        mr_control_done;
wire        mr_control_early_done;
wire [31:0] mr_buffer_data; 
wire      mr_data_avali;
reg       mr_read_buffer;
wire read_ram_en;
reg [3:0] start_delay;
reg [1:0] read_state;
parameter idle=0, read=1; 
//assign read_ram_en = 1'b0;

//Master Write Wires
reg       mw_control_fixed_location;
reg [31:0]  mw_control_base;
reg [31:0]  mw_control_length;
reg         mw_control_go;
wire        mw_control_done;
reg         mw_write_buffer;
reg [31:0]  mw_buffer_data;
wire        mw_buffer_full;
wire write_ram_en;
reg [1:0] write_state;
parameter write=1;
assign write_ram_en = 1'b1;

//Net Decoder Wires;
reg			decoder_rst;
reg [31:0]  decoder_pkt_in;
reg [31:0]  decoder_coeff_in;
wire [31:0] decoder_pkt_out;
wire 			decoder_done;
assign read_ram_en = pio_coder_rst;

//Coeff data
reg [55:0] coeff0 = 56'h9D_B5_D6_FC_99_31_CF;
reg [55:0] coeff1 = 56'h13_6D_B9_15_FF_54_69;
reg [55:0] coeff2 = 56'H14_AA_13_45_07_53_83;
reg [55:0] coeff3 = 56'hD5_2F_CF_8B_E2_0E_6B;
reg [55:0] coeff4 = 56'hF4_5F_F7_24_74_9A_21;
reg [55:0] coeff5 = 56'h5C_B7_EB_73_0B_47_F1;
reg [55:0] coeff6 = 56'hC9_E0_9B_D9_29_71_97;
reg [7:0] coef_packet_count;

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

//Instantiate Terasic qsys connections with added master templates.
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
		  
		  
      //Master Read and Write Templates
        .master_read_control_fixed_location(mr_control_fixed_location),  // master_read_control.fixed_location
        .master_read_control_read_base(mr_control_base),                 //                    .read_base
        .master_read_control_read_length(mr_control_length),             //                    .read_length
        .master_read_control_go(mr_control_go),                          //                    .go
        .master_read_control_done(mr_control_done),                      //                    .done
        .master_read_control_early_done(mr_control_early_done),          //                    .early_done
        .master_read_user_read_buffer(mr_read_buffer),                   //    master_read_user.read_buffer
        .master_read_user_buffer_output_data(mr_buffer_data),            //                    .buffer_output_data
        .master_read_user_data_available(mr_data_avali),                 //                    .data_available
        .master_write_control_fixed_location(mw_control_fixed_location), // master_write_control.fixed_location
        .master_write_control_write_base(mw_control_base),               //                     .write_base
        .master_write_control_write_length(mw_control_length),           //                     .write_length
        .master_write_control_go(mw_control_go),                         //                     .go
        .master_write_control_done(mw_control_done),                     //                     .done
        .master_write_user_write_buffer(mw_write_buffer),                //    master_write_user.write_buffer
        .master_write_user_buffer_input_data(mw_buffer_data),            //                     .buffer_input_data
        .master_write_user_buffer_full(mw_buffer_full),                  //                     .buffer_full
		  
      //Coder reset PI
      .pio_coder_rst_external_connection_export(pio_coder_rst)

    );
	 
//Instantiate network decoder VHDL module.
net_decoder
	#(
		.m(8),
		.h(7),
		.N(64)
	)
	net_decoder0 (
		.clk(reconfig_xcvr_clk),
		.rst(decoder_rst),
		.pkt32bseg_i(decoder_pkt_in),
		.coeffs_in(decoder_coeff_in),
		.pkt32bseg_o(decoder_pkt_out),
		.decoder_done(decoder_done)
);

//Master Read FSM
always @(posedge reconfig_xcvr_clk or negedge pio_coder_rst)
begin
  if(~pio_coder_rst)
	read_state = idle;
  else
    begin
      //RAM Read Idle and Read states
      case(read_state)
        idle:
          begin
            start_delay = 0;
            //Enable address incrementing while reading RAM
            mr_control_fixed_location = 1'b1;
            //Offset address base to account for FIFO delay. Address Read starts before 32'h0700_0000, so do not populate that memory space.
				mr_control_base =   (32'h0700_0000) & 32'hFFFF_FFFC;
            mr_control_length = 32'h0000_01B6;
            mr_control_go = 1'b1;
            if(read_ram_en == 1)
              read_state = read;
            else
              read_state = idle;
          end
        read:
          begin
            //Default control go deassert.
            mr_control_go = 1'b0;
				
            //Begin reading FIFO output.
            if(mr_data_avali == 1)
					begin
						if(start_delay == 4'h4)
							begin
								decoder_rst <= 1'b1;
							end
						else
							begin
								start_delay = start_delay + 4'h1;
								decoder_rst <= 1'b0;
							end

						mr_read_buffer = 1'b1;

						if(mr_control_base != 32'h0700_01D0)  
							begin
								mr_control_base = mr_control_base + 32'h4;
								mr_control_go <= 1'b1;								
								decoder_pkt_in[7:0] = mr_buffer_data[31:24];
								decoder_pkt_in[15:8] = mr_buffer_data[23:16];
								decoder_pkt_in[23:16] = mr_buffer_data[15:8];
								decoder_pkt_in[31:24] = mr_buffer_data[7:0];
							end
					end
            else
					begin
						mr_read_buffer = 1'b0;
					end
									 
            if(read_ram_en == 0 )
              read_state = idle;
            else
              read_state = read;
          end
      endcase 
    end
end

//Load coeffs
always @(posedge reconfig_xcvr_clk or negedge pio_coder_rst)
begin
  if(~pio_coder_rst)
	begin
		decoder_coeff_in = 32'b0;
		coef_packet_count = 0;
	end
  else
    begin
		if(coef_packet_count == 8'd9)
			begin
				decoder_coeff_in[7:0]   = coeff0[31:24];
				decoder_coeff_in[15:8]  = coeff0[23:16];
				decoder_coeff_in[23:16] = coeff0[15:8];
				decoder_coeff_in[31:24] = coeff0[7:0];
			end
		else if(coef_packet_count == 8'd10)
			begin
				decoder_coeff_in[7:0]   = coeff0[55:48];
				decoder_coeff_in[15:8]  = coeff0[47:40];
				decoder_coeff_in[23:16] = coeff0[39:32];
				decoder_coeff_in[31:24] = 8'h0;
			end
		else if(coef_packet_count == 8'd25)
			begin
				decoder_coeff_in[7:0]   = coeff1[31:24];
				decoder_coeff_in[15:8]  = coeff1[23:16];
				decoder_coeff_in[23:16] = coeff1[15:8];
				decoder_coeff_in[31:24] = coeff1[7:0];
			end
		else if(coef_packet_count == 8'd26)
			begin
				decoder_coeff_in[7:0]   = coeff1[55:48];
				decoder_coeff_in[15:8]  = coeff1[47:40];
				decoder_coeff_in[23:16] = coeff1[39:32];
				decoder_coeff_in[31:24] = 8'h0;
			end
		else if(coef_packet_count == 8'd41)
			begin
				decoder_coeff_in[7:0]   = coeff2[31:24];
				decoder_coeff_in[15:8]  = coeff2[23:16];
				decoder_coeff_in[23:16] = coeff2[15:8];
				decoder_coeff_in[31:24] = coeff2[7:0];
			end
		else if(coef_packet_count == 8'd42)
			begin
				decoder_coeff_in[7:0]   = coeff2[55:48];
				decoder_coeff_in[15:8]  = coeff2[47:40];
				decoder_coeff_in[23:16] = coeff2[39:32];
				decoder_coeff_in[31:24] = 8'h0;
			end
		else if(coef_packet_count == 8'd57)
			begin
				decoder_coeff_in[7:0]   = coeff3[31:24];
				decoder_coeff_in[15:8]  = coeff3[23:16];
				decoder_coeff_in[23:16] = coeff3[15:8];
				decoder_coeff_in[31:24] = coeff3[7:0];
			end
		else if(coef_packet_count == 8'd58)
			begin
				decoder_coeff_in[7:0]   = coeff3[55:48];
				decoder_coeff_in[15:8]  = coeff3[47:40];
				decoder_coeff_in[23:16] = coeff3[39:32];
				decoder_coeff_in[31:24] = 8'h0;
			end
		else if(coef_packet_count == 8'd73)
			begin
				decoder_coeff_in[7:0]   = coeff4[31:24];
				decoder_coeff_in[15:8]  = coeff4[23:16];
				decoder_coeff_in[23:16] = coeff4[15:8];
				decoder_coeff_in[31:24] = coeff4[7:0];
			end
		else if(coef_packet_count == 8'd74)
			begin
				decoder_coeff_in[7:0]   = coeff4[55:48];
				decoder_coeff_in[15:8]  = coeff4[47:40];
				decoder_coeff_in[23:16] = coeff4[39:32];
				decoder_coeff_in[31:24] = 8'h0;
			end
		else if(coef_packet_count == 8'd89)
			begin
				decoder_coeff_in[7:0]   = coeff5[31:24];
				decoder_coeff_in[15:8]  = coeff5[23:16];
				decoder_coeff_in[23:16] = coeff5[15:8];
				decoder_coeff_in[31:24] = coeff5[7:0];
			end
		else if(coef_packet_count == 8'd90)
			begin
				decoder_coeff_in[7:0]   = coeff5[55:48];
				decoder_coeff_in[15:8]  = coeff5[47:40];
				decoder_coeff_in[23:16] = coeff5[39:32];
				decoder_coeff_in[31:24] = 8'h0;
			end
		else if(coef_packet_count == 8'd105)
			begin
				decoder_coeff_in[7:0]   = coeff6[31:24];
				decoder_coeff_in[15:8]  = coeff6[23:16];
				decoder_coeff_in[23:16] = coeff6[15:8];
				decoder_coeff_in[31:24] = coeff6[7:0];
			end
		else if(coef_packet_count == 8'd106)
			begin
				decoder_coeff_in[7:0]   = coeff6[55:48];
				decoder_coeff_in[15:8]  = coeff6[47:40];
				decoder_coeff_in[23:16] = coeff6[39:32];
				decoder_coeff_in[31:24] = 8'h0;
			end
		else
			begin
				decoder_coeff_in   =  32'd0;
			end

		if(coef_packet_count < 8'd108)
			coef_packet_count = coef_packet_count + 8'h1;
	end
end

//Master Write FSM for output packets
always @(posedge reconfig_xcvr_clk or negedge pio_coder_rst)
begin
  if(~pio_coder_rst)
    write_state = idle;
  else
    begin
      //Write state cases
      case(write_state)
        idle:
          begin
            //Enable address incrementing while writing RAM
            mw_control_fixed_location = 1'b1;
            
            mw_control_base = 32'h0700_0200 & 32'hFFFF_FFFC;
            mw_control_length = 32'h0000_01B6;
            mw_control_go = 1'b0;
            if(write_ram_en == 1)
              write_state = write;
            else
              write_state = idle;
          end
        write:
          begin
            //Default control go
				mw_control_go = 1'b0;
				
				if(decoder_done == 1)
              begin
                mw_write_buffer = 1'b0;
                //Only Write when buffer is not full
                if(mw_buffer_full == 0)
					 begin
						if(mw_control_base != 32'h0700_0590)  
							begin
								mw_write_buffer = 1'b1;
								mw_control_base = mw_control_base + 32'h4;
								mw_control_go = 1'b1;
								mw_buffer_data = decoder_pkt_out;
							end
					end
              end
              
            //Change States if write_name disabled. 
            if(write_ram_en == 0)
              write_state = idle;
            else
              write_state = write;
          end
      endcase
    end
end

endmodule

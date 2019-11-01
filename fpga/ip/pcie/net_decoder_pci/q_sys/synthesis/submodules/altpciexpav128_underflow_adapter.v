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

module altpciexpav128_underflow_adapter

(

   input               Clk_i,
   input               Rstn_i,
                      
   output              HipRxReady_o, 
   input               HipRxValid_i,
   input  [127:0]      HipRxData_i, 
   input  [15:0]       HipRxBe_i,
   input               HipRxSop_i,
   input               HipRxEop_i,
   input               HipRxEmpty_i, 
   
   input [7:0]         HipRxBarDec_i,
   
   input               BridgeRxReady_i, 
   output              BridgeRxValid_o,
   output  [127:0]     BridgeRxData_o, 
   output  [15:0]      BridgeRxBe_o,
   output              BridgeRxSop_o,
   output              BridgeRxEop_o,
   output              BridgeRxEmpty_o,
   output  [7:0]       BridgeRxBarDec_o
   
);

  reg [127:0]      rx_data_reg;
  reg [15:0] 	     rx_be_reg;
  reg	             rx_sop_reg;
  reg              rx_eop_reg; 
  reg              rx_empty_reg;
  reg [7:0]        rx_bar_dec_reg;
  reg              rx_tlp_active_sreg;
  reg              rx_ready_reg;
  reg              rx_valid_reg;    
  reg              rx_valid_reg2;        
  reg              rx_tlp_underflow_reg;    
  reg              rx_tlp_underflow_reg2;  
  
  wire             rx_tlp_underflow;        
  wire             hip_valid_fall;
  reg              hip_valid_fall_reg;       
   reg              hip_valid_fall_reg2;



always @ (posedge Clk_i or negedge Rstn_i)
  begin
  	if(~Rstn_i)
  	  begin
  	    rx_data_reg    <= 128'h0;
  	    rx_be_reg      <= 16'h0;
  	    rx_sop_reg     <= 1'b0;
  	    rx_eop_reg     <= 1'b0;  
  	    rx_empty_reg   <= 1'b0;
  	    rx_valid_reg   <= 1'b0;   
  	    rx_valid_reg2   <= 1'b0;
  	    rx_ready_reg   <= 1'b0;
  	    rx_bar_dec_reg <= 8'h0;   
  	    rx_tlp_underflow_reg <= 1'b0;      
  	    rx_tlp_underflow_reg2 <= 1'b0;    
  	    hip_valid_fall_reg <= 1'b0;     
  	    hip_valid_fall_reg2 <= 1'b0;
  	  end
  	else       
  	  begin
  	    rx_data_reg <= HipRxData_i;
  	    rx_be_reg   <= HipRxBe_i;
  	    rx_sop_reg  <= HipRxSop_i;
  	    rx_eop_reg  <= HipRxEop_i; 
  	    rx_empty_reg   <= HipRxEmpty_i;
  	    rx_valid_reg <= HipRxValid_i;  
  	    rx_valid_reg2 <= rx_valid_reg;
  	    rx_ready_reg <= BridgeRxReady_i;
  	    rx_bar_dec_reg <= HipRxBarDec_i;  
  	    rx_tlp_underflow_reg <= rx_tlp_underflow;    
  	    rx_tlp_underflow_reg2 <= rx_tlp_underflow_reg;  
  	    hip_valid_fall_reg <= hip_valid_fall;    
  	    hip_valid_fall_reg2 <= hip_valid_fall_reg; 
  	  end
  end
  
  assign hip_valid_fall = rx_valid_reg & ~HipRxValid_i;
/// Underflow detection logic
always @ (posedge Clk_i or negedge Rstn_i)
  begin
  	if(~Rstn_i)
  	  rx_tlp_active_sreg <= 1'b0;
  	else if (HipRxEop_i)
       rx_tlp_active_sreg <= 1'b0;
    else if (HipRxSop_i)
       rx_tlp_active_sreg <= 1'b1;
  end

assign rx_tlp_underflow = rx_tlp_active_sreg & ~HipRxValid_i;  



// Muxing the Rx TLP output to the bridge
// selecting the register output normally and the HIP output when underflow detected

//assign BridgeRxData_o =   rx_tlp_underflow_reg? HipRxData_i  : rx_data_reg;
//assign BridgeRxBe_o   =   rx_tlp_underflow_reg? HipRxBe_i    : rx_be_reg;
//assign BridgeRxSop_o  =   rx_tlp_underflow_reg? HipRxSop_i   : rx_sop_reg;
//assign BridgeRxEop_o  =   rx_tlp_underflow_reg? HipRxEop_i   : rx_eop_reg;    
//assign BridgeRxEmpty_o  = rx_tlp_underflow_reg? HipRxEmpty_i   : rx_empty_reg;    


assign BridgeRxData_o =   hip_valid_fall_reg? HipRxData_i  : rx_data_reg;   
assign BridgeRxBe_o   =   hip_valid_fall_reg? HipRxBe_i    : rx_be_reg;     
assign BridgeRxSop_o  =   hip_valid_fall_reg? HipRxSop_i   : rx_sop_reg;    
assign BridgeRxEop_o  =   hip_valid_fall_reg? HipRxEop_i   : rx_eop_reg;    
assign BridgeRxEmpty_o  = hip_valid_fall_reg? HipRxEmpty_i   : rx_empty_reg;
assign BridgeRxBarDec_o  = hip_valid_fall_reg? HipRxBarDec_i : rx_bar_dec_reg;  

/// output to HIP
assign HipRxReady_o    = rx_ready_reg;
//assign BridgeRxValid_o = (rx_valid_reg | rx_tlp_underflow_reg) & ~rx_tlp_underflow_reg2;   
assign BridgeRxValid_o =  hip_valid_fall_reg? HipRxValid_i : hip_valid_fall_reg2?  1'b0 : rx_valid_reg;

endmodule
  
 









//lpm_divide CBX_SINGLE_OUTPUT_FILE="ON" LPM_DREPRESENTATION="UNSIGNED" LPM_HINT="LPM_REMAINDERPOSITIVE=TRUE" LPM_NREPRESENTATION="UNSIGNED" LPM_PIPELINE=1 LPM_TYPE="LPM_DIVIDE" LPM_WIDTHD=8 LPM_WIDTHN=8 clken clock denom numer quotient remain
//VERSION_BEGIN 18.1 cbx_mgl 2018:09:12:14:15:07:SJ cbx_stratixii 2018:09:12:13:04:09:SJ cbx_util_mgl 2018:09:12:13:04:09:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2018  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details.



//synthesis_resources = lpm_divide 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgvum
	( 
	clken,
	clock,
	denom,
	numer,
	quotient,
	remain) /* synthesis synthesis_clearbox=1 */;
	input   clken;
	input   clock;
	input   [7:0]  denom;
	input   [7:0]  numer;
	output   [7:0]  quotient;
	output   [7:0]  remain;

	wire  [7:0]   wire_mgl_prim1_quotient;
	wire  [7:0]   wire_mgl_prim1_remain;

	lpm_divide   mgl_prim1
	( 
	.clken(clken),
	.clock(clock),
	.denom(denom),
	.numer(numer),
	.quotient(wire_mgl_prim1_quotient),
	.remain(wire_mgl_prim1_remain));
	defparam
		mgl_prim1.lpm_drepresentation = "UNSIGNED",
		mgl_prim1.lpm_nrepresentation = "UNSIGNED",
		mgl_prim1.lpm_pipeline = 1,
		mgl_prim1.lpm_type = "LPM_DIVIDE",
		mgl_prim1.lpm_widthd = 8,
		mgl_prim1.lpm_widthn = 8,
		mgl_prim1.lpm_hint = "LPM_REMAINDERPOSITIVE=TRUE";
	assign
		quotient = wire_mgl_prim1_quotient,
		remain = wire_mgl_prim1_remain;
endmodule //mgvum
//VALID FILE

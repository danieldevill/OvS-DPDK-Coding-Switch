-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "06/04/2019 19:41:31"

-- 
-- Device: Altera 5CGXFC9D6F27C7 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	gfadd IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	operand_1 : IN std_logic_vector(7 DOWNTO 0);
	operand_2 : IN std_logic_vector(7 DOWNTO 0);
	rslt : OUT std_logic_vector(7 DOWNTO 0)
	);
END gfadd;

-- Design Ports Information
-- rslt[0]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[1]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[2]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[3]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[4]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[5]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[6]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[7]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[0]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[0]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AD8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[1]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[1]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[2]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[2]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[3]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[3]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[4]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[4]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[5]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[5]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[6]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[6]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[7]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[7]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF gfadd IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_operand_1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_operand_2 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_rslt : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \operand_1[0]~input_o\ : std_logic;
SIGNAL \operand_2[0]~input_o\ : std_logic;
SIGNAL \rslt~0_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rslt[0]~reg0_q\ : std_logic;
SIGNAL \operand_2[1]~input_o\ : std_logic;
SIGNAL \operand_1[1]~input_o\ : std_logic;
SIGNAL \rslt~1_combout\ : std_logic;
SIGNAL \rslt[1]~reg0_q\ : std_logic;
SIGNAL \operand_2[2]~input_o\ : std_logic;
SIGNAL \operand_1[2]~input_o\ : std_logic;
SIGNAL \rslt~2_combout\ : std_logic;
SIGNAL \rslt[2]~reg0_q\ : std_logic;
SIGNAL \operand_1[3]~input_o\ : std_logic;
SIGNAL \operand_2[3]~input_o\ : std_logic;
SIGNAL \rslt~3_combout\ : std_logic;
SIGNAL \rslt[3]~reg0_q\ : std_logic;
SIGNAL \operand_1[4]~input_o\ : std_logic;
SIGNAL \operand_2[4]~input_o\ : std_logic;
SIGNAL \rslt~4_combout\ : std_logic;
SIGNAL \rslt[4]~reg0_q\ : std_logic;
SIGNAL \operand_1[5]~input_o\ : std_logic;
SIGNAL \operand_2[5]~input_o\ : std_logic;
SIGNAL \rslt~5_combout\ : std_logic;
SIGNAL \rslt[5]~reg0_q\ : std_logic;
SIGNAL \operand_1[6]~input_o\ : std_logic;
SIGNAL \operand_2[6]~input_o\ : std_logic;
SIGNAL \rslt~6_combout\ : std_logic;
SIGNAL \rslt[6]~reg0_q\ : std_logic;
SIGNAL \operand_2[7]~input_o\ : std_logic;
SIGNAL \operand_1[7]~input_o\ : std_logic;
SIGNAL \rslt~7_combout\ : std_logic;
SIGNAL \rslt[7]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_operand_2[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[0]~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_operand_1 <= operand_1;
ww_operand_2 <= operand_2;
rslt <= ww_rslt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_operand_2[7]~input_o\ <= NOT \operand_2[7]~input_o\;
\ALT_INV_operand_1[7]~input_o\ <= NOT \operand_1[7]~input_o\;
\ALT_INV_operand_2[6]~input_o\ <= NOT \operand_2[6]~input_o\;
\ALT_INV_operand_1[6]~input_o\ <= NOT \operand_1[6]~input_o\;
\ALT_INV_operand_2[5]~input_o\ <= NOT \operand_2[5]~input_o\;
\ALT_INV_operand_1[5]~input_o\ <= NOT \operand_1[5]~input_o\;
\ALT_INV_operand_2[4]~input_o\ <= NOT \operand_2[4]~input_o\;
\ALT_INV_operand_1[4]~input_o\ <= NOT \operand_1[4]~input_o\;
\ALT_INV_operand_2[3]~input_o\ <= NOT \operand_2[3]~input_o\;
\ALT_INV_operand_1[3]~input_o\ <= NOT \operand_1[3]~input_o\;
\ALT_INV_operand_2[2]~input_o\ <= NOT \operand_2[2]~input_o\;
\ALT_INV_operand_1[2]~input_o\ <= NOT \operand_1[2]~input_o\;
\ALT_INV_operand_2[1]~input_o\ <= NOT \operand_2[1]~input_o\;
\ALT_INV_operand_1[1]~input_o\ <= NOT \operand_1[1]~input_o\;
\ALT_INV_operand_2[0]~input_o\ <= NOT \operand_2[0]~input_o\;
\ALT_INV_operand_1[0]~input_o\ <= NOT \operand_1[0]~input_o\;

-- Location: IOOBUF_X42_Y0_N36
\rslt[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(0));

-- Location: IOOBUF_X42_Y0_N53
\rslt[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(1));

-- Location: IOOBUF_X50_Y0_N19
\rslt[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(2));

-- Location: IOOBUF_X50_Y0_N53
\rslt[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(3));

-- Location: IOOBUF_X40_Y0_N76
\rslt[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[4]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(4));

-- Location: IOOBUF_X50_Y0_N2
\rslt[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[5]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(5));

-- Location: IOOBUF_X42_Y0_N2
\rslt[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[6]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(6));

-- Location: IOOBUF_X42_Y0_N19
\rslt[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt[7]~reg0_q\,
	devoe => ww_devoe,
	o => ww_rslt(7));

-- Location: IOIBUF_X54_Y0_N1
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G6
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X46_Y0_N18
\operand_1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(0),
	o => \operand_1[0]~input_o\);

-- Location: IOIBUF_X48_Y0_N92
\operand_2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(0),
	o => \operand_2[0]~input_o\);

-- Location: MLABCELL_X46_Y1_N30
\rslt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~0_combout\ = ( \operand_2[0]~input_o\ & ( !\operand_1[0]~input_o\ ) ) # ( !\operand_2[0]~input_o\ & ( \operand_1[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[0]~input_o\,
	dataf => \ALT_INV_operand_2[0]~input_o\,
	combout => \rslt~0_combout\);

-- Location: IOIBUF_X48_Y0_N41
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X46_Y1_N31
\rslt[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[0]~reg0_q\);

-- Location: IOIBUF_X44_Y0_N52
\operand_2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(1),
	o => \operand_2[1]~input_o\);

-- Location: IOIBUF_X46_Y0_N35
\operand_1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(1),
	o => \operand_1[1]~input_o\);

-- Location: MLABCELL_X46_Y1_N9
\rslt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~1_combout\ = ( \operand_1[1]~input_o\ & ( !\operand_2[1]~input_o\ ) ) # ( !\operand_1[1]~input_o\ & ( \operand_2[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101101010101010101001010101010101011010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[1]~input_o\,
	datae => \ALT_INV_operand_1[1]~input_o\,
	combout => \rslt~1_combout\);

-- Location: FF_X46_Y1_N11
\rslt[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~1_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[1]~reg0_q\);

-- Location: IOIBUF_X50_Y0_N35
\operand_2[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(2),
	o => \operand_2[2]~input_o\);

-- Location: IOIBUF_X52_Y0_N18
\operand_1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(2),
	o => \operand_1[2]~input_o\);

-- Location: LABCELL_X50_Y1_N3
\rslt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~2_combout\ = ( \operand_1[2]~input_o\ & ( !\operand_2[2]~input_o\ ) ) # ( !\operand_1[2]~input_o\ & ( \operand_2[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010110101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[2]~input_o\,
	dataf => \ALT_INV_operand_1[2]~input_o\,
	combout => \rslt~2_combout\);

-- Location: FF_X50_Y1_N4
\rslt[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~2_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[2]~reg0_q\);

-- Location: IOIBUF_X48_Y0_N75
\operand_1[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(3),
	o => \operand_1[3]~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\operand_2[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(3),
	o => \operand_2[3]~input_o\);

-- Location: LABCELL_X50_Y1_N0
\rslt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~3_combout\ = ( \operand_2[3]~input_o\ & ( !\operand_1[3]~input_o\ ) ) # ( !\operand_2[3]~input_o\ & ( \operand_1[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[3]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \rslt~3_combout\);

-- Location: FF_X50_Y1_N1
\rslt[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~3_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[3]~reg0_q\);

-- Location: IOIBUF_X44_Y0_N18
\operand_1[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(4),
	o => \operand_1[4]~input_o\);

-- Location: IOIBUF_X44_Y0_N35
\operand_2[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(4),
	o => \operand_2[4]~input_o\);

-- Location: MLABCELL_X46_Y1_N15
\rslt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~4_combout\ = ( \operand_2[4]~input_o\ & ( !\operand_1[4]~input_o\ ) ) # ( !\operand_2[4]~input_o\ & ( \operand_1[4]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111111100001111000000001111000011111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[4]~input_o\,
	datae => \ALT_INV_operand_2[4]~input_o\,
	combout => \rslt~4_combout\);

-- Location: FF_X46_Y1_N16
\rslt[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[4]~reg0_q\);

-- Location: IOIBUF_X52_Y0_N1
\operand_1[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(5),
	o => \operand_1[5]~input_o\);

-- Location: IOIBUF_X52_Y0_N52
\operand_2[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(5),
	o => \operand_2[5]~input_o\);

-- Location: LABCELL_X50_Y1_N6
\rslt~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~5_combout\ = ( \operand_2[5]~input_o\ & ( !\operand_1[5]~input_o\ ) ) # ( !\operand_2[5]~input_o\ & ( \operand_1[5]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111001100110011001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_operand_1[5]~input_o\,
	dataf => \ALT_INV_operand_2[5]~input_o\,
	combout => \rslt~5_combout\);

-- Location: FF_X50_Y1_N7
\rslt[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~5_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[5]~reg0_q\);

-- Location: IOIBUF_X44_Y0_N1
\operand_1[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(6),
	o => \operand_1[6]~input_o\);

-- Location: IOIBUF_X46_Y0_N52
\operand_2[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(6),
	o => \operand_2[6]~input_o\);

-- Location: MLABCELL_X46_Y1_N21
\rslt~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~6_combout\ = ( \operand_2[6]~input_o\ & ( !\operand_1[6]~input_o\ ) ) # ( !\operand_2[6]~input_o\ & ( \operand_1[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[6]~input_o\,
	dataf => \ALT_INV_operand_2[6]~input_o\,
	combout => \rslt~6_combout\);

-- Location: FF_X46_Y1_N22
\rslt[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~6_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[6]~reg0_q\);

-- Location: IOIBUF_X46_Y0_N1
\operand_2[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(7),
	o => \operand_2[7]~input_o\);

-- Location: IOIBUF_X48_Y0_N58
\operand_1[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(7),
	o => \operand_1[7]~input_o\);

-- Location: MLABCELL_X46_Y1_N24
\rslt~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt~7_combout\ = ( \operand_1[7]~input_o\ & ( !\operand_2[7]~input_o\ ) ) # ( !\operand_1[7]~input_o\ & ( \operand_2[7]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011110011001100110000110011001100111100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_1[7]~input_o\,
	combout => \rslt~7_combout\);

-- Location: FF_X46_Y1_N25
\rslt[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt~7_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[7]~reg0_q\);

-- Location: MLABCELL_X13_Y15_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;



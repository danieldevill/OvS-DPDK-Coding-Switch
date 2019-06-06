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

-- DATE "05/31/2019 15:42:16"

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

ENTITY 	prngen IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	rslt : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END prngen;

-- Design Ports Information
-- rslt[0]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[1]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[2]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[3]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[4]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[5]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[6]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[7]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF prngen IS
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
SIGNAL ww_rslt : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rslt_lfsr[7]~DUPLICATE_q\ : std_logic;
SIGNAL \rslt_lfsr~0_combout\ : std_logic;
SIGNAL \rslt_lfsr~1_combout\ : std_logic;
SIGNAL \rslt_lfsr~2_combout\ : std_logic;
SIGNAL \rslt_lfsr[5]~4_combout\ : std_logic;
SIGNAL \rslt_lfsr[5]~DUPLICATE_q\ : std_logic;
SIGNAL \rslt_lfsr[0]~3_combout\ : std_logic;
SIGNAL \rslt_lfsr[4]~DUPLICATE_q\ : std_logic;
SIGNAL \rslt_lfsr[6]~DUPLICATE_q\ : std_logic;
SIGNAL rslt_lfsr : std_logic_vector(7 DOWNTO 0);
SIGNAL ALT_INV_rslt_lfsr : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_rslt_lfsr[7]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_rslt_lfsr[4]~DUPLICATE_q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
rslt <= ww_rslt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_rslt_lfsr(1) <= NOT rslt_lfsr(1);
ALT_INV_rslt_lfsr(0) <= NOT rslt_lfsr(0);
\ALT_INV_rslt_lfsr[7]~DUPLICATE_q\ <= NOT \rslt_lfsr[7]~DUPLICATE_q\;
\ALT_INV_rslt_lfsr[4]~DUPLICATE_q\ <= NOT \rslt_lfsr[4]~DUPLICATE_q\;
ALT_INV_rslt_lfsr(7) <= NOT rslt_lfsr(7);
ALT_INV_rslt_lfsr(4) <= NOT rslt_lfsr(4);
ALT_INV_rslt_lfsr(3) <= NOT rslt_lfsr(3);
ALT_INV_rslt_lfsr(2) <= NOT rslt_lfsr(2);

-- Location: IOOBUF_X10_Y0_N36
\rslt[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_rslt_lfsr(0),
	devoe => ww_devoe,
	o => ww_rslt(0));

-- Location: IOOBUF_X12_Y0_N19
\rslt[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_rslt_lfsr(1),
	devoe => ww_devoe,
	o => ww_rslt(1));

-- Location: IOOBUF_X12_Y0_N2
\rslt[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_rslt_lfsr(2),
	devoe => ww_devoe,
	o => ww_rslt(2));

-- Location: IOOBUF_X12_Y0_N53
\rslt[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_rslt_lfsr(3),
	devoe => ww_devoe,
	o => ww_rslt(3));

-- Location: IOOBUF_X10_Y0_N53
\rslt[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_rslt_lfsr[4]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_rslt(4));

-- Location: IOOBUF_X14_Y0_N2
\rslt[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => rslt_lfsr(5),
	devoe => ww_devoe,
	o => ww_rslt(5));

-- Location: IOOBUF_X12_Y0_N36
\rslt[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_lfsr[6]~DUPLICATE_q\,
	devoe => ww_devoe,
	o => ww_rslt(6));

-- Location: IOOBUF_X10_Y0_N19
\rslt[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_lfsr[7]~DUPLICATE_q\,
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

-- Location: IOIBUF_X10_Y0_N1
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X11_Y1_N8
\rslt_lfsr[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => rslt_lfsr(6),
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt_lfsr[7]~DUPLICATE_q\);

-- Location: FF_X11_Y1_N19
\rslt_lfsr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => rslt_lfsr(0),
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(1));

-- Location: LABCELL_X11_Y1_N24
\rslt_lfsr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr~0_combout\ = ( !rslt_lfsr(7) & ( rslt_lfsr(1) ) ) # ( rslt_lfsr(7) & ( !rslt_lfsr(1) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_rslt_lfsr(7),
	dataf => ALT_INV_rslt_lfsr(1),
	combout => \rslt_lfsr~0_combout\);

-- Location: FF_X11_Y1_N25
\rslt_lfsr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_lfsr~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(2));

-- Location: LABCELL_X11_Y1_N39
\rslt_lfsr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr~1_combout\ = ( rslt_lfsr(2) & ( !\rslt_lfsr[7]~DUPLICATE_q\ ) ) # ( !rslt_lfsr(2) & ( \rslt_lfsr[7]~DUPLICATE_q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_rslt_lfsr[7]~DUPLICATE_q\,
	dataf => ALT_INV_rslt_lfsr(2),
	combout => \rslt_lfsr~1_combout\);

-- Location: FF_X11_Y1_N40
\rslt_lfsr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_lfsr~1_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(3));

-- Location: LABCELL_X11_Y1_N9
\rslt_lfsr~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr~2_combout\ = ( !rslt_lfsr(3) & ( rslt_lfsr(7) ) ) # ( rslt_lfsr(3) & ( !rslt_lfsr(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => ALT_INV_rslt_lfsr(3),
	dataf => ALT_INV_rslt_lfsr(7),
	combout => \rslt_lfsr~2_combout\);

-- Location: FF_X11_Y1_N10
\rslt_lfsr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_lfsr~2_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(4));

-- Location: LABCELL_X11_Y1_N36
\rslt_lfsr[5]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr[5]~4_combout\ = ( !rslt_lfsr(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_rslt_lfsr(4),
	combout => \rslt_lfsr[5]~4_combout\);

-- Location: FF_X11_Y1_N38
\rslt_lfsr[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_lfsr[5]~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt_lfsr[5]~DUPLICATE_q\);

-- Location: FF_X11_Y1_N29
\rslt_lfsr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \rslt_lfsr[5]~DUPLICATE_q\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(6));

-- Location: FF_X11_Y1_N7
\rslt_lfsr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => rslt_lfsr(6),
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(7));

-- Location: LABCELL_X11_Y1_N21
\rslt_lfsr[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr[0]~3_combout\ = ( !rslt_lfsr(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => ALT_INV_rslt_lfsr(7),
	combout => \rslt_lfsr[0]~3_combout\);

-- Location: FF_X11_Y1_N23
\rslt_lfsr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_lfsr[0]~3_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(0));

-- Location: FF_X11_Y1_N11
\rslt_lfsr[4]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_lfsr~2_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt_lfsr[4]~DUPLICATE_q\);

-- Location: FF_X11_Y1_N37
\rslt_lfsr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_lfsr[5]~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(5));

-- Location: FF_X11_Y1_N28
\rslt_lfsr[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \rslt_lfsr[5]~DUPLICATE_q\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt_lfsr[6]~DUPLICATE_q\);

-- Location: LABCELL_X106_Y74_N3
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



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

-- DATE "08/24/2019 18:35:33"

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

ENTITY 	gfinv IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	operand : IN std_logic_vector(7 DOWNTO 0);
	rslt : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END gfinv;

-- Design Ports Information
-- rslt[0]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[1]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[2]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[3]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[4]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[5]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[6]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[7]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[0]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[1]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[2]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[3]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[7]	=>  Location: PIN_AD6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[5]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[4]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[6]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF gfinv IS
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
SIGNAL ww_operand : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_rslt : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \operand[4]~input_o\ : std_logic;
SIGNAL \operand[1]~input_o\ : std_logic;
SIGNAL \operand[3]~input_o\ : std_logic;
SIGNAL \operand[2]~input_o\ : std_logic;
SIGNAL \operand[0]~input_o\ : std_logic;
SIGNAL \operand[5]~input_o\ : std_logic;
SIGNAL \operand[7]~input_o\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \operand[6]~input_o\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \rslt[0]~reg0_q\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \rslt[1]~reg0_q\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~2_combout\ : std_logic;
SIGNAL \Mux5~4_combout\ : std_logic;
SIGNAL \rslt[2]~reg0_q\ : std_logic;
SIGNAL \Mux4~2_combout\ : std_logic;
SIGNAL \Mux4~1_combout\ : std_logic;
SIGNAL \Mux4~0_combout\ : std_logic;
SIGNAL \Mux4~3_combout\ : std_logic;
SIGNAL \Mux4~4_combout\ : std_logic;
SIGNAL \rslt[3]~reg0_q\ : std_logic;
SIGNAL \Mux3~3_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~4_combout\ : std_logic;
SIGNAL \rslt[4]~reg0_q\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \Mux2~3_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Mux2~4_combout\ : std_logic;
SIGNAL \rslt[5]~reg0_q\ : std_logic;
SIGNAL \Mux1~3_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~4_combout\ : std_logic;
SIGNAL \rslt[6]~reg0_q\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \rslt[7]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_operand[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Mux0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux5~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux5~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \ALT_INV_LessThan0~0_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~1_combout\ : std_logic;
SIGNAL \ALT_INV_Mux7~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_operand <= operand;
rslt <= ww_rslt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_operand[6]~input_o\ <= NOT \operand[6]~input_o\;
\ALT_INV_operand[4]~input_o\ <= NOT \operand[4]~input_o\;
\ALT_INV_operand[5]~input_o\ <= NOT \operand[5]~input_o\;
\ALT_INV_operand[7]~input_o\ <= NOT \operand[7]~input_o\;
\ALT_INV_operand[3]~input_o\ <= NOT \operand[3]~input_o\;
\ALT_INV_operand[2]~input_o\ <= NOT \operand[2]~input_o\;
\ALT_INV_operand[1]~input_o\ <= NOT \operand[1]~input_o\;
\ALT_INV_operand[0]~input_o\ <= NOT \operand[0]~input_o\;
\ALT_INV_Mux0~3_combout\ <= NOT \Mux0~3_combout\;
\ALT_INV_Mux0~2_combout\ <= NOT \Mux0~2_combout\;
\ALT_INV_Mux0~1_combout\ <= NOT \Mux0~1_combout\;
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_Mux1~3_combout\ <= NOT \Mux1~3_combout\;
\ALT_INV_Mux1~2_combout\ <= NOT \Mux1~2_combout\;
\ALT_INV_Mux1~1_combout\ <= NOT \Mux1~1_combout\;
\ALT_INV_Mux1~0_combout\ <= NOT \Mux1~0_combout\;
\ALT_INV_Mux2~3_combout\ <= NOT \Mux2~3_combout\;
\ALT_INV_Mux2~2_combout\ <= NOT \Mux2~2_combout\;
\ALT_INV_Mux2~1_combout\ <= NOT \Mux2~1_combout\;
\ALT_INV_Mux2~0_combout\ <= NOT \Mux2~0_combout\;
\ALT_INV_Mux3~3_combout\ <= NOT \Mux3~3_combout\;
\ALT_INV_Mux3~2_combout\ <= NOT \Mux3~2_combout\;
\ALT_INV_Mux3~1_combout\ <= NOT \Mux3~1_combout\;
\ALT_INV_Mux3~0_combout\ <= NOT \Mux3~0_combout\;
\ALT_INV_Mux4~3_combout\ <= NOT \Mux4~3_combout\;
\ALT_INV_Mux4~2_combout\ <= NOT \Mux4~2_combout\;
\ALT_INV_Mux4~1_combout\ <= NOT \Mux4~1_combout\;
\ALT_INV_Mux4~0_combout\ <= NOT \Mux4~0_combout\;
\ALT_INV_Mux5~3_combout\ <= NOT \Mux5~3_combout\;
\ALT_INV_Mux5~2_combout\ <= NOT \Mux5~2_combout\;
\ALT_INV_Mux5~1_combout\ <= NOT \Mux5~1_combout\;
\ALT_INV_Mux5~0_combout\ <= NOT \Mux5~0_combout\;
\ALT_INV_Mux6~3_combout\ <= NOT \Mux6~3_combout\;
\ALT_INV_Mux6~2_combout\ <= NOT \Mux6~2_combout\;
\ALT_INV_Mux6~1_combout\ <= NOT \Mux6~1_combout\;
\ALT_INV_Mux6~0_combout\ <= NOT \Mux6~0_combout\;
\ALT_INV_LessThan0~0_combout\ <= NOT \LessThan0~0_combout\;
\ALT_INV_Mux7~3_combout\ <= NOT \Mux7~3_combout\;
\ALT_INV_Mux7~2_combout\ <= NOT \Mux7~2_combout\;
\ALT_INV_Mux7~1_combout\ <= NOT \Mux7~1_combout\;
\ALT_INV_Mux7~0_combout\ <= NOT \Mux7~0_combout\;

-- Location: IOOBUF_X40_Y0_N42
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

-- Location: IOOBUF_X8_Y0_N76
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

-- Location: IOOBUF_X8_Y0_N59
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

-- Location: IOOBUF_X8_Y0_N93
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

-- Location: IOOBUF_X14_Y0_N19
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

-- Location: IOOBUF_X12_Y0_N19
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

-- Location: IOOBUF_X8_Y0_N42
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

-- Location: IOOBUF_X12_Y0_N53
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

-- Location: IOIBUF_X10_Y0_N52
\operand[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(4),
	o => \operand[4]~input_o\);

-- Location: IOIBUF_X14_Y0_N35
\operand[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(1),
	o => \operand[1]~input_o\);

-- Location: IOIBUF_X12_Y0_N1
\operand[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(3),
	o => \operand[3]~input_o\);

-- Location: IOIBUF_X10_Y0_N1
\operand[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(2),
	o => \operand[2]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\operand[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(0),
	o => \operand[0]~input_o\);

-- Location: IOIBUF_X12_Y0_N35
\operand[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(5),
	o => \operand[5]~input_o\);

-- Location: IOIBUF_X14_Y0_N52
\operand[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(7),
	o => \operand[7]~input_o\);

-- Location: LABCELL_X14_Y1_N30
\Mux7~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[3]~input_o\ & (!\operand[2]~input_o\))) # (\operand[1]~input_o\ & (!\operand[3]~input_o\ $ (((!\operand[0]~input_o\) # (\operand[2]~input_o\))))) ) ) 
-- ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[3]~input_o\ & (!\operand[2]~input_o\ $ (\operand[0]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[2]~input_o\) # ((!\operand[3]~input_o\ & 
-- \operand[0]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[0]~input_o\ & (!\operand[3]~input_o\ $ (\operand[2]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\ & 
-- (\operand[2]~input_o\ & !\operand[0]~input_o\)) # (\operand[3]~input_o\ & ((!\operand[0]~input_o\) # (\operand[2]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[3]~input_o\ & 
-- ((!\operand[0]~input_o\) # (\operand[1]~input_o\)))) # (\operand[2]~input_o\ & (!\operand[1]~input_o\ & ((\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000001001010100101110000000101110000010101100011000101100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~3_combout\);

-- Location: LABCELL_X14_Y1_N24
\Mux7~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (\operand[0]~input_o\ & ((!\operand[1]~input_o\) # (\operand[2]~input_o\)))) # (\operand[3]~input_o\ & ((!\operand[1]~input_o\ & (\operand[2]~input_o\)) # 
-- (\operand[1]~input_o\ & (!\operand[2]~input_o\ & !\operand[0]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[0]~input_o\))) # (\operand[1]~input_o\ & 
-- (!\operand[3]~input_o\)))) # (\operand[2]~input_o\ & ((!\operand[3]~input_o\ & ((!\operand[0]~input_o\))) # (\operand[3]~input_o\ & (!\operand[1]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & 
-- ((!\operand[3]~input_o\ & ((\operand[2]~input_o\))) # (\operand[3]~input_o\ & (\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[2]~input_o\) # ((\operand[1]~input_o\ & !\operand[3]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[1]~input_o\ & (\operand[3]~input_o\))) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\ $ (\operand[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111000011000111011111010001001110111000100001001010001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~2_combout\);

-- Location: LABCELL_X14_Y1_N42
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[3]~input_o\ & (!\operand[2]~input_o\ & \operand[0]~input_o\))) # (\operand[1]~input_o\ & ((!\operand[2]~input_o\ $ (\operand[0]~input_o\)))) ) ) ) # 
-- ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (((!\operand[2]~input_o\ & !\operand[0]~input_o\)) # (\operand[3]~input_o\))) # (\operand[1]~input_o\ & ((!\operand[2]~input_o\) # ((\operand[3]~input_o\ & 
-- \operand[0]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[0]~input_o\ & (!\operand[3]~input_o\ $ (\operand[2]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\ & 
-- (!\operand[2]~input_o\)) # (\operand[3]~input_o\ & ((!\operand[0]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[1]~input_o\ & ((\operand[0]~input_o\) # (\operand[2]~input_o\)))) # 
-- (\operand[3]~input_o\ & ((!\operand[0]~input_o\) # ((!\operand[1]~input_o\ & !\operand[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011101110101000010100011100001011110010011100110101000000100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: IOIBUF_X10_Y0_N18
\operand[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(6),
	o => \operand[6]~input_o\);

-- Location: LABCELL_X14_Y1_N18
\Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[0]~input_o\) # ((!\operand[3]~input_o\ & !\operand[2]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\ & ((\operand[0]~input_o\) # 
-- (\operand[2]~input_o\))) # (\operand[3]~input_o\ & (!\operand[2]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( !\operand[0]~input_o\ $ (((!\operand[3]~input_o\ & ((!\operand[2]~input_o\))) # (\operand[3]~input_o\ & 
-- (!\operand[1]~input_o\ & \operand[2]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & (\operand[1]~input_o\)) # (\operand[2]~input_o\ & ((\operand[3]~input_o\))))) # 
-- (\operand[0]~input_o\ & (!\operand[1]~input_o\ $ ((\operand[3]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (\operand[3]~input_o\ & ((!\operand[1]~input_o\ & (\operand[2]~input_o\ & \operand[0]~input_o\)) # 
-- (\operand[1]~input_o\ & ((!\operand[0]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100000010010100111001100100111101110000101011111011010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~1_combout\);

-- Location: LABCELL_X14_Y1_N0
\Mux7~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = ( \operand[6]~input_o\ & ( \Mux7~1_combout\ & ( (!\operand[4]~input_o\ & ((\Mux7~2_combout\))) # (\operand[4]~input_o\ & (!\Mux7~3_combout\)) ) ) ) # ( !\operand[6]~input_o\ & ( \Mux7~1_combout\ & ( (\Mux7~0_combout\) # 
-- (\operand[4]~input_o\) ) ) ) # ( \operand[6]~input_o\ & ( !\Mux7~1_combout\ & ( (!\operand[4]~input_o\ & ((\Mux7~2_combout\))) # (\operand[4]~input_o\ & (!\Mux7~3_combout\)) ) ) ) # ( !\operand[6]~input_o\ & ( !\Mux7~1_combout\ & ( (!\operand[4]~input_o\ 
-- & \Mux7~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000010101010010011100100111001010101111111110100111001001110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_Mux7~3_combout\,
	datac => \ALT_INV_Mux7~2_combout\,
	datad => \ALT_INV_Mux7~0_combout\,
	datae => \ALT_INV_operand[6]~input_o\,
	dataf => \ALT_INV_Mux7~1_combout\,
	combout => \Mux7~4_combout\);

-- Location: IOIBUF_X10_Y0_N35
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LABCELL_X11_Y1_N30
\LessThan0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = ( !\operand[2]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[0]~input_o\ & !\operand[3]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000010100000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[2]~input_o\,
	dataf => \ALT_INV_operand[1]~input_o\,
	combout => \LessThan0~0_combout\);

-- Location: LABCELL_X10_Y1_N12
\LessThan0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ( \operand[4]~input_o\ ) # ( !\operand[4]~input_o\ & ( (!\LessThan0~0_combout\) # (((\operand[7]~input_o\) # (\operand[6]~input_o\)) # (\operand[5]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111111111111111111111111111110111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_LessThan0~0_combout\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[7]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	combout => \LessThan0~1_combout\);

-- Location: FF_X14_Y1_N1
\rslt[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux7~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[0]~reg0_q\);

-- Location: LABCELL_X9_Y1_N30
\Mux6~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = ( \operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[3]~input_o\ & (!\operand[6]~input_o\ & !\operand[1]~input_o\))) # (\operand[0]~input_o\ & (((\operand[6]~input_o\ & \operand[1]~input_o\)))) ) ) ) # 
-- ( !\operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[0]~input_o\ $ (((\operand[1]~input_o\) # (\operand[6]~input_o\))))) # (\operand[3]~input_o\ & (((!\operand[1]~input_o\)))) ) ) ) # ( \operand[4]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[0]~input_o\ $ (((\operand[6]~input_o\ & \operand[1]~input_o\))))) # (\operand[3]~input_o\ & ((!\operand[6]~input_o\ $ (!\operand[1]~input_o\)) # (\operand[0]~input_o\))) ) ) ) # ( 
-- !\operand[4]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[6]~input_o\ & (!\operand[3]~input_o\ & (!\operand[0]~input_o\))) # (\operand[6]~input_o\ & ((!\operand[1]~input_o\) # ((!\operand[3]~input_o\ & \operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000111110000010100111011101001111010111001000100100000000000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[3]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~3_combout\);

-- Location: LABCELL_X9_Y1_N18
\Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = ( \operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[3]~input_o\ & (\operand[0]~input_o\)) # (\operand[3]~input_o\ & ((!\operand[1]~input_o\))))) # (\operand[6]~input_o\ & ((!\operand[1]~input_o\ & 
-- ((!\operand[0]~input_o\))) # (\operand[1]~input_o\ & (\operand[3]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[3]~input_o\) # ((\operand[0]~input_o\)))) # (\operand[6]~input_o\ & 
-- ((!\operand[1]~input_o\) # ((\operand[3]~input_o\ & !\operand[0]~input_o\)))) ) ) ) # ( \operand[4]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[3]~input_o\) # ((!\operand[6]~input_o\ & !\operand[1]~input_o\)))) # 
-- (\operand[0]~input_o\ & (((\operand[6]~input_o\ & \operand[1]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[6]~input_o\ & (\operand[3]~input_o\ & (!\operand[0]~input_o\))) # (\operand[6]~input_o\ & 
-- (\operand[1]~input_o\ & (!\operand[3]~input_o\ $ (!\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000001000110110010001000101110111111101101000111110000100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[3]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~1_combout\);

-- Location: LABCELL_X9_Y1_N42
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[3]~input_o\ & (!\operand[6]~input_o\ $ (\operand[1]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[3]~input_o\ $ (((\operand[6]~input_o\ & 
-- !\operand[1]~input_o\))))) ) ) ) # ( !\operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[0]~input_o\ & ((!\operand[1]~input_o\)))) # (\operand[3]~input_o\ & (((!\operand[0]~input_o\ & \operand[1]~input_o\)) # 
-- (\operand[6]~input_o\))) ) ) ) # ( \operand[4]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (\operand[0]~input_o\ & ((!\operand[1]~input_o\)))) # (\operand[3]~input_o\ & (!\operand[6]~input_o\ $ (((!\operand[0]~input_o\) # 
-- (\operand[1]~input_o\))))) ) ) ) # ( !\operand[4]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[6]~input_o\ & (!\operand[3]~input_o\ & (!\operand[0]~input_o\ & \operand[1]~input_o\))) # (\operand[6]~input_o\ & (!\operand[3]~input_o\ $ 
-- (((\operand[1]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101010000101001101100000010110001101010001010110000100100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[3]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LABCELL_X9_Y1_N54
\Mux6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = ( \operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[6]~input_o\ & (!\operand[1]~input_o\ & ((\operand[0]~input_o\) # (\operand[3]~input_o\)))) # (\operand[6]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[1]~input_o\))) # 
-- (\operand[0]~input_o\ & (\operand[3]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[0]~input_o\ & ((!\operand[1]~input_o\))) # (\operand[0]~input_o\ & (\operand[6]~input_o\ & 
-- \operand[1]~input_o\)))) # (\operand[3]~input_o\ & ((!\operand[6]~input_o\ & ((\operand[1]~input_o\))) # (\operand[6]~input_o\ & (\operand[0]~input_o\)))) ) ) ) # ( \operand[4]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[6]~input_o\ & 
-- (!\operand[1]~input_o\ $ (((\operand[3]~input_o\ & \operand[0]~input_o\))))) # (\operand[6]~input_o\ & (!\operand[3]~input_o\)) ) ) ) # ( !\operand[4]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[3]~input_o\) # 
-- ((!\operand[1]~input_o\)))) # (\operand[6]~input_o\ & (!\operand[1]~input_o\ & (!\operand[3]~input_o\ $ (\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100110100000111010100001101010001001010100110111000100001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[3]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~2_combout\);

-- Location: LABCELL_X9_Y1_N0
\Mux6~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = ( \Mux6~2_combout\ & ( \operand[5]~input_o\ & ( (\operand[2]~input_o\ & !\Mux6~3_combout\) ) ) ) # ( !\Mux6~2_combout\ & ( \operand[5]~input_o\ & ( (!\operand[2]~input_o\) # (!\Mux6~3_combout\) ) ) ) # ( \Mux6~2_combout\ & ( 
-- !\operand[5]~input_o\ & ( (!\operand[2]~input_o\ & ((\Mux6~0_combout\))) # (\operand[2]~input_o\ & (!\Mux6~1_combout\)) ) ) ) # ( !\Mux6~2_combout\ & ( !\operand[5]~input_o\ & ( (!\operand[2]~input_o\ & ((\Mux6~0_combout\))) # (\operand[2]~input_o\ & 
-- (!\Mux6~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000011111010010100001111101011101110111011100100010001000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[2]~input_o\,
	datab => \ALT_INV_Mux6~3_combout\,
	datac => \ALT_INV_Mux6~1_combout\,
	datad => \ALT_INV_Mux6~0_combout\,
	datae => \ALT_INV_Mux6~2_combout\,
	dataf => \ALT_INV_operand[5]~input_o\,
	combout => \Mux6~4_combout\);

-- Location: FF_X9_Y1_N2
\rslt[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux6~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[1]~reg0_q\);

-- Location: LABCELL_X10_Y1_N0
\Mux5~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = ( \operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[5]~input_o\ & (((!\operand[3]~input_o\ & \operand[1]~input_o\)))) # (\operand[5]~input_o\ & ((!\operand[0]~input_o\ & (\operand[3]~input_o\)) # (\operand[0]~input_o\ & 
-- ((!\operand[1]~input_o\))))) ) ) ) # ( !\operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[5]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[3]~input_o\))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\)))) # (\operand[5]~input_o\ & 
-- (((\operand[3]~input_o\)))) ) ) ) # ( \operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[0]~input_o\ & (\operand[5]~input_o\))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[5]~input_o\ $ 
-- (\operand[3]~input_o\)))) ) ) ) # ( !\operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[5]~input_o\ & (\operand[0]~input_o\ & (!\operand[3]~input_o\ & \operand[1]~input_o\))) # (\operand[5]~input_o\ & (\operand[3]~input_o\ & 
-- (!\operand[0]~input_o\ $ (!\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101000010000100010110100100001111100010110001001111000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[7]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux5~3_combout\);

-- Location: LABCELL_X10_Y1_N48
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[5]~input_o\ & (\operand[3]~input_o\))) # (\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[5]~input_o\ & !\operand[3]~input_o\))))) ) ) 
-- ) # ( !\operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[5]~input_o\ & (!\operand[3]~input_o\ & \operand[1]~input_o\)) # (\operand[5]~input_o\ & (!\operand[3]~input_o\ $ (\operand[1]~input_o\))))) # 
-- (\operand[0]~input_o\ & ((!\operand[3]~input_o\ $ (!\operand[1]~input_o\)))) ) ) ) # ( \operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[5]~input_o\ & ((!\operand[3]~input_o\ & (!\operand[0]~input_o\)) # (\operand[3]~input_o\ & 
-- ((!\operand[1]~input_o\))))) # (\operand[5]~input_o\ & (\operand[0]~input_o\ & ((!\operand[1]~input_o\)))) ) ) ) # ( !\operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[5]~input_o\ $ (\operand[1]~input_o\)))) # 
-- (\operand[3]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[5]~input_o\))) # (\operand[1]~input_o\ & (\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001100110101100111011000000000100101110100100001110101001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[7]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LABCELL_X11_Y1_N6
\Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = ( \operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (((!\operand[3]~input_o\ & !\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[5]~input_o\ & (\operand[3]~input_o\)) # (\operand[5]~input_o\ & 
-- ((!\operand[1]~input_o\))))) ) ) ) # ( !\operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[5]~input_o\ & !\operand[1]~input_o\)) # (\operand[0]~input_o\ & (\operand[5]~input_o\ & \operand[1]~input_o\)) ) ) ) # ( 
-- \operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[5]~input_o\ & (((!\operand[0]~input_o\ & !\operand[1]~input_o\)) # (\operand[3]~input_o\))) # (\operand[5]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[3]~input_o\ $ (\operand[1]~input_o\)))) 
-- ) ) ) # ( !\operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[5]~input_o\ & ((!\operand[3]~input_o\) # (!\operand[0]~input_o\ $ (\operand[1]~input_o\)))) # (\operand[5]~input_o\ & ((!\operand[1]~input_o\) # ((\operand[0]~input_o\ & 
-- \operand[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111101111000101100111100010110110001000000100011011010100000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[2]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux5~1_combout\);

-- Location: LABCELL_X10_Y1_N24
\Mux5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = ( \operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (((\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\ $ (\operand[1]~input_o\)) # (\operand[5]~input_o\))) ) ) ) # ( 
-- !\operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[1]~input_o\ & ((!\operand[3]~input_o\) # (\operand[5]~input_o\)))) # (\operand[0]~input_o\ & (((\operand[3]~input_o\ & \operand[1]~input_o\)))) ) ) ) # ( 
-- \operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[3]~input_o\ & ((!\operand[5]~input_o\))) # (\operand[3]~input_o\ & (!\operand[0]~input_o\)))) # (\operand[1]~input_o\ & (!\operand[3]~input_o\ $ 
-- (((!\operand[0]~input_o\) # (!\operand[5]~input_o\))))) ) ) ) # ( !\operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[5]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[3]~input_o\))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\)))) # 
-- (\operand[5]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[3]~input_o\) # (\operand[0]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111010111001110010100001111010100010000001010101000110111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[7]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux5~2_combout\);

-- Location: LABCELL_X10_Y1_N30
\Mux5~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~4_combout\ = ( \Mux5~1_combout\ & ( \Mux5~2_combout\ & ( (!\operand[6]~input_o\ & (((!\Mux5~0_combout\ & !\operand[4]~input_o\)))) # (\operand[6]~input_o\ & (\Mux5~3_combout\ & ((\operand[4]~input_o\)))) ) ) ) # ( !\Mux5~1_combout\ & ( 
-- \Mux5~2_combout\ & ( (!\operand[6]~input_o\ & (((!\Mux5~0_combout\) # (\operand[4]~input_o\)))) # (\operand[6]~input_o\ & (\Mux5~3_combout\ & ((\operand[4]~input_o\)))) ) ) ) # ( \Mux5~1_combout\ & ( !\Mux5~2_combout\ & ( (!\operand[6]~input_o\ & 
-- (((!\Mux5~0_combout\ & !\operand[4]~input_o\)))) # (\operand[6]~input_o\ & (((!\operand[4]~input_o\)) # (\Mux5~3_combout\))) ) ) ) # ( !\Mux5~1_combout\ & ( !\Mux5~2_combout\ & ( (!\operand[6]~input_o\ & (((!\Mux5~0_combout\) # (\operand[4]~input_o\)))) # 
-- (\operand[6]~input_o\ & (((!\operand[4]~input_o\)) # (\Mux5~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111001111011101111100110001000111000000110111011100000000010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux5~3_combout\,
	datab => \ALT_INV_operand[6]~input_o\,
	datac => \ALT_INV_Mux5~0_combout\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_Mux5~1_combout\,
	dataf => \ALT_INV_Mux5~2_combout\,
	combout => \Mux5~4_combout\);

-- Location: FF_X10_Y1_N32
\rslt[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux5~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[2]~reg0_q\);

-- Location: LABCELL_X10_Y1_N18
\Mux4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = ( \operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[3]~input_o\ & (!\operand[5]~input_o\ $ (!\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[5]~input_o\) # ((\operand[3]~input_o\ & 
-- \operand[1]~input_o\)))) ) ) ) # ( !\operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[5]~input_o\ & (\operand[0]~input_o\ & (!\operand[3]~input_o\ & !\operand[1]~input_o\))) # (\operand[5]~input_o\ & (!\operand[0]~input_o\ $ 
-- (!\operand[3]~input_o\ $ (!\operand[1]~input_o\)))) ) ) ) # ( \operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[5]~input_o\ & (\operand[0]~input_o\ & (!\operand[3]~input_o\ $ (\operand[1]~input_o\)))) # (\operand[5]~input_o\ & 
-- (!\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[3]~input_o\)))) ) ) ) # ( !\operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (((\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[5]~input_o\ & 
-- ((!\operand[1]~input_o\) # (\operand[3]~input_o\))) # (\operand[5]~input_o\ & (!\operand[3]~input_o\ $ (!\operand[1]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010110111110010100100000010001100001000100100100011001001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[7]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux4~2_combout\);

-- Location: LABCELL_X10_Y1_N42
\Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = ( \operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[3]~input_o\ & (\operand[0]~input_o\ & (\operand[5]~input_o\ & !\operand[1]~input_o\))) # (\operand[3]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[5]~input_o\) # 
-- (\operand[0]~input_o\))))) ) ) ) # ( !\operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[5]~input_o\ & ((!\operand[1]~input_o\))) # (\operand[5]~input_o\ & ((!\operand[3]~input_o\) # (\operand[1]~input_o\))))) # 
-- (\operand[0]~input_o\ & (!\operand[5]~input_o\ $ (!\operand[3]~input_o\ $ (\operand[1]~input_o\)))) ) ) ) # ( \operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[5]~input_o\ & (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ 
-- (\operand[3]~input_o\)))) # (\operand[5]~input_o\ & ((!\operand[1]~input_o\) # ((!\operand[0]~input_o\ & \operand[3]~input_o\)))) ) ) ) # ( !\operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[3]~input_o\ $ 
-- (((!\operand[0]~input_o\) # (\operand[5]~input_o\))))) # (\operand[1]~input_o\ & (!\operand[5]~input_o\ & ((!\operand[0]~input_o\) # (\operand[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100101110001100001100111000011010111100011000110001001000001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[7]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux4~1_combout\);

-- Location: LABCELL_X10_Y1_N36
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[3]~input_o\ & (((\operand[1]~input_o\) # (\operand[5]~input_o\)))) # (\operand[3]~input_o\ & ((!\operand[0]~input_o\ & (!\operand[5]~input_o\)) # (\operand[0]~input_o\ & 
-- ((\operand[1]~input_o\))))) ) ) ) # ( !\operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[3]~input_o\ & (((!\operand[1]~input_o\)))) # (\operand[3]~input_o\ & ((!\operand[0]~input_o\ & (\operand[5]~input_o\)) # (\operand[0]~input_o\ & 
-- (!\operand[5]~input_o\ & \operand[1]~input_o\)))) ) ) ) # ( \operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[5]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[1]~input_o\))))) # (\operand[5]~input_o\ & (\operand[0]~input_o\ & 
-- (!\operand[3]~input_o\))) ) ) ) # ( !\operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[5]~input_o\ $ (\operand[3]~input_o\)))) # (\operand[1]~input_o\ & (\operand[0]~input_o\ & ((!\operand[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001101010000010101001001100011110010000001100011100011111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[7]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LABCELL_X10_Y1_N54
\Mux4~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = ( \operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (((!\operand[5]~input_o\ & !\operand[1]~input_o\)) # (\operand[3]~input_o\))) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\ & (\operand[5]~input_o\)) # 
-- (\operand[3]~input_o\ & ((!\operand[1]~input_o\))))) ) ) ) # ( !\operand[7]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[1]~input_o\ & (((\operand[5]~input_o\ & !\operand[3]~input_o\)) # (\operand[0]~input_o\))) # (\operand[1]~input_o\ & 
-- (((\operand[5]~input_o\)))) ) ) ) # ( \operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[0]~input_o\ & (!\operand[5]~input_o\ & !\operand[3]~input_o\))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ 
-- (!\operand[5]~input_o\ $ (!\operand[3]~input_o\)))) ) ) ) # ( !\operand[7]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[5]~input_o\ & ((!\operand[3]~input_o\) # (\operand[1]~input_o\))) # (\operand[5]~input_o\ & 
-- ((!\operand[1]~input_o\))))) # (\operand[0]~input_o\ & (\operand[1]~input_o\ & ((!\operand[3]~input_o\) # (\operand[5]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001011011001100000001001011001110101001100111001111100011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[5]~input_o\,
	datac => \ALT_INV_operand[3]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[7]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux4~3_combout\);

-- Location: LABCELL_X10_Y1_N6
\Mux4~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~4_combout\ = ( \Mux4~3_combout\ & ( \operand[6]~input_o\ & ( (\operand[4]~input_o\) # (\Mux4~2_combout\) ) ) ) # ( !\Mux4~3_combout\ & ( \operand[6]~input_o\ & ( (\Mux4~2_combout\ & !\operand[4]~input_o\) ) ) ) # ( \Mux4~3_combout\ & ( 
-- !\operand[6]~input_o\ & ( (!\operand[4]~input_o\ & ((!\Mux4~0_combout\))) # (\operand[4]~input_o\ & (!\Mux4~1_combout\)) ) ) ) # ( !\Mux4~3_combout\ & ( !\operand[6]~input_o\ & ( (!\operand[4]~input_o\ & ((!\Mux4~0_combout\))) # (\operand[4]~input_o\ & 
-- (!\Mux4~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011001100111100001100110001010101000000000101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux4~2_combout\,
	datab => \ALT_INV_Mux4~1_combout\,
	datac => \ALT_INV_Mux4~0_combout\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_Mux4~3_combout\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux4~4_combout\);

-- Location: FF_X10_Y1_N7
\rslt[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux4~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[3]~reg0_q\);

-- Location: LABCELL_X14_Y1_N54
\Mux3~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[3]~input_o\ & (!\operand[4]~input_o\ & \operand[0]~input_o\)) # (\operand[3]~input_o\ & (\operand[4]~input_o\)))) # (\operand[1]~input_o\ & 
-- (!\operand[0]~input_o\ $ (((!\operand[3]~input_o\ & !\operand[4]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & ((\operand[0]~input_o\))) # (\operand[4]~input_o\ & ((!\operand[0]~input_o\) # 
-- (\operand[1]~input_o\))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[3]~input_o\ & (!\operand[4]~input_o\ $ (\operand[0]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\ $ 
-- (\operand[0]~input_o\)) # (\operand[4]~input_o\))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[3]~input_o\ & \operand[4]~input_o\))))) # (\operand[1]~input_o\ & 
-- (\operand[3]~input_o\ & (!\operand[4]~input_o\ $ (!\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001100011000110001010001110100001111111101010001011111000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux3~3_combout\);

-- Location: LABCELL_X14_Y1_N12
\Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[4]~input_o\ & ((!\operand[0]~input_o\))) # (\operand[4]~input_o\ & ((\operand[0]~input_o\) # (\operand[3]~input_o\))))) # (\operand[1]~input_o\ & 
-- (!\operand[3]~input_o\ $ (((!\operand[4]~input_o\) # (\operand[0]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[1]~input_o\ $ (((\operand[0]~input_o\))))) # (\operand[4]~input_o\ & 
-- (!\operand[3]~input_o\ & ((!\operand[1]~input_o\) # (\operand[0]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (\operand[4]~input_o\)))) # 
-- (\operand[3]~input_o\ & (\operand[1]~input_o\ & ((!\operand[0]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[3]~input_o\ & (\operand[4]~input_o\ & \operand[0]~input_o\)) # 
-- (\operand[3]~input_o\ & (!\operand[4]~input_o\ & !\operand[0]~input_o\)))) # (\operand[1]~input_o\ & (((!\operand[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000001011000000100011000010010101000010111001011011000011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux3~1_combout\);

-- Location: LABCELL_X14_Y1_N48
\Mux3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[4]~input_o\ $ (((!\operand[1]~input_o\) # (\operand[0]~input_o\))))) # (\operand[3]~input_o\ & (((\operand[4]~input_o\ & !\operand[0]~input_o\)))) ) 
-- ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[4]~input_o\ & (\operand[1]~input_o\)) # (\operand[4]~input_o\ & ((!\operand[3]~input_o\))))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( 
-- (!\operand[4]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[1]~input_o\ & \operand[3]~input_o\))))) # (\operand[4]~input_o\ & (!\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (\operand[3]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (\operand[3]~input_o\ & (!\operand[1]~input_o\ $ (!\operand[0]~input_o\)))) # (\operand[4]~input_o\ & (((\operand[0]~input_o\)) # (\operand[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010100101111110110010010000001011100000000000100101100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux3~2_combout\);

-- Location: LABCELL_X14_Y1_N36
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (((!\operand[4]~input_o\ & !\operand[0]~input_o\)))) # (\operand[3]~input_o\ & (\operand[0]~input_o\ & ((!\operand[4]~input_o\) # (\operand[1]~input_o\)))) ) ) 
-- ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[3]~input_o\) # ((\operand[0]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\ & (!\operand[4]~input_o\ & \operand[0]~input_o\)) # 
-- (\operand[3]~input_o\ & (\operand[4]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[3]~input_o\ & ((!\operand[4]~input_o\) # (!\operand[0]~input_o\)))) # (\operand[1]~input_o\ & 
-- (!\operand[4]~input_o\ & ((!\operand[3]~input_o\) # (!\operand[0]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (((\operand[3]~input_o\ & \operand[0]~input_o\)) # (\operand[4]~input_o\))) # 
-- (\operand[1]~input_o\ & ((!\operand[3]~input_o\ & ((\operand[0]~input_o\))) # (\operand[3]~input_o\ & ((!\operand[4]~input_o\) # (!\operand[0]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101101111110011100100110000010001001111010111100000000110001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[1]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[0]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LABCELL_X14_Y1_N6
\Mux3~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~4_combout\ = ( \Mux3~0_combout\ & ( \operand[2]~input_o\ & ( (!\operand[6]~input_o\ & ((\Mux3~1_combout\))) # (\operand[6]~input_o\ & (\Mux3~3_combout\)) ) ) ) # ( !\Mux3~0_combout\ & ( \operand[2]~input_o\ & ( (!\operand[6]~input_o\ & 
-- ((\Mux3~1_combout\))) # (\operand[6]~input_o\ & (\Mux3~3_combout\)) ) ) ) # ( \Mux3~0_combout\ & ( !\operand[2]~input_o\ & ( (!\Mux3~2_combout\) # (!\operand[6]~input_o\) ) ) ) # ( !\Mux3~0_combout\ & ( !\operand[2]~input_o\ & ( (!\Mux3~2_combout\ & 
-- \operand[6]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000111111111111000000110011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~3_combout\,
	datab => \ALT_INV_Mux3~1_combout\,
	datac => \ALT_INV_Mux3~2_combout\,
	datad => \ALT_INV_operand[6]~input_o\,
	datae => \ALT_INV_Mux3~0_combout\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux3~4_combout\);

-- Location: FF_X14_Y1_N7
\rslt[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux3~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[4]~reg0_q\);

-- Location: MLABCELL_X13_Y1_N24
\Mux2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = ( \operand[3]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (\operand[0]~input_o\)) # (\operand[2]~input_o\ & ((\operand[1]~input_o\))) ) ) ) # ( !\operand[3]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ 
-- & ((!\operand[1]~input_o\ & ((\operand[2]~input_o\))) # (\operand[1]~input_o\ & (\operand[4]~input_o\)))) # (\operand[0]~input_o\ & (\operand[4]~input_o\)) ) ) ) # ( \operand[3]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & 
-- ((!\operand[1]~input_o\ & (!\operand[0]~input_o\)) # (\operand[1]~input_o\ & ((\operand[2]~input_o\))))) # (\operand[4]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[2]~input_o\) # (\operand[1]~input_o\))))) ) ) ) # ( !\operand[3]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[4]~input_o\) # (!\operand[2]~input_o\ $ (!\operand[1]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[2]~input_o\ & (!\operand[4]~input_o\ $ (\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010110011011000100111000001101100011101010101010011000000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~2_combout\);

-- Location: MLABCELL_X13_Y1_N30
\Mux2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~3_combout\ = ( \operand[3]~input_o\ & ( \operand[7]~input_o\ & ( (\operand[4]~input_o\ & ((!\operand[2]~input_o\ & ((!\operand[1]~input_o\))) # (\operand[2]~input_o\ & (\operand[0]~input_o\ & \operand[1]~input_o\)))) ) ) ) # ( !\operand[3]~input_o\ 
-- & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[0]~input_o\ & ((!\operand[1]~input_o\)))) # (\operand[4]~input_o\ & (((\operand[2]~input_o\)))) ) ) ) # ( \operand[3]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & 
-- (((!\operand[2]~input_o\ & !\operand[1]~input_o\)))) # (\operand[4]~input_o\ & ((!\operand[2]~input_o\ & (!\operand[0]~input_o\)) # (\operand[2]~input_o\ & ((!\operand[1]~input_o\))))) ) ) ) # ( !\operand[3]~input_o\ & ( !\operand[7]~input_o\ & ( 
-- (!\operand[0]~input_o\ & (((\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[4]~input_o\) # ((!\operand[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001011111110111001010100000010001101000001010101000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~3_combout\);

-- Location: MLABCELL_X13_Y1_N42
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \operand[3]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[1]~input_o\))) # (\operand[0]~input_o\ & (!\operand[4]~input_o\)))) # (\operand[2]~input_o\ & (!\operand[0]~input_o\ $ 
-- (((!\operand[4]~input_o\) # (\operand[1]~input_o\))))) ) ) ) # ( !\operand[3]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[4]~input_o\ & ((\operand[1]~input_o\) # (\operand[2]~input_o\)))) # (\operand[0]~input_o\ & 
-- (\operand[2]~input_o\ & (!\operand[4]~input_o\ $ (!\operand[1]~input_o\)))) ) ) ) # ( \operand[3]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[1]~input_o\ & ((!\operand[0]~input_o\) # (\operand[2]~input_o\)))) # 
-- (\operand[4]~input_o\ & (\operand[2]~input_o\ & (!\operand[0]~input_o\ $ (\operand[1]~input_o\)))) ) ) ) # ( !\operand[3]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[2]~input_o\ & (!\operand[4]~input_o\ $ 
-- (!\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[4]~input_o\ $ (!\operand[1]~input_o\)) # (\operand[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100101011100011100000000100001001100010100010011011100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: MLABCELL_X13_Y1_N18
\Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = ( \operand[3]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[1]~input_o\))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\) # (\operand[2]~input_o\))))) # (\operand[4]~input_o\ & 
-- (!\operand[2]~input_o\ & ((\operand[1]~input_o\) # (\operand[0]~input_o\)))) ) ) ) # ( !\operand[3]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[2]~input_o\ & ((\operand[1]~input_o\))) # (\operand[2]~input_o\ & 
-- ((!\operand[0]~input_o\) # (!\operand[1]~input_o\))))) # (\operand[4]~input_o\ & ((!\operand[0]~input_o\ & ((!\operand[1]~input_o\))) # (\operand[0]~input_o\ & (!\operand[2]~input_o\)))) ) ) ) # ( \operand[3]~input_o\ & ( !\operand[7]~input_o\ & ( 
-- (!\operand[4]~input_o\ & ((!\operand[0]~input_o\ & (!\operand[2]~input_o\)) # (\operand[0]~input_o\ & (\operand[2]~input_o\ & !\operand[1]~input_o\)))) # (\operand[4]~input_o\ & (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[2]~input_o\)))) ) 
-- ) ) # ( !\operand[3]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (((!\operand[2]~input_o\) # (\operand[1]~input_o\)))) # (\operand[0]~input_o\ & (\operand[4]~input_o\ & (!\operand[2]~input_o\ $ (\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000011001101100000101001010001011110101110000011001011011010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[2]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~1_combout\);

-- Location: MLABCELL_X13_Y1_N0
\Mux2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~4_combout\ = ( \operand[5]~input_o\ & ( \Mux2~1_combout\ & ( (!\operand[6]~input_o\ & (\Mux2~2_combout\)) # (\operand[6]~input_o\ & ((!\Mux2~3_combout\))) ) ) ) # ( !\operand[5]~input_o\ & ( \Mux2~1_combout\ & ( (\Mux2~0_combout\) # 
-- (\operand[6]~input_o\) ) ) ) # ( \operand[5]~input_o\ & ( !\Mux2~1_combout\ & ( (!\operand[6]~input_o\ & (\Mux2~2_combout\)) # (\operand[6]~input_o\ & ((!\Mux2~3_combout\))) ) ) ) # ( !\operand[5]~input_o\ & ( !\Mux2~1_combout\ & ( (!\operand[6]~input_o\ 
-- & \Mux2~0_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000010111000101110000001111111111110101110001011100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux2~2_combout\,
	datab => \ALT_INV_Mux2~3_combout\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_Mux2~0_combout\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_Mux2~1_combout\,
	combout => \Mux2~4_combout\);

-- Location: FF_X13_Y1_N2
\rslt[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux2~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[5]~reg0_q\);

-- Location: LABCELL_X9_Y1_N24
\Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~3_combout\ = ( \operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[5]~input_o\ & ((\operand[6]~input_o\)))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\ & (!\operand[5]~input_o\ $ (\operand[6]~input_o\)))) ) ) ) 
-- # ( !\operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (((\operand[0]~input_o\)) # (\operand[5]~input_o\))) # (\operand[1]~input_o\ & (((\operand[5]~input_o\ & \operand[0]~input_o\)) # (\operand[6]~input_o\))) ) ) ) # ( 
-- \operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[5]~input_o\ & (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (\operand[6]~input_o\)))) # (\operand[5]~input_o\ & ((!\operand[0]~input_o\ & (\operand[6]~input_o\ & \operand[1]~input_o\)) # 
-- (\operand[0]~input_o\ & ((\operand[1]~input_o\) # (\operand[6]~input_o\))))) ) ) ) # ( !\operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[5]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[1]~input_o\))) # (\operand[0]~input_o\ & 
-- ((!\operand[1]~input_o\) # (\operand[6]~input_o\))))) # (\operand[5]~input_o\ & ((!\operand[6]~input_o\ & (!\operand[0]~input_o\)) # (\operand[6]~input_o\ & ((!\operand[1]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011111001010000000011001011101110111000111110000010110000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[5]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[2]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~3_combout\);

-- Location: LABCELL_X9_Y1_N12
\Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = ( \operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[1]~input_o\ & (!\operand[5]~input_o\ $ (\operand[6]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[5]~input_o\ $ (((\operand[6]~input_o\ & 
-- \operand[1]~input_o\))))) ) ) ) # ( !\operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (((!\operand[1]~input_o\) # (\operand[6]~input_o\)))) # (\operand[0]~input_o\ & (\operand[6]~input_o\ & ((!\operand[5]~input_o\) # 
-- (!\operand[1]~input_o\)))) ) ) ) # ( \operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[5]~input_o\ & ((\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[6]~input_o\ & (\operand[5]~input_o\ & 
-- \operand[1]~input_o\)) # (\operand[6]~input_o\ & ((!\operand[1]~input_o\))))) ) ) ) # ( !\operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[5]~input_o\ $ (((!\operand[1]~input_o\) # (\operand[6]~input_o\))))) # 
-- (\operand[0]~input_o\ & (\operand[5]~input_o\ & (!\operand[6]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010010010100000000111001100011001111000011101010011000100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[5]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[2]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~1_combout\);

-- Location: LABCELL_X9_Y1_N48
\Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = ( \operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[5]~input_o\ & (!\operand[6]~input_o\ & ((!\operand[0]~input_o\) # (!\operand[1]~input_o\)))) # (\operand[5]~input_o\ & ((!\operand[6]~input_o\ $ (!\operand[1]~input_o\)))) ) 
-- ) ) # ( !\operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (((\operand[5]~input_o\ & \operand[6]~input_o\))))) ) ) ) # ( \operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[5]~input_o\ & 
-- ((!\operand[0]~input_o\ & (\operand[6]~input_o\)) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\))))) # (\operand[5]~input_o\ & (!\operand[0]~input_o\ & (!\operand[6]~input_o\ & !\operand[1]~input_o\))) ) ) ) # ( !\operand[2]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (!\operand[5]~input_o\ & (\operand[6]~input_o\ & ((!\operand[1]~input_o\) # (\operand[0]~input_o\)))) # (\operand[5]~input_o\ & (!\operand[0]~input_o\ $ ((!\operand[6]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111000010110011010100000100011001000000001001010010111010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[5]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[2]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~2_combout\);

-- Location: LABCELL_X9_Y1_N36
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[0]~input_o\ & (!\operand[5]~input_o\)) # (\operand[0]~input_o\ & ((!\operand[6]~input_o\))))) # (\operand[1]~input_o\ & ((!\operand[6]~input_o\ & 
-- ((!\operand[0]~input_o\))) # (\operand[6]~input_o\ & (\operand[5]~input_o\)))) ) ) ) # ( !\operand[2]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[5]~input_o\ & (\operand[0]~input_o\ & ((!\operand[1]~input_o\)))) # (\operand[5]~input_o\ & 
-- (\operand[1]~input_o\ & ((\operand[6]~input_o\) # (\operand[0]~input_o\)))) ) ) ) # ( \operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[5]~input_o\ & (!\operand[0]~input_o\)) # (\operand[5]~input_o\ & 
-- ((!\operand[1]~input_o\))))) # (\operand[6]~input_o\ & (\operand[0]~input_o\ & ((!\operand[1]~input_o\) # (\operand[5]~input_o\)))) ) ) ) # ( !\operand[2]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[1]~input_o\ & 
-- (\operand[5]~input_o\)) # (\operand[1]~input_o\ & ((\operand[0]~input_o\))))) # (\operand[6]~input_o\ & (((\operand[1]~input_o\) # (\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001100111111110100111000000100100010000101011011100011000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[5]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[2]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LABCELL_X9_Y1_N6
\Mux1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~4_combout\ = ( \Mux1~0_combout\ & ( \operand[3]~input_o\ & ( (!\operand[4]~input_o\ & ((\Mux1~1_combout\))) # (\operand[4]~input_o\ & (\Mux1~3_combout\)) ) ) ) # ( !\Mux1~0_combout\ & ( \operand[3]~input_o\ & ( (!\operand[4]~input_o\ & 
-- ((\Mux1~1_combout\))) # (\operand[4]~input_o\ & (\Mux1~3_combout\)) ) ) ) # ( \Mux1~0_combout\ & ( !\operand[3]~input_o\ & ( (!\Mux1~2_combout\) # (!\operand[4]~input_o\) ) ) ) # ( !\Mux1~0_combout\ & ( !\operand[3]~input_o\ & ( (!\Mux1~2_combout\ & 
-- \operand[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000111111111111000000110011010101010011001101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux1~3_combout\,
	datab => \ALT_INV_Mux1~1_combout\,
	datac => \ALT_INV_Mux1~2_combout\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_Mux1~0_combout\,
	dataf => \ALT_INV_operand[3]~input_o\,
	combout => \Mux1~4_combout\);

-- Location: FF_X9_Y1_N8
\rslt[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux1~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[6]~reg0_q\);

-- Location: MLABCELL_X13_Y1_N48
\Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = ( \operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[0]~input_o\ & (\operand[4]~input_o\)) # (\operand[0]~input_o\ & ((\operand[1]~input_o\))))) # (\operand[6]~input_o\ & (!\operand[0]~input_o\ $ 
-- (((\operand[4]~input_o\ & \operand[1]~input_o\))))) ) ) ) # ( !\operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[4]~input_o\ & (((\operand[1]~input_o\) # (\operand[0]~input_o\)))) # (\operand[4]~input_o\ & ((!\operand[6]~input_o\ & 
-- ((!\operand[1]~input_o\))) # (\operand[6]~input_o\ & ((!\operand[0]~input_o\) # (\operand[1]~input_o\))))) ) ) ) # ( \operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[6]~input_o\ & (\operand[4]~input_o\ & ((\operand[1]~input_o\) # 
-- (\operand[0]~input_o\)))) # (\operand[6]~input_o\ & (((!\operand[4]~input_o\ & !\operand[1]~input_o\)))) ) ) ) # ( !\operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[1]~input_o\ & ((!\operand[4]~input_o\) # 
-- (\operand[6]~input_o\)))) # (\operand[0]~input_o\ & (\operand[4]~input_o\ & (!\operand[6]~input_o\ $ (\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001011000101010100100000101000111110111101010100110001101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[6]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux0~2_combout\);

-- Location: MLABCELL_X13_Y1_N12
\Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = ( \operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[4]~input_o\ & (((\operand[0]~input_o\ & !\operand[1]~input_o\)))) # (\operand[4]~input_o\ & ((!\operand[0]~input_o\ $ (\operand[1]~input_o\)) # (\operand[6]~input_o\))) ) ) 
-- ) # ( !\operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[4]~input_o\ & (\operand[0]~input_o\ & \operand[1]~input_o\)) # (\operand[4]~input_o\ & ((!\operand[1]~input_o\))))) # (\operand[6]~input_o\ & 
-- ((!\operand[1]~input_o\) # ((!\operand[0]~input_o\ & \operand[4]~input_o\)))) ) ) ) # ( \operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[0]~input_o\))) # (\operand[1]~input_o\ & 
-- (\operand[6]~input_o\)))) # (\operand[4]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[6]~input_o\) # (\operand[0]~input_o\))))) ) ) ) # ( !\operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[6]~input_o\ & (\operand[0]~input_o\ & 
-- ((!\operand[1]~input_o\)))) # (\operand[6]~input_o\ & ((!\operand[0]~input_o\ & (!\operand[4]~input_o\ & \operand[1]~input_o\)) # (\operand[0]~input_o\ & (\operand[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001101000001001101000101101101011111001001000011110100000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[6]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux0~1_combout\);

-- Location: MLABCELL_X13_Y1_N54
\Mux0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = ( \operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[6]~input_o\ & ((!\operand[1]~input_o\) # (\operand[4]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ & ((!\operand[4]~input_o\))) # 
-- (\operand[1]~input_o\ & (\operand[6]~input_o\)))) ) ) ) # ( !\operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[0]~input_o\ & (!\operand[6]~input_o\ $ (\operand[4]~input_o\)))) # (\operand[1]~input_o\ & 
-- (!\operand[6]~input_o\ & ((!\operand[4]~input_o\)))) ) ) ) # ( \operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[6]~input_o\) # (!\operand[4]~input_o\))))) # (\operand[1]~input_o\ & 
-- ((!\operand[6]~input_o\) # ((\operand[0]~input_o\ & \operand[4]~input_o\)))) ) ) ) # ( !\operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[1]~input_o\ & ((!\operand[0]~input_o\) # (\operand[6]~input_o\)))) # 
-- (\operand[4]~input_o\ & (!\operand[6]~input_o\ & (\operand[0]~input_o\ & \operand[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101000000000010001101101010101110000100101000000111010000010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[6]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux0~3_combout\);

-- Location: MLABCELL_X13_Y1_N36
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (((\operand[4]~input_o\ & !\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ & (!\operand[6]~input_o\)) # (\operand[1]~input_o\ & 
-- ((!\operand[4]~input_o\))))) ) ) ) # ( !\operand[3]~input_o\ & ( \operand[2]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[6]~input_o\ $ ((!\operand[0]~input_o\)))) # (\operand[4]~input_o\ & (((!\operand[0]~input_o\ & !\operand[1]~input_o\)))) ) ) ) # 
-- ( \operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[6]~input_o\ $ (((\operand[4]~input_o\ & \operand[1]~input_o\))))) # (\operand[0]~input_o\ & ((!\operand[6]~input_o\) # ((!\operand[1]~input_o\)))) ) ) ) # ( 
-- !\operand[3]~input_o\ & ( !\operand[2]~input_o\ & ( (!\operand[4]~input_o\ & (((\operand[1]~input_o\)))) # (\operand[4]~input_o\ & ((!\operand[6]~input_o\ & (!\operand[0]~input_o\)) # (\operand[6]~input_o\ & (\operand[0]~input_o\ & 
-- \operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100011111001101110111010011001101100011000000010111000110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[6]~input_o\,
	datab => \ALT_INV_operand[0]~input_o\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_operand[1]~input_o\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_operand[2]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: MLABCELL_X13_Y1_N6
\Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = ( \Mux0~0_combout\ & ( \operand[7]~input_o\ & ( (!\operand[5]~input_o\ & (\Mux0~2_combout\)) # (\operand[5]~input_o\ & ((!\Mux0~3_combout\))) ) ) ) # ( !\Mux0~0_combout\ & ( \operand[7]~input_o\ & ( (!\operand[5]~input_o\ & 
-- (\Mux0~2_combout\)) # (\operand[5]~input_o\ & ((!\Mux0~3_combout\))) ) ) ) # ( \Mux0~0_combout\ & ( !\operand[7]~input_o\ & ( (!\operand[5]~input_o\) # (\Mux0~1_combout\) ) ) ) # ( !\Mux0~0_combout\ & ( !\operand[7]~input_o\ & ( (\Mux0~1_combout\ & 
-- \operand[5]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110011111111110011001101010101111100000101010111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~2_combout\,
	datab => \ALT_INV_Mux0~1_combout\,
	datac => \ALT_INV_Mux0~3_combout\,
	datad => \ALT_INV_operand[5]~input_o\,
	datae => \ALT_INV_Mux0~0_combout\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux0~4_combout\);

-- Location: FF_X13_Y1_N8
\rslt[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Mux0~4_combout\,
	clrn => \rst~input_o\,
	ena => \LessThan0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[7]~reg0_q\);

-- Location: LABCELL_X16_Y99_N0
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



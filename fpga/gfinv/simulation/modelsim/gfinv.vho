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

-- DATE "06/26/2019 16:43:39"

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
-- rslt[0]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[1]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[2]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[3]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[4]	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[5]	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[6]	=>  Location: PIN_J8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[7]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[0]	=>  Location: PIN_G6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[1]	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[2]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[3]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[7]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[5]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[4]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand[6]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \operand[0]~input_o\ : std_logic;
SIGNAL \operand[2]~input_o\ : std_logic;
SIGNAL \operand[1]~input_o\ : std_logic;
SIGNAL \operand[3]~input_o\ : std_logic;
SIGNAL \operand[5]~input_o\ : std_logic;
SIGNAL \operand[7]~input_o\ : std_logic;
SIGNAL \Mux7~2_combout\ : std_logic;
SIGNAL \Mux7~0_combout\ : std_logic;
SIGNAL \Mux7~1_combout\ : std_logic;
SIGNAL \operand[6]~input_o\ : std_logic;
SIGNAL \Mux7~3_combout\ : std_logic;
SIGNAL \operand[4]~input_o\ : std_logic;
SIGNAL \Mux7~4_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rslt[0]~reg0_q\ : std_logic;
SIGNAL \Mux6~1_combout\ : std_logic;
SIGNAL \Mux6~2_combout\ : std_logic;
SIGNAL \Mux6~3_combout\ : std_logic;
SIGNAL \Mux6~0_combout\ : std_logic;
SIGNAL \Mux6~4_combout\ : std_logic;
SIGNAL \rslt[1]~reg0_q\ : std_logic;
SIGNAL \Mux5~3_combout\ : std_logic;
SIGNAL \Mux5~1_combout\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
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
SIGNAL \Mux3~0_combout\ : std_logic;
SIGNAL \Mux3~1_combout\ : std_logic;
SIGNAL \Mux3~2_combout\ : std_logic;
SIGNAL \Mux3~4_combout\ : std_logic;
SIGNAL \rslt[4]~reg0_q\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \Mux2~3_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~4_combout\ : std_logic;
SIGNAL \rslt[5]~reg0_q\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Mux1~3_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~4_combout\ : std_logic;
SIGNAL \rslt[6]~reg0_q\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
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
\ALT_INV_Mux7~3_combout\ <= NOT \Mux7~3_combout\;
\ALT_INV_Mux7~2_combout\ <= NOT \Mux7~2_combout\;
\ALT_INV_Mux7~1_combout\ <= NOT \Mux7~1_combout\;
\ALT_INV_Mux7~0_combout\ <= NOT \Mux7~0_combout\;

-- Location: IOOBUF_X50_Y115_N53
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

-- Location: IOOBUF_X50_Y115_N2
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

-- Location: IOOBUF_X50_Y115_N19
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

-- Location: IOOBUF_X44_Y115_N53
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

-- Location: IOOBUF_X42_Y115_N53
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

-- Location: IOOBUF_X42_Y115_N36
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

-- Location: IOOBUF_X44_Y115_N19
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

-- Location: IOOBUF_X44_Y115_N2
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

-- Location: IOIBUF_X46_Y115_N52
\operand[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(0),
	o => \operand[0]~input_o\);

-- Location: IOIBUF_X46_Y115_N35
\operand[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(2),
	o => \operand[2]~input_o\);

-- Location: IOIBUF_X44_Y115_N35
\operand[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(1),
	o => \operand[1]~input_o\);

-- Location: IOIBUF_X48_Y115_N41
\operand[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(3),
	o => \operand[3]~input_o\);

-- Location: IOIBUF_X46_Y115_N1
\operand[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(5),
	o => \operand[5]~input_o\);

-- Location: IOIBUF_X48_Y115_N92
\operand[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(7),
	o => \operand[7]~input_o\);

-- Location: LABCELL_X47_Y114_N24
\Mux7~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~2_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (\operand[0]~input_o\ & ((!\operand[1]~input_o\) # (\operand[2]~input_o\)))) # (\operand[3]~input_o\ & ((!\operand[2]~input_o\ & (!\operand[0]~input_o\ & 
-- \operand[1]~input_o\)) # (\operand[2]~input_o\ & ((!\operand[1]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[1]~input_o\ & (\operand[2]~input_o\)) # (\operand[1]~input_o\ & 
-- ((!\operand[3]~input_o\))))) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\ & (!\operand[2]~input_o\)) # (\operand[3]~input_o\ & ((!\operand[1]~input_o\))))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & 
-- ((!\operand[3]~input_o\ & (\operand[2]~input_o\)) # (\operand[3]~input_o\ & ((\operand[1]~input_o\))))) # (\operand[0]~input_o\ & ((!\operand[2]~input_o\) # ((\operand[1]~input_o\ & !\operand[3]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (((\operand[1]~input_o\ & \operand[3]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[2]~input_o\ $ (((\operand[3]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000011011011001110100111001101110011100000101000100111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~2_combout\);

-- Location: LABCELL_X47_Y114_N42
\Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~0_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[0]~input_o\ & (!\operand[2]~input_o\ & \operand[3]~input_o\))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ ((\operand[2]~input_o\)))) ) ) ) # 
-- ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\) # ((!\operand[1]~input_o\ & \operand[3]~input_o\)))) # (\operand[0]~input_o\ & (((!\operand[2]~input_o\ & \operand[1]~input_o\)) # 
-- (\operand[3]~input_o\))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[0]~input_o\ & (\operand[1]~input_o\)) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\))))) # (\operand[2]~input_o\ & 
-- (\operand[3]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[1]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (((\operand[2]~input_o\ & !\operand[1]~input_o\)) # (\operand[3]~input_o\))) # 
-- (\operand[0]~input_o\ & (!\operand[1]~input_o\ & ((!\operand[2]~input_o\) # (!\operand[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000011101010010011000001101010001100111111010000100101001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~0_combout\);

-- Location: LABCELL_X47_Y114_N18
\Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~1_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[0]~input_o\) # ((!\operand[2]~input_o\ & !\operand[3]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[2]~input_o\ & ((\operand[3]~input_o\) # 
-- (\operand[0]~input_o\))) # (\operand[2]~input_o\ & ((!\operand[3]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( !\operand[0]~input_o\ $ (((!\operand[2]~input_o\ & ((!\operand[3]~input_o\))) # (\operand[2]~input_o\ & 
-- (!\operand[1]~input_o\ & \operand[3]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & (\operand[1]~input_o\)) # (\operand[2]~input_o\ & ((\operand[3]~input_o\))))) # 
-- (\operand[0]~input_o\ & ((!\operand[1]~input_o\ $ (\operand[3]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (\operand[3]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[1]~input_o\))) # (\operand[0]~input_o\ & 
-- (\operand[2]~input_o\ & !\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000011010010110000010111101100110100110101110011110101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~1_combout\);

-- Location: IOIBUF_X48_Y115_N75
\operand[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(6),
	o => \operand[6]~input_o\);

-- Location: LABCELL_X47_Y114_N0
\Mux7~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~3_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[3]~input_o\ $ (((!\operand[0]~input_o\) # (!\operand[1]~input_o\))))) # (\operand[2]~input_o\ & (((\operand[1]~input_o\ & \operand[3]~input_o\)))) ) 
-- ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[2]~input_o\ & ((\operand[3]~input_o\) # (\operand[1]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[2]~input_o\) # 
-- (!\operand[3]~input_o\))))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & (!\operand[1]~input_o\ $ (\operand[3]~input_o\))) # (\operand[2]~input_o\ & ((\operand[3]~input_o\) # 
-- (\operand[1]~input_o\))))) # (\operand[0]~input_o\ & (\operand[2]~input_o\ & (\operand[1]~input_o\ & \operand[3]~input_o\))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[3]~input_o\ & 
-- ((!\operand[0]~input_o\) # (\operand[1]~input_o\)))) # (\operand[2]~input_o\ & (\operand[0]~input_o\ & (!\operand[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001110000010000100000100010101100001101100111000000010011001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux7~3_combout\);

-- Location: IOIBUF_X46_Y115_N18
\operand[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand(4),
	o => \operand[4]~input_o\);

-- Location: LABCELL_X47_Y114_N30
\Mux7~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux7~4_combout\ = ( \Mux7~3_combout\ & ( \operand[4]~input_o\ & ( (\Mux7~1_combout\ & !\operand[6]~input_o\) ) ) ) # ( !\Mux7~3_combout\ & ( \operand[4]~input_o\ & ( (\operand[6]~input_o\) # (\Mux7~1_combout\) ) ) ) # ( \Mux7~3_combout\ & ( 
-- !\operand[4]~input_o\ & ( (!\operand[6]~input_o\ & ((\Mux7~0_combout\))) # (\operand[6]~input_o\ & (\Mux7~2_combout\)) ) ) ) # ( !\Mux7~3_combout\ & ( !\operand[4]~input_o\ & ( (!\operand[6]~input_o\ & ((\Mux7~0_combout\))) # (\operand[6]~input_o\ & 
-- (\Mux7~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001101010101001100110101010100001111111111110000111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux7~2_combout\,
	datab => \ALT_INV_Mux7~0_combout\,
	datac => \ALT_INV_Mux7~1_combout\,
	datad => \ALT_INV_operand[6]~input_o\,
	datae => \ALT_INV_Mux7~3_combout\,
	dataf => \ALT_INV_operand[4]~input_o\,
	combout => \Mux7~4_combout\);

-- Location: IOIBUF_X48_Y115_N58
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X47_Y114_N31
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[0]~reg0_q\);

-- Location: LABCELL_X48_Y114_N18
\Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~1_combout\ = ( \operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[0]~input_o\) # ((!\operand[4]~input_o\)))) # (\operand[1]~input_o\ & (\operand[3]~input_o\ & ((!\operand[0]~input_o\) # (\operand[4]~input_o\)))) ) 
-- ) ) # ( !\operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (((!\operand[4]~input_o\)) # (\operand[0]~input_o\))) # (\operand[3]~input_o\ & ((!\operand[4]~input_o\ & (\operand[0]~input_o\)) # (\operand[4]~input_o\ & 
-- ((!\operand[1]~input_o\))))) ) ) ) # ( \operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[4]~input_o\))) # (\operand[0]~input_o\ & (\operand[1]~input_o\)))) # (\operand[3]~input_o\ & 
-- (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (\operand[4]~input_o\)))) ) ) ) # ( !\operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[3]~input_o\ & ((\operand[4]~input_o\))) # (\operand[3]~input_o\ & 
-- ((!\operand[1]~input_o\) # (!\operand[4]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001010101000000001101000110111011101011101001111001010100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_operand[6]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~1_combout\);

-- Location: LABCELL_X48_Y114_N24
\Mux6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~2_combout\ = ( \operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[0]~input_o\ $ (((\operand[1]~input_o\) # (\operand[3]~input_o\))))) # (\operand[4]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[1]~input_o\))) # 
-- (\operand[0]~input_o\ & (\operand[3]~input_o\)))) ) ) ) # ( !\operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (\operand[4]~input_o\)))) # (\operand[3]~input_o\ & 
-- ((!\operand[1]~input_o\ $ (!\operand[4]~input_o\)))) ) ) ) # ( \operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (\operand[3]~input_o\)))) # (\operand[4]~input_o\ & 
-- (((!\operand[3]~input_o\)))) ) ) ) # ( !\operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (((!\operand[1]~input_o\) # (!\operand[4]~input_o\)))) # (\operand[3]~input_o\ & (!\operand[1]~input_o\ $ (((\operand[0]~input_o\ & 
-- \operand[4]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110011100001100100001100110010000011011100001001010100011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_operand[6]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~2_combout\);

-- Location: LABCELL_X48_Y114_N30
\Mux6~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~3_combout\ = ( \operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[3]~input_o\ & (\operand[0]~input_o\)) # (\operand[3]~input_o\ & ((!\operand[1]~input_o\))))) # (\operand[4]~input_o\ & (\operand[0]~input_o\ & 
-- ((\operand[1]~input_o\)))) ) ) ) # ( !\operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[1]~input_o\ & ((!\operand[4]~input_o\) # (\operand[3]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[4]~input_o\ & 
-- (!\operand[3]~input_o\ $ (!\operand[1]~input_o\)))) ) ) ) # ( \operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (((!\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\ & ((!\operand[4]~input_o\) # 
-- (\operand[1]~input_o\))) # (\operand[3]~input_o\ & ((!\operand[1]~input_o\) # (\operand[4]~input_o\))))) ) ) ) # ( !\operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[0]~input_o\)) # (\operand[3]~input_o\ & 
-- (\operand[4]~input_o\ & ((\operand[1]~input_o\) # (\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000100010011011111101001011010110110100001000000111010000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_operand[6]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~3_combout\);

-- Location: LABCELL_X48_Y114_N42
\Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~0_combout\ = ( \operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[1]~input_o\ & ((!\operand[4]~input_o\))) # (\operand[1]~input_o\ & (\operand[3]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[3]~input_o\ $ 
-- (((!\operand[1]~input_o\) # (!\operand[4]~input_o\))))) ) ) ) # ( !\operand[6]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[3]~input_o\ & (!\operand[1]~input_o\ & !\operand[4]~input_o\)) # (\operand[3]~input_o\ & 
-- (!\operand[1]~input_o\ $ (!\operand[4]~input_o\))))) # (\operand[0]~input_o\ & (!\operand[3]~input_o\ & ((\operand[4]~input_o\)))) ) ) ) # ( \operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( !\operand[3]~input_o\ $ ((((!\operand[0]~input_o\ & 
-- \operand[4]~input_o\)) # (\operand[1]~input_o\))) ) ) ) # ( !\operand[6]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[3]~input_o\ & (\operand[1]~input_o\ & !\operand[4]~input_o\))) # (\operand[0]~input_o\ & 
-- (((!\operand[1]~input_o\ & \operand[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100001010000110000110110001110000010011001001011001100010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_operand[6]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux6~0_combout\);

-- Location: LABCELL_X48_Y114_N0
\Mux6~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux6~4_combout\ = ( \operand[5]~input_o\ & ( \Mux6~0_combout\ & ( (!\operand[2]~input_o\ & (!\Mux6~2_combout\)) # (\operand[2]~input_o\ & ((!\Mux6~3_combout\))) ) ) ) # ( !\operand[5]~input_o\ & ( \Mux6~0_combout\ & ( (!\Mux6~1_combout\) # 
-- (!\operand[2]~input_o\) ) ) ) # ( \operand[5]~input_o\ & ( !\Mux6~0_combout\ & ( (!\operand[2]~input_o\ & (!\Mux6~2_combout\)) # (\operand[2]~input_o\ & ((!\Mux6~3_combout\))) ) ) ) # ( !\operand[5]~input_o\ & ( !\Mux6~0_combout\ & ( (!\Mux6~1_combout\ & 
-- \operand[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000100010111100111100000011101110111011101111001111000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux6~1_combout\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_Mux6~2_combout\,
	datad => \ALT_INV_Mux6~3_combout\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_Mux6~0_combout\,
	combout => \Mux6~4_combout\);

-- Location: FF_X48_Y114_N1
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[1]~reg0_q\);

-- Location: LABCELL_X48_Y114_N54
\Mux5~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~3_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[1]~input_o\) # (\operand[3]~input_o\))))) # (\operand[2]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[3]~input_o\))) # 
-- (\operand[0]~input_o\ & (!\operand[1]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (\operand[1]~input_o\ & (!\operand[3]~input_o\ $ (((!\operand[0]~input_o\ & !\operand[2]~input_o\))))) ) ) ) # ( \operand[5]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (\operand[3]~input_o\ & ((!\operand[0]~input_o\ $ (!\operand[1]~input_o\)) # (\operand[2]~input_o\))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (\operand[0]~input_o\ & 
-- (\operand[1]~input_o\ & !\operand[3]~input_o\))) # (\operand[2]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[3]~input_o\))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000110010000000000111101100000111000010000101100001110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux5~3_combout\);

-- Location: LABCELL_X48_Y114_N12
\Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~1_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[2]~input_o\ & (!\operand[1]~input_o\ & !\operand[3]~input_o\))) # (\operand[0]~input_o\ & (!\operand[2]~input_o\ $ ((!\operand[1]~input_o\)))) ) ) ) 
-- # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[1]~input_o\ & ((!\operand[2]~input_o\) # (!\operand[3]~input_o\)))) # (\operand[0]~input_o\ & (\operand[2]~input_o\ & ((\operand[3]~input_o\)))) ) ) ) # ( 
-- \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[1]~input_o\) # ((\operand[0]~input_o\ & \operand[3]~input_o\)))) # (\operand[2]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[1]~input_o\ $ (\operand[3]~input_o\)))) 
-- ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[3]~input_o\) # (!\operand[0]~input_o\ $ (\operand[1]~input_o\)))) # (\operand[2]~input_o\ & (((!\operand[0]~input_o\ & !\operand[1]~input_o\)) # 
-- (\operand[3]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110110010110111110100101110010110100000100100010011010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux5~1_combout\);

-- Location: LABCELL_X48_Y114_N36
\Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (\operand[0]~input_o\ & !\operand[1]~input_o\) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[3]~input_o\ & (!\operand[0]~input_o\)) 
-- # (\operand[3]~input_o\ & ((!\operand[1]~input_o\))))) # (\operand[2]~input_o\ & (!\operand[3]~input_o\ $ (((!\operand[0]~input_o\) # (!\operand[1]~input_o\))))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & 
-- (!\operand[2]~input_o\ $ (!\operand[1]~input_o\ $ (\operand[3]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[3]~input_o\))) # (\operand[1]~input_o\ & ((!\operand[2]~input_o\) # (!\operand[3]~input_o\))))) ) ) ) # ( 
-- !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[2]~input_o\ $ (\operand[1]~input_o\)))) # (\operand[3]~input_o\ & (\operand[0]~input_o\ & (!\operand[2]~input_o\ $ (!\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100001100010100001011011101011010001001111100100101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: LABCELL_X48_Y114_N48
\Mux5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~2_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & ((\operand[3]~input_o\))) # (\operand[2]~input_o\ & (\operand[1]~input_o\)))) # (\operand[0]~input_o\ & (((\operand[1]~input_o\ & 
-- !\operand[3]~input_o\)) # (\operand[2]~input_o\))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & ((!\operand[1]~input_o\) # (\operand[3]~input_o\))) # (\operand[2]~input_o\ & 
-- (\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ $ (\operand[3]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[2]~input_o\ & 
-- !\operand[3]~input_o\))))) # (\operand[0]~input_o\ & (\operand[1]~input_o\ & ((!\operand[2]~input_o\) # (\operand[3]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[2]~input_o\ $ 
-- (((!\operand[1]~input_o\ & !\operand[3]~input_o\))))) # (\operand[0]~input_o\ & (\operand[3]~input_o\ & (!\operand[2]~input_o\ $ (\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100011001001001011001010010111010010100011110001011110011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux5~2_combout\);

-- Location: LABCELL_X48_Y114_N6
\Mux5~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux5~4_combout\ = ( \Mux5~0_combout\ & ( \Mux5~2_combout\ & ( (\operand[4]~input_o\ & ((!\operand[6]~input_o\ & ((!\Mux5~1_combout\))) # (\operand[6]~input_o\ & (\Mux5~3_combout\)))) ) ) ) # ( !\Mux5~0_combout\ & ( \Mux5~2_combout\ & ( 
-- (!\operand[6]~input_o\ & (((!\Mux5~1_combout\) # (!\operand[4]~input_o\)))) # (\operand[6]~input_o\ & (\Mux5~3_combout\ & ((\operand[4]~input_o\)))) ) ) ) # ( \Mux5~0_combout\ & ( !\Mux5~2_combout\ & ( (!\operand[6]~input_o\ & (((!\Mux5~1_combout\ & 
-- \operand[4]~input_o\)))) # (\operand[6]~input_o\ & (((!\operand[4]~input_o\)) # (\Mux5~3_combout\))) ) ) ) # ( !\Mux5~0_combout\ & ( !\Mux5~2_combout\ & ( (!\operand[4]~input_o\) # ((!\operand[6]~input_o\ & ((!\Mux5~1_combout\))) # (\operand[6]~input_o\ & 
-- (\Mux5~3_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111000101000011111100010111110000110001010000000011000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux5~3_combout\,
	datab => \ALT_INV_Mux5~1_combout\,
	datac => \ALT_INV_operand[6]~input_o\,
	datad => \ALT_INV_operand[4]~input_o\,
	datae => \ALT_INV_Mux5~0_combout\,
	dataf => \ALT_INV_Mux5~2_combout\,
	combout => \Mux5~4_combout\);

-- Location: FF_X48_Y114_N7
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[2]~reg0_q\);

-- Location: LABCELL_X47_Y114_N48
\Mux4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~2_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[3]~input_o\)))) # (\operand[2]~input_o\ & (\operand[3]~input_o\ & (!\operand[0]~input_o\ $ 
-- (\operand[1]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[2]~input_o\ & (\operand[1]~input_o\ & \operand[3]~input_o\))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ $ 
-- (\operand[3]~input_o\)) # (\operand[2]~input_o\))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( !\operand[1]~input_o\ $ (((!\operand[0]~input_o\ & ((!\operand[2]~input_o\) # (\operand[3]~input_o\))) # (\operand[0]~input_o\ & 
-- ((!\operand[3]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[2]~input_o\ & (\operand[1]~input_o\))) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\ & ((!\operand[1]~input_o\))) # 
-- (\operand[3]~input_o\ & (!\operand[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101100001001100001011010101101001010001000101110100000010100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux4~2_combout\);

-- Location: LABCELL_X47_Y114_N12
\Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~1_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[2]~input_o\) # (!\operand[0]~input_o\ $ (!\operand[3]~input_o\)))) # (\operand[1]~input_o\ & (\operand[3]~input_o\ & (!\operand[0]~input_o\ $ 
-- (\operand[2]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (\operand[1]~input_o\ & (!\operand[3]~input_o\ $ (((\operand[2]~input_o\) # (\operand[0]~input_o\))))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( 
-- (!\operand[1]~input_o\ & ((!\operand[2]~input_o\ $ (!\operand[3]~input_o\)))) # (\operand[1]~input_o\ & (\operand[2]~input_o\ & ((!\operand[0]~input_o\) # (\operand[3]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( 
-- (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & ((\operand[3]~input_o\) # (\operand[1]~input_o\))) # (\operand[2]~input_o\ & (!\operand[1]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[2]~input_o\ $ (!\operand[1]~input_o\ $ 
-- (!\operand[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100110111100001100101100001100001000000001111101000011101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux4~1_combout\);

-- Location: LABCELL_X47_Y114_N6
\Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~0_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[2]~input_o\ & ((!\operand[3]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[3]~input_o\) # ((\operand[2]~input_o\ & \operand[1]~input_o\)))) ) ) 
-- ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (((\operand[2]~input_o\ & \operand[3]~input_o\)) # (\operand[1]~input_o\))) # (\operand[0]~input_o\ & (!\operand[2]~input_o\ $ ((\operand[1]~input_o\)))) ) ) ) # ( 
-- \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[3]~input_o\))) # (\operand[1]~input_o\ & (\operand[0]~input_o\ & !\operand[3]~input_o\)))) # (\operand[2]~input_o\ & ((!\operand[3]~input_o\ & 
-- ((!\operand[1]~input_o\))) # (\operand[3]~input_o\ & (!\operand[0]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (((!\operand[3]~input_o\)))) # (\operand[1]~input_o\ & (\operand[0]~input_o\ & 
-- (!\operand[2]~input_o\ $ (\operand[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111010000000001001101001110001001001011011010110111011100000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux4~0_combout\);

-- Location: LABCELL_X47_Y114_N54
\Mux4~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~3_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[2]~input_o\ & ((\operand[3]~input_o\) # (\operand[0]~input_o\)))) # (\operand[1]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[3]~input_o\))))) ) 
-- ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[0]~input_o\ & ((!\operand[2]~input_o\) # (!\operand[1]~input_o\)))) # (\operand[3]~input_o\ & (!\operand[2]~input_o\ $ (((!\operand[0]~input_o\) # 
-- (!\operand[1]~input_o\))))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[0]~input_o\ $ ((\operand[1]~input_o\)))) # (\operand[2]~input_o\ & (((!\operand[3]~input_o\) # (\operand[1]~input_o\)) # 
-- (\operand[0]~input_o\))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[2]~input_o\ & ((!\operand[3]~input_o\) # (\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[2]~input_o\ & 
-- (\operand[1]~input_o\ & !\operand[3]~input_o\)) # (\operand[2]~input_o\ & (!\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1001110000011000101101111001011110101000001101100001010100111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux4~3_combout\);

-- Location: LABCELL_X47_Y114_N36
\Mux4~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux4~4_combout\ = ( \Mux4~3_combout\ & ( \operand[6]~input_o\ & ( (\operand[4]~input_o\) # (\Mux4~2_combout\) ) ) ) # ( !\Mux4~3_combout\ & ( \operand[6]~input_o\ & ( (\Mux4~2_combout\ & !\operand[4]~input_o\) ) ) ) # ( \Mux4~3_combout\ & ( 
-- !\operand[6]~input_o\ & ( (!\operand[4]~input_o\ & ((!\Mux4~0_combout\))) # (\operand[4]~input_o\ & (!\Mux4~1_combout\)) ) ) ) # ( !\Mux4~3_combout\ & ( !\operand[6]~input_o\ & ( (!\operand[4]~input_o\ & ((!\Mux4~0_combout\))) # (\operand[4]~input_o\ & 
-- (!\Mux4~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111110000001100111111000000110001010000010100000101111101011111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux4~2_combout\,
	datab => \ALT_INV_Mux4~1_combout\,
	datac => \ALT_INV_operand[4]~input_o\,
	datad => \ALT_INV_Mux4~0_combout\,
	datae => \ALT_INV_Mux4~3_combout\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux4~4_combout\);

-- Location: FF_X47_Y114_N37
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[3]~reg0_q\);

-- Location: LABCELL_X45_Y114_N0
\Mux3~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~3_combout\ = ( \operand[0]~input_o\ & ( \operand[1]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[3]~input_o\ & ((\operand[7]~input_o\))) # (\operand[3]~input_o\ & ((!\operand[5]~input_o\) # (!\operand[7]~input_o\))))) # (\operand[4]~input_o\ & 
-- ((!\operand[5]~input_o\ $ (!\operand[7]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( \operand[1]~input_o\ & ( (!\operand[4]~input_o\ & (\operand[5]~input_o\ & (!\operand[3]~input_o\ $ (\operand[7]~input_o\)))) # (\operand[4]~input_o\ & 
-- (((\operand[7]~input_o\) # (\operand[5]~input_o\)) # (\operand[3]~input_o\))) ) ) ) # ( \operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[4]~input_o\ $ (((!\operand[7]~input_o\))))) # (\operand[3]~input_o\ & 
-- (\operand[7]~input_o\ & (!\operand[4]~input_o\ $ (\operand[5]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[7]~input_o\ & ((!\operand[3]~input_o\ & (!\operand[4]~input_o\)) # (\operand[3]~input_o\ & 
-- ((!\operand[5]~input_o\))))) # (\operand[7]~input_o\ & (\operand[4]~input_o\ & ((!\operand[5]~input_o\) # (\operand[3]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011100001010001010001001010100100011101010101110010011111111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[5]~input_o\,
	datad => \ALT_INV_operand[7]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[1]~input_o\,
	combout => \Mux3~3_combout\);

-- Location: LABCELL_X45_Y114_N42
\Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~0_combout\ = ( \operand[0]~input_o\ & ( \operand[1]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[4]~input_o\ & ((!\operand[5]~input_o\) # (!\operand[7]~input_o\))) # (\operand[4]~input_o\ & (!\operand[5]~input_o\ & !\operand[7]~input_o\)))) # 
-- (\operand[3]~input_o\ & (!\operand[7]~input_o\ $ (((\operand[5]~input_o\) # (\operand[4]~input_o\))))) ) ) ) # ( !\operand[0]~input_o\ & ( \operand[1]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[3]~input_o\ & (\operand[5]~input_o\)) # 
-- (\operand[3]~input_o\ & ((!\operand[7]~input_o\))))) # (\operand[4]~input_o\ & (\operand[3]~input_o\ & (!\operand[5]~input_o\))) ) ) ) # ( \operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[4]~input_o\ & (((!\operand[5]~input_o\ & 
-- \operand[7]~input_o\)) # (\operand[3]~input_o\))) # (\operand[4]~input_o\ & (((!\operand[5]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[4]~input_o\ & ((\operand[7]~input_o\))) # 
-- (\operand[4]~input_o\ & (!\operand[5]~input_o\)))) # (\operand[3]~input_o\ & (!\operand[7]~input_o\ & ((\operand[5]~input_o\) # (\operand[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101001111001000011100101111001000111010000110001110100010010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[5]~input_o\,
	datad => \ALT_INV_operand[7]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[1]~input_o\,
	combout => \Mux3~0_combout\);

-- Location: LABCELL_X45_Y114_N48
\Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~1_combout\ = ( \operand[0]~input_o\ & ( \operand[1]~input_o\ & ( (!\operand[3]~input_o\ & (!\operand[5]~input_o\ $ (((\operand[4]~input_o\ & !\operand[7]~input_o\))))) # (\operand[3]~input_o\ & ((!\operand[5]~input_o\ & (!\operand[4]~input_o\)) # 
-- (\operand[5]~input_o\ & ((\operand[7]~input_o\))))) ) ) ) # ( !\operand[0]~input_o\ & ( \operand[1]~input_o\ & ( (!\operand[5]~input_o\ & (!\operand[4]~input_o\ & ((!\operand[7]~input_o\)))) # (\operand[5]~input_o\ & (!\operand[3]~input_o\ $ 
-- (((!\operand[4]~input_o\) # (!\operand[7]~input_o\))))) ) ) ) # ( \operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[4]~input_o\ & (!\operand[3]~input_o\ & (\operand[5]~input_o\ & !\operand[7]~input_o\))) # (\operand[4]~input_o\ & 
-- ((!\operand[5]~input_o\ & (!\operand[3]~input_o\)) # (\operand[5]~input_o\ & ((\operand[7]~input_o\))))) ) ) ) # ( !\operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[4]~input_o\ & (((\operand[3]~input_o\ & !\operand[5]~input_o\)) # 
-- (\operand[7]~input_o\))) # (\operand[4]~input_o\ & (\operand[7]~input_o\ & (!\operand[3]~input_o\ $ (\operand[5]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000011101011010010000100010110100011000001101010010011100011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[5]~input_o\,
	datad => \ALT_INV_operand[7]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[1]~input_o\,
	combout => \Mux3~1_combout\);

-- Location: LABCELL_X45_Y114_N54
\Mux3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~2_combout\ = ( \operand[0]~input_o\ & ( \operand[1]~input_o\ & ( (\operand[4]~input_o\ & ((!\operand[5]~input_o\ & ((!\operand[7]~input_o\))) # (\operand[5]~input_o\ & (!\operand[3]~input_o\ & \operand[7]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ 
-- & ( \operand[1]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[4]~input_o\ & ((\operand[7]~input_o\) # (\operand[5]~input_o\))) # (\operand[4]~input_o\ & (!\operand[5]~input_o\)))) # (\operand[3]~input_o\ & ((!\operand[7]~input_o\) # 
-- (!\operand[4]~input_o\ $ (\operand[5]~input_o\)))) ) ) ) # ( \operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[4]~input_o\ & (\operand[3]~input_o\ & ((!\operand[7]~input_o\)))) # (\operand[4]~input_o\ & ((!\operand[5]~input_o\ & 
-- ((!\operand[7]~input_o\))) # (\operand[5]~input_o\ & (!\operand[3]~input_o\ & \operand[7]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( !\operand[1]~input_o\ & ( (!\operand[7]~input_o\ & (((!\operand[3]~input_o\ & \operand[5]~input_o\)))) # 
-- (\operand[7]~input_o\ & (\operand[4]~input_o\ & ((!\operand[3]~input_o\) # (\operand[5]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000110001000101011100100000010001111011111010010101000000000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[3]~input_o\,
	datac => \ALT_INV_operand[5]~input_o\,
	datad => \ALT_INV_operand[7]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[1]~input_o\,
	combout => \Mux3~2_combout\);

-- Location: LABCELL_X45_Y114_N30
\Mux3~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux3~4_combout\ = ( \Mux3~2_combout\ & ( \operand[6]~input_o\ & ( (\Mux3~3_combout\ & \operand[2]~input_o\) ) ) ) # ( !\Mux3~2_combout\ & ( \operand[6]~input_o\ & ( (!\operand[2]~input_o\) # (\Mux3~3_combout\) ) ) ) # ( \Mux3~2_combout\ & ( 
-- !\operand[6]~input_o\ & ( (!\operand[2]~input_o\ & (\Mux3~0_combout\)) # (\operand[2]~input_o\ & ((\Mux3~1_combout\))) ) ) ) # ( !\Mux3~2_combout\ & ( !\operand[6]~input_o\ & ( (!\operand[2]~input_o\ & (\Mux3~0_combout\)) # (\operand[2]~input_o\ & 
-- ((\Mux3~1_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100001111001100110000111111111111010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux3~3_combout\,
	datab => \ALT_INV_Mux3~0_combout\,
	datac => \ALT_INV_Mux3~1_combout\,
	datad => \ALT_INV_operand[2]~input_o\,
	datae => \ALT_INV_Mux3~2_combout\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux3~4_combout\);

-- Location: FF_X45_Y114_N32
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[4]~reg0_q\);

-- Location: LABCELL_X45_Y114_N18
\Mux2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = ( \operand[0]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[3]~input_o\ & (\operand[4]~input_o\)) # (\operand[3]~input_o\ & (((!\operand[2]~input_o\) # (\operand[1]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( 
-- \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (((\operand[2]~input_o\ & !\operand[3]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\ & (\operand[4]~input_o\)) # (\operand[3]~input_o\ & ((\operand[2]~input_o\))))) ) ) ) # ( 
-- \operand[0]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[4]~input_o\ $ (((\operand[3]~input_o\) # (\operand[1]~input_o\))))) # (\operand[2]~input_o\ & (((\operand[1]~input_o\ & \operand[3]~input_o\)))) ) ) ) # ( 
-- !\operand[0]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[1]~input_o\ & (!\operand[4]~input_o\)) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\))))) # (\operand[2]~input_o\ & ((!\operand[4]~input_o\) # 
-- ((!\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011111010110010100001000100011100110101000000110101010111001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~2_combout\);

-- Location: LABCELL_X45_Y114_N12
\Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = ( \operand[0]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[2]~input_o\ & (!\operand[1]~input_o\ $ (!\operand[3]~input_o\))) # (\operand[2]~input_o\ & ((!\operand[1]~input_o\) # (\operand[3]~input_o\))))) # 
-- (\operand[4]~input_o\ & (!\operand[2]~input_o\)) ) ) ) # ( !\operand[0]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[4]~input_o\) # (\operand[3]~input_o\))))) # (\operand[2]~input_o\ & 
-- ((!\operand[1]~input_o\ & ((!\operand[3]~input_o\))) # (\operand[1]~input_o\ & (!\operand[4]~input_o\)))) ) ) ) # ( \operand[0]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (\operand[2]~input_o\ & (!\operand[1]~input_o\ & 
-- \operand[3]~input_o\))) # (\operand[4]~input_o\ & ((!\operand[2]~input_o\ & (!\operand[1]~input_o\ $ (\operand[3]~input_o\))) # (\operand[2]~input_o\ & (\operand[1]~input_o\ & !\operand[3]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( 
-- !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[4]~input_o\) # ((!\operand[3]~input_o\)))) # (\operand[2]~input_o\ & (\operand[1]~input_o\ & ((!\operand[3]~input_o\) # (\operand[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100111110001001010000010010010001111010000011100110110011100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~1_combout\);

-- Location: LABCELL_X45_Y114_N24
\Mux2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~3_combout\ = ( \operand[0]~input_o\ & ( \operand[7]~input_o\ & ( (\operand[4]~input_o\ & (!\operand[2]~input_o\ $ (((!\operand[3]~input_o\) # (\operand[1]~input_o\))))) ) ) ) # ( !\operand[0]~input_o\ & ( \operand[7]~input_o\ & ( 
-- (!\operand[4]~input_o\ & (((!\operand[1]~input_o\ & !\operand[3]~input_o\)))) # (\operand[4]~input_o\ & ((!\operand[2]~input_o\ & (!\operand[1]~input_o\ & \operand[3]~input_o\)) # (\operand[2]~input_o\ & ((!\operand[3]~input_o\))))) ) ) ) # ( 
-- \operand[0]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[4]~input_o\) # ((!\operand[2]~input_o\)))) # (\operand[3]~input_o\ & (!\operand[1]~input_o\ & (!\operand[4]~input_o\ $ (\operand[2]~input_o\)))) ) ) ) # ( 
-- !\operand[0]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (\operand[3]~input_o\ & ((!\operand[2]~input_o\) # (\operand[4]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\) # ((\operand[4]~input_o\ & 
-- !\operand[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111010100111011101001000010110001010000000001000101000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~3_combout\);

-- Location: LABCELL_X45_Y114_N6
\Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = ( \operand[0]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & (((\operand[2]~input_o\ & \operand[1]~input_o\)) # (\operand[3]~input_o\))) # (\operand[4]~input_o\ & (\operand[2]~input_o\ & (!\operand[1]~input_o\ $ 
-- (\operand[3]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[2]~input_o\ & (\operand[1]~input_o\)) # (\operand[2]~input_o\ & ((!\operand[3]~input_o\))))) # (\operand[4]~input_o\ & 
-- (\operand[3]~input_o\ & (!\operand[2]~input_o\ $ (!\operand[1]~input_o\)))) ) ) ) # ( \operand[0]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & ((!\operand[1]~input_o\ & (\operand[2]~input_o\)) # (\operand[1]~input_o\ & 
-- ((!\operand[3]~input_o\))))) # (\operand[4]~input_o\ & ((!\operand[1]~input_o\ & ((!\operand[3]~input_o\))) # (\operand[1]~input_o\ & (\operand[2]~input_o\)))) ) ) ) # ( !\operand[0]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[4]~input_o\ & 
-- ((!\operand[1]~input_o\ & ((\operand[3]~input_o\))) # (\operand[1]~input_o\ & (\operand[2]~input_o\ & !\operand[3]~input_o\)))) # (\operand[4]~input_o\ & (\operand[2]~input_o\ & (!\operand[1]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001001010110000011110110010000100101010000111000001001010101011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[4]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[0]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LABCELL_X45_Y114_N36
\Mux2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux2~4_combout\ = ( \operand[5]~input_o\ & ( \operand[6]~input_o\ & ( !\Mux2~3_combout\ ) ) ) # ( !\operand[5]~input_o\ & ( \operand[6]~input_o\ & ( \Mux2~1_combout\ ) ) ) # ( \operand[5]~input_o\ & ( !\operand[6]~input_o\ & ( \Mux2~2_combout\ ) ) ) # ( 
-- !\operand[5]~input_o\ & ( !\operand[6]~input_o\ & ( \Mux2~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111010101010101010100110011001100111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux2~2_combout\,
	datab => \ALT_INV_Mux2~1_combout\,
	datac => \ALT_INV_Mux2~3_combout\,
	datad => \ALT_INV_Mux2~0_combout\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux2~4_combout\);

-- Location: FF_X45_Y114_N37
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[5]~reg0_q\);

-- Location: MLABCELL_X46_Y114_N18
\Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & ((!\operand[1]~input_o\) # (\operand[6]~input_o\))) # (\operand[2]~input_o\ & (!\operand[1]~input_o\ & \operand[6]~input_o\)))) # 
-- (\operand[0]~input_o\ & (\operand[6]~input_o\ & (!\operand[2]~input_o\ $ (\operand[1]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[6]~input_o\ & ((!\operand[0]~input_o\ & ((!\operand[1]~input_o\))) # 
-- (\operand[0]~input_o\ & (\operand[2]~input_o\)))) # (\operand[6]~input_o\ & ((!\operand[2]~input_o\) # ((\operand[0]~input_o\ & !\operand[1]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & 
-- (!\operand[2]~input_o\ & ((!\operand[1]~input_o\) # (\operand[6]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[6]~input_o\ $ (((\operand[2]~input_o\ & !\operand[1]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( 
-- (!\operand[6]~input_o\ & (!\operand[0]~input_o\ & ((\operand[1]~input_o\)))) # (\operand[6]~input_o\ & (\operand[2]~input_o\ & (!\operand[0]~input_o\ $ (!\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101000010010110001011001100010110001110111001000000011101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[6]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~1_combout\);

-- Location: MLABCELL_X46_Y114_N24
\Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (\operand[6]~input_o\)))) # (\operand[2]~input_o\ & ((!\operand[1]~input_o\ $ (!\operand[6]~input_o\)))) ) ) 
-- ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[0]~input_o\ & (!\operand[1]~input_o\))) # (\operand[2]~input_o\ & (!\operand[6]~input_o\ & ((!\operand[0]~input_o\) # (!\operand[1]~input_o\)))) ) ) ) # ( 
-- \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[6]~input_o\))))) # (\operand[2]~input_o\ & (!\operand[0]~input_o\ & (!\operand[1]~input_o\ & !\operand[6]~input_o\))) ) ) ) # ( 
-- !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[6]~input_o\ & ((!\operand[1]~input_o\) # (\operand[2]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[2]~input_o\ & ((\operand[6]~input_o\))) # (\operand[2]~input_o\ 
-- & (!\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000011110110011001001000100010110010100000001000001100111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[6]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~2_combout\);

-- Location: MLABCELL_X46_Y114_N30
\Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~3_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[1]~input_o\ & (((!\operand[2]~input_o\) # (\operand[6]~input_o\)))) # (\operand[1]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[6]~input_o\))) # (\operand[0]~input_o\ & 
-- (!\operand[2]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[1]~input_o\ & (!\operand[2]~input_o\ $ (!\operand[6]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[2]~input_o\ & 
-- ((!\operand[1]~input_o\) # (\operand[6]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[2]~input_o\ $ (((\operand[1]~input_o\ & \operand[6]~input_o\))))) # (\operand[0]~input_o\ & 
-- ((!\operand[1]~input_o\ & ((\operand[6]~input_o\))) # (\operand[1]~input_o\ & (\operand[2]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[1]~input_o\ & ((!\operand[2]~input_o\) # 
-- (!\operand[6]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ & (!\operand[2]~input_o\)) # (\operand[1]~input_o\ & ((\operand[6]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100101001001101100010011101001101000010010011001100010011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[6]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~3_combout\);

-- Location: MLABCELL_X46_Y114_N42
\Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = ( \operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[1]~input_o\ & ((\operand[6]~input_o\) # (\operand[2]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[1]~input_o\ $ (((!\operand[2]~input_o\) # 
-- (\operand[6]~input_o\))))) ) ) ) # ( !\operand[5]~input_o\ & ( \operand[7]~input_o\ & ( (!\operand[0]~input_o\ & (\operand[2]~input_o\ & ((!\operand[1]~input_o\) # (!\operand[6]~input_o\)))) # (\operand[0]~input_o\ & (!\operand[1]~input_o\ & 
-- ((!\operand[2]~input_o\) # (!\operand[6]~input_o\)))) ) ) ) # ( \operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[1]~input_o\ $ (\operand[6]~input_o\)) # (\operand[0]~input_o\))) # (\operand[2]~input_o\ & 
-- ((!\operand[6]~input_o\ & ((!\operand[1]~input_o\))) # (\operand[6]~input_o\ & (\operand[0]~input_o\)))) ) ) ) # ( !\operand[5]~input_o\ & ( !\operand[7]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & (\operand[1]~input_o\ & 
-- \operand[6]~input_o\)) # (\operand[2]~input_o\ & ((!\operand[6]~input_o\))))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ & ((\operand[6]~input_o\))) # (\operand[1]~input_o\ & (!\operand[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010011001011100111101000101110101110010011000000001011000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[6]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_operand[7]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: MLABCELL_X46_Y114_N0
\Mux1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux1~4_combout\ = ( \operand[3]~input_o\ & ( \Mux1~0_combout\ & ( (!\operand[4]~input_o\ & (\Mux1~1_combout\)) # (\operand[4]~input_o\ & ((\Mux1~3_combout\))) ) ) ) # ( !\operand[3]~input_o\ & ( \Mux1~0_combout\ & ( (!\operand[4]~input_o\) # 
-- (!\Mux1~2_combout\) ) ) ) # ( \operand[3]~input_o\ & ( !\Mux1~0_combout\ & ( (!\operand[4]~input_o\ & (\Mux1~1_combout\)) # (\operand[4]~input_o\ & ((\Mux1~3_combout\))) ) ) ) # ( !\operand[3]~input_o\ & ( !\Mux1~0_combout\ & ( (\operand[4]~input_o\ & 
-- !\Mux1~2_combout\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000010001000111011111111100111111000100010001110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux1~1_combout\,
	datab => \ALT_INV_operand[4]~input_o\,
	datac => \ALT_INV_Mux1~2_combout\,
	datad => \ALT_INV_Mux1~3_combout\,
	datae => \ALT_INV_operand[3]~input_o\,
	dataf => \ALT_INV_Mux1~0_combout\,
	combout => \Mux1~4_combout\);

-- Location: FF_X46_Y114_N2
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[6]~reg0_q\);

-- Location: MLABCELL_X46_Y114_N36
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( \operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & (\operand[1]~input_o\ & \operand[3]~input_o\)) # (\operand[2]~input_o\ & (!\operand[1]~input_o\)))) # (\operand[0]~input_o\ & 
-- (!\operand[2]~input_o\ & (!\operand[1]~input_o\ $ (!\operand[3]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[2]~input_o\ & ((\operand[1]~input_o\))) # (\operand[2]~input_o\ & 
-- (!\operand[0]~input_o\)))) # (\operand[3]~input_o\ & (\operand[0]~input_o\ & (!\operand[2]~input_o\ $ (\operand[1]~input_o\)))) ) ) ) # ( \operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[0]~input_o\) # 
-- ((\operand[3]~input_o\)))) # (\operand[1]~input_o\ & (!\operand[2]~input_o\ & (!\operand[0]~input_o\ $ (\operand[3]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( (!\operand[2]~input_o\ & (((\operand[3]~input_o\) # 
-- (\operand[1]~input_o\)))) # (\operand[2]~input_o\ & (\operand[0]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110111011101101010001111010000101110010000010010010001101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: MLABCELL_X46_Y114_N12
\Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = ( \operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[2]~input_o\ & (!\operand[0]~input_o\ $ (((!\operand[3]~input_o\) # (\operand[1]~input_o\))))) # (\operand[2]~input_o\ & ((!\operand[0]~input_o\) # ((!\operand[1]~input_o\) # 
-- (\operand[3]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[0]~input_o\ & (\operand[1]~input_o\)) # (\operand[0]~input_o\ & ((\operand[3]~input_o\))))) # (\operand[2]~input_o\ & 
-- (!\operand[1]~input_o\ & ((!\operand[3]~input_o\) # (\operand[0]~input_o\)))) ) ) ) # ( \operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( (!\operand[0]~input_o\ & ((!\operand[2]~input_o\ & (\operand[1]~input_o\ & \operand[3]~input_o\)) # 
-- (\operand[2]~input_o\ & (!\operand[1]~input_o\)))) # (\operand[0]~input_o\ & ((!\operand[1]~input_o\ $ (\operand[3]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( (\operand[0]~input_o\ & (!\operand[1]~input_o\ $ 
-- (((\operand[2]~input_o\ & !\operand[3]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000101010000011100000010110100111000010111000111011010110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux0~1_combout\);

-- Location: MLABCELL_X46_Y114_N54
\Mux0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = ( \operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[2]~input_o\ & (\operand[3]~input_o\ & (!\operand[0]~input_o\ $ (\operand[1]~input_o\)))) # (\operand[2]~input_o\ & ((!\operand[1]~input_o\ & (!\operand[0]~input_o\)) # 
-- (\operand[1]~input_o\ & ((\operand[3]~input_o\))))) ) ) ) # ( !\operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[0]~input_o\ & (!\operand[1]~input_o\ & (!\operand[2]~input_o\ $ (\operand[3]~input_o\)))) # (\operand[0]~input_o\ & 
-- ((!\operand[2]~input_o\ & (!\operand[1]~input_o\)) # (\operand[2]~input_o\ & ((\operand[3]~input_o\))))) ) ) ) # ( \operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( (!\operand[2]~input_o\ & ((!\operand[0]~input_o\ & (\operand[1]~input_o\ & 
-- \operand[3]~input_o\)) # (\operand[0]~input_o\ & ((\operand[3]~input_o\) # (\operand[1]~input_o\))))) ) ) ) # ( !\operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( !\operand[3]~input_o\ $ (((!\operand[1]~input_o\ & (\operand[0]~input_o\)) # 
-- (\operand[1]~input_o\ & ((!\operand[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001101011100000001000100110011000000011100010010000010100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux0~3_combout\);

-- Location: MLABCELL_X46_Y114_N48
\Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = ( \operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[1]~input_o\ & (!\operand[0]~input_o\ & (\operand[2]~input_o\))) # (\operand[1]~input_o\ & ((!\operand[3]~input_o\) # ((\operand[0]~input_o\ & \operand[2]~input_o\)))) ) ) ) 
-- # ( !\operand[4]~input_o\ & ( \operand[6]~input_o\ & ( (!\operand[3]~input_o\ & ((!\operand[0]~input_o\ & ((\operand[1]~input_o\))) # (\operand[0]~input_o\ & (\operand[2]~input_o\)))) # (\operand[3]~input_o\ & ((!\operand[2]~input_o\ & 
-- ((!\operand[1]~input_o\))) # (\operand[2]~input_o\ & (!\operand[0]~input_o\)))) ) ) ) # ( \operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( (!\operand[1]~input_o\ & ((!\operand[0]~input_o\ & (\operand[2]~input_o\)) # (\operand[0]~input_o\ & 
-- ((!\operand[2]~input_o\) # (!\operand[3]~input_o\))))) # (\operand[1]~input_o\ & (((\operand[3]~input_o\)))) ) ) ) # ( !\operand[4]~input_o\ & ( !\operand[6]~input_o\ & ( (!\operand[0]~input_o\ & (((\operand[1]~input_o\ & !\operand[3]~input_o\)))) # 
-- (\operand[0]~input_o\ & (\operand[2]~input_o\ & ((!\operand[3]~input_o\) # (\operand[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001101100000001011100000110111100011011111000100010111100100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand[0]~input_o\,
	datab => \ALT_INV_operand[2]~input_o\,
	datac => \ALT_INV_operand[1]~input_o\,
	datad => \ALT_INV_operand[3]~input_o\,
	datae => \ALT_INV_operand[4]~input_o\,
	dataf => \ALT_INV_operand[6]~input_o\,
	combout => \Mux0~2_combout\);

-- Location: MLABCELL_X46_Y114_N6
\Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = ( \operand[5]~input_o\ & ( \Mux0~2_combout\ & ( (!\operand[7]~input_o\ & (\Mux0~1_combout\)) # (\operand[7]~input_o\ & ((!\Mux0~3_combout\))) ) ) ) # ( !\operand[5]~input_o\ & ( \Mux0~2_combout\ & ( (\operand[7]~input_o\) # 
-- (\Mux0~0_combout\) ) ) ) # ( \operand[5]~input_o\ & ( !\Mux0~2_combout\ & ( (!\operand[7]~input_o\ & (\Mux0~1_combout\)) # (\operand[7]~input_o\ & ((!\Mux0~3_combout\))) ) ) ) # ( !\operand[5]~input_o\ & ( !\Mux0~2_combout\ & ( (\Mux0~0_combout\ & 
-- !\operand[7]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000001100111111000001010101111111110011001111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_Mux0~1_combout\,
	datac => \ALT_INV_Mux0~3_combout\,
	datad => \ALT_INV_operand[7]~input_o\,
	datae => \ALT_INV_operand[5]~input_o\,
	dataf => \ALT_INV_Mux0~2_combout\,
	combout => \Mux0~4_combout\);

-- Location: FF_X46_Y114_N8
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
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[7]~reg0_q\);

-- Location: MLABCELL_X36_Y50_N3
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



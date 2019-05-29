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

-- DATE "05/29/2019 16:57:14"

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

ENTITY 	gfmul IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	operand_1 : IN std_logic_vector(7 DOWNTO 0);
	operand_2 : IN std_logic_vector(7 DOWNTO 0);
	rslt : OUT std_logic_vector(7 DOWNTO 0)
	);
END gfmul;

-- Design Ports Information
-- rslt[0]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[1]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[2]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[3]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[4]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[5]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[6]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[0]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[1]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[2]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[3]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[4]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[5]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[6]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[7]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[5]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[7]	=>  Location: PIN_AD8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[4]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[6]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[1]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[3]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[0]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[2]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF gfmul IS
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
SIGNAL \operand_2[5]~input_o\ : std_logic;
SIGNAL \operand_2[7]~input_o\ : std_logic;
SIGNAL \operand_2[4]~input_o\ : std_logic;
SIGNAL \operand_2[1]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \Add0~89_sumout\ : std_logic;
SIGNAL \count[0]~3_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \operand_2[0]~input_o\ : std_logic;
SIGNAL \operand_2[3]~input_o\ : std_logic;
SIGNAL \Add0~90\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \count[1]~2_combout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \count[2]~1_combout\ : std_logic;
SIGNAL \operand_2[2]~input_o\ : std_logic;
SIGNAL \Mux0~4_combout\ : std_logic;
SIGNAL \operand_2[6]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \operand_1[0]~input_o\ : std_logic;
SIGNAL \operand_1[7]~input_o\ : std_logic;
SIGNAL \operand_1[6]~input_o\ : std_logic;
SIGNAL \operand_1[5]~input_o\ : std_logic;
SIGNAL \operand_1[4]~input_o\ : std_logic;
SIGNAL \operand_1[2]~input_o\ : std_logic;
SIGNAL \operand_1[1]~input_o\ : std_logic;
SIGNAL \count[24]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~2\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~61_sumout\ : std_logic;
SIGNAL \Add0~62\ : std_logic;
SIGNAL \Add0~57_sumout\ : std_logic;
SIGNAL \count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~58\ : std_logic;
SIGNAL \Add0~53_sumout\ : std_logic;
SIGNAL \count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~54\ : std_logic;
SIGNAL \Add0~49_sumout\ : std_logic;
SIGNAL \count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~50\ : std_logic;
SIGNAL \Add0~45_sumout\ : std_logic;
SIGNAL \count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~46\ : std_logic;
SIGNAL \Add0~41_sumout\ : std_logic;
SIGNAL \Add0~42\ : std_logic;
SIGNAL \Add0~85_sumout\ : std_logic;
SIGNAL \count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~86\ : std_logic;
SIGNAL \Add0~81_sumout\ : std_logic;
SIGNAL \Add0~82\ : std_logic;
SIGNAL \Add0~97_sumout\ : std_logic;
SIGNAL \Add0~98\ : std_logic;
SIGNAL \Add0~73_sumout\ : std_logic;
SIGNAL \Add0~74\ : std_logic;
SIGNAL \Add0~69_sumout\ : std_logic;
SIGNAL \count[15]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~70\ : std_logic;
SIGNAL \Add0~65_sumout\ : std_logic;
SIGNAL \count[16]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~66\ : std_logic;
SIGNAL \Add0~125_sumout\ : std_logic;
SIGNAL \count[17]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~126\ : std_logic;
SIGNAL \Add0~121_sumout\ : std_logic;
SIGNAL \Add0~122\ : std_logic;
SIGNAL \Add0~117_sumout\ : std_logic;
SIGNAL \count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~118\ : std_logic;
SIGNAL \Add0~113_sumout\ : std_logic;
SIGNAL \Add0~114\ : std_logic;
SIGNAL \Add0~109_sumout\ : std_logic;
SIGNAL \Add0~110\ : std_logic;
SIGNAL \Add0~105_sumout\ : std_logic;
SIGNAL \Add0~106\ : std_logic;
SIGNAL \Add0~101_sumout\ : std_logic;
SIGNAL \count[23]~DUPLICATE_q\ : std_logic;
SIGNAL \Add0~102\ : std_logic;
SIGNAL \Add0~77_sumout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Add0~78\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~37_sumout\ : std_logic;
SIGNAL \Add0~38\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~93_sumout\ : std_logic;
SIGNAL \count~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \rslt_lfsr~0_combout\ : std_logic;
SIGNAL \rslt_lfsr~1_combout\ : std_logic;
SIGNAL \operand_1[3]~input_o\ : std_logic;
SIGNAL \rslt_lfsr~2_combout\ : std_logic;
SIGNAL \rslt_mulv~4_combout\ : std_logic;
SIGNAL \rslt_mulv~5_combout\ : std_logic;
SIGNAL \rslt_mulv~6_combout\ : std_logic;
SIGNAL \rslt_mulv~7_combout\ : std_logic;
SIGNAL \rslt_mulv~0_combout\ : std_logic;
SIGNAL \rslt_mulv~1_combout\ : std_logic;
SIGNAL \rslt_mulv~2_combout\ : std_logic;
SIGNAL \rslt_mulv~3_combout\ : std_logic;
SIGNAL count : std_logic_vector(31 DOWNTO 0);
SIGNAL rslt_lfsr : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL ALT_INV_count : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL ALT_INV_rslt_lfsr : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \ALT_INV_count[17]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[23]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[24]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[15]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[16]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_count[3]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_operand_2[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_Equal0~6_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~5_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_operand_1 <= operand_1;
ww_operand_2 <= operand_2;
rslt <= ww_rslt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Add0~93_sumout\ <= NOT \Add0~93_sumout\;
\ALT_INV_Add0~89_sumout\ <= NOT \Add0~89_sumout\;
\ALT_INV_Add0~5_sumout\ <= NOT \Add0~5_sumout\;
\ALT_INV_Add0~1_sumout\ <= NOT \Add0~1_sumout\;
ALT_INV_count(17) <= NOT count(17);
ALT_INV_count(18) <= NOT count(18);
ALT_INV_count(19) <= NOT count(19);
ALT_INV_count(20) <= NOT count(20);
ALT_INV_count(21) <= NOT count(21);
ALT_INV_count(22) <= NOT count(22);
ALT_INV_count(23) <= NOT count(23);
ALT_INV_count(13) <= NOT count(13);
ALT_INV_count(11) <= NOT count(11);
ALT_INV_count(12) <= NOT count(12);
ALT_INV_count(24) <= NOT count(24);
ALT_INV_count(14) <= NOT count(14);
ALT_INV_count(15) <= NOT count(15);
ALT_INV_count(16) <= NOT count(16);
ALT_INV_count(5) <= NOT count(5);
ALT_INV_count(6) <= NOT count(6);
ALT_INV_count(7) <= NOT count(7);
ALT_INV_count(8) <= NOT count(8);
ALT_INV_count(9) <= NOT count(9);
ALT_INV_count(10) <= NOT count(10);
ALT_INV_count(28) <= NOT count(28);
ALT_INV_count(29) <= NOT count(29);
ALT_INV_count(30) <= NOT count(30);
ALT_INV_count(25) <= NOT count(25);
ALT_INV_count(3) <= NOT count(3);
ALT_INV_count(4) <= NOT count(4);
ALT_INV_count(26) <= NOT count(26);
ALT_INV_count(27) <= NOT count(27);
\ALT_INV_Mux0~4_combout\ <= NOT \Mux0~4_combout\;
ALT_INV_rslt_lfsr(7) <= NOT rslt_lfsr(7);
ALT_INV_rslt_lfsr(6) <= NOT rslt_lfsr(6);
ALT_INV_rslt_lfsr(5) <= NOT rslt_lfsr(5);
ALT_INV_rslt_lfsr(4) <= NOT rslt_lfsr(4);
ALT_INV_rslt_lfsr(3) <= NOT rslt_lfsr(3);
ALT_INV_rslt_lfsr(2) <= NOT rslt_lfsr(2);
ALT_INV_rslt_lfsr(1) <= NOT rslt_lfsr(1);
ALT_INV_rslt_lfsr(0) <= NOT rslt_lfsr(0);
\ALT_INV_Mux0~0_combout\ <= NOT \Mux0~0_combout\;
\ALT_INV_count[17]~DUPLICATE_q\ <= NOT \count[17]~DUPLICATE_q\;
\ALT_INV_count[19]~DUPLICATE_q\ <= NOT \count[19]~DUPLICATE_q\;
\ALT_INV_count[23]~DUPLICATE_q\ <= NOT \count[23]~DUPLICATE_q\;
\ALT_INV_count[11]~DUPLICATE_q\ <= NOT \count[11]~DUPLICATE_q\;
\ALT_INV_count[24]~DUPLICATE_q\ <= NOT \count[24]~DUPLICATE_q\;
\ALT_INV_count[15]~DUPLICATE_q\ <= NOT \count[15]~DUPLICATE_q\;
\ALT_INV_count[16]~DUPLICATE_q\ <= NOT \count[16]~DUPLICATE_q\;
\ALT_INV_count[5]~DUPLICATE_q\ <= NOT \count[5]~DUPLICATE_q\;
\ALT_INV_count[6]~DUPLICATE_q\ <= NOT \count[6]~DUPLICATE_q\;
\ALT_INV_count[7]~DUPLICATE_q\ <= NOT \count[7]~DUPLICATE_q\;
\ALT_INV_count[8]~DUPLICATE_q\ <= NOT \count[8]~DUPLICATE_q\;
\ALT_INV_count[9]~DUPLICATE_q\ <= NOT \count[9]~DUPLICATE_q\;
\ALT_INV_count[3]~DUPLICATE_q\ <= NOT \count[3]~DUPLICATE_q\;
\ALT_INV_operand_2[2]~input_o\ <= NOT \operand_2[2]~input_o\;
\ALT_INV_operand_2[0]~input_o\ <= NOT \operand_2[0]~input_o\;
\ALT_INV_operand_2[3]~input_o\ <= NOT \operand_2[3]~input_o\;
\ALT_INV_operand_2[1]~input_o\ <= NOT \operand_2[1]~input_o\;
\ALT_INV_operand_2[6]~input_o\ <= NOT \operand_2[6]~input_o\;
\ALT_INV_operand_2[4]~input_o\ <= NOT \operand_2[4]~input_o\;
\ALT_INV_operand_2[7]~input_o\ <= NOT \operand_2[7]~input_o\;
\ALT_INV_operand_2[5]~input_o\ <= NOT \operand_2[5]~input_o\;
\ALT_INV_operand_1[7]~input_o\ <= NOT \operand_1[7]~input_o\;
\ALT_INV_operand_1[6]~input_o\ <= NOT \operand_1[6]~input_o\;
\ALT_INV_operand_1[5]~input_o\ <= NOT \operand_1[5]~input_o\;
\ALT_INV_operand_1[4]~input_o\ <= NOT \operand_1[4]~input_o\;
\ALT_INV_operand_1[3]~input_o\ <= NOT \operand_1[3]~input_o\;
\ALT_INV_operand_1[2]~input_o\ <= NOT \operand_1[2]~input_o\;
\ALT_INV_operand_1[1]~input_o\ <= NOT \operand_1[1]~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_operand_1[0]~input_o\ <= NOT \operand_1[0]~input_o\;
\ALT_INV_Equal0~6_combout\ <= NOT \Equal0~6_combout\;
\ALT_INV_Equal0~5_combout\ <= NOT \Equal0~5_combout\;
\ALT_INV_Equal0~4_combout\ <= NOT \Equal0~4_combout\;
ALT_INV_count(31) <= NOT count(31);
ALT_INV_count(0) <= NOT count(0);
\ALT_INV_Equal0~3_combout\ <= NOT \Equal0~3_combout\;
\ALT_INV_Equal0~2_combout\ <= NOT \Equal0~2_combout\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
ALT_INV_count(1) <= NOT count(1);
ALT_INV_count(2) <= NOT count(2);

-- Location: IOOBUF_X42_Y0_N36
\rslt[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~0_combout\,
	devoe => ww_devoe,
	o => ww_rslt(0));

-- Location: IOOBUF_X44_Y0_N19
\rslt[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~1_combout\,
	devoe => ww_devoe,
	o => ww_rslt(1));

-- Location: IOOBUF_X42_Y0_N19
\rslt[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~2_combout\,
	devoe => ww_devoe,
	o => ww_rslt(2));

-- Location: IOOBUF_X42_Y0_N2
\rslt[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~3_combout\,
	devoe => ww_devoe,
	o => ww_rslt(3));

-- Location: IOOBUF_X40_Y0_N59
\rslt[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~4_combout\,
	devoe => ww_devoe,
	o => ww_rslt(4));

-- Location: IOOBUF_X44_Y0_N53
\rslt[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~5_combout\,
	devoe => ww_devoe,
	o => ww_rslt(5));

-- Location: IOOBUF_X42_Y0_N53
\rslt[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~6_combout\,
	devoe => ww_devoe,
	o => ww_rslt(6));

-- Location: IOOBUF_X44_Y0_N36
\rslt[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \rslt_mulv~7_combout\,
	devoe => ww_devoe,
	o => ww_rslt(7));

-- Location: IOIBUF_X48_Y0_N75
\operand_2[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(5),
	o => \operand_2[5]~input_o\);

-- Location: IOIBUF_X48_Y0_N41
\operand_2[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(7),
	o => \operand_2[7]~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\operand_2[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(4),
	o => \operand_2[4]~input_o\);

-- Location: IOIBUF_X46_Y0_N52
\operand_2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(1),
	o => \operand_2[1]~input_o\);

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

-- Location: LABCELL_X34_Y3_N0
\Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~89_sumout\ = SUM(( !count(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~90\ = CARRY(( !count(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(0),
	cin => GND,
	sumout => \Add0~89_sumout\,
	cout => \Add0~90\);

-- Location: LABCELL_X35_Y3_N45
\count[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \count[0]~3_combout\ = ( !\Add0~89_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~89_sumout\,
	combout => \count[0]~3_combout\);

-- Location: IOIBUF_X40_Y0_N41
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X34_Y3_N2
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \count[0]~3_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: IOIBUF_X40_Y0_N92
\operand_2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(0),
	o => \operand_2[0]~input_o\);

-- Location: IOIBUF_X48_Y0_N58
\operand_2[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(3),
	o => \operand_2[3]~input_o\);

-- Location: LABCELL_X34_Y3_N3
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( !count(1) ) + ( VCC ) + ( \Add0~90\ ))
-- \Add0~6\ = CARRY(( !count(1) ) + ( VCC ) + ( \Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(1),
	cin => \Add0~90\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: LABCELL_X35_Y3_N24
\count[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \count[1]~2_combout\ = ( !\Add0~5_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \ALT_INV_Add0~5_sumout\,
	combout => \count[1]~2_combout\);

-- Location: FF_X34_Y3_N5
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \count[1]~2_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LABCELL_X34_Y3_N6
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( !count(2) ) + ( VCC ) + ( \Add0~6\ ))
-- \Add0~2\ = CARRY(( !count(2) ) + ( VCC ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(2),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\,
	cout => \Add0~2\);

-- Location: LABCELL_X35_Y3_N54
\count[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \count[2]~1_combout\ = ( !\Add0~1_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_Add0~1_sumout\,
	combout => \count[2]~1_combout\);

-- Location: FF_X34_Y3_N8
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \count[2]~1_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: IOIBUF_X50_Y0_N1
\operand_2[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(2),
	o => \operand_2[2]~input_o\);

-- Location: LABCELL_X35_Y2_N9
\Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~4_combout\ = ( !count(1) & ( ((!count(0) & (((!count(2)) # (\operand_2[3]~input_o\)))) # (count(0) & (\operand_2[2]~input_o\ & ((count(2)))))) ) ) # ( count(1) & ( (!count(0) & ((((!count(2)))) # (\operand_2[1]~input_o\))) # (count(0) & 
-- (((\operand_2[0]~input_o\ & ((count(2))))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1100110011001100110011001100110000000011110011110100011101000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[1]~input_o\,
	datab => ALT_INV_count(0),
	datac => \ALT_INV_operand_2[0]~input_o\,
	datad => \ALT_INV_operand_2[3]~input_o\,
	datae => ALT_INV_count(1),
	dataf => ALT_INV_count(2),
	datag => \ALT_INV_operand_2[2]~input_o\,
	combout => \Mux0~4_combout\);

-- Location: IOIBUF_X50_Y0_N18
\operand_2[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(6),
	o => \operand_2[6]~input_o\);

-- Location: LABCELL_X35_Y2_N0
\Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = ( !count(1) & ( ((!\Mux0~4_combout\ & (((\operand_2[6]~input_o\ & !count(2))))) # (\Mux0~4_combout\ & (((count(2))) # (\operand_2[7]~input_o\)))) ) ) # ( count(1) & ( ((!\Mux0~4_combout\ & (((\operand_2[4]~input_o\ & !count(2))))) # 
-- (\Mux0~4_combout\ & (((count(2))) # (\operand_2[5]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000111100110011000011110101010100000000111111110000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[5]~input_o\,
	datab => \ALT_INV_operand_2[7]~input_o\,
	datac => \ALT_INV_operand_2[4]~input_o\,
	datad => \ALT_INV_Mux0~4_combout\,
	datae => ALT_INV_count(1),
	dataf => ALT_INV_count(2),
	datag => \ALT_INV_operand_2[6]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: IOIBUF_X44_Y0_N1
\operand_1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(0),
	o => \operand_1[0]~input_o\);

-- Location: IOIBUF_X40_Y0_N75
\operand_1[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(7),
	o => \operand_1[7]~input_o\);

-- Location: IOIBUF_X48_Y0_N92
\operand_1[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(6),
	o => \operand_1[6]~input_o\);

-- Location: IOIBUF_X46_Y0_N35
\operand_1[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(5),
	o => \operand_1[5]~input_o\);

-- Location: IOIBUF_X50_Y0_N52
\operand_1[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(4),
	o => \operand_1[4]~input_o\);

-- Location: IOIBUF_X46_Y0_N18
\operand_1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(2),
	o => \operand_1[2]~input_o\);

-- Location: IOIBUF_X46_Y0_N1
\operand_1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(1),
	o => \operand_1[1]~input_o\);

-- Location: FF_X34_Y2_N14
\count[24]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[24]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N9
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( count(3) ) + ( VCC ) + ( \Add0~2\ ))
-- \Add0~22\ = CARRY(( count(3) ) + ( VCC ) + ( \Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(3),
	cin => \Add0~2\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X34_Y3_N11
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LABCELL_X34_Y3_N12
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( count(4) ) + ( VCC ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( count(4) ) + ( VCC ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(4),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X34_Y3_N14
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LABCELL_X34_Y3_N15
\Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~61_sumout\ = SUM(( count(5) ) + ( VCC ) + ( \Add0~18\ ))
-- \Add0~62\ = CARRY(( count(5) ) + ( VCC ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(5),
	cin => \Add0~18\,
	sumout => \Add0~61_sumout\,
	cout => \Add0~62\);

-- Location: FF_X34_Y3_N17
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LABCELL_X34_Y3_N18
\Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~57_sumout\ = SUM(( \count[6]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~62\ ))
-- \Add0~58\ = CARRY(( \count[6]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_count[6]~DUPLICATE_q\,
	cin => \Add0~62\,
	sumout => \Add0~57_sumout\,
	cout => \Add0~58\);

-- Location: FF_X34_Y3_N20
\count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[6]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N21
\Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~53_sumout\ = SUM(( \count[7]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~58\ ))
-- \Add0~54\ = CARRY(( \count[7]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[7]~DUPLICATE_q\,
	cin => \Add0~58\,
	sumout => \Add0~53_sumout\,
	cout => \Add0~54\);

-- Location: FF_X34_Y3_N23
\count[7]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[7]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N24
\Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~49_sumout\ = SUM(( \count[8]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~54\ ))
-- \Add0~50\ = CARRY(( \count[8]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_count[8]~DUPLICATE_q\,
	cin => \Add0~54\,
	sumout => \Add0~49_sumout\,
	cout => \Add0~50\);

-- Location: FF_X34_Y3_N26
\count[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[8]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N27
\Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~45_sumout\ = SUM(( \count[9]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~50\ ))
-- \Add0~46\ = CARRY(( \count[9]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[9]~DUPLICATE_q\,
	cin => \Add0~50\,
	sumout => \Add0~45_sumout\,
	cout => \Add0~46\);

-- Location: FF_X34_Y3_N29
\count[9]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[9]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N30
\Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~41_sumout\ = SUM(( count(10) ) + ( VCC ) + ( \Add0~46\ ))
-- \Add0~42\ = CARRY(( count(10) ) + ( VCC ) + ( \Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(10),
	cin => \Add0~46\,
	sumout => \Add0~41_sumout\,
	cout => \Add0~42\);

-- Location: FF_X34_Y3_N31
\count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~41_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(10));

-- Location: LABCELL_X34_Y3_N33
\Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~85_sumout\ = SUM(( \count[11]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~42\ ))
-- \Add0~86\ = CARRY(( \count[11]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_count[11]~DUPLICATE_q\,
	cin => \Add0~42\,
	sumout => \Add0~85_sumout\,
	cout => \Add0~86\);

-- Location: FF_X34_Y3_N35
\count[11]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[11]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N36
\Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~81_sumout\ = SUM(( count(12) ) + ( VCC ) + ( \Add0~86\ ))
-- \Add0~82\ = CARRY(( count(12) ) + ( VCC ) + ( \Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(12),
	cin => \Add0~86\,
	sumout => \Add0~81_sumout\,
	cout => \Add0~82\);

-- Location: FF_X34_Y3_N38
\count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~81_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(12));

-- Location: LABCELL_X34_Y3_N39
\Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~97_sumout\ = SUM(( count(13) ) + ( VCC ) + ( \Add0~82\ ))
-- \Add0~98\ = CARRY(( count(13) ) + ( VCC ) + ( \Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(13),
	cin => \Add0~82\,
	sumout => \Add0~97_sumout\,
	cout => \Add0~98\);

-- Location: FF_X34_Y3_N41
\count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~97_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(13));

-- Location: LABCELL_X34_Y3_N42
\Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~73_sumout\ = SUM(( count(14) ) + ( VCC ) + ( \Add0~98\ ))
-- \Add0~74\ = CARRY(( count(14) ) + ( VCC ) + ( \Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(14),
	cin => \Add0~98\,
	sumout => \Add0~73_sumout\,
	cout => \Add0~74\);

-- Location: FF_X34_Y3_N43
\count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~73_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(14));

-- Location: LABCELL_X34_Y3_N45
\Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~69_sumout\ = SUM(( \count[15]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~74\ ))
-- \Add0~70\ = CARRY(( \count[15]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[15]~DUPLICATE_q\,
	cin => \Add0~74\,
	sumout => \Add0~69_sumout\,
	cout => \Add0~70\);

-- Location: FF_X34_Y3_N47
\count[15]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[15]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N48
\Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~65_sumout\ = SUM(( \count[16]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~70\ ))
-- \Add0~66\ = CARRY(( \count[16]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_count[16]~DUPLICATE_q\,
	cin => \Add0~70\,
	sumout => \Add0~65_sumout\,
	cout => \Add0~66\);

-- Location: FF_X34_Y3_N50
\count[16]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[16]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N51
\Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~125_sumout\ = SUM(( \count[17]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~66\ ))
-- \Add0~126\ = CARRY(( \count[17]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[17]~DUPLICATE_q\,
	cin => \Add0~66\,
	sumout => \Add0~125_sumout\,
	cout => \Add0~126\);

-- Location: FF_X34_Y3_N52
\count[17]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~125_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[17]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y3_N54
\Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~121_sumout\ = SUM(( count(18) ) + ( VCC ) + ( \Add0~126\ ))
-- \Add0~122\ = CARRY(( count(18) ) + ( VCC ) + ( \Add0~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(18),
	cin => \Add0~126\,
	sumout => \Add0~121_sumout\,
	cout => \Add0~122\);

-- Location: FF_X34_Y3_N56
\count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~121_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(18));

-- Location: LABCELL_X34_Y3_N57
\Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~117_sumout\ = SUM(( \count[19]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~122\ ))
-- \Add0~118\ = CARRY(( \count[19]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_count[19]~DUPLICATE_q\,
	cin => \Add0~122\,
	sumout => \Add0~117_sumout\,
	cout => \Add0~118\);

-- Location: FF_X34_Y3_N59
\count[19]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~117_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[19]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y2_N0
\Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~113_sumout\ = SUM(( count(20) ) + ( VCC ) + ( \Add0~118\ ))
-- \Add0~114\ = CARRY(( count(20) ) + ( VCC ) + ( \Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(20),
	cin => \Add0~118\,
	sumout => \Add0~113_sumout\,
	cout => \Add0~114\);

-- Location: FF_X34_Y2_N2
\count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~113_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(20));

-- Location: LABCELL_X34_Y2_N3
\Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~109_sumout\ = SUM(( count(21) ) + ( VCC ) + ( \Add0~114\ ))
-- \Add0~110\ = CARRY(( count(21) ) + ( VCC ) + ( \Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(21),
	cin => \Add0~114\,
	sumout => \Add0~109_sumout\,
	cout => \Add0~110\);

-- Location: FF_X34_Y2_N5
\count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~109_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(21));

-- Location: LABCELL_X34_Y2_N6
\Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~105_sumout\ = SUM(( count(22) ) + ( VCC ) + ( \Add0~110\ ))
-- \Add0~106\ = CARRY(( count(22) ) + ( VCC ) + ( \Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(22),
	cin => \Add0~110\,
	sumout => \Add0~105_sumout\,
	cout => \Add0~106\);

-- Location: FF_X34_Y2_N8
\count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~105_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(22));

-- Location: LABCELL_X34_Y2_N9
\Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~101_sumout\ = SUM(( \count[23]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~106\ ))
-- \Add0~102\ = CARRY(( \count[23]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_count[23]~DUPLICATE_q\,
	cin => \Add0~106\,
	sumout => \Add0~101_sumout\,
	cout => \Add0~102\);

-- Location: FF_X34_Y2_N11
\count[23]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~101_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[23]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y2_N12
\Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~77_sumout\ = SUM(( \count[24]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~102\ ))
-- \Add0~78\ = CARRY(( \count[24]~DUPLICATE_q\ ) + ( VCC ) + ( \Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_count[24]~DUPLICATE_q\,
	cin => \Add0~102\,
	sumout => \Add0~77_sumout\,
	cout => \Add0~78\);

-- Location: FF_X34_Y2_N13
\count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~77_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(24));

-- Location: FF_X34_Y3_N46
\count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~69_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(15));

-- Location: FF_X34_Y3_N34
\count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~85_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(11));

-- Location: FF_X34_Y3_N49
\count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~65_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(16));

-- Location: LABCELL_X35_Y2_N30
\Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = ( !count(14) & ( !count(12) & ( (!count(24) & (!count(15) & (!count(11) & !count(16)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(24),
	datab => ALT_INV_count(15),
	datac => ALT_INV_count(11),
	datad => ALT_INV_count(16),
	datae => ALT_INV_count(14),
	dataf => ALT_INV_count(12),
	combout => \Equal0~3_combout\);

-- Location: LABCELL_X34_Y2_N15
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( count(25) ) + ( VCC ) + ( \Add0~78\ ))
-- \Add0~26\ = CARRY(( count(25) ) + ( VCC ) + ( \Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(25),
	cin => \Add0~78\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X34_Y2_N17
\count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(25));

-- Location: LABCELL_X34_Y2_N18
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( count(26) ) + ( VCC ) + ( \Add0~26\ ))
-- \Add0~14\ = CARRY(( count(26) ) + ( VCC ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(26),
	cin => \Add0~26\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X34_Y2_N20
\count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(26));

-- Location: LABCELL_X34_Y2_N21
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( count(27) ) + ( VCC ) + ( \Add0~14\ ))
-- \Add0~10\ = CARRY(( count(27) ) + ( VCC ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(27),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X34_Y2_N22
\count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(27));

-- Location: LABCELL_X34_Y2_N24
\Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~37_sumout\ = SUM(( count(28) ) + ( VCC ) + ( \Add0~10\ ))
-- \Add0~38\ = CARRY(( count(28) ) + ( VCC ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(28),
	cin => \Add0~10\,
	sumout => \Add0~37_sumout\,
	cout => \Add0~38\);

-- Location: FF_X34_Y2_N26
\count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~37_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(28));

-- Location: LABCELL_X34_Y2_N27
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( count(29) ) + ( VCC ) + ( \Add0~38\ ))
-- \Add0~34\ = CARRY(( count(29) ) + ( VCC ) + ( \Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_count(29),
	cin => \Add0~38\,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: FF_X34_Y2_N29
\count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(29));

-- Location: LABCELL_X34_Y2_N30
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( count(30) ) + ( VCC ) + ( \Add0~34\ ))
-- \Add0~30\ = CARRY(( count(30) ) + ( VCC ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => ALT_INV_count(30),
	cin => \Add0~34\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X34_Y2_N32
\count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(30));

-- Location: FF_X34_Y3_N10
\count[3]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[3]~DUPLICATE_q\);

-- Location: LABCELL_X34_Y2_N42
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !count(29) & ( !\count[3]~DUPLICATE_q\ & ( (!count(28) & (!count(30) & (!count(4) & !count(25)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(28),
	datab => ALT_INV_count(30),
	datac => ALT_INV_count(4),
	datad => ALT_INV_count(25),
	datae => ALT_INV_count(29),
	dataf => \ALT_INV_count[3]~DUPLICATE_q\,
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X34_Y2_N39
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( !count(27) & ( !count(26) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(26),
	dataf => ALT_INV_count(27),
	combout => \Equal0~0_combout\);

-- Location: FF_X34_Y3_N53
\count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~125_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(17));

-- Location: FF_X34_Y3_N58
\count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~117_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(19));

-- Location: LABCELL_X34_Y2_N54
\Equal0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = ( !count(20) & ( !count(19) & ( (!count(21) & (!count(22) & (!count(17) & !count(18)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(21),
	datab => ALT_INV_count(22),
	datac => ALT_INV_count(17),
	datad => ALT_INV_count(18),
	datae => ALT_INV_count(20),
	dataf => ALT_INV_count(19),
	combout => \Equal0~5_combout\);

-- Location: FF_X34_Y3_N25
\count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~49_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(8));

-- Location: FF_X34_Y3_N22
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~53_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: FF_X34_Y3_N19
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~57_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: FF_X34_Y3_N28
\count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~45_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(9));

-- Location: FF_X34_Y3_N16
\count[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~61_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \count[5]~DUPLICATE_q\);

-- Location: LABCELL_X35_Y3_N0
\Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = ( !count(9) & ( !\count[5]~DUPLICATE_q\ & ( (!count(10) & (!count(8) & (!count(7) & !count(6)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(10),
	datab => ALT_INV_count(8),
	datac => ALT_INV_count(7),
	datad => ALT_INV_count(6),
	datae => ALT_INV_count(9),
	dataf => \ALT_INV_count[5]~DUPLICATE_q\,
	combout => \Equal0~2_combout\);

-- Location: FF_X34_Y2_N10
\count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \Add0~101_sumout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(23));

-- Location: LABCELL_X34_Y2_N33
\Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~93_sumout\ = SUM(( count(31) ) + ( VCC ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_count(31),
	cin => \Add0~30\,
	sumout => \Add0~93_sumout\);

-- Location: LABCELL_X34_Y2_N36
\count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \count~0_combout\ = ( \Add0~93_sumout\ & ( !\Equal0~6_combout\ ) ) # ( !\Add0~93_sumout\ & ( \Equal0~6_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_Equal0~6_combout\,
	dataf => \ALT_INV_Add0~93_sumout\,
	combout => \count~0_combout\);

-- Location: FF_X34_Y2_N37
\count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \count~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(31));

-- Location: LABCELL_X35_Y2_N24
\Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = ( count(1) & ( !count(13) & ( (count(2) & (!count(23) & (!count(31) & count(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000100000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_count(2),
	datab => ALT_INV_count(23),
	datac => ALT_INV_count(31),
	datad => ALT_INV_count(0),
	datae => ALT_INV_count(1),
	dataf => ALT_INV_count(13),
	combout => \Equal0~4_combout\);

-- Location: LABCELL_X34_Y2_N51
\Equal0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = ( \Equal0~2_combout\ & ( \Equal0~4_combout\ & ( (\Equal0~3_combout\ & (\Equal0~1_combout\ & (\Equal0~0_combout\ & \Equal0~5_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Equal0~3_combout\,
	datab => \ALT_INV_Equal0~1_combout\,
	datac => \ALT_INV_Equal0~0_combout\,
	datad => \ALT_INV_Equal0~5_combout\,
	datae => \ALT_INV_Equal0~2_combout\,
	dataf => \ALT_INV_Equal0~4_combout\,
	combout => \Equal0~6_combout\);

-- Location: FF_X35_Y2_N23
\rslt_lfsr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_mulv~0_combout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(1));

-- Location: LABCELL_X35_Y2_N45
\rslt_lfsr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr~0_combout\ = ( \Mux0~0_combout\ & ( !rslt_lfsr(7) $ (((!\rst~input_o\) # (!\operand_1[1]~input_o\ $ (rslt_lfsr(1))))) ) ) # ( !\Mux0~0_combout\ & ( !rslt_lfsr(7) $ (((!\rst~input_o\) # (!rslt_lfsr(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100111100001101100011100100110011001111000011011000111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_1[1]~input_o\,
	datab => ALT_INV_rslt_lfsr(7),
	datac => \ALT_INV_rst~input_o\,
	datad => ALT_INV_rslt_lfsr(1),
	datae => \ALT_INV_Mux0~0_combout\,
	combout => \rslt_lfsr~0_combout\);

-- Location: FF_X34_Y2_N53
\rslt_lfsr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \rslt_lfsr~0_combout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(2));

-- Location: LABCELL_X35_Y2_N39
\rslt_lfsr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr~1_combout\ = ( \rst~input_o\ & ( !rslt_lfsr(7) $ (!rslt_lfsr(2) $ (((\Mux0~0_combout\ & \operand_1[2]~input_o\)))) ) ) # ( !\rst~input_o\ & ( rslt_lfsr(7) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100011110111000010001111011100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_operand_1[2]~input_o\,
	datac => ALT_INV_rslt_lfsr(7),
	datad => ALT_INV_rslt_lfsr(2),
	dataf => \ALT_INV_rst~input_o\,
	combout => \rslt_lfsr~1_combout\);

-- Location: FF_X35_Y2_N41
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
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(3));

-- Location: IOIBUF_X50_Y0_N35
\operand_1[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(3),
	o => \operand_1[3]~input_o\);

-- Location: LABCELL_X35_Y2_N48
\rslt_lfsr~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_lfsr~2_combout\ = ( rslt_lfsr(7) & ( (!\rst~input_o\) # (!rslt_lfsr(3) $ (((\Mux0~0_combout\ & \operand_1[3]~input_o\)))) ) ) # ( !rslt_lfsr(7) & ( (\rst~input_o\ & (!rslt_lfsr(3) $ (((!\Mux0~0_combout\) # (!\operand_1[3]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000110000000110000011011111100111110011111110011111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => ALT_INV_rslt_lfsr(3),
	datac => \ALT_INV_rst~input_o\,
	datad => \ALT_INV_operand_1[3]~input_o\,
	dataf => ALT_INV_rslt_lfsr(7),
	combout => \rslt_lfsr~2_combout\);

-- Location: FF_X34_Y2_N55
\rslt_lfsr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \rslt_lfsr~2_combout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(4));

-- Location: LABCELL_X35_Y2_N57
\rslt_mulv~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~4_combout\ = ( rslt_lfsr(4) & ( (\rst~input_o\ & ((!\Mux0~0_combout\) # (!\operand_1[4]~input_o\))) ) ) # ( !rslt_lfsr(4) & ( (\Mux0~0_combout\ & (\rst~input_o\ & \operand_1[4]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100110010001100100011001000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_operand_1[4]~input_o\,
	dataf => ALT_INV_rslt_lfsr(4),
	combout => \rslt_mulv~4_combout\);

-- Location: FF_X35_Y2_N58
\rslt_lfsr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_mulv~4_combout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(5));

-- Location: LABCELL_X35_Y2_N12
\rslt_mulv~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~5_combout\ = ( rslt_lfsr(5) & ( (\rst~input_o\ & ((!\Mux0~0_combout\) # (!\operand_1[5]~input_o\))) ) ) # ( !rslt_lfsr(5) & ( (\Mux0~0_combout\ & (\rst~input_o\ & \operand_1[5]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100110010001100100011001000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_operand_1[5]~input_o\,
	dataf => ALT_INV_rslt_lfsr(5),
	combout => \rslt_mulv~5_combout\);

-- Location: FF_X35_Y2_N13
\rslt_lfsr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_mulv~5_combout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(6));

-- Location: LABCELL_X35_Y2_N15
\rslt_mulv~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~6_combout\ = ( rslt_lfsr(6) & ( (\rst~input_o\ & ((!\Mux0~0_combout\) # (!\operand_1[6]~input_o\))) ) ) # ( !rslt_lfsr(6) & ( (\Mux0~0_combout\ & (\rst~input_o\ & \operand_1[6]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000100110011001000100011001100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datad => \ALT_INV_operand_1[6]~input_o\,
	dataf => ALT_INV_rslt_lfsr(6),
	combout => \rslt_mulv~6_combout\);

-- Location: FF_X35_Y2_N17
\rslt_lfsr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_mulv~6_combout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(7));

-- Location: LABCELL_X35_Y2_N18
\rslt_mulv~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~7_combout\ = ( rslt_lfsr(7) & ( (\rst~input_o\ & ((!\Mux0~0_combout\) # (!\operand_1[7]~input_o\))) ) ) # ( !rslt_lfsr(7) & ( (\Mux0~0_combout\ & (\rst~input_o\ & \operand_1[7]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000100110010001100100011001000110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_operand_1[7]~input_o\,
	dataf => ALT_INV_rslt_lfsr(7),
	combout => \rslt_mulv~7_combout\);

-- Location: FF_X35_Y2_N19
\rslt_lfsr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt_mulv~7_combout\,
	clrn => \rst~input_o\,
	sclr => \Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => rslt_lfsr(0));

-- Location: LABCELL_X35_Y2_N21
\rslt_mulv~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~0_combout\ = ( rslt_lfsr(0) & ( (\rst~input_o\ & ((!\Mux0~0_combout\) # (!\operand_1[0]~input_o\))) ) ) # ( !rslt_lfsr(0) & ( (\Mux0~0_combout\ & (\rst~input_o\ & \operand_1[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000100110011001000100011001100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datad => \ALT_INV_operand_1[0]~input_o\,
	dataf => ALT_INV_rslt_lfsr(0),
	combout => \rslt_mulv~0_combout\);

-- Location: LABCELL_X35_Y2_N54
\rslt_mulv~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~1_combout\ = (\rst~input_o\ & (!rslt_lfsr(1) $ (((!\Mux0~0_combout\) # (!\operand_1[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100110010000000010011001000000001001100100000000100110010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_operand_1[1]~input_o\,
	datad => ALT_INV_rslt_lfsr(1),
	combout => \rslt_mulv~1_combout\);

-- Location: LABCELL_X35_Y2_N36
\rslt_mulv~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~2_combout\ = ( \rst~input_o\ & ( !rslt_lfsr(2) $ (((!\Mux0~0_combout\) # (!\operand_1[2]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000011110000111100001111000011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_operand_1[2]~input_o\,
	datac => ALT_INV_rslt_lfsr(2),
	dataf => \ALT_INV_rst~input_o\,
	combout => \rslt_mulv~2_combout\);

-- Location: LABCELL_X35_Y2_N51
\rslt_mulv~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt_mulv~3_combout\ = (\rst~input_o\ & (!rslt_lfsr(3) $ (((!\Mux0~0_combout\) # (!\operand_1[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000110110000000000011011000000000001101100000000000110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Mux0~0_combout\,
	datab => ALT_INV_rslt_lfsr(3),
	datac => \ALT_INV_operand_1[3]~input_o\,
	datad => \ALT_INV_rst~input_o\,
	combout => \rslt_mulv~3_combout\);

-- Location: LABCELL_X84_Y80_N0
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



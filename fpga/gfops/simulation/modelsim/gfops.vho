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

-- DATE "06/04/2019 22:20:49"

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

ENTITY 	gfops IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	operand_1 : IN std_logic_vector(7 DOWNTO 0);
	operand_2 : IN std_logic_vector(7 DOWNTO 0);
	sel : IN std_logic;
	rslt : OUT std_logic_vector(7 DOWNTO 0)
	);
END gfops;

-- Design Ports Information
-- rslt[0]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[1]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[2]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[3]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[4]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[5]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[6]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[7]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[0]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[1]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[2]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[3]	=>  Location: PIN_AD6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[4]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[5]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[6]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[7]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[0]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[5]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[4]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[6]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[1]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[2]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[3]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF gfops IS
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
SIGNAL ww_sel : std_logic;
SIGNAL ww_rslt : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \operand_1[0]~input_o\ : std_logic;
SIGNAL \operand_2[0]~input_o\ : std_logic;
SIGNAL \gfadd_1|rslt~0_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \rslt[0]~reg0feeder_combout\ : std_logic;
SIGNAL \operand_2[5]~input_o\ : std_logic;
SIGNAL \gfmul_1|Add0~89_sumout\ : std_logic;
SIGNAL \gfmul_1|count[0]~3_combout\ : std_logic;
SIGNAL \gfmul_1|Add0~90\ : std_logic;
SIGNAL \gfmul_1|Add0~5_sumout\ : std_logic;
SIGNAL \gfmul_1|count[1]~2_combout\ : std_logic;
SIGNAL \gfmul_1|Add0~6\ : std_logic;
SIGNAL \gfmul_1|Add0~1_sumout\ : std_logic;
SIGNAL \gfmul_1|count[2]~1_combout\ : std_logic;
SIGNAL \operand_2[4]~input_o\ : std_logic;
SIGNAL \operand_2[7]~input_o\ : std_logic;
SIGNAL \operand_2[3]~input_o\ : std_logic;
SIGNAL \operand_2[1]~input_o\ : std_logic;
SIGNAL \operand_2[2]~input_o\ : std_logic;
SIGNAL \gfmul_1|Mux0~4_combout\ : std_logic;
SIGNAL \operand_2[6]~input_o\ : std_logic;
SIGNAL \gfmul_1|Mux0~0_combout\ : std_logic;
SIGNAL \operand_1[7]~input_o\ : std_logic;
SIGNAL \operand_1[6]~input_o\ : std_logic;
SIGNAL \operand_1[5]~input_o\ : std_logic;
SIGNAL \operand_1[4]~input_o\ : std_logic;
SIGNAL \operand_1[2]~input_o\ : std_logic;
SIGNAL \gfmul_1|Add0~2\ : std_logic;
SIGNAL \gfmul_1|Add0~17_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~18\ : std_logic;
SIGNAL \gfmul_1|Add0~61_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~62\ : std_logic;
SIGNAL \gfmul_1|Add0~57_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~58\ : std_logic;
SIGNAL \gfmul_1|Add0~53_sumout\ : std_logic;
SIGNAL \gfmul_1|count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~54\ : std_logic;
SIGNAL \gfmul_1|Add0~49_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~50\ : std_logic;
SIGNAL \gfmul_1|Add0~45_sumout\ : std_logic;
SIGNAL \gfmul_1|count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~46\ : std_logic;
SIGNAL \gfmul_1|Add0~41_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~42\ : std_logic;
SIGNAL \gfmul_1|Add0~85_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~86\ : std_logic;
SIGNAL \gfmul_1|Add0~81_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~82\ : std_logic;
SIGNAL \gfmul_1|Add0~77_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~78\ : std_logic;
SIGNAL \gfmul_1|Add0~101_sumout\ : std_logic;
SIGNAL \gfmul_1|count[13]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~102\ : std_logic;
SIGNAL \gfmul_1|Add0~97_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~98\ : std_logic;
SIGNAL \gfmul_1|Add0~109_sumout\ : std_logic;
SIGNAL \gfmul_1|count[15]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~110\ : std_logic;
SIGNAL \gfmul_1|Add0~113_sumout\ : std_logic;
SIGNAL \gfmul_1|count[16]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~114\ : std_logic;
SIGNAL \gfmul_1|Add0~117_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~118\ : std_logic;
SIGNAL \gfmul_1|Add0~121_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~122\ : std_logic;
SIGNAL \gfmul_1|Add0~125_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~126\ : std_logic;
SIGNAL \gfmul_1|Add0~65_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~66\ : std_logic;
SIGNAL \gfmul_1|Add0~105_sumout\ : std_logic;
SIGNAL \gfmul_1|count[21]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~106\ : std_logic;
SIGNAL \gfmul_1|Add0~73_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~74\ : std_logic;
SIGNAL \gfmul_1|Add0~69_sumout\ : std_logic;
SIGNAL \gfmul_1|Equal0~3_combout\ : std_logic;
SIGNAL \gfmul_1|Add0~70\ : std_logic;
SIGNAL \gfmul_1|Add0~21_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~22\ : std_logic;
SIGNAL \gfmul_1|Add0~13_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~14\ : std_logic;
SIGNAL \gfmul_1|Add0~9_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~10\ : std_logic;
SIGNAL \gfmul_1|Add0~37_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~38\ : std_logic;
SIGNAL \gfmul_1|Add0~33_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~34\ : std_logic;
SIGNAL \gfmul_1|Add0~29_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~30\ : std_logic;
SIGNAL \gfmul_1|Add0~25_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~26\ : std_logic;
SIGNAL \gfmul_1|Add0~93_sumout\ : std_logic;
SIGNAL \gfmul_1|count~0_combout\ : std_logic;
SIGNAL \gfmul_1|count[31]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Equal0~4_combout\ : std_logic;
SIGNAL \gfmul_1|count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Equal0~2_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~0_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~1_combout\ : std_logic;
SIGNAL \gfmul_1|count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Equal0~5_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~6_combout\ : std_logic;
SIGNAL \operand_1[1]~input_o\ : std_logic;
SIGNAL \gfmul_1|rslt_lfsr~0_combout\ : std_logic;
SIGNAL \gfmul_1|rslt_lfsr~1_combout\ : std_logic;
SIGNAL \operand_1[3]~input_o\ : std_logic;
SIGNAL \gfmul_1|rslt_lfsr~2_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[4]~4_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[5]~5_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[6]~6_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[7]~7_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[0]~0_combout\ : std_logic;
SIGNAL \sel~input_o\ : std_logic;
SIGNAL \rslt[0]~reg0_q\ : std_logic;
SIGNAL \gfadd_1|rslt~1_combout\ : std_logic;
SIGNAL \rslt[1]~reg0feeder_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[1]~1_combout\ : std_logic;
SIGNAL \rslt[1]~reg0_q\ : std_logic;
SIGNAL \gfadd_1|rslt~2_combout\ : std_logic;
SIGNAL \rslt[2]~reg0feeder_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[2]~2_combout\ : std_logic;
SIGNAL \rslt[2]~reg0_q\ : std_logic;
SIGNAL \gfadd_1|rslt~3_combout\ : std_logic;
SIGNAL \rslt[3]~reg0feeder_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[3]~3_combout\ : std_logic;
SIGNAL \rslt[3]~reg0_q\ : std_logic;
SIGNAL \gfadd_1|rslt~4_combout\ : std_logic;
SIGNAL \rslt[4]~reg0feeder_combout\ : std_logic;
SIGNAL \rslt[4]~reg0_q\ : std_logic;
SIGNAL \gfadd_1|rslt~5_combout\ : std_logic;
SIGNAL \gfadd_1|rslt[5]~feeder_combout\ : std_logic;
SIGNAL \rslt[5]~reg0feeder_combout\ : std_logic;
SIGNAL \rslt[5]~reg0_q\ : std_logic;
SIGNAL \gfadd_1|rslt~6_combout\ : std_logic;
SIGNAL \gfadd_1|rslt[6]~feeder_combout\ : std_logic;
SIGNAL \rslt[6]~reg0feeder_combout\ : std_logic;
SIGNAL \rslt[6]~reg0_q\ : std_logic;
SIGNAL \gfadd_1|rslt~7_combout\ : std_logic;
SIGNAL \rslt[7]~reg0feeder_combout\ : std_logic;
SIGNAL \rslt[7]~reg0_q\ : std_logic;
SIGNAL \gfmul_1|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \gfadd_1|rslt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfmul_1|rslt_lfsr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfmul_1|ALT_INV_count[31]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[16]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[15]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[21]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[13]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[6]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_operand_2[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_1[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \gfadd_1|ALT_INV_rslt~6_combout\ : std_logic;
SIGNAL \gfadd_1|ALT_INV_rslt~5_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~6_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~5_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \gfmul_1|ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL \gfadd_1|ALT_INV_rslt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfmul_1|ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_rslt_lfsr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfmul_1|ALT_INV_Mux0~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_operand_1 <= operand_1;
ww_operand_2 <= operand_2;
ww_sel <= sel;
rslt <= ww_rslt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\gfmul_1|ALT_INV_count[31]~DUPLICATE_q\ <= NOT \gfmul_1|count[31]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[19]~DUPLICATE_q\ <= NOT \gfmul_1|count[19]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[16]~DUPLICATE_q\ <= NOT \gfmul_1|count[16]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[15]~DUPLICATE_q\ <= NOT \gfmul_1|count[15]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[21]~DUPLICATE_q\ <= NOT \gfmul_1|count[21]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[13]~DUPLICATE_q\ <= NOT \gfmul_1|count[13]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[5]~DUPLICATE_q\ <= NOT \gfmul_1|count[5]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[6]~DUPLICATE_q\ <= NOT \gfmul_1|count[6]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[8]~DUPLICATE_q\ <= NOT \gfmul_1|count[8]~DUPLICATE_q\;
\ALT_INV_operand_2[3]~input_o\ <= NOT \operand_2[3]~input_o\;
\ALT_INV_operand_2[2]~input_o\ <= NOT \operand_2[2]~input_o\;
\ALT_INV_operand_2[1]~input_o\ <= NOT \operand_2[1]~input_o\;
\ALT_INV_operand_2[6]~input_o\ <= NOT \operand_2[6]~input_o\;
\ALT_INV_operand_2[4]~input_o\ <= NOT \operand_2[4]~input_o\;
\ALT_INV_operand_2[7]~input_o\ <= NOT \operand_2[7]~input_o\;
\ALT_INV_operand_2[5]~input_o\ <= NOT \operand_2[5]~input_o\;
\ALT_INV_operand_2[0]~input_o\ <= NOT \operand_2[0]~input_o\;
\ALT_INV_operand_1[7]~input_o\ <= NOT \operand_1[7]~input_o\;
\ALT_INV_operand_1[6]~input_o\ <= NOT \operand_1[6]~input_o\;
\ALT_INV_operand_1[5]~input_o\ <= NOT \operand_1[5]~input_o\;
\ALT_INV_operand_1[4]~input_o\ <= NOT \operand_1[4]~input_o\;
\ALT_INV_operand_1[3]~input_o\ <= NOT \operand_1[3]~input_o\;
\ALT_INV_operand_1[2]~input_o\ <= NOT \operand_1[2]~input_o\;
\ALT_INV_operand_1[1]~input_o\ <= NOT \operand_1[1]~input_o\;
\ALT_INV_operand_1[0]~input_o\ <= NOT \operand_1[0]~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\gfadd_1|ALT_INV_rslt~6_combout\ <= NOT \gfadd_1|rslt~6_combout\;
\gfadd_1|ALT_INV_rslt~5_combout\ <= NOT \gfadd_1|rslt~5_combout\;
\gfmul_1|ALT_INV_Equal0~6_combout\ <= NOT \gfmul_1|Equal0~6_combout\;
\gfmul_1|ALT_INV_Equal0~5_combout\ <= NOT \gfmul_1|Equal0~5_combout\;
\gfmul_1|ALT_INV_Equal0~4_combout\ <= NOT \gfmul_1|Equal0~4_combout\;
\gfmul_1|ALT_INV_count\(31) <= NOT \gfmul_1|count\(31);
\gfmul_1|ALT_INV_count\(0) <= NOT \gfmul_1|count\(0);
\gfmul_1|ALT_INV_Equal0~3_combout\ <= NOT \gfmul_1|Equal0~3_combout\;
\gfmul_1|ALT_INV_Equal0~2_combout\ <= NOT \gfmul_1|Equal0~2_combout\;
\gfmul_1|ALT_INV_Equal0~1_combout\ <= NOT \gfmul_1|Equal0~1_combout\;
\gfmul_1|ALT_INV_Equal0~0_combout\ <= NOT \gfmul_1|Equal0~0_combout\;
\gfmul_1|ALT_INV_count\(1) <= NOT \gfmul_1|count\(1);
\gfmul_1|ALT_INV_count\(2) <= NOT \gfmul_1|count\(2);
\gfadd_1|ALT_INV_rslt\(7) <= NOT \gfadd_1|rslt\(7);
\gfadd_1|ALT_INV_rslt\(6) <= NOT \gfadd_1|rslt\(6);
\gfadd_1|ALT_INV_rslt\(5) <= NOT \gfadd_1|rslt\(5);
\gfadd_1|ALT_INV_rslt\(4) <= NOT \gfadd_1|rslt\(4);
\gfadd_1|ALT_INV_rslt\(3) <= NOT \gfadd_1|rslt\(3);
\gfadd_1|ALT_INV_rslt\(2) <= NOT \gfadd_1|rslt\(2);
\gfadd_1|ALT_INV_rslt\(1) <= NOT \gfadd_1|rslt\(1);
\gfadd_1|ALT_INV_rslt\(0) <= NOT \gfadd_1|rslt\(0);
\gfmul_1|ALT_INV_Add0~93_sumout\ <= NOT \gfmul_1|Add0~93_sumout\;
\gfmul_1|ALT_INV_Add0~89_sumout\ <= NOT \gfmul_1|Add0~89_sumout\;
\gfmul_1|ALT_INV_Add0~5_sumout\ <= NOT \gfmul_1|Add0~5_sumout\;
\gfmul_1|ALT_INV_Add0~1_sumout\ <= NOT \gfmul_1|Add0~1_sumout\;
\gfmul_1|ALT_INV_count\(19) <= NOT \gfmul_1|count\(19);
\gfmul_1|ALT_INV_count\(18) <= NOT \gfmul_1|count\(18);
\gfmul_1|ALT_INV_count\(17) <= NOT \gfmul_1|count\(17);
\gfmul_1|ALT_INV_count\(16) <= NOT \gfmul_1|count\(16);
\gfmul_1|ALT_INV_count\(15) <= NOT \gfmul_1|count\(15);
\gfmul_1|ALT_INV_count\(21) <= NOT \gfmul_1|count\(21);
\gfmul_1|ALT_INV_count\(13) <= NOT \gfmul_1|count\(13);
\gfmul_1|ALT_INV_count\(14) <= NOT \gfmul_1|count\(14);
\gfmul_1|ALT_INV_count\(10) <= NOT \gfmul_1|count\(10);
\gfmul_1|ALT_INV_count\(11) <= NOT \gfmul_1|count\(11);
\gfmul_1|ALT_INV_count\(12) <= NOT \gfmul_1|count\(12);
\gfmul_1|ALT_INV_count\(22) <= NOT \gfmul_1|count\(22);
\gfmul_1|ALT_INV_count\(23) <= NOT \gfmul_1|count\(23);
\gfmul_1|ALT_INV_count\(20) <= NOT \gfmul_1|count\(20);
\gfmul_1|ALT_INV_count\(4) <= NOT \gfmul_1|count\(4);
\gfmul_1|ALT_INV_count\(5) <= NOT \gfmul_1|count\(5);
\gfmul_1|ALT_INV_count\(6) <= NOT \gfmul_1|count\(6);
\gfmul_1|ALT_INV_count\(7) <= NOT \gfmul_1|count\(7);
\gfmul_1|ALT_INV_count\(8) <= NOT \gfmul_1|count\(8);
\gfmul_1|ALT_INV_count\(9) <= NOT \gfmul_1|count\(9);
\gfmul_1|ALT_INV_count\(27) <= NOT \gfmul_1|count\(27);
\gfmul_1|ALT_INV_count\(28) <= NOT \gfmul_1|count\(28);
\gfmul_1|ALT_INV_count\(29) <= NOT \gfmul_1|count\(29);
\gfmul_1|ALT_INV_count\(30) <= NOT \gfmul_1|count\(30);
\gfmul_1|ALT_INV_count\(24) <= NOT \gfmul_1|count\(24);
\gfmul_1|ALT_INV_count\(3) <= NOT \gfmul_1|count\(3);
\gfmul_1|ALT_INV_count\(25) <= NOT \gfmul_1|count\(25);
\gfmul_1|ALT_INV_count\(26) <= NOT \gfmul_1|count\(26);
\gfmul_1|ALT_INV_Mux0~4_combout\ <= NOT \gfmul_1|Mux0~4_combout\;
\gfmul_1|ALT_INV_rslt_lfsr\(7) <= NOT \gfmul_1|rslt_lfsr\(7);
\gfmul_1|ALT_INV_rslt_lfsr\(6) <= NOT \gfmul_1|rslt_lfsr\(6);
\gfmul_1|ALT_INV_rslt_lfsr\(5) <= NOT \gfmul_1|rslt_lfsr\(5);
\gfmul_1|ALT_INV_rslt_lfsr\(4) <= NOT \gfmul_1|rslt_lfsr\(4);
\gfmul_1|ALT_INV_rslt_lfsr\(3) <= NOT \gfmul_1|rslt_lfsr\(3);
\gfmul_1|ALT_INV_rslt_lfsr\(2) <= NOT \gfmul_1|rslt_lfsr\(2);
\gfmul_1|ALT_INV_rslt_lfsr\(1) <= NOT \gfmul_1|rslt_lfsr\(1);
\gfmul_1|ALT_INV_rslt_lfsr\(0) <= NOT \gfmul_1|rslt_lfsr\(0);
\gfmul_1|ALT_INV_Mux0~0_combout\ <= NOT \gfmul_1|Mux0~0_combout\;

-- Location: IOOBUF_X40_Y0_N93
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

-- Location: IOOBUF_X8_Y0_N59
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

-- Location: IOOBUF_X8_Y0_N93
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

-- Location: IOOBUF_X40_Y0_N76
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

-- Location: IOOBUF_X40_Y0_N59
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

-- Location: IOOBUF_X40_Y0_N42
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

-- Location: IOOBUF_X44_Y0_N53
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

-- Location: IOIBUF_X10_Y0_N35
\operand_1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(0),
	o => \operand_1[0]~input_o\);

-- Location: IOIBUF_X12_Y0_N35
\operand_2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(0),
	o => \operand_2[0]~input_o\);

-- Location: LABCELL_X14_Y2_N42
\gfadd_1|rslt~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~0_combout\ = ( \operand_2[0]~input_o\ & ( !\operand_1[0]~input_o\ ) ) # ( !\operand_2[0]~input_o\ & ( \operand_1[0]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[0]~input_o\,
	dataf => \ALT_INV_operand_2[0]~input_o\,
	combout => \gfadd_1|rslt~0_combout\);

-- Location: IOIBUF_X14_Y0_N1
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X15_Y2_N35
\gfadd_1|rslt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \gfadd_1|rslt~0_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(0));

-- Location: LABCELL_X15_Y2_N15
\rslt[0]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[0]~reg0feeder_combout\ = \gfadd_1|rslt\(0)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfadd_1|ALT_INV_rslt\(0),
	combout => \rslt[0]~reg0feeder_combout\);

-- Location: IOIBUF_X12_Y0_N52
\operand_2[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(5),
	o => \operand_2[5]~input_o\);

-- Location: MLABCELL_X13_Y3_N0
\gfmul_1|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~89_sumout\ = SUM(( !\gfmul_1|count\(0) ) + ( VCC ) + ( !VCC ))
-- \gfmul_1|Add0~90\ = CARRY(( !\gfmul_1|count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(0),
	cin => GND,
	sumout => \gfmul_1|Add0~89_sumout\,
	cout => \gfmul_1|Add0~90\);

-- Location: LABCELL_X14_Y3_N15
\gfmul_1|count[0]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|count[0]~3_combout\ = ( !\gfmul_1|Add0~89_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \gfmul_1|ALT_INV_Add0~89_sumout\,
	combout => \gfmul_1|count[0]~3_combout\);

-- Location: FF_X13_Y3_N5
\gfmul_1|count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \gfmul_1|count[0]~3_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(0));

-- Location: MLABCELL_X13_Y3_N3
\gfmul_1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~5_sumout\ = SUM(( !\gfmul_1|count\(1) ) + ( VCC ) + ( \gfmul_1|Add0~90\ ))
-- \gfmul_1|Add0~6\ = CARRY(( !\gfmul_1|count\(1) ) + ( VCC ) + ( \gfmul_1|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(1),
	cin => \gfmul_1|Add0~90\,
	sumout => \gfmul_1|Add0~5_sumout\,
	cout => \gfmul_1|Add0~6\);

-- Location: LABCELL_X14_Y3_N18
\gfmul_1|count[1]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|count[1]~2_combout\ = ( !\gfmul_1|Add0~5_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \gfmul_1|ALT_INV_Add0~5_sumout\,
	combout => \gfmul_1|count[1]~2_combout\);

-- Location: FF_X13_Y3_N8
\gfmul_1|count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \gfmul_1|count[1]~2_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(1));

-- Location: MLABCELL_X13_Y3_N6
\gfmul_1|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~1_sumout\ = SUM(( !\gfmul_1|count\(2) ) + ( VCC ) + ( \gfmul_1|Add0~6\ ))
-- \gfmul_1|Add0~2\ = CARRY(( !\gfmul_1|count\(2) ) + ( VCC ) + ( \gfmul_1|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(2),
	cin => \gfmul_1|Add0~6\,
	sumout => \gfmul_1|Add0~1_sumout\,
	cout => \gfmul_1|Add0~2\);

-- Location: LABCELL_X14_Y3_N12
\gfmul_1|count[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|count[2]~1_combout\ = ( !\gfmul_1|Add0~1_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \gfmul_1|ALT_INV_Add0~1_sumout\,
	combout => \gfmul_1|count[2]~1_combout\);

-- Location: FF_X13_Y3_N2
\gfmul_1|count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \gfmul_1|count[2]~1_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(2));

-- Location: IOIBUF_X12_Y0_N1
\operand_2[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(4),
	o => \operand_2[4]~input_o\);

-- Location: IOIBUF_X44_Y0_N35
\operand_2[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(7),
	o => \operand_2[7]~input_o\);

-- Location: IOIBUF_X14_Y0_N35
\operand_2[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(3),
	o => \operand_2[3]~input_o\);

-- Location: IOIBUF_X42_Y0_N52
\operand_2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(1),
	o => \operand_2[1]~input_o\);

-- Location: IOIBUF_X42_Y0_N1
\operand_2[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(2),
	o => \operand_2[2]~input_o\);

-- Location: LABCELL_X14_Y3_N24
\gfmul_1|Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Mux0~4_combout\ = ( !\gfmul_1|count\(1) & ( (!\gfmul_1|count\(0) & ((((!\gfmul_1|count\(2)))) # (\operand_2[3]~input_o\))) # (\gfmul_1|count\(0) & (((\operand_2[2]~input_o\ & ((\gfmul_1|count\(2))))))) ) ) # ( \gfmul_1|count\(1) & ( 
-- (!\gfmul_1|count\(0) & ((((!\gfmul_1|count\(2)) # (\operand_2[1]~input_o\))))) # (\gfmul_1|count\(0) & (((\operand_2[0]~input_o\ & ((\gfmul_1|count\(2))))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1010101010101010101010101010101000100111001001110000010110101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(0),
	datab => \ALT_INV_operand_2[3]~input_o\,
	datac => \ALT_INV_operand_2[0]~input_o\,
	datad => \ALT_INV_operand_2[1]~input_o\,
	datae => \gfmul_1|ALT_INV_count\(1),
	dataf => \gfmul_1|ALT_INV_count\(2),
	datag => \ALT_INV_operand_2[2]~input_o\,
	combout => \gfmul_1|Mux0~4_combout\);

-- Location: IOIBUF_X10_Y0_N18
\operand_2[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(6),
	o => \operand_2[6]~input_o\);

-- Location: LABCELL_X14_Y3_N6
\gfmul_1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Mux0~0_combout\ = ( !\gfmul_1|count\(1) & ( ((!\gfmul_1|count\(2) & ((!\gfmul_1|Mux0~4_combout\ & (\operand_2[6]~input_o\)) # (\gfmul_1|Mux0~4_combout\ & ((\operand_2[7]~input_o\))))) # (\gfmul_1|count\(2) & (((\gfmul_1|Mux0~4_combout\))))) ) ) # 
-- ( \gfmul_1|count\(1) & ( (!\gfmul_1|count\(2) & (((!\gfmul_1|Mux0~4_combout\ & ((\operand_2[4]~input_o\))) # (\gfmul_1|Mux0~4_combout\ & (\operand_2[5]~input_o\))))) # (\gfmul_1|count\(2) & ((((\gfmul_1|Mux0~4_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000110000001100000011000000110000110011111111110111011101110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[5]~input_o\,
	datab => \gfmul_1|ALT_INV_count\(2),
	datac => \ALT_INV_operand_2[4]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \gfmul_1|ALT_INV_count\(1),
	dataf => \gfmul_1|ALT_INV_Mux0~4_combout\,
	datag => \ALT_INV_operand_2[6]~input_o\,
	combout => \gfmul_1|Mux0~0_combout\);

-- Location: IOIBUF_X8_Y0_N75
\operand_1[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(7),
	o => \operand_1[7]~input_o\);

-- Location: IOIBUF_X8_Y0_N41
\operand_1[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(6),
	o => \operand_1[6]~input_o\);

-- Location: IOIBUF_X42_Y0_N35
\operand_1[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(5),
	o => \operand_1[5]~input_o\);

-- Location: IOIBUF_X10_Y0_N1
\operand_1[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(4),
	o => \operand_1[4]~input_o\);

-- Location: IOIBUF_X12_Y0_N18
\operand_1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(2),
	o => \operand_1[2]~input_o\);

-- Location: MLABCELL_X13_Y3_N9
\gfmul_1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~17_sumout\ = SUM(( \gfmul_1|count\(3) ) + ( VCC ) + ( \gfmul_1|Add0~2\ ))
-- \gfmul_1|Add0~18\ = CARRY(( \gfmul_1|count\(3) ) + ( VCC ) + ( \gfmul_1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(3),
	cin => \gfmul_1|Add0~2\,
	sumout => \gfmul_1|Add0~17_sumout\,
	cout => \gfmul_1|Add0~18\);

-- Location: FF_X13_Y3_N11
\gfmul_1|count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~17_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(3));

-- Location: MLABCELL_X13_Y3_N12
\gfmul_1|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~61_sumout\ = SUM(( \gfmul_1|count\(4) ) + ( VCC ) + ( \gfmul_1|Add0~18\ ))
-- \gfmul_1|Add0~62\ = CARRY(( \gfmul_1|count\(4) ) + ( VCC ) + ( \gfmul_1|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(4),
	cin => \gfmul_1|Add0~18\,
	sumout => \gfmul_1|Add0~61_sumout\,
	cout => \gfmul_1|Add0~62\);

-- Location: FF_X13_Y3_N14
\gfmul_1|count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~61_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(4));

-- Location: MLABCELL_X13_Y3_N15
\gfmul_1|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~57_sumout\ = SUM(( \gfmul_1|count\(5) ) + ( VCC ) + ( \gfmul_1|Add0~62\ ))
-- \gfmul_1|Add0~58\ = CARRY(( \gfmul_1|count\(5) ) + ( VCC ) + ( \gfmul_1|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(5),
	cin => \gfmul_1|Add0~62\,
	sumout => \gfmul_1|Add0~57_sumout\,
	cout => \gfmul_1|Add0~58\);

-- Location: FF_X13_Y3_N17
\gfmul_1|count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~57_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(5));

-- Location: MLABCELL_X13_Y3_N18
\gfmul_1|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~53_sumout\ = SUM(( \gfmul_1|count[6]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~58\ ))
-- \gfmul_1|Add0~54\ = CARRY(( \gfmul_1|count[6]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[6]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~58\,
	sumout => \gfmul_1|Add0~53_sumout\,
	cout => \gfmul_1|Add0~54\);

-- Location: FF_X13_Y3_N20
\gfmul_1|count[6]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~53_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[6]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y3_N21
\gfmul_1|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~49_sumout\ = SUM(( \gfmul_1|count\(7) ) + ( VCC ) + ( \gfmul_1|Add0~54\ ))
-- \gfmul_1|Add0~50\ = CARRY(( \gfmul_1|count\(7) ) + ( VCC ) + ( \gfmul_1|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(7),
	cin => \gfmul_1|Add0~54\,
	sumout => \gfmul_1|Add0~49_sumout\,
	cout => \gfmul_1|Add0~50\);

-- Location: FF_X13_Y3_N23
\gfmul_1|count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~49_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(7));

-- Location: MLABCELL_X13_Y3_N24
\gfmul_1|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~45_sumout\ = SUM(( \gfmul_1|count[8]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~50\ ))
-- \gfmul_1|Add0~46\ = CARRY(( \gfmul_1|count[8]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[8]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~50\,
	sumout => \gfmul_1|Add0~45_sumout\,
	cout => \gfmul_1|Add0~46\);

-- Location: FF_X13_Y3_N26
\gfmul_1|count[8]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~45_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[8]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y3_N27
\gfmul_1|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~41_sumout\ = SUM(( \gfmul_1|count\(9) ) + ( VCC ) + ( \gfmul_1|Add0~46\ ))
-- \gfmul_1|Add0~42\ = CARRY(( \gfmul_1|count\(9) ) + ( VCC ) + ( \gfmul_1|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(9),
	cin => \gfmul_1|Add0~46\,
	sumout => \gfmul_1|Add0~41_sumout\,
	cout => \gfmul_1|Add0~42\);

-- Location: FF_X13_Y3_N29
\gfmul_1|count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~41_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(9));

-- Location: MLABCELL_X13_Y3_N30
\gfmul_1|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~85_sumout\ = SUM(( \gfmul_1|count\(10) ) + ( VCC ) + ( \gfmul_1|Add0~42\ ))
-- \gfmul_1|Add0~86\ = CARRY(( \gfmul_1|count\(10) ) + ( VCC ) + ( \gfmul_1|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(10),
	cin => \gfmul_1|Add0~42\,
	sumout => \gfmul_1|Add0~85_sumout\,
	cout => \gfmul_1|Add0~86\);

-- Location: FF_X13_Y3_N31
\gfmul_1|count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~85_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(10));

-- Location: MLABCELL_X13_Y3_N33
\gfmul_1|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~81_sumout\ = SUM(( \gfmul_1|count\(11) ) + ( VCC ) + ( \gfmul_1|Add0~86\ ))
-- \gfmul_1|Add0~82\ = CARRY(( \gfmul_1|count\(11) ) + ( VCC ) + ( \gfmul_1|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(11),
	cin => \gfmul_1|Add0~86\,
	sumout => \gfmul_1|Add0~81_sumout\,
	cout => \gfmul_1|Add0~82\);

-- Location: FF_X13_Y3_N35
\gfmul_1|count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~81_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(11));

-- Location: MLABCELL_X13_Y3_N36
\gfmul_1|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~77_sumout\ = SUM(( \gfmul_1|count\(12) ) + ( VCC ) + ( \gfmul_1|Add0~82\ ))
-- \gfmul_1|Add0~78\ = CARRY(( \gfmul_1|count\(12) ) + ( VCC ) + ( \gfmul_1|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(12),
	cin => \gfmul_1|Add0~82\,
	sumout => \gfmul_1|Add0~77_sumout\,
	cout => \gfmul_1|Add0~78\);

-- Location: FF_X13_Y3_N38
\gfmul_1|count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~77_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(12));

-- Location: MLABCELL_X13_Y3_N39
\gfmul_1|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~101_sumout\ = SUM(( \gfmul_1|count[13]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~78\ ))
-- \gfmul_1|Add0~102\ = CARRY(( \gfmul_1|count[13]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[13]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~78\,
	sumout => \gfmul_1|Add0~101_sumout\,
	cout => \gfmul_1|Add0~102\);

-- Location: FF_X13_Y3_N41
\gfmul_1|count[13]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~101_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[13]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y3_N42
\gfmul_1|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~97_sumout\ = SUM(( \gfmul_1|count\(14) ) + ( VCC ) + ( \gfmul_1|Add0~102\ ))
-- \gfmul_1|Add0~98\ = CARRY(( \gfmul_1|count\(14) ) + ( VCC ) + ( \gfmul_1|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(14),
	cin => \gfmul_1|Add0~102\,
	sumout => \gfmul_1|Add0~97_sumout\,
	cout => \gfmul_1|Add0~98\);

-- Location: FF_X13_Y3_N43
\gfmul_1|count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~97_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(14));

-- Location: MLABCELL_X13_Y3_N45
\gfmul_1|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~109_sumout\ = SUM(( \gfmul_1|count[15]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~98\ ))
-- \gfmul_1|Add0~110\ = CARRY(( \gfmul_1|count[15]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count[15]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~98\,
	sumout => \gfmul_1|Add0~109_sumout\,
	cout => \gfmul_1|Add0~110\);

-- Location: FF_X13_Y3_N47
\gfmul_1|count[15]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~109_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[15]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y3_N48
\gfmul_1|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~113_sumout\ = SUM(( \gfmul_1|count[16]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~110\ ))
-- \gfmul_1|Add0~114\ = CARRY(( \gfmul_1|count[16]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[16]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~110\,
	sumout => \gfmul_1|Add0~113_sumout\,
	cout => \gfmul_1|Add0~114\);

-- Location: FF_X13_Y3_N50
\gfmul_1|count[16]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~113_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[16]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y3_N51
\gfmul_1|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~117_sumout\ = SUM(( \gfmul_1|count\(17) ) + ( VCC ) + ( \gfmul_1|Add0~114\ ))
-- \gfmul_1|Add0~118\ = CARRY(( \gfmul_1|count\(17) ) + ( VCC ) + ( \gfmul_1|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(17),
	cin => \gfmul_1|Add0~114\,
	sumout => \gfmul_1|Add0~117_sumout\,
	cout => \gfmul_1|Add0~118\);

-- Location: FF_X13_Y3_N52
\gfmul_1|count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~117_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(17));

-- Location: MLABCELL_X13_Y3_N54
\gfmul_1|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~121_sumout\ = SUM(( \gfmul_1|count\(18) ) + ( VCC ) + ( \gfmul_1|Add0~118\ ))
-- \gfmul_1|Add0~122\ = CARRY(( \gfmul_1|count\(18) ) + ( VCC ) + ( \gfmul_1|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(18),
	cin => \gfmul_1|Add0~118\,
	sumout => \gfmul_1|Add0~121_sumout\,
	cout => \gfmul_1|Add0~122\);

-- Location: FF_X13_Y3_N56
\gfmul_1|count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~121_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(18));

-- Location: MLABCELL_X13_Y3_N57
\gfmul_1|Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~125_sumout\ = SUM(( \gfmul_1|count\(19) ) + ( VCC ) + ( \gfmul_1|Add0~122\ ))
-- \gfmul_1|Add0~126\ = CARRY(( \gfmul_1|count\(19) ) + ( VCC ) + ( \gfmul_1|Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(19),
	cin => \gfmul_1|Add0~122\,
	sumout => \gfmul_1|Add0~125_sumout\,
	cout => \gfmul_1|Add0~126\);

-- Location: FF_X13_Y3_N59
\gfmul_1|count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~125_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(19));

-- Location: MLABCELL_X13_Y2_N0
\gfmul_1|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~65_sumout\ = SUM(( \gfmul_1|count\(20) ) + ( VCC ) + ( \gfmul_1|Add0~126\ ))
-- \gfmul_1|Add0~66\ = CARRY(( \gfmul_1|count\(20) ) + ( VCC ) + ( \gfmul_1|Add0~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(20),
	cin => \gfmul_1|Add0~126\,
	sumout => \gfmul_1|Add0~65_sumout\,
	cout => \gfmul_1|Add0~66\);

-- Location: FF_X13_Y2_N2
\gfmul_1|count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~65_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(20));

-- Location: MLABCELL_X13_Y2_N3
\gfmul_1|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~105_sumout\ = SUM(( \gfmul_1|count[21]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~66\ ))
-- \gfmul_1|Add0~106\ = CARRY(( \gfmul_1|count[21]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count[21]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~66\,
	sumout => \gfmul_1|Add0~105_sumout\,
	cout => \gfmul_1|Add0~106\);

-- Location: FF_X13_Y2_N5
\gfmul_1|count[21]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~105_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[21]~DUPLICATE_q\);

-- Location: MLABCELL_X13_Y2_N6
\gfmul_1|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~73_sumout\ = SUM(( \gfmul_1|count\(22) ) + ( VCC ) + ( \gfmul_1|Add0~106\ ))
-- \gfmul_1|Add0~74\ = CARRY(( \gfmul_1|count\(22) ) + ( VCC ) + ( \gfmul_1|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(22),
	cin => \gfmul_1|Add0~106\,
	sumout => \gfmul_1|Add0~73_sumout\,
	cout => \gfmul_1|Add0~74\);

-- Location: FF_X13_Y2_N8
\gfmul_1|count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~73_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(22));

-- Location: MLABCELL_X13_Y2_N9
\gfmul_1|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~69_sumout\ = SUM(( \gfmul_1|count\(23) ) + ( VCC ) + ( \gfmul_1|Add0~74\ ))
-- \gfmul_1|Add0~70\ = CARRY(( \gfmul_1|count\(23) ) + ( VCC ) + ( \gfmul_1|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(23),
	cin => \gfmul_1|Add0~74\,
	sumout => \gfmul_1|Add0~69_sumout\,
	cout => \gfmul_1|Add0~70\);

-- Location: FF_X13_Y2_N11
\gfmul_1|count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~69_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(23));

-- Location: MLABCELL_X13_Y2_N36
\gfmul_1|Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~3_combout\ = ( !\gfmul_1|count\(10) & ( !\gfmul_1|count\(12) & ( (!\gfmul_1|count\(20) & (!\gfmul_1|count\(22) & (!\gfmul_1|count\(11) & !\gfmul_1|count\(23)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(20),
	datab => \gfmul_1|ALT_INV_count\(22),
	datac => \gfmul_1|ALT_INV_count\(11),
	datad => \gfmul_1|ALT_INV_count\(23),
	datae => \gfmul_1|ALT_INV_count\(10),
	dataf => \gfmul_1|ALT_INV_count\(12),
	combout => \gfmul_1|Equal0~3_combout\);

-- Location: FF_X13_Y2_N56
\gfmul_1|count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|count~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(31));

-- Location: MLABCELL_X13_Y2_N12
\gfmul_1|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~21_sumout\ = SUM(( \gfmul_1|count\(24) ) + ( VCC ) + ( \gfmul_1|Add0~70\ ))
-- \gfmul_1|Add0~22\ = CARRY(( \gfmul_1|count\(24) ) + ( VCC ) + ( \gfmul_1|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(24),
	cin => \gfmul_1|Add0~70\,
	sumout => \gfmul_1|Add0~21_sumout\,
	cout => \gfmul_1|Add0~22\);

-- Location: FF_X13_Y2_N14
\gfmul_1|count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~21_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(24));

-- Location: MLABCELL_X13_Y2_N15
\gfmul_1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~13_sumout\ = SUM(( \gfmul_1|count\(25) ) + ( VCC ) + ( \gfmul_1|Add0~22\ ))
-- \gfmul_1|Add0~14\ = CARRY(( \gfmul_1|count\(25) ) + ( VCC ) + ( \gfmul_1|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(25),
	cin => \gfmul_1|Add0~22\,
	sumout => \gfmul_1|Add0~13_sumout\,
	cout => \gfmul_1|Add0~14\);

-- Location: FF_X13_Y2_N17
\gfmul_1|count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~13_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(25));

-- Location: MLABCELL_X13_Y2_N18
\gfmul_1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~9_sumout\ = SUM(( \gfmul_1|count\(26) ) + ( VCC ) + ( \gfmul_1|Add0~14\ ))
-- \gfmul_1|Add0~10\ = CARRY(( \gfmul_1|count\(26) ) + ( VCC ) + ( \gfmul_1|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(26),
	cin => \gfmul_1|Add0~14\,
	sumout => \gfmul_1|Add0~9_sumout\,
	cout => \gfmul_1|Add0~10\);

-- Location: FF_X13_Y2_N20
\gfmul_1|count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~9_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(26));

-- Location: MLABCELL_X13_Y2_N21
\gfmul_1|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~37_sumout\ = SUM(( \gfmul_1|count\(27) ) + ( VCC ) + ( \gfmul_1|Add0~10\ ))
-- \gfmul_1|Add0~38\ = CARRY(( \gfmul_1|count\(27) ) + ( VCC ) + ( \gfmul_1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(27),
	cin => \gfmul_1|Add0~10\,
	sumout => \gfmul_1|Add0~37_sumout\,
	cout => \gfmul_1|Add0~38\);

-- Location: FF_X13_Y2_N23
\gfmul_1|count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~37_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(27));

-- Location: MLABCELL_X13_Y2_N24
\gfmul_1|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~33_sumout\ = SUM(( \gfmul_1|count\(28) ) + ( VCC ) + ( \gfmul_1|Add0~38\ ))
-- \gfmul_1|Add0~34\ = CARRY(( \gfmul_1|count\(28) ) + ( VCC ) + ( \gfmul_1|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(28),
	cin => \gfmul_1|Add0~38\,
	sumout => \gfmul_1|Add0~33_sumout\,
	cout => \gfmul_1|Add0~34\);

-- Location: FF_X13_Y2_N26
\gfmul_1|count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~33_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(28));

-- Location: MLABCELL_X13_Y2_N27
\gfmul_1|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~29_sumout\ = SUM(( \gfmul_1|count\(29) ) + ( VCC ) + ( \gfmul_1|Add0~34\ ))
-- \gfmul_1|Add0~30\ = CARRY(( \gfmul_1|count\(29) ) + ( VCC ) + ( \gfmul_1|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(29),
	cin => \gfmul_1|Add0~34\,
	sumout => \gfmul_1|Add0~29_sumout\,
	cout => \gfmul_1|Add0~30\);

-- Location: FF_X13_Y2_N29
\gfmul_1|count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~29_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(29));

-- Location: MLABCELL_X13_Y2_N30
\gfmul_1|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~25_sumout\ = SUM(( \gfmul_1|count\(30) ) + ( VCC ) + ( \gfmul_1|Add0~30\ ))
-- \gfmul_1|Add0~26\ = CARRY(( \gfmul_1|count\(30) ) + ( VCC ) + ( \gfmul_1|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(30),
	cin => \gfmul_1|Add0~30\,
	sumout => \gfmul_1|Add0~25_sumout\,
	cout => \gfmul_1|Add0~26\);

-- Location: FF_X13_Y2_N32
\gfmul_1|count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~25_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(30));

-- Location: MLABCELL_X13_Y2_N33
\gfmul_1|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~93_sumout\ = SUM(( \gfmul_1|count\(31) ) + ( VCC ) + ( \gfmul_1|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(31),
	cin => \gfmul_1|Add0~26\,
	sumout => \gfmul_1|Add0~93_sumout\);

-- Location: MLABCELL_X13_Y2_N54
\gfmul_1|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|count~0_combout\ = ( \gfmul_1|Add0~93_sumout\ & ( !\gfmul_1|Equal0~6_combout\ ) ) # ( !\gfmul_1|Add0~93_sumout\ & ( \gfmul_1|Equal0~6_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_Equal0~6_combout\,
	dataf => \gfmul_1|ALT_INV_Add0~93_sumout\,
	combout => \gfmul_1|count~0_combout\);

-- Location: FF_X13_Y2_N55
\gfmul_1|count[31]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|count~0_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[31]~DUPLICATE_q\);

-- Location: FF_X13_Y3_N40
\gfmul_1|count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~101_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(13));

-- Location: LABCELL_X14_Y2_N6
\gfmul_1|Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~4_combout\ = ( \gfmul_1|count\(0) & ( !\gfmul_1|count\(13) & ( (!\gfmul_1|count[31]~DUPLICATE_q\ & (\gfmul_1|count\(2) & (\gfmul_1|count\(1) & !\gfmul_1|count\(14)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000100000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count[31]~DUPLICATE_q\,
	datab => \gfmul_1|ALT_INV_count\(2),
	datac => \gfmul_1|ALT_INV_count\(1),
	datad => \gfmul_1|ALT_INV_count\(14),
	datae => \gfmul_1|ALT_INV_count\(0),
	dataf => \gfmul_1|ALT_INV_count\(13),
	combout => \gfmul_1|Equal0~4_combout\);

-- Location: FF_X13_Y3_N19
\gfmul_1|count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~53_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(6));

-- Location: FF_X13_Y3_N25
\gfmul_1|count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~45_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(8));

-- Location: FF_X13_Y3_N16
\gfmul_1|count[5]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~57_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[5]~DUPLICATE_q\);

-- Location: LABCELL_X14_Y2_N36
\gfmul_1|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~2_combout\ = ( !\gfmul_1|count\(9) & ( !\gfmul_1|count[5]~DUPLICATE_q\ & ( (!\gfmul_1|count\(7) & (!\gfmul_1|count\(4) & (!\gfmul_1|count\(6) & !\gfmul_1|count\(8)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(7),
	datab => \gfmul_1|ALT_INV_count\(4),
	datac => \gfmul_1|ALT_INV_count\(6),
	datad => \gfmul_1|ALT_INV_count\(8),
	datae => \gfmul_1|ALT_INV_count\(9),
	dataf => \gfmul_1|ALT_INV_count[5]~DUPLICATE_q\,
	combout => \gfmul_1|Equal0~2_combout\);

-- Location: MLABCELL_X13_Y2_N51
\gfmul_1|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~0_combout\ = ( !\gfmul_1|count\(26) & ( !\gfmul_1|count\(25) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(25),
	dataf => \gfmul_1|ALT_INV_count\(26),
	combout => \gfmul_1|Equal0~0_combout\);

-- Location: MLABCELL_X13_Y2_N42
\gfmul_1|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~1_combout\ = ( !\gfmul_1|count\(27) & ( !\gfmul_1|count\(28) & ( (!\gfmul_1|count\(29) & (!\gfmul_1|count\(30) & (!\gfmul_1|count\(3) & !\gfmul_1|count\(24)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(29),
	datab => \gfmul_1|ALT_INV_count\(30),
	datac => \gfmul_1|ALT_INV_count\(3),
	datad => \gfmul_1|ALT_INV_count\(24),
	datae => \gfmul_1|ALT_INV_count\(27),
	dataf => \gfmul_1|ALT_INV_count\(28),
	combout => \gfmul_1|Equal0~1_combout\);

-- Location: FF_X13_Y2_N4
\gfmul_1|count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~105_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(21));

-- Location: FF_X13_Y3_N58
\gfmul_1|count[19]~DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~125_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count[19]~DUPLICATE_q\);

-- Location: FF_X13_Y3_N46
\gfmul_1|count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~109_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(15));

-- Location: FF_X13_Y3_N49
\gfmul_1|count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|Add0~113_sumout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|count\(16));

-- Location: LABCELL_X14_Y2_N48
\gfmul_1|Equal0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~5_combout\ = ( !\gfmul_1|count\(15) & ( !\gfmul_1|count\(16) & ( (!\gfmul_1|count\(18) & (!\gfmul_1|count\(21) & (!\gfmul_1|count[19]~DUPLICATE_q\ & !\gfmul_1|count\(17)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(18),
	datab => \gfmul_1|ALT_INV_count\(21),
	datac => \gfmul_1|ALT_INV_count[19]~DUPLICATE_q\,
	datad => \gfmul_1|ALT_INV_count\(17),
	datae => \gfmul_1|ALT_INV_count\(15),
	dataf => \gfmul_1|ALT_INV_count\(16),
	combout => \gfmul_1|Equal0~5_combout\);

-- Location: LABCELL_X14_Y2_N18
\gfmul_1|Equal0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~6_combout\ = ( \gfmul_1|Equal0~1_combout\ & ( \gfmul_1|Equal0~5_combout\ & ( (\gfmul_1|Equal0~3_combout\ & (\gfmul_1|Equal0~4_combout\ & (\gfmul_1|Equal0~2_combout\ & \gfmul_1|Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Equal0~3_combout\,
	datab => \gfmul_1|ALT_INV_Equal0~4_combout\,
	datac => \gfmul_1|ALT_INV_Equal0~2_combout\,
	datad => \gfmul_1|ALT_INV_Equal0~0_combout\,
	datae => \gfmul_1|ALT_INV_Equal0~1_combout\,
	dataf => \gfmul_1|ALT_INV_Equal0~5_combout\,
	combout => \gfmul_1|Equal0~6_combout\);

-- Location: FF_X14_Y2_N32
\gfmul_1|rslt_lfsr[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt[0]~0_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(1));

-- Location: IOIBUF_X10_Y0_N52
\operand_1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(1),
	o => \operand_1[1]~input_o\);

-- Location: LABCELL_X14_Y2_N3
\gfmul_1|rslt_lfsr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt_lfsr~0_combout\ = ( \gfmul_1|Mux0~0_combout\ & ( !\gfmul_1|rslt_lfsr\(7) $ (((!\rst~input_o\) # (!\gfmul_1|rslt_lfsr\(1) $ (\operand_1[1]~input_o\)))) ) ) # ( !\gfmul_1|Mux0~0_combout\ & ( !\gfmul_1|rslt_lfsr\(7) $ (((!\rst~input_o\) # 
-- (!\gfmul_1|rslt_lfsr\(1)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011001010110010101100101011001010110011001010101011001100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	datab => \ALT_INV_rst~input_o\,
	datac => \gfmul_1|ALT_INV_rslt_lfsr\(1),
	datad => \ALT_INV_operand_1[1]~input_o\,
	dataf => \gfmul_1|ALT_INV_Mux0~0_combout\,
	combout => \gfmul_1|rslt_lfsr~0_combout\);

-- Location: FF_X14_Y2_N5
\gfmul_1|rslt_lfsr[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt_lfsr~0_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(2));

-- Location: LABCELL_X14_Y2_N54
\gfmul_1|rslt_lfsr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt_lfsr~1_combout\ = ( \gfmul_1|rslt_lfsr\(2) & ( !\gfmul_1|rslt_lfsr\(7) $ (((!\rst~input_o\) # ((\gfmul_1|Mux0~0_combout\ & \operand_1[2]~input_o\)))) ) ) # ( !\gfmul_1|rslt_lfsr\(2) & ( !\gfmul_1|rslt_lfsr\(7) $ (((!\rst~input_o\) # 
-- ((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[2]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010110010101010101011001100110011001010110011001100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	datab => \ALT_INV_rst~input_o\,
	datac => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datad => \ALT_INV_operand_1[2]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(2),
	combout => \gfmul_1|rslt_lfsr~1_combout\);

-- Location: FF_X14_Y2_N56
\gfmul_1|rslt_lfsr[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt_lfsr~1_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(3));

-- Location: IOIBUF_X14_Y0_N52
\operand_1[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(3),
	o => \operand_1[3]~input_o\);

-- Location: LABCELL_X14_Y2_N57
\gfmul_1|rslt_lfsr~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt_lfsr~2_combout\ = ( \operand_1[3]~input_o\ & ( !\gfmul_1|rslt_lfsr\(7) $ (((!\rst~input_o\) # (!\gfmul_1|Mux0~0_combout\ $ (\gfmul_1|rslt_lfsr\(3))))) ) ) # ( !\operand_1[3]~input_o\ & ( !\gfmul_1|rslt_lfsr\(7) $ (((!\rst~input_o\) # 
-- (!\gfmul_1|rslt_lfsr\(3)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101100110010101010110011001010110011001010101011001100101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	datab => \ALT_INV_rst~input_o\,
	datac => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datad => \gfmul_1|ALT_INV_rslt_lfsr\(3),
	dataf => \ALT_INV_operand_1[3]~input_o\,
	combout => \gfmul_1|rslt_lfsr~2_combout\);

-- Location: FF_X14_Y2_N58
\gfmul_1|rslt_lfsr[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt_lfsr~2_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(4));

-- Location: LABCELL_X14_Y2_N12
\gfmul_1|rslt[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[4]~4_combout\ = ( \gfmul_1|rslt_lfsr\(4) & ( (\rst~input_o\ & ((!\operand_1[4]~input_o\) # (!\gfmul_1|Mux0~0_combout\))) ) ) # ( !\gfmul_1|rslt_lfsr\(4) & ( (\operand_1[4]~input_o\ & (\rst~input_o\ & \gfmul_1|Mux0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000011000000000000001100001111000011000000111100001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_operand_1[4]~input_o\,
	datac => \ALT_INV_rst~input_o\,
	datad => \gfmul_1|ALT_INV_Mux0~0_combout\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(4),
	combout => \gfmul_1|rslt[4]~4_combout\);

-- Location: FF_X14_Y2_N14
\gfmul_1|rslt_lfsr[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt[4]~4_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(5));

-- Location: LABCELL_X14_Y2_N45
\gfmul_1|rslt[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[5]~5_combout\ = ( \gfmul_1|rslt_lfsr\(5) & ( (\rst~input_o\ & ((!\operand_1[5]~input_o\) # (!\gfmul_1|Mux0~0_combout\))) ) ) # ( !\gfmul_1|rslt_lfsr\(5) & ( (\rst~input_o\ & (\operand_1[5]~input_o\ & \gfmul_1|Mux0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010101010101010100000101010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_operand_1[5]~input_o\,
	datad => \gfmul_1|ALT_INV_Mux0~0_combout\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(5),
	combout => \gfmul_1|rslt[5]~5_combout\);

-- Location: FF_X14_Y2_N47
\gfmul_1|rslt_lfsr[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt[5]~5_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(6));

-- Location: LABCELL_X14_Y2_N33
\gfmul_1|rslt[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[6]~6_combout\ = ( \gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & (!\operand_1[6]~input_o\ $ (!\gfmul_1|rslt_lfsr\(6)))) ) ) # ( !\gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & \gfmul_1|rslt_lfsr\(6)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000001010101000000000101010100000101010100000000010101010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_operand_1[6]~input_o\,
	datad => \gfmul_1|ALT_INV_rslt_lfsr\(6),
	dataf => \gfmul_1|ALT_INV_Mux0~0_combout\,
	combout => \gfmul_1|rslt[6]~6_combout\);

-- Location: FF_X14_Y2_N35
\gfmul_1|rslt_lfsr[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt[6]~6_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(7));

-- Location: LABCELL_X14_Y3_N33
\gfmul_1|rslt[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[7]~7_combout\ = ( \gfmul_1|rslt_lfsr\(7) & ( \gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & !\operand_1[7]~input_o\) ) ) ) # ( !\gfmul_1|rslt_lfsr\(7) & ( \gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & \operand_1[7]~input_o\) ) ) ) # ( 
-- \gfmul_1|rslt_lfsr\(7) & ( !\gfmul_1|Mux0~0_combout\ & ( \rst~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000101000001010101000001010000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datac => \ALT_INV_operand_1[7]~input_o\,
	datae => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	dataf => \gfmul_1|ALT_INV_Mux0~0_combout\,
	combout => \gfmul_1|rslt[7]~7_combout\);

-- Location: FF_X14_Y2_N25
\gfmul_1|rslt_lfsr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \gfmul_1|rslt[7]~7_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(0));

-- Location: LABCELL_X14_Y2_N30
\gfmul_1|rslt[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[0]~0_combout\ = ( \gfmul_1|rslt_lfsr\(0) & ( (\rst~input_o\ & ((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[0]~input_o\))) ) ) # ( !\gfmul_1|rslt_lfsr\(0) & ( (\rst~input_o\ & (\gfmul_1|Mux0~0_combout\ & \operand_1[0]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000001000000010000000101010100010101000101010001010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datac => \ALT_INV_operand_1[0]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(0),
	combout => \gfmul_1|rslt[0]~0_combout\);

-- Location: IOIBUF_X14_Y0_N18
\sel~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel,
	o => \sel~input_o\);

-- Location: FF_X15_Y2_N16
\rslt[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[0]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[0]~0_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[0]~reg0_q\);

-- Location: LABCELL_X14_Y3_N54
\gfadd_1|rslt~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~1_combout\ = ( \operand_2[1]~input_o\ & ( !\operand_1[1]~input_o\ ) ) # ( !\operand_2[1]~input_o\ & ( \operand_1[1]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[1]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfadd_1|rslt~1_combout\);

-- Location: FF_X14_Y3_N56
\gfadd_1|rslt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfadd_1|rslt~1_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(1));

-- Location: LABCELL_X14_Y3_N0
\rslt[1]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[1]~reg0feeder_combout\ = \gfadd_1|rslt\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfadd_1|ALT_INV_rslt\(1),
	combout => \rslt[1]~reg0feeder_combout\);

-- Location: LABCELL_X14_Y3_N45
\gfmul_1|rslt[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[1]~1_combout\ = ( \gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(1) $ (!\operand_1[1]~input_o\))) ) ) # ( !\gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & \gfmul_1|rslt_lfsr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010001000100010001000100010100000101000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \gfmul_1|ALT_INV_rslt_lfsr\(1),
	datac => \ALT_INV_operand_1[1]~input_o\,
	dataf => \gfmul_1|ALT_INV_Mux0~0_combout\,
	combout => \gfmul_1|rslt[1]~1_combout\);

-- Location: FF_X14_Y3_N1
\rslt[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[1]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[1]~1_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[1]~reg0_q\);

-- Location: LABCELL_X14_Y3_N48
\gfadd_1|rslt~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~2_combout\ = ( !\operand_2[2]~input_o\ & ( \operand_1[2]~input_o\ ) ) # ( \operand_2[2]~input_o\ & ( !\operand_1[2]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111111111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_operand_2[2]~input_o\,
	dataf => \ALT_INV_operand_1[2]~input_o\,
	combout => \gfadd_1|rslt~2_combout\);

-- Location: FF_X14_Y3_N50
\gfadd_1|rslt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfadd_1|rslt~2_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(2));

-- Location: LABCELL_X14_Y3_N42
\rslt[2]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[2]~reg0feeder_combout\ = \gfadd_1|rslt\(2)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfadd_1|ALT_INV_rslt\(2),
	combout => \rslt[2]~reg0feeder_combout\);

-- Location: LABCELL_X14_Y3_N3
\gfmul_1|rslt[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[2]~2_combout\ = ( \gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & (!\operand_1[2]~input_o\ $ (!\gfmul_1|rslt_lfsr\(2)))) ) ) # ( !\gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & \gfmul_1|rslt_lfsr\(2)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000101000010100000010100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_1[2]~input_o\,
	datac => \ALT_INV_rst~input_o\,
	datad => \gfmul_1|ALT_INV_rslt_lfsr\(2),
	dataf => \gfmul_1|ALT_INV_Mux0~0_combout\,
	combout => \gfmul_1|rslt[2]~2_combout\);

-- Location: FF_X14_Y3_N43
\rslt[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[2]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[2]~2_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[2]~reg0_q\);

-- Location: LABCELL_X15_Y2_N24
\gfadd_1|rslt~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~3_combout\ = ( \operand_1[3]~input_o\ & ( !\operand_2[3]~input_o\ ) ) # ( !\operand_1[3]~input_o\ & ( \operand_2[3]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_2[3]~input_o\,
	dataf => \ALT_INV_operand_1[3]~input_o\,
	combout => \gfadd_1|rslt~3_combout\);

-- Location: FF_X15_Y2_N26
\gfadd_1|rslt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfadd_1|rslt~3_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(3));

-- Location: LABCELL_X15_Y2_N18
\rslt[3]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[3]~reg0feeder_combout\ = \gfadd_1|rslt\(3)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111100001111000011110000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfadd_1|ALT_INV_rslt\(3),
	combout => \rslt[3]~reg0feeder_combout\);

-- Location: LABCELL_X14_Y2_N24
\gfmul_1|rslt[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[3]~3_combout\ = ( \gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & (!\operand_1[3]~input_o\ $ (!\gfmul_1|rslt_lfsr\(3)))) ) ) # ( !\gfmul_1|Mux0~0_combout\ & ( (\rst~input_o\ & \gfmul_1|rslt_lfsr\(3)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100000011000000110000001100010010000100100001001000010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_1[3]~input_o\,
	datab => \ALT_INV_rst~input_o\,
	datac => \gfmul_1|ALT_INV_rslt_lfsr\(3),
	dataf => \gfmul_1|ALT_INV_Mux0~0_combout\,
	combout => \gfmul_1|rslt[3]~3_combout\);

-- Location: FF_X15_Y2_N19
\rslt[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[3]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[3]~3_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[3]~reg0_q\);

-- Location: LABCELL_X14_Y2_N27
\gfadd_1|rslt~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~4_combout\ = !\operand_1[4]~input_o\ $ (!\operand_2[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111110000000011111111000000001111111100000000111111110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[4]~input_o\,
	datad => \ALT_INV_operand_2[4]~input_o\,
	combout => \gfadd_1|rslt~4_combout\);

-- Location: FF_X15_Y2_N58
\gfadd_1|rslt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \gfadd_1|rslt~4_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(4));

-- Location: LABCELL_X15_Y2_N51
\rslt[4]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[4]~reg0feeder_combout\ = ( \gfadd_1|rslt\(4) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \gfadd_1|ALT_INV_rslt\(4),
	combout => \rslt[4]~reg0feeder_combout\);

-- Location: FF_X15_Y2_N52
\rslt[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[4]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[4]~4_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[4]~reg0_q\);

-- Location: LABCELL_X14_Y2_N15
\gfadd_1|rslt~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~5_combout\ = ( \operand_2[5]~input_o\ & ( !\operand_1[5]~input_o\ ) ) # ( !\operand_2[5]~input_o\ & ( \operand_1[5]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_1[5]~input_o\,
	dataf => \ALT_INV_operand_2[5]~input_o\,
	combout => \gfadd_1|rslt~5_combout\);

-- Location: LABCELL_X15_Y2_N36
\gfadd_1|rslt[5]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt[5]~feeder_combout\ = ( \gfadd_1|rslt~5_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \gfadd_1|ALT_INV_rslt~5_combout\,
	combout => \gfadd_1|rslt[5]~feeder_combout\);

-- Location: FF_X15_Y2_N38
\gfadd_1|rslt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfadd_1|rslt[5]~feeder_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(5));

-- Location: LABCELL_X15_Y2_N45
\rslt[5]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[5]~reg0feeder_combout\ = \gfadd_1|rslt\(5)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101010101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfadd_1|ALT_INV_rslt\(5),
	combout => \rslt[5]~reg0feeder_combout\);

-- Location: FF_X15_Y2_N46
\rslt[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[5]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[5]~5_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[5]~reg0_q\);

-- Location: LABCELL_X14_Y2_N0
\gfadd_1|rslt~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~6_combout\ = ( \operand_1[6]~input_o\ & ( !\operand_2[6]~input_o\ ) ) # ( !\operand_1[6]~input_o\ & ( \operand_2[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011111111000000001111111111111111000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \ALT_INV_operand_2[6]~input_o\,
	dataf => \ALT_INV_operand_1[6]~input_o\,
	combout => \gfadd_1|rslt~6_combout\);

-- Location: LABCELL_X15_Y2_N6
\gfadd_1|rslt[6]~feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt[6]~feeder_combout\ = ( \gfadd_1|rslt~6_combout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \gfadd_1|ALT_INV_rslt~6_combout\,
	combout => \gfadd_1|rslt[6]~feeder_combout\);

-- Location: FF_X15_Y2_N8
\gfadd_1|rslt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfadd_1|rslt[6]~feeder_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(6));

-- Location: LABCELL_X15_Y2_N0
\rslt[6]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[6]~reg0feeder_combout\ = \gfadd_1|rslt\(6)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfadd_1|ALT_INV_rslt\(6),
	combout => \rslt[6]~reg0feeder_combout\);

-- Location: FF_X15_Y2_N1
\rslt[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[6]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[6]~6_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[6]~reg0_q\);

-- Location: LABCELL_X14_Y3_N57
\gfadd_1|rslt~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfadd_1|rslt~7_combout\ = ( \operand_1[7]~input_o\ & ( !\operand_2[7]~input_o\ ) ) # ( !\operand_1[7]~input_o\ & ( \operand_2[7]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_operand_2[7]~input_o\,
	dataf => \ALT_INV_operand_1[7]~input_o\,
	combout => \gfadd_1|rslt~7_combout\);

-- Location: FF_X14_Y3_N58
\gfadd_1|rslt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfadd_1|rslt~7_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfadd_1|rslt\(7));

-- Location: LABCELL_X14_Y3_N39
\rslt[7]~reg0feeder\ : cyclonev_lcell_comb
-- Equation(s):
-- \rslt[7]~reg0feeder_combout\ = ( \gfadd_1|rslt\(7) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000011111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataf => \gfadd_1|ALT_INV_rslt\(7),
	combout => \rslt[7]~reg0feeder_combout\);

-- Location: FF_X14_Y3_N40
\rslt[7]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \rslt[7]~reg0feeder_combout\,
	asdata => \gfmul_1|rslt[7]~7_combout\,
	sload => \sel~input_o\,
	ena => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rslt[7]~reg0_q\);

-- Location: LABCELL_X16_Y58_N3
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



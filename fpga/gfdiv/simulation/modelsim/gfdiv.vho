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

-- DATE "06/26/2019 17:29:06"

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

ENTITY 	gfdiv IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	operand_1 : IN std_logic_vector(7 DOWNTO 0);
	operand_2 : IN std_logic_vector(7 DOWNTO 0);
	rslt : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END gfdiv;

-- Design Ports Information
-- rslt[0]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[1]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[2]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[3]	=>  Location: PIN_AD6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[4]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[5]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[6]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rslt[7]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[0]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[1]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[2]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[3]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[4]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[5]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[6]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_1[7]	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[0]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[1]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[2]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[3]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[4]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[7]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[6]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- operand_2[5]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF gfdiv IS
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
SIGNAL \operand_2[6]~input_o\ : std_logic;
SIGNAL \operand_2[3]~input_o\ : std_logic;
SIGNAL \operand_2[0]~input_o\ : std_logic;
SIGNAL \operand_2[2]~input_o\ : std_logic;
SIGNAL \operand_2[1]~input_o\ : std_logic;
SIGNAL \operand_2[4]~input_o\ : std_logic;
SIGNAL \gfinv_1|Mux0~1_combout\ : std_logic;
SIGNAL \operand_2[5]~input_o\ : std_logic;
SIGNAL \gfinv_1|Mux0~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux0~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux0~2_combout\ : std_logic;
SIGNAL \operand_2[7]~input_o\ : std_logic;
SIGNAL \gfinv_1|Mux0~4_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \gfmul_1|Add0~89_sumout\ : std_logic;
SIGNAL \gfmul_1|count[0]~3_combout\ : std_logic;
SIGNAL \gfmul_1|Add0~90\ : std_logic;
SIGNAL \gfmul_1|Add0~5_sumout\ : std_logic;
SIGNAL \gfmul_1|count[1]~2_combout\ : std_logic;
SIGNAL \gfmul_1|Add0~6\ : std_logic;
SIGNAL \gfmul_1|Add0~1_sumout\ : std_logic;
SIGNAL \gfmul_1|count[2]~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux3~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux3~2_combout\ : std_logic;
SIGNAL \gfinv_1|Mux3~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux3~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux3~4_combout\ : std_logic;
SIGNAL \gfinv_1|Mux2~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux2~2_combout\ : std_logic;
SIGNAL \gfinv_1|Mux2~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux2~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux2~4_combout\ : std_logic;
SIGNAL \gfinv_1|Mux4~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux4~2_combout\ : std_logic;
SIGNAL \gfinv_1|Mux4~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux4~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux4~4_combout\ : std_logic;
SIGNAL \gfinv_1|Mux7~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux7~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux7~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux7~2_combout\ : std_logic;
SIGNAL \gfinv_1|Mux7~4_combout\ : std_logic;
SIGNAL \gfinv_1|Mux6~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux6~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux6~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux6~2_combout\ : std_logic;
SIGNAL \gfinv_1|Mux6~4_combout\ : std_logic;
SIGNAL \gfinv_1|Mux5~2_combout\ : std_logic;
SIGNAL \gfinv_1|Mux5~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux5~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux5~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux5~4_combout\ : std_logic;
SIGNAL \gfmul_1|Mux0~4_combout\ : std_logic;
SIGNAL \gfinv_1|Mux1~1_combout\ : std_logic;
SIGNAL \gfinv_1|Mux1~3_combout\ : std_logic;
SIGNAL \gfinv_1|Mux1~0_combout\ : std_logic;
SIGNAL \gfinv_1|Mux1~2_combout\ : std_logic;
SIGNAL \gfinv_1|Mux1~4_combout\ : std_logic;
SIGNAL \gfmul_1|Mux0~0_combout\ : std_logic;
SIGNAL \operand_1[0]~input_o\ : std_logic;
SIGNAL \operand_1[7]~input_o\ : std_logic;
SIGNAL \operand_1[6]~input_o\ : std_logic;
SIGNAL \operand_1[5]~input_o\ : std_logic;
SIGNAL \operand_1[4]~input_o\ : std_logic;
SIGNAL \operand_1[3]~input_o\ : std_logic;
SIGNAL \operand_1[2]~input_o\ : std_logic;
SIGNAL \operand_1[1]~input_o\ : std_logic;
SIGNAL \gfmul_1|Add0~2\ : std_logic;
SIGNAL \gfmul_1|Add0~37_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~38\ : std_logic;
SIGNAL \gfmul_1|Add0~33_sumout\ : std_logic;
SIGNAL \gfmul_1|count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~34\ : std_logic;
SIGNAL \gfmul_1|Add0~29_sumout\ : std_logic;
SIGNAL \gfmul_1|count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~30\ : std_logic;
SIGNAL \gfmul_1|Add0~25_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~26\ : std_logic;
SIGNAL \gfmul_1|Add0~21_sumout\ : std_logic;
SIGNAL \gfmul_1|count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~22\ : std_logic;
SIGNAL \gfmul_1|Add0~17_sumout\ : std_logic;
SIGNAL \gfmul_1|Equal0~1_combout\ : std_logic;
SIGNAL \gfmul_1|count[15]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~18\ : std_logic;
SIGNAL \gfmul_1|Add0~61_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~62\ : std_logic;
SIGNAL \gfmul_1|Add0~57_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~58\ : std_logic;
SIGNAL \gfmul_1|Add0~53_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~54\ : std_logic;
SIGNAL \gfmul_1|Add0~49_sumout\ : std_logic;
SIGNAL \gfmul_1|count[12]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~50\ : std_logic;
SIGNAL \gfmul_1|Add0~45_sumout\ : std_logic;
SIGNAL \gfmul_1|count[13]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~46\ : std_logic;
SIGNAL \gfmul_1|Add0~41_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~42\ : std_logic;
SIGNAL \gfmul_1|Add0~97_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~98\ : std_logic;
SIGNAL \gfmul_1|Add0~81_sumout\ : std_logic;
SIGNAL \gfmul_1|count[16]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~82\ : std_logic;
SIGNAL \gfmul_1|Add0~77_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~78\ : std_logic;
SIGNAL \gfmul_1|Add0~73_sumout\ : std_logic;
SIGNAL \gfmul_1|count[18]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~74\ : std_logic;
SIGNAL \gfmul_1|Add0~69_sumout\ : std_logic;
SIGNAL \gfmul_1|count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~70\ : std_logic;
SIGNAL \gfmul_1|Add0~65_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~66\ : std_logic;
SIGNAL \gfmul_1|Add0~125_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~126\ : std_logic;
SIGNAL \gfmul_1|Add0~121_sumout\ : std_logic;
SIGNAL \gfmul_1|count[22]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Add0~122\ : std_logic;
SIGNAL \gfmul_1|Add0~117_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~118\ : std_logic;
SIGNAL \gfmul_1|Add0~113_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~114\ : std_logic;
SIGNAL \gfmul_1|Add0~109_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~110\ : std_logic;
SIGNAL \gfmul_1|Add0~105_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~106\ : std_logic;
SIGNAL \gfmul_1|Add0~101_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~102\ : std_logic;
SIGNAL \gfmul_1|Add0~85_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~86\ : std_logic;
SIGNAL \gfmul_1|Add0~9_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~10\ : std_logic;
SIGNAL \gfmul_1|Add0~13_sumout\ : std_logic;
SIGNAL \gfmul_1|Add0~14\ : std_logic;
SIGNAL \gfmul_1|Add0~93_sumout\ : std_logic;
SIGNAL \gfmul_1|count~0_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~4_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~5_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~0_combout\ : std_logic;
SIGNAL \gfmul_1|count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|Equal0~2_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~3_combout\ : std_logic;
SIGNAL \gfmul_1|Equal0~6_combout\ : std_logic;
SIGNAL \gfmul_1|rslt_lfsr~0_combout\ : std_logic;
SIGNAL \gfmul_1|rslt_lfsr~1_combout\ : std_logic;
SIGNAL \gfmul_1|rslt_lfsr~2_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[4]~4_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[5]~5_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[6]~6_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[7]~7_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[0]~0_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[1]~1_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[2]~2_combout\ : std_logic;
SIGNAL \gfmul_1|rslt[3]~3_combout\ : std_logic;
SIGNAL \gfinv_1|rslt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfmul_1|count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \gfmul_1|rslt_lfsr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfmul_1|ALT_INV_Add0~93_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Add0~89_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \gfmul_1|ALT_INV_Mux0~4_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_rslt_lfsr\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfmul_1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[22]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[15]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[16]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[18]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[19]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[9]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[11]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[12]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[13]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[4]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[5]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[7]~DUPLICATE_q\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_count[8]~DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_operand_2[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_operand_2[1]~input_o\ : std_logic;
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
SIGNAL \gfinv_1|ALT_INV_Mux5~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux5~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux5~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux5~0_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux7~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux7~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux7~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux7~0_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux4~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux4~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux4~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux4~0_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux6~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux6~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux6~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux6~0_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux1~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux1~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux1~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux1~0_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_rslt\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gfinv_1|ALT_INV_Mux3~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux3~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux3~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux0~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux0~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux0~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux2~3_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux2~2_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux2~1_combout\ : std_logic;
SIGNAL \gfinv_1|ALT_INV_Mux2~0_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~6_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~5_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~4_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~3_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~2_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \gfmul_1|ALT_INV_Equal0~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_operand_1 <= operand_1;
ww_operand_2 <= operand_2;
rslt <= ww_rslt;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\gfmul_1|ALT_INV_Add0~93_sumout\ <= NOT \gfmul_1|Add0~93_sumout\;
\gfmul_1|ALT_INV_Add0~89_sumout\ <= NOT \gfmul_1|Add0~89_sumout\;
\gfmul_1|ALT_INV_Add0~5_sumout\ <= NOT \gfmul_1|Add0~5_sumout\;
\gfmul_1|ALT_INV_Add0~1_sumout\ <= NOT \gfmul_1|Add0~1_sumout\;
\gfmul_1|ALT_INV_count\(21) <= NOT \gfmul_1|count\(21);
\gfmul_1|ALT_INV_count\(22) <= NOT \gfmul_1|count\(22);
\gfmul_1|ALT_INV_count\(23) <= NOT \gfmul_1|count\(23);
\gfmul_1|ALT_INV_count\(24) <= NOT \gfmul_1|count\(24);
\gfmul_1|ALT_INV_count\(25) <= NOT \gfmul_1|count\(25);
\gfmul_1|ALT_INV_count\(26) <= NOT \gfmul_1|count\(26);
\gfmul_1|ALT_INV_count\(27) <= NOT \gfmul_1|count\(27);
\gfmul_1|ALT_INV_count\(15) <= NOT \gfmul_1|count\(15);
\gfmul_1|ALT_INV_count\(28) <= NOT \gfmul_1|count\(28);
\gfmul_1|ALT_INV_count\(16) <= NOT \gfmul_1|count\(16);
\gfmul_1|ALT_INV_count\(17) <= NOT \gfmul_1|count\(17);
\gfmul_1|ALT_INV_count\(18) <= NOT \gfmul_1|count\(18);
\gfmul_1|ALT_INV_count\(19) <= NOT \gfmul_1|count\(19);
\gfmul_1|ALT_INV_count\(20) <= NOT \gfmul_1|count\(20);
\gfmul_1|ALT_INV_count\(9) <= NOT \gfmul_1|count\(9);
\gfmul_1|ALT_INV_count\(10) <= NOT \gfmul_1|count\(10);
\gfmul_1|ALT_INV_count\(11) <= NOT \gfmul_1|count\(11);
\gfmul_1|ALT_INV_count\(12) <= NOT \gfmul_1|count\(12);
\gfmul_1|ALT_INV_count\(13) <= NOT \gfmul_1|count\(13);
\gfmul_1|ALT_INV_count\(14) <= NOT \gfmul_1|count\(14);
\gfmul_1|ALT_INV_count\(3) <= NOT \gfmul_1|count\(3);
\gfmul_1|ALT_INV_count\(4) <= NOT \gfmul_1|count\(4);
\gfmul_1|ALT_INV_count\(5) <= NOT \gfmul_1|count\(5);
\gfmul_1|ALT_INV_count\(6) <= NOT \gfmul_1|count\(6);
\gfmul_1|ALT_INV_count\(7) <= NOT \gfmul_1|count\(7);
\gfmul_1|ALT_INV_count\(8) <= NOT \gfmul_1|count\(8);
\gfmul_1|ALT_INV_count\(30) <= NOT \gfmul_1|count\(30);
\gfmul_1|ALT_INV_count\(29) <= NOT \gfmul_1|count\(29);
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
\gfmul_1|ALT_INV_count[22]~DUPLICATE_q\ <= NOT \gfmul_1|count[22]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[15]~DUPLICATE_q\ <= NOT \gfmul_1|count[15]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[16]~DUPLICATE_q\ <= NOT \gfmul_1|count[16]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[18]~DUPLICATE_q\ <= NOT \gfmul_1|count[18]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[19]~DUPLICATE_q\ <= NOT \gfmul_1|count[19]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[9]~DUPLICATE_q\ <= NOT \gfmul_1|count[9]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[11]~DUPLICATE_q\ <= NOT \gfmul_1|count[11]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[12]~DUPLICATE_q\ <= NOT \gfmul_1|count[12]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[13]~DUPLICATE_q\ <= NOT \gfmul_1|count[13]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[4]~DUPLICATE_q\ <= NOT \gfmul_1|count[4]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[5]~DUPLICATE_q\ <= NOT \gfmul_1|count[5]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[7]~DUPLICATE_q\ <= NOT \gfmul_1|count[7]~DUPLICATE_q\;
\gfmul_1|ALT_INV_count[8]~DUPLICATE_q\ <= NOT \gfmul_1|count[8]~DUPLICATE_q\;
\ALT_INV_operand_2[5]~input_o\ <= NOT \operand_2[5]~input_o\;
\ALT_INV_operand_2[6]~input_o\ <= NOT \operand_2[6]~input_o\;
\ALT_INV_operand_2[7]~input_o\ <= NOT \operand_2[7]~input_o\;
\ALT_INV_operand_2[4]~input_o\ <= NOT \operand_2[4]~input_o\;
\ALT_INV_operand_2[3]~input_o\ <= NOT \operand_2[3]~input_o\;
\ALT_INV_operand_2[2]~input_o\ <= NOT \operand_2[2]~input_o\;
\ALT_INV_operand_2[1]~input_o\ <= NOT \operand_2[1]~input_o\;
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
\gfinv_1|ALT_INV_Mux5~3_combout\ <= NOT \gfinv_1|Mux5~3_combout\;
\gfinv_1|ALT_INV_Mux5~2_combout\ <= NOT \gfinv_1|Mux5~2_combout\;
\gfinv_1|ALT_INV_Mux5~1_combout\ <= NOT \gfinv_1|Mux5~1_combout\;
\gfinv_1|ALT_INV_Mux5~0_combout\ <= NOT \gfinv_1|Mux5~0_combout\;
\gfinv_1|ALT_INV_Mux7~3_combout\ <= NOT \gfinv_1|Mux7~3_combout\;
\gfinv_1|ALT_INV_Mux7~2_combout\ <= NOT \gfinv_1|Mux7~2_combout\;
\gfinv_1|ALT_INV_Mux7~1_combout\ <= NOT \gfinv_1|Mux7~1_combout\;
\gfinv_1|ALT_INV_Mux7~0_combout\ <= NOT \gfinv_1|Mux7~0_combout\;
\gfinv_1|ALT_INV_Mux4~3_combout\ <= NOT \gfinv_1|Mux4~3_combout\;
\gfinv_1|ALT_INV_Mux4~2_combout\ <= NOT \gfinv_1|Mux4~2_combout\;
\gfinv_1|ALT_INV_Mux4~1_combout\ <= NOT \gfinv_1|Mux4~1_combout\;
\gfinv_1|ALT_INV_Mux4~0_combout\ <= NOT \gfinv_1|Mux4~0_combout\;
\gfinv_1|ALT_INV_Mux6~3_combout\ <= NOT \gfinv_1|Mux6~3_combout\;
\gfinv_1|ALT_INV_Mux6~2_combout\ <= NOT \gfinv_1|Mux6~2_combout\;
\gfinv_1|ALT_INV_Mux6~1_combout\ <= NOT \gfinv_1|Mux6~1_combout\;
\gfinv_1|ALT_INV_Mux6~0_combout\ <= NOT \gfinv_1|Mux6~0_combout\;
\gfinv_1|ALT_INV_Mux1~3_combout\ <= NOT \gfinv_1|Mux1~3_combout\;
\gfinv_1|ALT_INV_Mux1~2_combout\ <= NOT \gfinv_1|Mux1~2_combout\;
\gfinv_1|ALT_INV_Mux1~1_combout\ <= NOT \gfinv_1|Mux1~1_combout\;
\gfinv_1|ALT_INV_Mux1~0_combout\ <= NOT \gfinv_1|Mux1~0_combout\;
\gfinv_1|ALT_INV_rslt\(2) <= NOT \gfinv_1|rslt\(2);
\gfinv_1|ALT_INV_rslt\(0) <= NOT \gfinv_1|rslt\(0);
\gfinv_1|ALT_INV_rslt\(3) <= NOT \gfinv_1|rslt\(3);
\gfinv_1|ALT_INV_rslt\(1) <= NOT \gfinv_1|rslt\(1);
\gfinv_1|ALT_INV_Mux3~3_combout\ <= NOT \gfinv_1|Mux3~3_combout\;
\gfinv_1|ALT_INV_Mux3~2_combout\ <= NOT \gfinv_1|Mux3~2_combout\;
\gfinv_1|ALT_INV_Mux3~1_combout\ <= NOT \gfinv_1|Mux3~1_combout\;
\gfinv_1|ALT_INV_Mux3~0_combout\ <= NOT \gfinv_1|Mux3~0_combout\;
\gfinv_1|ALT_INV_Mux0~3_combout\ <= NOT \gfinv_1|Mux0~3_combout\;
\gfinv_1|ALT_INV_Mux0~2_combout\ <= NOT \gfinv_1|Mux0~2_combout\;
\gfinv_1|ALT_INV_Mux0~1_combout\ <= NOT \gfinv_1|Mux0~1_combout\;
\gfinv_1|ALT_INV_Mux0~0_combout\ <= NOT \gfinv_1|Mux0~0_combout\;
\gfinv_1|ALT_INV_Mux2~3_combout\ <= NOT \gfinv_1|Mux2~3_combout\;
\gfinv_1|ALT_INV_Mux2~2_combout\ <= NOT \gfinv_1|Mux2~2_combout\;
\gfinv_1|ALT_INV_Mux2~1_combout\ <= NOT \gfinv_1|Mux2~1_combout\;
\gfinv_1|ALT_INV_Mux2~0_combout\ <= NOT \gfinv_1|Mux2~0_combout\;
\gfmul_1|ALT_INV_Equal0~6_combout\ <= NOT \gfmul_1|Equal0~6_combout\;
\gfmul_1|ALT_INV_Equal0~5_combout\ <= NOT \gfmul_1|Equal0~5_combout\;
\gfmul_1|ALT_INV_Equal0~4_combout\ <= NOT \gfmul_1|Equal0~4_combout\;
\gfmul_1|ALT_INV_count\(31) <= NOT \gfmul_1|count\(31);
\gfmul_1|ALT_INV_count\(0) <= NOT \gfmul_1|count\(0);
\gfmul_1|ALT_INV_Equal0~3_combout\ <= NOT \gfmul_1|Equal0~3_combout\;
\gfmul_1|ALT_INV_Equal0~2_combout\ <= NOT \gfmul_1|Equal0~2_combout\;
\gfmul_1|ALT_INV_Equal0~1_combout\ <= NOT \gfmul_1|Equal0~1_combout\;
\gfmul_1|ALT_INV_Equal0~0_combout\ <= NOT \gfmul_1|Equal0~0_combout\;
\gfinv_1|ALT_INV_rslt\(6) <= NOT \gfinv_1|rslt\(6);
\gfmul_1|ALT_INV_count\(1) <= NOT \gfmul_1|count\(1);
\gfmul_1|ALT_INV_count\(2) <= NOT \gfmul_1|count\(2);
\gfinv_1|ALT_INV_rslt\(4) <= NOT \gfinv_1|rslt\(4);
\gfinv_1|ALT_INV_rslt\(7) <= NOT \gfinv_1|rslt\(7);
\gfinv_1|ALT_INV_rslt\(5) <= NOT \gfinv_1|rslt\(5);

-- Location: IOOBUF_X14_Y0_N36
\rslt[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \gfmul_1|rslt[0]~0_combout\,
	devoe => ww_devoe,
	o => ww_rslt(0));

-- Location: IOOBUF_X14_Y0_N19
\rslt[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \gfmul_1|rslt[1]~1_combout\,
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
	i => \gfmul_1|rslt[2]~2_combout\,
	devoe => ww_devoe,
	o => ww_rslt(2));

-- Location: IOOBUF_X14_Y0_N53
\rslt[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \gfmul_1|rslt[3]~3_combout\,
	devoe => ww_devoe,
	o => ww_rslt(3));

-- Location: IOOBUF_X12_Y0_N36
\rslt[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \gfmul_1|rslt[4]~4_combout\,
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
	i => \gfmul_1|rslt[5]~5_combout\,
	devoe => ww_devoe,
	o => ww_rslt(5));

-- Location: IOOBUF_X12_Y0_N19
\rslt[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \gfmul_1|rslt[6]~6_combout\,
	devoe => ww_devoe,
	o => ww_rslt(6));

-- Location: IOOBUF_X40_Y0_N76
\rslt[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \gfmul_1|rslt[7]~7_combout\,
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
\operand_2[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(6),
	o => \operand_2[6]~input_o\);

-- Location: IOIBUF_X12_Y0_N52
\operand_2[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(3),
	o => \operand_2[3]~input_o\);

-- Location: IOIBUF_X10_Y0_N1
\operand_2[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(0),
	o => \operand_2[0]~input_o\);

-- Location: IOIBUF_X8_Y0_N41
\operand_2[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(2),
	o => \operand_2[2]~input_o\);

-- Location: IOIBUF_X8_Y0_N75
\operand_2[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(1),
	o => \operand_2[1]~input_o\);

-- Location: IOIBUF_X8_Y0_N58
\operand_2[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(4),
	o => \operand_2[4]~input_o\);

-- Location: LABCELL_X11_Y4_N48
\gfinv_1|Mux0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux0~1_combout\ = ( \operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & ( (!\operand_2[3]~input_o\ & (\operand_2[6]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[2]~input_o\)))) # (\operand_2[3]~input_o\ & ((!\operand_2[6]~input_o\ $ 
-- (\operand_2[2]~input_o\)) # (\operand_2[0]~input_o\))) ) ) ) # ( !\operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & ( (!\operand_2[6]~input_o\ & ((!\operand_2[0]~input_o\ & ((\operand_2[2]~input_o\))) # (\operand_2[0]~input_o\ & 
-- (!\operand_2[3]~input_o\)))) # (\operand_2[6]~input_o\ & ((!\operand_2[3]~input_o\ $ (!\operand_2[0]~input_o\)) # (\operand_2[2]~input_o\))) ) ) ) # ( \operand_2[1]~input_o\ & ( !\operand_2[4]~input_o\ & ( (!\operand_2[6]~input_o\ & 
-- (!\operand_2[3]~input_o\ & (\operand_2[0]~input_o\ & \operand_2[2]~input_o\))) # (\operand_2[6]~input_o\ & (!\operand_2[2]~input_o\ & ((!\operand_2[0]~input_o\) # (\operand_2[3]~input_o\)))) ) ) ) # ( !\operand_2[1]~input_o\ & ( !\operand_2[4]~input_o\ & 
-- ( (!\operand_2[3]~input_o\ & ((!\operand_2[6]~input_o\ & (\operand_2[0]~input_o\ & !\operand_2[2]~input_o\)) # (\operand_2[6]~input_o\ & ((\operand_2[2]~input_o\))))) # (\operand_2[3]~input_o\ & (((\operand_2[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000101101000111010100010000100000011100111111010010011101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[3]~input_o\,
	datac => \ALT_INV_operand_2[0]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[1]~input_o\,
	dataf => \ALT_INV_operand_2[4]~input_o\,
	combout => \gfinv_1|Mux0~1_combout\);

-- Location: IOIBUF_X10_Y0_N18
\operand_2[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(5),
	o => \operand_2[5]~input_o\);

-- Location: LABCELL_X11_Y4_N24
\gfinv_1|Mux0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux0~3_combout\ = ( \operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & ( (!\operand_2[6]~input_o\ & (!\operand_2[2]~input_o\ & ((\operand_2[0]~input_o\) # (\operand_2[3]~input_o\)))) # (\operand_2[6]~input_o\ & (\operand_2[3]~input_o\ & 
-- ((\operand_2[2]~input_o\) # (\operand_2[0]~input_o\)))) ) ) ) # ( !\operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & ( (!\operand_2[2]~input_o\ & (\operand_2[3]~input_o\ & (!\operand_2[6]~input_o\ $ (!\operand_2[0]~input_o\)))) # (\operand_2[2]~input_o\ 
-- & (\operand_2[6]~input_o\ & ((!\operand_2[0]~input_o\)))) ) ) ) # ( \operand_2[1]~input_o\ & ( !\operand_2[4]~input_o\ & ( (!\operand_2[6]~input_o\ & (!\operand_2[3]~input_o\ $ (((!\operand_2[2]~input_o\))))) # (\operand_2[6]~input_o\ & 
-- (\operand_2[3]~input_o\ & (\operand_2[0]~input_o\ & \operand_2[2]~input_o\))) ) ) ) # ( !\operand_2[1]~input_o\ & ( !\operand_2[4]~input_o\ & ( (!\operand_2[6]~input_o\ & (!\operand_2[3]~input_o\ $ ((\operand_2[0]~input_o\)))) # (\operand_2[6]~input_o\ & 
-- ((!\operand_2[3]~input_o\ & ((!\operand_2[2]~input_o\))) # (\operand_2[3]~input_o\ & ((\operand_2[2]~input_o\) # (\operand_2[0]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100011110010011001000101000100100010010010100000010101100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[3]~input_o\,
	datac => \ALT_INV_operand_2[0]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[1]~input_o\,
	dataf => \ALT_INV_operand_2[4]~input_o\,
	combout => \gfinv_1|Mux0~3_combout\);

-- Location: LABCELL_X11_Y4_N42
\gfinv_1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux0~0_combout\ = ( \operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & ( (!\operand_2[2]~input_o\ & (!\operand_2[6]~input_o\ $ (!\operand_2[3]~input_o\ $ (!\operand_2[0]~input_o\)))) ) ) ) # ( !\operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & 
-- ( (!\operand_2[0]~input_o\ & ((!\operand_2[6]~input_o\) # ((\operand_2[2]~input_o\)))) # (\operand_2[0]~input_o\ & (\operand_2[3]~input_o\ & ((!\operand_2[6]~input_o\) # (!\operand_2[2]~input_o\)))) ) ) ) # ( \operand_2[1]~input_o\ & ( 
-- !\operand_2[4]~input_o\ & ( (!\operand_2[6]~input_o\ & (((!\operand_2[2]~input_o\) # (\operand_2[0]~input_o\)))) # (\operand_2[6]~input_o\ & (!\operand_2[3]~input_o\ $ (((\operand_2[0]~input_o\ & \operand_2[2]~input_o\))))) ) ) ) # ( 
-- !\operand_2[1]~input_o\ & ( !\operand_2[4]~input_o\ & ( (!\operand_2[2]~input_o\ & (\operand_2[3]~input_o\ & ((!\operand_2[6]~input_o\) # (\operand_2[0]~input_o\)))) # (\operand_2[2]~input_o\ & ((!\operand_2[6]~input_o\ & ((\operand_2[0]~input_o\))) # 
-- (\operand_2[6]~input_o\ & (!\operand_2[3]~input_o\ & !\operand_2[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001101001010111011100100101110100011111100101001011000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[3]~input_o\,
	datac => \ALT_INV_operand_2[0]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[1]~input_o\,
	dataf => \ALT_INV_operand_2[4]~input_o\,
	combout => \gfinv_1|Mux0~0_combout\);

-- Location: LABCELL_X11_Y4_N54
\gfinv_1|Mux0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux0~2_combout\ = ( \operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & ( (!\operand_2[6]~input_o\ & (\operand_2[3]~input_o\)) # (\operand_2[6]~input_o\ & ((!\operand_2[3]~input_o\) # ((\operand_2[0]~input_o\ & \operand_2[2]~input_o\)))) ) ) ) # 
-- ( !\operand_2[1]~input_o\ & ( \operand_2[4]~input_o\ & ( (!\operand_2[0]~input_o\ & (((\operand_2[2]~input_o\)))) # (\operand_2[0]~input_o\ & (!\operand_2[6]~input_o\ & ((!\operand_2[3]~input_o\) # (!\operand_2[2]~input_o\)))) ) ) ) # ( 
-- \operand_2[1]~input_o\ & ( !\operand_2[4]~input_o\ & ( (!\operand_2[3]~input_o\ & (((!\operand_2[0]~input_o\) # (\operand_2[2]~input_o\)))) # (\operand_2[3]~input_o\ & (\operand_2[2]~input_o\ & (!\operand_2[6]~input_o\ $ (!\operand_2[0]~input_o\)))) ) ) ) 
-- # ( !\operand_2[1]~input_o\ & ( !\operand_2[4]~input_o\ & ( (!\operand_2[3]~input_o\ & (((\operand_2[0]~input_o\ & \operand_2[2]~input_o\)))) # (\operand_2[3]~input_o\ & (\operand_2[6]~input_o\ & ((!\operand_2[0]~input_o\) # (!\operand_2[2]~input_o\)))) ) 
-- ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100011100110000001101111000001010111110000110011001100111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[3]~input_o\,
	datac => \ALT_INV_operand_2[0]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[1]~input_o\,
	dataf => \ALT_INV_operand_2[4]~input_o\,
	combout => \gfinv_1|Mux0~2_combout\);

-- Location: IOIBUF_X8_Y0_N92
\operand_2[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_2(7),
	o => \operand_2[7]~input_o\);

-- Location: LABCELL_X11_Y4_N36
\gfinv_1|Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux0~4_combout\ = ( \gfinv_1|Mux0~2_combout\ & ( \operand_2[7]~input_o\ & ( (!\operand_2[5]~input_o\) # (!\gfinv_1|Mux0~3_combout\) ) ) ) # ( !\gfinv_1|Mux0~2_combout\ & ( \operand_2[7]~input_o\ & ( (\operand_2[5]~input_o\ & 
-- !\gfinv_1|Mux0~3_combout\) ) ) ) # ( \gfinv_1|Mux0~2_combout\ & ( !\operand_2[7]~input_o\ & ( (!\operand_2[5]~input_o\ & ((\gfinv_1|Mux0~0_combout\))) # (\operand_2[5]~input_o\ & (\gfinv_1|Mux0~1_combout\)) ) ) ) # ( !\gfinv_1|Mux0~2_combout\ & ( 
-- !\operand_2[7]~input_o\ & ( (!\operand_2[5]~input_o\ & ((\gfinv_1|Mux0~0_combout\))) # (\operand_2[5]~input_o\ & (\gfinv_1|Mux0~1_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000111011101000100011101110100110000001100001111110011111100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_Mux0~1_combout\,
	datab => \ALT_INV_operand_2[5]~input_o\,
	datac => \gfinv_1|ALT_INV_Mux0~3_combout\,
	datad => \gfinv_1|ALT_INV_Mux0~0_combout\,
	datae => \gfinv_1|ALT_INV_Mux0~2_combout\,
	dataf => \ALT_INV_operand_2[7]~input_o\,
	combout => \gfinv_1|Mux0~4_combout\);

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

-- Location: FF_X11_Y4_N37
\gfinv_1|rslt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfinv_1|Mux0~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(7));

-- Location: LABCELL_X9_Y6_N0
\gfmul_1|Add0~89\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~89_sumout\ = SUM(( !\gfmul_1|count\(0) ) + ( VCC ) + ( !VCC ))
-- \gfmul_1|Add0~90\ = CARRY(( !\gfmul_1|count\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001100110011001100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(0),
	cin => GND,
	sumout => \gfmul_1|Add0~89_sumout\,
	cout => \gfmul_1|Add0~90\);

-- Location: LABCELL_X10_Y6_N33
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

-- Location: FF_X9_Y6_N8
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

-- Location: LABCELL_X9_Y6_N3
\gfmul_1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~5_sumout\ = SUM(( !\gfmul_1|count\(1) ) + ( VCC ) + ( \gfmul_1|Add0~90\ ))
-- \gfmul_1|Add0~6\ = CARRY(( !\gfmul_1|count\(1) ) + ( VCC ) + ( \gfmul_1|Add0~90\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(1),
	cin => \gfmul_1|Add0~90\,
	sumout => \gfmul_1|Add0~5_sumout\,
	cout => \gfmul_1|Add0~6\);

-- Location: LABCELL_X10_Y6_N24
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

-- Location: FF_X9_Y6_N5
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

-- Location: LABCELL_X9_Y6_N6
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

-- Location: LABCELL_X10_Y6_N45
\gfmul_1|count[2]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|count[2]~1_combout\ = ( !\gfmul_1|Add0~1_sumout\ )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000011111111111111110000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \gfmul_1|ALT_INV_Add0~1_sumout\,
	combout => \gfmul_1|count[2]~1_combout\);

-- Location: FF_X9_Y6_N2
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

-- Location: LABCELL_X11_Y3_N48
\gfinv_1|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux3~0_combout\ = ( \operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\))) # (\operand_2[1]~input_o\ & (!\operand_2[5]~input_o\)))) # (\operand_2[0]~input_o\ & 
-- ((!\operand_2[1]~input_o\ & (!\operand_2[5]~input_o\)) # (\operand_2[1]~input_o\ & ((\operand_2[7]~input_o\))))) ) ) ) # ( !\operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ & 
-- ((\operand_2[1]~input_o\) # (\operand_2[5]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\) # (!\operand_2[5]~input_o\ $ (\operand_2[7]~input_o\)))) ) ) ) # ( \operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- (!\operand_2[5]~input_o\ & ((!\operand_2[1]~input_o\) # ((\operand_2[0]~input_o\ & !\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\ & 
-- ((\operand_2[7]~input_o\))) # (\operand_2[1]~input_o\ & (\operand_2[5]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & ((\operand_2[1]~input_o\))) # (\operand_2[7]~input_o\ & (!\operand_2[5]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011111100110110001001100000001111110010100011110100001001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[5]~input_o\,
	datac => \ALT_INV_operand_2[1]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[4]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux3~0_combout\);

-- Location: LABCELL_X11_Y3_N24
\gfinv_1|Mux3~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux3~2_combout\ = ( \operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & ((\operand_2[1]~input_o\))) # (\operand_2[7]~input_o\ & (\operand_2[5]~input_o\)))) # (\operand_2[0]~input_o\ & 
-- (!\operand_2[5]~input_o\ & ((!\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & ((!\operand_2[5]~input_o\) # (!\operand_2[7]~input_o\)))) # 
-- (\operand_2[0]~input_o\ & (((!\operand_2[1]~input_o\ & !\operand_2[7]~input_o\)))) ) ) ) # ( \operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & ((!\operand_2[5]~input_o\ & ((\operand_2[7]~input_o\) # 
-- (\operand_2[1]~input_o\))) # (\operand_2[5]~input_o\ & (!\operand_2[1]~input_o\)))) # (\operand_2[0]~input_o\ & (!\operand_2[5]~input_o\ $ (((\operand_2[7]~input_o\))))) ) ) ) # ( !\operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- (!\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & (\operand_2[5]~input_o\)) # (\operand_2[7]~input_o\ & ((\operand_2[1]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010001000001010011011001011100101011010000010000100111000100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[5]~input_o\,
	datac => \ALT_INV_operand_2[1]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[4]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux3~2_combout\);

-- Location: LABCELL_X11_Y3_N54
\gfinv_1|Mux3~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux3~1_combout\ = ( \operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ & ( (\operand_2[5]~input_o\ & (!\operand_2[7]~input_o\ $ (((!\operand_2[1]~input_o\) # (\operand_2[0]~input_o\))))) ) ) ) # ( !\operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ 
-- & ( (!\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & ((!\operand_2[5]~input_o\) # (\operand_2[1]~input_o\))) # (\operand_2[7]~input_o\ & ((!\operand_2[1]~input_o\) # (\operand_2[5]~input_o\))))) # (\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & 
-- ((!\operand_2[5]~input_o\) # (\operand_2[7]~input_o\)))) ) ) ) # ( \operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ $ (\operand_2[5]~input_o\)))) # (\operand_2[0]~input_o\ 
-- & ((!\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ $ (\operand_2[5]~input_o\))) # (\operand_2[7]~input_o\ & ((!\operand_2[1]~input_o\) # (!\operand_2[5]~input_o\))))) ) ) ) # ( !\operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- (!\operand_2[5]~input_o\ & (!\operand_2[1]~input_o\ $ (((!\operand_2[7]~input_o\) # (\operand_2[0]~input_o\))))) # (\operand_2[5]~input_o\ & (!\operand_2[1]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[7]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010110101100000011100010001011010101101001010110000000000111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[7]~input_o\,
	datac => \ALT_INV_operand_2[1]~input_o\,
	datad => \ALT_INV_operand_2[5]~input_o\,
	datae => \ALT_INV_operand_2[4]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux3~1_combout\);

-- Location: LABCELL_X11_Y3_N30
\gfinv_1|Mux3~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux3~3_combout\ = ( \operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & ((!\operand_2[5]~input_o\ & (!\operand_2[0]~input_o\)) # (\operand_2[5]~input_o\ & ((\operand_2[7]~input_o\))))) # (\operand_2[1]~input_o\ & 
-- ((!\operand_2[0]~input_o\) # (!\operand_2[5]~input_o\ $ (!\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[4]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[5]~input_o\ & (!\operand_2[0]~input_o\ $ (((\operand_2[7]~input_o\) # 
-- (\operand_2[1]~input_o\))))) # (\operand_2[5]~input_o\ & (\operand_2[1]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[7]~input_o\)))) ) ) ) # ( \operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & 
-- ((!\operand_2[5]~input_o\ & ((\operand_2[7]~input_o\))) # (\operand_2[5]~input_o\ & (\operand_2[1]~input_o\)))) # (\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ $ (((!\operand_2[5]~input_o\ & \operand_2[1]~input_o\))))) ) ) ) # ( 
-- !\operand_2[4]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ & ((!\operand_2[1]~input_o\) # (\operand_2[5]~input_o\)))) # (\operand_2[0]~input_o\ & (((\operand_2[7]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010001001010101010100111000111010000101010001101000101110111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[5]~input_o\,
	datac => \ALT_INV_operand_2[1]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[4]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux3~3_combout\);

-- Location: LABCELL_X11_Y3_N42
\gfinv_1|Mux3~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux3~4_combout\ = ( \gfinv_1|Mux3~1_combout\ & ( \gfinv_1|Mux3~3_combout\ & ( ((!\operand_2[6]~input_o\ & (\gfinv_1|Mux3~0_combout\)) # (\operand_2[6]~input_o\ & ((!\gfinv_1|Mux3~2_combout\)))) # (\operand_2[2]~input_o\) ) ) ) # ( 
-- !\gfinv_1|Mux3~1_combout\ & ( \gfinv_1|Mux3~3_combout\ & ( (!\operand_2[6]~input_o\ & (\gfinv_1|Mux3~0_combout\ & ((!\operand_2[2]~input_o\)))) # (\operand_2[6]~input_o\ & (((!\gfinv_1|Mux3~2_combout\) # (\operand_2[2]~input_o\)))) ) ) ) # ( 
-- \gfinv_1|Mux3~1_combout\ & ( !\gfinv_1|Mux3~3_combout\ & ( (!\operand_2[6]~input_o\ & (((\operand_2[2]~input_o\)) # (\gfinv_1|Mux3~0_combout\))) # (\operand_2[6]~input_o\ & (((!\gfinv_1|Mux3~2_combout\ & !\operand_2[2]~input_o\)))) ) ) ) # ( 
-- !\gfinv_1|Mux3~1_combout\ & ( !\gfinv_1|Mux3~3_combout\ & ( (!\operand_2[2]~input_o\ & ((!\operand_2[6]~input_o\ & (\gfinv_1|Mux3~0_combout\)) # (\operand_2[6]~input_o\ & ((!\gfinv_1|Mux3~2_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111010000000000011101001100110001110100001100110111010011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_Mux3~0_combout\,
	datab => \ALT_INV_operand_2[6]~input_o\,
	datac => \gfinv_1|ALT_INV_Mux3~2_combout\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \gfinv_1|ALT_INV_Mux3~1_combout\,
	dataf => \gfinv_1|ALT_INV_Mux3~3_combout\,
	combout => \gfinv_1|Mux3~4_combout\);

-- Location: FF_X11_Y3_N44
\gfinv_1|rslt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfinv_1|Mux3~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(4));

-- Location: LABCELL_X11_Y3_N18
\gfinv_1|Mux2~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux2~3_combout\ = ( \operand_2[0]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ & (!\operand_2[4]~input_o\ $ (\operand_2[2]~input_o\)))) # (\operand_2[7]~input_o\ & (\operand_2[4]~input_o\ & 
-- (!\operand_2[1]~input_o\ $ (\operand_2[2]~input_o\)))) ) ) ) # ( !\operand_2[0]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\) # (\operand_2[4]~input_o\))) # 
-- (\operand_2[7]~input_o\ & (\operand_2[4]~input_o\ & !\operand_2[2]~input_o\)))) # (\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ & (\operand_2[4]~input_o\ & !\operand_2[2]~input_o\))) ) ) ) # ( \operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- !\operand_2[7]~input_o\ $ (((\operand_2[4]~input_o\ & \operand_2[2]~input_o\))) ) ) ) # ( !\operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & (\operand_2[1]~input_o\)) # (\operand_2[7]~input_o\ & ((!\operand_2[4]~input_o\ & 
-- (!\operand_2[1]~input_o\)) # (\operand_2[4]~input_o\ & ((\operand_2[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010001100111110011001100001110001110000010001000001000001001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[1]~input_o\,
	datab => \ALT_INV_operand_2[7]~input_o\,
	datac => \ALT_INV_operand_2[4]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[0]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux2~3_combout\);

-- Location: LABCELL_X11_Y3_N12
\gfinv_1|Mux2~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux2~2_combout\ = ( \operand_2[0]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & (((\operand_2[4]~input_o\) # (\operand_2[7]~input_o\)))) # (\operand_2[2]~input_o\ & (\operand_2[1]~input_o\)) ) ) ) # ( !\operand_2[0]~input_o\ 
-- & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ & ((!\operand_2[4]~input_o\) # (\operand_2[2]~input_o\)))) # (\operand_2[1]~input_o\ & (\operand_2[2]~input_o\ & ((!\operand_2[4]~input_o\) # (\operand_2[7]~input_o\)))) ) 
-- ) ) # ( \operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & (!\operand_2[2]~input_o\ & (!\operand_2[1]~input_o\ $ (\operand_2[4]~input_o\)))) # (\operand_2[7]~input_o\ & (((\operand_2[4]~input_o\)))) ) ) ) # ( 
-- !\operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & ((!\operand_2[4]~input_o\) # (!\operand_2[1]~input_o\ $ (!\operand_2[2]~input_o\)))) # (\operand_2[7]~input_o\ & ((!\operand_2[1]~input_o\ & ((\operand_2[2]~input_o\))) # 
-- (\operand_2[1]~input_o\ & (\operand_2[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100010111101011100001110000001110000000110110010011111101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[1]~input_o\,
	datab => \ALT_INV_operand_2[7]~input_o\,
	datac => \ALT_INV_operand_2[4]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[0]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux2~2_combout\);

-- Location: LABCELL_X11_Y3_N0
\gfinv_1|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux2~0_combout\ = ( \operand_2[0]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[4]~input_o\ & (((!\operand_2[1]~input_o\ & \operand_2[2]~input_o\)) # (\operand_2[7]~input_o\))) # (\operand_2[4]~input_o\ & (\operand_2[1]~input_o\ & 
-- ((\operand_2[2]~input_o\)))) ) ) ) # ( !\operand_2[0]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & ((!\operand_2[4]~input_o\ & (!\operand_2[7]~input_o\)) # (\operand_2[4]~input_o\ & ((\operand_2[2]~input_o\))))) # 
-- (\operand_2[1]~input_o\ & (\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\)))) ) ) ) # ( \operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & ((!\operand_2[1]~input_o\ $ (!\operand_2[4]~input_o\)) # 
-- (\operand_2[2]~input_o\))) # (\operand_2[7]~input_o\ & (\operand_2[2]~input_o\ & (!\operand_2[1]~input_o\ $ (!\operand_2[4]~input_o\)))) ) ) ) # ( !\operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (\operand_2[2]~input_o\ & 
-- (!\operand_2[7]~input_o\ $ (!\operand_2[4]~input_o\)))) # (\operand_2[1]~input_o\ & (!\operand_2[4]~input_o\ & ((\operand_2[2]~input_o\) # (\operand_2[7]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000001111000010010001101111010010001100010100011000010110101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[1]~input_o\,
	datab => \ALT_INV_operand_2[7]~input_o\,
	datac => \ALT_INV_operand_2[4]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[0]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux2~0_combout\);

-- Location: LABCELL_X11_Y3_N6
\gfinv_1|Mux2~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux2~1_combout\ = ( \operand_2[0]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & ((!\operand_2[1]~input_o\ & (\operand_2[7]~input_o\)) # (\operand_2[1]~input_o\ & ((\operand_2[4]~input_o\))))) # (\operand_2[2]~input_o\ & 
-- (!\operand_2[4]~input_o\ & ((!\operand_2[1]~input_o\) # (\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[0]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[4]~input_o\ & ((!\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\))) # 
-- (\operand_2[7]~input_o\ & (\operand_2[1]~input_o\)))) # (\operand_2[4]~input_o\ & (\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ $ (!\operand_2[2]~input_o\)))) ) ) ) # ( \operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & 
-- (\operand_2[4]~input_o\ & (!\operand_2[1]~input_o\ $ (\operand_2[2]~input_o\)))) # (\operand_2[7]~input_o\ & (!\operand_2[2]~input_o\ $ (((!\operand_2[1]~input_o\ & !\operand_2[4]~input_o\))))) ) ) ) # ( !\operand_2[0]~input_o\ & ( !\operand_2[3]~input_o\ 
-- & ( (!\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\))) # (\operand_2[7]~input_o\ & ((\operand_2[2]~input_o\) # (\operand_2[4]~input_o\))))) # (\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\) # 
-- ((!\operand_2[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101111001110110000110110010010011010001000101000010011110110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[1]~input_o\,
	datab => \ALT_INV_operand_2[7]~input_o\,
	datac => \ALT_INV_operand_2[4]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[0]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux2~1_combout\);

-- Location: LABCELL_X11_Y3_N36
\gfinv_1|Mux2~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux2~4_combout\ = ( \gfinv_1|Mux2~0_combout\ & ( \gfinv_1|Mux2~1_combout\ & ( (!\operand_2[5]~input_o\) # ((!\operand_2[6]~input_o\ & ((\gfinv_1|Mux2~2_combout\))) # (\operand_2[6]~input_o\ & (!\gfinv_1|Mux2~3_combout\))) ) ) ) # ( 
-- !\gfinv_1|Mux2~0_combout\ & ( \gfinv_1|Mux2~1_combout\ & ( (!\operand_2[5]~input_o\ & (\operand_2[6]~input_o\)) # (\operand_2[5]~input_o\ & ((!\operand_2[6]~input_o\ & ((\gfinv_1|Mux2~2_combout\))) # (\operand_2[6]~input_o\ & 
-- (!\gfinv_1|Mux2~3_combout\)))) ) ) ) # ( \gfinv_1|Mux2~0_combout\ & ( !\gfinv_1|Mux2~1_combout\ & ( (!\operand_2[5]~input_o\ & (!\operand_2[6]~input_o\)) # (\operand_2[5]~input_o\ & ((!\operand_2[6]~input_o\ & ((\gfinv_1|Mux2~2_combout\))) # 
-- (\operand_2[6]~input_o\ & (!\gfinv_1|Mux2~3_combout\)))) ) ) ) # ( !\gfinv_1|Mux2~0_combout\ & ( !\gfinv_1|Mux2~1_combout\ & ( (\operand_2[5]~input_o\ & ((!\operand_2[6]~input_o\ & ((\gfinv_1|Mux2~2_combout\))) # (\operand_2[6]~input_o\ & 
-- (!\gfinv_1|Mux2~3_combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000001010100100110001101110000110010011101101011101011111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[5]~input_o\,
	datab => \ALT_INV_operand_2[6]~input_o\,
	datac => \gfinv_1|ALT_INV_Mux2~3_combout\,
	datad => \gfinv_1|ALT_INV_Mux2~2_combout\,
	datae => \gfinv_1|ALT_INV_Mux2~0_combout\,
	dataf => \gfinv_1|ALT_INV_Mux2~1_combout\,
	combout => \gfinv_1|Mux2~4_combout\);

-- Location: FF_X11_Y3_N37
\gfinv_1|rslt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfinv_1|Mux2~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(5));

-- Location: LABCELL_X9_Y4_N54
\gfinv_1|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux4~0_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ & ((!\operand_2[0]~input_o\) # (!\operand_2[2]~input_o\)))) # (\operand_2[1]~input_o\ & (\operand_2[2]~input_o\ & 
-- (!\operand_2[0]~input_o\ $ (\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[2]~input_o\)))) # (\operand_2[1]~input_o\ 
-- & ((!\operand_2[0]~input_o\ & (\operand_2[7]~input_o\)) # (\operand_2[0]~input_o\ & ((\operand_2[2]~input_o\))))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & (\operand_2[0]~input_o\ & 
-- ((\operand_2[7]~input_o\) # (\operand_2[1]~input_o\)))) # (\operand_2[2]~input_o\ & (((!\operand_2[1]~input_o\) # (\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & 
-- ((!\operand_2[7]~input_o\) # ((\operand_2[0]~input_o\ & !\operand_2[2]~input_o\)))) # (\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ $ (((!\operand_2[0]~input_o\) # (\operand_2[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101011011000011000101011100111100000110000110111100000010100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux4~0_combout\);

-- Location: LABCELL_X9_Y4_N6
\gfinv_1|Mux4~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux4~2_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\ $ ((!\operand_2[7]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\)) # 
-- (\operand_2[1]~input_o\ & (\operand_2[7]~input_o\ & \operand_2[2]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ $ (\operand_2[2]~input_o\)))) # 
-- (\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\))) # (\operand_2[7]~input_o\ & ((\operand_2[2]~input_o\) # (\operand_2[1]~input_o\))))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- (!\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ $ (((!\operand_2[2]~input_o\) # (\operand_2[0]~input_o\))))) # (\operand_2[7]~input_o\ & (\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\ & !\operand_2[2]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ 
-- & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ & !\operand_2[2]~input_o\))) # (\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\) # ((\operand_2[7]~input_o\ & \operand_2[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110010001000101001101001001000001110001000001110110100001101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux4~2_combout\);

-- Location: LABCELL_X9_Y4_N36
\gfinv_1|Mux4~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux4~3_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (!\operand_2[2]~input_o\ $ (((\operand_2[7]~input_o\) # (\operand_2[0]~input_o\))))) # (\operand_2[1]~input_o\ & ((!\operand_2[0]~input_o\ & 
-- ((\operand_2[2]~input_o\) # (\operand_2[7]~input_o\))) # (\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & (\operand_2[1]~input_o\ & (!\operand_2[0]~input_o\ 
-- $ (\operand_2[7]~input_o\)))) # (\operand_2[2]~input_o\ & ((!\operand_2[0]~input_o\ & ((\operand_2[7]~input_o\))) # (\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ & ((!\operand_2[1]~input_o\) # (\operand_2[2]~input_o\)))) # (\operand_2[0]~input_o\ & (((\operand_2[2]~input_o\)) # (\operand_2[1]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ & ( 
-- !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & ((!\operand_2[2]~input_o\) # ((!\operand_2[1]~input_o\ & \operand_2[7]~input_o\)))) # (\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ $ (!\operand_2[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011101001001000100100011111010100100001010011101001001001111110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux4~3_combout\);

-- Location: LABCELL_X9_Y4_N0
\gfinv_1|Mux4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux4~1_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & ((!\operand_2[2]~input_o\) # ((!\operand_2[0]~input_o\ & \operand_2[7]~input_o\)))) # (\operand_2[1]~input_o\ & (!\operand_2[2]~input_o\ $ 
-- (((!\operand_2[7]~input_o\) # (\operand_2[0]~input_o\))))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & ((!\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\))) # (\operand_2[0]~input_o\ & 
-- (\operand_2[1]~input_o\)))) # (\operand_2[2]~input_o\ & ((!\operand_2[1]~input_o\ $ (\operand_2[7]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & (((!\operand_2[1]~input_o\ & 
-- \operand_2[7]~input_o\)))) # (\operand_2[2]~input_o\ & ((!\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\))) # (\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- (!\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[1]~input_o\ $ (\operand_2[2]~input_o\)))) # (\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & !\operand_2[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110001010010000000011001110010010110001110000111100111000111001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux4~1_combout\);

-- Location: LABCELL_X9_Y4_N30
\gfinv_1|Mux4~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux4~4_combout\ = ( \gfinv_1|Mux4~1_combout\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[4]~input_o\ & (\gfinv_1|Mux4~2_combout\)) # (\operand_2[4]~input_o\ & ((\gfinv_1|Mux4~3_combout\))) ) ) ) # ( !\gfinv_1|Mux4~1_combout\ & ( 
-- \operand_2[6]~input_o\ & ( (!\operand_2[4]~input_o\ & (\gfinv_1|Mux4~2_combout\)) # (\operand_2[4]~input_o\ & ((\gfinv_1|Mux4~3_combout\))) ) ) ) # ( \gfinv_1|Mux4~1_combout\ & ( !\operand_2[6]~input_o\ & ( (!\gfinv_1|Mux4~0_combout\ & 
-- !\operand_2[4]~input_o\) ) ) ) # ( !\gfinv_1|Mux4~1_combout\ & ( !\operand_2[6]~input_o\ & ( (!\gfinv_1|Mux4~0_combout\) # (\operand_2[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101011111111101010100000000000110011000011110011001100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_Mux4~0_combout\,
	datab => \gfinv_1|ALT_INV_Mux4~2_combout\,
	datac => \gfinv_1|ALT_INV_Mux4~3_combout\,
	datad => \ALT_INV_operand_2[4]~input_o\,
	datae => \gfinv_1|ALT_INV_Mux4~1_combout\,
	dataf => \ALT_INV_operand_2[6]~input_o\,
	combout => \gfinv_1|Mux4~4_combout\);

-- Location: FF_X10_Y6_N23
\gfinv_1|rslt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	asdata => \gfinv_1|Mux4~4_combout\,
	clrn => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(3));

-- Location: LABCELL_X9_Y4_N48
\gfinv_1|Mux7~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux7~0_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ $ (!\operand_2[2]~input_o\)))) # (\operand_2[1]~input_o\ & (!\operand_2[0]~input_o\ $ 
-- (((\operand_2[7]~input_o\ & \operand_2[2]~input_o\))))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\) # ((!\operand_2[7]~input_o\) # (!\operand_2[2]~input_o\)))) # 
-- (\operand_2[0]~input_o\ & (((!\operand_2[1]~input_o\ & !\operand_2[2]~input_o\)) # (\operand_2[7]~input_o\))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & 
-- ((!\operand_2[2]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\))) # (\operand_2[7]~input_o\ & (\operand_2[1]~input_o\ & \operand_2[2]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( 
-- !\operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ $ (((!\operand_2[0]~input_o\ & !\operand_2[2]~input_o\))))) # (\operand_2[1]~input_o\ & (((\operand_2[7]~input_o\ & !\operand_2[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100101111000000011100100000000111101111101011010010011001100001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux7~0_combout\);

-- Location: LABCELL_X9_Y4_N42
\gfinv_1|Mux7~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux7~1_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & (!\operand_2[0]~input_o\ & ((\operand_2[2]~input_o\) # (\operand_2[7]~input_o\)))) # (\operand_2[1]~input_o\ & (((!\operand_2[7]~input_o\) # 
-- (!\operand_2[2]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (((\operand_2[7]~input_o\ & !\operand_2[2]~input_o\)) # (\operand_2[1]~input_o\))) # (\operand_2[0]~input_o\ & 
-- (!\operand_2[1]~input_o\ & ((\operand_2[2]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ $ (((!\operand_2[1]~input_o\) # (\operand_2[2]~input_o\))))) # 
-- (\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\) # (!\operand_2[2]~input_o\))) # (\operand_2[1]~input_o\ & (\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( 
-- (\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[2]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100001010011011010100101100101010011001100011101110111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux7~1_combout\);

-- Location: LABCELL_X9_Y4_N18
\gfinv_1|Mux7~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux7~3_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\ & \operand_2[2]~input_o\)) # (\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\))))) # 
-- (\operand_2[1]~input_o\ & ((!\operand_2[0]~input_o\) # ((\operand_2[2]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & (\operand_2[7]~input_o\ & ((!\operand_2[0]~input_o\) # 
-- (\operand_2[1]~input_o\)))) # (\operand_2[2]~input_o\ & (\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ $ 
-- (\operand_2[2]~input_o\)))) # (\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & (\operand_2[7]~input_o\ & !\operand_2[2]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[2]~input_o\ & 
-- ((!\operand_2[7]~input_o\) # (\operand_2[1]~input_o\)))) # (\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\ $ (((!\operand_2[2]~input_o\) # (\operand_2[7]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1011001101000001100000010010000000001011010001000010111010110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux7~3_combout\);

-- Location: LABCELL_X9_Y4_N12
\gfinv_1|Mux7~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux7~2_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\ $ (((!\operand_2[7]~input_o\) # (!\operand_2[2]~input_o\))))) # (\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & 
-- ((!\operand_2[2]~input_o\))) # (\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ & \operand_2[2]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & ((!\operand_2[0]~input_o\ & 
-- (\operand_2[1]~input_o\)) # (\operand_2[0]~input_o\ & ((\operand_2[2]~input_o\))))) # (\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ & ((\operand_2[2]~input_o\) # (\operand_2[0]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ 
-- & ( (!\operand_2[0]~input_o\ & (((!\operand_2[7]~input_o\ & \operand_2[2]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\ & ((!\operand_2[2]~input_o\) # (\operand_2[7]~input_o\))) # (\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\) # 
-- (\operand_2[2]~input_o\))))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[7]~input_o\ & ((\operand_2[2]~input_o\) # (\operand_2[1]~input_o\)))) # (\operand_2[0]~input_o\ & 
-- (((!\operand_2[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011100001010010101001011010100100100011111000111001000101100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[2]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux7~2_combout\);

-- Location: LABCELL_X9_Y4_N24
\gfinv_1|Mux7~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux7~4_combout\ = ( \operand_2[4]~input_o\ & ( \operand_2[6]~input_o\ & ( !\gfinv_1|Mux7~3_combout\ ) ) ) # ( !\operand_2[4]~input_o\ & ( \operand_2[6]~input_o\ & ( \gfinv_1|Mux7~2_combout\ ) ) ) # ( \operand_2[4]~input_o\ & ( 
-- !\operand_2[6]~input_o\ & ( \gfinv_1|Mux7~1_combout\ ) ) ) # ( !\operand_2[4]~input_o\ & ( !\operand_2[6]~input_o\ & ( \gfinv_1|Mux7~0_combout\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101001100110011001100000000111111111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_Mux7~0_combout\,
	datab => \gfinv_1|ALT_INV_Mux7~1_combout\,
	datac => \gfinv_1|ALT_INV_Mux7~3_combout\,
	datad => \gfinv_1|ALT_INV_Mux7~2_combout\,
	datae => \ALT_INV_operand_2[4]~input_o\,
	dataf => \ALT_INV_operand_2[6]~input_o\,
	combout => \gfinv_1|Mux7~4_combout\);

-- Location: FF_X9_Y4_N25
\gfinv_1|rslt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfinv_1|Mux7~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(0));

-- Location: LABCELL_X11_Y4_N18
\gfinv_1|Mux6~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux6~1_combout\ = ( \operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[7]~input_o\ & (\operand_2[1]~input_o\ & (!\operand_2[0]~input_o\ $ (\operand_2[4]~input_o\)))) # (\operand_2[7]~input_o\ & ((!\operand_2[0]~input_o\) # 
-- (!\operand_2[1]~input_o\ $ (\operand_2[4]~input_o\)))) ) ) ) # ( !\operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[1]~input_o\ & ((!\operand_2[4]~input_o\ & ((\operand_2[7]~input_o\))) # (\operand_2[4]~input_o\ & 
-- (!\operand_2[0]~input_o\)))) # (\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ & ((\operand_2[4]~input_o\) # (\operand_2[0]~input_o\)))) ) ) ) # ( \operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( (!\operand_2[4]~input_o\ & 
-- (!\operand_2[0]~input_o\ $ (((\operand_2[7]~input_o\))))) # (\operand_2[4]~input_o\ & (!\operand_2[1]~input_o\ & ((!\operand_2[0]~input_o\) # (\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( 
-- !\operand_2[7]~input_o\ $ (((!\operand_2[4]~input_o\) # (\operand_2[0]~input_o\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111110100101101001011000110000011100101110000010111000011011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[4]~input_o\,
	datae => \ALT_INV_operand_2[3]~input_o\,
	dataf => \ALT_INV_operand_2[6]~input_o\,
	combout => \gfinv_1|Mux6~1_combout\);

-- Location: LABCELL_X11_Y4_N0
\gfinv_1|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux6~0_combout\ = ( \operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ $ (((!\operand_2[4]~input_o\) # (\operand_2[0]~input_o\))))) # (\operand_2[1]~input_o\ & ((!\operand_2[0]~input_o\) # 
-- ((!\operand_2[7]~input_o\) # (!\operand_2[4]~input_o\)))) ) ) ) # ( !\operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\ & ((!\operand_2[4]~input_o\)))) # (\operand_2[0]~input_o\ & 
-- ((!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\)) # (\operand_2[1]~input_o\ & (\operand_2[7]~input_o\ & \operand_2[4]~input_o\)))) ) ) ) # ( \operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[7]~input_o\ & 
-- (!\operand_2[1]~input_o\ $ (!\operand_2[4]~input_o\)))) # (\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ & \operand_2[4]~input_o\))) ) ) ) # ( !\operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( (!\operand_2[0]~input_o\ 
-- & (!\operand_2[4]~input_o\ & (!\operand_2[1]~input_o\ $ (!\operand_2[7]~input_o\)))) # (\operand_2[0]~input_o\ & (\operand_2[4]~input_o\ & ((!\operand_2[1]~input_o\) # (\operand_2[7]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010100001000101000000100100100011001000010000010011111110110110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[4]~input_o\,
	datae => \ALT_INV_operand_2[3]~input_o\,
	dataf => \ALT_INV_operand_2[6]~input_o\,
	combout => \gfinv_1|Mux6~0_combout\);

-- Location: LABCELL_X11_Y4_N30
\gfinv_1|Mux6~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux6~3_combout\ = ( \operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[1]~input_o\ & (((!\operand_2[7]~input_o\) # (!\operand_2[4]~input_o\)))) # (\operand_2[1]~input_o\ & (\operand_2[0]~input_o\ & ((\operand_2[4]~input_o\)))) ) ) 
-- ) # ( !\operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\))) # (\operand_2[0]~input_o\ & (((!\operand_2[4]~input_o\)) # (\operand_2[1]~input_o\))) ) ) ) # ( 
-- \operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( (!\operand_2[1]~input_o\ & (!\operand_2[7]~input_o\ $ (((!\operand_2[0]~input_o\) # (!\operand_2[4]~input_o\))))) # (\operand_2[1]~input_o\ & (((!\operand_2[7]~input_o\ & \operand_2[4]~input_o\)))) ) 
-- ) ) # ( !\operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( (!\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\)) # (\operand_2[7]~input_o\ & (!\operand_2[4]~input_o\ & (!\operand_2[0]~input_o\ $ (\operand_2[1]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100110100000000011000111100011010101100100011100110011010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[4]~input_o\,
	datae => \ALT_INV_operand_2[3]~input_o\,
	dataf => \ALT_INV_operand_2[6]~input_o\,
	combout => \gfinv_1|Mux6~3_combout\);

-- Location: LABCELL_X11_Y4_N12
\gfinv_1|Mux6~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux6~2_combout\ = ( \operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[0]~input_o\ & (\operand_2[1]~input_o\ & (\operand_2[7]~input_o\ & \operand_2[4]~input_o\))) # (\operand_2[0]~input_o\ & (((!\operand_2[1]~input_o\ & 
-- !\operand_2[4]~input_o\)) # (\operand_2[7]~input_o\))) ) ) ) # ( !\operand_2[3]~input_o\ & ( \operand_2[6]~input_o\ & ( (!\operand_2[1]~input_o\ & ((!\operand_2[4]~input_o\ & (!\operand_2[0]~input_o\)) # (\operand_2[4]~input_o\ & 
-- ((!\operand_2[7]~input_o\))))) # (\operand_2[1]~input_o\ & (!\operand_2[4]~input_o\ $ (((!\operand_2[0]~input_o\) # (!\operand_2[7]~input_o\))))) ) ) ) # ( \operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( !\operand_2[1]~input_o\ $ 
-- (((!\operand_2[7]~input_o\ & (\operand_2[0]~input_o\ & \operand_2[4]~input_o\)) # (\operand_2[7]~input_o\ & ((!\operand_2[4]~input_o\))))) ) ) ) # ( !\operand_2[3]~input_o\ & ( !\operand_2[6]~input_o\ & ( (!\operand_2[1]~input_o\ & 
-- ((!\operand_2[7]~input_o\) # (!\operand_2[0]~input_o\ $ (\operand_2[4]~input_o\)))) # (\operand_2[1]~input_o\ & (((!\operand_2[7]~input_o\ & !\operand_2[4]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111100011000100110000111001110010001001111100100100010100000111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[0]~input_o\,
	datab => \ALT_INV_operand_2[1]~input_o\,
	datac => \ALT_INV_operand_2[7]~input_o\,
	datad => \ALT_INV_operand_2[4]~input_o\,
	datae => \ALT_INV_operand_2[3]~input_o\,
	dataf => \ALT_INV_operand_2[6]~input_o\,
	combout => \gfinv_1|Mux6~2_combout\);

-- Location: LABCELL_X11_Y4_N6
\gfinv_1|Mux6~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux6~4_combout\ = ( \operand_2[2]~input_o\ & ( \gfinv_1|Mux6~2_combout\ & ( (!\operand_2[5]~input_o\ & (!\gfinv_1|Mux6~1_combout\)) # (\operand_2[5]~input_o\ & ((!\gfinv_1|Mux6~3_combout\))) ) ) ) # ( !\operand_2[2]~input_o\ & ( 
-- \gfinv_1|Mux6~2_combout\ & ( (!\operand_2[5]~input_o\ & \gfinv_1|Mux6~0_combout\) ) ) ) # ( \operand_2[2]~input_o\ & ( !\gfinv_1|Mux6~2_combout\ & ( (!\operand_2[5]~input_o\ & (!\gfinv_1|Mux6~1_combout\)) # (\operand_2[5]~input_o\ & 
-- ((!\gfinv_1|Mux6~3_combout\))) ) ) ) # ( !\operand_2[2]~input_o\ & ( !\gfinv_1|Mux6~2_combout\ & ( (\gfinv_1|Mux6~0_combout\) # (\operand_2[5]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011111100111111101110111000100000001100000011001011101110001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_Mux6~1_combout\,
	datab => \ALT_INV_operand_2[5]~input_o\,
	datac => \gfinv_1|ALT_INV_Mux6~0_combout\,
	datad => \gfinv_1|ALT_INV_Mux6~3_combout\,
	datae => \ALT_INV_operand_2[2]~input_o\,
	dataf => \gfinv_1|ALT_INV_Mux6~2_combout\,
	combout => \gfinv_1|Mux6~4_combout\);

-- Location: FF_X11_Y4_N7
\gfinv_1|rslt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfinv_1|Mux6~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(1));

-- Location: LABCELL_X10_Y4_N36
\gfinv_1|Mux5~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux5~2_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[7]~input_o\ & ((!\operand_2[3]~input_o\ & ((!\operand_2[2]~input_o\))) # (\operand_2[3]~input_o\ & (\operand_2[0]~input_o\)))) # (\operand_2[7]~input_o\ & 
-- ((!\operand_2[3]~input_o\ $ (!\operand_2[0]~input_o\)) # (\operand_2[2]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[3]~input_o\ & (!\operand_2[0]~input_o\ & (!\operand_2[2]~input_o\ $ 
-- (\operand_2[7]~input_o\)))) # (\operand_2[3]~input_o\ & ((!\operand_2[0]~input_o\ $ (\operand_2[2]~input_o\)) # (\operand_2[7]~input_o\))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[2]~input_o\ & (\operand_2[3]~input_o\ 
-- & (!\operand_2[0]~input_o\))) # (\operand_2[2]~input_o\ & ((!\operand_2[0]~input_o\ $ (\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[3]~input_o\ & (!\operand_2[7]~input_o\ $ 
-- (((!\operand_2[2]~input_o\) # (\operand_2[0]~input_o\))))) # (\operand_2[3]~input_o\ & (!\operand_2[2]~input_o\ & ((!\operand_2[0]~input_o\) # (!\operand_2[7]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101100011100010010011000100001111000001010111011011000101101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[3]~input_o\,
	datab => \ALT_INV_operand_2[0]~input_o\,
	datac => \ALT_INV_operand_2[2]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfinv_1|Mux5~2_combout\);

-- Location: LABCELL_X10_Y4_N15
\gfinv_1|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux5~0_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ & (!\operand_2[2]~input_o\ $ (\operand_2[1]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[1]~input_o\) # 
-- ((!\operand_2[2]~input_o\ & !\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & (\operand_2[0]~input_o\ & (!\operand_2[2]~input_o\ $ (!\operand_2[1]~input_o\)))) # (\operand_2[7]~input_o\ 
-- & ((!\operand_2[1]~input_o\) # ((\operand_2[2]~input_o\ & !\operand_2[0]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[7]~input_o\ & (!\operand_2[1]~input_o\ $ (((!\operand_2[2]~input_o\) # 
-- (\operand_2[0]~input_o\))))) # (\operand_2[7]~input_o\ & (((\operand_2[0]~input_o\ & !\operand_2[1]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[2]~input_o\ & ((!\operand_2[7]~input_o\ & 
-- ((!\operand_2[1]~input_o\))) # (\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\)))) # (\operand_2[2]~input_o\ & (\operand_2[1]~input_o\ & ((!\operand_2[7]~input_o\) # (\operand_2[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010100001100101010000111000110000110111000110001000111101001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[2]~input_o\,
	datab => \ALT_INV_operand_2[7]~input_o\,
	datac => \ALT_INV_operand_2[0]~input_o\,
	datad => \ALT_INV_operand_2[1]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux5~0_combout\);

-- Location: LABCELL_X10_Y4_N30
\gfinv_1|Mux5~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux5~3_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[3]~input_o\ $ (((!\operand_2[7]~input_o\) # (\operand_2[2]~input_o\))))) # (\operand_2[0]~input_o\ & (\operand_2[3]~input_o\ & 
-- (!\operand_2[2]~input_o\ $ (!\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[2]~input_o\ $ (((!\operand_2[3]~input_o\) # (!\operand_2[7]~input_o\))))) # 
-- (\operand_2[0]~input_o\ & (!\operand_2[3]~input_o\ & ((!\operand_2[2]~input_o\) # (\operand_2[7]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[3]~input_o\ & (\operand_2[0]~input_o\ & 
-- ((\operand_2[7]~input_o\)))) # (\operand_2[3]~input_o\ & (((\operand_2[2]~input_o\)) # (\operand_2[0]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (\operand_2[3]~input_o\ & (\operand_2[2]~input_o\ & 
-- !\operand_2[7]~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100000000000101010011011100101100011010100100010110010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[3]~input_o\,
	datab => \ALT_INV_operand_2[0]~input_o\,
	datac => \ALT_INV_operand_2[2]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfinv_1|Mux5~3_combout\);

-- Location: LABCELL_X10_Y4_N18
\gfinv_1|Mux5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux5~1_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[3]~input_o\ & (\operand_2[2]~input_o\ & !\operand_2[7]~input_o\))) # (\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\ & 
-- (\operand_2[3]~input_o\)) # (\operand_2[7]~input_o\ & ((!\operand_2[2]~input_o\))))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ & (!\operand_2[3]~input_o\ $ 
-- (\operand_2[2]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[2]~input_o\ & ((!\operand_2[7]~input_o\))) # (\operand_2[2]~input_o\ & (\operand_2[3]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( 
-- (!\operand_2[2]~input_o\ & (((!\operand_2[7]~input_o\)))) # (\operand_2[2]~input_o\ & ((!\operand_2[3]~input_o\ & ((\operand_2[7]~input_o\) # (\operand_2[0]~input_o\))) # (\operand_2[3]~input_o\ & (!\operand_2[0]~input_o\ $ (\operand_2[7]~input_o\))))) ) 
-- ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[7]~input_o\ & ((!\operand_2[0]~input_o\) # (!\operand_2[3]~input_o\ $ (\operand_2[2]~input_o\)))) # (\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\ $ (((\operand_2[3]~input_o\ 
-- & \operand_2[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1110110111001001111101100000101110110101000000010001100100110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[3]~input_o\,
	datab => \ALT_INV_operand_2[0]~input_o\,
	datac => \ALT_INV_operand_2[2]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfinv_1|Mux5~1_combout\);

-- Location: LABCELL_X10_Y4_N6
\gfinv_1|Mux5~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux5~4_combout\ = ( \operand_2[4]~input_o\ & ( \gfinv_1|Mux5~1_combout\ & ( (\operand_2[6]~input_o\ & \gfinv_1|Mux5~3_combout\) ) ) ) # ( !\operand_2[4]~input_o\ & ( \gfinv_1|Mux5~1_combout\ & ( (!\operand_2[6]~input_o\ & 
-- ((!\gfinv_1|Mux5~0_combout\))) # (\operand_2[6]~input_o\ & (!\gfinv_1|Mux5~2_combout\)) ) ) ) # ( \operand_2[4]~input_o\ & ( !\gfinv_1|Mux5~1_combout\ & ( (!\operand_2[6]~input_o\) # (\gfinv_1|Mux5~3_combout\) ) ) ) # ( !\operand_2[4]~input_o\ & ( 
-- !\gfinv_1|Mux5~1_combout\ & ( (!\operand_2[6]~input_o\ & ((!\gfinv_1|Mux5~0_combout\))) # (\operand_2[6]~input_o\ & (!\gfinv_1|Mux5~2_combout\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100101011001010111100001111111111001010110010100000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_Mux5~2_combout\,
	datab => \gfinv_1|ALT_INV_Mux5~0_combout\,
	datac => \ALT_INV_operand_2[6]~input_o\,
	datad => \gfinv_1|ALT_INV_Mux5~3_combout\,
	datae => \ALT_INV_operand_2[4]~input_o\,
	dataf => \gfinv_1|ALT_INV_Mux5~1_combout\,
	combout => \gfinv_1|Mux5~4_combout\);

-- Location: FF_X10_Y4_N7
\gfinv_1|rslt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfinv_1|Mux5~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(2));

-- Location: LABCELL_X10_Y6_N21
\gfmul_1|Mux0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Mux0~4_combout\ = ( !\gfmul_1|count\(1) & ( (!\gfmul_1|count\(2) & ((((!\gfmul_1|count\(0)))))) # (\gfmul_1|count\(2) & (((!\gfmul_1|count\(0) & (\gfinv_1|rslt\(3))) # (\gfmul_1|count\(0) & ((\gfinv_1|rslt\(2))))))) ) ) # ( \gfmul_1|count\(1) & ( 
-- ((!\gfmul_1|count\(2) & (((!\gfmul_1|count\(0))))) # (\gfmul_1|count\(2) & ((!\gfmul_1|count\(0) & ((\gfinv_1|rslt\(1)))) # (\gfmul_1|count\(0) & (\gfinv_1|rslt\(0)))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "1101110111011101110011001111111100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_rslt\(3),
	datab => \gfmul_1|ALT_INV_count\(2),
	datac => \gfinv_1|ALT_INV_rslt\(0),
	datad => \gfinv_1|ALT_INV_rslt\(1),
	datae => \gfmul_1|ALT_INV_count\(1),
	dataf => \gfmul_1|ALT_INV_count\(0),
	datag => \gfinv_1|ALT_INV_rslt\(2),
	combout => \gfmul_1|Mux0~4_combout\);

-- Location: LABCELL_X10_Y4_N54
\gfinv_1|Mux1~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux1~1_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & (\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\)))) # (\operand_2[6]~input_o\ & ((!\operand_2[0]~input_o\ & (!\operand_2[2]~input_o\)) # 
-- (\operand_2[0]~input_o\ & (\operand_2[2]~input_o\ & \operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[7]~input_o\ $ (((\operand_2[6]~input_o\ & !\operand_2[2]~input_o\))))) 
-- # (\operand_2[0]~input_o\ & (\operand_2[7]~input_o\ & (!\operand_2[6]~input_o\ $ (!\operand_2[2]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[2]~input_o\ & ((!\operand_2[0]~input_o\) # (!\operand_2[6]~input_o\ 
-- $ (\operand_2[7]~input_o\)))) # (\operand_2[2]~input_o\ & (\operand_2[6]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & 
-- (\operand_2[7]~input_o\ & ((!\operand_2[0]~input_o\) # (\operand_2[2]~input_o\)))) # (\operand_2[6]~input_o\ & ((!\operand_2[2]~input_o\ & ((\operand_2[7]~input_o\))) # (\operand_2[2]~input_o\ & (\operand_2[0]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000111011011111000011101010010001100010100100110001001000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[0]~input_o\,
	datac => \ALT_INV_operand_2[2]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfinv_1|Mux1~1_combout\);

-- Location: LABCELL_X10_Y4_N42
\gfinv_1|Mux1~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux1~3_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[6]~input_o\ $ (((\operand_2[7]~input_o\) # (\operand_2[2]~input_o\))))) # (\operand_2[0]~input_o\ & ((!\operand_2[2]~input_o\ $ 
-- (!\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & (!\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\) # (\operand_2[2]~input_o\)))) # (\operand_2[6]~input_o\ & 
-- ((!\operand_2[2]~input_o\) # ((\operand_2[0]~input_o\ & !\operand_2[7]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[7]~input_o\ & ((!\operand_2[0]~input_o\ & ((!\operand_2[2]~input_o\))) # 
-- (\operand_2[0]~input_o\ & (\operand_2[6]~input_o\)))) # (\operand_2[7]~input_o\ & (((!\operand_2[2]~input_o\)) # (\operand_2[6]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (\operand_2[0]~input_o\ & 
-- !\operand_2[2]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011000000110000110100011111010111011001010110001000011101110100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[0]~input_o\,
	datac => \ALT_INV_operand_2[2]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfinv_1|Mux1~3_combout\);

-- Location: LABCELL_X10_Y4_N48
\gfinv_1|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux1~0_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & ((!\operand_2[2]~input_o\ & (\operand_2[6]~input_o\)) # (\operand_2[2]~input_o\ & ((\operand_2[7]~input_o\))))) # (\operand_2[0]~input_o\ & 
-- (((!\operand_2[2]~input_o\)) # (\operand_2[6]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[2]~input_o\ & (!\operand_2[7]~input_o\ & ((\operand_2[0]~input_o\) # (\operand_2[6]~input_o\)))) # 
-- (\operand_2[2]~input_o\ & (!\operand_2[6]~input_o\ & (!\operand_2[0]~input_o\))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & ((!\operand_2[7]~input_o\) # ((\operand_2[0]~input_o\ & \operand_2[2]~input_o\)))) 
-- # (\operand_2[6]~input_o\ & (\operand_2[0]~input_o\ & ((!\operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & ((!\operand_2[0]~input_o\ & (\operand_2[2]~input_o\)) # 
-- (\operand_2[0]~input_o\ & ((\operand_2[7]~input_o\))))) # (\operand_2[6]~input_o\ & (!\operand_2[0]~input_o\ $ (((!\operand_2[2]~input_o\) # (!\operand_2[7]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001100100111110101110110000001001111000000010000111000101111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[0]~input_o\,
	datac => \ALT_INV_operand_2[2]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfinv_1|Mux1~0_combout\);

-- Location: LABCELL_X10_Y4_N0
\gfinv_1|Mux1~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux1~2_combout\ = ( \operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & ((!\operand_2[2]~input_o\ & (\operand_2[0]~input_o\ & !\operand_2[7]~input_o\)) # (\operand_2[2]~input_o\ & ((\operand_2[7]~input_o\))))) # 
-- (\operand_2[6]~input_o\ & (!\operand_2[0]~input_o\ & (!\operand_2[2]~input_o\))) ) ) ) # ( !\operand_2[5]~input_o\ & ( \operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & (!\operand_2[0]~input_o\ & (\operand_2[2]~input_o\ & \operand_2[7]~input_o\))) # 
-- (\operand_2[6]~input_o\ & (!\operand_2[7]~input_o\ & (!\operand_2[0]~input_o\ $ (!\operand_2[2]~input_o\)))) ) ) ) # ( \operand_2[5]~input_o\ & ( !\operand_2[1]~input_o\ & ( (!\operand_2[0]~input_o\ & (!\operand_2[6]~input_o\ $ (!\operand_2[2]~input_o\ $ 
-- (\operand_2[7]~input_o\)))) # (\operand_2[0]~input_o\ & ((!\operand_2[6]~input_o\ & (!\operand_2[2]~input_o\ & !\operand_2[7]~input_o\)) # (\operand_2[6]~input_o\ & (\operand_2[2]~input_o\ & \operand_2[7]~input_o\)))) ) ) ) # ( !\operand_2[5]~input_o\ & ( 
-- !\operand_2[1]~input_o\ & ( (!\operand_2[6]~input_o\ & ((!\operand_2[0]~input_o\ & ((\operand_2[7]~input_o\))) # (\operand_2[0]~input_o\ & (\operand_2[2]~input_o\)))) # (\operand_2[6]~input_o\ & ((!\operand_2[7]~input_o\) # ((!\operand_2[0]~input_o\ & 
-- !\operand_2[2]~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011111001010011010001000010100010100000010000110000001001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_operand_2[6]~input_o\,
	datab => \ALT_INV_operand_2[0]~input_o\,
	datac => \ALT_INV_operand_2[2]~input_o\,
	datad => \ALT_INV_operand_2[7]~input_o\,
	datae => \ALT_INV_operand_2[5]~input_o\,
	dataf => \ALT_INV_operand_2[1]~input_o\,
	combout => \gfinv_1|Mux1~2_combout\);

-- Location: LABCELL_X10_Y4_N24
\gfinv_1|Mux1~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfinv_1|Mux1~4_combout\ = ( \gfinv_1|Mux1~2_combout\ & ( \operand_2[3]~input_o\ & ( (!\operand_2[4]~input_o\ & (\gfinv_1|Mux1~1_combout\)) # (\operand_2[4]~input_o\ & ((\gfinv_1|Mux1~3_combout\))) ) ) ) # ( !\gfinv_1|Mux1~2_combout\ & ( 
-- \operand_2[3]~input_o\ & ( (!\operand_2[4]~input_o\ & (\gfinv_1|Mux1~1_combout\)) # (\operand_2[4]~input_o\ & ((\gfinv_1|Mux1~3_combout\))) ) ) ) # ( \gfinv_1|Mux1~2_combout\ & ( !\operand_2[3]~input_o\ & ( (!\operand_2[4]~input_o\ & 
-- \gfinv_1|Mux1~0_combout\) ) ) ) # ( !\gfinv_1|Mux1~2_combout\ & ( !\operand_2[3]~input_o\ & ( (\gfinv_1|Mux1~0_combout\) # (\operand_2[4]~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111111111111000000001111000001010011010100110101001101010011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_Mux1~1_combout\,
	datab => \gfinv_1|ALT_INV_Mux1~3_combout\,
	datac => \ALT_INV_operand_2[4]~input_o\,
	datad => \gfinv_1|ALT_INV_Mux1~0_combout\,
	datae => \gfinv_1|ALT_INV_Mux1~2_combout\,
	dataf => \ALT_INV_operand_2[3]~input_o\,
	combout => \gfinv_1|Mux1~4_combout\);

-- Location: FF_X10_Y4_N25
\gfinv_1|rslt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfinv_1|Mux1~4_combout\,
	clrn => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfinv_1|rslt\(6));

-- Location: LABCELL_X10_Y6_N36
\gfmul_1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Mux0~0_combout\ = ( !\gfmul_1|count\(1) & ( (!\gfmul_1|count\(2) & (((!\gfmul_1|Mux0~4_combout\ & ((\gfinv_1|rslt\(6)))) # (\gfmul_1|Mux0~4_combout\ & (\gfinv_1|rslt\(7)))))) # (\gfmul_1|count\(2) & ((((\gfmul_1|Mux0~4_combout\))))) ) ) # ( 
-- \gfmul_1|count\(1) & ( ((!\gfmul_1|count\(2) & ((!\gfmul_1|Mux0~4_combout\ & (\gfinv_1|rslt\(4))) # (\gfmul_1|Mux0~4_combout\ & ((\gfinv_1|rslt\(5)))))) # (\gfmul_1|count\(2) & (((\gfmul_1|Mux0~4_combout\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "on",
	lut_mask => "0000110000001100000011000000110001110111011101110011001111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfinv_1|ALT_INV_rslt\(7),
	datab => \gfmul_1|ALT_INV_count\(2),
	datac => \gfinv_1|ALT_INV_rslt\(4),
	datad => \gfinv_1|ALT_INV_rslt\(5),
	datae => \gfmul_1|ALT_INV_count\(1),
	dataf => \gfmul_1|ALT_INV_Mux0~4_combout\,
	datag => \gfinv_1|ALT_INV_rslt\(6),
	combout => \gfmul_1|Mux0~0_combout\);

-- Location: IOIBUF_X40_Y0_N41
\operand_1[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(0),
	o => \operand_1[0]~input_o\);

-- Location: IOIBUF_X44_Y0_N35
\operand_1[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(7),
	o => \operand_1[7]~input_o\);

-- Location: IOIBUF_X40_Y0_N58
\operand_1[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(6),
	o => \operand_1[6]~input_o\);

-- Location: IOIBUF_X42_Y0_N18
\operand_1[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(5),
	o => \operand_1[5]~input_o\);

-- Location: IOIBUF_X40_Y0_N92
\operand_1[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(4),
	o => \operand_1[4]~input_o\);

-- Location: IOIBUF_X42_Y0_N52
\operand_1[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(3),
	o => \operand_1[3]~input_o\);

-- Location: IOIBUF_X42_Y0_N35
\operand_1[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(2),
	o => \operand_1[2]~input_o\);

-- Location: IOIBUF_X42_Y0_N1
\operand_1[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_operand_1(1),
	o => \operand_1[1]~input_o\);

-- Location: FF_X9_Y6_N14
\gfmul_1|count[4]\ : dffeas
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
	q => \gfmul_1|count\(4));

-- Location: LABCELL_X9_Y6_N9
\gfmul_1|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~37_sumout\ = SUM(( \gfmul_1|count\(3) ) + ( VCC ) + ( \gfmul_1|Add0~2\ ))
-- \gfmul_1|Add0~38\ = CARRY(( \gfmul_1|count\(3) ) + ( VCC ) + ( \gfmul_1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(3),
	cin => \gfmul_1|Add0~2\,
	sumout => \gfmul_1|Add0~37_sumout\,
	cout => \gfmul_1|Add0~38\);

-- Location: FF_X9_Y6_N11
\gfmul_1|count[3]\ : dffeas
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
	q => \gfmul_1|count\(3));

-- Location: LABCELL_X9_Y6_N12
\gfmul_1|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~33_sumout\ = SUM(( \gfmul_1|count\(4) ) + ( VCC ) + ( \gfmul_1|Add0~38\ ))
-- \gfmul_1|Add0~34\ = CARRY(( \gfmul_1|count\(4) ) + ( VCC ) + ( \gfmul_1|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(4),
	cin => \gfmul_1|Add0~38\,
	sumout => \gfmul_1|Add0~33_sumout\,
	cout => \gfmul_1|Add0~34\);

-- Location: FF_X9_Y6_N13
\gfmul_1|count[4]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[4]~DUPLICATE_q\);

-- Location: FF_X9_Y6_N17
\gfmul_1|count[5]\ : dffeas
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
	q => \gfmul_1|count\(5));

-- Location: LABCELL_X9_Y6_N15
\gfmul_1|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~29_sumout\ = SUM(( \gfmul_1|count\(5) ) + ( VCC ) + ( \gfmul_1|Add0~34\ ))
-- \gfmul_1|Add0~30\ = CARRY(( \gfmul_1|count\(5) ) + ( VCC ) + ( \gfmul_1|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(5),
	cin => \gfmul_1|Add0~34\,
	sumout => \gfmul_1|Add0~29_sumout\,
	cout => \gfmul_1|Add0~30\);

-- Location: FF_X9_Y6_N16
\gfmul_1|count[5]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[5]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y6_N18
\gfmul_1|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~25_sumout\ = SUM(( \gfmul_1|count\(6) ) + ( VCC ) + ( \gfmul_1|Add0~30\ ))
-- \gfmul_1|Add0~26\ = CARRY(( \gfmul_1|count\(6) ) + ( VCC ) + ( \gfmul_1|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(6),
	cin => \gfmul_1|Add0~30\,
	sumout => \gfmul_1|Add0~25_sumout\,
	cout => \gfmul_1|Add0~26\);

-- Location: FF_X9_Y6_N20
\gfmul_1|count[6]\ : dffeas
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
	q => \gfmul_1|count\(6));

-- Location: FF_X9_Y6_N23
\gfmul_1|count[7]\ : dffeas
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
	q => \gfmul_1|count\(7));

-- Location: LABCELL_X9_Y6_N21
\gfmul_1|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~21_sumout\ = SUM(( \gfmul_1|count\(7) ) + ( VCC ) + ( \gfmul_1|Add0~26\ ))
-- \gfmul_1|Add0~22\ = CARRY(( \gfmul_1|count\(7) ) + ( VCC ) + ( \gfmul_1|Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(7),
	cin => \gfmul_1|Add0~26\,
	sumout => \gfmul_1|Add0~21_sumout\,
	cout => \gfmul_1|Add0~22\);

-- Location: FF_X9_Y6_N22
\gfmul_1|count[7]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[7]~DUPLICATE_q\);

-- Location: FF_X9_Y6_N26
\gfmul_1|count[8]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[8]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y6_N24
\gfmul_1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~17_sumout\ = SUM(( \gfmul_1|count[8]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~22\ ))
-- \gfmul_1|Add0~18\ = CARRY(( \gfmul_1|count[8]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[8]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~22\,
	sumout => \gfmul_1|Add0~17_sumout\,
	cout => \gfmul_1|Add0~18\);

-- Location: FF_X9_Y6_N25
\gfmul_1|count[8]\ : dffeas
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
	q => \gfmul_1|count\(8));

-- Location: LABCELL_X10_Y6_N3
\gfmul_1|Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~1_combout\ = ( !\gfmul_1|count[7]~DUPLICATE_q\ & ( !\gfmul_1|count\(8) & ( (!\gfmul_1|count[4]~DUPLICATE_q\ & (!\gfmul_1|count[5]~DUPLICATE_q\ & (!\gfmul_1|count\(6) & !\gfmul_1|count\(3)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count[4]~DUPLICATE_q\,
	datab => \gfmul_1|ALT_INV_count[5]~DUPLICATE_q\,
	datac => \gfmul_1|ALT_INV_count\(6),
	datad => \gfmul_1|ALT_INV_count\(3),
	datae => \gfmul_1|ALT_INV_count[7]~DUPLICATE_q\,
	dataf => \gfmul_1|ALT_INV_count\(8),
	combout => \gfmul_1|Equal0~1_combout\);

-- Location: FF_X9_Y6_N47
\gfmul_1|count[15]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[15]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y6_N27
\gfmul_1|Add0~61\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~61_sumout\ = SUM(( \gfmul_1|count\(9) ) + ( VCC ) + ( \gfmul_1|Add0~18\ ))
-- \gfmul_1|Add0~62\ = CARRY(( \gfmul_1|count\(9) ) + ( VCC ) + ( \gfmul_1|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(9),
	cin => \gfmul_1|Add0~18\,
	sumout => \gfmul_1|Add0~61_sumout\,
	cout => \gfmul_1|Add0~62\);

-- Location: FF_X9_Y6_N29
\gfmul_1|count[9]\ : dffeas
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
	q => \gfmul_1|count\(9));

-- Location: LABCELL_X9_Y6_N30
\gfmul_1|Add0~57\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~57_sumout\ = SUM(( \gfmul_1|count\(10) ) + ( VCC ) + ( \gfmul_1|Add0~62\ ))
-- \gfmul_1|Add0~58\ = CARRY(( \gfmul_1|count\(10) ) + ( VCC ) + ( \gfmul_1|Add0~62\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(10),
	cin => \gfmul_1|Add0~62\,
	sumout => \gfmul_1|Add0~57_sumout\,
	cout => \gfmul_1|Add0~58\);

-- Location: FF_X9_Y6_N31
\gfmul_1|count[10]\ : dffeas
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
	q => \gfmul_1|count\(10));

-- Location: LABCELL_X9_Y6_N33
\gfmul_1|Add0~53\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~53_sumout\ = SUM(( \gfmul_1|count\(11) ) + ( VCC ) + ( \gfmul_1|Add0~58\ ))
-- \gfmul_1|Add0~54\ = CARRY(( \gfmul_1|count\(11) ) + ( VCC ) + ( \gfmul_1|Add0~58\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(11),
	cin => \gfmul_1|Add0~58\,
	sumout => \gfmul_1|Add0~53_sumout\,
	cout => \gfmul_1|Add0~54\);

-- Location: FF_X9_Y6_N35
\gfmul_1|count[11]\ : dffeas
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
	q => \gfmul_1|count\(11));

-- Location: LABCELL_X9_Y6_N36
\gfmul_1|Add0~49\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~49_sumout\ = SUM(( \gfmul_1|count[12]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~54\ ))
-- \gfmul_1|Add0~50\ = CARRY(( \gfmul_1|count[12]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~54\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count[12]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~54\,
	sumout => \gfmul_1|Add0~49_sumout\,
	cout => \gfmul_1|Add0~50\);

-- Location: FF_X9_Y6_N38
\gfmul_1|count[12]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[12]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y6_N39
\gfmul_1|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~45_sumout\ = SUM(( \gfmul_1|count[13]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~50\ ))
-- \gfmul_1|Add0~46\ = CARRY(( \gfmul_1|count[13]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~50\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[13]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~50\,
	sumout => \gfmul_1|Add0~45_sumout\,
	cout => \gfmul_1|Add0~46\);

-- Location: FF_X9_Y6_N41
\gfmul_1|count[13]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[13]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y6_N42
\gfmul_1|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~41_sumout\ = SUM(( \gfmul_1|count\(14) ) + ( VCC ) + ( \gfmul_1|Add0~46\ ))
-- \gfmul_1|Add0~42\ = CARRY(( \gfmul_1|count\(14) ) + ( VCC ) + ( \gfmul_1|Add0~46\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(14),
	cin => \gfmul_1|Add0~46\,
	sumout => \gfmul_1|Add0~41_sumout\,
	cout => \gfmul_1|Add0~42\);

-- Location: FF_X9_Y6_N43
\gfmul_1|count[14]\ : dffeas
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
	q => \gfmul_1|count\(14));

-- Location: LABCELL_X9_Y6_N45
\gfmul_1|Add0~97\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~97_sumout\ = SUM(( \gfmul_1|count[15]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~42\ ))
-- \gfmul_1|Add0~98\ = CARRY(( \gfmul_1|count[15]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count[15]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~42\,
	sumout => \gfmul_1|Add0~97_sumout\,
	cout => \gfmul_1|Add0~98\);

-- Location: FF_X9_Y6_N46
\gfmul_1|count[15]\ : dffeas
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
	q => \gfmul_1|count\(15));

-- Location: LABCELL_X9_Y6_N48
\gfmul_1|Add0~81\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~81_sumout\ = SUM(( \gfmul_1|count[16]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~98\ ))
-- \gfmul_1|Add0~82\ = CARRY(( \gfmul_1|count[16]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~98\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[16]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~98\,
	sumout => \gfmul_1|Add0~81_sumout\,
	cout => \gfmul_1|Add0~82\);

-- Location: FF_X9_Y6_N50
\gfmul_1|count[16]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[16]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y6_N51
\gfmul_1|Add0~77\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~77_sumout\ = SUM(( \gfmul_1|count\(17) ) + ( VCC ) + ( \gfmul_1|Add0~82\ ))
-- \gfmul_1|Add0~78\ = CARRY(( \gfmul_1|count\(17) ) + ( VCC ) + ( \gfmul_1|Add0~82\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(17),
	cin => \gfmul_1|Add0~82\,
	sumout => \gfmul_1|Add0~77_sumout\,
	cout => \gfmul_1|Add0~78\);

-- Location: FF_X9_Y6_N52
\gfmul_1|count[17]\ : dffeas
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
	q => \gfmul_1|count\(17));

-- Location: LABCELL_X9_Y6_N54
\gfmul_1|Add0~73\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~73_sumout\ = SUM(( \gfmul_1|count[18]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~78\ ))
-- \gfmul_1|Add0~74\ = CARRY(( \gfmul_1|count[18]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~78\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count[18]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~78\,
	sumout => \gfmul_1|Add0~73_sumout\,
	cout => \gfmul_1|Add0~74\);

-- Location: FF_X9_Y6_N56
\gfmul_1|count[18]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[18]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y6_N57
\gfmul_1|Add0~69\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~69_sumout\ = SUM(( \gfmul_1|count[19]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~74\ ))
-- \gfmul_1|Add0~70\ = CARRY(( \gfmul_1|count[19]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~74\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count[19]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~74\,
	sumout => \gfmul_1|Add0~69_sumout\,
	cout => \gfmul_1|Add0~70\);

-- Location: FF_X9_Y6_N59
\gfmul_1|count[19]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[19]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y5_N0
\gfmul_1|Add0~65\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~65_sumout\ = SUM(( \gfmul_1|count\(20) ) + ( VCC ) + ( \gfmul_1|Add0~70\ ))
-- \gfmul_1|Add0~66\ = CARRY(( \gfmul_1|count\(20) ) + ( VCC ) + ( \gfmul_1|Add0~70\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(20),
	cin => \gfmul_1|Add0~70\,
	sumout => \gfmul_1|Add0~65_sumout\,
	cout => \gfmul_1|Add0~66\);

-- Location: FF_X9_Y5_N1
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

-- Location: LABCELL_X9_Y5_N3
\gfmul_1|Add0~125\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~125_sumout\ = SUM(( \gfmul_1|count\(21) ) + ( VCC ) + ( \gfmul_1|Add0~66\ ))
-- \gfmul_1|Add0~126\ = CARRY(( \gfmul_1|count\(21) ) + ( VCC ) + ( \gfmul_1|Add0~66\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \gfmul_1|ALT_INV_count\(21),
	cin => \gfmul_1|Add0~66\,
	sumout => \gfmul_1|Add0~125_sumout\,
	cout => \gfmul_1|Add0~126\);

-- Location: FF_X9_Y5_N5
\gfmul_1|count[21]\ : dffeas
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
	q => \gfmul_1|count\(21));

-- Location: LABCELL_X9_Y5_N6
\gfmul_1|Add0~121\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~121_sumout\ = SUM(( \gfmul_1|count[22]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~126\ ))
-- \gfmul_1|Add0~122\ = CARRY(( \gfmul_1|count[22]~DUPLICATE_q\ ) + ( VCC ) + ( \gfmul_1|Add0~126\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count[22]~DUPLICATE_q\,
	cin => \gfmul_1|Add0~126\,
	sumout => \gfmul_1|Add0~121_sumout\,
	cout => \gfmul_1|Add0~122\);

-- Location: FF_X9_Y5_N8
\gfmul_1|count[22]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[22]~DUPLICATE_q\);

-- Location: LABCELL_X9_Y5_N9
\gfmul_1|Add0~117\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~117_sumout\ = SUM(( \gfmul_1|count\(23) ) + ( VCC ) + ( \gfmul_1|Add0~122\ ))
-- \gfmul_1|Add0~118\ = CARRY(( \gfmul_1|count\(23) ) + ( VCC ) + ( \gfmul_1|Add0~122\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(23),
	cin => \gfmul_1|Add0~122\,
	sumout => \gfmul_1|Add0~117_sumout\,
	cout => \gfmul_1|Add0~118\);

-- Location: FF_X9_Y5_N11
\gfmul_1|count[23]\ : dffeas
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
	q => \gfmul_1|count\(23));

-- Location: LABCELL_X9_Y5_N12
\gfmul_1|Add0~113\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~113_sumout\ = SUM(( \gfmul_1|count\(24) ) + ( VCC ) + ( \gfmul_1|Add0~118\ ))
-- \gfmul_1|Add0~114\ = CARRY(( \gfmul_1|count\(24) ) + ( VCC ) + ( \gfmul_1|Add0~118\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(24),
	cin => \gfmul_1|Add0~118\,
	sumout => \gfmul_1|Add0~113_sumout\,
	cout => \gfmul_1|Add0~114\);

-- Location: FF_X9_Y5_N14
\gfmul_1|count[24]\ : dffeas
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
	q => \gfmul_1|count\(24));

-- Location: LABCELL_X9_Y5_N15
\gfmul_1|Add0~109\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~109_sumout\ = SUM(( \gfmul_1|count\(25) ) + ( VCC ) + ( \gfmul_1|Add0~114\ ))
-- \gfmul_1|Add0~110\ = CARRY(( \gfmul_1|count\(25) ) + ( VCC ) + ( \gfmul_1|Add0~114\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(25),
	cin => \gfmul_1|Add0~114\,
	sumout => \gfmul_1|Add0~109_sumout\,
	cout => \gfmul_1|Add0~110\);

-- Location: FF_X9_Y5_N17
\gfmul_1|count[25]\ : dffeas
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
	q => \gfmul_1|count\(25));

-- Location: LABCELL_X9_Y5_N18
\gfmul_1|Add0~105\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~105_sumout\ = SUM(( \gfmul_1|count\(26) ) + ( VCC ) + ( \gfmul_1|Add0~110\ ))
-- \gfmul_1|Add0~106\ = CARRY(( \gfmul_1|count\(26) ) + ( VCC ) + ( \gfmul_1|Add0~110\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(26),
	cin => \gfmul_1|Add0~110\,
	sumout => \gfmul_1|Add0~105_sumout\,
	cout => \gfmul_1|Add0~106\);

-- Location: FF_X9_Y5_N20
\gfmul_1|count[26]\ : dffeas
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
	q => \gfmul_1|count\(26));

-- Location: LABCELL_X9_Y5_N21
\gfmul_1|Add0~101\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~101_sumout\ = SUM(( \gfmul_1|count\(27) ) + ( VCC ) + ( \gfmul_1|Add0~106\ ))
-- \gfmul_1|Add0~102\ = CARRY(( \gfmul_1|count\(27) ) + ( VCC ) + ( \gfmul_1|Add0~106\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(27),
	cin => \gfmul_1|Add0~106\,
	sumout => \gfmul_1|Add0~101_sumout\,
	cout => \gfmul_1|Add0~102\);

-- Location: FF_X9_Y5_N22
\gfmul_1|count[27]\ : dffeas
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
	q => \gfmul_1|count\(27));

-- Location: LABCELL_X9_Y5_N24
\gfmul_1|Add0~85\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~85_sumout\ = SUM(( \gfmul_1|count\(28) ) + ( VCC ) + ( \gfmul_1|Add0~102\ ))
-- \gfmul_1|Add0~86\ = CARRY(( \gfmul_1|count\(28) ) + ( VCC ) + ( \gfmul_1|Add0~102\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(28),
	cin => \gfmul_1|Add0~102\,
	sumout => \gfmul_1|Add0~85_sumout\,
	cout => \gfmul_1|Add0~86\);

-- Location: FF_X9_Y5_N26
\gfmul_1|count[28]\ : dffeas
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
	q => \gfmul_1|count\(28));

-- Location: LABCELL_X9_Y5_N27
\gfmul_1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~9_sumout\ = SUM(( \gfmul_1|count\(29) ) + ( VCC ) + ( \gfmul_1|Add0~86\ ))
-- \gfmul_1|Add0~10\ = CARRY(( \gfmul_1|count\(29) ) + ( VCC ) + ( \gfmul_1|Add0~86\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(29),
	cin => \gfmul_1|Add0~86\,
	sumout => \gfmul_1|Add0~9_sumout\,
	cout => \gfmul_1|Add0~10\);

-- Location: FF_X9_Y5_N28
\gfmul_1|count[29]\ : dffeas
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
	q => \gfmul_1|count\(29));

-- Location: LABCELL_X9_Y5_N30
\gfmul_1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~13_sumout\ = SUM(( \gfmul_1|count\(30) ) + ( VCC ) + ( \gfmul_1|Add0~10\ ))
-- \gfmul_1|Add0~14\ = CARRY(( \gfmul_1|count\(30) ) + ( VCC ) + ( \gfmul_1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \gfmul_1|ALT_INV_count\(30),
	cin => \gfmul_1|Add0~10\,
	sumout => \gfmul_1|Add0~13_sumout\,
	cout => \gfmul_1|Add0~14\);

-- Location: FF_X9_Y5_N32
\gfmul_1|count[30]\ : dffeas
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
	q => \gfmul_1|count\(30));

-- Location: LABCELL_X9_Y5_N33
\gfmul_1|Add0~93\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Add0~93_sumout\ = SUM(( \gfmul_1|count\(31) ) + ( VCC ) + ( \gfmul_1|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(31),
	cin => \gfmul_1|Add0~14\,
	sumout => \gfmul_1|Add0~93_sumout\);

-- Location: LABCELL_X9_Y5_N54
\gfmul_1|count~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|count~0_combout\ = ( \gfmul_1|Add0~93_sumout\ & ( !\gfmul_1|Equal0~6_combout\ ) ) # ( !\gfmul_1|Add0~93_sumout\ & ( \gfmul_1|Equal0~6_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000011110000111111110000111100001111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_Equal0~6_combout\,
	dataf => \gfmul_1|ALT_INV_Add0~93_sumout\,
	combout => \gfmul_1|count~0_combout\);

-- Location: FF_X9_Y5_N55
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

-- Location: LABCELL_X10_Y6_N6
\gfmul_1|Equal0~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~4_combout\ = ( \gfmul_1|count\(2) & ( !\gfmul_1|count\(31) & ( (!\gfmul_1|count\(15) & (!\gfmul_1|count\(27) & (\gfmul_1|count\(1) & \gfmul_1|count\(0)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000100000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(15),
	datab => \gfmul_1|ALT_INV_count\(27),
	datac => \gfmul_1|ALT_INV_count\(1),
	datad => \gfmul_1|ALT_INV_count\(0),
	datae => \gfmul_1|ALT_INV_count\(2),
	dataf => \gfmul_1|ALT_INV_count\(31),
	combout => \gfmul_1|Equal0~4_combout\);

-- Location: FF_X9_Y5_N7
\gfmul_1|count[22]\ : dffeas
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
	q => \gfmul_1|count\(22));

-- Location: LABCELL_X9_Y5_N48
\gfmul_1|Equal0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~5_combout\ = ( !\gfmul_1|count\(22) & ( !\gfmul_1|count\(23) & ( (!\gfmul_1|count\(21) & (!\gfmul_1|count\(25) & (!\gfmul_1|count\(26) & !\gfmul_1|count\(24)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(21),
	datab => \gfmul_1|ALT_INV_count\(25),
	datac => \gfmul_1|ALT_INV_count\(26),
	datad => \gfmul_1|ALT_INV_count\(24),
	datae => \gfmul_1|ALT_INV_count\(22),
	dataf => \gfmul_1|ALT_INV_count\(23),
	combout => \gfmul_1|Equal0~5_combout\);

-- Location: LABCELL_X9_Y5_N39
\gfmul_1|Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~0_combout\ = ( !\gfmul_1|count\(30) & ( !\gfmul_1|count\(29) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111000011110000111100001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \gfmul_1|ALT_INV_count\(29),
	dataf => \gfmul_1|ALT_INV_count\(30),
	combout => \gfmul_1|Equal0~0_combout\);

-- Location: FF_X9_Y6_N34
\gfmul_1|count[11]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[11]~DUPLICATE_q\);

-- Location: FF_X9_Y6_N37
\gfmul_1|count[12]\ : dffeas
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
	q => \gfmul_1|count\(12));

-- Location: FF_X9_Y6_N28
\gfmul_1|count[9]~DUPLICATE\ : dffeas
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
	q => \gfmul_1|count[9]~DUPLICATE_q\);

-- Location: FF_X9_Y6_N40
\gfmul_1|count[13]\ : dffeas
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
	q => \gfmul_1|count\(13));

-- Location: LABCELL_X10_Y6_N54
\gfmul_1|Equal0~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~2_combout\ = ( !\gfmul_1|count[9]~DUPLICATE_q\ & ( !\gfmul_1|count\(13) & ( (!\gfmul_1|count\(10) & (!\gfmul_1|count[11]~DUPLICATE_q\ & (!\gfmul_1|count\(12) & !\gfmul_1|count\(14)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(10),
	datab => \gfmul_1|ALT_INV_count[11]~DUPLICATE_q\,
	datac => \gfmul_1|ALT_INV_count\(12),
	datad => \gfmul_1|ALT_INV_count\(14),
	datae => \gfmul_1|ALT_INV_count[9]~DUPLICATE_q\,
	dataf => \gfmul_1|ALT_INV_count\(13),
	combout => \gfmul_1|Equal0~2_combout\);

-- Location: FF_X9_Y6_N55
\gfmul_1|count[18]\ : dffeas
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
	q => \gfmul_1|count\(18));

-- Location: FF_X9_Y6_N49
\gfmul_1|count[16]\ : dffeas
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
	q => \gfmul_1|count\(16));

-- Location: FF_X9_Y6_N58
\gfmul_1|count[19]\ : dffeas
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
	q => \gfmul_1|count\(19));

-- Location: LABCELL_X10_Y6_N48
\gfmul_1|Equal0~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~3_combout\ = ( !\gfmul_1|count\(16) & ( !\gfmul_1|count\(19) & ( (!\gfmul_1|count\(17) & (!\gfmul_1|count\(20) & (!\gfmul_1|count\(18) & !\gfmul_1|count\(28)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_count\(17),
	datab => \gfmul_1|ALT_INV_count\(20),
	datac => \gfmul_1|ALT_INV_count\(18),
	datad => \gfmul_1|ALT_INV_count\(28),
	datae => \gfmul_1|ALT_INV_count\(16),
	dataf => \gfmul_1|ALT_INV_count\(19),
	combout => \gfmul_1|Equal0~3_combout\);

-- Location: LABCELL_X10_Y6_N12
\gfmul_1|Equal0~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|Equal0~6_combout\ = ( \gfmul_1|Equal0~2_combout\ & ( \gfmul_1|Equal0~3_combout\ & ( (\gfmul_1|Equal0~1_combout\ & (\gfmul_1|Equal0~4_combout\ & (\gfmul_1|Equal0~5_combout\ & \gfmul_1|Equal0~0_combout\))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Equal0~1_combout\,
	datab => \gfmul_1|ALT_INV_Equal0~4_combout\,
	datac => \gfmul_1|ALT_INV_Equal0~5_combout\,
	datad => \gfmul_1|ALT_INV_Equal0~0_combout\,
	datae => \gfmul_1|ALT_INV_Equal0~2_combout\,
	dataf => \gfmul_1|ALT_INV_Equal0~3_combout\,
	combout => \gfmul_1|Equal0~6_combout\);

-- Location: FF_X11_Y6_N47
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

-- Location: LABCELL_X11_Y6_N36
\gfmul_1|rslt_lfsr~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt_lfsr~0_combout\ = ( \gfmul_1|rslt_lfsr\(1) & ( \operand_1[7]~input_o\ & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((\gfmul_1|Mux0~0_combout\ & !\operand_1[1]~input_o\))))) ) ) ) # ( !\gfmul_1|rslt_lfsr\(1) & ( \operand_1[7]~input_o\ & ( 
-- (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\gfmul_1|Mux0~0_combout\) # (\operand_1[1]~input_o\))))) ) ) ) # ( \gfmul_1|rslt_lfsr\(1) & ( !\operand_1[7]~input_o\ & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((\gfmul_1|Mux0~0_combout\ & 
-- \operand_1[1]~input_o\))))) ) ) ) # ( !\gfmul_1|rslt_lfsr\(1) & ( !\operand_1[7]~input_o\ & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[1]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001000100010100010001000100000100010100000100010100000101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	datac => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datad => \ALT_INV_operand_1[1]~input_o\,
	datae => \gfmul_1|ALT_INV_rslt_lfsr\(1),
	dataf => \ALT_INV_operand_1[7]~input_o\,
	combout => \gfmul_1|rslt_lfsr~0_combout\);

-- Location: FF_X11_Y6_N38
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

-- Location: LABCELL_X11_Y6_N54
\gfmul_1|rslt_lfsr~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt_lfsr~1_combout\ = ( \operand_1[2]~input_o\ & ( \gfmul_1|rslt_lfsr\(2) & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\operand_1[7]~input_o\ & \gfmul_1|Mux0~0_combout\))))) ) ) ) # ( !\operand_1[2]~input_o\ & ( \gfmul_1|rslt_lfsr\(2) & ( 
-- (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((\operand_1[7]~input_o\ & \gfmul_1|Mux0~0_combout\))))) ) ) ) # ( \operand_1[2]~input_o\ & ( !\gfmul_1|rslt_lfsr\(2) & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\gfmul_1|Mux0~0_combout\) # 
-- (\operand_1[7]~input_o\))))) ) ) ) # ( !\operand_1[2]~input_o\ & ( !\gfmul_1|rslt_lfsr\(2) & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\operand_1[7]~input_o\) # (!\gfmul_1|Mux0~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000101010100000001000101000101010100000000010101000100000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \ALT_INV_operand_1[7]~input_o\,
	datac => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datad => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	datae => \ALT_INV_operand_1[2]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(2),
	combout => \gfmul_1|rslt_lfsr~1_combout\);

-- Location: FF_X11_Y6_N56
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

-- Location: LABCELL_X11_Y6_N57
\gfmul_1|rslt_lfsr~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt_lfsr~2_combout\ = ( \operand_1[3]~input_o\ & ( \gfmul_1|rslt_lfsr\(3) & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\operand_1[7]~input_o\ & \gfmul_1|Mux0~0_combout\))))) ) ) ) # ( !\operand_1[3]~input_o\ & ( \gfmul_1|rslt_lfsr\(3) & ( 
-- (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((\operand_1[7]~input_o\ & \gfmul_1|Mux0~0_combout\))))) ) ) ) # ( \operand_1[3]~input_o\ & ( !\gfmul_1|rslt_lfsr\(3) & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\gfmul_1|Mux0~0_combout\) # 
-- (\operand_1[7]~input_o\))))) ) ) ) # ( !\operand_1[3]~input_o\ & ( !\gfmul_1|rslt_lfsr\(3) & ( (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(7) $ (((!\operand_1[7]~input_o\) # (!\gfmul_1|Mux0~0_combout\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010100010100000001010100000101010000010000010101000000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \ALT_INV_operand_1[7]~input_o\,
	datac => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	datad => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datae => \ALT_INV_operand_1[3]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(3),
	combout => \gfmul_1|rslt_lfsr~2_combout\);

-- Location: FF_X11_Y6_N58
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

-- Location: LABCELL_X11_Y6_N12
\gfmul_1|rslt[4]~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[4]~4_combout\ = ( \operand_1[4]~input_o\ & ( \gfmul_1|rslt_lfsr\(4) & ( (!\gfmul_1|Mux0~0_combout\ & \rst~input_o\) ) ) ) # ( !\operand_1[4]~input_o\ & ( \gfmul_1|rslt_lfsr\(4) & ( \rst~input_o\ ) ) ) # ( \operand_1[4]~input_o\ & ( 
-- !\gfmul_1|rslt_lfsr\(4) & ( (\gfmul_1|Mux0~0_combout\ & \rst~input_o\) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000010100001111000011110000101000001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datac => \ALT_INV_rst~input_o\,
	datae => \ALT_INV_operand_1[4]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(4),
	combout => \gfmul_1|rslt[4]~4_combout\);

-- Location: FF_X11_Y6_N13
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

-- Location: LABCELL_X11_Y6_N21
\gfmul_1|rslt[5]~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[5]~5_combout\ = ( \gfmul_1|rslt_lfsr\(5) & ( (\rst~input_o\ & ((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[5]~input_o\))) ) ) # ( !\gfmul_1|rslt_lfsr\(5) & ( (\gfmul_1|Mux0~0_combout\ & (\rst~input_o\ & \operand_1[5]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000100110011001000100011001100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datad => \ALT_INV_operand_1[5]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(5),
	combout => \gfmul_1|rslt[5]~5_combout\);

-- Location: FF_X11_Y6_N22
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

-- Location: LABCELL_X11_Y6_N18
\gfmul_1|rslt[6]~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[6]~6_combout\ = ( \gfmul_1|rslt_lfsr\(6) & ( (\rst~input_o\ & ((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[6]~input_o\))) ) ) # ( !\gfmul_1|rslt_lfsr\(6) & ( (\gfmul_1|Mux0~0_combout\ & (\rst~input_o\ & \operand_1[6]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100001111000010100000111100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datac => \ALT_INV_rst~input_o\,
	datad => \ALT_INV_operand_1[6]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(6),
	combout => \gfmul_1|rslt[6]~6_combout\);

-- Location: FF_X11_Y6_N20
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

-- Location: LABCELL_X11_Y6_N27
\gfmul_1|rslt[7]~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[7]~7_combout\ = ( \gfmul_1|rslt_lfsr\(7) & ( (\rst~input_o\ & ((!\operand_1[7]~input_o\) # (!\gfmul_1|Mux0~0_combout\))) ) ) # ( !\gfmul_1|rslt_lfsr\(7) & ( (\rst~input_o\ & (\operand_1[7]~input_o\ & \gfmul_1|Mux0~0_combout\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000101010101010001000101010101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rst~input_o\,
	datab => \ALT_INV_operand_1[7]~input_o\,
	datad => \gfmul_1|ALT_INV_Mux0~0_combout\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(7),
	combout => \gfmul_1|rslt[7]~7_combout\);

-- Location: FF_X11_Y6_N28
\gfmul_1|rslt_lfsr[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \gfmul_1|rslt[7]~7_combout\,
	clrn => \rst~input_o\,
	sclr => \gfmul_1|Equal0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gfmul_1|rslt_lfsr\(0));

-- Location: LABCELL_X11_Y6_N45
\gfmul_1|rslt[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[0]~0_combout\ = ( \gfmul_1|rslt_lfsr\(0) & ( (\rst~input_o\ & ((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[0]~input_o\))) ) ) # ( !\gfmul_1|rslt_lfsr\(0) & ( (\gfmul_1|Mux0~0_combout\ & (\operand_1[0]~input_o\ & \rst~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000101000000000000010100000000111110100000000011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datac => \ALT_INV_operand_1[0]~input_o\,
	datad => \ALT_INV_rst~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(0),
	combout => \gfmul_1|rslt[0]~0_combout\);

-- Location: LABCELL_X11_Y6_N42
\gfmul_1|rslt[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[1]~1_combout\ = ( \operand_1[1]~input_o\ & ( (\rst~input_o\ & (!\gfmul_1|Mux0~0_combout\ $ (!\gfmul_1|rslt_lfsr\(1)))) ) ) # ( !\operand_1[1]~input_o\ & ( (\rst~input_o\ & \gfmul_1|rslt_lfsr\(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000001111000000000000111100000101000010100000010100001010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datac => \ALT_INV_rst~input_o\,
	datad => \gfmul_1|ALT_INV_rslt_lfsr\(1),
	dataf => \ALT_INV_operand_1[1]~input_o\,
	combout => \gfmul_1|rslt[1]~1_combout\);

-- Location: LABCELL_X11_Y6_N48
\gfmul_1|rslt[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[2]~2_combout\ = (\rst~input_o\ & (!\gfmul_1|rslt_lfsr\(2) $ (((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000001100010010000000110001001000000011000100100000001100010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datac => \gfmul_1|ALT_INV_rslt_lfsr\(2),
	datad => \ALT_INV_operand_1[2]~input_o\,
	combout => \gfmul_1|rslt[2]~2_combout\);

-- Location: LABCELL_X11_Y6_N51
\gfmul_1|rslt[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \gfmul_1|rslt[3]~3_combout\ = ( \gfmul_1|rslt_lfsr\(3) & ( (\rst~input_o\ & ((!\gfmul_1|Mux0~0_combout\) # (!\operand_1[3]~input_o\))) ) ) # ( !\gfmul_1|rslt_lfsr\(3) & ( (\gfmul_1|Mux0~0_combout\ & (\rst~input_o\ & \operand_1[3]~input_o\)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001000000000001000100110011001000100011001100100010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \gfmul_1|ALT_INV_Mux0~0_combout\,
	datab => \ALT_INV_rst~input_o\,
	datad => \ALT_INV_operand_1[3]~input_o\,
	dataf => \gfmul_1|ALT_INV_rslt_lfsr\(3),
	combout => \gfmul_1|rslt[3]~3_combout\);

-- Location: LABCELL_X32_Y100_N0
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



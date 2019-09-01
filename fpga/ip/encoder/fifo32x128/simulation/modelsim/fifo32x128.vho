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

-- DATE "08/21/2019 15:12:42"

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

ENTITY 	fifo32x128 IS
    PORT (
	clock : IN std_logic;
	data : IN std_logic_vector(31 DOWNTO 0);
	rdreq : IN std_logic;
	wrreq : IN std_logic;
	empty : BUFFER std_logic;
	full : BUFFER std_logic;
	q : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END fifo32x128;

-- Design Ports Information
-- empty	=>  Location: PIN_AC9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- full	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[0]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[4]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[5]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[6]	=>  Location: PIN_U11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[7]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[8]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[9]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[10]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[11]	=>  Location: PIN_AD8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[12]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[13]	=>  Location: PIN_Y8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[14]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[15]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[16]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[17]	=>  Location: PIN_P10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[18]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[19]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[20]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[21]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[22]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[23]	=>  Location: PIN_AD6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[24]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[25]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[26]	=>  Location: PIN_W10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[27]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[28]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[29]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[30]	=>  Location: PIN_U10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[31]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wrreq	=>  Location: PIN_AD13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdreq	=>  Location: PIN_W13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_U12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_Y9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_V14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[8]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[9]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[10]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[11]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[12]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[13]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[14]	=>  Location: PIN_W12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[15]	=>  Location: PIN_AC15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[16]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[17]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[18]	=>  Location: PIN_AC13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[19]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[20]	=>  Location: PIN_AF6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[21]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[22]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[23]	=>  Location: PIN_W8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[24]	=>  Location: PIN_AD10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[25]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[26]	=>  Location: PIN_AA6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[27]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[28]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[29]	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[30]	=>  Location: PIN_AE6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[31]	=>  Location: PIN_V8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fifo32x128 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_data : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_rdreq : std_logic;
SIGNAL ww_wrreq : std_logic;
SIGNAL ww_empty : std_logic;
SIGNAL ww_full : std_logic;
SIGNAL ww_q : std_logic_vector(31 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(39 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputCLKENA0_outclk\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~sumout\ : std_logic;
SIGNAL \rdreq~input_o\ : std_logic;
SIGNAL \wrreq~input_o\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~sumout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~sumout\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \data[4]~input_o\ : std_logic;
SIGNAL \data[5]~input_o\ : std_logic;
SIGNAL \data[6]~input_o\ : std_logic;
SIGNAL \data[7]~input_o\ : std_logic;
SIGNAL \data[8]~input_o\ : std_logic;
SIGNAL \data[9]~input_o\ : std_logic;
SIGNAL \data[10]~input_o\ : std_logic;
SIGNAL \data[11]~input_o\ : std_logic;
SIGNAL \data[12]~input_o\ : std_logic;
SIGNAL \data[13]~input_o\ : std_logic;
SIGNAL \data[14]~input_o\ : std_logic;
SIGNAL \data[15]~input_o\ : std_logic;
SIGNAL \data[16]~input_o\ : std_logic;
SIGNAL \data[17]~input_o\ : std_logic;
SIGNAL \data[18]~input_o\ : std_logic;
SIGNAL \data[19]~input_o\ : std_logic;
SIGNAL \data[20]~input_o\ : std_logic;
SIGNAL \data[21]~input_o\ : std_logic;
SIGNAL \data[22]~input_o\ : std_logic;
SIGNAL \data[23]~input_o\ : std_logic;
SIGNAL \data[24]~input_o\ : std_logic;
SIGNAL \data[25]~input_o\ : std_logic;
SIGNAL \data[26]~input_o\ : std_logic;
SIGNAL \data[27]~input_o\ : std_logic;
SIGNAL \data[28]~input_o\ : std_logic;
SIGNAL \data[29]~input_o\ : std_logic;
SIGNAL \data[30]~input_o\ : std_logic;
SIGNAL \data[31]~input_o\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_rdreq~input_o\ : std_logic;
SIGNAL \ALT_INV_wrreq~input_o\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~1_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~0_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~0_combout\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~q\ : std_logic;
SIGNAL \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~q\ : std_logic;

BEGIN

ww_clock <= clock;
ww_data <= data;
ww_rdreq <= rdreq;
ww_wrreq <= wrreq;
empty <= ww_empty;
full <= ww_full;
q <= ww_q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & gnd & gnd & gnd & gnd & \data[31]~input_o\ & \data[30]~input_o\ & \data[29]~input_o\ & \data[28]~input_o\ & \data[27]~input_o\ & \data[26]~input_o\
& \data[25]~input_o\ & \data[24]~input_o\ & \data[23]~input_o\ & \data[22]~input_o\ & \data[21]~input_o\ & \data[20]~input_o\ & \data[19]~input_o\ & \data[18]~input_o\ & \data[17]~input_o\ & \data[16]~input_o\ & \data[15]~input_o\ & \data[14]~input_o\ & 
\data[13]~input_o\ & \data[12]~input_o\ & \data[11]~input_o\ & \data[10]~input_o\ & \data[9]~input_o\ & \data[8]~input_o\ & \data[7]~input_o\ & \data[6]~input_o\ & \data[5]~input_o\ & \data[4]~input_o\ & \data[3]~input_o\ & \data[2]~input_o\ & 
\data[1]~input_o\ & \data[0]~input_o\);

\scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\ <= (\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) & \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) & 
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) & \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) & \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) & 
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) & \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

\scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\ <= (\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) & \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) & 
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) & \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) & \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) & 
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) & \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(0) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(0);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(1) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(1);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(2) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(2);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(3) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(3);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(4) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(4);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(5) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(5);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(6) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(6);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(7) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(7);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(8) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(8);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(9) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(9);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(10) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(10);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(11) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(11);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(12) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(12);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(13) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(13);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(14) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(14);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(15) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(15);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(16) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(16);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(17) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(17);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(18) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(18);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(19) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(19);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(20) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(20);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(21) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(21);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(22) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(22);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(23) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(23);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(24) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(24);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(25) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(25);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(26) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(26);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(27) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(27);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(28) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(28);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(29) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(29);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(30) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(30);
\scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(31) <= \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\(31);
\ALT_INV_rdreq~input_o\ <= NOT \rdreq~input_o\;
\ALT_INV_wrreq~input_o\ <= NOT \wrreq~input_o\;
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(6) <= NOT \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6);
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(5) <= NOT \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5);
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(4) <= NOT \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4);
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(3) <= NOT \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3);
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(2) <= NOT \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2);
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(1) <= NOT \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1);
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(0) <= NOT \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0);
\scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(6) <= NOT \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6);
\scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(5) <= NOT \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5);
\scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(4) <= NOT \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4);
\scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(3) <= NOT \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3);
\scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(2) <= NOT \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2);
\scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(1) <= NOT \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1);
\scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(0) <= NOT \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0);
\scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\ <= NOT \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\;
\scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~1_combout\ <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\;
\scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~0_combout\ <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\;
\scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~0_combout\ <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\;
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(2) <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2);
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(3) <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3);
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(4) <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4);
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(5) <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5);
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(6) <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6);
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(0) <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0);
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(1) <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1);
\scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~q\ <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\;
\scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~q\ <= NOT \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\;

-- Location: IOOBUF_X44_Y0_N36
\empty~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~q\,
	devoe => ww_devoe,
	o => ww_empty);

-- Location: IOOBUF_X44_Y0_N53
\full~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\,
	devoe => ww_devoe,
	o => ww_full);

-- Location: IOOBUF_X42_Y0_N2
\q[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(0),
	devoe => ww_devoe,
	o => ww_q(0));

-- Location: IOOBUF_X40_Y0_N42
\q[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(1),
	devoe => ww_devoe,
	o => ww_q(1));

-- Location: IOOBUF_X48_Y0_N93
\q[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(2),
	devoe => ww_devoe,
	o => ww_q(2));

-- Location: IOOBUF_X40_Y0_N76
\q[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(3),
	devoe => ww_devoe,
	o => ww_q(3));

-- Location: IOOBUF_X14_Y0_N36
\q[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(4),
	devoe => ww_devoe,
	o => ww_q(4));

-- Location: IOOBUF_X44_Y0_N19
\q[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(5),
	devoe => ww_devoe,
	o => ww_q(5));

-- Location: IOOBUF_X52_Y0_N19
\q[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(6),
	devoe => ww_devoe,
	o => ww_q(6));

-- Location: IOOBUF_X48_Y0_N59
\q[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(7),
	devoe => ww_devoe,
	o => ww_q(7));

-- Location: IOOBUF_X12_Y0_N2
\q[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(8),
	devoe => ww_devoe,
	o => ww_q(8));

-- Location: IOOBUF_X40_Y0_N59
\q[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(9),
	devoe => ww_devoe,
	o => ww_q(9));

-- Location: IOOBUF_X14_Y0_N2
\q[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(10),
	devoe => ww_devoe,
	o => ww_q(10));

-- Location: IOOBUF_X48_Y0_N42
\q[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(11),
	devoe => ww_devoe,
	o => ww_q(11));

-- Location: IOOBUF_X40_Y0_N93
\q[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(12),
	devoe => ww_devoe,
	o => ww_q(12));

-- Location: IOOBUF_X12_Y0_N36
\q[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(13),
	devoe => ww_devoe,
	o => ww_q(13));

-- Location: IOOBUF_X14_Y0_N19
\q[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(14),
	devoe => ww_devoe,
	o => ww_q(14));

-- Location: IOOBUF_X46_Y0_N2
\q[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(15),
	devoe => ww_devoe,
	o => ww_q(15));

-- Location: IOOBUF_X12_Y0_N53
\q[16]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(16),
	devoe => ww_devoe,
	o => ww_q(16));

-- Location: IOOBUF_X50_Y0_N19
\q[17]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(17),
	devoe => ww_devoe,
	o => ww_q(17));

-- Location: IOOBUF_X10_Y0_N53
\q[18]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(18),
	devoe => ww_devoe,
	o => ww_q(18));

-- Location: IOOBUF_X12_Y0_N19
\q[19]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(19),
	devoe => ww_devoe,
	o => ww_q(19));

-- Location: IOOBUF_X50_Y0_N36
\q[20]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(20),
	devoe => ww_devoe,
	o => ww_q(20));

-- Location: IOOBUF_X42_Y0_N19
\q[21]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(21),
	devoe => ww_devoe,
	o => ww_q(21));

-- Location: IOOBUF_X46_Y0_N53
\q[22]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(22),
	devoe => ww_devoe,
	o => ww_q(22));

-- Location: IOOBUF_X14_Y0_N53
\q[23]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(23),
	devoe => ww_devoe,
	o => ww_q(23));

-- Location: IOOBUF_X42_Y0_N53
\q[24]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(24),
	devoe => ww_devoe,
	o => ww_q(24));

-- Location: IOOBUF_X46_Y0_N19
\q[25]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(25),
	devoe => ww_devoe,
	o => ww_q(25));

-- Location: IOOBUF_X46_Y0_N36
\q[26]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(26),
	devoe => ww_devoe,
	o => ww_q(26));

-- Location: IOOBUF_X44_Y0_N2
\q[27]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(27),
	devoe => ww_devoe,
	o => ww_q(27));

-- Location: IOOBUF_X50_Y0_N53
\q[28]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(28),
	devoe => ww_devoe,
	o => ww_q(28));

-- Location: IOOBUF_X48_Y0_N76
\q[29]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(29),
	devoe => ww_devoe,
	o => ww_q(29));

-- Location: IOOBUF_X52_Y0_N2
\q[30]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(30),
	devoe => ww_devoe,
	o => ww_q(30));

-- Location: IOOBUF_X42_Y0_N36
\q[31]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \scfifo_component|auto_generated|dpfifo|FIFOram|q_b\(31),
	devoe => ww_devoe,
	o => ww_q(31));

-- Location: IOIBUF_X54_Y0_N1
\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G6
\clock~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clock~input_o\,
	outclk => \clock~inputCLKENA0_outclk\);

-- Location: LABCELL_X26_Y2_N0
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0) ) + ( VCC ) + ( !VCC ))
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(0),
	cin => GND,
	sumout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\);

-- Location: IOIBUF_X67_Y0_N18
\rdreq~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdreq,
	o => \rdreq~input_o\);

-- Location: IOIBUF_X67_Y0_N35
\wrreq~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wrreq,
	o => \wrreq~input_o\);

-- Location: LABCELL_X26_Y2_N30
\scfifo_component|auto_generated|dpfifo|valid_wreq\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ = ( !\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( \wrreq~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_wrreq~input_o\,
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~q\,
	combout => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\);

-- Location: LABCELL_X26_Y2_N3
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\,
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(1),
	cin => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\);

-- Location: FF_X26_Y2_N5
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1));

-- Location: LABCELL_X26_Y2_N6
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\,
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(2),
	cin => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita1~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\);

-- Location: FF_X26_Y2_N8
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2));

-- Location: LABCELL_X26_Y2_N9
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\,
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(3),
	cin => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita2~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\);

-- Location: FF_X26_Y2_N11
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3));

-- Location: LABCELL_X26_Y2_N12
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\,
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(4),
	cin => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita3~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\);

-- Location: FF_X26_Y2_N14
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4));

-- Location: LABCELL_X26_Y2_N33
\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\ = ( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) & ( (\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1) & 
-- (\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) & \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000001010000000000000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(1),
	datac => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(2),
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(0),
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(3),
	combout => \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\);

-- Location: LABCELL_X26_Y2_N15
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\,
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(5),
	cin => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita4~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\);

-- Location: FF_X26_Y2_N17
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5));

-- Location: LABCELL_X26_Y2_N18
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) ) + ( !\scfifo_component|auto_generated|dpfifo|valid_wreq~combout\ ) + ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000011110000111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \scfifo_component|auto_generated|dpfifo|ALT_INV_valid_wreq~combout\,
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(6),
	cin => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita5~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~sumout\);

-- Location: FF_X26_Y2_N20
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita6~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6));

-- Location: LABCELL_X26_Y2_N48
\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ = ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & ( (!\rdreq~input_o\ & (\wrreq~input_o\ & 
-- (\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) & \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000100000000000000010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rdreq~input_o\,
	datab => \ALT_INV_wrreq~input_o\,
	datac => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(6),
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(5),
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~q\,
	combout => \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\);

-- Location: LABCELL_X26_Y2_N39
\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\ = ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ & ( (!\rdreq~input_o\) # 
-- ((\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) & \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\)) ) ) ) # ( !\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ & ( (\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) & \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~1_combout\) ) ) ) # ( 
-- \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( !\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~0_combout\ & ( !\rdreq~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000011111010101010101111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rdreq~input_o\,
	datac => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(4),
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~1_combout\,
	datae => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~q\,
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~0_combout\,
	combout => \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\);

-- Location: FF_X26_Y2_N41
\scfifo_component|auto_generated|dpfifo|fifo_state|b_full\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\);

-- Location: LABCELL_X26_Y2_N51
\scfifo_component|auto_generated|dpfifo|fifo_state|_~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\ = ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( (\rdreq~input_o\ & \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\) ) ) # ( 
-- !\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( !\wrreq~input_o\ $ (((!\rdreq~input_o\) # (!\scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111101011010000011110101101000000000010101010000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rdreq~input_o\,
	datac => \ALT_INV_wrreq~input_o\,
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~q\,
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~q\,
	combout => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\);

-- Location: FF_X26_Y2_N2
\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_comb_bita0~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|fifo_state|_~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0));

-- Location: LABCELL_X26_Y2_N54
\scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\ = ( !\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(4) & ( !\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(2) & ( 
-- (\rdreq~input_o\ & (!\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(3) & (!\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(6) & 
-- !\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(5)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_rdreq~input_o\,
	datab => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(3),
	datac => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(6),
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(5),
	datae => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(4),
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(2),
	combout => \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\);

-- Location: LABCELL_X26_Y2_N24
\scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\ = ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ ) ) # ( 
-- !\scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ ) ) # ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & ( 
-- !\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( (!\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(0)) # (((!\scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~0_combout\) # 
-- (\scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|counter_reg_bit\(1))) # (\wrreq~input_o\)) ) ) ) # ( !\scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ & ( !\scfifo_component|auto_generated|dpfifo|fifo_state|b_full~q\ & ( 
-- \wrreq~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011111111111011111111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(0),
	datab => \ALT_INV_wrreq~input_o\,
	datac => \scfifo_component|auto_generated|dpfifo|fifo_state|count_usedw|ALT_INV_counter_reg_bit\(1),
	datad => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~0_combout\,
	datae => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~q\,
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_full~q\,
	combout => \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\);

-- Location: FF_X26_Y2_N26
\scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\);

-- Location: LABCELL_X26_Y2_N42
\scfifo_component|auto_generated|dpfifo|valid_rreq\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\ = ( \rdreq~input_o\ & ( \scfifo_component|auto_generated|dpfifo|fifo_state|b_non_empty~q\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_rdreq~input_o\,
	dataf => \scfifo_component|auto_generated|dpfifo|fifo_state|ALT_INV_b_non_empty~q\,
	combout => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\);

-- Location: IOIBUF_X65_Y0_N92
\data[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: LABCELL_X24_Y2_N30
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0) ) + ( VCC ) + ( !VCC ))
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(0),
	cin => GND,
	sumout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\);

-- Location: FF_X24_Y2_N32
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(0));

-- Location: LABCELL_X24_Y2_N33
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(1),
	cin => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita0~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\);

-- Location: FF_X24_Y2_N34
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(1));

-- Location: LABCELL_X24_Y2_N36
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(2),
	cin => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita1~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\);

-- Location: FF_X24_Y2_N38
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(2));

-- Location: LABCELL_X24_Y2_N39
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(3),
	cin => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita2~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\);

-- Location: FF_X24_Y2_N40
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(3));

-- Location: LABCELL_X24_Y2_N42
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(4),
	cin => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita3~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\);

-- Location: FF_X24_Y2_N44
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(4));

-- Location: LABCELL_X24_Y2_N45
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ ))
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(5),
	cin => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita4~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\);

-- Location: FF_X24_Y2_N46
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(5));

-- Location: LABCELL_X24_Y2_N48
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|wr_ptr|ALT_INV_counter_reg_bit\(6),
	cin => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita5~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~sumout\);

-- Location: FF_X24_Y2_N50
\scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_comb_bita6~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|wr_ptr|counter_reg_bit\(6));

-- Location: LABCELL_X24_Y2_N0
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0) ) + ( VCC ) + ( !VCC ))
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(0),
	cin => GND,
	sumout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\);

-- Location: FF_X24_Y2_N2
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(0));

-- Location: LABCELL_X24_Y2_N3
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ 
-- ))
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(1),
	cin => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita0~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\);

-- Location: FF_X24_Y2_N4
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(1));

-- Location: LABCELL_X24_Y2_N6
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ 
-- ))
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(2),
	cin => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita1~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\);

-- Location: FF_X24_Y2_N8
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(2));

-- Location: LABCELL_X24_Y2_N9
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ 
-- ))
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(3),
	cin => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita2~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\);

-- Location: FF_X24_Y2_N11
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(3));

-- Location: LABCELL_X24_Y2_N12
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ 
-- ))
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(4),
	cin => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita3~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\);

-- Location: FF_X24_Y2_N13
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(4));

-- Location: LABCELL_X24_Y2_N15
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ 
-- ))
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ = CARRY(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(5),
	cin => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita4~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~sumout\,
	cout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\);

-- Location: FF_X24_Y2_N16
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(5));

-- Location: LABCELL_X24_Y2_N18
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6\ : cyclonev_lcell_comb
-- Equation(s):
-- \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~sumout\ = SUM(( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6) ) + ( GND ) + ( \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\ 
-- ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|ALT_INV_counter_reg_bit\(6),
	cin => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita5~COUT\,
	sumout => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~sumout\);

-- Location: FF_X24_Y2_N20
\scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputCLKENA0_outclk\,
	d => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_comb_bita6~sumout\,
	ena => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scfifo_component|auto_generated|dpfifo|rd_ptr_count|counter_reg_bit\(6));

-- Location: IOIBUF_X8_Y0_N92
\data[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: IOIBUF_X71_Y0_N1
\data[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: IOIBUF_X50_Y0_N1
\data[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(3),
	o => \data[3]~input_o\);

-- Location: IOIBUF_X67_Y0_N52
\data[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(4),
	o => \data[4]~input_o\);

-- Location: IOIBUF_X10_Y0_N1
\data[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(5),
	o => \data[5]~input_o\);

-- Location: IOIBUF_X73_Y0_N75
\data[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(6),
	o => \data[6]~input_o\);

-- Location: IOIBUF_X75_Y0_N18
\data[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(7),
	o => \data[7]~input_o\);

-- Location: IOIBUF_X69_Y0_N18
\data[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(8),
	o => \data[8]~input_o\);

-- Location: IOIBUF_X52_Y0_N35
\data[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(9),
	o => \data[9]~input_o\);

-- Location: IOIBUF_X65_Y0_N41
\data[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(10),
	o => \data[10]~input_o\);

-- Location: IOIBUF_X71_Y0_N52
\data[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(11),
	o => \data[11]~input_o\);

-- Location: IOIBUF_X69_Y0_N52
\data[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(12),
	o => \data[12]~input_o\);

-- Location: IOIBUF_X52_Y0_N52
\data[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(13),
	o => \data[13]~input_o\);

-- Location: IOIBUF_X69_Y0_N1
\data[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(14),
	o => \data[14]~input_o\);

-- Location: IOIBUF_X73_Y0_N58
\data[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(15),
	o => \data[15]~input_o\);

-- Location: IOIBUF_X65_Y0_N58
\data[16]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(16),
	o => \data[16]~input_o\);

-- Location: IOIBUF_X8_Y0_N58
\data[17]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(17),
	o => \data[17]~input_o\);

-- Location: IOIBUF_X73_Y0_N92
\data[18]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(18),
	o => \data[18]~input_o\);

-- Location: IOIBUF_X71_Y0_N35
\data[19]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(19),
	o => \data[19]~input_o\);

-- Location: IOIBUF_X54_Y0_N52
\data[20]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(20),
	o => \data[20]~input_o\);

-- Location: IOIBUF_X8_Y0_N41
\data[21]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(21),
	o => \data[21]~input_o\);

-- Location: IOIBUF_X73_Y0_N41
\data[22]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(22),
	o => \data[22]~input_o\);

-- Location: IOIBUF_X10_Y0_N18
\data[23]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(23),
	o => \data[23]~input_o\);

-- Location: IOIBUF_X69_Y0_N35
\data[24]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(24),
	o => \data[24]~input_o\);

-- Location: IOIBUF_X71_Y0_N18
\data[25]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(25),
	o => \data[25]~input_o\);

-- Location: IOIBUF_X10_Y0_N35
\data[26]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(26),
	o => \data[26]~input_o\);

-- Location: IOIBUF_X67_Y0_N1
\data[27]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(27),
	o => \data[27]~input_o\);

-- Location: IOIBUF_X65_Y0_N75
\data[28]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(28),
	o => \data[28]~input_o\);

-- Location: IOIBUF_X54_Y0_N18
\data[29]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(29),
	o => \data[29]~input_o\);

-- Location: IOIBUF_X54_Y0_N35
\data[30]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(30),
	o => \data[30]~input_o\);

-- Location: IOIBUF_X8_Y0_N75
\data[31]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(31),
	o => \data[31]~input_o\);

-- Location: M10K_X25_Y2_N0
\scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "scfifo:scfifo_component|scfifo_h491:auto_generated|a_dpfifo_oa91:dpfifo|altsyncram_0us1:FIFOram|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 7,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 40,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 127,
	port_a_logical_ram_depth => 128,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 7,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 40,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 127,
	port_b_logical_ram_depth => 128,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_no_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	portbre => VCC,
	clk0 => \clock~inputCLKENA0_outclk\,
	clk1 => \clock~inputCLKENA0_outclk\,
	ena0 => \scfifo_component|auto_generated|dpfifo|valid_wreq~combout\,
	ena1 => \scfifo_component|auto_generated|dpfifo|valid_rreq~combout\,
	portadatain => \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \scfifo_component|auto_generated|dpfifo|FIFOram|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: LABCELL_X106_Y44_N3
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



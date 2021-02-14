-- Copyright (C) 2017  Intel Corporation. All rights reserved.
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
-- VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"

-- DATE "09/17/2020 18:36:48"

-- 
-- Device: Altera EPM570F100A5 Package FBGA100
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	fa IS
    PORT (
	input1 : IN std_logic;
	input2 : IN std_logic;
	carry_in : IN std_logic;
	sum : BUFFER std_logic;
	carry_out : BUFFER std_logic
	);
END fa;

-- Design Ports Information


ARCHITECTURE structure OF fa IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_input1 : std_logic;
SIGNAL ww_input2 : std_logic;
SIGNAL ww_carry_in : std_logic;
SIGNAL ww_sum : std_logic;
SIGNAL ww_carry_out : std_logic;
SIGNAL \carry_in~combout\ : std_logic;
SIGNAL \input1~combout\ : std_logic;
SIGNAL \input2~combout\ : std_logic;
SIGNAL \sum~0_combout\ : std_logic;
SIGNAL \carry_out~0_combout\ : std_logic;

BEGIN

ww_input1 <= input1;
ww_input2 <= input2;
ww_carry_in <= carry_in;
sum <= ww_sum;
carry_out <= ww_carry_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: PIN_A3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\carry_in~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_carry_in,
	combout => \carry_in~combout\);

-- Location: PIN_C4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input1~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input1,
	combout => \input1~combout\);

-- Location: PIN_A2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\input2~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_input2,
	combout => \input2~combout\);

-- Location: LC_X5_Y7_N4
\sum~0\ : maxii_lcell
-- Equation(s):
-- \sum~0_combout\ = \carry_in~combout\ $ (((\input1~combout\ $ (\input2~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "a55a",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \carry_in~combout\,
	datac => \input1~combout\,
	datad => \input2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \sum~0_combout\);

-- Location: LC_X5_Y7_N2
\carry_out~0\ : maxii_lcell
-- Equation(s):
-- \carry_out~0_combout\ = (\carry_in~combout\ & (((\input1~combout\) # (\input2~combout\)))) # (!\carry_in~combout\ & (((\input1~combout\ & \input2~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "faa0",
	operation_mode => "normal",
	output_mode => "comb_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	dataa => \carry_in~combout\,
	datac => \input1~combout\,
	datad => \input2~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \carry_out~0_combout\);

-- Location: PIN_C3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\sum~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \sum~0_combout\,
	oe => VCC,
	padio => ww_sum);

-- Location: PIN_A4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\carry_out~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \carry_out~0_combout\,
	oe => VCC,
	padio => ww_carry_out);
END structure;



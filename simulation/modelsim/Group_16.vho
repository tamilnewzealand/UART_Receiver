-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "07/29/2016 12:28:17"

-- 
-- Device: Altera EP3C5F256C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Group_16 IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	rx : IN std_logic;
	buf : OUT std_logic_vector(7 DOWNTO 0);
	reset_N : OUT std_logic;
	reset_S : OUT std_logic;
	enable_N : OUT std_logic;
	enable_S : OUT std_logic;
	enable_shift : OUT std_logic;
	cmp15_s : IN std_logic;
	cmp7_s : IN std_logic;
	cmp7_n : IN std_logic
	);
END Group_16;

-- Design Ports Information
-- reset	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[0]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[2]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[3]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[4]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[5]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[6]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buf[7]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_N	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_S	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable_N	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable_S	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- enable_shift	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rx	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cmp7_s	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cmp15_s	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cmp7_n	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Group_16 IS
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
SIGNAL ww_reset : std_logic;
SIGNAL ww_rx : std_logic;
SIGNAL ww_buf : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_reset_N : std_logic;
SIGNAL ww_reset_S : std_logic;
SIGNAL ww_enable_N : std_logic;
SIGNAL ww_enable_S : std_logic;
SIGNAL ww_enable_shift : std_logic;
SIGNAL ww_cmp15_s : std_logic;
SIGNAL ww_cmp7_s : std_logic;
SIGNAL ww_cmp7_n : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \buf[0]~output_o\ : std_logic;
SIGNAL \buf[1]~output_o\ : std_logic;
SIGNAL \buf[2]~output_o\ : std_logic;
SIGNAL \buf[3]~output_o\ : std_logic;
SIGNAL \buf[4]~output_o\ : std_logic;
SIGNAL \buf[5]~output_o\ : std_logic;
SIGNAL \buf[6]~output_o\ : std_logic;
SIGNAL \buf[7]~output_o\ : std_logic;
SIGNAL \reset_N~output_o\ : std_logic;
SIGNAL \reset_S~output_o\ : std_logic;
SIGNAL \enable_N~output_o\ : std_logic;
SIGNAL \enable_S~output_o\ : std_logic;
SIGNAL \enable_shift~output_o\ : std_logic;
SIGNAL \cmp15_s~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \cmp7_n~input_o\ : std_logic;
SIGNAL \cmp7_s~input_o\ : std_logic;
SIGNAL \rx~input_o\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \CS.stop~feeder_combout\ : std_logic;
SIGNAL \CS.stop~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \CS.idle~feeder_combout\ : std_logic;
SIGNAL \CS.idle~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \CS.start~q\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \CS.data~q\ : std_logic;
SIGNAL \Selector7~1_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \reset_S$latch~combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_rx <= rx;
buf <= ww_buf;
reset_N <= ww_reset_N;
reset_S <= ww_reset_S;
enable_N <= ww_enable_N;
enable_S <= ww_enable_S;
enable_shift <= ww_enable_shift;
ww_cmp15_s <= cmp15_s;
ww_cmp7_s <= cmp7_s;
ww_cmp7_n <= cmp7_n;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X23_Y24_N23
\buf[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[0]~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\buf[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[1]~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\buf[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[2]~output_o\);

-- Location: IOOBUF_X32_Y0_N9
\buf[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[3]~output_o\);

-- Location: IOOBUF_X0_Y19_N23
\buf[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[4]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\buf[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[5]~output_o\);

-- Location: IOOBUF_X30_Y24_N9
\buf[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[6]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\buf[7]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \buf[7]~output_o\);

-- Location: IOOBUF_X11_Y0_N16
\reset_N~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \reset_N~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\reset_S~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reset_S$latch~combout\,
	devoe => ww_devoe,
	o => \reset_S~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\enable_N~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \enable_N~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\enable_S~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \enable_S~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\enable_shift~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \enable_shift~output_o\);

-- Location: IOIBUF_X16_Y24_N1
\cmp15_s~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cmp15_s,
	o => \cmp15_s~input_o\);

-- Location: IOIBUF_X16_Y24_N15
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X16_Y24_N22
\cmp7_n~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cmp7_n,
	o => \cmp7_n~input_o\);

-- Location: IOIBUF_X16_Y24_N8
\cmp7_s~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cmp7_s,
	o => \cmp7_s~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\rx~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rx,
	o => \rx~input_o\);

-- Location: LCCOMB_X16_Y23_N0
\Selector3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\cmp15_s~input_o\ & ((\CS.stop~q\) # ((\cmp7_n~input_o\ & \CS.data~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cmp15_s~input_o\,
	datab => \cmp7_n~input_o\,
	datac => \CS.stop~q\,
	datad => \CS.data~q\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X16_Y23_N4
\CS.stop~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \CS.stop~feeder_combout\ = \Selector3~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector3~0_combout\,
	combout => \CS.stop~feeder_combout\);

-- Location: FF_X16_Y23_N5
\CS.stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \CS.stop~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CS.stop~q\);

-- Location: LCCOMB_X16_Y23_N12
\Selector0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\cmp15_s~input_o\ & (((\CS.idle~q\)) # (!\rx~input_o\))) # (!\cmp15_s~input_o\ & (!\CS.stop~q\ & ((\CS.idle~q\) # (!\rx~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cmp15_s~input_o\,
	datab => \rx~input_o\,
	datac => \CS.stop~q\,
	datad => \CS.idle~q\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X16_Y23_N2
\CS.idle~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \CS.idle~feeder_combout\ = \Selector0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \Selector0~0_combout\,
	combout => \CS.idle~feeder_combout\);

-- Location: FF_X16_Y23_N3
\CS.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \CS.idle~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CS.idle~q\);

-- Location: LCCOMB_X16_Y23_N28
\Selector1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\cmp7_s~input_o\ & (!\rx~input_o\ & ((!\CS.idle~q\)))) # (!\cmp7_s~input_o\ & ((\CS.start~q\) # ((!\rx~input_o\ & !\CS.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cmp7_s~input_o\,
	datab => \rx~input_o\,
	datac => \CS.start~q\,
	datad => \CS.idle~q\,
	combout => \Selector1~0_combout\);

-- Location: FF_X16_Y23_N29
\CS.start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CS.start~q\);

-- Location: LCCOMB_X16_Y23_N24
\Selector7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\cmp7_s~input_o\ & \CS.start~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \cmp7_s~input_o\,
	datad => \CS.start~q\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X16_Y23_N18
\Selector2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\Selector7~0_combout\) # ((\CS.data~q\ & ((!\cmp7_n~input_o\) # (!\cmp15_s~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cmp15_s~input_o\,
	datab => \cmp7_n~input_o\,
	datac => \CS.data~q\,
	datad => \Selector7~0_combout\,
	combout => \Selector2~0_combout\);

-- Location: FF_X16_Y23_N19
\CS.data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Selector2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CS.data~q\);

-- Location: LCCOMB_X16_Y23_N14
\Selector7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector7~1_combout\ = ((\Selector7~0_combout\) # ((\cmp15_s~input_o\ & \CS.data~q\))) # (!\CS.idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cmp15_s~input_o\,
	datab => \CS.data~q\,
	datac => \CS.idle~q\,
	datad => \Selector7~0_combout\,
	combout => \Selector7~1_combout\);

-- Location: LCCOMB_X16_Y23_N16
\Selector6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\CS.idle~q\) # (!\rx~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \rx~input_o\,
	datad => \CS.idle~q\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X16_Y23_N26
\reset_S$latch\ : cycloneiii_lcell_comb
-- Equation(s):
-- \reset_S$latch~combout\ = (\Selector7~1_combout\ & ((\Selector6~0_combout\))) # (!\Selector7~1_combout\ & (\reset_S$latch~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_S$latch~combout\,
	datac => \Selector7~1_combout\,
	datad => \Selector6~0_combout\,
	combout => \reset_S$latch~combout\);

-- Location: IOIBUF_X34_Y12_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

ww_buf(0) <= \buf[0]~output_o\;

ww_buf(1) <= \buf[1]~output_o\;

ww_buf(2) <= \buf[2]~output_o\;

ww_buf(3) <= \buf[3]~output_o\;

ww_buf(4) <= \buf[4]~output_o\;

ww_buf(5) <= \buf[5]~output_o\;

ww_buf(6) <= \buf[6]~output_o\;

ww_buf(7) <= \buf[7]~output_o\;

ww_reset_N <= \reset_N~output_o\;

ww_reset_S <= \reset_S~output_o\;

ww_enable_N <= \enable_N~output_o\;

ww_enable_S <= \enable_S~output_o\;

ww_enable_shift <= \enable_shift~output_o\;
END structure;



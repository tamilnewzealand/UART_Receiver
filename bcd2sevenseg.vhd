library ieee ;
use ieee.std_logic_1164.all;

entity bcd2sevenseg is
port(
	bcd_in0:				in		std_logic_vector (3 downto 0);
	bcd_in1:				in		std_logic_vector (3 downto 0);
	bcd_in2:				in		std_logic_vector (3 downto 0);
	bcd_in3:				in		std_logic_vector (3 downto 0);
	seven_seg0:			out	std_logic_vector (6 downto 0);
	seven_seg1:			out	std_logic_vector (6 downto 0);
	seven_seg2:			out	std_logic_vector (6 downto 0);
	seven_seg3:			out	std_logic_vector (6 downto 0)
); end bcd2sevenseg;

architecture behaviour of bcd2sevenseg is
	signal seg_temp0:	std_logic_vector (6 downto 0);
	signal seg_temp1:	std_logic_vector (6 downto 0);
	signal seg_temp2:	std_logic_vector (6 downto 0);
	signal seg_temp3:	std_logic_vector (6 downto 0);
begin    
	--bin_temp <= bin_in3&bin_in2&bin_in1&bin_in0;
	with bcd_in0 select
		seg_temp0 <=
			"1000000" when "0000", --0
			"1111001" when "0001", --1
			"0100100" when "0010", --2
			"0110000" when "0011", --3
			"0011001" when "0100", --4
			"0010010" when "0101", --5
			"0000010" when "0110", --6
			"1111000" when "0111", --7
			"0000000" when "1000", --8
			"0011000" when "1001", --9
--			"0001000" when "1010", --a
--			"0000011" when "1011", --b
--			"1000110" when "1100", --c
--			"0100001" when "1101", --d
--			"0000100" when "1110", --e
--			"0001110" when "1111", --f
			"1111111" when others; -- should not happen

		with bcd_in1 select
		seg_temp1 <=
			"1000000" when "0000", --0
			"1111001" when "0001", --1
			"0100100" when "0010", --2
			"0110000" when "0011", --3
			"0011001" when "0100", --4
			"0010010" when "0101", --5
			"0000010" when "0110", --6
			"1111000" when "0111", --7
			"0000000" when "1000", --8
			"0011000" when "1001", --9
--			"0001000" when "1010", --a
--			"0000011" when "1011", --b
--			"1000110" when "1100", --c
--			"0100001" when "1101", --d
--			"0000100" when "1110", --e
--			"0001110" when "1111", --f
			"1111111" when others; -- should not happen	
	
	with bcd_in2 select
		seg_temp2 <=
			"1000000" when "0000", --0
			"1111001" when "0001", --1
			"0100100" when "0010", --2
			"0110000" when "0011", --3
			"0011001" when "0100", --4
			"0010010" when "0101", --5
			"0000010" when "0110", --6
			"1111000" when "0111", --7
			"0000000" when "1000", --8
			"0011000" when "1001", --9
--			"0001000" when "1010", --a
--			"0000011" when "1011", --b
--			"1000110" when "1100", --c
--			"0100001" when "1101", --d
--			"0000100" when "1110", --e
--			"0001110" when "1111", --f
			"1111111" when others; -- should not happen
	
	with bcd_in3 select
		seg_temp3 <=
			"1000000" when "0000", --0
			"1111001" when "0001", --1
			"0100100" when "0010", --2
			"0110000" when "0011", --3
			"0011001" when "0100", --4
			"0010010" when "0101", --5
			"0000010" when "0110", --6
			"1111000" when "0111", --7
			"0000000" when "1000", --8
			"0011000" when "1001", --9
--			"0001000" when "1010", --a
--			"0000011" when "1011", --b
--			"1000110" when "1100", --c
--			"0100001" when "1101", --d
--			"0000100" when "1110", --e
--			"0001110" when "1111", --f
			"1111111" when others; -- should not happen
	
	seven_seg0 <= seg_temp0;
	seven_seg1 <= seg_temp1;
	seven_seg2 <= seg_temp2;
	seven_seg3 <= seg_temp3;
end behaviour;	

-- ELECTENG 209 UART_ Receiver
-- Last Edit: 2016/08/12
/*
    Copyright (C) 2016 Sylvain Bechet <sbec582@aucklanduni.ac.nz>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.
        
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
        
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

-------------------------------------------------------
-----------            S Counter            -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity s_counter is
	port (
		clk, reset_S	:	in	std_logic;	--inputs
		enable_S			:	in std_logic;
		s_cnt 			:	buffer std_logic_vector(3 downto 0));	--buffer
end entity;

architecture beh of s_counter is
begin
	process (clk, reset_S)
		begin
			if rising_edge(clk) then
				if reset_S = '1' then	--reset the counter value
					s_cnt <= B"0000";
				elsif (reset_S	= '0' AND enable_S = '1') then	--increment by one
					s_cnt <= s_cnt + 1;
				end if;
			end if;
	end process;
end beh;

-------------------------------------------------------
-----------            N Counter            -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity n_counter is
	port (
		clk, reset_N	:	in	std_logic;	--inputs
		enable_N			:	in std_logic;
		n_cnt 			:	buffer std_logic_vector(3 downto 0));	--buffer
end entity;

architecture beh of n_counter is
begin
	process (clk, reset_N)
		begin
			if rising_edge(clk) then
				if reset_N = '1' then	--reset the counter value
					n_cnt <= B"0000";
				elsif (reset_N	= '0' AND enable_N = '1') then	--increment by one
					n_cnt <= n_cnt + 1;
				end if;
			end if;
	end process;
end beh;

-------------------------------------------------------
-----------         S Comparator 7          -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity s_comp_7 is
	port (
		s_cnt 			:	in std_logic_vector(3 downto 0);		--input
		cmp7_s			:	out std_logic);		--output
end entity;

architecture beh of s_comp_7 is
begin
	process (s_cnt)
		begin
			if s_cnt = B"0111" then	--cmp7_s is set whenever the input is equal to 7
				cmp7_s <= '1';
			else
				cmp7_s <= '0';
			end if;
	end process;
end beh;


-------------------------------------------------------
-----------        S Comparator 15          -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity s_comp_15 is
	port (
		s_cnt 			:	in std_logic_vector(3 downto 0);	--input
		cmp15_s			:	out std_logic);		--output
end entity;

architecture beh of s_comp_15 is
begin
	process (s_cnt)
		begin
			if s_cnt = B"1111" then	--cmp15_s is set whenever the input is equal to 15
				cmp15_s <= '1';
			else
				cmp15_s <= '0';
			end if;
	end process;
end beh;

-------------------------------------------------------
-----------         N Comparator 7          -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity n_comp_7 is
	port (
		n_cnt 			:	in std_logic_vector(3 downto 0);	--input
		cmp7_n			:	out std_logic);		--output
end entity;

architecture beh of n_comp_7 is
begin
	process (n_cnt)
		begin
			if n_cnt = B"0111" then		--cmp7_n is set whenever the input is equal to 7
				cmp7_n <= '1';
			else
				cmp7_n <= '0';
			end if;
	end process;
end beh;

-------------------------------------------------------
-----------         Shift Register          -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift_reg is
	port (
		clk, enable_shift, rx:	in std_logic;		--inputs
		buf	: buffer std_logic_vector(7 DOWNTO 0));	--buffer
end entity;

architecture beh of shift_reg is 
begin
	process (clk)
		begin
			if rising_edge(clk) then
				if enable_shift = '1' then		--if enable_shift is equal to 1, shift rx into the register
					buf(7 DOWNTO 0) <= rx & buf(7 DOWNTO 1);
				end if;
			end if;
	end process;
end beh;

-------------------------------------------------------
-----------             BCD2SSD             -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD2SSD is
port(
	clk : in std_logic;		--inputs
	bcd : in std_logic_vector(7 downto 0);
	segment7 : out std_logic_vector(6 downto 0);		--outputs
	decptn	:	out std_logic;
	digit : out std_logic_vector(3 downto 0));
end BCD2SSD;

architecture beh of BCD2SSD is
	signal SEG : std_logic_vector(1 downto 0);
	signal DIS : std_logic_vector(3 downto 0);
begin
	process (clk,bcd)
		begin
			SEG(1 downto 0) <= bcd(6 downto 5);
			DIS(3 downto 0) <= bcd(3 downto 0);
			if rising_edge(clk) then
				decptn <= bcd(4);
				case SEG is
					when "00"=> digit <="0001";	--number will be displayed on first SSD (rightmost one)
					when "01"=> digit <="0010";	--number will be displayed on second SSD (middle right one)
					when "10"=> digit <="0100";	--number will be displayed on third SSD (middle leftrightmost one)
					when "11"=> digit <="1000";	--number will be displayed on fourth SSD (leftmost one)
					when others=> digit <="0000";
				end case;
				case DIS is
					when "0000"=> segment7 <="0111111";	--displays 0
					when "0001"=> segment7 <="0000110";	--displays 1
					when "0010"=> segment7 <="1011011";	--displays 2
					when "0011"=> segment7 <="1001111";	--displays 3
					when "0100"=> segment7 <="1100110";	--displays 4
					when "0101"=> segment7 <="1101101";	--displays 5
					when "0110"=> segment7 <="1111101";	--displays 6
					when "0111"=> segment7 <="0000111";	--displays 7
					when "1000"=> segment7 <="1111111";	--displays 8
					when "1001"=> segment7 <="1101111";	--displays 9
					when "1010"=> segment7 <="1110111";	--displays A
					when "1011"=> segment7 <="0111110";	--displays V (technically U)
					when "1100"=> segment7 <="1110011";	--displays P
					when "1101"=> segment7 <="1011110";	--unused
					when "1110"=> segment7 <="1111011";	--unused
					when "1111"=> segment7 <="1110001";	--unused
					when others=> segment7 <="0000000";
				end case;
			end if;
	end process;
end beh;

-------------------------------------------------------
-----------            Register             -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_register is
port(
	parallel_in : in std_logic_vector(7 downto 0);	--inputs
	load, clk : in std_logic;
	parallel_out: out std_logic_vector(7 downto 0)	--output
); end parallel_register;

architecture beh of parallel_register is 

begin
	process (clk)
	begin
		if rising_edge(clk) then
			if load = '1' then	--if load is equal to 1, load the parallel_in value to the parallel_out value
				parallel_out <= parallel_in;
			end if;	
		end if;
	end process;
end beh;	

-------------------------------------------------------
-----------               FSM               -----------
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port (
		clk			:	in	std_logic;	--inputs
		rx				:	in std_logic;
		reset_N, reset_S, enable_N, enable_S, enable_shift, load : out std_logic;	--outputs
		cmp15_s, cmp7_s, cmp7_n : in std_logic);
end entity;

--Define architecture here 

architecture beh of fsm is

	type my_states is (idle, start, data, stop,finish);
	signal CS, NS : my_states:= idle;

begin

	----------------------------
	--VHDL code for FSM
	----------------------------

	--state registers
	Synchronous_process: process (clk)
		begin
			if rising_edge(clk) then	--update the next state to the current state on every rising clock edge
				CS <= NS;
			end if;
	end process;
			
	------------------------------------

	NextState_logic: process (CS, rx, cmp15_s, cmp7_n, cmp7_s)
		begin
			case CS is
			
				--idle state
				when idle =>
					if rx = '0' then	--if Rx is 0
						NS <= start;	--transition to start state
					else
						NS <= idle;		--otherwise remain in idle state
					end if;
				
				--start state
				when start =>
					if (cmp7_s = '1' AND rx = '0') then	--if cmp7_s is 1 and rx is 0
						NS <= data;		--transition to data state
					elsif cmp15_s = '1' then				--otherwise, if cmp15_s is 1
						NS <= idle;		--transition to idle state
					else
						NS <= start;	--otherwise remain in start state
					end if;
				
				--data state
				when data =>
					if (cmp15_s = '1' AND cmp7_n = '1') then --if both cmp15_s and cmp7_n are 1
						NS <= stop;		--transition to stop state
					else
						NS <= data;		--otherwise remain in data state
					end if;
				
				--stop state
				when stop =>
					if cmp15_s = '0' then	--if cmp15_s is 0
						NS <= stop;		--remain in stop state
					else
						NS <= finish;	--otherwise transition to finish state
					end if;
					
				--finish state
				when finish =>
					if cmp7_s = '1' then	--if cmp7_s is 1
						NS <= idle;		--transition to idle state
					else
						NS <= finish;	--otherwise remain in finish state
					end if;
			end case;
	end process;

	-----------------------------------------

	Output_logic: process (CS, rx, cmp15_s, cmp7_n, cmp7_s)
		begin
		enable_shift <= '0';
		reset_S <= '0';
		reset_N <= '0';
		enable_N <= '0';
		enable_S <= '0';
		load <= '0';
			case CS is
			
				--idle case
				when idle =>
					if rx = '0' then	--if rx is 0, S is reset
						reset_S <= '1';
					else
						reset_S <= '0';
					end if;
					
				--start case
				when start =>
					if cmp7_s = '1' then	--if cmp7_s is 1, S and N are reset
						reset_S <= '1';
						reset_N <= '1';
					elsif (cmp15_s = '1') then --otherwise, if cmp15_s is 1, S is reset
						reset_S <= '1';
					else	--otherwise S is enabled
						enable_S <= '1';
					end if;
					
				--data case
				when data =>
					if (cmp7_n = '1' AND cmp15_s = '1') then	--if cmp7_n is 1 and cmp15_s is 1, S is reset and the values are shifted
						reset_S <= '1';
						enable_shift <= '1';
					elsif (cmp7_n = '0' AND cmp15_s = '1') then	--otherwise, if cmp7_n is 0 and cmp15_s is 1, S is reset, N is enabled and the values are shifted
						enable_shift <= '1';
						reset_S <= '1';
						enable_N <= '1';
					else	--otherwise S is enabled
						enable_S <= '1';
					end if;
					
				--stop case
				when stop =>
					if cmp15_s = '0' then	--if cmp15_s is 0, S is enabled
						enable_S <= '1';
					else
						enable_S <= '0';
					end if;
					
				--finish case
				when finish =>
					if cmp7_s = '1' then	--if cmp7_s is 1, the value is loaded
						load <= '1';
					else	--otherwise, S is enabled
						enable_S <= '1';
					end if;
			end case;
	end process;
end beh;
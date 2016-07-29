-- ELECTENG 209 UART_ Receiver
-- Last Edit: 2016/07/29

-------------------------------------------------------
-----------            S Counter            -----------
-------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity s_counter is
	port (
		clk, reset_S	:	in	std_logic;
		enable_S			:	in std_logic;
		s_cnt 			:	buffer std_logic_vector(3 downto 0));
end entity;

architecture beh of s_counter is
begin
	process (clk, reset_S)
		begin
			if rising_edge(clk) then
				if reset_S = '1' then
					s_cnt <= B"0000";
				elsif (reset_S	= '0' AND enable_S = '1') then
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
		clk, reset_N	:	in	std_logic;
		enable_N			:	in std_logic;
		n_cnt 			:	buffer std_logic_vector(3 downto 0));
end entity;

architecture beh of n_counter is
begin
	process (clk, reset_N)
		begin
			if rising_edge(clk) then
				if reset_N = '1' then
					n_cnt <= B"0000";
				elsif (reset_N	= '0' AND enable_N = '1') then
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
		s_cnt 			:	in std_logic_vector(3 downto 0);
		cmp7_s			:	out std_logic);		
end entity;

architecture beh of s_comp_7 is
begin
	process (s_cnt)
		begin
			if s_cnt = B"0111" then
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
		s_cnt 			:	in std_logic_vector(3 downto 0);
		cmp15_s			:	out std_logic);		
end entity;

architecture beh of s_comp_15 is
begin
	process (s_cnt)
		begin
			if s_cnt = B"1111" then
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
		n_cnt 			:	in std_logic_vector(3 downto 0);
		cmp7_n			:	out std_logic);		
end entity;

architecture beh of n_comp_7 is
begin
	process (n_cnt)
		begin
			if n_cnt = B"0111" then
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
		clk, enable_shift, rx:	in std_logic;
		buf	: buffer std_logic_vector(7 DOWNTO 0));	
end entity;

architecture beh of shift_reg is 
begin
	process (clk)
		begin
			if rising_edge(clk) then
				if enable_shift = '1' then
					buf <= rx & buf(6 DOWNTO 0);
				end if;
			end if;
	end process;
end beh;


-------------------------------------------------------
-----------               FSM               -----------
-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity Group_16 is
	port (
		clk, reset	:	in	std_logic;
		rx				:	in std_logic;
		buf			:	out std_logic_vector(7 DOWNTO 0);
		reset_N, reset_S, enable_N, enable_S, enable_shift : out std_logic;
		cmp15_s, cmp7_s, cmp7_n : in std_logic);
end entity;

--Define architecture here 

architecture beh of Group_16 is

	type my_states is (idle, start, data, stop);
	signal CS, NS : my_states:= idle;

begin

	----------------------------
	--VHDL code for FSM
	----------------------------

	--state registers
	Synchronous_process: process (reset, clk)
		begin
			if rising_edge(clk) then
				CS <= NS;
			end if;
	end process;
			
	------------------------------------

	NextState_logic: process (CS, NS)
		begin
			case CS is
				when idle =>
					if rx = '0' then
						NS <= start;
					else
						NS <= idle;
					end if;
				when start =>
					if cmp7_s = '1' then
						NS <= data;
					else
						NS <= start;
					end if;
				when data =>
					if (cmp15_s = '1' AND cmp7_n = '1') then
						NS <= stop;
					else
						NS <= data;
					end if;
				when stop =>
					if cmp15_s = '0' then
						NS <= idle;
					else
						NS <= stop;
					end if;
			end case;
	end process;

	-----------------------------------------

	Output_logic: process (CS)
		begin
			case CS is
				when idle =>
					if rx = '0' then
						reset_S <= '1';
					else
						reset_S <= '0';
					end if;
				when start =>
					if cmp7_s = '1' then
						reset_S <= '1';
						reset_N <= '1';
					else
						enable_S <= '1';
					end if;
				when data =>
					if (cmp7_n = '1' AND cmp15_s = '1') then
						reset_S <= '1';
						enable_shift <= '1';
					elsif (cmp7_n = '0' AND cmp15_s = '1') then
						enable_S <= '1';
						reset_S <= '1';
						enable_N <= '1';
					else
						enable_S <= '1';
					end if;
				when stop =>
					if cmp15_s = '0' then
						enable_S <= '1';
					end if;
			end case;
	end process;
end beh;
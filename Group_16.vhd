--Declare libraries here
--Define entity here
-- write other comments here such as last update

entity group01 is
	port ( …          
	);
end entity;

--Define architecture here 

architecture mix of group01 is

	type my_states are (idle, …)
	signal CS, NS : my_states:= idle;

begin

	----------------------------
	--VHDL code for FSM
	----------------------------

	--state registers
	Synchronous_process: process (reset, clk)
		begin
			if clk’event and clk = ‘1’ then
				CS <= NS;
			end process;
			
	------------------------------------

	NextState_logic: process (CS, …)
		begin
			case CS is
				when idle =>
					if rx = ‘0’ then
						NS <= start;
					else
						NS <= idle;
					end if;
				when start =>
			end case;
		end process;

	-----------------------------------------

	Output_logic: process (CS, … sensitivity list: write signals input to process)
		begin
			case CS is
				when idle =>
					if rx = ‘0’ then
						reset_S <= ‘1’;
					else
						reset_S <= ‘0’;
					end if;
				when start =>
			end case;
		end process; 

	----------------------------
	--VHDL code for datapath
	----------------------------

	Scounter_process:process(clk,sensitivity list: write signals input to process)
		begin
		--Get help from cs201 lab, EE209 lectures, text books, google,
		end process;

	Bcounter_process: process (sensitivity list: write signals input to process)
		begin
		--Get help from cs201 lab, EE209 lectures, text books, google 
		end process;

	-----------------

	cmp7_process: process(sensitivity list: write signals input to process)
		begin
			if S = “0111” then
				cmp7 <= ‘1’;
			else
				cmp7 <= ‘0’;
			end if;
		end process;

	--OR

	cmp7 <= ‘1’ when S = “0111” else ‘0’;

	------------------

	ShiftRegister_process: process( … )
		begin
			if clk’event and clk = ‘1’ then        …
		end process;

	-----------------

	//any other code for future
	7segment_decoder:process(sensitivity list: write signals input to process)
		begin
		--Get help from cs201 lab, EE209 lectures, text books, google
		end process;
		
	multiplex_7seg: process( )
		begin
		end process;

end architecture; 
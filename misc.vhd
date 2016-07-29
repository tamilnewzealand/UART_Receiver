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

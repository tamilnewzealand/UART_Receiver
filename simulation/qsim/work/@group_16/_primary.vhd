library verilog;
use verilog.vl_types.all;
entity Group_16 is
    port(
        decptn          : out    vl_logic;
        clk             : in     vl_logic;
        rx              : in     vl_logic;
        digit           : out    vl_logic_vector(3 downto 0);
        segment         : out    vl_logic_vector(6 downto 0)
    );
end Group_16;

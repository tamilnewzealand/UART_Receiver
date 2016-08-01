library verilog;
use verilog.vl_types.all;
entity Group_16 is
    port(
        buf             : out    vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rx              : in     vl_logic
    );
end Group_16;

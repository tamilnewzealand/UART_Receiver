library verilog;
use verilog.vl_types.all;
entity Group_16 is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rx              : in     vl_logic;
        buf             : out    vl_logic_vector(7 downto 0);
        reset_N         : out    vl_logic;
        reset_S         : out    vl_logic;
        enable_N        : out    vl_logic;
        enable_S        : out    vl_logic;
        enable_shift    : out    vl_logic;
        cmp15_s         : in     vl_logic;
        cmp7_s          : in     vl_logic;
        cmp7_n          : in     vl_logic
    );
end Group_16;

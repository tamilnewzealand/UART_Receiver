library verilog;
use verilog.vl_types.all;
entity Group_16_vlg_check_tst is
    port(
        decptn          : in     vl_logic;
        digit           : in     vl_logic_vector(3 downto 0);
        segment         : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Group_16_vlg_check_tst;

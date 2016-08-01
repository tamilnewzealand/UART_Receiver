library verilog;
use verilog.vl_types.all;
entity Group_16_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        rx              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Group_16_vlg_sample_tst;

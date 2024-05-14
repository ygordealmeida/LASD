library verilog;
use verilog.vl_types.all;
entity mux2x1_vlg_sample_tst is
    port(
        i0              : in     vl_logic_vector(7 downto 0);
        i1              : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mux2x1_vlg_sample_tst;

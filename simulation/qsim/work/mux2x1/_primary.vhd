library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        i0              : in     vl_logic_vector(7 downto 0);
        i1              : in     vl_logic_vector(7 downto 0);
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end mux2x1;

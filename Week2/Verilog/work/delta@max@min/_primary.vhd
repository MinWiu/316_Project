library verilog;
use verilog.vl_types.all;
entity deltaMaxMin is
    port(
        delta           : out    vl_logic_vector(7 downto 0);
        max             : in     vl_logic_vector(7 downto 0);
        min             : in     vl_logic_vector(7 downto 0)
    );
end deltaMaxMin;

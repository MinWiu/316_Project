library verilog;
use verilog.vl_types.all;
entity valueV is
    port(
        V               : out    vl_logic_vector(6 downto 0);
        max             : in     vl_logic_vector(7 downto 0)
    );
end valueV;

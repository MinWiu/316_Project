library verilog;
use verilog.vl_types.all;
entity minValue is
    port(
        minValue        : out    vl_logic_vector(7 downto 0);
        R               : in     vl_logic_vector(7 downto 0);
        G               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0)
    );
end minValue;

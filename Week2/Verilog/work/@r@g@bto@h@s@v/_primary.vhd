library verilog;
use verilog.vl_types.all;
entity RGBtoHSV is
    port(
        R               : in     vl_logic_vector(7 downto 0);
        G               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        H               : out    vl_logic_vector(8 downto 0);
        S               : out    vl_logic_vector(6 downto 0);
        V               : out    vl_logic_vector(6 downto 0);
        temp            : out    vl_logic_vector(13 downto 0);
        maxLocation     : out    vl_logic_vector(1 downto 0)
    );
end RGBtoHSV;

library verilog;
use verilog.vl_types.all;
entity valueH is
    port(
        H               : out    vl_logic_vector(8 downto 0);
        R               : in     vl_logic_vector(7 downto 0);
        G               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        delta           : in     vl_logic_vector(7 downto 0);
        max             : in     vl_logic_vector(7 downto 0);
        locationMax     : in     vl_logic_vector(1 downto 0);
        temp            : out    vl_logic_vector(13 downto 0)
    );
end valueH;

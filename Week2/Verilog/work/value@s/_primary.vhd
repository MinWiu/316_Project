library verilog;
use verilog.vl_types.all;
entity valueS is
    port(
        S               : out    vl_logic_vector(6 downto 0);
        delta           : in     vl_logic_vector(7 downto 0);
        max             : in     vl_logic_vector(7 downto 0)
    );
end valueS;

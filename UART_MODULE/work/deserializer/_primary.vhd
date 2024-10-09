library verilog;
use verilog.vl_types.all;
entity deserializer is
    generic(
        ZEROS           : vl_logic_vector(0 to 7) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        deser_en        : in     vl_logic;
        sampled_bit     : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        P_DATA          : out    vl_logic_vector(7 downto 0);
        bit_cnt         : in     vl_logic_vector(3 downto 0);
        PAR_EN          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ZEROS : constant is 1;
end deserializer;

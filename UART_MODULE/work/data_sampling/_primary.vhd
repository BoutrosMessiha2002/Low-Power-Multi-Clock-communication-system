library verilog;
use verilog.vl_types.all;
entity data_sampling is
    generic(
        ZERO            : vl_logic := Hi0;
        ZEROS           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        ONE             : vl_logic := Hi1
    );
    port(
        dat_samp_en     : in     vl_logic;
        edge_cnt        : in     vl_logic_vector(5 downto 0);
        RX_IN           : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        prescale        : in     vl_logic_vector(5 downto 0);
        sampled_bit     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ZERO : constant is 1;
    attribute mti_svvh_generic_type of ZEROS : constant is 1;
    attribute mti_svvh_generic_type of ONE : constant is 1;
end data_sampling;

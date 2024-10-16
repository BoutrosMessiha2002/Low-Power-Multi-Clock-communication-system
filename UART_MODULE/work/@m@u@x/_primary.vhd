library verilog;
use verilog.vl_types.all;
entity MUX is
    generic(
        start_bit       : vl_logic := Hi0;
        stop_bit        : vl_logic := Hi1
    );
    port(
        mux_sel         : in     vl_logic_vector(1 downto 0);
        ser_data        : in     vl_logic;
        par_bit         : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        TX_OUT          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of start_bit : constant is 1;
    attribute mti_svvh_generic_type of stop_bit : constant is 1;
end MUX;

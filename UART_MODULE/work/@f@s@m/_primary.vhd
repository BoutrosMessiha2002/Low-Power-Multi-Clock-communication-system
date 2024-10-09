library verilog;
use verilog.vl_types.all;
entity FSM is
    generic(
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        START           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        SERIAL          : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        STOP            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        PARITY          : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0)
    );
    port(
        ser_done        : in     vl_logic;
        PAR_EN          : in     vl_logic;
        Data_Valid      : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        ser_en          : out    vl_logic;
        busy            : out    vl_logic;
        mux_sel         : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of START : constant is 1;
    attribute mti_svvh_generic_type of SERIAL : constant is 1;
    attribute mti_svvh_generic_type of STOP : constant is 1;
    attribute mti_svvh_generic_type of PARITY : constant is 1;
end FSM;

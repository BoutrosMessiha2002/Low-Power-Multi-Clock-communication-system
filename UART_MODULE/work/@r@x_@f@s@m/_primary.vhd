library verilog;
use verilog.vl_types.all;
entity RX_FSM is
    generic(
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        START           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        DATA            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        PARITY          : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        STOP            : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        VALID           : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        \ON\            : vl_logic := Hi1;
        CORRECT         : vl_logic := Hi1;
        INCORRECT       : vl_logic := Hi0;
        OFF             : vl_logic := Hi0
    );
    port(
        RX_IN           : in     vl_logic;
        PAR_EN          : in     vl_logic;
        edge_cnt        : in     vl_logic_vector(5 downto 0);
        bit_cnt         : in     vl_logic_vector(3 downto 0);
        par_err         : in     vl_logic;
        strt_glitch     : in     vl_logic;
        stp_err         : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        prescale        : in     vl_logic_vector(5 downto 0);
        dat_samp_en     : out    vl_logic;
        enable          : out    vl_logic;
        par_chk_en      : out    vl_logic;
        strt_chk_en     : out    vl_logic;
        stp_chk_en      : out    vl_logic;
        deser_en        : out    vl_logic;
        data_valid      : out    vl_logic;
        from_parity     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of START : constant is 1;
    attribute mti_svvh_generic_type of DATA : constant is 1;
    attribute mti_svvh_generic_type of PARITY : constant is 1;
    attribute mti_svvh_generic_type of STOP : constant is 1;
    attribute mti_svvh_generic_type of VALID : constant is 1;
    attribute mti_svvh_generic_type of \ON\ : constant is 1;
    attribute mti_svvh_generic_type of CORRECT : constant is 1;
    attribute mti_svvh_generic_type of INCORRECT : constant is 1;
    attribute mti_svvh_generic_type of OFF : constant is 1;
end RX_FSM;

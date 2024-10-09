library verilog;
use verilog.vl_types.all;
entity parity_check is
    generic(
        EVEN            : vl_logic := Hi0;
        ODD             : vl_logic := Hi1
    );
    port(
        par_chk_en      : in     vl_logic;
        sampled_bit     : in     vl_logic;
        PAR_TYP         : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        P_DATA          : in     vl_logic_vector(7 downto 0);
        par_err         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of EVEN : constant is 1;
    attribute mti_svvh_generic_type of ODD : constant is 1;
end parity_check;

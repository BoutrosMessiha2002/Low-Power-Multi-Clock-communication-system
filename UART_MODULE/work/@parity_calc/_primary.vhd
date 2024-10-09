library verilog;
use verilog.vl_types.all;
entity Parity_calc is
    port(
        P_DATA          : in     vl_logic_vector(7 downto 0);
        Data_Valid      : in     vl_logic;
        PAR_TYP         : in     vl_logic;
        PAR_EN          : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        par_bit         : out    vl_logic;
        busy            : in     vl_logic
    );
end Parity_calc;

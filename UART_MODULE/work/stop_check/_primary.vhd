library verilog;
use verilog.vl_types.all;
entity stop_check is
    port(
        stp_chk_en      : in     vl_logic;
        sampled_bit     : in     vl_logic;
        stp_err         : out    vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic
    );
end stop_check;

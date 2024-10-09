library verilog;
use verilog.vl_types.all;
entity UART_tb is
    generic(
        CLK_FOR_TX      : integer := 80;
        CLK_FOR_RX      : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_FOR_TX : constant is 1;
    attribute mti_svvh_generic_type of CLK_FOR_RX : constant is 1;
end UART_tb;

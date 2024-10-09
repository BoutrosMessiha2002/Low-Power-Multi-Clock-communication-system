library verilog;
use verilog.vl_types.all;
entity UART_RX_top is
    port(
        RX_IN           : in     vl_logic;
        PAR_EN          : in     vl_logic;
        PAR_TYP         : in     vl_logic;
        prescale        : in     vl_logic_vector(5 downto 0);
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        data_valid      : out    vl_logic;
        P_DATA          : out    vl_logic_vector(7 downto 0)
    );
end UART_RX_top;

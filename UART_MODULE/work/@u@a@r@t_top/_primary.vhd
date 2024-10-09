library verilog;
use verilog.vl_types.all;
entity UART_top is
    port(
        TX_CLK          : in     vl_logic;
        TX_IN_P         : in     vl_logic_vector(7 downto 0);
        TX_IN_V         : in     vl_logic;
        RST             : in     vl_logic;
        RX_IN_S         : in     vl_logic;
        prescale        : in     vl_logic_vector(5 downto 0);
        RX_CLK          : in     vl_logic;
        TX_OUT_S        : out    vl_logic;
        TX_OUT_V        : out    vl_logic;
        RX_OUT_P        : out    vl_logic_vector(7 downto 0);
        RX_OUT_V        : out    vl_logic
    );
end UART_top;

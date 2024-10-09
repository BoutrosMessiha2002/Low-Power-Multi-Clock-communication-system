library verilog;
use verilog.vl_types.all;
entity edge_bit_counter is
    port(
        enable          : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        bit_cnt         : out    vl_logic_vector(3 downto 0);
        edge_cnt        : out    vl_logic_vector(5 downto 0);
        prescale        : in     vl_logic_vector(5 downto 0);
        PAR_EN          : in     vl_logic;
        from_parity     : in     vl_logic
    );
end edge_bit_counter;
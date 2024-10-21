
module SYS_TOP #(parameter OPER_WIDTH=8,
parameter OUT_WIDTH=OPER_WIDTH*2,
parameter WIDTH=8,
parameter ADDR=4,
parameter BUS_WIDTH=8)
(
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
input  wire                        scan_clk,
input  wire                        SI,
input  wire                        SE,
output wire                        SO,
input  wire                        scan_rst,
input  wire                        test_mode,
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error
);


//SYS_CTRL
  wire [15:0] ALU_OUT;
  wire OUT_Valid;
  wire FIFO_FULL;
  wire [3:0] ALU_FUN;
  wire ALU_EN;
  wire CLK_EN;
  wire [3:0] Address;
  wire WrEn;
  wire RdEn;
  wire [7:0] WrData;
  wire [7:0] RdData;
  wire RdData_Valid;
  wire [7:0] RX_P_DATA;
  wire RX_D_VLD;
  wire [7:0] TX_P_DATA;
  wire TX_D_VLD;
  wire clk_div_en;
  wire [7:0] P_DATA_RX_SYNC; 
  wire sync_reset_ref;
  wire sync_reset_uart;
  wire OP_A;
  wire OP_B;
  wire ALU_CLK;
  wire busy;
  wire RD_INC;
  wire F_EMPTY;
  wire [7:0] RD_DATA_FIFO;
  wire TX_CLK;
  wire RX_CLK;
  wire [5:0] prescale;
  wire [7:0] div_ratio;
  wire [7:0] UART_config;
  wire [7:0] REG0;
  wire [7:0] REG1;
  wire [7:0] REG2;
  wire [7:0] REG3;
  wire [7:0] ratio_rx;
  wire data_valid;
  wire CLK_REF_M;
  wire CLK_ALU_M;
  wire CLK_UART_M;
  wire CLK_UART_TX_M;
  wire CLK_UART_RX_M;
  wire RST_UART_M;
  wire RST_REF_M;
  wire RST_M;

mux2X1 U0_mux2X1 (
.IN_0(REF_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(CLK_REF_M)
); 

mux2X1 U1_mux2X1 (
.IN_0(UART_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(CLK_UART_M)
); 

mux2X1 U2_mux2X1 (
.IN_0(TX_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(CLK_UART_TX_M)
); 

mux2X1 U3_mux2X1 (
.IN_0(RX_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(CLK_UART_RX_M)
); 

mux2X1 U4_mux2X1 (
.IN_0(ALU_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(CLK_ALU_M)
); 



// Muxing resets
mux2X1 U5_mux2X1 (
.IN_0(sync_reset_ref),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(RST_REF_M)
); 

mux2X1 U6_mux2X1 (
.IN_0(sync_reset_uart),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(RST_UART_M)
); 

mux2X1 U7_mux2X1 (
.IN_0(RST_N),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(RST_M)
); 



///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///

Reset_sync RST_SYNC_1(
.CLK(CLK_REF_M),
.RST(RST_M),
.sync_reset(sync_reset_ref)
);

Reset_sync RST_SYNC_2(
.CLK(CLK_UART_M),
.RST(RST_M),
.sync_reset(sync_reset_uart)
);

///********************************************************///
///////////////////// Data Synchronizers /////////////////////
///********************************************************///
 Data_Sync #(.BUS_WIDTH(BUS_WIDTH))
 
  U0_DATA_SYNC(
 .CLK(CLK_REF_M),
 .unsync_bus(RX_P_DATA),
 .bus_enable(data_valid),
 .sync_bus(P_DATA_RX_SYNC),
 .enable_pulse(RX_D_VLD),
 .RST(RST_REF_M)
 );


///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///
 
 FIFO_top FIFO(
 .wdata(TX_P_DATA),
   .winc(TX_D_VLD),
  .wclk(CLK_REF_M),
   .wrst_n(RST_REF_M),
   .rclk(CLK_UART_TX_M),
   .rrst_n(RST_UART_M),
   .rinc(RD_INC),
   .rdata(RD_DATA_FIFO),
   .rempty(F_EMPTY),
   .wfull(FIFO_FULL));


///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///
PULSE_GEN U0_PULSE_GEN(
.clk(CLK_UART_TX_M),
.rst(RST_UART_M),
.lvl_sig(busy),
.pulse_sig(RD_INC)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///

 ClkDiv U0_CLK_DIV_TX(
   .i_ref_clk(CLK_UART_M),
   .i_rst(RST_UART_M),
   .i_clk_en(1'b1),
   .i_div_ratio(REG3),
   .o_div_clk(TX_CLK));

///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///
CLKDIV_MUX #(.WIDTH(WIDTH))

U0_CLKDIV_MUX (
.IN(REG2[7:2]),
.OUT(ratio_rx)
);

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///
ClkDiv U0_CLK_DIV_RX(
   .i_ref_clk(CLK_UART_M),
   .i_rst(RST_UART_M),
   .i_clk_en(1'b1),
   .i_div_ratio(ratio_rx),
   .o_div_clk(RX_CLK));


///********************************************************///
/////////////////////////// UART_TX /////////////////////////////
///********************************************************///

UART_TX_top U0_TX(
 .P_DATA(RD_DATA_FIFO),
 .PAR_EN(REG2[0]),
 .Data_Valid(!F_EMPTY),
 .PAR_TYP(REG2[1]),
 .CLK(CLK_UART_TX_M),
 .RST(RST_UART_M),
 .TX_OUT(UART_TX_O),
 .busy(busy)
);

///********************************************************///
/////////////////////////// UART_RX /////////////////////////////
///********************************************************///
UART_RX_top U0_RX(
   .RX_IN(UART_RX_IN),
   .PAR_EN(REG2[0]),
   .PAR_TYP(REG2[1]),
   .prescale(REG2[7:2]),
   .CLK(CLK_UART_RX_M),
   .RST(RST_UART_M),
   .data_valid(data_valid),
   .P_DATA(RX_P_DATA)
);

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///
 sys_ctrl U0_SYS_CTRL(
   .CLK(CLK_REF_M),
   .RST(RST_REF_M),
   .ALU_OUT(ALU_OUT),
   .OUT_Valid(OUT_Valid),
   .FIFO_FULL(FIFO_FULL),
   .ALU_FUN(ALU_FUN),
   .ALU_EN(ALU_EN),
   .CLK_EN(CLK_EN),
   .Address(Address),
   .WrEn(WrEn),
   .RdEn(RdEn),
   .WrData(WrData),
   .RdData(RdData),
   .RdData_Valid(RdData_Valid),
   .RX_P_DATA(P_DATA_RX_SYNC),
   .RX_D_VLD(RX_D_VLD),
   .TX_P_DATA(TX_P_DATA),
   .TX_D_VLD(TX_D_VLD),
   .clk_div_en(clk_div_en));


///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///
 RegFile #(.WIDTH(WIDTH),
 .ADDR(ADDR))
 
 
 U0_REG_FILE
(
  .CLK(CLK_REF_M),
  .RST(RST_REF_M),
 .WrEn(WrEn),
 .RdEn(RdEn),
 .Address(Address),
 .WrData(WrData),
  .RdData(RdData),
  .RdData_VLD(RdData_Valid),
  .REG0(REG0),
  .REG1(REG1),
 .REG2(REG2),
  .REG3(REG3)
);


///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 ALU #(.OPER_WIDTH(OPER_WIDTH),
 .OUT_WIDTH(OUT_WIDTH))
  
 
 U0_ALU(
   .A(REG0), 
   .B(REG1),
   .EN(ALU_EN),
   .ALU_FUN(ALU_FUN),
   .CLK(CLK_ALU_M),
   .RST(RST_REF_M),  
   .ALU_OUT(ALU_OUT),
   .OUT_VALID(OUT_Valid) 
);


///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///
 CLK_GATE U0_CLK_GATE (
 .CLK_EN(CLK_EN|test_mode),
 .CLK(CLK_REF_M),
 .GATED_CLK(ALU_CLK)
);



endmodule
 

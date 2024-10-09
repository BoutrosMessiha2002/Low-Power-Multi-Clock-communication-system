module UART_TX_top(
  input [7:0] P_DATA,
  input PAR_EN,
  input Data_Valid,
  input PAR_TYP,
  input CLK,
  input RST,
  output TX_OUT,
  output busy);
  
  wire ser_done;
  wire ser_en;
  wire [1:0] mux_sel;
  wire ser_data;
  wire par_bit;
  
FSM U_FSM(
.Data_Valid(Data_Valid),
.ser_en(ser_en),
.ser_done(ser_done),
.PAR_EN(PAR_EN),
.mux_sel(mux_sel),
.busy(busy),
.CLK(CLK),
.RST(RST));

MUX U_MUX(
.mux_sel(mux_sel),
.ser_data(ser_data),
.par_bit(par_bit),
.TX_OUT(TX_OUT),
.CLK(CLK),
.RST(RST));

Parity_calc U_PARITY_CALC(
.P_DATA(P_DATA),
.Data_Valid(Data_Valid),
.PAR_TYP(PAR_TYP),
.par_bit(par_bit));

Serializer U_SERIALIZER(
.P_DATA(P_DATA),
.ser_done(ser_done),
.ser_en(ser_en),
.ser_data(ser_data),
.CLK(CLK),
.RST(RST),
.Data_Valid(Data_Valid));
endmodule
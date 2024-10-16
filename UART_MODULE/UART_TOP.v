module UART_top(
  input TX_CLK,
  input [7:0] TX_IN_P,
  input TX_IN_V,
  input RST,
  input RX_IN_S,
  input [5:0] prescale,
  input RX_CLK,
  output TX_OUT_S,
  output TX_OUT_V,
  output [7:0] RX_OUT_P,
  output RX_OUT_V
  );
  wire PAR_EN;
  wire PAR_TYP;
  
  UART_TX_top U_UART_TX(
  .CLK(TX_CLK),
  .P_DATA(TX_IN_P),
  .Data_Valid(TX_IN_V),
  .RST(RST),
  .PAR_EN(PAR_EN),
  .TX_OUT(TX_OUT_S),
  .busy(TX_OUT_V),
  .PAR_TYP(PAR_TYP)
  );
  
  UART_RX_top U_UART_RX(
  .CLK(RX_CLK),
  .RST(RST),
  .PAR_EN(PAR_EN),
  .PAR_TYP(PAR_TYP),
  .prescale(prescale),
  .RX_IN(RX_IN_S),
  .P_DATA(RX_OUT_P),
  .data_valid(RX_OUT_V)
  );
  
endmodule

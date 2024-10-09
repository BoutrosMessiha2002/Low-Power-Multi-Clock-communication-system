module UART_RX_top(
  input RX_IN,
  input PAR_EN,
  input PAR_TYP,
  input [5:0] prescale,
  input CLK,
  input RST,
  output wire data_valid,
  output wire [7:0] P_DATA
  );
  wire [3:0] bit_cnt;
  wire par_err;
  wire strt_glitch;
  wire stp_err;
  wire [5:0] edge_cnt;
  wire enable;
  wire dat_samp_en;
  wire par_chk_en;
  wire strt_chk_en;
  wire stp_chk_en;
  wire sampled_bit;
  wire deser_en;
  wire from_parity;
  wire parity_enable_delayed;
  wire PAR_EN_delayed;
  
  RX_FSM U_FSM(
  .PAR_EN(PAR_EN),
  .RX_IN(RX_IN),
  .dat_samp_en(dat_samp_en),
  .edge_cnt(edge_cnt),
  .bit_cnt(bit_cnt),
  .enable(enable),
  .par_chk_en(par_chk_en),
  .par_err(par_err),
  .strt_chk_en(strt_chk_en),
  .strt_glitch(strt_glitch),
  .stp_chk_en(stp_chk_en),
  .stp_err(stp_err),
  .data_valid(data_valid),
  .deser_en(deser_en),
  .CLK(CLK),
  .RST(RST),
  .prescale(prescale),
  .from_parity(from_parity)
  );
  
  edge_bit_counter U_edge_bit_counter(
  .bit_cnt(bit_cnt),
  .enable(enable),
  .edge_cnt(edge_cnt),
  .CLK(CLK),
  .RST(RST),
  .prescale(prescale),
  .PAR_EN(PAR_EN),
  .from_parity(from_parity)
  );
  
  data_sampling U_data_sampling(
  .RX_IN(RX_IN),
  .prescale(prescale),
  .dat_samp_en(dat_samp_en),
  .edge_cnt(edge_cnt),
  .sampled_bit(sampled_bit),
  .CLK(CLK),
  .RST(RST)
  );
  
  deserializer U_deserializer(
  .deser_en(deser_en),
  .sampled_bit(sampled_bit),
  .P_DATA(P_DATA),
  .CLK(CLK),
  .RST(RST),
  .bit_cnt(bit_cnt),
  .PAR_EN(PAR_EN)
  );
  
  parity_check U_parity_check(
  .par_chk_en(par_chk_en),
  .par_err(par_err),
  .sampled_bit(sampled_bit),
  .PAR_TYP(PAR_TYP),
  .CLK(CLK),
  .RST(RST),
  .P_DATA(P_DATA)
  );
  
  strt_check U_strt_check(
  .strt_chk_en(strt_chk_en),
  .strt_glitch(strt_glitch),
  .sampled_bit(sampled_bit),
  .CLK(CLK),
  .RST(RST)
  );
  
  stop_check U_stop_check(
  .stp_chk_en(stp_chk_en),
  .stp_err(stp_err),
  .sampled_bit(sampled_bit),
  .CLK(CLK),
  .RST(RST)
  );
  
endmodule
`timescale 1ns/1ps
module UART_tb();

reg TX_CLK_tb;
reg [7:0] TX_IN_P_tb;
reg TX_IN_V_tb;
reg RST_tb;
reg RX_IN_S_tb;
reg [5:0] prescale_tb;
reg RX_CLK_tb;
wire TX_OUT_S_tb;
wire TX_OUT_V_tb;
wire [7:0] RX_OUT_P_tb;
wire RX_OUT_V_tb;
reg PAR_EN_tb;
reg PAR_TYP_tb;

parameter CLK_FOR_TX=80;
parameter CLK_FOR_RX=10;

always #(CLK_FOR_TX/2) TX_CLK_tb=~TX_CLK_tb;
always #(CLK_FOR_RX/2) RX_CLK_tb=~RX_CLK_tb;



initial 
begin
  $dumpfile("UART.vcd");
  $dumpvars;
  initialize();
  reset();
  
  
end

initial 
begin
  #(CLK_FOR_TX);
  UART_TX(10'b1001011010);
end

initial 
begin
  #(CLK_FOR_TX);
  UART_RX(10'b1010111010);
end



UART_top DUT(
.TX_CLK(TX_CLK_tb),
.TX_IN_P(TX_IN_P_tb),
.TX_IN_V(TX_IN_V_tb),
.RST(RST_tb),
.RX_IN_S(RX_IN_S_tb),
.prescale(prescale_tb),
.RX_CLK(RX_CLK_tb),
.TX_OUT_S(TX_OUT_S_tb),
.TX_OUT_V(TX_OUT_V_tb),
.RX_OUT_P(RX_OUT_P_tb),
.RX_OUT_V(RX_OUT_V_tb)
);

UART_TX_top DUT_TX(
.PAR_EN(PAR_EN_tb),
.PAR_TYP(PAR_TYP_tb)
);

UART_RX_top DUT_RX(
.PAR_EN(PAR_EN_tb),
.PAR_TYP(PAR_TYP_tb)
);

task initialize;
  begin
  TX_CLK_tb=1'b0;
  TX_IN_P_tb=8'b0;
  TX_IN_V_tb=1'b0;
  RST_tb=1'b1;
  RX_IN_S_tb=1'b1;
  prescale_tb=6'd8;
  RX_CLK_tb=1'd0;
  PAR_EN_tb=1'b0;
  PAR_TYP_tb=1'b0;
  end
endtask
  
  task reset;
    begin
      RST_tb=1'b1;
      #(CLK_FOR_TX);
      RST_tb=1'b0;
      #(CLK_FOR_RX);
      RST_tb=1'b1;
    end
  endtask

  task UART_TX;
     input [7:0] test_input;
  integer k;
  reg [9:0] test_outputs;
begin
TX_IN_P_tb=test_input;
TX_IN_V_tb=1'b1;
#(CLK_FOR_TX);
TX_IN_V_tb=1'b0;

for(k=0;k<10;k=k+1)
begin
  test_outputs[k]=TX_OUT_S_tb;
  #(CLK_FOR_TX);
end
if(test_outputs=={1'b1,test_input,1'b0})
  $display("TEST CASE  SUCCESS, sent= %0h, out= %0h",{1'b1,test_input,1'b0},test_outputs);
  else
  $display("TEST CASE  FAIL, sent= %0h, out= %0h",{1'b1,test_input,1'b0},test_outputs);
end
  endtask
  
  task UART_RX;
    input [9:0] test_outs;
    integer i;
    begin
      for(i=0;i<10;i=i+1)
      begin
        RX_IN_S_tb=test_outs[i];
        #(CLK_FOR_TX);
      end
      if(RX_OUT_P_tb==test_outs[8:1]&&RX_OUT_V_tb==1'b1)
        $display("TEST CASE SUCCESS WITHOUT PARITY, PRESCALER IS %0d",prescale_tb);
      else
        $display("TEST CASE FAIL, PRESCALER IS %0d",prescale_tb);
      end
      endtask
       
  task UART_RX_error;
    input [9:0] test_outs;
    integer i;
    begin
      for(i=0;i<10;i=i+1)
      begin
        RX_IN_S_tb=test_outs[i];
        #(CLK_FOR_TX);
      end
      if(RX_OUT_V_tb==1'b1)
        $display("TEST CASE SUCCESS ERROR DETECTED, PRESCALER IS %0d",prescale_tb);
      else
        $display("TEST CASE FAIL, PRESCALER IS %0d",prescale_tb);
      end
      endtask
      
      
endmodule
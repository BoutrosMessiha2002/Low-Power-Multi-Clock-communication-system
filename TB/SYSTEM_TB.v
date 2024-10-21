`timescale 1ns/1ps
module SYSTEM_TB();

reg RST_N_tb;
reg UART_CLK_tb;
reg REF_CLK_tb;
reg UART_RX_IN_tb;
wire UART_TX_O_tb;
wire framing_error_tb;
wire parity_error_tb;

parameter CLK_REF=20;
parameter CLK_UART=271.267;
parameter CLK_UART_TX=CLK_UART*32;
parameter CLK_UART_RX=271.267;
parameter BUS_WIDTH=8;

reg UART_CLK_TX_tb;
reg UART_CLK_RX_tb;
always #(CLK_REF/2.0)  REF_CLK_tb=~REF_CLK_tb;
always #(CLK_UART/2.0)  UART_CLK_tb=~UART_CLK_tb;
always #(CLK_UART_TX/2.0)  UART_CLK_TX_tb=~UART_CLK_TX_tb;
always #(CLK_UART_RX/2.0)  UART_CLK_RX_tb=~UART_CLK_RX_tb;

initial 
begin
  $dumpfile("SYSTEM.vcd");
  $dumpvars;
  initialize();
  reset();
  write_in_reg(11'b10101010100,11'b10000001010,11'b11100011110);
 
  write_in_reg(11'b10101010100,11'b11000001110,11'b10000011110);
   
  read_from_reg(11'b10101110110,11'b10000001010);
   
  ALU(11'b10110011000,11'b11000000010,11'b11000000100,11'b10000000000);
  
  write_in_reg(11'b10101010100,11'b10000000000,11'b10000011000);
   
  write_in_reg(11'b10101010100,11'b11000000010,11'b10000000110);
   
  ALU_NOOP(11'b10110111010,11'b10000000000);
   
  ALU_NOOP(11'b10110111010,11'b10000001100);

 write_in_reg(11'b10101010100,11'b11000010110,11'b10000000110);

  write_in_reg(11'b10101010100,11'b10000000000,11'b10001001000);
   
  write_in_reg(11'b10101010100,11'b11000000010,11'b11000000100);
   ALU_NOOP(11'b10110111010,11'b10000000000);
   ALU(11'b10110011000,11'b11000000010,11'b11000000100,11'b10000000000);
  
end
SYS_TOP
#(.BUS_WIDTH(BUS_WIDTH))
 DUT(
.RST_N(RST_N_tb),
 .UART_CLK(UART_CLK_tb),
 .REF_CLK(REF_CLK_tb),
 .UART_RX_IN(UART_RX_IN_tb),
 .UART_TX_O(UART_TX_O_tb),
 .framing_error(framing_error_tb),
 .parity_error(parity_error_tb)
);
task reset;
  begin
  RST_N_tb=1'b0;
  #(UART_CLK_RX_tb);
  RST_N_tb=1'b1;
  #(UART_CLK_RX_tb);
end
endtask

task initialize;
  begin
 RST_N_tb=1'b1;
 UART_CLK_tb=1'b0;
 REF_CLK_tb=1'b0;
 UART_RX_IN_tb=1'b1;
 UART_CLK_TX_tb=1'b0;
 UART_CLK_RX_tb=1'b0;
 end
  endtask
  
  task write_in_reg;
    input [10:0] command;
    input [10:0] Address;
    input [10:0] Data;
    begin
      input_task(command);
      input_task(Address);
      input_task(Data);
    end
  endtask
  
  task read_from_reg;
    input [10:0] command;
    input [10:0] Address;
    begin
      input_task(command);
      input_task(Address);
    end
  endtask
  
  task ALU;
    input [10:0] command;
    input [10:0] OP_A;
    input [10:0] OP_B;
    input [10:0] ALU_FUN;
    begin
       input_task(command);
       input_task(OP_A);
       input_task(OP_B);
       input_task(ALU_FUN);
    end
  endtask
  task ALU_NOOP;
    input [10:0] command;
    input [10:0] ALU_FUN;
    begin
       input_task(command);
       input_task(ALU_FUN);
    end
  endtask
task input_task;
  input [10:0] frame;
  integer i;
begin
  for(i=0;i<11;i=i+1)
  begin
    UART_RX_IN_tb=frame[i];
     #(CLK_UART_TX);
  end
end
endtask 
endmodule
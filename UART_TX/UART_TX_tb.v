/*
This testbench has 12 test cases, they are divided to two sections:
1)TEST CASE: it comes from test_UART_no_parity task, they are 
5 test cases which test the frame without Parity

2)TEST CASE P: it comes from test_UART_parity task, they are 7 test
cases, 5 even parity and 2 odd parity, they test the frame with
parity.
*/
`timescale 1ns/1ps  //clock= 5ns
module UART_TX_tb();
  reg CLK_tb;
  reg RST_tb;
  reg [7:0] P_DATA_tb;
  reg Data_Valid_tb;
  reg PAR_EN_tb;
  reg PAR_TYP_tb;
  wire TX_OUT_tb;
  wire busy_tb;
  parameter CLOCK_PERIOD= 5.0;
  reg [7:0] test_inputs_p [6:0];
  reg [7:0] test_inputs [4:0];
  
  integer i;
  integer j;
  
  always #((CLOCK_PERIOD)/2) CLK_tb=~CLK_tb;
initial
begin
  $dumpfile("UART_TX.vcd");
  $dumpvars;
  
  //no parity inputs
  create_inputs(8'b10110100,3'b000);
  create_inputs(8'b01011110,3'b001);
  create_inputs(8'b11100010,3'b010);
  create_inputs(8'b10100101,3'b011);
  create_inputs(8'b11101100,3'b100);
  
  //even_parity 
  create_inputs_p(8'b10101010,3'b000);
  create_inputs_p(8'b00100110,3'b001);
  create_inputs_p(8'b11100000,3'b010);
  create_inputs_p(8'b00111000,3'b011);
  create_inputs_p(8'b11001100,3'b100);
  
  //odd_parity 
  create_inputs_p(8'b11001100,3'b101); 
  create_inputs_p(8'b11001110,3'b110);
   
  initialize();
  reset();
  
  //testing no parity frames
  
  for(j=0;j<5;j=j+1)
  begin
  PAR_EN_tb=1'b0;
  PAR_TYP_tb=1'b0;
  test_UART_no_parity(test_inputs[j],j);
  end
  
  //testing frames with even parity
   for(i=0;i<5;i=i+1)
  begin
  PAR_EN_tb=1'b1;
  PAR_TYP_tb=1'b0;
  test_UART_parity(test_inputs_p[i],i);
  end
  
  //testing frames with odd parity
  
   for(i=5;i<7;i=i+1)
  begin
  PAR_EN_tb=1'b1;
  PAR_TYP_tb=1'b1;
  test_UART_parity(test_inputs_p[i],i);
  end

end

//creats inputs used to test non parity frames

task create_inputs;
  input [7:0] number;
  input [2:0] i;
  begin
    test_inputs[i]=number;
  end
endtask

//creates inputs used to test frames with parity
task create_inputs_p;
  input [7:0] number;
  input [2:0] i;
  begin
    test_inputs_p[i]=number;
  end
endtask

task initialize;
  begin
  CLK_tb=1'b0;
  RST_tb=1'b1;
  Data_Valid_tb=1'b0;
  PAR_EN_tb=1'b0;
  P_DATA_tb=8'b0;
  PAR_TYP_tb=1'b0;
end
endtask

task reset;
  begin
  RST_tb =  'b1;
  #(CLOCK_PERIOD)
  RST_tb  = 'b0;
  #(CLOCK_PERIOD)
  RST_tb  = 'b1;
end
endtask

task test_UART_no_parity;
  input [7:0] test_input;
  input [2:0] i;
  integer k;
  reg [9:0] test_outputs;
begin
P_DATA_tb=test_input;
Data_Valid_tb=1'b1;
#(CLOCK_PERIOD);
Data_Valid_tb=1'b0;

for(k=0;k<10;k=k+1)
begin
  test_outputs[k]=TX_OUT_tb;
  #(CLOCK_PERIOD);
end
if(test_outputs=={1'b1,test_input,1'b0})
  $display("TEST CASE %0d SUCCESS, sent= %0h, out= %0h",i,{1'b1,test_input,1'b0},test_outputs);
  else
  $display("TEST CASE %0d FAIL, sent= %0h, out= %0h",i,{1'b1,test_input,1'b0},test_outputs);
end
endtask
  
task test_UART_parity;
  input [7:0] test_input;
  input [2:0] i;
  integer k;
  reg [10:0] test_outputs_p;
  begin
  P_DATA_tb=test_input;
  Data_Valid_tb=1'b1;
  #(CLOCK_PERIOD);
  Data_Valid_tb=1'b0;

for(k=0;k<11;k=k+1)
begin
  test_outputs_p[k]=TX_OUT_tb;
   #(CLOCK_PERIOD);
end
if(i ==3'b000 || i==3'b100)
  begin
    if(test_outputs_p=={1'b1,1'b0,test_input,1'b0})
       $display("TEST CASE_P %0d SUCCESS, sent=%0h, out=%0h",i,{1'b1,1'b0,test_input,1'b0},test_outputs_p);
    else
       $display("TEST CASE_P %0d FAIL, sent=%0h, out=%0h",i,{1'b1,1'b0,test_input,1'b0},test_outputs_p);
  end
  else if(i ==3'b101)
    begin
      if(test_outputs_p=={1'b1,1'b1,test_input,1'b0})
       $display("TEST CASE_P %0d SUCCESS, sent=%0h, out=%0h",i,{1'b1,1'b1,test_input,1'b0},test_outputs_p);
    else
       $display("TEST CASE_P %0d FAIL, sent=%0h, out=%0h",i,{1'b1,1'b1,test_input,1'b0},test_outputs_p);
    end
     else if(i ==3'b110)
    begin
      if(test_outputs_p=={1'b1,1'b0,test_input,1'b0})
       $display("TEST CASE_P %0d SUCCESS, sent=%0h, out=%0h",i,{1'b1,1'b0,test_input,1'b0},test_outputs_p);
    else
       $display("TEST CASE_P %0d FAIL, sent=%0h, out=%0h",i,{1'b1,1'b0,test_input,1'b0},test_outputs_p);
    end
else
  begin
if(test_outputs_p=={1'b1,1'b1,test_input,1'b0})
   $display("TEST CASE_P %0d SUCCESS, sent=%0h, out=%0h",i,{1'b1,1'b1,test_input,1'b0},test_outputs_p);
  else
   $display("TEST CASE_P %0d SUCCESS, sent=%0h, out=%0h",i,{1'b1,1'b1,test_input,1'b0},test_outputs_p);
  end
  end
endtask
  
UART_TX_top DUT(
.CLK(CLK_tb),
.RST(RST_tb),
.P_DATA(P_DATA_tb),
.Data_Valid(Data_Valid_tb),
.PAR_EN(PAR_EN_tb),
.PAR_TYP(PAR_TYP_tb),
.TX_OUT(TX_OUT_tb),
.busy(busy_tb));
endmodule
`timescale 1ns/1ps



/*
Task description:

1)test_output: it tests RX without parity
2)test_output_with_parity: it tests RX with parity whether even or odd.
3)test_output_with_parity_error: it tests if there's a parity error whether even or odd,
test is succeeded if the error is detected(I put a wrong bit intentionally).
4)test_output_with_stop_error: same as parity but it is intended for stop bit.
5)test_output_with_start_glitch: same as parity and stop but it is intended for start bit

THIS TESTBENCH HAS A PRESCALER OF 8 AND CLOCK PERIOD EQUALS 1085 ns
*/
module UART_RX_tb();
  reg RX_IN_tb;
  reg [5:0] prescale_tb;
  reg PAR_EN_tb;
  reg PAR_TYP_tb;
  reg CLK_tb;
  reg RST_tb;
  wire data_valid_tb;
  wire [7:0] P_DATA_tb;
  
  parameter CLOCK_PERIOD=1085.0;
  parameter EVEN=1'b0;
  parameter ODD=1'b1;
  always #(CLOCK_PERIOD/2) CLK_tb=~CLK_tb;
  
  initial
  begin
    $dumpfile("RX.vcd");
    $dumpvars;
    initialize();
    reset();
    test_output(10'b1010110100);

    test_output_with_parity(11'b10010110100,EVEN);
    disable_parity();
    
    test_output(10'b1011100100);
   
    test_output_with_parity(11'b11010101010,ODD);
    disable_parity();
    test_output(10'b1000110100);
     
    test_output(10'b1010110100);
  
    test_output_with_parity_error(11'b11010101010,EVEN);
    disable_parity();
   
    test_output_with_stop_error(10'b0010110100);
    test_output(10'b1101010100);
      
    test_output_with_start_glitch(10'b1010101010);
    test_output(10'b1010111100);
 
    test_output_with_start_glitch(10'b1100101010);
    
    #(100);
    $finish;
 
    
    
  end
  
  
  
  
  task initialize;
    begin
  RX_IN_tb=1'b1;
  prescale_tb=6'd8;
  PAR_EN_tb=1'b0;
  PAR_TYP_tb=1'b0;
  CLK_tb=1'b0;
  RST_tb=1'b1;
end
endtask 
  
  task reset;
  begin
    RST_tb=1'b1;
    #(CLOCK_PERIOD);
    RST_tb=1'b0;
    #(CLOCK_PERIOD);
    RST_tb=1'b1;
  end
  endtask
  
  task test_RX;
    input RX_bit;
    begin
      RX_IN_tb=RX_bit;
    end
endtask  

  task test_output;
    input [9:0] test_outs;
    integer i;
    begin
      for(i=0;i<10;i=i+1)
      begin
        RX_IN_tb=test_outs[i];
        delay_by_8();
      end
      if(P_DATA_tb==test_outs[8:1]&&data_valid_tb==1'b1)
        $display("TEST CASE SUCCESS WITHOUT PARITY, PRESCALER IS %0d",prescale_tb);
      else
        $display("TEST CASE FAIL, PRESCALER IS %0d",prescale_tb);
      end
    endtask
    
    task test_output_with_parity_error;
      input [10:0] test_outs;
      input parity_type;
      integer i;
      begin
        if(parity_type==EVEN)
              enable_even_parity();
            else if(parity_type==ODD)
                  enable_odd_parity();
         for(i=0;i<11;i=i+1)
        begin
          RX_IN_tb=test_outs[i];
          delay_by_8();
        end
        if(data_valid_tb==1'b0&&parity_type==EVEN)
          $display("TEST CASE SUCCESS, EVEN PARITY ERROR DETECTED, PRESCALER IS %0d",prescale_tb);
        else if(data_valid_tb==1'b0&&parity_type==ODD)
          $display("TEST CASE SUCCESS, ODD PARITY ERROR DETECTED, PRESCALER IS %0d",prescale_tb);
        else
          $display("TEST CASE FAIL, NO ERRORS DETECRED, PRESCALER IS %0d",prescale_tb);
        end
      endtask
      
    task test_output_with_parity;
      input [10:0] test_outs;
      input parity_type;
      integer i;
      begin
        if(parity_type==EVEN)
              enable_even_parity();
            else if(parity_type==ODD)
                  enable_odd_parity();
                  for(i=0;i<11;i=i+1)
        begin
          RX_IN_tb=test_outs[i];
          delay_by_8();
  
        end
        if(data_valid_tb==1'b1&&P_DATA_tb==test_outs[8:1]&&parity_type==EVEN)
          $display("TEST CASE SUCCESS, DATA IS CORRECT WITH EVEN PARITY, PRESCALER IS %0d ",prescale_tb);
        else if(data_valid_tb==1'b1&&P_DATA_tb==test_outs[8:1]&&parity_type==ODD)
          $display("TEST CASE SUCCESS, DATA IS CORRECT WITH ODD PARITY, PRESCALER IS %0d ",prescale_tb);
        else
          $display("TEST CASE FAIL, DATA IS INCORRECT, PRESCALER IS %0d",prescale_tb);
        end
      endtask
      
      task delay_by_8;
        #(CLOCK_PERIOD*8);
      endtask
      
      task delay_by_16;
        #(CLOCK_PERIOD*16);
    endtask
    
    task delay_by_32;
      #(CLOCK_PERIOD*32);
    endtask
      
      task enable_even_parity;
        begin
          PAR_EN_tb=1'b1;
          PAR_TYP_tb=1'b0;
        end
      endtask
      
      task enable_odd_parity;
        begin
          PAR_EN_tb=1'b1;
          PAR_TYP_tb=1'b1;
        end
      endtask
      
      task disable_parity;
        PAR_EN_tb=1'b0;
      endtask
      
      task test_output_with_stop_error;
        input [9:0] test_outs;
        integer i;
        begin
          for(i=0;i<10;i=i+1)
        begin
          RX_IN_tb=test_outs[i];
          delay_by_8();
        end
          if(data_valid_tb==1'b0)
            $display("TEST CASE SUCCESS, STOP ERROR DETECTED");
          else
            $display("TEST CASE FAIL, NO STOP ERROR DETECTED");
          end
        endtask
        
      task test_output_with_start_glitch;
        input [9:0] test_outs;
        integer i;
        begin
         RX_IN_tb=test_outs[0];
         #(CLOCK_PERIOD*3);
         RX_IN_tb=1'b1;
         #(CLOCK_PERIOD);
         RX_IN_tb=1'b1;
         #(CLOCK_PERIOD);
         RX_IN_tb=1'b1;
         #(CLOCK_PERIOD);
         RX_IN_tb=1'b0;
         #(CLOCK_PERIOD);
          for(i=1;i<10;i=i+1)
        begin
          RX_IN_tb=test_outs[i];
          delay_by_8();
        end
          if(data_valid_tb==1'b0)
            $display("TEST CASE SUCCESS, START ERROR DETECTED");
          else
            $display("TEST CASE FAIL, NO START ERROR DETECTED");
          end
        endtask
        
        
      
    
UART_RX_top DUT(
.PAR_EN(PAR_EN_tb),
.RX_IN(RX_IN_tb),
.PAR_TYP(PAR_TYP_tb),
.prescale(prescale_tb),
.P_DATA(P_DATA_tb),
.data_valid(data_valid_tb),
.CLK(CLK_tb),
.RST(RST_tb)
);
endmodule


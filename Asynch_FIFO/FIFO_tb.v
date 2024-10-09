`timescale 1ns/1ps


module FIFO_tb();
  parameter DATA_WIDTH=8;
  reg [DATA_WIDTH-1:0] wdata_tb;
  reg winc_tb;
  reg wclk_tb;
  reg wrst_n_tb;
  reg rclk_tb;
  reg rrst_n_tb;
  reg rinc_tb;
  wire wfull_tb;
  wire [DATA_WIDTH-1:0] rdata_tb;
  wire rempty_tb;
  
  FIFO_top DUT(
  .wdata(wdata_tb),
  .winc(winc_tb),
  .wclk(wclk_tb),
  .wrst_n(wrst_n_tb),
  .rclk(rclk_tb),
  .rrst_n(rrst_n_tb),
  .rinc(rinc_tb),
  .wfull(wfull_tb),
  .rdata(rdata_tb),
  .rempty(rempty)
  );
  parameter CLK_WR=10;
  parameter CLK_RD=25.0;
  
  always #(CLK_WR/2) wclk_tb=!wclk_tb;
  always #(CLK_RD/2) rclk_tb=!rclk_tb;
  initial 
  begin
    $dumpfile("FIFO.vcd");
    $dumpvars;
    initialize_WR();
    reset_WR();
    write_data(8'b11011011);
    write_data(8'b11001110);
    write_data(8'b10010001);
    write_data(8'b10101010);
    write_data(8'b11101110);
    write_data(8'b01010101);
    write_data(8'b11011000);
    write_data(8'b10111000);
    write_data(8'b00010101);
    write_data(8'b01110110);
  end
  
   initial 
  begin
    initialize_RD();
    reset_RD();
    read_data(8'b11011011);
    read_data(8'b11001110);
    read_data(8'b10010001);
    read_data(8'b10101010);
    read_data(8'b11101110);
    read_data(8'b01010101);
    read_data(8'b11011000);
    read_data(8'b10111000);
    read_data(8'b00010101);
    read_data(8'b01110110);
  
      
  end
  
  task initialize_WR;
    begin
      winc_tb=1'b0;
      wclk_tb=1'b0;
      wrst_n_tb=1'b1;
    end
  endtask
  
  task initialize_RD;
    begin
      rclk_tb=1'b0;
      rinc_tb=1'b0;
      rrst_n_tb=1'b1;
      wdata_tb=8'b0;
    end
  endtask
  
  
  task reset_WR;
    begin
      wrst_n_tb=1'b0;
      #(CLK_WR/2);
      wrst_n_tb=1'b1;
      #(CLK_WR/2);
    end
  endtask
  
  task reset_RD;
    begin      
      rrst_n_tb=1'b0;
      #(CLK_RD/2);
      rrst_n_tb=1'b1;
      #(CLK_RD/2);
    end
  endtask
  
  task write_data;
    input [DATA_WIDTH-1:0] data;
    begin
      
    wdata_tb=data;
    #(CLK_WR);
    winc_tb=1'b1;
    #(CLK_WR);
    winc_tb=1'b0;
   
  end
  endtask
  
  task read_data;
    input [DATA_WIDTH-1:0] data;
    
    begin   
      @(negedge rclk_tb);
          if(rdata_tb==data)
            $display("TEST_CASE_SUCCESS");
          else
            $display("TEST_CASE_FAIL");
        #(CLK_RD);
        rinc_tb=1'b1;
      #(CLK_RD);
      rinc_tb=1'b0;
        
    end
  endtask
  
  
endmodule

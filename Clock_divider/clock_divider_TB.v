module clock_divider_tb();
  reg i_ref_clk_tb;
  reg i_rst_n_tb;
  reg i_clk_en_tb;
  reg [7:0] i_div_ratio_tb;
  wire o_div_clk_tb;
  reg [7:0] test;
  integer i;
  parameter CLOCK_PERIOD=10;
  parameter TEST_CASES=10;
  always #(CLOCK_PERIOD/2) i_ref_clk_tb=!i_ref_clk_tb;
  
  
  initial
  begin
    $dumpfile("clock_divider.vcd");
    $dumpvars;
    initialize();
    reset();
    for( i=0;i<10;i=i+1)
    begin
    test_clock(test);
    test=test+1;
  end
  end
  
  
  task reset;
    begin
      i_rst_n_tb=1'b1;
      #(CLOCK_PERIOD);
      i_rst_n_tb=1'b0;
      #(CLOCK_PERIOD);
      i_rst_n_tb=1'b1;
    end
  endtask
  
  
  
  task initialize;
    begin
    i_ref_clk_tb=1'b0;
    i_rst_n_tb=1'b1;
    i_clk_en_tb=1'b0;
    i_div_ratio_tb=8'b0;
    test=8'b0;
  end
  endtask
  
  task test_clock;
    input [7:0] ratio;
    begin
      i_clk_en_tb=1'b1;
      i_div_ratio_tb=ratio;
      #(CLOCK_PERIOD*i_div_ratio_tb*10);
    end
    endtask  
    
    clock_divider DUT(
    .i_ref_clk(i_ref_clk_tb),
    .i_rst_n(i_rst_n_tb),
    .i_clk_en(i_clk_en_tb),
    .i_div_ratio(i_div_ratio_tb),
    .o_div_clk(o_div_clk_tb));
endmodule
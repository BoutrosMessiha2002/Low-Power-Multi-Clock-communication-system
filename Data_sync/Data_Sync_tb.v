module Data_Sync_tb();
 parameter BUS_WIDTH=8;
 parameter CLK_PER=10;
 
  reg CLK_tb;
  reg RST_tb;
  reg [BUS_WIDTH-1:0] unsync_bus_tb;
  reg bus_enable_tb;
  wire [BUS_WIDTH-1:0] sync_bus_tb;
  wire enable_pulse_tb;
  
  always #(CLK_PER/2) CLK_tb=~CLK_tb;
  
  Data_Sync DUT(
  .CLK(CLK_tb),
  .RST(RST_tb),
  .unsync_bus(unsync_bus_tb),
  .bus_enable(bus_enable_tb),
  .sync_bus(sync_bus_tb),
  .enable_pulse(enable_pulse_tb)
  );
  initial 
  begin
    $dumpfile("DATA_SYNC.vcd");
    $dumpvars;
    initialize();
    reset();
    test_data(8'b10100010);
    test_data(8'b01010101);
    test_data(8'b10111100);
    #100;
    $finish;
  end
  task initialize;
    begin
      CLK_tb=1'b0;
      RST_tb=1'b1;
      unsync_bus_tb='b0;
      bus_enable_tb=1'b0;
    end
  endtask
  
  task reset;
    begin
      RST_tb=1'b1;
      #(CLK_PER);
      RST_tb=1'b0;
      #(CLK_PER);
      RST_tb=1'b1;
    end
  endtask
  task test_data;
    input [BUS_WIDTH-1:0] data;
    begin
      unsync_bus_tb=data;
      bus_enable_tb=1'b1;
      #(CLK_PER);
      bus_enable_tb=1'b0;
      #(CLK_PER*8);
      if(data==sync_bus_tb&&enable_pulse_tb)
        $display("TEST_SUCCESS");
      else
        $display("TEST_FAIL");
    end
  endtask
endmodule
  
  

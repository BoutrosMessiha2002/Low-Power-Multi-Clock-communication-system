
module Reset_sync_tb();  
  reg RST_tb;
  reg CLK_tb;
  wire sync_reset_tb;
  parameter CLK_PER=10;
  parameter NUM_STAGES=3; 
  always #(CLK_PER/2) CLK_tb=!CLK_tb;
  
  
  initial 
  begin
    $dumpfile("Reset_sync.vcd");
    $dumpvars;
     CLK_tb=1'b0;
     RST_tb=1'b0;
     #(CLK_PER);
     RST_tb=1'b1;
     #(CLK_PER*4);
     if(sync_reset_tb==1'b1)
       $display("TEST_SUCCESS");
     else
       $display("TEST_FAIL");
       #100;
       $finish;
  end
Reset_sync DUT(
.RST(RST_tb),
.CLK(CLK_tb),
.sync_reset(sync_reset_tb)
);
endmodule
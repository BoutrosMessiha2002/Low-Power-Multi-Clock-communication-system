module Reset_sync(
  input RST,
  input CLK,
  output wire sync_reset
  );
  
  parameter NUM_STAGE=2;
  reg [NUM_STAGE-1:0] flops;
  
  always@(posedge CLK or negedge RST)
  begin
  if(!RST)
    flops<='b0;
  else
  begin
   flops<={flops[NUM_STAGE-2:0],1'b1};
  end
end
  assign sync_reset=flops[NUM_STAGE-1];
endmodule


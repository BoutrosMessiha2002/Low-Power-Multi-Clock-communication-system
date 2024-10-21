module Data_Sync #(
  parameter BUS_WIDTH=8,
  parameter NUM_OF_STAGES=2
  )(
  input CLK,
  input RST,
  input [BUS_WIDTH-1:0] unsync_bus,
  input bus_enable,
  output reg enable_pulse,
  output reg [BUS_WIDTH-1:0] sync_bus
  );
  reg [NUM_OF_STAGES-1:0] flops ;
  reg enable_flop;
  wire enable_pulse_c;
  integer i;
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
     flops<='b0;
    end
  else
    begin
      flops<={flops[NUM_OF_STAGES-2:0],bus_enable};
    end
  end
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      enable_flop<=1'b0;
    else
      enable_flop<=flops[NUM_OF_STAGES-1];
  end
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      sync_bus<='b0;
    else if(enable_pulse_c)
      sync_bus<=unsync_bus;
  end
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      enable_pulse<=1'b0;
    else
      enable_pulse<=enable_pulse_c;
  end
    assign enable_pulse_c=flops[NUM_OF_STAGES-1]&!(enable_flop);
  
endmodule



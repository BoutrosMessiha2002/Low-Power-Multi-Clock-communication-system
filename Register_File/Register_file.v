module Register_file(
  input [15:0] WrData,
  input [2:0] Address,
  input WrEn,
  input RdEn,
  input CLK,
  input RST,
  output reg [15:0] RdData
  );
  
  reg [15:0] memory [7:0];
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
     begin
       memory[0]<=16'b0;
       memory[1]<=16'b0;
       memory[2]<=16'b0;
       memory[3]<=16'b0;
       memory[4]<=16'b0;
       memory[5]<=16'b0;
       memory[6]<=16'b0;
       memory[7]<=16'b0;
  end
end
  always @(posedge CLK)
  begin
    if(WrEn&&!RdEn)
      begin
        memory[Address]<=WrData;
      end
    else if(RdEn&&!WrEn)
      begin
        RdData<=memory[Address];
      end
    end
  endmodule

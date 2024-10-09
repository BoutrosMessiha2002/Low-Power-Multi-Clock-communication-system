module deserializer(
  input deser_en,
  input sampled_bit,
  input CLK,
  input RST,
  output reg [7:0] P_DATA,
  input [3:0] bit_cnt,
  input PAR_EN
  );
  reg [4:0] counter;
  parameter ZEROS=8'b0;
  
  always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        P_DATA <= ZEROS;
  
      
    end else if (deser_en) begin
        P_DATA[bit_cnt-1] <= sampled_bit;
    end 
end
endmodule





module Parity_calc(
  input [7:0] P_DATA,
  input Data_Valid,
  input PAR_TYP,
  output reg par_bit);
  
  reg [7:0] par_data;
  
always @(*)
begin
  if(Data_Valid)
  par_data=P_DATA;
else if(PAR_TYP==1'b0)
par_bit=^par_data;
else if(PAR_TYP==1'b1)
par_bit= ~(^par_data);
end
endmodule  

module Parity_calc(
  input [7:0] P_DATA,
  input Data_Valid,
  input PAR_TYP,
  input PAR_EN,
  input CLK,
  input RST,
  output reg par_bit,
  input busy);
  
  reg [7:0] par_data;
  always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    par_data <= 8'b0 ;
   end
  else if(Data_Valid)
   begin
    par_data <= P_DATA ;
   end 
 end
 
 
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    par_bit <= 1'b0 ;
   end
  else
   begin
    if (PAR_EN)
	 begin
	  case(PAR_TYP)
	  1'b0 : begin                 
	          par_bit <= ^par_data  ;     // Even Parity
	         end
	  1'b1 : begin
	          par_bit <= ~^par_data ;     // Odd Parity
	         end		
	  endcase       	 
	 end
   end
 end 
endmodule  
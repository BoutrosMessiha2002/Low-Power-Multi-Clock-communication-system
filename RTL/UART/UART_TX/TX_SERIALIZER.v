module Serializer(
  input [7:0] P_DATA,
  input Data_Valid,
  input ser_en,
  input CLK,
  input RST,
  input busy,
  output  ser_done,
  output wire ser_data);
  
  reg [3:0] count;
  wire count_success;
  wire ser_success;
  reg [7:0] data;
  
  always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    data <= 8'b0 ;
   end
  else if(Data_Valid && !busy)
   begin
    data <= P_DATA ;
   end	
  else if(ser_en)
   begin
    data <= data >> 1 ;        
   end
 end
 
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    count <= 'b0;
   end
  else
   begin
    if (ser_en)
	 begin
      count <= count + 'b1 ;		 
	 end
	else 
	 begin
      count <= 'b0 ;		 
	 end	
   end
 end 
    
assign ser_done = (count == 4'b1000) ? 1'b1 : 1'b0 ;
assign ser_data = data[0] ;
endmodule    
          

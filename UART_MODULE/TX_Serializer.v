module Serializer(
  input [7:0] P_DATA,
  input Data_Valid,
  input ser_en,
  input CLK,
  input RST,
  output reg ser_done,
  output reg ser_data);
  
  reg [4:0] count;
  wire count_success;
  wire ser_success;
  reg [7:0] data;
  
always @(posedge CLK or negedge RST)
begin
  if(!RST)
    begin
    ser_done<=1'b0;
    data<=8'b0;
   count<=5'b1;
  end 
  else if(Data_Valid)
        begin
        data<=P_DATA;
        ser_done<=1'b0;
        ser_data<=P_DATA[0];
        count<=5'b1;
      end
    else if(ser_en&&!count_success)
      begin
        ser_data<=data[count];
        ser_done<=ser_success;
  count<=count+5'b1;
      end
    else if(ser_success)
      ser_done<=1'b1;
    else
begin
      ser_done<=1'b0;
   count<=5'b1;
end
    end
    
    assign count_success=(count==5'b01000);
    assign ser_success=(count==5'b01000);
endmodule    
          
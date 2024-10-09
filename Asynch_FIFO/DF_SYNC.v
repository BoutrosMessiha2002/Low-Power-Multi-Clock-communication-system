module DF_SYNC (
input    wire                      CLK,
input    wire                      RST,
input    wire    [3:0]   ASYNC,
output   reg     [3:0]   SYNC 
);


reg   [1:0] sync_reg [3:0] ;

integer  I ;
					 

always @(posedge CLK or negedge RST)
 begin
  if(!RST)      
   begin
     for (I=0; I<4; I=I+1)
      sync_reg[I] <= 'b0 ;
   end
  else
   begin
    for (I=0; I<4; I=I+1)
     sync_reg[I] <= {sync_reg[I][0],ASYNC[I]};   
        end  
 end


always @(*)
 begin
  for (I=0; I<4; I=I+1)
    SYNC[I] = sync_reg[I][1] ; 
 end  

endmodule

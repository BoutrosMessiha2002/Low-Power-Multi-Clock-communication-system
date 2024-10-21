module MUX(
  input [1:0] mux_sel,
  input ser_data,
  input par_bit,
  input CLK,
  input RST,
  output reg TX_OUT);
  
  parameter start_bit=1'b0;
  parameter stop_bit=1'b1;
    reg   mux_out;
  always @ (posedge CLK or negedge RST)
  begin
if(!RST)
   begin
    TX_OUT <= 1'b0 ;
   end
  else
   begin
    TX_OUT <= mux_out ;
   end 
        
  end 
  
  always @ (*)
  begin
   case(mux_sel)
	2'b00 : begin                 
	         mux_out = start_bit ;       
	        end
	2'b01 : begin
	         mux_out = stop_bit ;      
	        end	
	2'b10 : begin
	         mux_out = ser_data ;       
	        end	
	2'b11 : begin
	         mux_out = par_bit ;      
	        end		
	endcase        	   
  end
endmodule
  

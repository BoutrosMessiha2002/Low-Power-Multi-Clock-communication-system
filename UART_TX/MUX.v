module MUX(
  input [1:0] mux_sel,
  input ser_data,
  input par_bit,
  input CLK,
  input RST,
  output reg TX_OUT);
  
  parameter start_bit=1'b0;
  parameter stop_bit=1'b1;
    
  always @ (posedge CLK or negedge RST)
  begin
    case(mux_sel)
      2'b00: 
      begin
        TX_OUT<=start_bit;
      end
      2'b01:
      begin
        TX_OUT<=stop_bit;
      end
      2'b10:
      begin
        TX_OUT<=ser_data;
      end
      2'b11:
      begin
        TX_OUT<=par_bit;
      end
    endcase
  end 
endmodule
  

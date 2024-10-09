module data_sampling(
  input dat_samp_en,
  input [5:0] edge_cnt,
  input RX_IN,
  input CLK,
  input RST,
  input [5:0] prescale,
  output reg sampled_bit
  );
  parameter ZERO=1'b0;
  parameter ZEROS=3'b0;
  parameter ONE=1'b1;


  reg [2:0] test_bits;
  reg complete_sample_flag;
  
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
       sampled_bit<=ZERO;
       test_bits<=ZEROS;
       complete_sample_flag<=ZERO;
     end
     else if(dat_samp_en)
       begin
         if(prescale==6'd8)
           begin
         if(edge_cnt==6'd3)
           test_bits[0]<=RX_IN;
         else if(edge_cnt==6'd4)
           test_bits[1]<=RX_IN;
         else if(edge_cnt==6'd5)
           begin
           test_bits[2]<=RX_IN;
           complete_sample_flag<=ONE;
         end
       end
       
     else if(prescale==6'd16)
           begin
         if(edge_cnt==6'd7)
           test_bits[0]<=RX_IN;
         else if(edge_cnt==6'd8)
           test_bits[1]<=RX_IN;
         else if(edge_cnt==6'd9)
           begin
           test_bits[2]<=RX_IN;
           complete_sample_flag<=ONE;
         end
       end
       
     else if(prescale==6'd32)
           begin
         if(edge_cnt==6'd15)
           test_bits[0]<=RX_IN;
         else if(edge_cnt==6'd16)
           test_bits[1]<=RX_IN;
         else if(edge_cnt==6'd17)
           begin
           test_bits[2]<=RX_IN;
           complete_sample_flag<=ONE;
         end
       end
           
         if(complete_sample_flag)
           begin
             case (test_bits)
               3'b000:
               sampled_bit<=ZERO;
               3'b001:
               sampled_bit<=ZERO;
               3'b010:
               sampled_bit<=ZERO;
               3'b011:
               sampled_bit<=ONE;
               3'b100:
               sampled_bit<=ZERO;
               3'b101:
               sampled_bit<=ONE;
               3'b110:
               sampled_bit<=ONE;
               3'b111:
               sampled_bit<=ONE;
             endcase
           end
       end
  end
  
endmodule



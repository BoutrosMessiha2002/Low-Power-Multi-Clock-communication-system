module edge_bit_counter(
  input enable,
  input CLK,
  input RST,
  output reg [3:0] bit_cnt,
  output reg [5:0] edge_cnt,
  input [5:0] prescale,
  input PAR_EN,
  input from_parity
  );
  

     
  always @(posedge CLK or negedge RST)
  begin
    if(!RST)
      begin
        bit_cnt<=1'd0;
        edge_cnt<=6'd0;
      end
    else if(enable)
      begin
        edge_cnt<=edge_cnt+1;
        if(edge_cnt==prescale-1)
          begin
            if((bit_cnt==4'd10&&PAR_EN) ||((bit_cnt==4'd9)&&!PAR_EN))
              begin
                bit_cnt<=4'd0;
                edge_cnt<=6'd0;
                end
                else
                  begin
                    bit_cnt<=bit_cnt+1;
                    edge_cnt<=6'd0;
                    end
            end
        end
end
endmodule










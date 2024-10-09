module FIFO_RD(
  input rinc,
  input rclk,
  input rrst_n,
  input [3:0] rq2_wptr,
  output  rempty,
  output [2:0] raddr,
  output reg [3:0] rptr 
  );
  
  always @(posedge rclk or negedge rrst_n)
  begin
    if(!rrst_n)
      begin
        rptr<=4'b0;
      end
    else if(rinc)
      begin
        rptr<=rptr+1;
       
        
    end
  end
  assign raddr=rptr[2:0];
  assign  rempty=(rq2_wptr==rptr);
endmodule
